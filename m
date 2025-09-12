Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 832F4B54A22
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 12:43:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 998CE10EBFF;
	Fri, 12 Sep 2025 10:42:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GQjW8HmI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5365A10EBFF
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 10:42:53 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fNQa023224
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 10:42:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=tmYj8o/t1vex4Px+MD+gCX2U
 CvHxt1dgbQLo/nWIiZg=; b=GQjW8HmIki9icNT1gdLF4cGqZwRgsCl53xJuS9Yu
 9IbMPHlyD40imdDMbcw3uSHzdLk7F3WgcNYQUjtYYpkZccjxvcvi8uul3CNtWfhe
 DTW7SnSgqJLvD3FnvuDcm3lJIjgsG6mTVn0ZtT2ZUAfbKq8JOU+5owxZ2fMR1/mf
 fyxG57HDuUI0InyWg0+OrsdXe94iztWIJ64I6LeESBNenh1RSDbYGp6PNXFhEaaF
 w5zwcoOlcBY1NQwqM7U/A+Yg4r9Cjq9AR/EZT7x4QbOadsDi9bi0NcJwxPuoyM47
 7UlbLJMbYYrEZgLNA4mUtKtbeF1VfEl5x4cZtQ89DFgKLA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc2fa28-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 10:42:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-817ecd47971so678896585a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 03:42:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757673771; x=1758278571;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tmYj8o/t1vex4Px+MD+gCX2UCvHxt1dgbQLo/nWIiZg=;
 b=M0v8b3xdSNpkKozVNQE5qMWlSiUqWMn8IkywLiVYfi/D0aDlnwcKx9axpNC8f5SOeC
 VYzWLssOfL86ukGq09B3Pu1i+VBb1Zvuhy6WOlDiQqBLnQBOnIEcHkWhBqDaXLrQ/wWk
 uZuEEh6pcLOLaOuPX9SeO6QybJgpVyDnGpOSKCeR6Ih5MHXp1iHRYet7YpbCpZKgkqIP
 XDERf102m5vz4ns6mY7ib9ehjDgbnWzKmuvOBkrikzRsq1HkRTKYrX20DM+apZOtTPTm
 1u5a9FYY4asEe0E4Lg0jFoRWQ9DavKun0HMbVbhCEyN5h7f3b2YmP1ml1+UYbi/x23VM
 HEdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmnGxwbuWsTg78SXZmLO//c4rISINXRg9llfoHIxXkYKyzKDckUsuIUEehgW/hF1xCv3PlVyV8fT8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxM3gTMBY9uk639O935lA6OJ22XNvGqlViKK4lYq1mEmfSBrhMX
 bLKb42yg4qwUKh4kyYJl/xXPfG2MHC0FOUtVTWKaP/PZW5vKqkGnnYaaqawAF847eVZpzSj+nUb
 VgZ/cd/i0TAKvB9nhB+g3vJfiLfv4QZbSVUls0n1s1n8CGVKKAQJrbBk0cX9Ff8cz1uiYmzk=
X-Gm-Gg: ASbGncsiViKLeYeidi4WdyqvpGyh105UaCt/uGhbPRykMiAlpzAf/fa4JSUEVKD57uK
 X+APQf30c/65Jdm9zg+eDxBes0jv3H7Qi3IPmpbcaAkzYP0x6S6es/54LXnggQK3pBptoI6DNXN
 RfcEFgWFtaT1mRhu5wNBBPevGYPmjWcouux6pAZ9Y/nMwVc1XN3GkbGfMjegHF9j8REX2aPTTkD
 Dl8RUTTwaWNYHrKt4hOcQDfytNjUDTF+KGkRscO5SbHNtjhtfJlccaovdxARsLNq50Nf/Guurlr
 G3+KnggDuHZW7UGUYc7SGAefJFkWdtt9AP0Jg8f/MKJ8O45GhNqnXFbsHK8pW7soa95c8SiyD88
 XTeUIQ05cetugjYJNewoPARTQNNtqap1D0Rg0juG2DQ7g0OgAEj4f
X-Received: by 2002:a05:6214:c66:b0:729:1a8e:bbc3 with SMTP id
 6a1803df08f44-76224bd0051mr77315926d6.16.1757673771421; 
 Fri, 12 Sep 2025 03:42:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZ2QmS8xdGEbDL2t/HPuGI8RfYY86H09ePtFLONg3tM736xe3yZrmy2xCP1EXPL4YyRv692Q==
X-Received: by 2002:a05:6214:c66:b0:729:1a8e:bbc3 with SMTP id
 6a1803df08f44-76224bd0051mr77315476d6.16.1757673770919; 
 Fri, 12 Sep 2025 03:42:50 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e6460ded0sm1080496e87.105.2025.09.12.03.42.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 03:42:50 -0700 (PDT)
Date: Fri, 12 Sep 2025 13:42:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v4 13/13] drm/msm/dp: Add support for lane mapping
 configuration
Message-ID: <oex5463riqvvyfyntxcyissaznnfsd6xogcniqouqcn6yokgwu@dwhje4i5inj6>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
 <20250911-add-displayport-support-for-qcs615-platform-v4-13-2702bdda14ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-add-displayport-support-for-qcs615-platform-v4-13-2702bdda14ed@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c3f92c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=7XclI0hbOSOr8FJszFwA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Y8Mc0bJ5klEKKXB6zecHAIpaLIvXmQrU
