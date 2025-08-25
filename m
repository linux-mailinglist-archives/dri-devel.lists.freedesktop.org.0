Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A48F7B33C5A
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 12:16:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A781910E41E;
	Mon, 25 Aug 2025 10:16:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fmgeo6O3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3793710E41E
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 10:16:12 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8HJ93006732
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 10:16:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=0lhsR71KkcIS8wNBPhBZe9mM
 MkgJb5Dic3dujxApeFY=; b=fmgeo6O3teZyGUgySaDpAkYKkjekQ3uPRhxt1ein
 4xMZdPF/+Sq+kF+5CZmc80a8Coq1GhXJJwnTKNHfmBWUJTSGnMaRhy/5mi5pL/aP
 uctdS1l3lnvF79uxFU3WdfdWmv6VI2mDq/6sCTn3O7Be5KgrepDKLKPKAncIX8ZE
 PVjKUJBo3sgoN/FliIlfE5vndA4QOpFcfQbv/NhFEth3aRGeFR91Qsls8smMKhMk
 gqVUnbCZJAH7o9zDFx6801jkyJHcoKIIaJZp1ARO+loyjic5QP6Y4jhQPhObYtdh
 dBngZXh16lI7o2PIdu/ztAKNMW7w2C5xAnum1ZDy8y3sow==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5um4s52-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 10:16:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b109c4c2cfso165891691cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 03:16:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756116970; x=1756721770;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0lhsR71KkcIS8wNBPhBZe9mMMkgJb5Dic3dujxApeFY=;
 b=KMrDeGX56nLWDpvntbV87R8n5ZmihBly3H1QjGT+CGk2gJaJkDRog8wZsdjPQpROjf
 ZZ0NZrurrBJrC30YR11MVSUflsM64EvsBwdULpWA8vvmyLAHr7FW+8YjCjmsmpCrHpO6
 3ZAlzohGr2Hk8+A8QxxiNpfJKNRfJNxDcUwgsNBszbeHn7mMm8hGVEVS7wL0CkcWXkrN
 9nwPUl4ERi7Ah/FfX1VMmd3dHF90q3IPIRUsx+gV1LUzFVSeZOMMdTEm5O4tB5zJ7u4u
 7lBaTOI8THYTITbIePvpdxsH1kYhFNzgmx8a5/jgG0oxgTZaHqw+5COVC6cR6Qwhgzvl
 52FQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUy8XU/SJ7JaDngpwIEQa+d444LuJYV/HiGux/EuuVPHaX/GZ9RDW8rZQH2LbSbpVKwvcJ2zAK5WzU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRUvx8lmjEfF9HsGoqnx6eDFijTCONTakP20REfMmqn/b71hWR
 fmlbRaepMt6Y4ROJZXjMMJmpsDz2+HeZdAGNw8v3JmYxqJ0pDVRDbeMs0zeURpI8W+z2IIE1CQr
 UlhrblQtlonB1lz8KrTNtdyNIQT9oE/gT2HxJw1boJCy5Gouwsl/j+JIXm9Art14BCHBLQkQ=
X-Gm-Gg: ASbGncsVG9kjrLEIi7NO+SymWBIMAP2voS8jX7I1IRctDQUJGpIBeXN+gIayhLkEWhD
 yvnopfTrBczblIAysqvgvPP4E0qBPZt9x1KNRdKrcpulP6I/BlgFIPPNLTg+7qLk57I+NsTPbG2
 mzZv6+hO7kfPnJLTxmUWvTTBFP5d9fwrfuJEall1dtDwcabpTm1g1sOq1fZgAfmvqtqRy2EyKhd
 nYC7hyk6MqJIwYp6u8Bnrci4UBJtTDT+4HjHSikS8tQY8MhmBhMp/sYq0+WYTLeSjfhCvCnlizV
 jvtVPos3NNEnNrR0CTI/KreS5/4RPaeui6es40Dh2gQj8FjntgU1ODaphd8/ehWkkg9m0HRfMQa
 J1ULp4wrDBCCJVrX3ptmw/VFMR2weXHi/0qNjknXIGG/vCZO9WJJT
X-Received: by 2002:a05:622a:1115:b0:4b2:8ac4:f077 with SMTP id
 d75a77b69052e-4b2aab8aca4mr145651331cf.73.1756116970319; 
 Mon, 25 Aug 2025 03:16:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBP8bbrhPwwi4dRXsomCDJ3dx5TCVrS2s2eHTccnc6AR1D3zpu4g5/lFfJzDG9qk1UiQwqEA==
X-Received: by 2002:a05:622a:1115:b0:4b2:8ac4:f077 with SMTP id
 d75a77b69052e-4b2aab8aca4mr145650931cf.73.1756116969712; 
 Mon, 25 Aug 2025 03:16:09 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3365e20d2aasm15513781fa.6.2025.08.25.03.16.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 03:16:08 -0700 (PDT)
Date: Mon, 25 Aug 2025 13:16:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Henrik Grimler <henrik@grimler.se>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, replicant@osuosl.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] drm/bridge: sii9234: use dev_err_probe where
 applicable
Message-ID: <eckjfjhs35nagljcjmzjmu7q2eaewvmdzavt3u62gma5xphbzi@7jfgheo5fmqz>
References: <20250824-exynos4-sii9234-driver-v3-0-80849e716a37@grimler.se>
 <20250824-exynos4-sii9234-driver-v3-2-80849e716a37@grimler.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250824-exynos4-sii9234-driver-v3-2-80849e716a37@grimler.se>
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68ac37eb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=ix-_PWS5aj9sFk0hK8kA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfXws+paJ/06Aje
 YF+vzUmToTWvkr+7WUpr+e5lDlBozU7/kA4FL2Y1xTnORvKHghJH4LaxxlcMb+pPnAltgbz0oki
 CTnHMF9kYKknviol3Q3XrLhLiH8Kx3qTHitdHBBNXxhBTSkIRgIVuEn18aMsRulU/TI7gRwI4bn
 /L4eS6g40tak7xHOkTaGppkVf2h3JHgLUV+S0PVuVmWke0tUUnB05iru2s67xVYIoXlPTqWhyYO
 9S216InizKTK/QPrjqQv2yv4GmYBMKRLF9qz7QErd2tny+L7u52H3fF4qdZFZj4ICcMzgwI1rJf
 bd9S//2koxq4WW5Uf4Lds/U+RGhfjiJF1d9PS+iS6BUVn0ZNpAsjXaBNaEbDj+DziUGa2ffxn24
 qf/jbPNC
X-Proofpoint-GUID: mVOp4fPGDmHleR_BNmpORVcVxy2GRm8Z
X-Proofpoint-ORIG-GUID: mVOp4fPGDmHleR_BNmpORVcVxy2GRm8Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_05,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032
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

On Sun, Aug 24, 2025 at 01:16:55PM +0200, Henrik Grimler wrote:
> In case of error during resource acquisition the driver should print
> an error message only if it is not deferred probe. Use dev_err_probe
> helper to handle this, which will also record defer probe reason for
> debugging.
> 
> Signed-off-by: Henrik Grimler <henrik@grimler.se>
> ---
> v3: add missing return in error path, spotted by Dmitry
> v2: no changes
> ---
>  drivers/gpu/drm/bridge/sii9234.c | 21 ++++++++-------------
>  1 file changed, 8 insertions(+), 13 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
