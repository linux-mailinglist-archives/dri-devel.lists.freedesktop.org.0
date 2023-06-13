Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DCF72DFC1
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 12:38:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8450010E36A;
	Tue, 13 Jun 2023 10:38:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1F6710E360
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 10:38:49 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-30fd128eebcso127274f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 03:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686652728; x=1689244728;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6d+VLj6m3MAAbwrIUd63IBRinbYN+a8k/C8reDLCUoA=;
 b=hgjHCdmVZj17ygZWDKclgn2+Ytse1qSnmaG4LRvuBitz3LJyh5HgOVAUSo0/r7wbdt
 fdSIKGBQtVODe5/DiwzNAY75tQn14eC3cn9Q2yhq2toPlE76Oa5oFJdV9l1XnL0YG0RH
 fxvfeGPQ4hK4wvvH1FIqK7kR5+J3EkpRC2wIwVTAmEGdctNMUqczSpR/pqHqlcdrvXNx
 w+5FbTeVgBNFZVVGyto35QUzWBVlGziPVY46F9DgTYoTMe+PwdW3jVov2buriiM7Vv2s
 PvmiMKy9I+IiUkPF6osBSwKSkROBznVLomANfzqMBfERLZUvUZy0htIwFzMk6D4nAIGS
 /3Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686652728; x=1689244728;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6d+VLj6m3MAAbwrIUd63IBRinbYN+a8k/C8reDLCUoA=;
 b=BxI3YRqeaDP4kAJ6YwuSkjh8k9mXfevlTZ5WzPAP8BMwfj7CP5ci5EbF6MoJutg+zt
 vbbhGvwVnucpM6AOMwdiMUg7x+yJDaQkTUcrX2jXj1NRkRUvWpe2OxnxPdywfZnfgbM4
 dsoMMDuH5E3rQtmCl+lN+HXwHQdB7bcob5HXmZSsOHUFI/4xebgACzuu6ZPcm+myH5JY
 dbf3/QNDC/YD3VBtEDFbIbaFrUxy6czGcNHpihLM4zG4r4Oltw59+kmDqD8xB6bTma6G
 5NUl8fJS30d6OIwOMTttQTX/H13+pu8sHZR6nEa7h5IKnoBLoch35neu+JzPOTBrjzc+
 vINw==
X-Gm-Message-State: AC+VfDzVEGwSmi/WONK0zLTHJgBCQ5e4uDhyeg9o2JB559TniYfJoFuN
 5GU4xpqYxLis6L+OgDCsuDxNjw==
X-Google-Smtp-Source: ACHHUZ5HGIJRgD5nl4Qh50NEPcobvGP0CTVSW1VYZZsJoGlj0SicoFaUzO4TaUafxBw4qtclMnMW2w==
X-Received: by 2002:a5d:6a0b:0:b0:309:46a4:6378 with SMTP id
 m11-20020a5d6a0b000000b0030946a46378mr5778964wru.12.1686652727984; 
 Tue, 13 Jun 2023 03:38:47 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a5d6649000000b0030f9dc63ff1sm13001387wrw.88.2023.06.13.03.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 03:38:47 -0700 (PDT)
Date: Tue, 13 Jun 2023 11:38:45 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 03/38] backlight/gpio_backlight: Compare against
 struct fb_info.device
Message-ID: <20230613103845.GC169438@aspen.lan>
References: <20230612141352.29939-1-tzimmermann@suse.de>
 <20230612141352.29939-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612141352.29939-4-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 geert+renesas@glider.be, linux-sh@vger.kernel.org, jingoohan1@gmail.com,
 deller@gmx.de, lee@kernel.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rich Felker <dalias@libc.org>, michael.j.ruhl@intel.com,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 stable@vger.kernel.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-omap@vger.kernel.org, sam@ravnborg.org, dan.carpenter@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 12, 2023 at 04:07:41PM +0200, Thomas Zimmermann wrote:
> Struct gpio_backlight_platform_data refers to a platform device within
> the Linux device hierarchy. The test in gpio_backlight_check_fb()
> compares it against the fbdev device in struct fb_info.dev, which
> is different. Fix the test by comparing to struct fb_info.device.
>
> Fixes a bug in the backlight driver and prepares fbdev for making
> struct fb_info.dev optional.
>
> v2:
> 	* move renames into separate patch (Javier, Sam, Michael)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 8b770e3c9824 ("backlight: Add GPIO-based backlight driver")
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Rich Felker <dalias@libc.org>
> Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: linux-sh@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v3.12+

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
