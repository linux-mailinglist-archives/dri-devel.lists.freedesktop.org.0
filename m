Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7B7BA1BD5
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 00:07:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2386110E9BF;
	Thu, 25 Sep 2025 22:07:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TYVM4wR8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AC9310E9BF
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 22:07:31 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIPptV014864
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 22:07:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=GnhBNlMLToijg17nNqJ1S6A4
 kSgBLyw9c+uskKRflGQ=; b=TYVM4wR8VvW2O/i75QaPcilIuMM91cXxdTPax7I9
 +2uHfpEve16urYdgGOKhgG5U2n76sFLJ1dUylFZB+A+jMjqrY6ZeKrcxdI3U7IDU
 foBYLU4h5Ew1HcQefw0sY25n5ukE0x/dp7T7+H8kb3P1Iyi1ssrG5tbCyj1vMuI2
 vE6goOjZH6g9eUQ77h7rVTon+k+fPXHj9AJ5A4IaZtv6oCl7jj0kwGHIg9tEwqRP
 ZuZw7D7ZXjXa5TWiRSt7SVeyiEbQI97cS0I9GtscDL/M9NypyEBVw6rZ+nWZi+QG
 77RZNSMWd3ZT5XnGgoPtt7Y/LgBjQx2CyrxlVm42np1g0A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0t8j0y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 22:07:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4d374dd29d1so35534141cf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 15:07:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758838049; x=1759442849;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GnhBNlMLToijg17nNqJ1S6A4kSgBLyw9c+uskKRflGQ=;
 b=MxzCR7aHqd9Y47CRm4D+LGB/ETp/caIFl8TEYxaQx690ljR4VeY1Q+eZcHNMbc2iGu
 ncVDwtosGx3qzJNOYkG8HZujWU9JuX7fSw8PEiU9MjYehLq8l7NWNoVTLsluyr1Wa8ED
 WzIysoswW61IlN+aK2Wa8AVoQWK4m0SpCZTUsuAc4WZLFx2LE0Br2YOT4/PfCdYUj9NN
 xQwvyqI4MidBL6W4YXXf0qtdrNMgdlePIHhotpty6AgvbFTN+TB0A/AfrZAWZcbSv5cj
 GnuREMulD1O7oq6isUuByjyByhCSiaLcxMD9VG0OBkRVlD6tNMDGF2aM5p9XgroP5i1S
 S0/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5cuikQWpFFfqmNwxpujb3k5ik1J1TNWrgt2/R7Q0paKColg8l5ypRvC0b/SEipHQ9GiFPbDQ2q+U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfJe8Zodzeb9n4JrRZj6LTYI5Ik1Foz5yV3Cgo72I5zSWVOt34
 nJUamw25BaOVnTSbdvmoK/oMcXWsHcedpi9aamVTInngpQQNzCz1aEdk1svbLj0Pm3e0DhXQGH4
 jkMkU+BQMgPAXf8y+gKNTG9q/OZI7ZmKA1FZh4Al4ZOLbNYiPMPvfD/bSdrGX9IYf2zOm77E=
X-Gm-Gg: ASbGnctvJgeRv8AKRsNDCVMOfBtLBnxfjzBOMkzmi6uhQF7M/bqHCt7gcyiS7U/Xw+e
 h68qUri6av5r2zWxsXjCrZvSmhFmB0z8EqR8Hp/hYxvEdqCW4a2oq0AHlyyyHZKtExg/5niW4bc
 VT4zc1IbJNtyxPTMsHwQk9r3+81pvmPtN2uXin0HN/xeCSbLa28LIuIT24Wi7QzHPJnjBOHyRBw
 cVL3tokp76jT9gjWSBgdTb7izWwks8KeJAlg/Xi+bsJj+X5K8a2ZSo0EikJ6Xx9D9QocVZGBkaX
 jV/clhk8dEVjrHjHg79vRhlJ9l72w2v4v5U5qhBGHQHfRufzU+uH/kIm129U5PzxGmzN1uUv4/n
 yNqRzL8VG4DtRhRG9q2KAHVBec+JOtZUXA5BMdamn0OEAKcfGyuPc
X-Received: by 2002:a05:622a:4012:b0:4b3:4f82:2b2a with SMTP id
 d75a77b69052e-4da4744e220mr69209861cf.4.1758838049444; 
 Thu, 25 Sep 2025 15:07:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+kiDioj7XNNOSUiRVIvZJf7NJTXJJKSATGhjuKbjf+uCQ8OyI87CrBJMN/jv48N8Iqu/Vnw==
