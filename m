Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sD8lBJqfeGkorgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 12:20:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B28069385D
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 12:20:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1157410E544;
	Tue, 27 Jan 2026 11:20:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZOmoAHbz";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LgcG84Ka";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F7A810E548
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 11:20:53 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60R86v9c621204
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 11:20:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QHcqP74r9VhaV5/cZgET4JduR2x2H6zcTZIlVplq3nc=; b=ZOmoAHbzG7TQYghP
 Q/+fbofrkL7z1l7f55oU9lCHS5tFUbwHxZdoNe8x2Autw64GNBVGPZfGheI2QSXv
 FLteKO5fStxqgUtuFGTqtUmc3bhwpXiwUTAZq+eiWL9XCEl7E9oBmFcwcII/R3A1
 XIXCwti6ZrVikX3lgE3m+BnoMabUKfRhd6rX6vphMzGx4wHMLshJAZJClrQDYRtc
 V9wdwul5Zz53ucOdClomE9fcqt3xWzzcwLuJR/aoXdZY0kjqRw8azEK/efE5heiY
 9HP7tGuOK4teYFXiS9Y1Hx43Up5X4TKZSsUszoo+KyiOSAcSekrY+FTAMewIDm0c
 ocgIsg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxsjegmcg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 11:20:52 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id
 71dfb90a1353d-5662a8e87a0so6568948e0c.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 03:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769512852; x=1770117652;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=QHcqP74r9VhaV5/cZgET4JduR2x2H6zcTZIlVplq3nc=;
 b=LgcG84KaZPT3q5Eep+sBrDDX5X23Vgw4gwvRUTjRcITxbVw8JQdBWWHU3qFeRJClGO
 ebV00+AOMpaJrnEHjEUhPE6E6qwrh6ZJZNDTTTa5FDf3qis2saW2EB0X7iRYH4Akku+6
 q3ddMhaOode/FNbfSfFJ7makH+HtpfoByupTgsHGh3KhYmXxygmuot3yF4efoHbHpLIy
 DiwRKP2QV6d+MpEUG4FUYYg7jGWP0h6aGdFb8a27rYlwXuIFEX7NP3K49xDJMJUNdoq9
 /ZlYgkuopEUvD3TfXU+t84EAA4aUO+dOlE6M+STOHMf0EJdTY/ALqXyARAwiJSKxen6U
 qCjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769512852; x=1770117652;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QHcqP74r9VhaV5/cZgET4JduR2x2H6zcTZIlVplq3nc=;
 b=vULx8qBSR8mPjvRUA0yZBOLInenx/RtywpkmNmgbSdcMnLdcvH/UyUD/4oWJxJ740D
 tGRdMABnO5aFGnik3j+euV9b4LjjY8kQ/FUgEed4CrO1KGbFEuEhDfiOnJf/dcE0WbUv
 RzEHsSIhdiNs4XDQNUHbJwmQJzaMKmZTUuie26PSOU/9Ozal/6th2VuH24ZCBvUBmqDk
 AMz+Uzr8PMduIVf5rEQfquEHMx/dgI30X6N2AXzUgv8AHdOg4lPlFIQgK1gmdirH4vvH
 Ym4QVEBDmDzF1CaB0MMhXh8S42NxBNAf8XOL/Q+cR+OkZAWW2cWWGQ/J0Sgz3jF8tOjg
 HDXw==
X-Gm-Message-State: AOJu0YxjX+woRjUfJZGg8LCHr0HiWcf5KkOogBsvIidBpMI1bZJ2dqNp
 KAROgcs1JuBSKTStg0JO/DeDv8C7xE5OsADr68Lz6RNkTnHuYTuAQ7rSA3dciDo1kGE9Q4D4NRX
 UFfTGmxn8G/v8DX+THabszYwSpLV+zvm5l++OK/U+f47tjA59uvwFoVPFm6vJWhr8OjY4048=
X-Gm-Gg: AZuq6aKyh1/LXw2Rdnzmcwib9z0j7WyHYnsoJ2nYoWDGq3qVih55aOe9CTXw7KBGP23
 NH7q6CtN7g2W/FI/aECrAvPg2U1GXVMbdAkx78XSt8HvHQlO/8lZNMF6vd3MzSkgfJjYtA9d1uX
 JCEJd9RRFHxfKDf+2+1nLnBtXyMywPn+d1WFo3oL5OYTcxl4LoRF9jSxPLjG5RpsAic6wDSA1zd
 +/R9ChGuGmm8H0ELZnkin6Z4K/fzLbpBOw1xA9F14TIcqWPLHg2DpYqRMjUILyhGiVbiuqjuS0K
 suDovOZWI8d8JS0AYCgKF+l8VdOxqBlmV4RS9Dd5mAkYBdWx7C5bnaPSV5m+tcVXCWFH2BZcF9h
 KSc/LK5XRn1CZcBF7z3M7tfeujWjEkn4kusa/eJwbGWQ7lpgvIBxnRxsjfBd29yeFn4UtnecirF
 47X25wb5BRkMNnVsyXvUPFSsI=
