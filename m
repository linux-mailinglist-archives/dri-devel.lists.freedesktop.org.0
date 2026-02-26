Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGUqFS67n2n5dQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 04:17:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CD01A06B5
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 04:17:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADD9210E85D;
	Thu, 26 Feb 2026 03:16:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Icyp69qD";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ey44SKbA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4A3810E85D
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 03:16:57 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61PHjThL3056476
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 03:16:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=x4Oin2eFJWAEHjLuD9tLoYce
 wXRKKg+sy1mMDk6n0RA=; b=Icyp69qDaTGEUhbuhBW/swKuhVkCMrEGUdLgvjDr
 d3g41kocnw4YMsXB+IHsQEpJJnJX6R/zi912um7smpkQzs2y+DeSyCZTEcgis2GW
 P2Z0rrPBadlVFjd8HUV33l+pAK7IgQNrLnObLjFhOc/LTA8Z8VaBxMxVRq6XW1vn
 NG3E6IvVlTnVnXGwq36d3EMZFF7EY0305JL9lF3kXEXahbDCQ3sx7uE8mPHC0mmm
 t/PgLWOL0K8HyXqOhBWru6WSZMkpiZ64zr9xESyHFSbKZ77j13whcoPqDFwvYbrt
 uIXLDZaoQfyt+k/n329BZsVi8y9x+7Xhehp80WKtCG/K9A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chx39k1t8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 03:16:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-506bac14430so77907411cf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 19:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772075816; x=1772680616;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=x4Oin2eFJWAEHjLuD9tLoYcewXRKKg+sy1mMDk6n0RA=;
 b=ey44SKbAgtVf+XliEtB7cqMQ/yaSsZG+m9tqu7Q6nJswuS4lIbvVWaJorKN3+vJ2ZC
 NZR6/eYk5VnW14IjRW4IJaXlbuHwDSb7O5ucqwhN/dUnu/h7s8JmAsVKnVSDRLNQSqc1
 iggfjkvfamkK87o233hyIKUpnASrcR+6llyBarhhvO8mzi1exGZySiLiVrahsyF+Gt7T
 ZQfEfKVKfV5VkTx8Vym0SOMK3zQqtGXuQ+/wtn1CMNdQ8WfMZd+QTH0vP0zL7W25qGZs
 0SRzAvGxQG5QFpl+n0A3HmH8HIf0BzRjT5nF7FLbB1on61dLcGDZfL/3kufIlN/43UUL
 yeBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772075816; x=1772680616;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x4Oin2eFJWAEHjLuD9tLoYcewXRKKg+sy1mMDk6n0RA=;
 b=FyZon6hKhIpqh+j3Jcb0wJVky/hRiTbaY5MI+Yt9RyUWyXmfY4pXHYguslEpjn3vj0
 cyOI+UMUCHGBHfuHUrqCtX3VSBy1Hyzp99ckpxf6ly8jvmNC6EkR0dhXDiUm1fnYLG3e
 D7zPXF/hIgGXz/Gf1YjVqNrPsUbZ7YNFUe2vZe7p1h2irej+ZYixVoV8LJqThYRkTiPD
 VA1iMxY2qLoagDk6B6dnryOtVLYGYv5ZLGww+FkzX4qI/akPRjxfLpPSkegn3KMUicD/
 HKzQd2nHBYES7hS7W+SNH3ZDRXj1izz7cscvUzf37QXW35BzSJ9vlPND1rr95nX8U/xk
 gxqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUE7/iG8t7QdImYNCuIweEJRWZH5vbddtCtE77VYHHyNd7KfH13GklrgER/5hRHfb2BJK2gzh/MU4o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/1C7kDBCR03mExw2N1qcRPGwScntzW2UAOy5B0XsMPf4HSJj3
 VqCBKQOZ9Tp9rOYixh0n+2p7hMBLsW0QIxl6TJ70lN0x+ZgI8hiENEL67afLEtGkMPksfUoQyqv
 wAbLlaEg+9Q81j3HXvekKp3wMvIQXBlLW7p2O0J0ZBvMlegqlt6hGkM+NxooughHzjzkRoZc=
X-Gm-Gg: ATEYQzxAd/Fwypr58MYmSIO4/Sy094w+op4yaosDWBU0ZFf3OtgCVs1gNvGDwvgxlNx
 f6jFfIV/mxpVorgKWU40BeoDr50cfUwkGE7El9f//lvnf5IOHdp22jWv8Qtg0+GyS/f0IGP/uvT
 5UsOQYsk14gCmJtPniLSqTNfTFEjfwNMoLMuswAVQTCOtXowkLf0OeDby1Lp7DR/+dCAipLKx5B
 Fkg198+3ZoFQOqousfrnwgbZja2Ro9Uxo2DjU9LApkOu/jmIQJxKnNeA2FMyNyufdIf5qhk6HvI
 X0c1vmeMnFEFTYVM6OpH+KCoq78B24YSftBdEZezvY/4v6BP8+zlCtrQO3+zZWIaHAHXmyMSHHw
 3TXq6sF/aSs7QbRJDDmFau3OcbobpgwSZdMqWOCsi51rJzo+3WGUfd6isA1/I4b3u2tonVcoRgS
 xESX3cLGBqr43YflfjDZQQGvoVR2hTAJeBuwk=
