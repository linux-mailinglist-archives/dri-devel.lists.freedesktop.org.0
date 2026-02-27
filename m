Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GD9yO/kXoWk9qQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 05:05:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F931B27B3
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 05:05:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C323310E5F0;
	Fri, 27 Feb 2026 04:05:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ONcJveXH";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="esDWpmzn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD7E10E188
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 04:05:11 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61R2KCHP236359
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 04:05:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=aiD+WIJ/4DuL+WWSgSV75vtj
 gYSQFtjkrfw1dFQwWJc=; b=ONcJveXHd8QgGfEnYdh40lzZIUo5KO6WAx2jz/1F
 kwDYmXd9Zgz2yq51hS62AJRU9YldniH1kA/MieDutASQg6PDUhO8tDzDbc27Wwee
 k79zpypiFo4hyxSgeSmVnxk3BsxbRpcemKOxrADeOrf+TrEgCs2nlh7h8h1RC0Yz
 KEw9DuUeFp8Ugo4Pu/fP7Yrh0kYjvAG9SEOpd7FoK5bINfx/RlgCTQIl70d/q30x
 eL8Wv1oZEVm4k8ZENNjB70SkYp1wOWQGAWb6CrzC8f8WA8eqSQnUmehBczaAgZ76
 qetJi6IVKgxzl0zfuFgS3BaO/Ad0Puq8C/xS7ro/qhJY2Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjx1xrxc9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 04:05:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8cb390a0c4eso1631809785a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 20:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772165110; x=1772769910;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=aiD+WIJ/4DuL+WWSgSV75vtjgYSQFtjkrfw1dFQwWJc=;
 b=esDWpmzn7lnYZKsePZltElPOAn9D/QnMfsygYwUnHqXJeETxBuFUXkuS7ZVO9mA9qM
 7WVIxFESz4smqLd5aI/lCYeOrcYtlTgNMAQewub6jBgtLEXtiz4kD8LMKpYTx0bL7X5L
 HcLIQbrtDR1oMzs5grh7ET6pu65y/4tIM2w5H4LAF9vHPF/sOHnXyFgA7N3C3MNV2A7F
 w1fYmVq4jn7/QjTiwCnTPEUgjG1FtUgn/J+HOTZldFgypJxLIp0FnmJa+uIOAtP5aXIK
 Wd1q1P/YogxQNeGN56OkrHo6y5iQQy/8ZWraElVMqcp4IgBpYvI+yPy0emABoLmaYzL/
 Bmzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772165110; x=1772769910;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aiD+WIJ/4DuL+WWSgSV75vtjgYSQFtjkrfw1dFQwWJc=;
 b=d57oP3Ua1NB+F76Qq46AmJFSOfvD/bjoblGjYH30qB6ops12CiAY//eyFF8MH5Yzvk
 7gcGVb7tTZtX0JbLX8X8JKXg+Bs9YD3tLBAAyY61kJmCCzY8iy/0qJyNEPpJ8LKMVwUx
 IH9Gy869NpO51CPZmFcVSi1vc580Vs7t0qugX0FnUpU2pMuHHRSfQJlBxtTGygWCeJ3G
 FNGApsNX/gYJhqDBR318xtXolQoXFfAXR2P5ZWAojJIVD/Wp7XCByqZ0zVuOTWGK0i53
 0SDBMY3ocw7jvNWtj5gTmBQhwYEsFPRl4STWLAnBGpvncUhBDU6fl560K93Z8GoSpR9x
 Z6kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmZ/JB7q5Pb6+Mx1yfxJ6FTUehFI8VYk1+9OpjIPTpqHqFuZCAReMA36IvasCxTmi3Of1UZSlM8rM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGwHqe1m7FKDdc3vo4voZgFMchtD1uxuS+2DXoi4UIpcGp0/ee
 5NVAARbpzWhH6NlAdnijAoLQqpyJywNJjyR/AbPQ+3RzSiijHH03HgZ4/1wRRouXuleFSj3uFAo
 kdvy0ul3+k3Ns8a41d013hHFh3ef2OUrO2UbPWg1Vz58fdd/6vpUz/eGOjfzqJ6J80Fd/1z4=
