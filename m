Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2984B8A95
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 14:46:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6619B10EF92;
	Wed, 16 Feb 2022 13:46:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E670A10EF9B
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 13:46:30 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id j12so6059405ybh.8
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 05:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HmFgTFOaUrdQsLp+zoYLJYAEZzFKWR4iy8oL8R7YJhA=;
 b=piQF2bXbfQ3jAL9Wl9KHIEI/BE7pYDU1IMut0lIzmEScSrQTTjteMmCEzJpApNZRX4
 MiSZndY1LTZdnjzdE1PtqAozUueAsk+eHh1cDep+IbGnB9QWT9qZ4gaC5sqvfGpS3BE9
 bR1twOpbY9SOcG8uuHnhoXL91tdBw9gU9UmxqJIwGeWaiNwWUjTkd+EOa9X7qSRiP4Ic
 m8Zx0IpBhy5xVNK8CZj7uL7qa6SdAHfv0MJRk3F6unvP/KZRr7iVVemKX545Vw1/i6nD
 UkmckP1LIoEqUm8uWPqlNTOC8MeC8E9tZaCEeo4E97rXfUl6R7bkc7GrBneAs4SoAtK4
 JANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HmFgTFOaUrdQsLp+zoYLJYAEZzFKWR4iy8oL8R7YJhA=;
 b=TZFsmioxq6l0uhatrHZ8JnJlP+eGvm9dMtu3XupO5pj4zFj2ZlRjp5jQGdCBanFlXc
 KMOtT06vYrNRCy4CjIdCkufdIkz4kGYzE+pKizma++eBFM321lDfn2jOn6CNHFLv27Ha
 LODI+6zqVBf/piDJtfeSAmUbhKeQhGKjFWplEbD1nxTKo7XaMim6bW4Z4pBmTuS+5ILh
 /nmXDYfXjm2NY2m/cmXzZdLtP0mbxPGdZvESISy3EC9VwTNUcVtE1IMM0pV+bwJWR5Z4
 E7QQD/DYJnrXydRO2zKoAjcdXsP+lbaCuDxBXeGQys1kpSDaHMHFcJqPzHCcvr6fzXD6
 jJ6g==
X-Gm-Message-State: AOAM531T7GGj4TVIrvvEb+YXBnhENcQwVA0f1u06v2EOX6JaYdB++FkI
 UsenJoBx0D9AQlK4E/r/tsmyXhq6ht/kr/ksVu2rTKFF9SY=
X-Google-Smtp-Source: ABdhPJwDrfO0XNqq06G1iySq3VTrmWTvdn5Z6vOL0Eb4ZcCuGh6EN5CLGZDUWZYdveKOCjkOHjTGRR1Iq8a+ERSnC3g=
X-Received: by 2002:a25:6807:0:b0:61a:79a9:526e with SMTP id
 d7-20020a256807000000b0061a79a9526emr1995117ybc.376.1645019190069; Wed, 16
 Feb 2022 05:46:30 -0800 (PST)
MIME-Version: 1.0
References: <20220203082546.3099-1-15330273260@189.cn>
 <20220203082546.3099-2-15330273260@189.cn>
 <20220203085851.yqstkfgt4dz7rcnw@houat>
 <f5381561-25da-61e3-5025-fa6dd61dd730@189.cn>
 <20220209084331.fpq5ng3yuqxmby4q@houat>
 <def50622-fe08-01f7-83bd-e6e0bc39fe1b@189.cn>
In-Reply-To: <def50622-fe08-01f7-83bd-e6e0bc39fe1b@189.cn>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 16 Feb 2022 13:46:18 +0000
Message-ID: <CAPj87rOgk8A8s6MTqxcTO5EkS=ABpHQV3sHsAp7Yn2t3-N_SoQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] drm/lsdc: add drm driver for loongson display
 controller
To: Sui Jingfeng <15330273260@189.cn>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 suijingfeng <suijingfeng@loongson.cn>, David Airlie <airlied@linux.ie>,
 Randy Dunlap <rdunlap@infradead.org>, Roland Scheidegger <sroland@vmware.com>,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Krzysztof Kozlowski <krzk@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 9 Feb 2022 at 15:41, Sui Jingfeng <15330273260@189.cn> wrote:
> On 2022/2/9 16:43, Maxime Ripard wrote:
> > More fundamentally (and this extends to the CMA, caching and VRAM stuff
> > you explained above), why can't the driver pick the right decision all
> > the time and why would that be under the user control?
>
> The right decision for ls7a1000 is to use VRAM based helper, But sometimes
> we need CMA helper based solution. Because: The PRIME support is lost, use
> lsdc with etnaviv is not possible any more.
>
>   Buffer sharing with etnaviv is no longer possible, loongson display controllers
>   are simple which require scanout buffers to be physically contiguous.

Other systems have this limitation, and Mesa's 'kmsro' concept makes
this work transparently, as long as your driver can export dmabufs
when running in 'VRAM' mode.

Cheers,
Daniel
