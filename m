Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B36CB2900A
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 20:10:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 943E210E1B5;
	Sat, 16 Aug 2025 18:10:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="c5uOmo2z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FE3E10E1B5
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 18:10:15 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57GHmJK2002347
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 18:10:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yG/G6lh/LkLzYMzmLYWhP7M0R2CFgcnZp3gBKe/dYFU=; b=c5uOmo2zL3aYWINV
 r+B23iDZpKXfr5koKdNCLqhb5d6I3/OIBVZaczgLorcADkkWicWoEIB+xkj+93ZY
 2bOA2jSlHNSxMZ8v6avDSD06YSokhtdc9w39v2zNkyxY7BniElApNMGwPSkrOdHa
 kF7FNlLI1V3pzXqP3L8qkQF1uUP1vUXvGYm6LSwc0y/LnBxh1b0J2g+QbP0dxWl+
 DrzsviT51qVM7yRNc1Gh+u/HcrA6/ohJQI7I0XY7kBWMkGeZAxCX7qAlbNRDH4Me
 0hMgnBIokoxyaZNzUGw+BQevW1yP3yznGlaGXnUccJu17DcE0cz+qstDZv0Oeuq2
 /vUf/A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jgxt9482-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 18:10:14 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-70a88dd0193so66262866d6.0
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 11:10:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755367813; x=1755972613;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yG/G6lh/LkLzYMzmLYWhP7M0R2CFgcnZp3gBKe/dYFU=;
 b=KpTEgcU6n+HJWCXzMPK840qoKPh79aZ45t23TgbhSH3cd5GWvjTIERg0bkz1EGUNny
 nek3hpSIWdkKaR3EWXYP8bCeNy/nJKRXEek26xHlQuw6UTCKZjcewmKSgwPRdRmoXja+
 2IH4B3v6CroDEXszJ5SfniPwx5tb3L39QDkarVjM8tML/Uy9EvxwCzT//iPRn66WDlDG
 IWWRjVBbAD96EiIzKHD6aiI592tI/5AGont7yDpSQFaZRkUGbB01CLiQSBGbJkxV/jga
 zAw0ktn4IT+E69hP8Vm5KC5WHe5MTlz5Dr4ltB5jMY1OTY4phjpS+K4TeUivpqwcpIyR
 kf4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1m2tpDWfYRVbHqEoHmCq378lwzcXqqvOd7I69lU6CgCxGabAMmONWX9jBiur7ImqSngCfh4PhMSA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSFGFXcAn93PMrs7OvXvU6MYmOvVgo6oTwzmRJ9z28oCLwRiIp
 lJroYKv/nXCGSv4oRyEjfPx2tkJpox8WL1D10rcoR6RFU9Na2/LktVRe2Nf74HPmnpL4Uinh4fs
 jKf6R5VB3JBtTc9kEpbed87iShwQIQJZOHI0qAy3qXb8+Gi8VNlOMpcA/i2KSUG5f4Tk99HQ=
X-Gm-Gg: ASbGncvKFqGpuPbKfPJ9XpGMfzeY7RnG8LQtuMW0tAVHFENpNgZNUaTUas6lXu+bRw2
 a7sH92HQjo+4jhJ8F4SLJutmRt5ppmN7smazih+5Qqmau4c36q300aKj70+kIABI1DtNj6yjj7w
 ZpyD3wp/r1sJz6QTXdVnIb0XX4Jpy9QhwY879KPpKkb1lMCNUVWvN0eO4O7ZBoeKR0cJGIEeH8q
 x7LB1kal+MAciHorQg4DPAjpPXpOAcsweZbHqxRdzjr2aKHCyjl6azGAeJUP1qFWhuZCghiFgp7
 X0xM6ft2L4LFJjjQXNzDClQvNn3ZA4PKJkudePPwz5Pwep1Z8CFMfBxwIPQS2Fo3mSiORAribpJ
 JvqIn/Ui8Djnr5yCxQOA8fRe1qkPrJMuO2PhmgMIZ30gDfQT/NhNd
X-Received: by 2002:a05:6214:2249:b0:709:8742:e46e with SMTP id
 6a1803df08f44-70ba7c4c918mr90662406d6.45.1755367813003; 
 Sat, 16 Aug 2025 11:10:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHudZQltT5VdvRVyB2pGZmQmIXYECsSOje+oqGK2LKNnDQrT0AibUgteBZaQiMHPZjvprKw0Q==
X-Received: by 2002:a05:6214:2249:b0:709:8742:e46e with SMTP id
 6a1803df08f44-70ba7c4c918mr90661716d6.45.1755367812367; 
 Sat, 16 Aug 2025 11:10:12 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef369abasm935429e87.63.2025.08.16.11.10.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Aug 2025 11:10:11 -0700 (PDT)
