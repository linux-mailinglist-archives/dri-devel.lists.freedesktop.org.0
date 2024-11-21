Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2949D566E
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 00:53:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A05010E42C;
	Thu, 21 Nov 2024 23:53:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kuCcFzTK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DFFD10E42C
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 23:53:50 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2fb5fa911aaso27344761fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 15:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732233228; x=1732838028; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rW4FHPt7LjmFH4gYgk/9ZboeDDlIoBJNyfpaoR1qrpc=;
 b=kuCcFzTKh7fRIFVq4Wf4P24dTm3crqyQiJmjdbOO4il2HS/ITlFJUGPKKzj5RXPQyg
 nmmkXgpIQvSkBaCdbl98AwNE+79zRbXnzh+Mzw3t9gw+cXJNIuIyyG6pPVqf6LqysICc
 yXaPn38Bwy4Hg5zJdSoNIZlbfNz5IX7MTCPKyN9KQikBH5jAMpskdib34jGVCF8iOELT
 P4CbNxzWhvVWLiRAq7wQ2iIVDVNSINz3hGAwtVkDtZ6qv0BQAPpHaK+Wie+ZRQcWp3ig
 bF5D1k4lmVfDTkm/MbVGlPlV4k79vAkr8tUVTGECXf47IqIxlQzV5GQNKBghoJZeNiwW
 ToVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732233228; x=1732838028;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rW4FHPt7LjmFH4gYgk/9ZboeDDlIoBJNyfpaoR1qrpc=;
 b=LkrrMDR11qI4gkNno+nqmbS442EuKdv79VnPjcIT55sS4s24ejr0fLmIehWLZ6HPZv
 3PSu1o8WuXeb0AVaEjH2i+SNTaHR8N/uS4bNC5nm92KeK3/biEbKheHJGZC56u9RerSs
 b2lckTbyscUF/QRM+/wMN+cMTxPPCg4JRVLVJmbQWVrjFOjZYJ+wi9p7miybnPfz8dkZ
 zggQ/MGpL8WXNBcL/fz35JxW1MMn3rNldHr/G2VrXt+5fW9PCEgCjGT1Nja/+p0ow+g6
 L5qmUhhYkVQbHsNLkDSRkhPesbAf+ILEwQf+Tj+11X7ZUgRFBWC1k5eW/fpvM4ITU1GJ
 w+RQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKoHI/4zJciv9E3jN0bms50rWBiupugCkF4MvlAmx7Z9D9ZMfVezXs0cUv5LblX/0uGQKaU3sRKqo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAjMdbUZBwUVWq6Z9Cf8biu9K6HG58TCF8HH5LQkQvBLLR901Z
 2dr29W9EmlvBysJg79PZrwbR4osXlGHSigYZFB5fe8mCzkWpQW8eNeXp6jsWnRo=
X-Gm-Gg: ASbGncsbtE+QsSySg+JFFQ1BTBZYEm/YfHdMKw4XhG4VS92OO4VMJCcTJ57XIQLcc81
 q28Lq639yUEWDHEuDPSS8fF57hVhCahlItdtml1+6/6tN5DinfSMIE079BjePVcoeTzW7/gU6o4
 blU4PUIyJpvWNEd1rajohW2JUhSRMWmjiVdQdUU2Lv5u/EIdoEPpu00bRNvWO98Cv0NY0tC++Qb
 NQ7Aw62hcngA5W51tIIhp2Ln2TWlU8fTfLD8ktIwYe0aRnA0kzgMXAvVzWbiYzWyTSG8MVvMKXL
 7xaIesVuCmvLY/eYV/wL8l/4w0O7ng==
X-Google-Smtp-Source: AGHT+IEKFx5rkvWucHRO2zn/USpeu8y9JV60QFsZKo6nRTS2RPOH5OFs4cMCGnsdocitEz0+L01gtg==
X-Received: by 2002:a2e:a58d:0:b0:2fb:6110:c5df with SMTP id
 38308e7fff4ca-2ffa716d343mr3992251fa.31.1732233228136; 
 Thu, 21 Nov 2024 15:53:48 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ffa7587d0esm359121fa.61.2024.11.21.15.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 15:53:46 -0800 (PST)
Date: Fri, 22 Nov 2024 01:53:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: keith zhao <keith.zhao@starfivetech.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com, 
 william.qiu@starfivetech.com, xingyu.wu@starfivetech.com, kernel@esmil.dk, 
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
 p.zabel@pengutronix.de, changhuang.liang@starfivetech.com,
 jack.zhu@starfivetech.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/9] drm: bridge: inno-hdmi: add inno bridge driver.
Message-ID: <djnuoqr5mj576xzbhs72vuz6ji4ayluinb4fr257okik2l762x@ocd4cm7f65pl>
References: <20241120061848.196754-1-keith.zhao@starfivetech.com>
 <20241120061848.196754-4-keith.zhao@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241120061848.196754-4-keith.zhao@starfivetech.com>
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

