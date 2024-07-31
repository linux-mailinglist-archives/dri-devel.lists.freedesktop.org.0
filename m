Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B4294310C
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 15:38:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0314910E618;
	Wed, 31 Jul 2024 13:38:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="drgC3doj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D743010E618
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 13:37:58 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-52efa16aad9so8654785e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 06:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722433077; x=1723037877; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=euZqe8MZJ1dwlC2Y71IAY6QKt2ZvC3bSg9scHU/4CGE=;
 b=drgC3dojUhAFLWY8vcdAAiWiloNmwKs/SVeKUkq7PDJO9rzDzQ5jfodtrl+xppC6Yh
 KV/ge3eSIANpJxt2irEhwTdgWQLXbXJUsyYtp8GX4Nm0bzJvqlfAcqM3R9VHqEkjtet4
 eqSQTIwRdYsQSIaL5cCe1JSC/gOyPa8QdFcQj5SbFgdK8r6GtLYHdZ/VuhGivOrsCJLD
 cvlaFLcSurZ8V2na1Z1xzfPHnCNpsWr9AozxKJOWunLXTFkKbB6a3b5uRgqaE7R/xIrW
 6OH+e4KR5ayeGjPqRGFcO3r5/wjnUz1FPkB6ZkG0l6MiSMy3VVHoAWY+21JEJF0Tsfw1
 nH8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722433077; x=1723037877;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=euZqe8MZJ1dwlC2Y71IAY6QKt2ZvC3bSg9scHU/4CGE=;
 b=SmqUKECWHtFtDeSu0paoIqp8DZJe1m/uEye/wTLkJTHNJBd/TQQNqr6elNKeK3Q7of
 hMEOlga+Vd0x2H/MDVSPIFPoSLMBMGv9qftoMtArLUk/MeDa6V448LJnZISILTLoPpF6
 q1yJhN4tQdvT5uCJgS3CjL/MdgkmD366kMZMlMsraTHGhYD7Q38z/ZcM3tq6EIkCNk5G
 Z80GX600JkFKf46EZaU9w35ob1OjAikoq0+iEchiJiTVK1ZCj38Bfb70TQzSX/k3sE3M
 Bc0p3EcKREKBf/x7XZEFAxRP4ASbyYhZLPvQWOWkHbfigbw81TyVyxMUvy1DoOtQsL5i
 2h8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoFn7sJSKyfFrq/19lKCnoT0Pw1IkZDoYqnsIpRgERsptkcLjAUzkpK72WzoRu/e82q95p+qbkRiAvFHd/rsuIT5BniJOjxQwM49LoWkRQ
X-Gm-Message-State: AOJu0YzwYBgnELbgwFCBmhL2nm27EJGlbKgNC/hZ6wOA/IuFmbY7GQkY
 UOBW79ALlBVxQ3jkjrIXzKp9w5/Z0M6FGeGQ0+bY4h339n8eRMG+wuGp/Mu2EAo=
X-Google-Smtp-Source: AGHT+IGKaoo2n5sBYtF5hcWxbazPmSsCMpENigLQEchBKSKDBDseQvdPfye9t44dyqo8bVsTDtKSeQ==
X-Received: by 2002:ac2:5968:0:b0:52f:d090:6dae with SMTP id
 2adb3069b0e04-5309b2ce519mr9386789e87.52.1722433076670; 
 Wed, 31 Jul 2024 06:37:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52fd5c19d5fsm2231849e87.204.2024.07.31.06.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jul 2024 06:37:56 -0700 (PDT)
Date: Wed, 31 Jul 2024 16:37:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 Chris Healy <cphealy@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 00/12] drm/imx/ipuv3: switch LDB and parallel-display
 driver to use drm_bridge_connector
Message-ID: <pagkojyl72by6mru6ky5niiffqrt2dpny5jqmw4z5aedmr23h7@qmzbbt4laikx>
References: <20240602-drm-imx-cleanup-v3-0-e549e2a43100@linaro.org>
 <uqsnphe2pm366xenpdvtsxvpkiewgmxoqyv2zvbgc3ewlx23mp@guesbce35jcm>
 <e4cf5a6a2be51fe9c7fff54e30cf3bd6f1d3534e.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4cf5a6a2be51fe9c7fff54e30cf3bd6f1d3534e.camel@pengutronix.de>
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

On Wed, Jul 31, 2024 at 03:12:44PM GMT, Philipp Zabel wrote:
> Hi Dmitry,
> 
> On Sa, 2024-07-27 at 14:17 +0300, Dmitry Baryshkov wrote:
> > On Sun, Jun 02, 2024 at 03:04:40PM GMT, Dmitry Baryshkov wrote:
> > > The IPUv3 DRM i.MX driver contains several codepaths for different
> > > usescases: both LDB and paralllel-display drivers handle next-bridge,
> > > panel and the legacy display-timings DT node on their own.
> > > 
> > > Drop unused ddc-i2c-bus and edid handling (none of the DT files merged
> > > upstream ever used these features), switch to panel-bridge driver,
> > > removing the need to handle drm_panel codepaths separately and finally
> > > switch to drm_bridge_connector, removing requirement for the downstream
> > > bridges to create drm_connector on their own.
> > > 
> > > This has been tested on the iMX53 with the DPI panel attached to LDB via
> > > LVDS decoder, using all possible usecases (lvds-codec + panel, panel
> > > linked directly to LDB node and the display-timings node).
> > > 
> > > To be able to test on the iMX53 QSRB with the HDMI cape apply [1], [2]
> > > 
> > > [1] https://lore.kernel.org/all/20240514030718.533169-1-victor.liu@nxp.com/
> > > [2] https://lore.kernel.org/all/20240602-imx-sii902x-defconfig-v1-1-71a6c382b422@linaro.org/
> > > 
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > > Changes in v3:
> > > - Notice (soft) dependencies in the cover letter (Chris)
> > > - Select DRM_BRIDGE instead of depending on it (Philipp)
> > > - Dropped unused selection of DRM_PANEL (Philipp)
> > > - Added missing include of <drm/bridge/imx.h> to parallel-display.c
> > >   (Philipp)
> > > - Link to v2: https://lore.kernel.org/r/20240331-drm-imx-cleanup-v2-0-d81c1d1c1026@linaro.org
> > > 
> > > Changes in v2:
> > > - Fixed drm_bridge_attach flags in imx/parallel-display driver.
> > > - Moved the legacy bridge to drivers/gpu/drm/bridge
> > > - Added missing EXPORT_SYMBOL_GPL to the iMX legacy bridge
> > > - Link to v1: https://lore.kernel.org/r/20240311-drm-imx-cleanup-v1-0-e104f05caa51@linaro.org
> > 
> > Just a gracious ping, this has been without maintainer's review for
> > nearly two months.
> 
> I don't have any active i.MX6 projects right now, which increases
> latency. I'll get around to reviewing the remaining changes and testing
> on i.MX6 this week or next.

Thanks!

-- 
With best wishes
Dmitry
