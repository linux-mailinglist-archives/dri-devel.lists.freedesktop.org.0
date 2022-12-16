Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A8164F568
	for <lists+dri-devel@lfdr.de>; Sat, 17 Dec 2022 00:58:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FC1210E643;
	Fri, 16 Dec 2022 23:58:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com
 [209.85.161.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 352CE10E643
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 23:58:01 +0000 (UTC)
Received: by mail-oo1-f43.google.com with SMTP id
 x38-20020a4a97e9000000b004a5d69cfc90so618763ooi.6
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 15:58:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Tcdg0k7Cdg8VA/ZRDqBYYjvgYwpOlv75s0RkGKt+5o0=;
 b=GJ4dmOmznSVBU+V7XXwlSh3b03Y5qFT8fnkYZ3Lk4FGG3QJMZacUQjrmiauSkY4CXE
 s3B8VYoK261CWDZAPpxo3dGdvpZuNq89jLLYCIi6q6Dw0e7GB2U4Byi6wAKGLuzCO0ee
 8KrezGhe/NaGfDMPB1F1d9f5ynINseT3Q93Qvkm0X+asYZooGcYwnO5+AGjTtHUioC/t
 FYpjR2hTiCPkz6euBMaomaIG+7VQhp1bjfnwL5WdNtEgHj4jCFynUO9nP8KapZEyoj5J
 XNhSQpeS7kFfc5vtlxxXQoe8VWqUTzAeq67M1Vb8A4r4ye2Ntylk1HhPGeKLthl7LaLR
 FAjQ==
X-Gm-Message-State: AFqh2kqXLOQ+dOHzkxBHwIkJ4UkOi6faOzULqNiEpZzCofvJ8dvKlkCq
 eFpC35xxXIpen3yrexXReA==
X-Google-Smtp-Source: AMrXdXuUo5wmkw7Vf1pNBI7XZd73zpyRDnv75rfYLCy7fG+J7xPYe7FpvV+HszIxkXo8ZdUyYPhOAA==
X-Received: by 2002:a4a:e79a:0:b0:4a0:72aa:4ca8 with SMTP id
 x26-20020a4ae79a000000b004a072aa4ca8mr214132oov.7.1671235079655; 
 Fri, 16 Dec 2022 15:57:59 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 j23-20020a4adf57000000b004a3543fbfbbsm1442686oou.14.2022.12.16.15.57.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 15:57:59 -0800 (PST)
Received: (nullmailer pid 108564 invoked by uid 1000);
 Fri, 16 Dec 2022 23:57:58 -0000
Date: Fri, 16 Dec 2022 17:57:58 -0600
From: Rob Herring <robh@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v3 0/2] drm/imx/lcdc: Implement DRM driver for imx21
Message-ID: <20221216235758.GA88372-robh@kernel.org>
References: <20221216175006.456831-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221216175006.456831-1-u.kleine-koenig@pengutronix.de>
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
Cc: devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 16, 2022 at 06:50:04PM +0100, Uwe Kleine-König wrote:
> Hello,
> 
> Changes since v2:
> 
>  - added allOf as Krzysztof requested
>  - reworked driver based on Philipp's comments
>    (improved error handling, different selects, moved driver to a subdirectory,
>    header sorting, drm_err instead of DRM_ERROR, inlined
>    imx_lcdc_check_mode_change, make use of dev_err_probe())
>  
> Krzysztof also pointed out that we're now having two compatibles for a
> single hardware. Admittedly this is unusual, but this is the chance that
> the (bad) compatible identifier imx21-fb gets deprecated. The hardware
> is called LCDC and only the linux (framebuffer) driver is called imxfb.

The problem is you can't have firmware (with the DTB) that supports 
both. Well, you can if you want to have some firmware setting that 
selects which one. Otherwise, it's really an OS problem to decide what 
to use. 

Rob