On Wed, Nov 20, 2024 at 02:18:42PM +0800, keith zhao wrote:
> move rochchip inno hdmi connector to a newly created directory named
> inno-hdmi.c, and rename rockchip/inno_hdmi.c to
> rockchip/inno_hdmi-rockchip.c
> 
> This patch refines the Innosilicon HDMI architecture by abstracting
> the existing connector into a bridge architecture.
> The drm_bridge_connector_init function is used to create the connector.
> 
> Signed-off-by: keith zhao <keith.zhao@starfivetech.com>
> ---
>  MAINTAINERS                                   |    2 +
>  drivers/gpu/drm/bridge/Kconfig                |    2 +
>  drivers/gpu/drm/bridge/Makefile               |    1 +
>  drivers/gpu/drm/bridge/innosilicon/Kconfig    |    6 +
>  drivers/gpu/drm/bridge/innosilicon/Makefile   |    2 +
>  .../gpu/drm/bridge/innosilicon/inno-hdmi.c    |  376 ++++++
>  .../gpu/drm/bridge/innosilicon/inno-hdmi.h    |   34 +
>  drivers/gpu/drm/rockchip/Kconfig              |    1 +
>  drivers/gpu/drm/rockchip/Makefile             |    2 +-
>  drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c |  690 +++++++++++
>  .../{inno_hdmi.h => inno_hdmi-rockchip.h}     |    0
>  drivers/gpu/drm/rockchip/inno_hdmi.c          | 1025 -----------------
>  include/drm/bridge/inno_hdmi.h                |   56 +
>  13 files changed, 1171 insertions(+), 1026 deletions(-)
>  create mode 100644 drivers/gpu/drm/bridge/innosilicon/Kconfig
>  create mode 100644 drivers/gpu/drm/bridge/innosilicon/Makefile
>  create mode 100644 drivers/gpu/drm/bridge/innosilicon/inno-hdmi.c
>  create mode 100644 drivers/gpu/drm/bridge/innosilicon/inno-hdmi.h
>  create mode 100644 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c
>  rename drivers/gpu/drm/rockchip/{inno_hdmi.h => inno_hdmi-rockchip.h} (100%)
>  delete mode 100644 drivers/gpu/drm/rockchip/inno_hdmi.c
>  create mode 100644 include/drm/bridge/inno_hdmi.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f787dd625497..7766ee0bdd74 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7439,6 +7439,8 @@ S:	Maintained
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:	Documentation/devicetree/bindings/display/bridge/innosilicon,inno-hdmi.yaml
>  F:	Documentation/devicetree/bindings/display/starfive/
> +F:	drivers/gpu/drm/bridge/innosilicon/
> +F:	include/drm/bridge/inno_hdmi.h
>  
>  DRM DRIVER FOR SYNAPTICS R63353 PANELS
>  M:	Michael Trimarchi <michael@amarulasolutions.com>
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index 683cb33805b2..37be5dd5213f 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -423,6 +423,8 @@ source "drivers/gpu/drm/bridge/cadence/Kconfig"
>  
>  source "drivers/gpu/drm/bridge/imx/Kconfig"
>  
> +source "drivers/gpu/drm/bridge/innosilicon/Kconfig"
> +
>  source "drivers/gpu/drm/bridge/synopsys/Kconfig"
>  
>  endmenu
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index 3daf803ce80b..866d1e0fd8aa 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -41,4 +41,5 @@ obj-$(CONFIG_DRM_ITE_IT66121) += ite-it66121.o
>  obj-y += analogix/
>  obj-y += cadence/
>  obj-y += imx/
> +obj-y += innosilicon/
>  obj-y += synopsys/
> diff --git a/drivers/gpu/drm/bridge/innosilicon/Kconfig b/drivers/gpu/drm/bridge/innosilicon/Kconfig
> new file mode 100644
> index 000000000000..73dbed3b1c4d
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/innosilicon/Kconfig
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config DRM_INNO_HDMI
> +	tristate
> +	help
> +	  Support the common interface which is part of the INNO
> +	  Designware HDMI block.
> diff --git a/drivers/gpu/drm/bridge/innosilicon/Makefile b/drivers/gpu/drm/bridge/innosilicon/Makefile
> new file mode 100644
> index 000000000000..3b3a961ab9fb
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/innosilicon/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_DRM_INNO_HDMI) += inno-hdmi.o
> diff --git a/drivers/gpu/drm/bridge/innosilicon/inno-hdmi.c b/drivers/gpu/drm/bridge/innosilicon/inno-hdmi.c
> new file mode 100644
> index 000000000000..c26132b41bdf
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/innosilicon/inno-hdmi.c
> @@ -0,0 +1,376 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
> + *    Zheng Yang <zhengyang@rock-chips.com>
> + *    Yakir Yang <ykk@rock-chips.com>
> + * Copyright (C) StarFive Technology Co., Ltd.
> + */
> +
> +#include <linux/irq.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +
> +#include <drm/bridge/inno_hdmi.h>
> +#include <drm/display/drm_hdmi_state_helper.h>
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_edid.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_bridge_connector.h>
> +
> +#include "inno-hdmi.h"
> +
> +u8 hdmi_readb(struct inno_hdmi *hdmi, u16 offset)
> +{
> +	return readl_relaxed(hdmi->regs + (offset) * 0x04);
> +}
> +EXPORT_SYMBOL_GPL(hdmi_readb);

Not to mention that hdmi_foo() is too generic. Please use some common
prefix through the file. At least inno_hdmi_foo() will be much better.

-- 
With best wishes
Dmitry
