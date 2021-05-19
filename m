Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C063891E6
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 16:50:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 122DA6EDDB;
	Wed, 19 May 2021 14:50:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B106EDDB
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 14:50:33 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id r12so14347073wrp.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 07:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Bju2/0eN1crwRy8NW0NKdt4SusccnUyH2kNJFGpO3Gg=;
 b=BQ0wb+l4eU5E6LXYCwaarjsAw6yPlLu9W6EiabgI+nO22I+6DV/bIxaDS5Kc/NkZ9z
 g5ArK3rjoggNB6rgNnxcGpn/MDh4rC5iJIQ9ptEO8ZIDJRbQovG88q8caw+Iw6Vo1K/7
 cT6j1A7d/Eqf0dtlUKxAkQlsICEjFzHrEor1ZLrZez3sN2dN8okRW2WLGn5Q5NeWtXzQ
 BJOx2fdWrlKwYPfZMPpDbIKMzFHZFm7Y9A1ibD6cMHShxytE94HxUt/iCqnMUXkl7Aev
 yPWcWLE7bC3e/1CIkS0QDIbZBE0Tuctn6mGNoYgfbMZKEz7pgUAF6QgCLssN+Kyx/SjJ
 3Zqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Bju2/0eN1crwRy8NW0NKdt4SusccnUyH2kNJFGpO3Gg=;
 b=gstShGG9lH2upUSEuMnHh1aBOnhpYdmZr1Gmj/DjFs9a/2GkvzBS/F0MRej3NFOmON
 SZcjT5iOJlhRYVP3KV1IuMRDTgHqzfkQXE+FuVNz+7Jfp5zRMORDF0ryDfOLvbaVSbFz
 EfxEKcXu31cnI8kbXIbhj/1fVju75YFUmXpnY2YZYXyAk/H3e3NiJ+6JgM/eHiZNjiOo
 cNIyfPbCHi9IB9I5OeL2juOdDBfhJz5Fmu2eK5q1EZyQqdApTcThSnEAful+Hx/i/Z0s
 iE8W441O2R89TB9V/iGUcOF6clJn0CazjPV8Sca0SAeP+sONlfKlP1MlaK3tozPbVeU7
 ygbA==
X-Gm-Message-State: AOAM531oBAFGpBRjNhYNq5yBb3762Z0Ndpn2s+M3DkUgG7ukSJwIXMMy
 npFQWHjKxpS4Q3Wgp80dH2TMyw==
X-Google-Smtp-Source: ABdhPJyiC8K7WnFxsXBX7COv5F4gSgoaz/20+HNO7ys0bYcGX56g68V0qD16NLwnO5bgMXzcNVAHcw==
X-Received: by 2002:a5d:408f:: with SMTP id o15mr14535482wrp.89.1621435831756; 
 Wed, 19 May 2021 07:50:31 -0700 (PDT)
Received: from dell ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id b10sm30501848wrr.27.2021.05.19.07.50.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 07:50:31 -0700 (PDT)
Date: Wed, 19 May 2021 15:50:29 +0100
From: Lee Jones <lee.jones@linaro.org>
To: cy_huang <u0084500@gmail.com>
Subject: Re: [PATCH v7 1/4] mfd: rt4831: Adds support for Richtek RT4831
Message-ID: <20210519145029.GD2549456@dell>
References: <1621262161-9972-1-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1621262161-9972-1-git-send-email-u0084500@gmail.com>
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
Cc: devicetree@vger.kernel.org, daniel.thompson@linaro.org,
 b.zolnierkie@samsung.com, jingoohan1@gmail.com, lgirdwood@gmail.com,
 robh+dt@kernel.org, linux-fbdev@vger.kernel.org, cy_huang@richtek.com,
 broonie@kernel.org, dri-devel@lists.freedesktop.org, pavel@ucw.cz,
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 17 May 2021, cy_huang wrote:

> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> This adds support Richtek RT4831 core. It includes four channel WLED driver
> and Display Bias Voltage outputs.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
> - Send the patch series for the wrong mail subject.
> 
> The RT4831 regulator patches are already on main stream, and can be referred to
> 9351ab8b0cb6 regulator: rt4831: Adds support for Richtek RT4831 DSV regulator
> 934b05e81862 regulator: rt4831: Adds DT binding document for Richtek RT4831 DSV regulator
> 
> since v6
> - Respin the date from 2020 to 2021.
> - Rmove the shutdown routine.
> - Change the macro OF_MFD_CELL to MFD_CELL_OF.
> 
> since v5
> - Rename file name from rt4831-core.c to rt4831.c
> - Change RICHTEK_VID to RICHTEK_VENDOR_ID.
> - Change gpio_desc nameing from 'enable' to 'enable_gpio' in probe.
> - Change variable 'val' to the meaningful name 'chip_id'.
> - Refine the error log when vendor id is not matched.
> - Remove of_match_ptr.
> 
> since v2
> - Refine Kconfig descriptions.
> - Add copyright.
> - Refine error logs in probe.
> - Refine comment lines in remove and shutdown.
> ---
>  drivers/mfd/Kconfig  |  10 +++++
>  drivers/mfd/Makefile |   1 +
>  drivers/mfd/rt4831.c | 115 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 126 insertions(+)
>  create mode 100644 drivers/mfd/rt4831.c

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
