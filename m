Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD55177D2D
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 18:18:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B426C6E91F;
	Tue,  3 Mar 2020 17:18:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com
 [IPv6:2607:f8b0:4864:20::92c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD8386E91F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 17:18:23 +0000 (UTC)
Received: by mail-ua1-x92c.google.com with SMTP id y3so1422580uaq.5
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2020 09:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AVegDOLzNVYzcTpewPKDP4cWiTnlYs5VF/ylf2IjK9I=;
 b=TszVQHZpP/5WYkppqmcW9knLRiGV3oJVaYI3RN/maCl8aLJ95vqeHD9bXW//RHpSkr
 zgRuwne3Tnl+Zg2Ldc/PwUJwi2OWGAtmbdESlupoUZCD4/w2NtfpDI9pmNk2nc+CSonM
 WIcMhv7XvqP3zduq43RoW7NsChWSvRBHOl16Keg4A1ZuqoOQv7plUKJ7kOkrfNRyowIe
 6mP6jopyMkFhI0NaRap0eqpoFtS5M91g4IKQSIoHW6O7V3ajbWungKvAYYoyzqMTz/Fx
 9oz/64mVZUxTUCYR7BLbklm7ZuVxrlQGnggm7lORsIOo5jTrseLL1KlqI2neqN2qY8ft
 Aw1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AVegDOLzNVYzcTpewPKDP4cWiTnlYs5VF/ylf2IjK9I=;
 b=MJamii2xGMpAidtmW7gt5B/YC2/X9Q27IjQDt/seXtOvLxyrMQiF3jxHtjvB6V9AtH
 XQrsUzwWgDVFiidC5gylvkhjIOdeMpIRF3iLOiH0xwAnpdC2QIK9BHnNAmKC0SkN+bdI
 H6ypKGFzXeqct/BTKFggnrxb44Iqgqh631ayljbd01Tr3Msx3Pqx/SpUdP+SPoO1Ug4j
 zDwkh+lxhTsBtdOt5yjCNz+t62pRV6Vn038Q19X2f+jE8F/SG1m18NMy6Xo1jUeR52db
 0uHyaFWtolMCWkpNtqBd3fE5Ttmwo6brBBvq0ypo3hfbV/uBYvAtvRCHTIsSVFM25A9A
 wYEg==
X-Gm-Message-State: ANhLgQ0YNdaVCc24YdjrD1OWWhuEncXlc/apU+90sUWukpwXuQIaINOh
 1xGW8SyH6HudxhtS/UPU1VCtKa1FjrlFXzgzaZA=
X-Google-Smtp-Source: ADFU+vtswVJXUliXfR0HzjmKMR/9eeJTuKwz7wESOKbtHnOsbq+YELdxWONest6oVDnNRS+tYsUyY4uIoibRyOGZXTk=
X-Received: by 2002:ab0:14a2:: with SMTP id d31mr3323979uae.106.1583255902801; 
 Tue, 03 Mar 2020 09:18:22 -0800 (PST)
MIME-Version: 1.0
References: <20200303120136.18294-1-andrzej.p@collabora.com>
 <20200303120136.18294-7-andrzej.p@collabora.com>
In-Reply-To: <20200303120136.18294-7-andrzej.p@collabora.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 3 Mar 2020 17:17:50 +0000
Message-ID: <CACvgo50Jyyc02UDON5ROUUUQmRgDBuVm9mzCr5O1_cQVj2u=kw@mail.gmail.com>
Subject: Re: [PATCHv6 6/6] drm/rockchip: Add support for afbc
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

On Tue, 3 Mar 2020 at 12:02, Andrzej Pietrasiewicz
<andrzej.p@collabora.com> wrote:

> +static struct drm_framebuffer *
> +rockchip_fb_create(struct drm_device *dev, struct drm_file *file,
> +                  const struct drm_mode_fb_cmd2 *mode_cmd)
> +{
> +       struct drm_afbc_framebuffer *afbc_fb;
> +       struct drm_framebuffer *ret;
> +
> +       afbc_fb = kzalloc(sizeof(*afbc_fb), GFP_KERNEL);
> +       if (!afbc_fb)
> +               return ERR_PTR(-ENOMEM);
> +
> +       ret = drm_gem_fb_init_with_funcs(dev, &afbc_fb->base, file, mode_cmd, &rockchip_drm_fb_funcs);
> +       if (IS_ERR_OR_NULL(ret)) {
Like with 1/6 this should be IS_ERR().


> +static bool rockchip_mod_supported(struct drm_plane *plane,
> +                                  u32 format, u64 modifier)
> +{
> +       if (WARN_ON(modifier == DRM_FORMAT_MOD_INVALID))

AFAICT this should never trigger. If it does nearly every DRM driver
will be broken.
Seems like you've copied this from malidp and another offender being meson.

Would suggest fixing the latter two (optional), but at the very least
let's avoid adding new instances.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
