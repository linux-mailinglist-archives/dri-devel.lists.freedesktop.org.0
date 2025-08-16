Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F51B28FEC
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 19:45:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CEF110E02B;
	Sat, 16 Aug 2025 17:45:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pl3/dv75";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DADB10E02B
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 17:45:19 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57GHRssB009592
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 17:45:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TTqqSmw3aa8N+2jsapWesH0v6YHO0VL0gmw889vayhA=; b=pl3/dv75AjOdpiBJ
 7AlSD3qOIcatqoT56kAst3AdSp0qcPufyx18dvz4MZ3P8Jy/j7Uovu6zTAML1V/l
 XVB2dgcsCxMS6S1UOWOc9MGj5KCqaJ/DjPvaaMrLjaIfDDyEFHmhEq7ZctgOJjPI
 Z57yIjtjqg5G1p26Kpl1soqOHNh47QC/F8Su/YEvspwwujZK+AA0tV9Niy89Dt13
 ksKtx1z4N/RHU4jQju5c3khomJPw+pYhoVLjWT0GbrYazVD+FCJR1u85/B1ehlBj
 zOH1ND8tyzOdvhUPeosQFOGNshj/x2pcHeHS2ZOuYaQxQziXrNGPgCWbMs2Ws9xz
 5h5j9w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhags1st-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 17:45:17 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-70a88d99c1cso63176286d6.0
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 10:45:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755366306; x=1755971106;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TTqqSmw3aa8N+2jsapWesH0v6YHO0VL0gmw889vayhA=;
 b=uI1dY9z4wP1QRVVwNttXI5L9XUESqnHmI272gWSLSmD/fIXzBL7sMusze2C32V+Jq9
 uVHTTMqPz0ICvgzW3p68r8hXGchocnaLP8mR2ewxzThB/DOP29gPVfbspt74FfFIpgbf
 HkGrQHeIqe4DGLG8Tvj+HtugoEhSr1BcCHUMtRg304vVe6ncMXheDolDf+ybQgVJAMbO
 7o7rEW5cXXNhxDjZmTlqrIIri2wxypl+lBxrW9LEEE4rHgABhjxqLp82NWHEpqs2/Ab8
 S4nm757Wf7k9JZcad0LNLdTl7XwqCvzaHojEMCoBZg5vNZ0UwSmKak/BRMClT6XETeHL
 2XBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVuvkCrKopte07/CL0x001ozSf9ZH3o1Rc13ibKszstIFIhy2ZykV0Y78YcdQbHN6YsRIh5IiG0wA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHDJqCNw/3wJM5UceRoRj5KB8pWIDU8P6a5UikxlmaGOCr0a9u
 KS503721vsj1VMpmA9y5t1bRmHVVyk/0YCigtGnEiMu7nOOvEJszv6i1ZTF6jm7yv19xL7uqOKS
 TdfK8wJF+G2sB25hH0/TpfjZIWdfqqNHvIVB9h9bb0S8zrFrVaXF5AM9kjq8p6AWrD6xJHFo=
X-Gm-Gg: ASbGnculVyFuyMzO20D4svMdrd71CmBGEpK7ewRy8aMgi0VRoqratXUb57GVEtkctjV
 A3SBGiQVXPXkz/Fb6kfP0Y6T6YthecpbZ7yU/fsEU42DQ2+HVpCCaeWWYbGyVF++A/qzeJJOyuY
 Oqi3yWZqHk5/va12bXem4wljcCT5LO/Utz/ZKxwgOBO+UZCf+mTLa/YpuPW4+H/UwnfsXUgRmTI
 IpLIFCXu2eNmdQLRDGvlgq9U/SobzCBIkgLcpRHoGOjJ2x6qdIBSWQDY5kxwsb2Ggjv2VG2fwEc
 rqUWjOODQp+2/nz0oT2qGu9rj4FTK81obsapdyE9lWgMO0wAG12W0S16OM1as6clPhKgAsV7Qv/
 OOLi/40+2l9nIlgcCnN+PrPmzgrDVsBaNICJ6LJfqustbYPeZ8F/d
X-Received: by 2002:ad4:5cc8:0:b0:705:16d9:16d8 with SMTP id
 6a1803df08f44-70ba7a5e85fmr79323076d6.6.1755366305368; 
 Sat, 16 Aug 2025 10:45:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeXTsd7ZskYXZ+jwTV89gfJcRDrxwmOaUzqsu0eMoOYNwcWEiiL+7vY0LYfpC6X1kLej9NHw==
X-Received: by 2002:ad4:5cc8:0:b0:705:16d9:16d8 with SMTP id
 6a1803df08f44-70ba7a5e85fmr79322486d6.6.1755366304559; 
 Sat, 16 Aug 2025 10:45:04 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef3ccb38sm951469e87.97.2025.08.16.10.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Aug 2025 10:45:03 -0700 (PDT)
Date: Sat, 16 Aug 2025 20:45:01 +0300
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
Message-ID: <nx5gv6ltot74jtq4igd2w2eilg4u5p7h235fs3fpuqtesly7ql@fdiymkszmiie>
References: <20250814164048.2336043-1-uwu@icenowy.me>
 <20250814164048.2336043-4-uwu@icenowy.me>
 <m7sg6sbc75lsnm6u6zppq574rtgt2rzr5hjmpwfwns2wnmmfs2@anbw5z7mo5a3>
 <c9caa122d57cbe3de3efee2de211d914c96eb0bc.camel@icenowy.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c9caa122d57cbe3de3efee2de211d914c96eb0bc.camel@icenowy.me>
X-Authority-Analysis: v=2.4 cv=D9xHKuRj c=1 sm=1 tr=0 ts=68a0c3ae cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=OuEvb7gRmnY4T5OWx78A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: JO7gjOs44ASQQXbWviu3soykZW2cD6wj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyNCBTYWx0ZWRfX4HP9e5nNaNL9
 qJUojNabM8khpxtrFkbmqnHNqLw0BFTfZhcsUjKkj7H+AWK6UM0yIlXLc2jEfM7UqRDh3hzE9mp
 aMTMFg463CBfFVGZSykJBcDymn5J3QzgORE/WDIFusXtsoXV1Vm/1xBsA5VRCD1ipw9Taiujil3
 viDPQDa68zH8KDLGOOn76dBcdJlKwj3oEMy1RRbbN/nP3xNTny2bDZ3KaomhgvzpmKJMZgSEaXj
 0o5eaMyXQtxzRiPzX7TM9keDPk0pVwYNhk/qMpAnOMMFpQ0I5famc1H3IT0xe1DlG2oBltQwX+H
 P9EoXyArcX70mWzTpktxDbC/JZXOjl0qdom9t8D9tMRulA+dcq3GtAP3N6pYsMtyqQqV+35Av8K
 4yxaBQzI
X-Proofpoint-GUID: JO7gjOs44ASQQXbWviu3soykZW2cD6wj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160024
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