X-Received: by 2002:a05:622a:4012:b0:4b3:4f82:2b2a with SMTP id
 d75a77b69052e-4da4744e220mr69209361cf.4.1758838048863; 
 Thu, 25 Sep 2025 15:07:28 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58313430bd6sm1169840e87.21.2025.09.25.15.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 15:07:27 -0700 (PDT)
Date: Fri, 26 Sep 2025 01:07:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/connector: allow a .destroy callback for
 drmm-allocated connectors
Message-ID: <ycbx4fxqppxuopcd64i6lt7qlcsa75iv4z6q4aka7igt7pntc7@bf3toot46wxo>
References: <20250925-drm-bridge-alloc-getput-bridge-connector-v1-0-f0736e1c73ee@bootlin.com>
 <20250925-drm-bridge-alloc-getput-bridge-connector-v1-1-f0736e1c73ee@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-drm-bridge-alloc-getput-bridge-connector-v1-1-f0736e1c73ee@bootlin.com>
X-Proofpoint-ORIG-GUID: GIhUCXv6uYt5wmbvkxCiKQJQlgOo0LJB
X-Proofpoint-GUID: GIhUCXv6uYt5wmbvkxCiKQJQlgOo0LJB
X-Authority-Analysis: v=2.4 cv=Jvz8bc4C c=1 sm=1 tr=0 ts=68d5bd22 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=P-IC7800AAAA:8 a=LsQKV8oFGlUMgrd0jhAA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX/OOlGvfROWAh
 Q+Kw43tVwy3kHYLoXN5vQkxEr2gCliYp0Ibhx7azyvR8igmJL86nUowWtxel4JtUSCNlbAR0dZh
 GUzkgp+n0q+Sye3B2vgHU1vzzWUv2mpr4iRnOAWlUT9wnKgtBckDw/Si/OHMY4oPZVH/pqtyFz3
 AHbwKIeRDR+O9rbbWs75xOq0FW9Unnhk6JMx0COBzco4To7PnbLgJN36V146NtRo9j46eHo5eSg
 mXOMHVsd2JLc6eMsNbpqJQJUCi1KawA8cyfNHau015rCHR5WTLQM0Gk8vao9HLanEIZPVZuIE5E
 wAreUXJEttrW4w2+B49DmT11cvP3STyXIc2Xey3kQ6o7Rd1dNGpFJswutU67PowfwOTVWYrq589
 SpmGACF88qvCGBuR/w8/bMc+XEpTpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
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

On Thu, Sep 25, 2025 at 07:19:49PM +0200, Luca Ceresoli wrote:
> Some code is going to need connector-specific cleanup actions (namely
> drm_bridge_connector will need to put refcounted bridges).
> 
> The .destroy callback is appropriate for this task but it is currently
> forbidden by drmm_connector_init(). Relax this limitation and document it.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> The other obvious approach would be adding a separate .cleanup callback for
> the cleanup-only actions. I tried both, they both apparently work, so any
> arguments and opinions on which approach is best within the overall DRM
> design would be very useful here.

Would it be better to use drmm-reset actions. I think the check here
makes much more help overall than harm in your case, so I'd suggest
leaving it in place.

> ---
>  drivers/gpu/drm/drm_connector.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 272d6254ea4784e97ca894ec4d463beebf9fdbf0..bd0220513a23afcb096b0c4c4d2b957b81f21ee1 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -513,7 +513,8 @@ static void drm_connector_cleanup_action(struct drm_device *dev,
>   *
>   * The connector structure should be allocated with drmm_kzalloc().
>   *
> - * The @drm_connector_funcs.destroy hook must be NULL.
> + * The @drm_connector_funcs.destroy hook must only do connector-specific
> + * cleanups if any is needed, not dealloacte the connector.
>   *
>   * Returns:
>   * Zero on success, error code on failure.
> @@ -526,9 +527,6 @@ int drmm_connector_init(struct drm_device *dev,
>  {
>  	int ret;
>  
> -	if (drm_WARN_ON(dev, funcs && funcs->destroy))
> -		return -EINVAL;
> -
>  	ret = drm_connector_init_and_add(dev, connector, funcs, connector_type, ddc);
>  	if (ret)
>  		return ret;
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry
