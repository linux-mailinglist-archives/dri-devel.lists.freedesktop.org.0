Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 899A98A771B
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 23:59:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C39510EEC6;
	Tue, 16 Apr 2024 21:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BRT7P5Tk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6611010EEC6
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 21:59:02 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-516d0161e13so6054112e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 14:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713304740; x=1713909540; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FrWqLDNPHgTIgEAwm/yBGkXHJJ9fe1QtFWXIQREdmco=;
 b=BRT7P5Tkf+ebUDAIDgObVi6f7sZH/z6gOcZwHMk/5tEdWNGUOJiYyBjgx+BppoX+/d
 LMBs8XO6vO04ZM3K/YbsUlagFYHL+PnlgiVZMSfpxjgr3ay9xCHrm67qWJiyGv1O16Jj
 1etKbCpIJGdoS+rCJMM7TLdpxUPKMaFW6tGSjvwfAxdMpIcC1sE8hAoyqhTFpvsQci6v
 nX3BeR4cqFoJKY+80oDyHzcC+MTVYwAtdD128/BpbRq9wr1ySDpZgQ3dRZoAxvUrKxPq
 YaFGS9Mci1viSOWJLtHG3XK8riBosP/9OfoHAdrEaSseMgrzvGwl+aa1JCSMM+B7+Ox9
 ZSpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713304740; x=1713909540;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FrWqLDNPHgTIgEAwm/yBGkXHJJ9fe1QtFWXIQREdmco=;
 b=CQ/H3BL+zCr+azgQWWfLN7K6Qqc2xUrBV8BL62ve83jgp3QMYmbHsdV1YOh4ZykIx7
 qWGYvGUqIGD4mhTVadwY2bc3Hlw4egM7m8w1z1+/3NBz/iAlnekqDE0i/6uhoK3xQX5e
 pf4aVj8kwVKXoZWmIeWl/LnvUHDheGZjIBsDvgmNcbBPQ0fmkFBC0LOqvE9MWvrFCcWY
 TMlXUkIczFYnlapxDpajKxgytM/mvei951DgGoh9dw0Jh6B886V+JJ6gZDcANQ+hRoSw
 sm0nyAKQIKqSye3RAM8h1/qEtF3/S3oCoN0f+w10TuoD7yX//x91OcgfXWz9gbsXe2qV
 GOiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpQaxMK6YCBI1kB5fcmS5RtIgiXuaWxZ0Z4gSA8CV+nWa2pRnFNGBi8HRvUM0nD9RylzXfHufJjBrCLHNcjJERtvlm5wdNpklHH7lhjZNF
X-Gm-Message-State: AOJu0Yynd+Lr3HNxKTHVoFWXxc08lW7n6wutN9+XMsuNIh/95iD8Ehll
 jPg1prf/bFhGmcEmffqP+UZBYuPAydykLk82/33aICA6VAZDOKB3Yz6QO0YvRgc=
X-Google-Smtp-Source: AGHT+IHIWdijioLtvYC5fIdBBwJ5eA/9DxE81hqHqTOf/GfjKH/Bjt5bQdrOAL/NR1UOMamRdStcwA==
X-Received: by 2002:a05:6512:1c7:b0:516:d3ba:5602 with SMTP id
 f7-20020a05651201c700b00516d3ba5602mr9510074lfp.16.1713304739613; 
 Tue, 16 Apr 2024 14:58:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 k5-20020a05651210c500b00518c1a1d370sm984687lfg.101.2024.04.16.14.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 14:58:59 -0700 (PDT)
Date: Wed, 17 Apr 2024 00:58:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Chris Healy <cphealy@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 00/12] drm/imx/ipuv3: switch LDB and parallel-display
 driver to use drm_bridge_connector
Message-ID: <yh4r2pgdl2m5wp627r35zse3obacmeanin5rjo34f7tctgpix2@dme3vwzaivag>
References: <20240331-drm-imx-cleanup-v2-0-d81c1d1c1026@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240331-drm-imx-cleanup-v2-0-d81c1d1c1026@linaro.org>
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

On Sun, Mar 31, 2024 at 11:28:57PM +0300, Dmitry Baryshkov wrote:
> The IPUv3 DRM i.MX driver contains several codepaths for different
> usescases: both LDB and paralllel-display drivers handle next-bridge,
> panel and the legacy display-timings DT node on their own.
> 
> Drop unused ddc-i2c-bus and edid handling (none of the DT files merged
> upstream ever used these features), switch to panel-bridge driver,
> removing the need to handle drm_panel codepaths separately and finally
> switch to drm_bridge_connector, removing requirement for the downstream
> bridges to create drm_connector on their own.
> 
> This has been tested on the iMX53 with the DPI panel attached to LDB via
> LVDS decoder, using all possible usecases (lvds-codec + panel, panel
> linked directly to LDB node and the display-timings node).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v2:
> - Fixed drm_bridge_attach flags in imx/parallel-display driver.
> - Moved the legacy bridge to drivers/gpu/drm/bridge
> - Added missing EXPORT_SYMBOL_GPL to the iMX legacy bridge
> - Link to v1: https://lore.kernel.org/r/20240311-drm-imx-cleanup-v1-0-e104f05caa51@linaro.org

Phillip, Shawn, Sascha, any comments on this patchset?


-- 
With best wishes
Dmitry
