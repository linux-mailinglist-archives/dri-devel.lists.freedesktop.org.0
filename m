Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F27177C84
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 17:57:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ABE66E91A;
	Tue,  3 Mar 2020 16:57:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13ADD6E91A
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 16:57:23 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id t12so2818072vso.13
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2020 08:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=espGg5XmUZ6anAA9ObNFtt/Ny3oxen7Il7bAjfrL204=;
 b=YAopoCFqI9azDHsXqdkvsVV0qnYjsM7It2WtkTnFycitEUM8AbKkCL6sM1eAE9SceQ
 KJAgOYe4HNLbSmbUEbK0axN1sRJQRAkNvuqwYs2KO93AbRbsmQolvHezPOqdA/pOeJ+X
 fwvw1vdxdBwWJYqjFoEOK//XoFMv3Q7LndFhiEmRD9BEgwCjPd3doHEkzMG0TSpvYqr8
 PrU3ckl1dluvR1ZDC7+yKL9Sa2z25U0Yv+mF7jPzt9dnEtOrYPzoQhZaYoQ0kz2Rs38g
 mka1W2Y1jgrlFB9/Umqh9rsf/s7pbt1jf6K5uUPCFGhWgdpzvNqq/8kHFkkKBTYewQ7z
 m9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=espGg5XmUZ6anAA9ObNFtt/Ny3oxen7Il7bAjfrL204=;
 b=WYAgaDrnlz4ixw7C0yzdJPbrDVNaWKhIyD08iwpG+ijmJ59rhPLp4OFLN9AnercnL8
 4s9/zVjdDocasVf9jDCgKMGjMf/E3ZcViCf8upOYefG40KC4ORPe9+hwYteoy3ZpN5Fx
 1uJkhdd04NIq+ZI3DeJXVLBNzveJ1hEUwmbp53nKDVE5x0OPsHd26/FTA0vs6bh/FURW
 GCHIDNsWP6gAhYpkmx75zW1S8YfM+jv+IJFkJ0p5uY+BnVu/9b/pS3+FPrKVL5bi8h4x
 L0O7ISBQR0yf1aTXPxZE/M1m0mjU5BrW2KRBrj6lzca9u5pcnvE9CTJGpSwfCwJV7PtJ
 n24g==
X-Gm-Message-State: ANhLgQ2h5mguQFA+/erATUAZ41Vj/UqnwY1GwtR5u6oqND700gehbjNo
 Kz1S8KVYFhYV9V5Muc/WTCFIQGWK4eJDDo7Sz4I=
X-Google-Smtp-Source: ADFU+vvkbihVB8At9CNGuForfEuOq8tb/7Q/Pw3gVnwN61OGibkeQ3rIaMEvza23K0tUjSPWwcz+Lm2CpTOOQWKrG10=
X-Received: by 2002:a05:6102:9c7:: with SMTP id
 g7mr2986453vsi.186.1583254642220; 
 Tue, 03 Mar 2020 08:57:22 -0800 (PST)
MIME-Version: 1.0
References: <20200303120136.18294-1-andrzej.p@collabora.com>
 <20200303120136.18294-2-andrzej.p@collabora.com>
In-Reply-To: <20200303120136.18294-2-andrzej.p@collabora.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 3 Mar 2020 16:56:49 +0000
Message-ID: <CACvgo52ms4jesEsCkFqPJMRWK+kHwAFQ0DCdCP8hnn+oJjni0A@mail.gmail.com>
Subject: Re: [PATCHv6 1/6] drm/core: Allow drivers allocate a subclass of
 struct drm_framebuffer
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
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
Cc: kernel@collabora.com, Mihail Atanassov <mihail.atanassov@arm.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 Sandy Huang <hjc@rock-chips.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 James Wang <james.qian.wang@arm.com>, Ayan Halder <Ayan.Halder@arm.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrzej,

On Tue, 3 Mar 2020 at 12:01, Andrzej Pietrasiewicz
<andrzej.p@collabora.com> wrote:

>   * Returns:
>   * Pointer to a &drm_framebuffer on success or an error pointer on failure.
>   */
>  struct drm_framebuffer *
> -drm_gem_fb_create_with_funcs(struct drm_device *dev, struct drm_file *file,
> -                            const struct drm_mode_fb_cmd2 *mode_cmd,
> -                            const struct drm_framebuffer_funcs *funcs)
> +drm_gem_fb_init_with_funcs(struct drm_device *dev, struct drm_framebuffer *fb,

> +drm_gem_fb_create_with_funcs(struct drm_device *dev, struct drm_file *file,
> +                            const struct drm_mode_fb_cmd2 *mode_cmd,
> +                            const struct drm_framebuffer_funcs *funcs)
> +{
> +       struct drm_framebuffer *fb, *ret;
> +
> +       fb = kzalloc(sizeof(*fb), GFP_KERNEL);
> +       if (!fb)
> +               return ERR_PTR(-ENOMEM);
> +
> +       ret = drm_gem_fb_init_with_funcs(dev, fb, file, mode_cmd, funcs);
> +       if (IS_ERR_OR_NULL(ret))
We can make this "IS_ERR", since the function never returns NULL.
The documentation explicitly states that error pointer is returned.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