Date: Sat, 16 Aug 2025 21:10:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>,
 Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [RFC PATCH 3/8] drm: verisilicon: add a driver for Verisilicon
 display controllers
Message-ID: <eyfgdk6d2oj2tpw7vndxcn3jw5ib3h4sahghbe23xn4qvj3rr6@jwzuzjpihnlx>
References: <20250814164048.2336043-1-uwu@icenowy.me>
 <20250814164048.2336043-4-uwu@icenowy.me>
 <m7sg6sbc75lsnm6u6zppq574rtgt2rzr5hjmpwfwns2wnmmfs2@anbw5z7mo5a3>
 <c9caa122d57cbe3de3efee2de211d914c96eb0bc.camel@icenowy.me>
 <0a931bef23d8feb758f5a752ee84a4abaddb8fa4.camel@icenowy.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0a931bef23d8feb758f5a752ee84a4abaddb8fa4.camel@icenowy.me>
X-Proofpoint-ORIG-GUID: oLiz9ZuGzERceQP4rQC9gw7hexgOZQZU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX3Cvc2c+7i9vb
 l1UC5KWYfCBq5k+BSceXz3irzrKWIAs49OFtmpGrmzVPhxcP3cxLnyiDRuBLm5nziS+LhaniiO9
 e5j6+/c3XGpeaR0GwW7Qj+s1oHMV6pek6oEVxmnEeWpqZStkyCDYdo+YSOhtm9WSGI0XhziomLy
 /d5Iwnjbfjah7c+ZgecwDDR9ath1P6jBk7VvAPAqxzFV/dOjY5FSc0PNuCeHRnFR3sgQN8iS7o3
 cKMIBYAgqoSFRG1d3dPXqlHM1L28L6a7P27mxg4zFzUJIKIXaZ2forYPYTQdPhzkgVb+MpOCJ8J
 IriweD27D+qXa43i1ndF6xpcdOCYUYNqupuhJYGSVTEfV1ZnSNJA9XPlyWVybb8Kzkf//VGLg9M
 BWLUy3KI
X-Proofpoint-GUID: oLiz9ZuGzERceQP4rQC9gw7hexgOZQZU
X-Authority-Analysis: v=2.4 cv=V7B90fni c=1 sm=1 tr=0 ts=68a0c986 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=ss7acsNiZ-28_-SBEVcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160020
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