On Sun, Aug 17, 2025 at 12:48:42AM +0800, Icenowy Zheng wrote:
> 在 2025-08-16星期六的 19:18 +0300，Dmitry Baryshkov写道：
> > On Fri, Aug 15, 2025 at 12:40:43AM +0800, Icenowy Zheng wrote:
> > > This is a from-scratch driver targeting Verisilicon DC-series
> > > display
> > > controllers, which feature self-identification functionality like
> > > their
> > > GC-series GPUs.
> > > 
> > > Only DC8200 is being supported now, and only the main framebuffer
> > > is set
> > > up (as the DRM primary plane). Support for more DC models and more
> > > features is my further targets.
> > > 
> > > As the display controller is delivered to SoC vendors as a whole
> > > part,
> > > this driver does not use component framework and extra bridges
> > > inside a
> > > SoC is expected to be implemented as dedicated bridges (this driver
> > > properly supports bridge chaining).
> > > 
> > > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > > ---
> > >  drivers/gpu/drm/Kconfig                       |   2 +
> > >  drivers/gpu/drm/Makefile                      |   1 +
> > >  drivers/gpu/drm/verisilicon/Kconfig           |  15 +
> > >  drivers/gpu/drm/verisilicon/Makefile          |   5 +
> > >  drivers/gpu/drm/verisilicon/vs_bridge.c       | 330
> > > ++++++++++++++++++
> > >  drivers/gpu/drm/verisilicon/vs_bridge.h       |  40 +++
> > >  drivers/gpu/drm/verisilicon/vs_bridge_regs.h  |  47 +++
> > >  drivers/gpu/drm/verisilicon/vs_crtc.c         | 217 ++++++++++++
> > >  drivers/gpu/drm/verisilicon/vs_crtc.h         |  29 ++
> > >  drivers/gpu/drm/verisilicon/vs_crtc_regs.h    |  60 ++++
> > >  drivers/gpu/drm/verisilicon/vs_dc.c           | 233 +++++++++++++
> > >  drivers/gpu/drm/verisilicon/vs_dc.h           |  39 +++
> > >  drivers/gpu/drm/verisilicon/vs_dc_top_regs.h  |  27 ++
> > >  drivers/gpu/drm/verisilicon/vs_drm.c          | 177 ++++++++++
> > >  drivers/gpu/drm/verisilicon/vs_drm.h          |  29 ++
> > >  drivers/gpu/drm/verisilicon/vs_hwdb.c         | 150 ++++++++
> > >  drivers/gpu/drm/verisilicon/vs_hwdb.h         |  29 ++
> > >  drivers/gpu/drm/verisilicon/vs_plane.c        | 102 ++++++
> > >  drivers/gpu/drm/verisilicon/vs_plane.h        |  68 ++++
> > >  .../gpu/drm/verisilicon/vs_primary_plane.c    | 166 +++++++++
> > >  .../drm/verisilicon/vs_primary_plane_regs.h   |  53 +++
> > >  21 files changed, 1819 insertions(+)
> > >  create mode 100644 drivers/gpu/drm/verisilicon/Kconfig
> > >  create mode 100644 drivers/gpu/drm/verisilicon/Makefile
> > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_bridge.c
> > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_bridge.h
> > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_bridge_regs.h
> > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.c
> > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.h
> > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc_regs.h
> > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_dc.c
> > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_dc.h
> > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_dc_top_regs.h
> > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_drm.c
> > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_drm.h
> > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_hwdb.c
> > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_hwdb.h
> > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.c
> > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.h
> > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_primary_plane.c
> > >  create mode 100644
> > > drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h
> > > 
> > > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > > index f7ea8e895c0c0..33601485ecdba 100644
> > > --- a/drivers/gpu/drm/Kconfig
> > > +++ b/drivers/gpu/drm/Kconfig
> > > @@ -396,6 +396,8 @@ source "drivers/gpu/drm/sprd/Kconfig"
> > >  
> > >  source "drivers/gpu/drm/imagination/Kconfig"
> > >  
> > > +source "drivers/gpu/drm/verisilicon/Kconfig"
> > > +
> > >  config DRM_HYPERV
> > >         tristate "DRM Support for Hyper-V synthetic video device"
> > >         depends on DRM && PCI && HYPERV
> > > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > > index 4dafbdc8f86ac..32ed4cf9df1bd 100644
> > > --- a/drivers/gpu/drm/Makefile
> > > +++ b/drivers/gpu/drm/Makefile
> > > @@ -231,6 +231,7 @@ obj-y                       += solomon/
> > >  obj-$(CONFIG_DRM_SPRD) += sprd/
> > >  obj-$(CONFIG_DRM_LOONGSON) += loongson/
> > >  obj-$(CONFIG_DRM_POWERVR) += imagination/
> > > +obj-$(CONFIG_DRM_VERISILICON_DC) += verisilicon/
> > >  
> > >  # Ensure drm headers are self-contained and pass kernel-doc
> > >  hdrtest-files := \
> > > diff --git a/drivers/gpu/drm/verisilicon/Kconfig
> > > b/drivers/gpu/drm/verisilicon/Kconfig
> > > new file mode 100644
> > > index 0000000000000..0235577c72824
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/verisilicon/Kconfig
> > > @@ -0,0 +1,15 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only
> > > +config DRM_VERISILICON_DC
> > > +       tristate "DRM Support for Verisilicon DC-series display
> > > controllers"
> > > +       depends on DRM && COMMON_CLK
> > > +       depends on RISCV || COMPILER_TEST
> > > +       select DRM_CLIENT_SELECTION
> > > +       select DRM_GEM_DMA_HELPER
> > > +       select DRM_KMS_HELPER
> > > +       select DRM_BRIDGE_CONNECTOR
> > > +       select REGMAP_MMIO
> > > +       select VIDEOMODE_HELPERS
> > > +       help
> > > +         Choose this option if you have a SoC with Verisilicon DC-
> > > series
> > > +         display controllers. If M is selected, the module will be
> > > called
> > > +         verisilicon-dc.
> > > diff --git a/drivers/gpu/drm/verisilicon/Makefile
> > > b/drivers/gpu/drm/verisilicon/Makefile
> > > new file mode 100644
> > > index 0000000000000..fd8d805fbcde1
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/verisilicon/Makefile
> > > @@ -0,0 +1,5 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only
> > > +
> > > +verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_drm.o
> > > vs_hwdb.o vs_plane.o vs_primary_plane.o
> > > +
> > > +obj-$(CONFIG_DRM_VERISILICON_DC) += verisilicon-dc.o
> > > diff --git a/drivers/gpu/drm/verisilicon/vs_bridge.c
> > > b/drivers/gpu/drm/verisilicon/vs_bridge.c
> > > new file mode 100644
> > > index 0000000000000..c8caf31fac7d6
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/verisilicon/vs_bridge.c
> > > @@ -0,0 +1,330 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
> > > + */
> > > +
> > > +#include <linux/of.h>
> > > +#include <linux/regmap.h>
> > > +
> > > +#include <uapi/linux/media-bus-format.h>
> > > +
> > > +#include <drm/drm_atomic.h>
> > > +#include <drm/drm_atomic_helper.h>
> > > +#include <drm/drm_bridge.h>
> > > +#include <drm/drm_bridge_connector.h>
> > > +#include <drm/drm_connector.h>
> > > +#include <drm/drm_encoder.h>
> > > +#include <drm/drm_of.h>
> > > +#include <drm/drm_print.h>
> > > +#include <drm/drm_simple_kms_helper.h>
> > > +
> > > +#include "vs_bridge.h"
> > > +#include "vs_bridge_regs.h"
> > > +#include "vs_crtc.h"
> > > +#include "vs_dc.h"
> > > +
> > > +static int vs_bridge_attach(struct drm_bridge *bridge,
> > > +                           struct drm_encoder *encoder,
> > > +                           enum drm_bridge_attach_flags flags)
> > > +{
> > > +       struct vs_bridge *vbridge =
> > > drm_bridge_to_vs_bridge(bridge);
> > > +
> > > +       return drm_bridge_attach(encoder, vbridge->next,
> > > +                                bridge, flags);
> > > +}
> > > +
> > > +struct vsdc_dp_format {
> > > +       u32 linux_fmt;
> > > +       bool is_yuv;
> > > +       u32 vsdc_fmt;
> > > +};
> > > +
> > > +static struct vsdc_dp_format vsdc_dp_supported_fmts[] = {
> > > +       /* default to RGB888 */
> > > +       { MEDIA_BUS_FMT_FIXED, false,
> > > VSDC_DISP_DP_CONFIG_FMT_RGB888 },
> > > +       { MEDIA_BUS_FMT_RGB888_1X24, false,
> > > VSDC_DISP_DP_CONFIG_FMT_RGB888 },
> > > +       { MEDIA_BUS_FMT_RGB565_1X16, false,
> > > VSDC_DISP_DP_CONFIG_FMT_RGB565 },
> > > +       { MEDIA_BUS_FMT_RGB666_1X18, false,
> > > VSDC_DISP_DP_CONFIG_FMT_RGB666 },
> > > +       { MEDIA_BUS_FMT_RGB888_1X24, false,
> > > VSDC_DISP_DP_CONFIG_FMT_RGB888 },
> > > +       { MEDIA_BUS_FMT_RGB101010_1X30,
> > > +         false, VSDC_DISP_DP_CONFIG_FMT_RGB101010 },
> > > +       { MEDIA_BUS_FMT_UYVY8_1X16, true,
> > > VSDC_DISP_DP_CONFIG_YUV_FMT_UYVY8 },
> > > +       { MEDIA_BUS_FMT_UYVY10_1X20, true,
> > > VSDC_DISP_DP_CONFIG_YUV_FMT_UYVY10 },
> > > +       { MEDIA_BUS_FMT_YUV8_1X24, true,
> > > VSDC_DISP_DP_CONFIG_YUV_FMT_YUV8 },
> > > +       { MEDIA_BUS_FMT_YUV10_1X30, true,
> > > VSDC_DISP_DP_CONFIG_YUV_FMT_YUV10 },
> > > +       { MEDIA_BUS_FMT_UYYVYY8_0_5X24,
> > > +         true, VSDC_DISP_DP_CONFIG_YUV_FMT_UYYVYY8 },
> > > +       { MEDIA_BUS_FMT_UYYVYY10_0_5X30,
> > > +         true, VSDC_DISP_DP_CONFIG_YUV_FMT_UYYVYY10 },
> > > +};
> > > +
> > > +static u32 *vs_bridge_atomic_get_output_bus_fmts(struct drm_bridge
> > > *bridge,
> > > +                                       struct drm_bridge_state
> > > *bridge_state,
> > > +                                       struct drm_crtc_state
> > > *crtc_state,
> > > +                                       struct drm_connector_state
> > > *conn_state,
> > > +                                       unsigned int
> > > *num_output_fmts)
> > > +{
> > > +       struct vs_bridge *vbridge =
> > > drm_bridge_to_vs_bridge(bridge);
> > > +       struct drm_connector *conn = conn_state->connector;
> > > +       u32 *output_fmts;
> > > +       unsigned int i;
> > > +
> > > +       if (vbridge->intf == VSDC_OUTPUT_INTERFACE_DPI)
> > 
> > This kind of checks looks like there should be a drm_encoder handled
> > by
> > the same driver. Or maybe it's better to have two sets of funcs
> > structures, one for the DPI, one for DP.
> 
> Well these functions used to be for an encoder, however I found that
> encoders cannot take part in format negotiation,

You encoder's formats are pretty much fixed. If you allocate encoder
structure and keep formats count / pointer in it, then your root bridge
can query the vs_encoder struct during format negotiation.

> and at least some
> source says encoder is deprecated in this situation and a first bridge
> in the bridge chain is better here.

They are mostly not necessary, but it's still better than having similar
ofs all over the place.

> 
> A simple encoder is created by this part of driver, but all its works
> are moved to this bridge, similar to what other drivers with bridge
> chaining support do.

Using non-simple drm_encoder would be a better option here.

> 
> > 
> > > +               *num_output_fmts = 1;
> > > +       else
> > > +               *num_output_fmts =
> > > ARRAY_SIZE(vsdc_dp_supported_fmts);
> > > +
> > > +       output_fmts = kcalloc(*num_output_fmts,
> > > sizeof(*output_fmts),
> > > +                             GFP_KERNEL);
> > > +       if (!output_fmts)
> > > +               return NULL;
> > > +
> > > +       if (vbridge->intf == VSDC_OUTPUT_INTERFACE_DPI) {
> > > +               if (conn->display_info.num_bus_formats &&
> > > +                   conn->display_info.bus_formats)
> > > +                       output_fmts[0] = conn-
> > > >display_info.bus_formats[0];
> > > +               else
> > > +                       output_fmts[0] = MEDIA_BUS_FMT_FIXED;
> > > +       } else {
> > > +               for (i = 0; i < *num_output_fmts; i++)
> > > +                       output_fmts[i] =
> > > vsdc_dp_supported_fmts[i].linux_fmt;
> > 
> > memcpy(a, b, min(ARRAY_SIZE(), num_output_fmts)) ?
> 
> vsdc_dp_supported_fmts is a map of linux_fmt to hardware-specific
> parameter, so memcpy won't work here.

Ack

> 
> > 
> > > +       }
> > > +
> > > +       return output_fmts;
> > > +}
> > > +
> > > +static bool vs_bridge_out_dp_fmt_supported(u32 out_fmt)
> > > +{
> > > +       unsigned int i;
> > > +
> > > +       for (i = 0; i < ARRAY_SIZE(vsdc_dp_supported_fmts); i++)
> > > +               if (vsdc_dp_supported_fmts[i].linux_fmt == out_fmt)
> > 
> > return true;
> > 
> > > +                       break;
> > > +
> > > +       return !(i == ARRAY_SIZE(vsdc_dp_supported_fmts));
> > 
> > return false;
> > 
> > > +}
> > > +
> > > +static u32 *vs_bridge_atomic_get_input_bus_fmts(struct drm_bridge
> > > *bridge,
> > > +                                       struct drm_bridge_state
> > > *bridge_state,
> > > +                                       struct drm_crtc_state
> > > *crtc_state,
> > > +                                       struct drm_connector_state
> > > *conn_state,
> > > +                                       u32 output_fmt,
> > > +                                       unsigned int
> > > *num_input_fmts)
> > > +{
> > > +       struct vs_bridge *vbridge =
> > > drm_bridge_to_vs_bridge(bridge);
> > > +
> > > +       if (vbridge->intf == VSDC_OUTPUT_INTERFACE_DP &&
> > > +           !vs_bridge_out_dp_fmt_supported(output_fmt)) {
> > > +               *num_input_fmts = 0;
> > > +               return NULL;
> > > +       }
> > > +
> > > +       return drm_atomic_helper_bridge_propagate_bus_fmt(bridge,
> > > bridge_state,
> > > +                                                        
> > > crtc_state,
> > > +                                                        
> > > conn_state,
> > > +                                                        
> > > output_fmt,
> > > +                                                        
> > > num_input_fmts);
> > > +}
> > > +
> > > +static int vs_bridge_atomic_check(struct drm_bridge *bridge,
> > > +                                 struct drm_bridge_state
> > > *bridge_state,
> > > +                                 struct drm_crtc_state
> > > *crtc_state,
> > > +                                 struct drm_connector_state
> > > *conn_state)
> > > +{
> > > +       struct vs_bridge *vbridge =
> > > drm_bridge_to_vs_bridge(bridge);
> > > +
> > > +       if (vbridge->intf == VSDC_OUTPUT_INTERFACE_DP &&
> > > +           !vs_bridge_out_dp_fmt_supported(bridge_state-
> > > >output_bus_cfg.format))
> > > +               return -EINVAL;
> > > +
> > > +       vbridge->output_bus_fmt = bridge_state-
> > > >output_bus_cfg.format;
> > 
> > You are saving a state value into a non-state variable. There is no
> > guarantee that this atomic_check() will be followed by the actual
> > commit. So, either you have to use a struct that extends
> > drm_bridge_state here or store the output_bus_fmt during
> > atomic_enable().
> 
> In fact I don't want to save it -- the kernel is quirky here and this
> value does not get passed into atomic_enable. I mimicked what other
> drivers do. See ingenic_drm_bridge_atomic_check() in ingenic/ingenic-
> drm-drv.c and meson_encoder_hdmi_atomic_check() in
> meson/meson_encoder_hdmi.c .

Please don't follow that pattern. It breaks as soon as userspace submits
an DRM_MODE_ATOMIC_TEST_ONLY commit. It's hard for encoders since they
don't have a state, but bridges have proper drm_bridge_state. Please use
it.

> 
> > 
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static void vs_bridge_atomic_enable(struct drm_bridge *bridge,
> > > +                                   struct drm_atomic_state *state)
> > > +{
> > > +       struct vs_bridge *vbridge =
> > > drm_bridge_to_vs_bridge(bridge);
> > > +       struct drm_bridge_state *br_state =
> > > drm_atomic_get_bridge_state(state,
> > > +                                                                  
> > >      bridge);
> > > +       struct vs_crtc *crtc = vbridge->crtc;
> > > +       struct vs_dc *dc = crtc->dc;
> > > +       unsigned int output = crtc->id;
> > > +       u32 dp_fmt;
> > > +       unsigned int i;
> > > +
> > > +       DRM_DEBUG_DRIVER("Enabling output %u\n", output);
> > > +
> > > +       switch (vbridge->intf) {
> > > +       case VSDC_OUTPUT_INTERFACE_DPI:
> > > +               regmap_clear_bits(dc->regs,
> > > VSDC_DISP_DP_CONFIG(output),
> > > +                                 VSDC_DISP_DP_CONFIG_DP_EN);
> > > +               break;
> > > +       case VSDC_OUTPUT_INTERFACE_DP:
> > > +               for (i = 0; i < ARRAY_SIZE(vsdc_dp_supported_fmts);
> > > i++) {
> > > +                       if (vsdc_dp_supported_fmts[i].linux_fmt ==
> > > +                           vbridge->output_bus_fmt)
> > > +                               break;
> > > +               }
> > > +               WARN_ON_ONCE(i ==
> > > ARRAY_SIZE(vsdc_dp_supported_fmts));
> > > +               dp_fmt = vsdc_dp_supported_fmts[i].vsdc_fmt;
> > 
> > This might trigger all static checkers in the universe. It's not
> > really
> > possible, since you've checked it in the atomic_check(), but...
> 
> Sigh I don't know how to properly describe it...
> 
> I can only say something really bad happens if the previous
> WARN_ON_ONCE is triggered.


if (WARN_ON_ONCE())
	return;

> 
> > 
> > > +               dp_fmt |= VSDC_DISP_DP_CONFIG_DP_EN;
> > > +               regmap_write(dc->regs, VSDC_DISP_DP_CONFIG(output),
> > > dp_fmt);
> > > +               regmap_assign_bits(dc->regs,
> > > +                                  VSDC_DISP_PANEL_CONFIG(output),
> > > +                                  VSDC_DISP_PANEL_CONFIG_YUV,
> > > +                                 
> > > vsdc_dp_supported_fmts[i].is_yuv);
> > > +               break;
> > > +       }
> > > +
> > > +       regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_CONFIG(output),
> > > +                         VSDC_DISP_PANEL_CONFIG_DAT_POL);
> > > +       regmap_assign_bits(dc->regs,
> > > VSDC_DISP_PANEL_CONFIG(output),
> > > +                          VSDC_DISP_PANEL_CONFIG_DE_POL,
> > > +                          br_state->output_bus_cfg.flags &
> > > +                          DRM_BUS_FLAG_DE_LOW);
> > > +       regmap_assign_bits(dc->regs,
> > > VSDC_DISP_PANEL_CONFIG(output),
> > > +                          VSDC_DISP_PANEL_CONFIG_CLK_POL,
> > > +                          br_state->output_bus_cfg.flags &
> > > +                          DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE);
> > > +       regmap_set_bits(dc->regs, VSDC_DISP_PANEL_CONFIG(output),
> > > +                       VSDC_DISP_PANEL_CONFIG_DE_EN |
> > > +                       VSDC_DISP_PANEL_CONFIG_DAT_EN |
> > > +                       VSDC_DISP_PANEL_CONFIG_CLK_EN);
> > > +       regmap_set_bits(dc->regs, VSDC_DISP_PANEL_CONFIG(output),
> > > +                       VSDC_DISP_PANEL_CONFIG_RUNNING);
> > > +       regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_START,
> > > +                         VSDC_DISP_PANEL_START_MULTI_DISP_SYNC);
> > > +       regmap_set_bits(dc->regs, VSDC_DISP_PANEL_START,
> > > +                       VSDC_DISP_PANEL_START_RUNNING(output));
> > > +
> > > +       regmap_set_bits(dc->regs, VSDC_DISP_PANEL_CONFIG_EX(crtc-
> > > >id),
> > > +                       VSDC_DISP_PANEL_CONFIG_EX_COMMIT);
> > > +}
> > > +
> > > +static void vs_bridge_atomic_disable(struct drm_bridge *bridge,
> > > +                                    struct drm_atomic_state
> > > *state)
> > > +{
> > > +       struct vs_bridge *vbridge =
> > > drm_bridge_to_vs_bridge(bridge);
> > > +       struct vs_crtc *crtc = vbridge->crtc;
> > > +       struct vs_dc *dc = crtc->dc;
> > > +       unsigned int output = crtc->id;
> > > +
> > > +       DRM_DEBUG_DRIVER("Disabling output %u\n", output);
> > > +
> > > +       regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_START,
> > > +                         VSDC_DISP_PANEL_START_MULTI_DISP_SYNC |
> > > +                         VSDC_DISP_PANEL_START_RUNNING(output));
> > > +       regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_CONFIG(output),
> > > +                         VSDC_DISP_PANEL_CONFIG_RUNNING);
> > > +
> > > +       regmap_set_bits(dc->regs, VSDC_DISP_PANEL_CONFIG_EX(crtc-
> > > >id),
> > > +                       VSDC_DISP_PANEL_CONFIG_EX_COMMIT);
> > > +}
> > > +
> > > +static const struct drm_bridge_funcs vs_bridge_funcs = {
> > > +       .attach = vs_bridge_attach,
> > > +       .atomic_enable = vs_bridge_atomic_enable,
> > > +       .atomic_disable = vs_bridge_atomic_disable,
> > > +       .atomic_check = vs_bridge_atomic_check,
> > > +       .atomic_get_input_bus_fmts =
> > > vs_bridge_atomic_get_input_bus_fmts,
> > > +       .atomic_get_output_bus_fmts =
> > > vs_bridge_atomic_get_output_bus_fmts,
> > > +       .atomic_duplicate_state =
> > > drm_atomic_helper_bridge_duplicate_state,
> > > +       .atomic_destroy_state =
> > > drm_atomic_helper_bridge_destroy_state,
> > > +       .atomic_reset = drm_atomic_helper_bridge_reset,
> > > +};
> > > +
> > > +static int vs_bridge_detect_output_interface(struct device_node
> > > *of_node,
> > > +                                            unsigned int output)
> > > +{
> > > +       int ret;
> > > +       struct device_node *remote;
> > > +
> > > +       remote = of_graph_get_remote_node(of_node, output,
> > > +                                        
> > > VSDC_OUTPUT_INTERFACE_DPI);
> > 
> > This deserves a comment in the source file.
> > 
> > > +       if (remote) {
> > > +               ret = VSDC_OUTPUT_INTERFACE_DPI;
> > 
> > return here, drop else{}
> 
> Well a of_node_put() is missing before the final return, and Yao Zi
> noted me of it.

You can put the node right after of_graph_get_remote_node(); You don't
use any props from it.

> 
> > 
> > > +       } else {
> > > +               remote = of_graph_get_remote_node(of_node, output,
> > > +                                                
> > > VSDC_OUTPUT_INTERFACE_DP);
> > > +               if (remote)
> > > +                       ret = VSDC_OUTPUT_INTERFACE_DP;
> > 
> > return
> > 
> > > +               else
> > > +                       ret = -ENODEV;
> > > +       }
> > > +
> > > +       return ret;
> > > +}
> > > +
> > > +struct vs_bridge *vs_bridge_init(struct drm_device *drm_dev,
> > > +                                struct vs_crtc *crtc)
> > > +{
> > > +       unsigned int output = crtc->id;
> > > +       struct vs_bridge *bridge;
> > > +       struct drm_bridge *next;
> > > +       enum vs_bridge_output_interface intf;
> > > +       int ret;
> > > +
> > > +       intf = vs_bridge_detect_output_interface(drm_dev->dev-
> > > >of_node,
> > > +                                                output);
> > > +       if (intf == -ENODEV) {
> > > +               dev_info(drm_dev->dev, "Skipping output %u\n",
> > > output);
> > > +               return NULL;
> > > +       }
> > > +
> > > +       bridge = devm_kzalloc(drm_dev->dev, sizeof(*bridge),
> > > GFP_KERNEL);
> > 
> > devm_drm_bridge_alloc()
> > 
> > > +       if (!bridge)
> > > +               return ERR_PTR(-ENOMEM);
> > > +
> > > +       bridge->crtc = crtc;
> > > +       bridge->intf = intf;
> > > +       bridge->base.funcs = &vs_bridge_funcs;
> > > +
> > > +       next = devm_drm_of_get_bridge(drm_dev->dev, drm_dev->dev-
> > > >of_node,
> > > +                                     output, intf);
> > > +       if (IS_ERR(next)) {
> > > +               ret = PTR_ERR(next);
> > > +               goto err_free_bridge;
> > > +       }
> > > +
> > > +       bridge->next = next;
> > > +
> > > +       ret = drm_simple_encoder_init(drm_dev, &bridge->enc,
> > 
> > Oh, so there is an encoder... Please drop drm_simple_encoder, it's
> > deprecated, and try moving all the ifs to the encoder funcs.
> 
> Ah? Is it really deprecated? I can find no source of this deprecation.

https://lore.kernel.org/dri-devel/20250401094056.32904-3-tzimmermann@suse.de/

> In addition, I think many drivers here are using a bridge as a "better
> encoder" because of the restriction of current encoder implementation,
> and I am doing the same thing. Either encoder functionality should be
> improved to on par with bridge, or such dummy encoders with a bridge
> should exist, and some helper for creating them should exist. It might
> be not drm_simple_encoder_init (because I can understand the
> deprecation of other parts of the simple-kms routines, although I see
> no formal documentation mentioning it's deprecated, maybe I missed some
> newspaper?), but it should exist.

Maybe we should explicitly document the status.

Also, if you use non-simple encoders, you can actually have
functionality there.

> 
> > 
> > > +                                     (intf ==
> > > VSDC_OUTPUT_INTERFACE_DPI) ?
> > > +                                     DRM_MODE_ENCODER_DPI :
> > > +                                     DRM_MODE_ENCODER_NONE);
> > > +       if (ret) {
> > > +               dev_err(drm_dev->dev,
> > > +                       "Cannot initialize encoder for output
> > > %u\n", output);
> > > +               goto err_free_bridge;
> > > +       }
> > > +
> > > +       bridge->enc.possible_crtcs = drm_crtc_mask(&crtc->base);
> > > +
> > > +       ret = drm_bridge_attach(&bridge->enc, &bridge->base, NULL,
> > > +                               DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> > > +       if (ret) {
> > > +               dev_err(drm_dev->dev,
> > > +                       "Cannot attach bridge for output %u\n",
> > > output);
> > > +               goto err_cleanup_encoder;
> > > +       }
> > > +
> > > +       bridge->conn = drm_bridge_connector_init(drm_dev, &bridge-
> > > >enc);
> > > +       if (IS_ERR(bridge->conn)) {
> > > +               dev_err(drm_dev->dev,
> > > +                       "Cannot create connector for output %u\n",
> > > output);
> > > +               ret = PTR_ERR(bridge->conn);
> > > +               goto err_cleanup_encoder;
> > > +       }
> > > +       drm_connector_attach_encoder(bridge->conn, &bridge->enc);
> > > +
> > > +       return bridge;
> > > +
> > > +err_cleanup_encoder:
> > > +       drm_encoder_cleanup(&bridge->enc);
> > > +err_free_bridge:
> > > +       devm_kfree(drm_dev->dev, bridge);
> > > +
> > > +       return ERR_PTR(ret);
> > > +}
> > > diff --git a/drivers/gpu/drm/verisilicon/vs_bridge.h
> > > b/drivers/gpu/drm/verisilicon/vs_bridge.h
> > > new file mode 100644
> > > index 0000000000000..4a8a9eeb739f2
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/verisilicon/vs_bridge.h
> > > @@ -0,0 +1,40 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > +/*
> > > + * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
> > > + */
> > > +
> > > +#ifndef _VS_BRIDGE_H_
> > > +#define _VS_BRIDGE_H_
> > > +
> > > +#include <linux/types.h>
> > > +
> > > +#include <drm/drm_bridge.h>
> > > +#include <drm/drm_connector.h>
> > > +#include <drm/drm_encoder.h>
> > > +
> > > +struct vs_crtc;
> > > +
> > > +enum vs_bridge_output_interface {
> > > +       VSDC_OUTPUT_INTERFACE_DPI = 0,
> > > +       VSDC_OUTPUT_INTERFACE_DP = 1
> > > +};
> > > +
> > > +struct vs_bridge {
> > > +       struct drm_bridge base;
> > > +       struct drm_encoder enc;
> > > +       struct drm_connector *conn;
> > > +
> > > +       struct vs_crtc *crtc;
> > > +       struct drm_bridge *next;
> > > +       enum vs_bridge_output_interface intf;
> > > +       u32 output_bus_fmt;
> > > +};
> > > +
> > > +static inline struct vs_bridge *drm_bridge_to_vs_bridge(struct
> > > drm_bridge *bridge)
> > > +{
> > > +       return container_of(bridge, struct vs_bridge, base);
> > > +}
> > > +
> > > +struct vs_bridge *vs_bridge_init(struct drm_device *drm_dev,
> > > +                                struct vs_crtc *crtc);
> > > +#endif /* _VS_BRIDGE_H_ */
> > > diff --git a/drivers/gpu/drm/verisilicon/vs_bridge_regs.h
> > > b/drivers/gpu/drm/verisilicon/vs_bridge_regs.h
> > > new file mode 100644
> > > index 0000000000000..d1c91dd1354b4
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/verisilicon/vs_bridge_regs.h
> > > @@ -0,0 +1,47 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > +/*
> > > + * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
> > > + *
> > > + * Based on vs_dc_hw.h, which is:
> > > + *   Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
> > > + */
> > > +
> > > +#ifndef _VS_BRIDGE_REGS_H_
> > > +#define _VS_BRIDGE_REGS_H_
> > > +
> > > +#include <linux/bits.h>
> > > +
> > > +#define VSDC_DISP_PANEL_CONFIG(n)              (0x1418 + 0x4 *
> > > (n))
> > > +#define VSDC_DISP_PANEL_CONFIG_DE_EN           BIT(0)
> > > +#define VSDC_DISP_PANEL_CONFIG_DE_POL          BIT(1)
> > > +#define VSDC_DISP_PANEL_CONFIG_DAT_EN          BIT(4)
> > > +#define VSDC_DISP_PANEL_CONFIG_DAT_POL         BIT(5)
> > > +#define VSDC_DISP_PANEL_CONFIG_CLK_EN          BIT(8)
> > > +#define VSDC_DISP_PANEL_CONFIG_CLK_POL         BIT(9)
> > > +#define VSDC_DISP_PANEL_CONFIG_RUNNING         BIT(12)
> > > +#define VSDC_DISP_PANEL_CONFIG_GAMMA           BIT(13)
> > > +#define VSDC_DISP_PANEL_CONFIG_YUV             BIT(16)
> > > +
> > > +#define VSDC_DISP_PANEL_START                  0x1CCC
> > > +#define VSDC_DISP_PANEL_START_RUNNING(n)       BIT(n)
> > > +#define VSDC_DISP_PANEL_START_MULTI_DISP_SYNC  BIT(3)
> > > +
> > > +#define VSDC_DISP_DP_CONFIG(n)                 (0x1CD0 + 0x4 *
> > > (n))
> > > +#define VSDC_DISP_DP_CONFIG_DP_EN              BIT(3)
> > > +#define VSDC_DISP_DP_CONFIG_FMT_MASK           GENMASK(2, 0)
> > > +#define VSDC_DISP_DP_CONFIG_FMT_RGB565         (0)
> > > +#define VSDC_DISP_DP_CONFIG_FMT_RGB666         (1)
> > > +#define VSDC_DISP_DP_CONFIG_FMT_RGB888         (2)
> > > +#define VSDC_DISP_DP_CONFIG_FMT_RGB101010      (3)
> > > +#define VSDC_DISP_DP_CONFIG_YUV_FMT_MASK       GENMASK(7, 4)
> > > +#define VSDC_DISP_DP_CONFIG_YUV_FMT_UYVY8      (2 << 4)
> > > +#define VSDC_DISP_DP_CONFIG_YUV_FMT_YUV8       (4 << 4)
> > > +#define VSDC_DISP_DP_CONFIG_YUV_FMT_UYVY10     (8 << 4)
> > > +#define VSDC_DISP_DP_CONFIG_YUV_FMT_YUV10      (10 << 4)
> > > +#define VSDC_DISP_DP_CONFIG_YUV_FMT_UYYVYY8    (12 << 4)
> > > +#define VSDC_DISP_DP_CONFIG_YUV_FMT_UYYVYY10   (13 << 4)
> > > +
> > > +#define VSDC_DISP_PANEL_CONFIG_EX(n)           (0x2518 + 0x4 *
> > > (n))
> > > +#define VSDC_DISP_PANEL_CONFIG_EX_COMMIT       BIT(0)
> > > +
> > > +#endif /* _VS_BRIDGE_REGS_H_ */
> > > diff --git a/drivers/gpu/drm/verisilicon/vs_crtc.c
> > > b/drivers/gpu/drm/verisilicon/vs_crtc.c
> > > new file mode 100644
> > > index 0000000000000..46c4191b82f49
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/verisilicon/vs_crtc.c
> > > @@ -0,0 +1,217 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
> > > + */
> > > +
> > > +#include <linux/clk.h>
> > > +#include <linux/regmap.h>
> > > +
> > > +#include <drm/drm_atomic.h>
> > > +#include <drm/drm_atomic_helper.h>
> > > +#include <drm/drm_print.h>
> > > +
> > > +#include "vs_crtc_regs.h"
> > > +#include "vs_crtc.h"
> > > +#include "vs_dc.h"
> > > +#include "vs_dc_top_regs.h"
> > > +#include "vs_plane.h"
> > > +
> > > +static void vs_crtc_atomic_flush(struct drm_crtc *crtc,
> > > +                                struct drm_atomic_state *state)
> > > +{
> > > +       struct vs_crtc *vcrtc = drm_crtc_to_vs_crtc(crtc);
> > > +       struct drm_crtc_state *crtc_state =
> > > drm_atomic_get_new_crtc_state(state,
> > > +                                                                  
> > >        crtc);
> > > +       struct drm_pending_vblank_event *event = crtc_state->event;
> > > +
> > > +       DRM_DEBUG_DRIVER("Flushing CRTC %u vblank events\n", vcrtc-
> > > >id);
> > > +
> > > +       if (event) {
> > > +               crtc_state->event = NULL;
> > > +
> > > +               spin_lock_irq(&crtc->dev->event_lock);
> > > +               if (drm_crtc_vblank_get(crtc) == 0)
> > > +                       drm_crtc_arm_vblank_event(crtc, event);
> > > +               else
> > > +                       drm_crtc_send_vblank_event(crtc, event);
> > > +               spin_unlock_irq(&crtc->dev->event_lock);
> > > +       }
> > > +}
> > > +
> > > +static void vs_crtc_atomic_disable(struct drm_crtc *crtc,
> > > +                                  struct drm_atomic_state *state)
> > > +{
> > > +       struct vs_crtc *vcrtc = drm_crtc_to_vs_crtc(crtc);
> > > +       struct vs_dc *dc = vcrtc->dc;
> > > +       unsigned int output = vcrtc->id;
> > > +
> > > +       DRM_DEBUG_DRIVER("Disabling CRTC %u\n", output);
> > > +
> > > +       drm_crtc_vblank_off(crtc);
> > > +
> > > +       clk_disable_unprepare(dc->pix_clk[output]);
> > > +}
> > > +
> > > +static void vs_crtc_atomic_enable(struct drm_crtc *crtc,
> > > +                                    struct drm_atomic_state
> > > *state)
> > > +{
> > > +       struct vs_crtc *vcrtc = drm_crtc_to_vs_crtc(crtc);
> > > +       struct vs_dc *dc = vcrtc->dc;
> > > +       unsigned int output = vcrtc->id;
> > > +
> > > +       DRM_DEBUG_DRIVER("Enabling CRTC %u\n", output);
> > > +
> > > +       WARN_ON(clk_prepare_enable(dc->pix_clk[output]));
> > > +
> > > +       drm_crtc_vblank_on(crtc);
> > > +}
> > > +
> > > +static void vs_crtc_mode_set_nofb(struct drm_crtc *crtc)
> > > +{
> > > +       struct drm_display_mode *mode = &crtc->state-
> > > >adjusted_mode;
> > > +       struct vs_crtc *vcrtc = drm_crtc_to_vs_crtc(crtc);
> > > +       struct vs_dc *dc = vcrtc->dc;
> > > +       unsigned int output = vcrtc->id;
> > > +
> > > +       DRM_DEBUG_DRIVER("Setting mode on CRTC %u\n", output);
> > > +
> > > +       regmap_write(dc->regs, VSDC_DISP_HSIZE(output),
> > > +                    VSDC_DISP_HSIZE_DISP(mode->hdisplay) |
> > > +                    VSDC_DISP_HSIZE_TOTAL(mode->htotal));
> > > +       regmap_write(dc->regs, VSDC_DISP_VSIZE(output),
> > > +                    VSDC_DISP_VSIZE_DISP(mode->vdisplay) |
> > > +                    VSDC_DISP_VSIZE_TOTAL(mode->vtotal));
> > > +       regmap_write(dc->regs, VSDC_DISP_HSYNC(output),
> > > +                    VSDC_DISP_HSYNC_START(mode->hsync_start) |
> > > +                    VSDC_DISP_HSYNC_END(mode->hsync_end) |
> > > +                    VSDC_DISP_HSYNC_EN);
> > > +       if (!(mode->flags & DRM_MODE_FLAG_PHSYNC))
> > > +               regmap_set_bits(dc->regs, VSDC_DISP_HSYNC(output),
> > > +                               VSDC_DISP_HSYNC_POL);
> > > +       regmap_write(dc->regs, VSDC_DISP_VSYNC(output),
> > > +                    VSDC_DISP_VSYNC_START(mode->vsync_start) |
> > > +                    VSDC_DISP_VSYNC_END(mode->vsync_end) |
> > > +                    VSDC_DISP_VSYNC_EN);
> > > +       if (!(mode->flags & DRM_MODE_FLAG_PVSYNC))
> > > +               regmap_set_bits(dc->regs, VSDC_DISP_VSYNC(output),
> > > +                               VSDC_DISP_VSYNC_POL);
> > > +
> > > +       WARN_ON(clk_set_rate(dc->pix_clk[output], mode->crtc_clock
> > > * 1000));
> > > +}
> > > +
> > > +static enum drm_mode_status
> > > +vs_crtc_mode_valid(struct drm_crtc *crtc, const struct
> > > drm_display_mode *mode)
> > > +{
> > > +       struct vs_crtc *vcrtc = drm_crtc_to_vs_crtc(crtc);
> > > +       struct vs_dc *dc = vcrtc->dc;
> > > +       unsigned int output = vcrtc->id;
> > > +       long rate;
> > > +
> > > +       if (mode->htotal > 0x7FFF)
> > 
> > lowercase hex, please.
> 
> Why? I didn't see any document enforces this.

I think, it's a generic suggestion for the sake of readability.

> 
> > 
> > > +               return MODE_BAD_HVALUE;
> > > +       if (mode->vtotal > 0x7FFF)
> > > +               return MODE_BAD_VVALUE;
> > > +
> > > +       rate = clk_round_rate(dc->pix_clk[output], mode->clock *
> > > 1000);
> > > +       if (rate <= 0)
> > > +               return MODE_CLOCK_RANGE;
> > > +
> > > +       return MODE_OK;
> > > +}
> > > +
> > > +static bool vs_crtc_mode_fixup(struct drm_crtc *crtc,
> > > +                              const struct drm_display_mode *m,
> > > +                              struct drm_display_mode
> > > *adjusted_mode)
> > > +{
> > > +       struct vs_crtc *vcrtc = drm_crtc_to_vs_crtc(crtc);
> > > +       struct vs_dc *dc = vcrtc->dc;
> > > +       unsigned int output = vcrtc->id;
> > > +       long clk_rate;
> > > +
> > > +       drm_mode_set_crtcinfo(adjusted_mode, 0);
> > > +
> > > +       /* Feedback the pixel clock to crtc_clock */
> > > +       clk_rate = adjusted_mode->crtc_clock * 1000;
> > > +       clk_rate = clk_round_rate(dc->pix_clk[output], clk_rate);
> > > +       if (clk_rate <= 0)
> > > +               return false;
> > > +
> > > +       adjusted_mode->crtc_clock = clk_rate / 1000;
> > > +
> > > +       return true;
> > > +}
> > > +
> > > +static const struct drm_crtc_helper_funcs vs_crtc_helper_funcs = {
> > > +       .atomic_flush   = vs_crtc_atomic_flush,
> > > +       .atomic_enable  = vs_crtc_atomic_enable,
> > > +       .atomic_disable = vs_crtc_atomic_disable,
> > > +       .mode_set_nofb  = vs_crtc_mode_set_nofb,
> > > +       .mode_valid     = vs_crtc_mode_valid,
> > > +       .mode_fixup     = vs_crtc_mode_fixup,
> > > +};
> > > +
> > > +static int vs_crtc_enable_vblank(struct drm_crtc *crtc)
> > > +{
> > > +       struct vs_crtc *vcrtc = drm_crtc_to_vs_crtc(crtc);
> > > +       struct vs_dc *dc = vcrtc->dc;
> > > +
> > > +       DRM_DEBUG_DRIVER("Enabling VBLANK on CRTC %u\n", vcrtc-
> > > >id);
> > > +       regmap_set_bits(dc->regs, VSDC_TOP_IRQ_EN,
> > > VSDC_TOP_IRQ_VSYNC(vcrtc->id));
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static void vs_crtc_disable_vblank(struct drm_crtc *crtc)
> > > +{
> > > +       struct vs_crtc *vcrtc = drm_crtc_to_vs_crtc(crtc);
> > > +       struct vs_dc *dc = vcrtc->dc;
> > > +
> > > +       DRM_DEBUG_DRIVER("Disabling VBLANK on CRTC %u\n", vcrtc-
> > > >id);
> > > +       regmap_clear_bits(dc->regs, VSDC_TOP_IRQ_EN,
> > > VSDC_TOP_IRQ_VSYNC(vcrtc->id));
> > > +}
> > > +
> > > +static const struct drm_crtc_funcs vs_crtc_funcs = {
> > > +       .atomic_destroy_state   =
> > > drm_atomic_helper_crtc_destroy_state,
> > > +       .atomic_duplicate_state =
> > > drm_atomic_helper_crtc_duplicate_state,
> > > +       .destroy                = drm_crtc_cleanup,
> > > +       .page_flip              = drm_atomic_helper_page_flip,
> > > +       .reset                  = drm_atomic_helper_crtc_reset,
> > > +       .set_config             = drm_atomic_helper_set_config,
> > > +       .enable_vblank          = vs_crtc_enable_vblank,
> > > +       .disable_vblank         = vs_crtc_disable_vblank,
> > > +};
> > > +
> > > +struct vs_crtc *vs_crtc_init(struct drm_device *drm_dev, struct
> > > vs_dc *dc,
> > > +                            unsigned int output)
> > > +{
> > > +       struct vs_crtc *vcrtc;
> > > +       struct drm_plane *primary;
> > > +       int ret;
> > > +
> > > +       vcrtc = devm_kzalloc(drm_dev->dev, sizeof(*vcrtc),
> > > GFP_KERNEL);
> > > +       if (!vcrtc)
> > > +               return ERR_PTR(-ENOMEM);
> > > +       vcrtc->dc = dc;
> > > +       vcrtc->id = output;
> > > +
> > > +       /* Create our primary plane */
> > > +       primary = vs_primary_plane_init(drm_dev, dc);
> > > +       if (IS_ERR(primary)) {
> > > +               dev_err(drm_dev->dev, "Couldn't create the primary
> > > plane\n");
> > > +               return ERR_PTR(PTR_ERR(primary));
> > > +       }
> > > +
> > > +       ret = drm_crtc_init_with_planes(drm_dev, &vcrtc->base,
> > > +                                       primary,
> > > +                                       NULL,
> > > +                                       &vs_crtc_funcs,
> > > +                                       NULL);
> > > +       if (ret) {
> > > +               dev_err(drm_dev->dev, "Couldn't initialize
> > > CRTC\n");
> > > +               return ERR_PTR(ret);
> > > +       }
> > > +
> > > +       drm_crtc_helper_add(&vcrtc->base, &vs_crtc_helper_funcs);
> > > +
> > > +       return vcrtc;
> > > +}
> > > diff --git a/drivers/gpu/drm/verisilicon/vs_crtc.h
> > > b/drivers/gpu/drm/verisilicon/vs_crtc.h
> > > new file mode 100644
> > > index 0000000000000..6f862d609b984
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/verisilicon/vs_crtc.h
> > > @@ -0,0 +1,29 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > +/*
> > > + * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
> > > + */
> > > +
> > > +#ifndef _VS_CRTC_H_
> > > +#define _VS_CRTC_H_
> > > +
> > > +#include <drm/drm_crtc.h>
> > > +#include <drm/drm_vblank.h>
> > > +
> > > +struct vs_dc;
> > > +
> > > +struct vs_crtc {
> > > +       struct drm_crtc base;
> > > +
> > > +       struct vs_dc *dc;
> > > +       unsigned int id;
> > > +};
> > > +
> > > +static inline struct vs_crtc *drm_crtc_to_vs_crtc(struct drm_crtc
> > > *crtc)
> > > +{
> > > +       return container_of(crtc, struct vs_crtc, base);
> > > +}
> > > +
> > > +struct vs_crtc *vs_crtc_init(struct drm_device *drm_dev, struct
> > > vs_dc *dc,
> > > +                            unsigned int output);
> > > +
> > > +#endif /* _VS_CRTC_H_ */
> > > diff --git a/drivers/gpu/drm/verisilicon/vs_crtc_regs.h
> > > b/drivers/gpu/drm/verisilicon/vs_crtc_regs.h
> > > new file mode 100644
> > > index 0000000000000..c7930e817635c
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/verisilicon/vs_crtc_regs.h
> > > @@ -0,0 +1,60 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > +/*
> > > + * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
> > > + *
> > > + * Based on vs_dc_hw.h, which is:
> > > + *   Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
> > > + */
> > > +
> > > +#ifndef _VS_CRTC_REGS_H_
> > > +#define _VS_CRTC_REGS_H_
> > > +
> > > +#include <linux/bits.h>
> > > +
> > > +#define VSDC_DISP_DITHER_CONFIG(n)             (0x1410 + 0x4 *
> > > (n))
> > > +
> > > +#define VSDC_DISP_DITHER_TABLE_LOW(n)          (0x1420 + 0x4 *
> > > (n))
> > > +#define VSDC_DISP_DITHER_TABLE_LOW_DEFAULT     0x7B48F3C0
> > > +
> > > +#define VSDC_DISP_DITHER_TABLE_HIGH(n)         (0x1428 + 0x4 *
> > > (n))
> > > +#define VSDC_DISP_DITHER_TABLE_HIGH_DEFAULT    0x596AD1E2
> > > +
> > > +#define VSDC_DISP_HSIZE(n)                     (0x1430 + 0x4 *
> > > (n))
> > > +#define VSDC_DISP_HSIZE_DISP_MASK              GENMASK(14, 0)
> > > +#define VSDC_DISP_HSIZE_DISP(v)                        ((v) << 0)
> > > +#define VSDC_DISP_HSIZE_TOTAL_MASK             GENMASK(30, 16)
> > > +#define VSDC_DISP_HSIZE_TOTAL(v)               ((v) << 16)
> > > +
> > > +#define VSDC_DISP_HSYNC(n)                     (0x1438 + 0x4 *
> > > (n))
> > > +#define VSDC_DISP_HSYNC_START_MASK             GENMASK(14, 0)
> > > +#define VSDC_DISP_HSYNC_START(v)               ((v) << 0)
> > > +#define VSDC_DISP_HSYNC_END_MASK               GENMASK(29, 15)
> > > +#define VSDC_DISP_HSYNC_END(v)                 ((v) << 15)
> > > +#define VSDC_DISP_HSYNC_EN                     BIT(30)
> > > +#define VSDC_DISP_HSYNC_POL                    BIT(31)
> > > +
> > > +#define VSDC_DISP_VSIZE(n)                     (0x1440 + 0x4 *
> > > (n))
> > > +#define VSDC_DISP_VSIZE_DISP_MASK              GENMASK(14, 0)
> > > +#define VSDC_DISP_VSIZE_DISP(v)                        ((v) << 0)
> > > +#define VSDC_DISP_VSIZE_TOTAL_MASK             GENMASK(30, 16)
> > > +#define VSDC_DISP_VSIZE_TOTAL(v)               ((v) << 16)
> > > +
> > > +#define VSDC_DISP_VSYNC(n)                     (0x1448 + 0x4 *
> > > (n))
> > > +#define VSDC_DISP_VSYNC_START_MASK             GENMASK(14, 0)
> > > +#define VSDC_DISP_VSYNC_START(v)               ((v) << 0)
> > > +#define VSDC_DISP_VSYNC_END_MASK               GENMASK(29, 15)
> > > +#define VSDC_DISP_VSYNC_END(v)                 ((v) << 15)
> > > +#define VSDC_DISP_VSYNC_EN                     BIT(30)
> > > +#define VSDC_DISP_VSYNC_POL                    BIT(31)
> > > +
> > > +#define VSDC_DISP_CURRENT_LOCATION(n)          (0x1450 + 0x4 *
> > > (n))
> > > +
> > > +#define VSDC_DISP_GAMMA_INDEX(n)               (0x1458 + 0x4 *
> > > (n))
> > > +
> > > +#define VSDC_DISP_GAMMA_DATA(n)                        (0x1460 +
> > > 0x4 * (n))
> > > +
> > > +#define VSDC_DISP_IRQ_STA                      0x147C
> > > +
> > > +#define VSDC_DISP_IRQ_EN                       0x1480
> > > +
> > > +#endif /* _VS_CRTC_REGS_H_ */
> > > diff --git a/drivers/gpu/drm/verisilicon/vs_dc.c
> > > b/drivers/gpu/drm/verisilicon/vs_dc.c
> > > new file mode 100644
> > > index 0000000000000..98384559568c4
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/verisilicon/vs_dc.c
> > > @@ -0,0 +1,233 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
> > > + */
> > > +
> > > +#include <linux/dma-mapping.h>
> > > +#include <linux/of.h>
> > > +#include <linux/of_graph.h>
> > > +
> > > +#include "vs_crtc.h"
> > > +#include "vs_dc.h"
> > > +#include "vs_dc_top_regs.h"
> > > +#include "vs_drm.h"
> > > +#include "vs_hwdb.h"
> > > +
> > > +static const struct regmap_config vs_dc_regmap_cfg = {
> > > +       .reg_bits = 32,
> > > +       .val_bits = 32,
> > > +       .reg_stride = sizeof(u32),
> > > +       /* VSDC_OVL_CONFIG_EX(1) */
> > > +       .max_register = 0x2544,
> > > +       .cache_type = REGCACHE_NONE,
> > > +};
> > > +
> > > +static const struct of_device_id vs_dc_driver_dt_match[] = {
> > > +       { .compatible = "verisilicon,dc" },
> > > +       {},
> > > +};
> > > +MODULE_DEVICE_TABLE(of, vs_dc_driver_dt_match);
> > > +
> > > +static irqreturn_t vs_dc_irq_handler(int irq, void *private)
> > > +{
> > > +       struct vs_dc *dc = private;
> > > +       u32 irqs;
> > > +
> > > +       regmap_read(dc->regs, VSDC_TOP_IRQ_ACK, &irqs);
> > > +
> > > +       return vs_drm_handle_irq(dc, irqs);
> > > +}
> > > +
> > > +static int vs_dc_probe(struct platform_device *pdev)
> > > +{
> > > +       struct device *dev = &pdev->dev;
> > > +       struct vs_dc *dc;
> > > +       void __iomem *regs;
> > > +       unsigned int outputs, i;
> > > +       /* pix0/pix1 */
> > > +       char pixclk_name[5];
> > > +       int irq, ret;
> > > +
> > > +       if (!dev->of_node) {
> > > +               dev_err(dev, "can't find DC devices\n");
> > > +               return -ENODEV;
> > > +       }
> > > +
> > > +       outputs = of_graph_get_port_count(dev->of_node);
> > > +       if (!outputs) {
> > > +               dev_err(dev, "can't find DC downstream ports\n");
> > > +               return -ENODEV;
> > > +       }
> > > +       if (outputs > VSDC_MAX_OUTPUTS) {
> > > +               dev_err(dev, "too many DC downstream ports than
> > > possible\n");
> > > +               return -EINVAL;
> > > +       }
> > > +
> > > +       ret = dma_set_mask_and_coherent(&pdev->dev,
> > > DMA_BIT_MASK(32));
> > > +       if (ret) {
> > > +               dev_err(dev, "No suitable DMA available\n");
> > > +               return ret;
> > > +       }
> > > +
> > > +       dc = devm_kzalloc(dev, sizeof(*dc), GFP_KERNEL);
> > > +       if (!dc)
> > > +               return -ENOMEM;
> > > +
> > > +       dc->outputs = outputs;
> > > +
> > > +       dc->rsts[0].id = "core";
> > > +       dc->rsts[1].id = "axi";
> > > +       dc->rsts[0].id = "ahb";
> > > +
> > > +       ret = devm_reset_control_bulk_get_optional_shared(dev,
> > > VSDC_RESET_COUNT,
> > > +                                                         dc-
> > > >rsts);
> > > +       if (ret) {
> > > +               dev_err(dev, "can't get reset lines\n");
> > > +               return ret;
> > > +       }
> > > +
> > > +       dc->core_clk = devm_clk_get(dev, "core");
> > > +       if (IS_ERR(dc->core_clk)) {
> > > +               dev_err(dev, "can't get core clock\n");
> > > +               return PTR_ERR(dc->core_clk);
> > > +       }
> > > +
> > > +       dc->axi_clk = devm_clk_get(dev, "axi");
> > > +       if (IS_ERR(dc->axi_clk)) {
> > > +               dev_err(dev, "can't get axi clock\n");
> > > +               return PTR_ERR(dc->axi_clk);
> > > +       }
> > > +
> > > +       dc->ahb_clk = devm_clk_get(dev, "ahb");
> > 
> > devm_clk_get_enabled() ?
> > 
> > > +       if (IS_ERR(dc->ahb_clk)) {
> > > +               dev_err(dev, "can't get ahb clock\n");
> > > +               return PTR_ERR(dc->ahb_clk);
> > > +       }
> > > +
> > > +       for (i = 0; i < outputs; i++) {
> > > +               snprintf(pixclk_name, sizeof(pixclk_name), "pix%u",
> > > i);
> > > +               dc->pix_clk[i] = devm_clk_get(dev, pixclk_name);
> > > +               if (IS_ERR(dc->pix_clk[i])) {
> > > +                       dev_err(dev, "can't get pixel clk %u\n",
> > > i);
> > > +                       return PTR_ERR(dc->pix_clk[i]);
> > > +               }
> > > +       }
> > > +
> > > +       irq = platform_get_irq(pdev, 0);
> > > +       if (irq < 0) {
> > > +               dev_err(dev, "can't get irq\n");
> > > +               return irq;
> > > +       }
> > > +
> > > +       ret = reset_control_bulk_deassert(VSDC_RESET_COUNT, dc-
> > > >rsts);
> > > +       if (ret) {
> > > +               dev_err(dev, "can't deassert reset lines\n");
> > > +               return ret;
> > > +       }
> > > +
> > > +       ret = clk_prepare_enable(dc->core_clk);
> > > +       if (ret) {
> > > +               dev_err(dev, "can't enable core clock\n");
> > > +               goto err_rst_assert;
> > > +       }
> > > +
> > > +       ret = clk_prepare_enable(dc->axi_clk);
> > > +       if (ret) {
> > > +               dev_err(dev, "can't enable axi clock\n");
> > > +               goto err_core_clk_disable;
> > > +       }
> > > +
> > > +       ret = clk_prepare_enable(dc->ahb_clk);
> > > +       if (ret) {
> > > +               dev_err(dev, "can't enable ahb clock\n");
> > > +               goto err_axi_clk_disable;
> > > +       }
> > > +
> > > +       regs = devm_platform_ioremap_resource(pdev, 0);
> > > +       if (IS_ERR(regs)) {
> > > +               dev_err(dev, "can't map registers");
> > > +               ret = PTR_ERR(regs);
> > > +               goto err_ahb_clk_disable;
> > > +       }
> > > +
> > > +       dc->regs = devm_regmap_init_mmio(dev, regs,
> > > &vs_dc_regmap_cfg);
> > > +       if (IS_ERR(dc->regs)) {
> > > +               ret = PTR_ERR(dc->regs);
> > > +               goto err_ahb_clk_disable;
> > > +       }
> > > +
> > > +       ret = vs_fill_chip_identity(dc->regs, &dc->identity);
> > 
> > I'd say, this should be a part of the DT bindings.
> > 
> > > +       if (ret)
> > > +               goto err_ahb_clk_disable;
> > > +
> > > +       dev_info(dev, "DC%x rev %x customer %x\n", dc-
> > > >identity.model,
> > > +                dc->identity.revision, dc->identity.customer_id);
> > > +
> > > +       if (outputs > dc->identity.display_count) {
> > > +               dev_err(dev, "too many downstream ports than HW
> > > capability\n");
> > > +               ret = -EINVAL;
> > > +               goto err_ahb_clk_disable;
> > > +       }
> > > +
> > > +       ret = devm_request_irq(dev, irq, vs_dc_irq_handler, 0,
> > > +                              dev_name(dev), dc);
> > 
> > Are we ready to handle the IRQ here?
> > 
> > > +       if (ret) {
> > > +               dev_err(dev, "can't request irq\n");
> > > +               goto err_ahb_clk_disable;
> > > +       }
> > > +
> > > +       dev_set_drvdata(dev, dc);
> > > +
> > > +       ret = vs_drm_initialize(dc, pdev);
> > > +       if (ret)
> > > +               goto err_ahb_clk_disable;
> > > +
> > > +       return 0;
> > > +
> > > +err_ahb_clk_disable:
> > > +       clk_disable_unprepare(dc->ahb_clk);
> > > +err_axi_clk_disable:
> > > +       clk_disable_unprepare(dc->axi_clk);
> > > +err_core_clk_disable:
> > > +       clk_disable_unprepare(dc->core_clk);
> > > +err_rst_assert:
> > > +       reset_control_bulk_assert(VSDC_RESET_COUNT, dc->rsts);
> > > +       return ret;
> > > +}
> > > +
> > > +static void vs_dc_remove(struct platform_device *pdev)
> > > +{
> > > +       struct vs_dc *dc = dev_get_drvdata(&pdev->dev);
> > > +
> > > +       vs_drm_finalize(dc);
> > > +
> > > +       dev_set_drvdata(&pdev->dev, NULL);
> > > +
> > > +       clk_disable_unprepare(dc->ahb_clk);
> > > +       clk_disable_unprepare(dc->axi_clk);
> > > +       clk_disable_unprepare(dc->core_clk);
> > > +       reset_control_bulk_assert(VSDC_RESET_COUNT, dc->rsts);
> > > +}
> > > +
> > > +static void vs_dc_shutdown(struct platform_device *pdev)
> > > +{
> > > +       struct vs_dc *dc = dev_get_drvdata(&pdev->dev);
> > > +
> > > +       vs_drm_shutdown_handler(dc);
> > 
> > I'd suggest inlining simple wrappers.
> 
> Well I am going to divider the code to non-DRM things and DRM things
> here, so vs_drm_shutdown_handler is in the DRM things part instead.

Ack. It might be my personal preference not to have extra wrappers.

-- 
With best wishes
Dmitry
