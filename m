Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0D8B532F2
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 14:59:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 586F810EB20;
	Thu, 11 Sep 2025 12:59:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NF+KtG0d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8079E10EB20
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 12:59:12 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BAl7U9032588
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 12:59:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=erQHYt3izy31hhOi7nQaR12L
 KzLFsLkvUdjCmOIgf4U=; b=NF+KtG0dJrO+Jah9l4R1SQCTtI8Ig4bugDgBUDB3
 Q+tnn9DOXj9Cdz9U2r89R18AiyibwLhEt8DN11Pj8TQP8JWJhLN1zLjqrBwte5mI
 rCNPLEzQ10b8nRvzPYoumLmEz8KrYr08erJ62L6GSFvqhcD+FGAVmVrWR3O8zpm2
 k9G6G2ZqzfkYjaYQoIahqe4wAkekDbv19idhB7aJOoFpz/iURoLabuEBuL560VLx
 LvkUoruTmoYuB3hx5Nc1SkakwiaIm981eiz6gPJxXB/IUow0/9/i2qHFV1bS3qQs
 0cEa4M/bjyT57glR9zrEgMfQF3yOzzMmEnHmvMJYCwdaIA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqg7fvf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 12:59:12 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-71ff3e1256cso18442106d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 05:59:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757595551; x=1758200351;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=erQHYt3izy31hhOi7nQaR12LKzLFsLkvUdjCmOIgf4U=;
 b=up8eaaV920LzQuVzj18aoOImYk3yYFDxrwkELVgY62NHL2Zmhye+4H3SQa1rdkO00x
 AdTWGBe5cViRnJ3GYlbLYGMToDxB4+HQUF12zLTHHKAwxESztrRda80oL0GBZFqXNsGx
 5uDtam7Tze7I/jYMduPfjjEuVff7/nkJw7yz0ANIFa6w6KWiFB6PFhPMb3mwVHi7UAow
 6r3CEP4hCbrlEgSBQhDemWAhKY8DYqx5rBbdbbbgbUsFzM+WdMU7X6BHg/NIkp425Vpb
 L7bBFZIZJTHs+Fn+IADBb4WsyxnzHPh3BUYNJyLm0Dh6d2IqAp4QrOsYHXzIzRXuMUYW
 PQaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOy7gqg59GHW7g1iPjSI9qg4rHZ7u9hj7dHPp74PX0ZjzebgYvYJW01vIPt+NGbgdoQUWIZ1wctJo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZkvufGSDblEmjdrWz44aE6wKXkW7w/DOXB20jtnk35vQ7JifT
 TSwr4Wpyju+5/5Q9lfYkediF/1PfELT1ND9MykoHH8mhH3Fcf/dMeJ4pi1IQxdbNCiIRsxlfpUz
 oKUhkCUR6evEDItThFX1snDVGMtw/rtam4Jepu+1H8cGd0BvGno6oHPGH9Vj7rPTG9aM1sPw=
X-Gm-Gg: ASbGncsOB9bH8T2DMSkKeqnpO39rxQvwKwdKI6cJ2MCTFImNjg4Ag6k/pzxtKVKe/eA
 q2psws9kK2C2klTilEfAOCugqv23ruR8wElQumY0TG3GH1/+/TOLLXgJii7uN+V2jGYYD0X+dTd
 xHfQSdoTvVaTuL6IYKxMWY0Na9vwFPfli9yBL7dx9De5qhaKphn8KZzE4F1n/nlhO5rzc/6TrfT
 oJ6forrxt8F/UJS2DZIsKh0Td/sfa1t2vOKQFE29U2+t6WyoQH5yNwdfFPqUit37Ba9qJb7Nit5
 yZurCDoDI6etz3jFEHU/BcEZoQXKstdKLO0d15qwJVlkt3yIl2O79lYcyOZrpLd1Vfq/9F9O7xJ
 6nCySCt/fS3GO4uVt+13yWbedIIWvlYV7Um/0pQ9raeN4/kB8Imlj
X-Received: by 2002:a05:6214:2a4a:b0:729:9ec8:a1a6 with SMTP id
 6a1803df08f44-7393ec167f7mr231642546d6.53.1757595549378; 
 Thu, 11 Sep 2025 05:59:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELAL9kOk9qQGqQpSk7nyLvkiKnEOMoOscLtU6SuZkaDa8BaY8uCBWjurK/6Kut9nEHxlP7Tg==
X-Received: by 2002:a05:6214:2a4a:b0:729:9ec8:a1a6 with SMTP id
 6a1803df08f44-7393ec167f7mr231642076d6.53.1757595548865; 
 Thu, 11 Sep 2025 05:59:08 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e65a31a1asm400573e87.134.2025.09.11.05.59.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 05:59:08 -0700 (PDT)
Date: Thu, 11 Sep 2025 15:59:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] drm/msm/dp: Add support for Glymur
Message-ID: <gteqgamsehrmaf2hro4uhqydckexjlvkzlpkj3xyt2w2derf6t@evk22k5y4bpb>
References: <20250911-glymur-display-v1-0-d391a343292e@linaro.org>
 <20250911-glymur-display-v1-6-d391a343292e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-glymur-display-v1-6-d391a343292e@linaro.org>
X-Proofpoint-ORIG-GUID: nd_9Q38ZjokJT0FnNQR76dO-OY2nU3Ju
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX8xnCt4ldXof3
 Gjp34gyp5Csf+RbIYe0+p/+Z7HwmwuQ8dvG3aANWsyxLgbPNNOn3FzFu9rAzA28y/bbNISVpKfh
 LF85RxpBB3XT+q/gdLRNgUZsFcw643P/Aena5Og4RiBR3exLff9pVvQm0y8yQtmVDkbpVXQ3XYg
 3ENKvFdvTCKFdJmKWmZ1YUliGdCZAJVR8OJVyqGWtg/SXxk6JCDi6g5ZLKmWrwb/oGt24T0nPaT
 bUGAtlvitpGA2Di+sfZWsR+C9HoEJlmfESRcl6I3hYJbtJ1ioFObc++bMa1eb3qYuTz1T1i0kwG
 JHEvuWy4kBh/sc5T6lW5WOp8QPQJ2/HBJSh/cJytcWRBwfm5YYTIRNMtJe1lHA7SBoUeAU+kK50
 L4Wqw8qt
X-Proofpoint-GUID: nd_9Q38ZjokJT0FnNQR76dO-OY2nU3Ju
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68c2c7a0 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=r4hCbaOVonaLTjXU3fkA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035
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

On Thu, Sep 11, 2025 at 03:28:53PM +0300, Abel Vesa wrote:
> The Qualcomm Glymur platform comes with 4 DisplayPort controllers, which
> have different offsets than all previous platforms. Describe them and add
> the compatible.

It's not only about offsets. It has different core revision, so it
varrants a new compat string.

With the commit message updated:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

-- 
With best wishes
Dmitry