X-Gm-Gg: ATEYQzwwHyMrxKPHQtjruzrk/emwyXseUBhio1IeUYEBbjaBUYxm7PHXUnxWoKdMKtM
 +v4oSVCgSxykKSFZb1UcwAePQGd35OwU4mrHFgQVErxqCTjmylv+y76A9tarabG057arG/44zPU
 ts7+Qlyo8yRhpgg+38cCI7MEWtFuddQf9hv2PO71hDuittyND3TfDRs7Ek3mDVVHg/zynK4E71S
 qruO22rNXLHUC6WyaOPPGrq9CGccp4Tqgi2aR/NcWkhDuTyuFK9kG/9Zxi66nF5sx30yjzgh5bL
 WxAsjC2AX+Sr/utVwFmLkiFj1BbLQdNnifyaS4GL18zyU4zbwEdUxAf4LEFvRhXDp7YtWrQTnec
 pFbEfDFhztnTLsV6mPzC+Rgpa3i9UF0+AYal3JhHwwuC3fJ7aY0+d2FqHvSU97aYliZ+o9taaxt
 6CvNvIw1cvkB8lUUvKsSu9FoU9ykzkx6RwxHw=
X-Received: by 2002:a05:620a:4015:b0:8cb:4d9b:6b48 with SMTP id
 af79cd13be357-8cbc8d6f18bmr181036185a.6.1772165109938; 
 Thu, 26 Feb 2026 20:05:09 -0800 (PST)
X-Received: by 2002:a05:620a:4015:b0:8cb:4d9b:6b48 with SMTP id
 af79cd13be357-8cbc8d6f18bmr181033285a.6.1772165109483; 
 Thu, 26 Feb 2026 20:05:09 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a10a30d9a9sm1563193e87.52.2026.02.26.20.05.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 20:05:08 -0800 (PST)
Date: Fri, 27 Feb 2026 06:05:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/msm/dsi/phy: rename DSI_PHY_7NM_QUIRK_PRE_V4_1
 to DSI_PHY_7NM_QUIRK_V4_0
Message-ID: <2n6kr37xbovx77o43nk2j5fuktbes5v3itsiw3lzk5wxupfkb7@lces3sokaonr>
References: <20260226122958.22555-1-mitltlatltl@gmail.com>
 <20260226122958.22555-3-mitltlatltl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226122958.22555-3-mitltlatltl@gmail.com>
X-Proofpoint-ORIG-GUID: At9kSzr9U-kJXf_RdJl7r46lTKtXbneC
X-Authority-Analysis: v=2.4 cv=Vtouwu2n c=1 sm=1 tr=0 ts=69a117f6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=CDaHCIWj6aTna2qagqwA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDAyOCBTYWx0ZWRfXyqjD+uOXwiMS
 2kjuZqAMkrFmOA1vlUpn364wOBc7mIXHrInab4XYlIiKgA72gvmtaP+jMF5FTKqq+i2p9S3cN3p
 ihlDKcMDhKFWAmmwIxGrifJ6fmhJkq3C1TXvNsEiuAFrfl+TSUNqoliUxSL57qAIFFVJ9m6U3Jd
 6n6HBi8lOYly1NQBia7Piil4tzpxGyAxTpQWb8aWhWRj/d5sixpKb3lD9Jbv+/kJDz96uir5Z0i
 7VLL7yZ7JuKB+LK9572UlwaKB5jJFp4wtrip8HTryu5acEJpD+UHSQ5SrgFYwocO6BP9q6OiZz6
 mV0CV426MJ6lZahG7YR1XIm+oQ/nyuRs6UkgEdl2zadfSEXoXoJgHR9GV11x89MLrGeYzhZkp+l
 ql2H7DAviz91KN9U77Mv0TXFuxwsp4tubNh3BmvAB39NctayR44fpazpSSb8otzQxPX02vvF0FV
 t3yLhhLKnXS1xQLFASQ==
X-Proofpoint-GUID: At9kSzr9U-kJXf_RdJl7r46lTKtXbneC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_04,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270028
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:mitltlatltl@gmail.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:broonie@kernel.org,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 73F931B27B3
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 08:29:58PM +0800, Pengyu Luo wrote:
> The quirk flag DSI_PHY_7NM_QUIRK_PRE_V4_1 is renamed to
> DSI_PHY_7NM_QUIRK_V4_0 to better reflect the actual hardware revision
> it applies to. (Only SM8150 uses it, its hardware revision is 4.0)
> 
> No functional change.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
