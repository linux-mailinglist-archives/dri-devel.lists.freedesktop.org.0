Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MrKMtYvpGmBaAUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 13:23:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9ED1CF91C
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 13:23:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC0BB10E1B0;
	Sun,  1 Mar 2026 12:23:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="B+i/Ng1D";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FRKp3X5+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40B3F10E1B0
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Mar 2026 12:23:46 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 621AULEw2980283
 for <dri-devel@lists.freedesktop.org>; Sun, 1 Mar 2026 12:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=1d0h/Uwo1zhNWczg072b8+Bm
 Yb6n6+VhKt9sy84aK1s=; b=B+i/Ng1DlEgCjReLm8Fiwu8AW0yj2WgE6gsvdO4+
 FHurx2foSnpryzKHl9enYZgeMvhcLXZiHDWVlycEH2Gqbmtts1mVzORQuUbD3vDx
 gn4Zt5xWCpExAYsUMdBmLj5498hqai5n73kdmmWbD8ORstdd0j3lpimovTFyYel4
 0inMGKPuJhDQdWMfemUEtNDUAWN9LkJ6BCE+uUDYHIai9/FZLzJOwKHLv837463M
 R4tmXKHWRT/g0r3XVtN6BY+SiYRrHyDYa9I8tHhcxYFyvCrXJou70O/WiOjdYmSW
 /WbbH6s8+arMGHAyVfb9Ka97rbiBehP/j9rg8giOqv7bIA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksf8jps7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Mar 2026 12:23:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8cb6291d95aso4408319085a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Mar 2026 04:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772367824; x=1772972624;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1d0h/Uwo1zhNWczg072b8+BmYb6n6+VhKt9sy84aK1s=;
 b=FRKp3X5+b9rfstyC9OLzc+2+MjgAC8TxkjQjqQItRNnzjAfRIlBMRxvcj9jdZTV0J5
 8RVeK9jQMfZaT6Wm8fNWsMPPJyK9EvZiTmzLwHgNBUtQg8KyLzvlC6BmLX6ASW0tid+5
 mXzl40BaPOCUjxPBgduIWaGODi4jTIDsSuJaWtOPyuQoxsp8wDF10lOOqeQRLya7G4Qy
 SnXzFXsYxtTvz7OE11dUU6RvZbLonH7506leOpoO01nWP86Uv0vTs4kRKLmrJe6LTxYn
 U+lNs8k1ymgcVePXe1hmyV8P5ozVvA+ZiTbNFXdOkluv+uBvdAIq7+besWTHYyg8sFHF
 JVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772367824; x=1772972624;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1d0h/Uwo1zhNWczg072b8+BmYb6n6+VhKt9sy84aK1s=;
 b=QNEZTW5FAin7ZzCYZtBvFp7FVDbHRno5Ds7jXGTdLZNW5ajKxn1ZLf53gzKzxZOm2O
 WyXQRsR7wMqdP6XR1ZqEgACbrrFqsjLfBRPPbOafRiFRiIY+RMJ0El3oGLH9s4aLw4K9
 gb3/5/grffNtf43Es7Ou5P1df4NPZELTHztTIGO6gmPJhDrHDJ5gUs05XJRDpFPnQ2aW
 v9YjWTTYYKdxfh6P1sPymUGr9jXfom0sqJ9V7pngUQELL6HtFxR0dDeZ9s4zc9Ne8iW6
 vdZhXjHKucqMMAyis1VeqYoVx5qiGf2dhO2aC8GV8BMZuhmcWSHDUE59oUjaE38POG6p
 Gemg==
X-Gm-Message-State: AOJu0Yz69US0UvVUqzIQ0uaX+h4DVBcL4rVjIKv5AIq/t6STqJJ4R/za
 zKAT2tdxaoTw1JXlPikhWvISpk6UjqvJzULzgz9/Zy4VTiER6EYTRKY6oz47rWZGYF8e7Y9lyw2
 23AGB4E/Y7QXS7d9pTQDifPZ0Sg+bBXSHbqyoL+C3+Z/y5RS/wkXl0v0SqmdyHYzVpwhlSaQ8I5
 vSLRk=
X-Gm-Gg: ATEYQzwq5q7j2IA/1gxG3/LDmOEOJ+Jq41y1vOGavj3FR1D3ytp6OeTk/jDaM8rHW41
 0hTY+b8/2Wm9WkG+WPq1IJqjYOb8A2S9M6uj0TcaWMfX35BWtdpJhRYrwegYFPlAdnKHOyTofeC
 tBBw6au93fMQMCRyn03g7prEUmW5ynAMva6QRayvpltWNJWmuo+Rjeexu3+BNdh5m5kJcrdRSNE
 vl8wWQ1SmXCaY5gfG8sgzlW3KKLli9YHzb7Fd+FGMihQwmE5u1eklGiqTH6FfXDRLnyMDkJJyAY
 OH2K3hwWL3CreJyEwO8/1CjY67hU/KcfiLENBKwDExUPxekdkhuHeaknywzb3mKRpN0LYsrApMu
 /vOcyEVnHpmpjV1SeBdBXfiqXi3nohb8iObYf0AJxQ01K2qVYqoRvl6L3F2FNucDwSHsNJCMi/n
 9f8X1RjojzSbbsbXjeKgg/h+vwqY1UZK1ZdnA=
X-Received: by 2002:a05:620a:d89:b0:8cb:b062:c2f1 with SMTP id
 af79cd13be357-8cbc8dee51emr1128486685a.29.1772367824386; 
 Sun, 01 Mar 2026 04:23:44 -0800 (PST)
