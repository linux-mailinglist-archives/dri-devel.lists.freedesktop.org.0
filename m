Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C25B28EBE
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 17:07:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0396A10E108;
	Sat, 16 Aug 2025 15:07:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="o49DVN3h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B359E10E108
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 15:07:06 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57GEFRcT000923
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 15:07:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HPARjqGQEXADRJTy3T66+FgY1XO3Wy0tKELjyBfIFxI=; b=o49DVN3h2y+E8+/N
 RF33OV/8hsHg35oiB2mjstGodiwKhSw4TRfBa4lmMm730v8rWtX7CoQ0RPe3rePc
 9L1u7ZYgIzjkIqf5VSVi5vGCwj6YduVSKFa9xeCJ9d3dUbxvdyLNm2exOc6WTS0w
 RCIJ21ez2tyHsl8yBKItvo/pUUDUfG0I14m0wW28CBkLF+38qUR+VPrjN4FJTx+3
 4AkJy/1ewV9KUwzAlJDdxSwyvyg5w/HW47fTmcj+gdEXowBIXAxOpBZVK8ETYFJ5
 UuDI9bbqxbZirKzScLVk3lsw8DUzfhUt0vieLJwPIf3TD0SMzs7YDLflDJKmpW7W
 4dYapw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jfbn91vu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 15:07:05 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70a94f3bbdbso59058126d6.2
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 08:07:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755356824; x=1755961624;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HPARjqGQEXADRJTy3T66+FgY1XO3Wy0tKELjyBfIFxI=;
 b=i0BM9M83xqUppUxQplr2eYuLjYyEPjO+2olmS5E44eMfVloQ/+g+iWx20zM5n24Qav
 kL+X/QaJRR6CNbasyVMlhb4YZLTTxafT2B8sZQ8IKFzqoLOtCisS2yU8YlqOiMk0MYiE
 Nx4nza0YU9GtHawgIZrsedboKgG0fwbO98M167qB6LKg532PLyl84/QiH/U2Lf3Rnsog
 7CCJxtnRc/XDyNoiD0rblRU51425sM/yY8tdFFZBOzpwZ9UDRf+hMZOKN2+Q2G1KkBIl
 oQRKGkekvnELnygdUfXFbGLBg4A9GAqSrFb/y9nrQEumAwB3JoVGIYXd4xvqecCp3To6
 NjEw==
X-Gm-Message-State: AOJu0YyU/H9FUrs7tvDggL+AMNPp9GOMz4+pUKg38o4h3s32UGNWf+Dd
 SmJ1UJWPdS4EsUNBmZ0JcFcVEYs4Et3goEJ25/yBtcnTX6r2+UU3HYbP/RVrSPDgqxuU+dCAUyC
 dgQy2dvl8WvVykvfU7WEJvgfNNHbWBpcHTZBQYpUyMNq4hAxtgLTaDGBvsf2e66sgl1be4hs=
X-Gm-Gg: ASbGnctrjReV4I095GGnOAScRh5ob93/AU7D467ZTSErppk65AfI7kWBKm/rP5ArFgD
 Uh7ji3ShHt9iH7MxD8DV1a7yvFaGPo2Ozl8/OC4SZfj99jVMQgBwdmCQwttiwYRgZ/LQZ7IXxwx
 6vcoLKLqsmlMW8mHRMzo5N0FAY5vuJ2Js/ro8833FhGzdYOn8nSSh6wuMMp9apRdI9lwenC07To
 lLPWRGMvo3fbyk/2sforN92rJY3U/4VTHPSlnWsTie2uwLu6C/hhxm6qgMkz+x1M3G7PSujFe2C
 IxeTZogHHgZhEKnjzpZwAvGEnpQlt5c2NqmMCFM1HIS46pi8x7C6TTQs+3l8PDAdaIpgNyTMAC/
 fCBHa8ihf9AX4BuIHCiwNaxmwrjyatcBcrPs4YIVmsdy8arRn3stD
X-Received: by 2002:a05:6214:5286:b0:709:b6a7:6226 with SMTP id
 6a1803df08f44-70bb061f4acmr41921236d6.34.1755356824562; 
 Sat, 16 Aug 2025 08:07:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGteGpeN0SYzXGMbCcsQLJ69y3P3FVG661/6VvE2NCO2IH44COnPW6Js0Ei0+mI85s4HgD/Ww==
X-Received: by 2002:a05:6214:5286:b0:709:b6a7:6226 with SMTP id
 6a1803df08f44-70bb061f4acmr41920436d6.34.1755356824080; 
 Sat, 16 Aug 2025 08:07:04 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3340a604194sm10403571fa.50.2025.08.16.08.07.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Aug 2025 08:07:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: display-connector: don't set OP_DETECT for
 DisplayPorts
Date: Sat, 16 Aug 2025 18:07:01 +0300
Message-ID: <175535681533.1839975.1951145166123046642.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250802-dp-conn-no-detect-v1-1-2748c2b946da@oss.qualcomm.com>
References: <20250802-dp-conn-no-detect-v1-1-2748c2b946da@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAwMSBTYWx0ZWRfX9V3/1eiYMhJE
 GLe8pQc3W0i0xNMAj76N0mgPTH++JReF73XZIoNRt/RR+h92pWgk7GAW/Tfz5UAbF6muhU8UDVZ
 /33hcf6BCtAdHFdhMKY3D64I9OncExavQwdC5gBAUDo7LG85Lq6bfMmspN8zs0bdyG2HecblgLH
 vKUcb7FUWqFw1jjfDemr+vAl1qpsPvcdSD0lPfhDt6jLqQ9S6vffM2Rsd2/YYeMSyhYtIVPWL49
 DGraodXBCqO6vevtW37sc+JAwaWISonlb4xOzo6wynQMo1gEOCxiqHgDPhcmCoMka4N4sDGeqMe
 s+t58OrZxfM4k5Xh3JKjUmlsIR8nBICI2D2MfcLIjBS12XJzlDHvxgy4chdBoi3c8qvn6TLvcyp
 lJMpdaj3
X-Authority-Analysis: v=2.4 cv=A+1sP7WG c=1 sm=1 tr=0 ts=68a09e99 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=3LZpj7SCskOl_Lh2xeoA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: VlFPTAiC8eU0Iy-BSKDldH3xGBSMG_9l
X-Proofpoint-ORIG-GUID: VlFPTAiC8eU0Iy-BSKDldH3xGBSMG_9l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160001
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

On Sat, 02 Aug 2025 13:40:35 +0300, Dmitry Baryshkov wrote:
> Detecting the monitor for DisplayPort targets is more complicated than
> just reading the HPD pin level: it requires reading the DPCD in order to
> check what kind of device is attached to the port and whether there is
> an actual display attached.
> 
> In order to let DRM framework handle such configurations, disable
> DRM_BRIDGE_OP_DETECT for dp-connector devices, letting the actual DP
> driver perform detection. This still keeps DRM_BRIDGE_OP_HPD enabled, so
> it is valid for the bridge to report HPD events.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/1] drm/bridge: display-connector: don't set OP_DETECT for DisplayPorts
      commit: cb640b2ca54617f4a9d4d6efd5ff2afd6be11f19

Best regards,
-- 
With best wishes
Dmitry

