Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C13B05C32
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 15:28:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D799310E5BE;
	Tue, 15 Jul 2025 13:28:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SY3/KylB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D32610E5BE
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 13:28:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6155F46A31
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 13:28:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BE1AC16AAE
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 13:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752586134;
 bh=cjc0RDMZbltboQ1RR5x3p4nAwpio8fE7hnW+L8x5WwQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SY3/KylBUzz31er79bfw/JgAJdDa2ngkftst0JZzy928l/GgYBS73xdw7M/MN4DW5
 Z6dbSTP4JvIOP96BayczV5VUU+43jcoyu/15zQKSWIbj0cjQ1eHhKuPwJHQmFX66Ao
 c1JAE0zXp/BrQ2teMrDElkQoln1mQBLwl6ShQRGRFPSSIKFTeagmpdyi7/xYT3Hkg7
 bi+LNkWJoOrhdN7+s1WZ6cFgXYFnoXTuzlvnUYC28IJkt31IxnxPD0LlORY2dJE4y2
 CFzk1DuBG+y3ktemrkz/2iMka1VwssdRacpiFf2Vad9euP/bH1P/shMIDlNwrtHfsj
 q3mx5Fy+aie7w==
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-ae3703c2a8bso1022341366b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 06:28:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWGqg9F6PksrRWwHsF1mYn8TIlj6Vl1SX4hZykfBbAgF4U/isGGxqGuVdRRwXyIDwuCFa+ffbS0NYA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwocFiOx3sm/01OXX8QyD0dB9yKWNqQUTE09Y2yHMS5I5NeV4Mz
 pW6e8G0+Ge4znSqhq5CUH7YuDzqFN7TiFaJ3nJZfkqrRvT5N9ANeBkCNfzSGKnYYVrF0kusPB1M
 syyAnIEb3vocKowhzPTzfLsg4HOCzjQ==
X-Google-Smtp-Source: AGHT+IFs4W+Mc6KDmPR+BhSyiX4vw23rKBtHp3go5SamoCNjOmpMqCPQF8aMkbamXqomTl4rbMZSJDZEUQ5/54iNNzQ=
X-Received: by 2002:a17:906:730b:b0:ad5:4a43:5ae8 with SMTP id
 a640c23a62f3a-ae6fbc63f70mr1723987166b.12.1752586132534; Tue, 15 Jul 2025
 06:28:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250715122643.137027-1-tzimmermann@suse.de>
 <20250715122643.137027-5-tzimmermann@suse.de>
In-Reply-To: <20250715122643.137027-5-tzimmermann@suse.de>
From: Rob Herring <robh@kernel.org>
Date: Tue, 15 Jul 2025 08:28:41 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ-o05oO1TGexj7s68=9peSQURxF3siw5hDK2fU7AgMxQ@mail.gmail.com>
X-Gm-Features: Ac12FXxI8wW_XXiQYlbiT9UidRz349kSHXmlUTD2OUpFDmpZ1t1a8EguF44xgCA
Message-ID: <CAL_JsqJ-o05oO1TGexj7s68=9peSQURxF3siw5hDK2fU7AgMxQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/15] drm/panel: panel-summit: Include <linux/of.h>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, 
 neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, deller@gmx.de, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com, 
 simona@ffwll.ch, fnkl.kernel@gmail.com, j@jannau.net, hdegoede@redhat.com, 
 ilpo.jarvinen@linux.intel.com, sven@kernel.org, alyssa@rosenzweig.io, 
 neal@gompa.dev, support.opensource@diasemi.com, duje.mihanovic@skole.hr, 
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
 platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Jul 15, 2025 at 7:30=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Include <linux/of.h> to declare device_property_read_u32() and
> struct of_device_id. Avoids dependency on backlight header to include
> it.

Neither of those come from of.h.


> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Janne Grunau <j@jannau.net>
> ---
>  drivers/gpu/drm/panel/panel-summit.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-summit.c b/drivers/gpu/drm/panel=
/panel-summit.c
> index 4854437e2899..02aa1ec287d6 100644
> --- a/drivers/gpu/drm/panel/panel-summit.c
> +++ b/drivers/gpu/drm/panel/panel-summit.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>
>  #include <linux/backlight.h>
> +#include <linux/of.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_mipi_dsi.h>
>  #include <drm/drm_mode.h>
> --
> 2.50.0
>
