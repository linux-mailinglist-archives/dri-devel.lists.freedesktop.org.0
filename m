Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78646A64C1D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 12:17:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CAF810E3E4;
	Mon, 17 Mar 2025 11:17:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HYHxUqMP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD2610E3E4
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 11:17:39 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52H9fOrT014863
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 11:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=h74ZuGvGt7Gc4RGJOB1qbK9R
 Ms5B7HunMvfAcbl6nvI=; b=HYHxUqMPrJ3obXGUkn3BioKk6j6uxHLRu7NOjZ6Q
 na2xwlx1XjT+6HHgGhYHgxUu0HyEUuyTIw4tkbu7bVGW4moFV4UW93i1sFXRpgW0
 C+b+xTlN219AHLkDzh4tcROiG7Dng8YcRpKoU8os1A4BeGsWI85bY1d5QTWYvVR9
 mVK9+SHC0mXBWnWtE2KjB5SnL91X+q02dIyuEGOJQ63A/viXrJNynF0ffqW3ekMA
 4uV+/ttvfdmdKGMgKZBIhm7ClX968bawO6/xmsRiK+cZg95wEZIsntqvexcreKnc
 Cfr7Faml7mCCPwX/cYaHRobY+9D4Qdg8QLj01sKWlQcWYg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1r14hbr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 11:17:37 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6e8f6443ed5so94372526d6.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 04:17:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742210248; x=1742815048;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h74ZuGvGt7Gc4RGJOB1qbK9RMs5B7HunMvfAcbl6nvI=;
 b=hzFaYPhWMNLlCq3ddfuQ93ApOZim3bVgI+AonzUAk4hEVA03uIesBrhAJtR4PM2XSV
 NurGDINPZKIsqsalYMU628Y23ASRnBBcVDFZfTNn4gD38BpZa7B4C+nRa+CrPDXqDUZq
 W7P274ewtJlZmVeXx91J/BidgJ/tsifc7qA7W0p55un1gBJ37a/q30ly7HE+qV2me494
 4ILFEHeSQ+uMol6bxt9s/5CR36r/FUgMzrlhDMN9LvCRW50wFD9BpobDpdnlKw0EorZW
 dMLwqqfQAucvNNCZOj9cujVzZrpJZrtMN5u+sihlT6Rmq9Ze821RHR0uowTAmldtFAa9
 UoEA==
X-Gm-Message-State: AOJu0YzHuQbMRdKW+btwdTmdWjXshJwKYEjSZpumxPxDNZC5WRtnZwGX
 BhUnPRIzpMMFf3OnCjg9o3oxVISwUHj+8PZr0SE4BaNvw7DrnuhPmLsL9s8G1k8g8A1tUOpUSAz
 ZWTW6MyOyYSyEvA79PUvWUyDHkAOJZcUB8ru0uJxlJKjG0r73+/gHBtqbD7jl4yeh3Xo=
X-Gm-Gg: ASbGnctuJEaHZepks8W8wHz0fl60lSrNc5ewxW+C+q2J5QAuJENAiGP9y7Udy20kmuR
 FOnfzPuAilBboMJFF+YVrLfFSiduLnLZ6yNd+XltYhCQpjMe/ErA8hOJrFx54w2qF0zIekFoPiA
 /lluxtQ2z46/XN7Z00Hspggip/qwVJCawpT33WsdPwmCeemjoJZ7Q32jdDMELJ5TEsJSUimU4cf
 OiL4ngghq7i3p7C/iJGHw4Ois5MrZXCQu5KtK7wpsdPjHkVoknO2W+zKoinrbZ1TQjeNi/jS7/a
 qzZntbzbwpZLyfmr4KXm6W1Km3JOUYGkJcZ1HH/CwRNjKq1eBwGZnwZmfYw6yyyocqRKvChKoen
 KRfk=
X-Received: by 2002:a05:6214:5784:b0:6e4:4adb:8c29 with SMTP id
 6a1803df08f44-6eaddf4d222mr233455386d6.12.1742210248658; 
 Mon, 17 Mar 2025 04:17:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1cyDl4xkioe3y+ghWS263/60KKZ8OYW8NPmR6GC2f7A41gOXYwaVyUw5mFVJ9O7ml2j/IHQ==
X-Received: by 2002:a05:6214:5784:b0:6e4:4adb:8c29 with SMTP id
 6a1803df08f44-6eaddf4d222mr233454916d6.12.1742210248276; 
 Mon, 17 Mar 2025 04:17:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba864e24sm1302546e87.107.2025.03.17.04.17.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 04:17:26 -0700 (PDT)
Date: Mon, 17 Mar 2025 13:17:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Hermes Wu <Hermes.wu@ite.com.tw>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v6 2/4] drm/bridge: add function interface for
 DisplayPort audio implementation
Message-ID: <2wxcuacri3ts24hyuqpvw75cubkhcup2mftrsu7yykrrodulix@fmuzn3unykux>
References: <20250314-dp-hdmi-audio-v6-2-dbd228fa73d7@oss.qualcomm.com>
 <d5b8a7fa506ed3026c19b383edf160d6@kernel.org>
 <otidtln4pjb47azr7zhllxkqmwocdnbdiay6xcg6psphz3436i@fn5hxgaflgv6>
 <20250317-dancing-loyal-malkoha-ad5a36@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317-dancing-loyal-malkoha-ad5a36@houat>
X-Authority-Analysis: v=2.4 cv=LuaSymdc c=1 sm=1 tr=0 ts=67d804d2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=dGy_cPlXK_KhQYNS9IIA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: jMJKnnzVp4ELHg9DvHgzUIKP2KfVhyeC
X-Proofpoint-ORIG-GUID: jMJKnnzVp4ELHg9DvHgzUIKP2KfVhyeC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_04,2025-03-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170083
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 17, 2025 at 10:45:16AM +0100, Maxime Ripard wrote:
> On Fri, Mar 14, 2025 at 08:55:05PM +0200, Dmitry Baryshkov wrote:
> > On Fri, Mar 14, 2025 at 05:54:14PM +0000, Maxime Ripard wrote:
> > > On Fri, 14 Mar 2025 11:36:49 +0200, Dmitry Baryshkov wrote:
> > > > It is common for the DisplayPort bridges to implement audio support. In
> > > > preparation to providing a generic framework for DP audio, add
> > > > corresponding interface to struct drm_bridge. As suggested by Maxime
> > > > for now this is mostly c&p of the corresponding HDMI audio API.
> > > > 
> > > > 
> > > > [ ... ]
> > > 
> > > Reviewed-by: Maxime Ripard <mripard@kernel.org>
> > 
> > You've sent two r-b's for patch 2. Is there a chance that one of those
> > was for patch 3?
> 
> Did I? Sorry, it was indeed meant for patch 3

Yes, at least mutt and lore show both under patch 2. If/when you have
time, could you please fix that so that the r-b is recorded for future
generations?

-- 
With best wishes
Dmitry
