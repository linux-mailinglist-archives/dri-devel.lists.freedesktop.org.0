Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44889CB14D1
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 23:37:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A741210E223;
	Tue,  9 Dec 2025 22:37:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NvFRfxI+";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BEi+rjqz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13E8810E223
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 22:37:49 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B9Gidpu055819
 for <dri-devel@lists.freedesktop.org>; Tue, 9 Dec 2025 22:37:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=RmYc9tivKNP3axoENaRa+NYj
 Ro7tGvb9FspT8p6Povs=; b=NvFRfxI+UkIwQKdft4+YkpqUTuusNi4zx/VmTic0
 Ew5zFEV6t+jMEzO8SnIA4K6itS16RrXdafpyX8u8b7oPV45S0iYAYycuA0nvC0sv
 hb/YV2TtCuIlJMaK/SlBlX/LnfNtBUIQiNOMu/Kp+3LYkQomHjqYkQzL371gsGsB
 0ZnPCtAll3VMmy+HQxNQSKkGNQxjhtwxYWr1c0aJAuDqDLQtRgs5lj+FhK6vv2a5
 BfK3XzZERSWWme0DirIgkuOBlwznltlc2zxZfvC/mksT5FlaUlwnSF2Bdd0KS8yI
 QCy9llDGL+37Fb28H+WsALPjR14mu84Iw0DNoOxW21FChA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axpx1954u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Dec 2025 22:37:48 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id
 71dfb90a1353d-559836d04dfso240369e0c.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Dec 2025 14:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765319867; x=1765924667;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RmYc9tivKNP3axoENaRa+NYjRo7tGvb9FspT8p6Povs=;
 b=BEi+rjqzxaKTpvzsHbgIDuoAr3g5XTcywkjs8GWBfuGe587gtv1N0SkYkDKCbnwvJn
 xltZ+PmDwri0xry9cM8xmIaeHa04Rxlrlib0aaONByTbepDy5ePwbHIQJfWyqIvKbSl2
 Nk0Ico0d4ykFqxAGBsg7IEwOltWTWW18Lv7gZk9wSclOyzs8vpmkHyJ8b1ECSXf4xnGR
 UO8BbOiNu1Ovu3ET1PuUtxI1qR/5btlaOWMzcG5dDJ/GWcjtKgW3pZ0O06BQZpAoemag
 ILjGO+dhVigtTCKrhXphZiJNHxBoMeAPBjW6bEtyoNVsk9m2gfPGuEB7hUpUQoNUKxwl
 zpXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765319867; x=1765924667;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RmYc9tivKNP3axoENaRa+NYjRo7tGvb9FspT8p6Povs=;
 b=HB2rYmbIDqMVko5x1V8yc+4F/6V9d3uYutqWB+TkxByys7XD0zRpDR6HBPMsQpc4az
 gLXZvIO6/lXnxt0Hk/vaOaXpXisGc+/Ir5jk0tuPYgMhZcP+Hhs5VpNnT5EecrDThsCI
 nLmEt8pNNJ5dYVxp0wlcAcCWDTkjLP9XNFBB/TApV3JZfOUk2tpsenP/z6+EbNhJN9Sg
 DyFmQpg2wbNtwSvCBIl2VOUT5tq8+mOFRMMdakATqk/0aDfVdvFLFlnj2NhzLc/GyECj
 weJtUfYtB08F7pvjTKwqq+Yf2WxhI0beR2DjAy1eMthUP7QyLfIbHYHSOG3Kr6Z8Hlsl
 rulA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6dv5Bgu1rz10btbbtfa9emaH5qC9huBbVV7V/RyLtCLlCQEqZoUMDUrg7vZHQa61y6L9dgV/ExIs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwojgkncekX8AOIJ7LC34YifGOhk2ro/9wVHoY6jctfmYwz4FU/
 Gb1ncglMNLOdtSlfmmSnyWv9QP27GHNPfdZtjcznxbNWzYDDDHwuVevyl8JeL4e+mupP6rzplZ9
 lYCnXENJx6kLNjSTAyTWgaUs11WT0vjXbATpm4AI8+GhrSfRgqc9ea+Y4rIwXquf3JOih+d0=
