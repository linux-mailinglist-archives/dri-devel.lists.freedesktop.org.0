Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC663AE583E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 02:00:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0283310E480;
	Tue, 24 Jun 2025 00:00:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KmI6CYKJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECD8B10E480
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 00:00:39 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NElXXF026319
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 00:00:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0Asi+qo8nTCI1mKiB5x94ZBX2989X9Lw801FHpxrzws=; b=KmI6CYKJcLNpKpPl
 LNiInYXuUfgawGi7aY39IqnzcblG0HK/I1T7TjB/iv7yufGSaWoeHAuSrf8r0yeP
 AVcGKuFKqR8qAbAS/ZE/SzmOANZH8NhNuafY3Udmsr39gpDfaBfT8pg5YWwfRA/F
 O/2U87VnVKc4Ov4cFHcYv7l/xNLbva/aCOHydgTjxaU3wM3bg++iI1Z+5ibPC6zz
 0fAredJZTSF40k9tPR9R9sj9R8IeAwwhfENQ5+ia+I1XLT5jpYqhFDI1htHCK8gt
 gJliLSeairOTGOqWMvlCdxvmaSjyqcvguuY6shOZArFVTfNPAiRVRuz9DX4YT7iH
 Dp0nyg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f8yms80h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 00:00:39 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6fb3487d422so75500526d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 17:00:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750723238; x=1751328038;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0Asi+qo8nTCI1mKiB5x94ZBX2989X9Lw801FHpxrzws=;
 b=cL9++8WyIF/qpDHdwAeNjbWRqeWeGA8w272zhxF4jD0Y4Z2t677zVfEFosQ8bdPSHn
 WbFledAFpKcb7IeySBAPyjSA7/+c+HyT2Dx7Pl7DpaBcDkts61crrUSoC/uSoXh7q9Ke
 QAYXwERqBjlH/hkLE9DD20dzpIz+hBedxRfgjs9M4AJzHGx4G/7znzlQkxxEwboIO3DF
 TyL/XBPaKZJLNqG8Mh6efQZtIXfi+WEu3hYw8HzZeUrI/qLnoyw2ZeDA171IEFglE6lc
 gB8vNinRq2LpXmst/d5Xp7sPqu2So/EFLN4AxNMAf4RLW4K1OmPwi0FNEwpTYZPOEdSt
 sL/A==
X-Gm-Message-State: AOJu0YwxCmgqYMtUz/pvwseIwSXWTil1C2QslbmKPbVV4FZN+4QFj61V
 BgtfD27LCSxnHx54Tu2dVuskxXg67V8cEvtGIBkPEP38XHxCEdUCpV9FfLwIluoGuKoOSvR1XAP
 6v1LZNS28MzgNLINDde7o1BIaCEJB7pt5UPwc11UpsZc4dV+oNAsliGzT4n9XVzx0PVG1Vp4=
X-Gm-Gg: ASbGnctEWKD0BP/kwciXQ6RmWSYENc9/FNbPozWlq84SN9hc5iseF1Pnajp2CTFjm9Y
 kEJcxkUkSu9Y1J9stnDRCA8RoxpoqQfkMpG32xwuI93t7pJC7aBrADFmghT3TdpfjfuaaOPfQiQ
 Ea8MUcgSwQJGp5OIGJnvWJuRaVD/10J8Tc/yjBnMgDqZBo0My93mxO+s3nEYJ2vNrKXODDQze1z
 dRPHifHf4prQWoEwLABDT4ihRbun3ynMsu5Yi7M+MJrSzrzqCRq861oH06oO5hmNZdvoSrL3Z2f
 QaRBvYhsaV1fJC6/vqKRKcqs7Q5iWfzexROSax7HPP04EKPWtEBmM7lnioGhY7bdge7tsSQpJxT
 GY21gjDRt1+jWbD8i7iC3nOkNNCmhjjfY8i4=
X-Received: by 2002:a05:620a:4085:b0:7d3:913e:802e with SMTP id
 af79cd13be357-7d3f994880amr2222737685a.41.1750723237904; 
 Mon, 23 Jun 2025 17:00:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG17w7pk2aosN4FygWcUzSUrA3VkoKfC8yJPuyal8/htdlf/PM2J6oSDnLvCagyiRaIxM1Q0g==
X-Received: by 2002:a05:620a:4085:b0:7d3:913e:802e with SMTP id
 af79cd13be357-7d3f994880amr2222732585a.41.1750723237409; 
 Mon, 23 Jun 2025 17:00:37 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553e41c3b8bsm1610263e87.176.2025.06.23.17.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jun 2025 17:00:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chaoyi Chen <kernel@airkyi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: Re: [PATCH RESEND] drm/bridge-connector: Fix bridge in
 drm_connector_hdmi_audio_init()
Date: Tue, 24 Jun 2025 03:00:35 +0300
Message-Id: <175072321565.2143591.15673248726597624264.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250620011616.118-1-kernel@airkyi.com>
References: <20250620011616.118-1-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDE2NyBTYWx0ZWRfX3sxQMzjTQLrZ
 82rO7SNyLAIXbygcNtbS1t/TCjKy3vq+UV2AJPVwimghKYvghcHaOHRoHQIeGiQIPdtg3MWilgZ
 nHTggUKoROfmevmF2U/JsGmETql2ndWoVVMr5vEXxh/C6Cqh6buGkNOoc/Dw7w+sWC4c/kPN4qI
 VzE5+o85yYXaHbTKmx0yE/OxfKqh+cswAFlXOKZBrFvX5zC4SDXKmNF67eCBzQMnHcQXV3VJ+SZ
 Jf+DwzNsPHB6e3eTXvg/bH04c5SZGjNtZIovsrjr2I4a4I0ir3gls86wV23TH7Ni+BPXsGjoSgo
 flUlSgWRkP5kvrPxIYBAJ0Lk4WX3CLLGPRi4xzLcIAnxGo536/Lusw9o7dn/92usMqLxs/lTSXN
 bpOWDNKYfgSDjl0oD9tDFwscxpKlMIPjFExpbBaaDX1gp9O7sGSthHWowLz5tMzttTm8GYJ8
X-Proofpoint-ORIG-GUID: 32TuEI-c7L7rKKF_JAV_0Njj3zIEdnkL
X-Proofpoint-GUID: 32TuEI-c7L7rKKF_JAV_0Njj3zIEdnkL
X-Authority-Analysis: v=2.4 cv=GLYIEvNK c=1 sm=1 tr=0 ts=6859eaa7 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=XOHZOQEbOLC72XWR49MA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_08,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230167
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

On Fri, 20 Jun 2025 09:16:16 +0800, Chaoyi Chen wrote:
> The bridge used in drm_connector_hdmi_audio_init() does not correctly
> point to the required audio bridge, which lead to incorrect audio
> configuration input.
> 
> 

Applied to drm-misc-fixes, thanks!

[1/1] drm/bridge-connector: Fix bridge in drm_connector_hdmi_audio_init()
      commit: 10357824151262636fda879845f8b64553541106

Best regards,
-- 
With best wishes
Dmitry