X-Received: by 2002:a05:6102:291f:b0:5f5:35bd:6fb3 with SMTP id
 ada2fe7eead31-5f7235d4e59mr521460137.5.1769512851679; 
 Tue, 27 Jan 2026 03:20:51 -0800 (PST)
X-Received: by 2002:a05:6102:291f:b0:5f5:35bd:6fb3 with SMTP id
 ada2fe7eead31-5f7235d4e59mr521455137.5.1769512851297; 
 Tue, 27 Jan 2026 03:20:51 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59de48f0259sm3368696e87.45.2026.01.27.03.20.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jan 2026 03:20:50 -0800 (PST)
Date: Tue, 27 Jan 2026 13:20:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
 lumag@kernel.org, robdclark@gmail.com, robin.clark@oss.qualcomm.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 valentine.burley@collabora.com, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/7] drm/ci: reduce sm8350-hdk parallel jobs from 4 to 2
Message-ID: <ftkgk4xevcfe4dyx2pqi3gk3bqm7jcv65qvn3ypgrwls5dyx3m@srsgbmsteifw>
References: <20260127104406.200505-1-vignesh.raman@collabora.com>
 <20260127104406.200505-4-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260127104406.200505-4-vignesh.raman@collabora.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5MiBTYWx0ZWRfX/HkZMfMoCV5v
 bwz9mUDIVZyAbd3GrHCKJXBAE8gXfb0iIyvDM3mPjO2UF/kRBR4iSn231qBVah0uHQk3QS3n1Uk
 yti7PMw2RKhCqQ5tCh+EO+pVNQz7s1aVmMiikIyo2aQxciq0ygS2B3EGUXbbNl8ekjtrXZab6xY
 etiT9MZozyCSGa+SeA3H8tZiZFp96E5SWwhlxAQmXVj+U76wtTwtj0GFrmk/3POwg6mjJdRf7Wj
 7Gf+uBY44b11FtZmnlVVKvd3qd4zhAGnnRWS0pJFY6EVufB2+M68p5HuDNvF3pKFGlHMZe2rXG8
 i6Oku++/RPPEloApae7IfyPofwySHoC0zF8vbPpZfCBahKR0n70QeWLjw3EvwG1BcQQYyT81QiO
 l1bVGNBbuAKpwiNREaIadMx4XBIfUrNUV+Yxbkl2x3hhxcwjri2W9/evIS6SztV1OA55GUgTwEM
 sWryQlqigwy/f4eSYig==
X-Authority-Analysis: v=2.4 cv=Qelrf8bv c=1 sm=1 tr=0 ts=69789f94 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=_49z0RMimKR0Jg0_r6oA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: tLrti-ndylUmU9aGTEfcxHW5Nvq8qRO3
X-Proofpoint-GUID: tLrti-ndylUmU9aGTEfcxHW5Nvq8qRO3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270092
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
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vignesh.raman@collabora.com,m:daniels@collabora.com,m:helen.fornazier@gmail.com,m:airlied@gmail.com,m:simona.vetter@ffwll.ch,m:lumag@kernel.org,m:robdclark@gmail.com,m:robin.clark@oss.qualcomm.com,m:guilherme.gallo@collabora.com,m:sergi.blanch.torne@collabora.com,m:valentine.burley@collabora.com,m:linux-mediatek@lists.infradead.org,m:linux-amlogic@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:amd-gfx@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:virtualization@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:helenfornazier@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,collabora.com,gmail.com,ffwll.ch,kernel.org,oss.qualcomm.com,lists.infradead.org,vger.kernel.org,lists.linux.dev];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: B28069385D
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 04:13:58PM +0530, Vignesh Raman wrote:
> The sm8350-hdk jobs are short and each test takes around 2–3 minutes and
> the full job completes in about 10 minutes. Running 4 parallel jobs uses
> 4 devices at once, which is not needed. Set parallel to 2 to reduce
> device usage.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
>  drivers/gpu/drm/ci/test.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
