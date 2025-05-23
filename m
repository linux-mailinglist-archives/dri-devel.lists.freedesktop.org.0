Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3059FAC2B32
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 22:58:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5801D10E853;
	Fri, 23 May 2025 20:58:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tj1TlwU2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 237E810E853
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 20:58:54 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NDFYp9027699
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 20:58:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +PG1nY6nmcmywooCS6OocVe2p4hgyCLtuWCSLyVZc7A=; b=Tj1TlwU2bFMG6bHf
 rpuggWVXicBpRSLbksa4y2VTQm47ycIIPhR0LDameUs6eolBcMen8eujuejpsfKl
 g7uUlp+/VI0HM8xvYqKlGEZamE7/TMFxBBSsd+3tj3FjCuKuL/1gCzRj9aSe9Ga7
 Eu5mFLbnvMIYRoEAHZ4tQI/rAbeeor3Sx+/qOC4iIvi9TGHXWo5az2ESxC3G2lf1
 OpRZ+ITtkTSfYUsNvXsBrbQoEmyf6NK4JygYTtmC1HZbzES93YQ1TAANgc0awpBJ
 pI2kJAe+LP6CVVgj1EacVt2AawJLHkC44zMfT7yFiq6/RP/pMVSHnUG4RBjGD/dP
 9V+Djg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9k145-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 20:58:53 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6f8b2d2fef5so4401936d6.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 13:58:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748033923; x=1748638723;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+PG1nY6nmcmywooCS6OocVe2p4hgyCLtuWCSLyVZc7A=;
 b=tMmMXNE+92JoDvhVipbRUyI5uinp5NkZ5Jpnmv83o2ImQiCf/RjMGcrHWy0X7bVpow
 Z2Ex6dIDPu9TqpCki80SXgMOQSPpsoTEfR7DA/H/UePzb3tjNTVRZJ+1BDFygOswDIhA
 wkwSRiXcQ47VDkC/oMD5T3fZWFFV9JwAY1NWRzyo870O1oLX/wEsCl+VbkS4i5KIx2l4
 1fCCxa/owzavAMOKH0o/CrLA2TyWdelr/1QRTHRBrjiWDiaZRtTT1kJs2jsfsoRm3nTI
 Rho0//6CzoRKyU/oE+9mNEro0bfw8pKJzAyDZFyBkJKC6jWspJWed+e9FeY9YSbANXv4
 SkvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSA4Au3BArIQqoCzCFnc74/pMW+eIQ/NhjuBFZTNqn3r9anL6l9Q6idmvsWcAkdCHjxL/bS50ojcI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPEq8nUh+F8yniRPxOGwEw4jnaPJqmSypgjhQl5Ka/HliORArr
 xbbjYT6qaoJqIeKd6ArRRkH6ZIcsUTTUG2ujsTtEDsL9+5NMACmn4+BDFNcRVPLeRj2L+2kDnsO
 H6TlTg5g83dR7j7aNACZ2EfyL/FtE+TbAP9elbq6EgUJ8wMs2cTR6YMyAZoj2mT7DpgMg4L4=
X-Gm-Gg: ASbGncvmKUV0GEzMzemNgOXcYY3eV+6D0w5ylAHre03GRLVQ1I3i5QddmLfK1jnIdVu
 KghyhX//e/gCIsckhs55i36xVYsXi0X2bwRSWqw48Lt4LJ6iaV5T3Yi6xg4lKIW/ienQvKUrLPQ
 th0rsbSOU8ggE30uv47g9wrUiSxaNHDlxQvaBQq3qP6vzvFDcCO7jGpVt3iWxYotfDsG4Qjut8R
 Nzj8biZjq7NzyIjOK1zi2Wrhp/E2WuqTJWwZhVHeyTRvRbKMdOMZv89sLeLHzlr6omtqwyVW5dA
 mDNk589GW079teOcoLOMorIFOb0mowWef6xNmpbubJOvBRsihIUO+tqbZRwY1H0mh3WGUGf4d4s
 4uHgIWmWG1vawSp6NzeyTsAox
X-Received: by 2002:a05:6214:21c4:b0:6f8:9b78:1bf6 with SMTP id
 6a1803df08f44-6fa9d142a39mr13406726d6.18.1748033923564; 
 Fri, 23 May 2025 13:58:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpPJU3Dz3JV1lZv8KpLRwysM3EM8AjoGOJPp7HAfxm+IuiaTq9yBMCZWfKIiYqCOklhONbLA==
X-Received: by 2002:a05:6214:21c4:b0:6f8:9b78:1bf6 with SMTP id
 6a1803df08f44-6fa9d142a39mr13406316d6.18.1748033923215; 
 Fri, 23 May 2025 13:58:43 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703f859sm4039146e87.242.2025.05.23.13.58.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 May 2025 13:58:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Danila Tikhonov <danila@jiaxyga.com>,
 Jakob Hauser <jahau@rocketmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panel: nt37801: select CONFIG_DRM_DISPLAY_DSC_HELPER
Date: Fri, 23 May 2025 23:58:41 +0300
Message-Id: <174803391440.3670773.17140482624435282913.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250523121127.2269693-1-arnd@kernel.org>
References: <20250523121127.2269693-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: nfImLznvOVryoOJMqJcIvHozjBYavky2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE5MiBTYWx0ZWRfX2+/nNTzD8d7c
 PfAF4iLRGMbsXEBoEmTpSZm3kjJOnya6tG3tHknXBfw91eqrjfPMlPvSGLhS6egOFISeMJj8fwk
 FSm0gDo3OCeCox8D5H7qDe1aNrGdx/tr0k96dyYc+1lLG1jENtUPc7/WpgF3sYaqPMNdnWslP+z
 cOK7YUg+OGe3ytasNhedUUWcMDKj3sSFIJHnCPm3kSSAzSCC+8lAcg9JRUYR608o4Z6662OILjd
 qgytSpIOpkkiVk+x8UHX2yfxL4sgCqiGhYQPcrWPA0Fn6gf9VvEqoNcuVuspVxZazRxmd+fwZ6m
 Za3+Cr0+8lktsl2N/1t3MCfM63zrhdJUL9KLCd3xAzqcygdNGAh/U48Q3PXMXz/vBPAYcgLMHPH
 223VaGNePK8kagb6yA3jqiS/Pvqc+jVI9lTfrnXjFEtC3B/1+q83ulypsg7042d+SPPwFpu3
X-Authority-Analysis: v=2.4 cv=GawXnRXL c=1 sm=1 tr=0 ts=6830e18d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=irnscpC_bN6KN00xGVgA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: nfImLznvOVryoOJMqJcIvHozjBYavky2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230192
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

On Fri, 23 May 2025 14:11:22 +0200, Arnd Bergmann wrote:
> The newly added driver uses the DSC helper module, but does not
> select its Kconfig symbol, so configurations are possible that
> cause a link failure:
> 
> ERROR: modpost: "drm_dsc_pps_payload_pack" [drivers/gpu/drm/panel/panel-novatek-nt37801.ko] undefined!
> 
> 
> [...]

Applied to drm-misc-next-fixes, thanks!

[1/1] drm/panel: nt37801: select CONFIG_DRM_DISPLAY_DSC_HELPER
      commit: 022546cdbf26ec6f42af7e2706702d5703df42f6

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
