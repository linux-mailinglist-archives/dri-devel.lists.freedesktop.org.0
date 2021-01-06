Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFC42EBB61
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jan 2021 09:53:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAA6F89DB4;
	Wed,  6 Jan 2021 08:52:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C450289C07
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jan 2021 07:13:39 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id t16so3666053ejf.13
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Jan 2021 23:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rT4Dc8swlK31/4OXAMfRD8Dy9QIvv8YpGOiKzBJjVS0=;
 b=kW/FIQ9UMgiQ4U+TkdADVoEYk5gZPV3uhWmFEaBISm60k6X7HKncaLJMcm7Te12ixW
 DmozTsbCxinSR4kw60jnPkTRpJcI2yoqWEX3PsYD1Gobe1MgtRCRsAYMvDuT6a2OmRZe
 JA5aIaNzC2Qz1QI2pjKK7hj+qAEnukuAv07b9W7M8pBoGmUjZmXbHaL5522RR1fvjBcC
 aUOByaCkN/CFtegf2L0lfAhcsuMiZ+e/Z0kGD0hJrq1CBcozlTfyZi2pX2qyg5tLtp5K
 qfoj7U94CqKy1yfDXJToNFtVkn5zEBI7/9XBDJd/bwiyCn1gMrTQ4lsyGmJDatnR3P5D
 m6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rT4Dc8swlK31/4OXAMfRD8Dy9QIvv8YpGOiKzBJjVS0=;
 b=A+1VpElQhDigE+hmv2UfGbuhj9GoXgKGAt0tL7O0z7XLbQCQWxbEffnR0y2WJS7nFD
 8cB0+X/hVcxO6KW1jwWp/GUF4TGLRC2hPt61Y5Y+JCC0ZLYmbE3Qh3L/O/yUlCOtz2vm
 /ADL4uv5GMnVJMd/8rsvafKFkp6HcMSotD6UHK00xShZNIC0M+6nr0Rvxh51wQz2Bew6
 MQu2NKSW2HTeTFZaUuKGWSKBHcjGd6bKNeRyxMLSNJ2MZq1MSvUKZoLPk9t4O5P2rVxr
 vwH9c+LaEJSXYfhyYauzL6m4swWuDleJ0skpwrM+CsRMzBKTUmEIEYPBaCXe8sG2PDBB
 yBaQ==
X-Gm-Message-State: AOAM530Yhn9KysfT7VB1kwKERk8LOWfJQO9nHGIvVqPIWLCKc8BWenbf
 nUbP5kxxvGBwM+iw6+ZBCpIOZSpCDLM8f8X76rLxaw==
X-Google-Smtp-Source: ABdhPJz7NZsjb4UgOGiErAdqwk42sh/yXenAjVlhxnzAVaOFNfM5U6i5Q3E7GI/VvU/IA448wOjGCY/95IeDdC3rxz4=
X-Received: by 2002:a17:906:8594:: with SMTP id
 v20mr1986708ejx.470.1609917218321; 
 Tue, 05 Jan 2021 23:13:38 -0800 (PST)
MIME-Version: 1.0
References: <20210104230253.2805217-1-robh@kernel.org>
In-Reply-To: <20210104230253.2805217-1-robh@kernel.org>
From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Wed, 6 Jan 2021 08:13:27 +0100
Message-ID: <CAMpxmJVFFu6q53-O_iWCyhY3M3up2Hg1TMY_DpmOvED4eN8bJQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Add missing array size constraints
To: Rob Herring <robh@kernel.org>
X-Mailman-Approved-At: Wed, 06 Jan 2021 08:52:53 +0000
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, USB list <linux-usb@vger.kernel.org>,
 linux-iio <linux-iio@vger.kernel.org>, linux-remoteproc@vger.kernel.org,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-drm <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-ide@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, netdev <netdev@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>, Marc Zyngier <maz@kernel.org>,
 linux-riscv@lists.infradead.org, Chanwoo Choi <cw00.choi@samsung.com>,
 Chen-Yu Tsai <wens@csie.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 linux-serial@vger.kernel.org, Linux Input <linux-input@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, linux-media <linux-media@vger.kernel.org>,
 Ohad Ben-Cohen <ohad@wizery.com>,
 linux-devicetree <devicetree@vger.kernel.org>,
 linux-pm <linux-pm@vger.kernel.org>, linux-gpio <linux-gpio@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 arm-soc <linux-arm-kernel@lists.infradead.org>, Jens Axboe <axboe@kernel.dk>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-spi@vger.kernel.org,
 Sebastian Reichel <sre@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 5, 2021 at 12:03 AM Rob Herring <robh@kernel.org> wrote:
>
> DT properties which can have multiple entries need to specify what the
> entries are and define how many entries there can be. In the case of
> only a single entry, just 'maxItems: 1' is sufficient.
>
> Add the missing entry constraints. These were found with a modified
> meta-schema. Unfortunately, there are a few cases where the size
> constraints are not defined such as common bindings, so the meta-schema
> can't be part of the normal checks.
>

[snip!]

>  .../bindings/gpio/gpio-pca95xx.yaml           |  1 +

[snip!]

> diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
> index f5ee23c2df60..57cdcfd4ff3c 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
> +++ b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
> @@ -81,6 +81,7 @@ properties:
>      const: 2
>
>    reset-gpios:
> +    maxItems: 1
>      description:
>        GPIO specification for the RESET input. This is an active low signal to
>        the PCA953x.  Not valid for Maxim MAX732x devices.

Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