X-Received: by 2002:a05:620a:29ce:b0:8c6:af59:5e28 with SMTP id
 af79cd13be357-8cbbcf5ff82mr384724485a.22.1772075816244; 
 Wed, 25 Feb 2026 19:16:56 -0800 (PST)
X-Received: by 2002:a05:620a:29ce:b0:8c6:af59:5e28 with SMTP id
 af79cd13be357-8cbbcf5ff82mr384722885a.22.1772075815795; 
 Wed, 25 Feb 2026 19:16:55 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a10a05b2e6sm243072e87.22.2026.02.25.19.16.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 19:16:53 -0800 (PST)
Date: Thu, 26 Feb 2026 05:16:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tianyu Gao <gty0622@gmail.com>, White Lewis <liu224806@gmail.com>
Subject: Re: [PATCH 4/5] drm/msm/dsi: Add DSI PHY configuration on SC8280XP
Message-ID: <zpilakwmv45vrfr2qvigelgsglgmhpiozw72nciqp6slyyhluu@ks2bys7r74ql>
References: <20260225054525.6803-1-mitltlatltl@gmail.com>
 <20260225054525.6803-5-mitltlatltl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225054525.6803-5-mitltlatltl@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDAyNiBTYWx0ZWRfX0VcRvI2yUZeB
 73qwrwcB/7oa+Tr+mbC/Zb4nXoOFrdiFJBBN2FcLolzppF/7J3rU00Ncn/FqopOM1JqXgphM7BE
 vcoofZ4zDaCD5GG0a9RNYS3XBJUQaYwINK0FReSoFNM8/KeHpO7wvWaQYTQdC9sfdZ2r/uzkJOP
 o2SywoNyVUDRBpym0G24PCBLToeagWCwRrVEFHHx2J/PEDJWKb2jwTnrp9V2iEzwA+oEDlj6E/l
 F29+qcF7JVHWMh+st3s2HNJr6QwrVbbWUHzAr4zu+dRxszk+BPkuhqehNVnIedq1Z1zabgnyRiF
 hwglYvrsri6FJ+0lNfxXM2VthVB1/yUtLmn88wHKN92aV516VidKMwXlolM8/BmOO1q4Rwn8ubL
 pTzzYS7h2yZh83bMNO0p6eBRk+fE933ZSBRRsSleHNQdyZPTkNDv8igezdAVyUujVQDTVIN1hFD
 ftj76m7e2jp4JdqNS3A==
X-Authority-Analysis: v=2.4 cv=FvoIPmrq c=1 sm=1 tr=0 ts=699fbb29 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8
 a=t8rQu5QzYQlLpjgIwqIA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 9QH1lEVvivLz6A7rwEB55VeD6g-lE-XM
X-Proofpoint-ORIG-GUID: 9QH1lEVvivLz6A7rwEB55VeD6g-lE-XM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260026
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mitltlatltl@gmail.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:quic_mkrishn@quicinc.com,m:jonathan@marek.ca,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gty0622@gmail.com,m:liu224806@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 00CD01A06B5
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 01:45:24PM +0800, Pengyu Luo wrote:
> According to the REG_DSI_7nm_PHY_CMN_GLBL_RESCODE_OFFSET_TOP_CTRL
> value(0x3c) on Windows OS, we can confirm that the SC8280XP uses the
> 5nm (v4.2) DSI PHY.
> 
> Since SC8280XP and SA8775P have the same DSI version (v2.5.1), using
> SA8775P configuration.

Then we should not need separate config here. Use sa8775p as a fallback
compatible.

> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index 7937266de..4a37c50d9 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -565,6 +565,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
>  	  .data = &dsi_phy_5nm_sar2130p_cfgs },
>  	{ .compatible = "qcom,sc7280-dsi-phy-7nm",
>  	  .data = &dsi_phy_7nm_7280_cfgs },
> +	{ .compatible = "qcom,sc8280xp-dsi-phy-5nm",
> +	  .data = &dsi_phy_5nm_8775p_cfgs },
>  	{ .compatible = "qcom,sm6375-dsi-phy-7nm",
>  	  .data = &dsi_phy_7nm_6375_cfgs },
>  	{ .compatible = "qcom,sm8350-dsi-phy-5nm",
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