X-Gm-Gg: ASbGncsWoHXekXvYXtjDMTr+Y0Ez0uRZpAMC88YpwD4u5AtQLxm7u/gal2/33BbuQEx
 v8WTYAjYYdF57cZYu/ERfm9Bi5V3IquhiHt2pKSKpCSZLmbTZBuv8YSRq5DoQEIj+bndaNLTrYI
 NrMtO4s0q9j1J84MUWpQT8IGsBrwaEDVMzpJtaIq3G8HiJBnmQkrSpKR7Jnk3lrmSkvJfnJ+eQz
 DgQoyflz4OESoRV7kiYiWHBDF8Sg+9WLcAm3AsuCwxWJT0d4Rf65HakJMMX9G/lrtdllPiG0DCV
 Tsqzf501DbIjJWsPwG8u+O9LkyY5+g2qt37qG+nWa0FgiL4gn6yUTMSRw6KYPY3y+27cnmEhOZ9
 nLRgH8GgwUsPvTFnlSEpEu80YUpsAFnPWpPv0xwgDT29vBTMudI98Jm/w8713d91dtTuSW91NxT
 ki7JBFfbdLw/zd2L3IXFCAdxU=
X-Received: by 2002:a05:6122:20ab:b0:559:79d8:27a5 with SMTP id
 71dfb90a1353d-55fcf91f853mr240061e0c.0.1765319867454; 
 Tue, 09 Dec 2025 14:37:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTVjEvn8TnwQni6UudT4sjJRz6IdwOXl7bjJWPhCVAbIL5oohiYT+ArJUzEVrPPRTBvx1YPg==
X-Received: by 2002:a05:6122:20ab:b0:559:79d8:27a5 with SMTP id
 71dfb90a1353d-55fcf91f853mr240040e0c.0.1765319866970; 
 Tue, 09 Dec 2025 14:37:46 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37e7065b4b8sm49658941fa.45.2025.12.09.14.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Dec 2025 14:37:44 -0800 (PST)
Date: Wed, 10 Dec 2025 00:37:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Petr Hodina <phodina@protonmail.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v6 4/8] drm/panel: sw43408: Add enable/disable and reset
 functions
Message-ID: <lilbxguznfzupg2gpfb6xuj4ickffgtuwwlve5g4d22lzr3bsm@slkmhn4agvgr>
References: <20251208-pixel-3-v6-0-e9e559d6f412@ixit.cz>
 <20251208-pixel-3-v6-4-e9e559d6f412@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208-pixel-3-v6-4-e9e559d6f412@ixit.cz>
X-Proofpoint-ORIG-GUID: 55ZYlXbnibGoOqA7HUTYpEcHHEFDxq9y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDE3NyBTYWx0ZWRfX+m04Wu/S1J6x
 gN1RsH7jxuQ15VmtHQC1aKSSqZ5phMNFSMjk9fh6zZpcNDeffr35XXssbMWyYMxPB2r1IEhzu4F
 Zyk5WYt6jt2gSfzGL4ROeAXWHiu4hk0P4JS9lP9fDrZ15+4f3D2ghQdXndTE39owNHGYcPjMyj9
 f0hD5q1no1X2/ae2rwRTcrOtLCVwmREzb0JWy+cCYlPu4/2Ak6bQjG+ZKpWCN1opTUGXUHjguYU
 n8frVilj/mMKsni5I0d8r8SeGHWfRksSu2VRMJYRUBASa770o4fLxKey+BMuPWh58EQeDODh7oq
 Ltge2EyZM9JcxdfUNeL99BWX9YV4Fil83k5JFt9FpUL3UvWJqmDPoYwzKg/n9Gqhh42lhrfs3WP
 v1F4fvoRCSXqi5IJybCo5s097u4vqA==
X-Proofpoint-GUID: 55ZYlXbnibGoOqA7HUTYpEcHHEFDxq9y
X-Authority-Analysis: v=2.4 cv=Su6dKfO0 c=1 sm=1 tr=0 ts=6938a4bc cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Q4QeEDP4Y2U8xtt9THcA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090177
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

On Mon, Dec 08, 2025 at 10:41:57AM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Introduce enable(), disable() and reset() functions.
> 
> The enable() and disable() callbacks keep the symmetry in the commands
> sent to the panel and also make a clearer distinction between panel
> initialization and configuration.

It's not just it. There is a difference between commands being sent in
en/disable and prepare/unprepare.

> 
> Splitting reset() from prepare() follows clean coding practices and lets
> us potentially make reset optional in the future for flicker-less
> takeover from a bootloader or framebuffer driver where the panel is
> already configured.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/gpu/drm/panel/panel-lg-sw43408.c | 47 ++++++++++++++++++++++++--------
>  1 file changed, 35 insertions(+), 12 deletions(-)
> 

-- 
With best wishes
Dmitry