X-Proofpoint-GUID: Y8Mc0bJ5klEKKXB6zecHAIpaLIvXmQrU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX0odo/DPzUyiF
 tum8TCF1oK2cfSzbY+Lcd0rdnuiCRvQPdJnfbUDX0gZfy1Aykg+kURLJUzGwYMmlMbQmASiV3g+
 bD1OyribMvHrVIKRYAJOFdtEzik3B4dI6F8j3Q2udo4oNBRA8FRd2OZht1jT7Yy/EhLAUeM2fKu
 a2EPy79Uc/CHFUTAZeFUNWRdkZzr5cqukR92SFRCfMIY8M0aCi1l9KWOd5w8P77qnYAn4K9LDNJ
 /QmbQvJZQFfYtcsVG3n+XHiq+TkP4TBNcGMjwcCkAYVa6pnnUsWcvoiy7yzQ4a8SPrnKpl4Mmhn
 pmy8XfSdjdor0rSGIYXOc/8XZUr20vqR2F34i5Vjaqsa92CLlH2MNLbgyCUdvlIHmyjd8T8RHeK
 QAIKj0nW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094
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

On Thu, Sep 11, 2025 at 10:55:10PM +0800, Xiangxu Yin wrote:
> QCS615 platform requires non-default logical-to-physical lane mapping due
> to its unique hardware routing. Unlike the standard mapping sequence
> <0 1 2 3>, QCS615 uses <3 2 0 1>, which necessitates explicit
> configuration via the data-lanes property in the device tree. This ensures
> correct signal routing between the DP controller and PHY.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 10 +++++-----
>  drivers/gpu/drm/msm/dp/dp_link.c | 12 ++++++++++--
>  drivers/gpu/drm/msm/dp/dp_link.h |  1 +
>  3 files changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index c42fd2c17a328f6deae211c9cd57cc7416a9365a..cbcc7c2f0ffc4696749b6c43818d20853ddec069 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -423,13 +423,13 @@ static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
>  
>  static void msm_dp_ctrl_lane_mapping(struct msm_dp_ctrl_private *ctrl)
>  {
> -	u32 ln_0 = 0, ln_1 = 1, ln_2 = 2, ln_3 = 3; /* One-to-One mapping */
> +	u32 *lane_map = ctrl->link->lane_map;
>  	u32 ln_mapping;
>  
> -	ln_mapping = ln_0 << LANE0_MAPPING_SHIFT;
> -	ln_mapping |= ln_1 << LANE1_MAPPING_SHIFT;
> -	ln_mapping |= ln_2 << LANE2_MAPPING_SHIFT;
> -	ln_mapping |= ln_3 << LANE3_MAPPING_SHIFT;
> +	ln_mapping = lane_map[0] << LANE0_MAPPING_SHIFT;
> +	ln_mapping |= lane_map[1] << LANE1_MAPPING_SHIFT;
> +	ln_mapping |= lane_map[2] << LANE2_MAPPING_SHIFT;
> +	ln_mapping |= lane_map[3] << LANE3_MAPPING_SHIFT;
>  
>  	msm_dp_write_link(ctrl, REG_DP_LOGICAL2PHYSICAL_LANE_MAPPING,
>  			ln_mapping);
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
> index caca947122c60abb2a01e295f3e254cf02e34502..7c7a4aa584eb42a0ca7c6ec45de585cde8639cb4 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -1242,6 +1242,7 @@ static int msm_dp_link_parse_dt(struct msm_dp_link *msm_dp_link)
>  	struct msm_dp_link_private *link;
>  	struct device_node *of_node;
>  	int cnt;
> +	u32 lane_map[DP_MAX_NUM_DP_LANES] = {0};
>  
>  	link = container_of(msm_dp_link, struct msm_dp_link_private, msm_dp_link);
>  	of_node = link->dev->of_node;
> @@ -1255,10 +1256,17 @@ static int msm_dp_link_parse_dt(struct msm_dp_link *msm_dp_link)
>  		cnt = drm_of_get_data_lanes_count(of_node, 1, DP_MAX_NUM_DP_LANES);
>  	}
>  
> -	if (cnt > 0)
> +	if (cnt > 0) {
> +		struct device_node *endpoint;
> +
>  		msm_dp_link->max_dp_lanes = cnt;
> -	else
> +		endpoint = of_graph_get_endpoint_by_regs(of_node, 1, -1);
> +		of_property_read_u32_array(endpoint, "data-lanes", lane_map, cnt);
> +	} else {
>  		msm_dp_link->max_dp_lanes = DP_MAX_NUM_DP_LANES; /* 4 lanes */
> +	}
> +
> +	memcpy(msm_dp_link->lane_map, lane_map, msm_dp_link->max_dp_lanes * sizeof(u32));

This will break all the cases when data-lanes is not present in DT: you
are storing the empty lane map instead of the 1:1 lane mapping that was
in place beforehand.

>  
>  	msm_dp_link->max_dp_link_rate = msm_dp_link_link_frequencies(of_node);
>  	if (!msm_dp_link->max_dp_link_rate)

-- 
With best wishes
Dmitry