X-Received: by 2002:a05:620a:d89:b0:8cb:b062:c2f1 with SMTP id
 af79cd13be357-8cbc8dee51emr1128483785a.29.1772367823944; 
 Sun, 01 Mar 2026 04:23:43 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a115bd5a7csm1030134e87.37.2026.03.01.04.23.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Mar 2026 04:23:41 -0800 (PST)
Date: Sun, 1 Mar 2026 14:23:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
 lumag@kernel.org, robdclark@gmail.com, robin.clark@oss.qualcomm.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 valentine.burley@collabora.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] drm/ci: add sc7180-trogdor-wormdingler-rev1-boe
Message-ID: <hnlupswfdkrzv45y6jl5x5u25zp2k642z6ordzthqbdw4azhxb@6gz5hx4dcujc>
References: <20260224081036.220820-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224081036.220820-1-vignesh.raman@collabora.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDExMSBTYWx0ZWRfX10OoVeFFnsEI
 qFIZN0bvsaXKnYMUrZIzit99+OEEyGbiSDwV4xKVnh7nz9j+AP3OqhexzP+GhKufjSkXYustoDi
 sFYxmy4Guf4RWYfhULS8hB745b+5noANKhPGMTbfFAFqw9wQjMBOVmxkZfeaGS99qwWATD7WRnS
 DG09js3ilCulkZNdesykvTNsTIG/nLZf4zFYaQME1r/aPt79ARYrr8t49c0CLVuIodsmGmlr8P8
 yNteKWeG4tNrRGRp38NTgEiSzWdaVRAcScr8BSdmlqje0s/gkKBcyfhUfonDe7QK4VOcuIDZofN
 jifPzDStD8TT605sPSBh2sa8Lm2Yjmk9ktM48KTPCq7fRjJ2vvcR7ZmsFOfqxJq6/iRCj+TB8cr
 JT6IbVspsiFISX57RdN7Rc8TPEcqhVLsCyNlglIEfBkJDXYzAWszns+FygOyb2Lyn5CdS4bLpJB
 8BGP1z62F5r+/VhltLg==
X-Proofpoint-ORIG-GUID: sRlmmfhX6jPcnu9_NhRb66TD4ceEJGjb
X-Proofpoint-GUID: sRlmmfhX6jPcnu9_NhRb66TD4ceEJGjb
X-Authority-Analysis: v=2.4 cv=I5dohdgg c=1 sm=1 tr=0 ts=69a42fd1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=QX4gbG5DAAAA:8 a=DQB7qGAGv7oAOIdkHEkA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Vxmtnl_E_bksehYqCbjh:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603010111
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
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vignesh.raman@collabora.com,m:daniels@collabora.com,m:helen.fornazier@gmail.com,m:airlied@gmail.com,m:simona.vetter@ffwll.ch,m:lumag@kernel.org,m:robdclark@gmail.com,m:robin.clark@oss.qualcomm.com,m:guilherme.gallo@collabora.com,m:sergi.blanch.torne@collabora.com,m:valentine.burley@collabora.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:helenfornazier@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,collabora.com,gmail.com,ffwll.ch,kernel.org,oss.qualcomm.com,vger.kernel.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: CF9ED1CF91C
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 01:40:34PM +0530, Vignesh Raman wrote:
> Add job that executes the IGT test suite for
> sc7180-trogdor-wormdingler-rev1-boe.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v1:
>   - https://gitlab.freedesktop.org/drm/msm/-/merge_requests/221
>   - Depends on https://lore.kernel.org/dri-devel/20260210071138.2256773-1-vignesh.raman@collabora.com/
> 
> ---
>  drivers/gpu/drm/ci/arm64.config               |  4 +++
>  drivers/gpu/drm/ci/build.sh                   |  1 +
>  drivers/gpu/drm/ci/test.yml                   | 10 +++++++
>  ...180-trogdor-wormdingler-rev1-boe-fails.txt | 23 ++++++++++++++
>  ...180-trogdor-wormdingler-rev1-boe-skips.txt | 30 +++++++++++++++++++
>  5 files changed, 68 insertions(+)
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-wormdingler-rev1-boe-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-wormdingler-rev1-boe-skips.txt
> 
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-wormdingler-rev1-boe-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-wormdingler-rev1-boe-fails.txt
> new file mode 100644
> index 000000000000..4af93eeeaf99
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-wormdingler-rev1-boe-fails.txt
> @@ -0,0 +1,23 @@
> +core_setmaster@master-drop-set-user,Fail
> +kms_color@ctm-0-25,Fail
> +kms_color@ctm-0-50,Fail
> +kms_color@ctm-0-75,Fail
> +kms_color@ctm-blue-to-red,Fail
> +kms_color@ctm-green-to-red,Fail
> +kms_color@ctm-negative,Fail
> +kms_color@ctm-red-to-blue,Fail
> +kms_color@ctm-signed,Fail
> +kms_color@gamma,Fail
> +kms_color@legacy-gamma,Fail
> +kms_cursor_legacy@cursor-vs-flip-toggle,Fail
> +kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
> +kms_flip@flip-vs-modeset-vs-hang,Fail
> +kms_flip@flip-vs-panning-vs-hang,Fail
> +kms_invalid_mode@overflow-vrefresh,Fail

I don't see this failure in the logs. If it is removed, then all three
failure lists (and all three skip lists) are the same.

> +kms_lease@lease-uevent,Fail
> +kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
> +kms_plane@pixel-format,Fail
> +kms_plane@pixel-format-source-clamping,Fail
> +kms_plane_alpha_blend@alpha-7efc,Fail
> +kms_plane_alpha_blend@coverage-7efc,Fail
> +kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail

-- 
With best wishes
Dmitry