On Sun, Aug 17, 2025 at 01:22:07AM +0800, Icenowy Zheng wrote:
> 在 2025-08-17星期日的 00:48 +0800，Icenowy Zheng写道：
> > 在 2025-08-16星期六的 19:18 +0300，Dmitry Baryshkov写道：
> > > On Fri, Aug 15, 2025 at 12:40:43AM +0800, Icenowy Zheng wrote:
> > > > This is a from-scratch driver targeting Verisilicon DC-series
> > > > display
> > > > controllers, which feature self-identification functionality like
> > > > their
> > > > GC-series GPUs.
> > > > 
> > > > Only DC8200 is being supported now, and only the main framebuffer
> > > > is set
> > > > up (as the DRM primary plane). Support for more DC models and
> > > > more
> > > > features is my further targets.
> > > > 
> > > > As the display controller is delivered to SoC vendors as a whole
> > > > part,
> > > > this driver does not use component framework and extra bridges
> > > > inside a
> > > > SoC is expected to be implemented as dedicated bridges (this
> > > > driver
> > > > properly supports bridge chaining).
> > > > 
> > > > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > > > ---
> > > >  drivers/gpu/drm/Kconfig                       |   2 +
> > > >  drivers/gpu/drm/Makefile                      |   1 +
> > > >  drivers/gpu/drm/verisilicon/Kconfig           |  15 +
> > > >  drivers/gpu/drm/verisilicon/Makefile          |   5 +
> > > >  drivers/gpu/drm/verisilicon/vs_bridge.c       | 330
> > > > ++++++++++++++++++
> > > >  drivers/gpu/drm/verisilicon/vs_bridge.h       |  40 +++
> > > >  drivers/gpu/drm/verisilicon/vs_bridge_regs.h  |  47 +++
> > > >  drivers/gpu/drm/verisilicon/vs_crtc.c         | 217 ++++++++++++
> > > >  drivers/gpu/drm/verisilicon/vs_crtc.h         |  29 ++
> > > >  drivers/gpu/drm/verisilicon/vs_crtc_regs.h    |  60 ++++
> > > >  drivers/gpu/drm/verisilicon/vs_dc.c           | 233
> > > > +++++++++++++
> > > >  drivers/gpu/drm/verisilicon/vs_dc.h           |  39 +++
> > > >  drivers/gpu/drm/verisilicon/vs_dc_top_regs.h  |  27 ++
> > > >  drivers/gpu/drm/verisilicon/vs_drm.c          | 177 ++++++++++
> > > >  drivers/gpu/drm/verisilicon/vs_drm.h          |  29 ++
> > > >  drivers/gpu/drm/verisilicon/vs_hwdb.c         | 150 ++++++++
> > > >  drivers/gpu/drm/verisilicon/vs_hwdb.h         |  29 ++
> > > >  drivers/gpu/drm/verisilicon/vs_plane.c        | 102 ++++++
> > > >  drivers/gpu/drm/verisilicon/vs_plane.h        |  68 ++++
> > > >  .../gpu/drm/verisilicon/vs_primary_plane.c    | 166 +++++++++
> > > >  .../drm/verisilicon/vs_primary_plane_regs.h   |  53 +++
> > > >  21 files changed, 1819 insertions(+)
> > > >  create mode 100644 drivers/gpu/drm/verisilicon/Kconfig
> > > >  create mode 100644 drivers/gpu/drm/verisilicon/Makefile
> > > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_bridge.c
> > > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_bridge.h
> > > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_bridge_regs.h
> > > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.c
> > > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.h
> > > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc_regs.h
> > > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_dc.c
> > > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_dc.h
> > > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_dc_top_regs.h
> > > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_drm.c
> > > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_drm.h
> > > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_hwdb.c
> > > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_hwdb.h
> > > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.c
> > > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.h
> > > >  create mode 100644
> > > > drivers/gpu/drm/verisilicon/vs_primary_plane.c
> > > >  create mode 100644
> > > > drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h
> > > > 
> > > > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > > > index f7ea8e895c0c0..33601485ecdba 100644
> > > > --- a/drivers/gpu/drm/Kconfig
> > > > +++ b/drivers/gpu/drm/Kconfig
> > > > @@ -396,6 +396,8 @@ source "drivers/gpu/drm/sprd/Kconfig"
> > > >  
> > > >  source "drivers/gpu/drm/imagination/Kconfig"
> > > >  
> > > > +source "drivers/gpu/drm/verisilicon/Kconfig"
> > > > +
> > > >  config DRM_HYPERV
> > > >         tristate "DRM Support for Hyper-V synthetic video device"
> > > >         depends on DRM && PCI && HYPERV
> > > > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > > > index 4dafbdc8f86ac..32ed4cf9df1bd 100644
> > > > --- a/drivers/gpu/drm/Makefile
> > > > +++ b/drivers/gpu/drm/Makefile
> > > > @@ -231,6 +231,7 @@ obj-y                       += solomon/
> > > >  obj-$(CONFIG_DRM_SPRD) += sprd/
> > > >  obj-$(CONFIG_DRM_LOONGSON) += loongson/
> > > >  obj-$(CONFIG_DRM_POWERVR) += imagination/
> > > > +obj-$(CONFIG_DRM_VERISILICON_DC) += verisilicon/
> > > >  
> > > >  # Ensure drm headers are self-contained and pass kernel-doc
> > > >  hdrtest-files := \
> > > > diff --git a/drivers/gpu/drm/verisilicon/Kconfig
> > > > b/drivers/gpu/drm/verisilicon/Kconfig
> > > > new file mode 100644
> > > > index 0000000000000..0235577c72824
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/verisilicon/Kconfig
> > > > @@ -0,0 +1,15 @@
> > > > +# SPDX-License-Identifier: GPL-2.0-only
> > > > +config DRM_VERISILICON_DC
> > > > +       tristate "DRM Support for Verisilicon DC-series display
> > > > controllers"
> > > > +       depends on DRM && COMMON_CLK
> > > > +       depends on RISCV || COMPILER_TEST
> > > > +       select DRM_CLIENT_SELECTION
> > > > +       select DRM_GEM_DMA_HELPER
> > > > +       select DRM_KMS_HELPER
> > > > +       select DRM_BRIDGE_CONNECTOR
> > > > +       select REGMAP_MMIO
> > > > +       select VIDEOMODE_HELPERS
> > > > +       help
> > > > +         Choose this option if you have a SoC with Verisilicon
> > > > DC-
> > > > series
> > > > +         display controllers. If M is selected, the module will
> > > > be
> > > > called
> > > > +         verisilicon-dc.
> > > > diff --git a/drivers/gpu/drm/verisilicon/Makefile
> > > > b/drivers/gpu/drm/verisilicon/Makefile
> > > > new file mode 100644
> > > > index 0000000000000..fd8d805fbcde1
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/verisilicon/Makefile
> > > > @@ -0,0 +1,5 @@
> > > > +# SPDX-License-Identifier: GPL-2.0-only
> > > > +
> > > > +verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_drm.o
> > > > vs_hwdb.o vs_plane.o vs_primary_plane.o
> > > > +
> > > > +obj-$(CONFIG_DRM_VERISILICON_DC) += verisilicon-dc.o
> > > > diff --git a/drivers/gpu/drm/verisilicon/vs_bridge.c
> > > > b/drivers/gpu/drm/verisilicon/vs_bridge.c
> > > > new file mode 100644
> > > > index 0000000000000..c8caf31fac7d6
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/verisilicon/vs_bridge.c
> > > > @@ -0,0 +1,330 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > +/*
> > > > + * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
> > > > + */
> > > > +
> > > > +#include <linux/of.h>
> > > > +#include <linux/regmap.h>
> > > > +
> > > > +#include <uapi/linux/media-bus-format.h>
> > > > +
> > > > +#include <drm/drm_atomic.h>
> > > > +#include <drm/drm_atomic_helper.h>
> > > > +#include <drm/drm_bridge.h>
> > > > +#include <drm/drm_bridge_connector.h>
> > > > +#include <drm/drm_connector.h>
> > > > +#include <drm/drm_encoder.h>
> > > > +#include <drm/drm_of.h>
> > > > +#include <drm/drm_print.h>
> > > > +#include <drm/drm_simple_kms_helper.h>
> > > > +
> > > > +#include "vs_bridge.h"
> > > > +#include "vs_bridge_regs.h"
> > > > +#include "vs_crtc.h"
> > > > +#include "vs_dc.h"
> > > > +
> > > > +static int vs_bridge_attach(struct drm_bridge *bridge,
> > > > +                           struct drm_encoder *encoder,
> > > > +                           enum drm_bridge_attach_flags flags)
> > > > +{
> > > > +       struct vs_bridge *vbridge =
> > > > drm_bridge_to_vs_bridge(bridge);
> > > > +
> > > > +       return drm_bridge_attach(encoder, vbridge->next,
> > > > +                                bridge, flags);
> > > > +}
> > > > +
> > > > +struct vsdc_dp_format {
> > > > +       u32 linux_fmt;
> > > > +       bool is_yuv;
> > > > +       u32 vsdc_fmt;
> > > > +};
> > > > +
> > > > +static struct vsdc_dp_format vsdc_dp_supported_fmts[] = {
> > > > +       /* default to RGB888 */
> > > > +       { MEDIA_BUS_FMT_FIXED, false,
> > > > VSDC_DISP_DP_CONFIG_FMT_RGB888 },
> > > > +       { MEDIA_BUS_FMT_RGB888_1X24, false,
> > > > VSDC_DISP_DP_CONFIG_FMT_RGB888 },
> > > > +       { MEDIA_BUS_FMT_RGB565_1X16, false,
> > > > VSDC_DISP_DP_CONFIG_FMT_RGB565 },
> > > > +       { MEDIA_BUS_FMT_RGB666_1X18, false,
> > > > VSDC_DISP_DP_CONFIG_FMT_RGB666 },
> > > > +       { MEDIA_BUS_FMT_RGB888_1X24, false,
> > > > VSDC_DISP_DP_CONFIG_FMT_RGB888 },
> > > > +       { MEDIA_BUS_FMT_RGB101010_1X30,
> > > > +         false, VSDC_DISP_DP_CONFIG_FMT_RGB101010 },
> > > > +       { MEDIA_BUS_FMT_UYVY8_1X16, true,
> > > > VSDC_DISP_DP_CONFIG_YUV_FMT_UYVY8 },
> > > > +       { MEDIA_BUS_FMT_UYVY10_1X20, true,
> > > > VSDC_DISP_DP_CONFIG_YUV_FMT_UYVY10 },
> > > > +       { MEDIA_BUS_FMT_YUV8_1X24, true,
> > > > VSDC_DISP_DP_CONFIG_YUV_FMT_YUV8 },
> > > > +       { MEDIA_BUS_FMT_YUV10_1X30, true,
> > > > VSDC_DISP_DP_CONFIG_YUV_FMT_YUV10 },
> > > > +       { MEDIA_BUS_FMT_UYYVYY8_0_5X24,
> > > > +         true, VSDC_DISP_DP_CONFIG_YUV_FMT_UYYVYY8 },
> > > > +       { MEDIA_BUS_FMT_UYYVYY10_0_5X30,
> > > > +         true, VSDC_DISP_DP_CONFIG_YUV_FMT_UYYVYY10 },
> > > > +};
> > > > +
> > > > +static u32 *vs_bridge_atomic_get_output_bus_fmts(struct
> > > > drm_bridge
> > > > *bridge,
> > > > +                                       struct drm_bridge_state
> > > > *bridge_state,
> > > > +                                       struct drm_crtc_state
> > > > *crtc_state,
> > > > +                                       struct
> > > > drm_connector_state
> > > > *conn_state,
> > > > +                                       unsigned int
> > > > *num_output_fmts)
> > > > +{
> > > > +       struct vs_bridge *vbridge =
> > > > drm_bridge_to_vs_bridge(bridge);
> > > > +       struct drm_connector *conn = conn_state->connector;
> > > > +       u32 *output_fmts;
> > > > +       unsigned int i;
> > > > +
> > > > +       if (vbridge->intf == VSDC_OUTPUT_INTERFACE_DPI)
> > > 
> > > This kind of checks looks like there should be a drm_encoder
> > > handled
> > > by
> > > the same driver. Or maybe it's better to have two sets of funcs
> > > structures, one for the DPI, one for DP.
> > 
> > Well these functions used to be for an encoder, however I found that
> > encoders cannot take part in format negotiation, and at least some
> > source says encoder is deprecated in this situation and a first
> > bridge
> > in the bridge chain is better here.
> > 
> > A simple encoder is created by this part of driver, but all its works
> > are moved to this bridge, similar to what other drivers with bridge
> > chaining support do.
> > 
> > > 
> > > > +               *num_output_fmts = 1;
> > > > +       else
> > > > +               *num_output_fmts =
> > > > ARRAY_SIZE(vsdc_dp_supported_fmts);
> > > > +
> > > > +       output_fmts = kcalloc(*num_output_fmts,
> > > > sizeof(*output_fmts),
> > > > +                             GFP_KERNEL);
> > > > +       if (!output_fmts)
> > > > +               return NULL;
> > > > +
> > > > +       if (vbridge->intf == VSDC_OUTPUT_INTERFACE_DPI) {
> > > > +               if (conn->display_info.num_bus_formats &&
> > > > +                   conn->display_info.bus_formats)
> > > > +                       output_fmts[0] = conn-
> > > > > display_info.bus_formats[0];
> > > > +               else
> > > > +                       output_fmts[0] = MEDIA_BUS_FMT_FIXED;
> > > > +       } else {
> > > > +               for (i = 0; i < *num_output_fmts; i++)
> > > > +                       output_fmts[i] =
> > > > vsdc_dp_supported_fmts[i].linux_fmt;
> > > 
> > > memcpy(a, b, min(ARRAY_SIZE(), num_output_fmts)) ?
> > 
> > vsdc_dp_supported_fmts is a map of linux_fmt to hardware-specific
> > parameter, so memcpy won't work here.
> > 
> > > 
> > > > +       }
> > > > +
> > > > +       return output_fmts;
> > > > +}
> > > > +
> > > > +static bool vs_bridge_out_dp_fmt_supported(u32 out_fmt)
> > > > +{
> > > > +       unsigned int i;
> > > > +
> > > > +       for (i = 0; i < ARRAY_SIZE(vsdc_dp_supported_fmts); i++)
> > > > +               if (vsdc_dp_supported_fmts[i].linux_fmt ==
> > > > out_fmt)
> > > 
> > > return true;
> > > 
> > > > +                       break;
> > > > +
> > > > +       return !(i == ARRAY_SIZE(vsdc_dp_supported_fmts));
> > > 
> > > return false;
> > > 
> > > > +}
> > > > +
> > > > +static u32 *vs_bridge_atomic_get_input_bus_fmts(struct
> > > > drm_bridge
> > > > *bridge,
> > > > +                                       struct drm_bridge_state
> > > > *bridge_state,
> > > > +                                       struct drm_crtc_state
> > > > *crtc_state,
> > > > +                                       struct
> > > > drm_connector_state
> > > > *conn_state,
> > > > +                                       u32 output_fmt,
> > > > +                                       unsigned int
> > > > *num_input_fmts)
> > > > +{
> > > > +       struct vs_bridge *vbridge =
> > > > drm_bridge_to_vs_bridge(bridge);
> > > > +
> > > > +       if (vbridge->intf == VSDC_OUTPUT_INTERFACE_DP &&
> > > > +           !vs_bridge_out_dp_fmt_supported(output_fmt)) {
> > > > +               *num_input_fmts = 0;
> > > > +               return NULL;
> > > > +       }
> > > > +
> > > > +       return drm_atomic_helper_bridge_propagate_bus_fmt(bridge,
> > > > bridge_state,
> > > > +                                                        
> > > > crtc_state,
> > > > +                                                        
> > > > conn_state,
> > > > +                                                        
> > > > output_fmt,
> > > > +                                                        
> > > > num_input_fmts);
> > > > +}
> > > > +
> > > > +static int vs_bridge_atomic_check(struct drm_bridge *bridge,
> > > > +                                 struct drm_bridge_state
> > > > *bridge_state,
> > > > +                                 struct drm_crtc_state
> > > > *crtc_state,
> > > > +                                 struct drm_connector_state
> > > > *conn_state)
> > > > +{
> > > > +       struct vs_bridge *vbridge =
> > > > drm_bridge_to_vs_bridge(bridge);
> > > > +
> > > > +       if (vbridge->intf == VSDC_OUTPUT_INTERFACE_DP &&
> > > > +           !vs_bridge_out_dp_fmt_supported(bridge_state-
> > > > > output_bus_cfg.format))
> > > > +               return -EINVAL;
> > > > +
> > > > +       vbridge->output_bus_fmt = bridge_state-
> > > > > output_bus_cfg.format;
> > > 
> > > You are saving a state value into a non-state variable. There is no
> > > guarantee that this atomic_check() will be followed by the actual
> > > commit. So, either you have to use a struct that extends
> > > drm_bridge_state here or store the output_bus_fmt during
> > > atomic_enable().
> > 
> > In fact I don't want to save it -- the kernel is quirky here and this
> > value does not get passed into atomic_enable. I mimicked what other
> > drivers do. See ingenic_drm_bridge_atomic_check() in ingenic/ingenic-
> > drm-drv.c and meson_encoder_hdmi_atomic_check() in
> > meson/meson_encoder_hdmi.c .
> > 
> > > 
> > > > +
> > > > +       return 0;
> > > > +}
> > > > +
> > > > +static void vs_bridge_atomic_enable(struct drm_bridge *bridge,
> > > > +                                   struct drm_atomic_state
> > > > *state)
> > > > +{
> > > > +       struct vs_bridge *vbridge =
> > > > drm_bridge_to_vs_bridge(bridge);
> > > > +       struct drm_bridge_state *br_state =
> > > > drm_atomic_get_bridge_state(state,
> > > > +                                                                
> > > >   
> > > >      bridge);
> > > > +       struct vs_crtc *crtc = vbridge->crtc;
> > > > +       struct vs_dc *dc = crtc->dc;
> > > > +       unsigned int output = crtc->id;
> > > > +       u32 dp_fmt;
> > > > +       unsigned int i;
> > > > +
> > > > +       DRM_DEBUG_DRIVER("Enabling output %u\n", output);
> > > > +
> > > > +       switch (vbridge->intf) {
> > > > +       case VSDC_OUTPUT_INTERFACE_DPI:
> > > > +               regmap_clear_bits(dc->regs,
> > > > VSDC_DISP_DP_CONFIG(output),
> > > > +                                 VSDC_DISP_DP_CONFIG_DP_EN);
> > > > +               break;
> > > > +       case VSDC_OUTPUT_INTERFACE_DP:
> > > > +               for (i = 0; i <
> > > > ARRAY_SIZE(vsdc_dp_supported_fmts);
> > > > i++) {
> > > > +                       if (vsdc_dp_supported_fmts[i].linux_fmt
> > > > ==
> > > > +                           vbridge->output_bus_fmt)
> > > > +                               break;
> > > > +               }
> > > > +               WARN_ON_ONCE(i ==
> > > > ARRAY_SIZE(vsdc_dp_supported_fmts));
> > > > +               dp_fmt = vsdc_dp_supported_fmts[i].vsdc_fmt;
> > > 
> > > This might trigger all static checkers in the universe. It's not
> > > really
> > > possible, since you've checked it in the atomic_check(), but...
> > 
> > Sigh I don't know how to properly describe it...
> > 
> > I can only say something really bad happens if the previous
> > WARN_ON_ONCE is triggered.
> > 
> > > 
> > > > +               dp_fmt |= VSDC_DISP_DP_CONFIG_DP_EN;
> > > > +               regmap_write(dc->regs,
> > > > VSDC_DISP_DP_CONFIG(output),
> > > > dp_fmt);
> > > > +               regmap_assign_bits(dc->regs,
> > > > +                                 
> > > > VSDC_DISP_PANEL_CONFIG(output),
> > > > +                                  VSDC_DISP_PANEL_CONFIG_YUV,
> > > > +                                 
> > > > vsdc_dp_supported_fmts[i].is_yuv);
> > > > +               break;
> > > > +       }
> > > > +
> > > > +       regmap_clear_bits(dc->regs,
> > > > VSDC_DISP_PANEL_CONFIG(output),
> > > > +                         VSDC_DISP_PANEL_CONFIG_DAT_POL);
> > > > +       regmap_assign_bits(dc->regs,
> > > > VSDC_DISP_PANEL_CONFIG(output),
> > > > +                          VSDC_DISP_PANEL_CONFIG_DE_POL,
> > > > +                          br_state->output_bus_cfg.flags &
> > > > +                          DRM_BUS_FLAG_DE_LOW);
> > > > +       regmap_assign_bits(dc->regs,
> > > > VSDC_DISP_PANEL_CONFIG(output),
> > > > +                          VSDC_DISP_PANEL_CONFIG_CLK_POL,
> > > > +                          br_state->output_bus_cfg.flags &
> > > > +                          DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE);
> > > > +       regmap_set_bits(dc->regs, VSDC_DISP_PANEL_CONFIG(output),
> > > > +                       VSDC_DISP_PANEL_CONFIG_DE_EN |
> > > > +                       VSDC_DISP_PANEL_CONFIG_DAT_EN |
> > > > +                       VSDC_DISP_PANEL_CONFIG_CLK_EN);
> > > > +       regmap_set_bits(dc->regs, VSDC_DISP_PANEL_CONFIG(output),
> > > > +                       VSDC_DISP_PANEL_CONFIG_RUNNING);
> > > > +       regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_START,
> > > > +                         VSDC_DISP_PANEL_START_MULTI_DISP_SYNC);
> > > > +       regmap_set_bits(dc->regs, VSDC_DISP_PANEL_START,
> > > > +                       VSDC_DISP_PANEL_START_RUNNING(output));
> > > > +
> > > > +       regmap_set_bits(dc->regs, VSDC_DISP_PANEL_CONFIG_EX(crtc-
> > > > > id),
> > > > +                       VSDC_DISP_PANEL_CONFIG_EX_COMMIT);
> > > > +}
> > > > +
> > > > +static void vs_bridge_atomic_disable(struct drm_bridge *bridge,
> > > > +                                    struct drm_atomic_state
> > > > *state)
> > > > +{
> > > > +       struct vs_bridge *vbridge =
> > > > drm_bridge_to_vs_bridge(bridge);
> > > > +       struct vs_crtc *crtc = vbridge->crtc;
> > > > +       struct vs_dc *dc = crtc->dc;
> > > > +       unsigned int output = crtc->id;
> > > > +
> > > > +       DRM_DEBUG_DRIVER("Disabling output %u\n", output);
> > > > +
> > > > +       regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_START,
> > > > +                         VSDC_DISP_PANEL_START_MULTI_DISP_SYNC |
> > > > +                         VSDC_DISP_PANEL_START_RUNNING(output));
> > > > +       regmap_clear_bits(dc->regs,
> > > > VSDC_DISP_PANEL_CONFIG(output),
> > > > +                         VSDC_DISP_PANEL_CONFIG_RUNNING);
> > > > +
> > > > +       regmap_set_bits(dc->regs, VSDC_DISP_PANEL_CONFIG_EX(crtc-
> > > > > id),
> > > > +                       VSDC_DISP_PANEL_CONFIG_EX_COMMIT);
> > > > +}
> > > > +
> > > > +static const struct drm_bridge_funcs vs_bridge_funcs = {
> > > > +       .attach = vs_bridge_attach,
> > > > +       .atomic_enable = vs_bridge_atomic_enable,
> > > > +       .atomic_disable = vs_bridge_atomic_disable,
> > > > +       .atomic_check = vs_bridge_atomic_check,
> > > > +       .atomic_get_input_bus_fmts =
> > > > vs_bridge_atomic_get_input_bus_fmts,
> > > > +       .atomic_get_output_bus_fmts =
> > > > vs_bridge_atomic_get_output_bus_fmts,
> > > > +       .atomic_duplicate_state =
> > > > drm_atomic_helper_bridge_duplicate_state,
> > > > +       .atomic_destroy_state =
> > > > drm_atomic_helper_bridge_destroy_state,
> > > > +       .atomic_reset = drm_atomic_helper_bridge_reset,
> > > > +};
> > > > +
> > > > +static int vs_bridge_detect_output_interface(struct device_node
> > > > *of_node,
> > > > +                                            unsigned int output)
> > > > +{
> > > > +       int ret;
> > > > +       struct device_node *remote;
> > > > +
> > > > +       remote = of_graph_get_remote_node(of_node, output,
> > > > +                                        
> > > > VSDC_OUTPUT_INTERFACE_DPI);
> > > 
> > > This deserves a comment in the source file.
> > > 
> > > > +       if (remote) {
> > > > +               ret = VSDC_OUTPUT_INTERFACE_DPI;
> > > 
> > > return here, drop else{}
> > 
> > Well a of_node_put() is missing before the final return, and Yao Zi
> > noted me of it.
> > 
> > > 
> > > > +       } else {
> > > > +               remote = of_graph_get_remote_node(of_node,
> > > > output,
> > > > +                                                
> > > > VSDC_OUTPUT_INTERFACE_DP);
> > > > +               if (remote)
> > > > +                       ret = VSDC_OUTPUT_INTERFACE_DP;
> > > 
> > > return
> > > 
> > > > +               else
> > > > +                       ret = -ENODEV;
> > > > +       }
> > > > +
> > > > +       return ret;
> > > > +}
> > > > +
> > > > +struct vs_bridge *vs_bridge_init(struct drm_device *drm_dev,
> > > > +                                struct vs_crtc *crtc)
> > > > +{
> > > > +       unsigned int output = crtc->id;
> > > > +       struct vs_bridge *bridge;
> > > > +       struct drm_bridge *next;
> > > > +       enum vs_bridge_output_interface intf;
> > > > +       int ret;
> > > > +
> > > > +       intf = vs_bridge_detect_output_interface(drm_dev->dev-
> > > > > of_node,
> > > > +                                                output);
> > > > +       if (intf == -ENODEV) {
> > > > +               dev_info(drm_dev->dev, "Skipping output %u\n",
> > > > output);
> > > > +               return NULL;
> > > > +       }
> > > > +
> > > > +       bridge = devm_kzalloc(drm_dev->dev, sizeof(*bridge),
> > > > GFP_KERNEL);
> > > 
> > > devm_drm_bridge_alloc()
> > > 
> > > > +       if (!bridge)
> > > > +               return ERR_PTR(-ENOMEM);
> > > > +
> > > > +       bridge->crtc = crtc;
> > > > +       bridge->intf = intf;
> > > > +       bridge->base.funcs = &vs_bridge_funcs;
> > > > +
> > > > +       next = devm_drm_of_get_bridge(drm_dev->dev, drm_dev->dev-
> > > > > of_node,
> > > > +                                     output, intf);
> > > > +       if (IS_ERR(next)) {
> > > > +               ret = PTR_ERR(next);
> > > > +               goto err_free_bridge;
> > > > +       }
> > > > +
> > > > +       bridge->next = next;
> > > > +
> > > > +       ret = drm_simple_encoder_init(drm_dev, &bridge->enc,
> > > 
> > > Oh, so there is an encoder... Please drop drm_simple_encoder, it's
> > > deprecated, and try moving all the ifs to the encoder funcs.
> > 
> > Ah? Is it really deprecated? I can find no source of this
> > deprecation.
> > 
> > In addition, I think many drivers here are using a bridge as a
> > "better
> > encoder" because of the restriction of current encoder
> > implementation,
> > and I am doing the same thing. Either encoder functionality should be
> > improved to on par with bridge, or such dummy encoders with a bridge
> > should exist, and some helper for creating them should exist. It
> > might
> > be not drm_simple_encoder_init (because I can understand the
> > deprecation of other parts of the simple-kms routines, although I see
> > no formal documentation mentioning it's deprecated, maybe I missed
> > some
> > newspaper?), but it should exist.
> 
> I see some practice of passing NULL to drmm_plain_encoder_alloc() from
> the adp driver, however looks like this isn't always safe and on my
> test of this change on top of verisilicon driver (on top of v6.17-rc1)
> I got mysterious oops if the DC driver happens to be probed before the
> HDMI controller driver:

I think you can pass NULL for funcs only if you use drmm_* functions to
handle encoder. This way it gets cleaned before
drm_mode_config_cleanup() gets called.

> [   28.519454] [<ffffffff807d7016>] drm_mode_config_cleanup+0xc6/0x224
> [   28.525754] [<ffffffff807d75f8>]
> drm_mode_config_init_release+0xc/0x14
> [   28.532312] [<ffffffff807d5b8e>] drm_managed_release+0x7a/0x100
> [   28.538257] [<ffffffff807c6b9a>] devm_drm_dev_init_release+0x62/0x78



-- 
With best wishes
Dmitry
