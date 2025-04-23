Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF47A99658
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 19:18:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5338F10E21C;
	Wed, 23 Apr 2025 17:18:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IekQLsG2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9654910E21C
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 17:18:50 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAt7J4017255
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 17:18:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=WDO88YLi7hpWsK2u0hPMTkEs
 gQvBzxRt+jPQGFOJ+w8=; b=IekQLsG2extxrqNLyKp5XBR0b6EvA524PJBBBKYR
 QEBc7W2dgxFPPFKocappfMI17JugezOKVFv1q0i5PgtRgi3QQD4sr4mXJof7uQV+
 +H7gEpHRlszCWegkZlyi1qRH01EnHuY+sanHCurwJmDK78nCF1Tlqs+du0HigG/h
 FJM6lFGCFvCvcLxMC9pkdZrV4ygOaX82rZHQQmgSNk1Blzuoad+mdywya3erwOwp
 XfgMlca6OU8lkgJuq98ORSXj3mvY0pFHyLF3b1L0m21EGgV/4bPtotEmyzjhx6Gc
 fgHLEZwGrIjzZ5jreKSGsLFHhwuxKEK81OdNKpObQCZSBA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3jvmp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 17:18:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5cd0f8961so16739785a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 10:18:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745428729; x=1746033529;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WDO88YLi7hpWsK2u0hPMTkEsgQvBzxRt+jPQGFOJ+w8=;
 b=McHkFOABwoWiy3kXos3+5/AccGKKG7bEmV4uW/Zl8Yn6FwAANWXw8dHB7DMK11HT/D
 aS4k8n6d6oSNY82N61ibJkxogSLxUTbf78ip+6awytSILpueXbfMnGnLCCwJnhl+q8nV
 xOAjk85MrXRgQg3888F7NlXoWWhhxUQ92zgWTxF8NNrG29Y9tvcuPi/s5Wk9gooo50iL
 bD0KjkEX/CqGZUdNve8/q9T1JvaF6eplpjvV0FrgKzN1SLGxzLVTX8cmXiW8rSRhF40W
 xlzOllsf9Yd9qmWUPimAsboQUOWCKMwxvo5e5XbP6DsAzTfAoTcG7kkR4ITzDAHgi3mJ
 qz7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUK2KZ40QC+jinPzaJ8J+ZkMqPY5VuG0EurR55gv8wuNwnDUsHvRABNbNQcabgnbWLxGIOGzrHcxZo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwE4x+PCiSzsoYakZ08X9k0HF2nTd92yfDhdnBkLCV8EGjpIt+e
 kOan5RMZ1HZsz3Wj9cYY+M717KOOrNCh+josOz8S76P7n8gGc+ND3gfpIvEaYbDsBStHg8wmmj3
 pVm9NZNUUTrQhSbMUEzJ68SY8R6GYb2+QXmrBpLyjpVZXXosvxu+Rqj1h/SCIVdIz9kk=
X-Gm-Gg: ASbGncvjE59fl68E2jtQ7NekuTlPX2YRzwlO2yy898sUN/mveWsKfA1aiA3gWriSUrD
 MoZVFT0KrZcdIymqey1HS7ReB2x1R+tvuMW5TW+46r0u2f8/VlAYNhBPAosQF7Xk6x4Ln2hasAG
 QVM2hT+zxh0nRyvwtJWH3rD5LK66ExdK5rmLUFB3vCyErje6CmbJd6YRGEMi3EJ7rTnuxWTAGXJ
 9OcauCyjigPxlnN91yiFYv9DvC9CXVw9dwxzy4iVVM4uMAE0GDSbH5Vx0VInRAJQcTPsVZmHtIL
 mtybIVlRaZ/cTUTuIFbvxNfChjxQxNhtCOG6ALE4g2iMTzoOiD6IXS4ttPzujQYw0d4OORYmJvg
 =
X-Received: by 2002:a05:620a:199d:b0:7c9:2612:32d6 with SMTP id
 af79cd13be357-7c92805fbe9mr3542964185a.48.1745428728626; 
 Wed, 23 Apr 2025 10:18:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4YRFe2I2adKtjK/DTqagD31VvQyfxBA06e/fj1CyPoBrdGi/d4dL6lTARcuXkFMIqRSCSow==
X-Received: by 2002:a05:620a:199d:b0:7c9:2612:32d6 with SMTP id
 af79cd13be357-7c92805fbe9mr3542959585a.48.1745428728212; 
 Wed, 23 Apr 2025 10:18:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-31090826cafsm18525361fa.69.2025.04.23.10.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 10:18:47 -0700 (PDT)
Date: Wed, 23 Apr 2025 20:18:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 Damon Ding <damon.ding@rock-chips.com>, Arnd Bergmann <arnd@arndb.de>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/rockchip: add CONFIG_OF dependency
Message-ID: <a4tcrxepuvvxixpab3txz6tdbh6janiedjqddl2ybfo6plhjcl@r5bxdabuhjep>
References: <20250423164422.2793634-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423164422.2793634-1-arnd@kernel.org>
X-Proofpoint-ORIG-GUID: kluC3mwX5AEDC3B-mw740auUos_322Tw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDEyMSBTYWx0ZWRfXzZgKGfdoZyKP
 95H2f//7ylI2QeNaALFkAaC0zhDRnYlYJnnACEmTkoTiyMC2yT7gtUmcMA+76fvgQsZdC5OjgTe
 JH1qqAFGJIqJFwBYCxoJgCa7rEPuC77mqc9I93Danb0KlVuhHAE2uE0gySr2JkR2V5ZaJMACIm2
 6KuIlLesdiz0lDjYFFvBHHFFbMPv48S4ivxQdaJYagEdMxovTBjIXcTTTZbppDACqtFKIQDpJWI
 wIi4/mhHEKr7dWQxwkCIIRgnk27w2eEqT1vzQRk+peLg9wcdvDcniZnwxVOTVrMzEnX47G3CRBR
 Te4j6nrV+PPzNR4yEjHBKMdkO8vO2ibjArVbUmXvKZRQt/DHNrTQJ83OFUJNMwqCfqZZVaJxAiN
 Uzbyj+O3ecY5fEaveg+1rgFHWp+1hW+qb9rsKYKPvgiehNvbP02rYel8pAYsOkxaklsPJL85
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680920f9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=8SeTOrC02ZtG1eAnSgcA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: kluC3mwX5AEDC3B-mw740auUos_322Tw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_10,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230121
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

On Wed, Apr 23, 2025 at 06:44:16PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> DRM_DISPLAY_DP_AUX_BUS cannot be selected when CONFIG_OF is disabled:
> 
> WARNING: unmet direct dependencies detected for DRM_DISPLAY_DP_AUX_BUS
>   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && OF [=n]
>   Selected by [y]:
>   - DRM_ROCKCHIP [=y] && HAS_IOMEM [=y] && DRM [=y] && ROCKCHIP_IOMMU [=y] && ROCKCHIP_ANALOGIX_DP [=y]
> 
> Rockchip platforms all depend on OF anyway, so add the dependency here
> for compile testing.
> 
> Fixes: d7b4936b2bc0 ("drm/rockchip: analogix_dp: Add support to get panel from the DP AUX bus")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/rockchip/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
