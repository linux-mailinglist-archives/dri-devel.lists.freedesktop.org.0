Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AE7A75BA4
	for <lists+dri-devel@lfdr.de>; Sun, 30 Mar 2025 20:03:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B123810E340;
	Sun, 30 Mar 2025 18:02:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="R21EayuK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C2A810E340
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 18:02:56 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UHRqbI014430
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 18:02:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qlaN7asJ193Fv+MWu0+aw75zEOU6L/Dd+AbBmRtY93Y=; b=R21EayuKxRFlQ/v5
 z8rgfFYBWcq/B3MBLeCi+vWKR8ldpTUF0l9O9c6/3eabxszkg1ATPOqv+U5NViIC
 EdWcGqrtK2iqV4vHMP/8rzESZpc/Hkdhs4em9l8em5trodfgrNX5CW/ma4+37fN6
 4C+3aCj+DfbvhU5SKrLS94Z4KOboCKXVHXj+1iLTG4UpipWiu5Fp7AOAp4wrB90D
 9KUozjJ8qrR5BDIsl2t6pHQlNyLkixG7jN3q8fCjPvQY03zGGfPe3WPpOc8Dj927
 FaT/e9g/Zs3gtpc2ozvUM+/ic5tFfM70e9c/D0OO0M5DM1JKXaHZf/i22PjhEFmO
 JuEtMA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p67qauvy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 18:02:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5c9abdbd3so375388685a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 11:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743357775; x=1743962575;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qlaN7asJ193Fv+MWu0+aw75zEOU6L/Dd+AbBmRtY93Y=;
 b=nRaY1p4Tirfhat7idk+F/cRnnG7WaXf5azyClQ8KjuMApsoSDYEMKJlilE7sEpPnBS
 aedJL5AhjvZmPJlJssEOu1Dmc4iuwOzu84509f3FJNhWZUu1iKjELyb+74xSt8vQ+dBg
 sT0SuFM87HMBVkBxSgVs1k93yTXING2SqxM0V9BHC5GZ2574T0MvfYO4Xsyokc0Cp+xN
 br4xlFOFUJD8B+BhYQRiE9qSHqBN3cOh6O45RyYoRTtJ6v/FG67z7OWe6z65IcbtyHBf
 pGmU6HrVjr1/gnLla7Szp19HhK7BAf75wl7xkmLkfsSNDdZmYt2SYac04cGodYLpz7bg
 IGlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpxdlCbwpkZVLWJ0WnPuT7DTt6Yb6NxCGmNpz9ol+zlu1QgNQ/0KAWWxn/diCh9v4aWOvIGVF6JHs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz35h7dwtTzeS26usQ9gARotA9yhfpAgOhsk40M8FnhrIcDlmMf
 LuzdnsqFJ/otDaVZ9fA7NL3BLtSWLTR2NL4jKm8fblvr/1HNPk68OOu33666vpafwnbHirOI/Wa
 zk2vWBHSQ6fNhCIRag+Wtngqvfqd2g9Iev0UhGACnWnjCFuPwiou+ti8H/mUE1/es0CA=
X-Gm-Gg: ASbGncubzlgOqRPrCSP4n9x5W5C3PozI3/Zn6ZqIzAdTJDS4fr7hsid2oyUAWybNMFD
 3bOTZswsR7ktuliuBGOgU3LJ9ry+izx4LDUgNqB+utUsH2I0zuSwT8GKhMMq2+YatTN0YL1RBff
 161obP5mLqNJGhuWTN8xHimoRzIPpZW2ImU5R/Z0n99I1Nb1srlba6hIENetVQOkovYGFUOiXSF
 kjonpgaGgotp8FPSNHTrx8AFOgUTOW5BSnipZHkdrm+BAjUrvtIlB28spQ0AN4hF3pFvLSrARJL
 gtQ7iLZLkUu95OMnxnS6MmvMBSsQURH2kUCSfmtGzANJYsMMi0eYgar7aVkcj4i7Pns=
X-Received: by 2002:a05:620a:400e:b0:7c5:65ab:5001 with SMTP id
 af79cd13be357-7c69087ddd9mr654774485a.39.1743357775280; 
 Sun, 30 Mar 2025 11:02:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAPYhkOOkZUjy6KYQuyGJsfsTPEhDTKBmuQ5FBkrMVqvE17ds8QzCwlgbwULJxX9LUBjkjwQ==
X-Received: by 2002:a05:620a:400e:b0:7c5:65ab:5001 with SMTP id
 af79cd13be357-7c69087ddd9mr654770985a.39.1743357774924; 
 Sun, 30 Mar 2025 11:02:54 -0700 (PDT)
Received: from eriador.lan (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::7a1]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54b0e78f29csm703408e87.113.2025.03.30.11.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Mar 2025 11:02:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i2c: tda998x: select CONFIG_DRM_KMS_HELPER
Date: Sun, 30 Mar 2025 21:02:49 +0300
Message-ID: <174335776562.2565584.12345735704248581476.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250324210824.3094660-1-arnd@kernel.org>
References: <20250324210824.3094660-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fMI53Yae c=1 sm=1 tr=0 ts=67e98750 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=Wyn_QxJju8WABout-1IA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: vdUioO2CKDA4FcLrWBoa5p9KZhsPLShP
X-Proofpoint-GUID: vdUioO2CKDA4FcLrWBoa5p9KZhsPLShP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 bulkscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503300126
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

On Mon, 24 Mar 2025 22:08:07 +0100, Arnd Bergmann wrote:
> This fails to build without the KMS helper functions:
> 
> x86_64-linux-ld: drivers/gpu/drm/bridge/tda998x_drv.o: in function `tda998x_detect_work':
> tda998x_drv.c:(.text+0x4e6): undefined reference to `drm_kms_helper_hotplug_event'
> x86_64-linux-ld: drivers/gpu/drm/bridge/tda998x_drv.o: in function `tda998x_bind':
> tda998x_drv.c:(.text.unlikely+0x33): undefined reference to `drm_simple_encoder_init'
> x86_64-linux-ld: drivers/gpu/drm/bridge/tda998x_drv.o:(.rodata+0x584): undefined reference to `drm_atomic_helper_connector_reset'
> x86_64-linux-ld: drivers/gpu/drm/bridge/tda998x_drv.o:(.rodata+0x590): undefined reference to `drm_helper_probe_single_connector_modes'
> x86_64-linux-ld: drivers/gpu/drm/bridge/tda998x_drv.o:(.rodata+0x5a4): undefined reference to `drm_atomic_helper_connector_duplicate_state'
> x86_64-linux-ld: drivers/gpu/drm/bridge/tda998x_drv.o:(.rodata+0x5a8): undefined reference to `drm_atomic_helper_connector_destroy_state'
> 
> [...]

Applied to drm-misc-next-fixes, thanks!

[1/1] drm/i2c: tda998x: select CONFIG_DRM_KMS_HELPER
      commit: 85a063b8b281e144ed96463936fb4e6b3d4fe9e4

Best regards,
-- 
With best wishes
Dmitry

