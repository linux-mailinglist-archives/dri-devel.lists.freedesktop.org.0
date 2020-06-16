Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0551FB3A2
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 16:09:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 701CD6E8C6;
	Tue, 16 Jun 2020 14:09:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com
 [IPv6:2607:f8b0:4864:20::a42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EB7F6E8C5
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 14:09:40 +0000 (UTC)
Received: by mail-vk1-xa42.google.com with SMTP id s6so1630956vkb.9
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 07:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=kvkbSZZ2ghPvtr7g+4DwKKTOPHzQ+JkuiYjOoBKXQ1E=;
 b=MJHlkngFT133npieWpyoGh0urU3iWbGas7CJZrtMJerpGuJtXJBloYvzE44huOfDvE
 a+B2I1EBIwegx2wV251qk0dxjJ99+TVLMAqauve8tcZ/Czgrah7MQQ9zWAcV9Tfi1xha
 368bEbvhG4rwhmCGX8rOyR5bixzGVSwmAMPwD6QW2bTSIQh9lUvIM33As4HJz19uN1Br
 HJp2wwAzWFPjN5Re7TByc9JQSxrZvwsUW3K2FdN4eakM9unoII1EBeAVH+SxY6FAnGxd
 GwnXUnN4QQOVPAAy+h7We3R1u3lxfmC3vixsKANC95sKfUVVE+mFs+DQdYIE/Cezz8YZ
 W4Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=kvkbSZZ2ghPvtr7g+4DwKKTOPHzQ+JkuiYjOoBKXQ1E=;
 b=OjnojaPFtWTi5UnsNCBjZgsnTSPdBW8QfVA3S5i6MxVr7Jwhg0DIUj3nPXoosZBM9N
 PgSYcUaTYzpHtDJ+b5HvMgjreEjV127tfSce4ypHiyJKPCS6JH+4RWPgxqznlBrc35SU
 UYotAJ8ic+RqT3b6/0KE6E9r6/ORtxjrmFkglnadq78CvBJPj+DxWUc3Mfnk9+wBQ+dS
 sc0Hoaks4j4KtunskyoHxJGleparNGf8yUrSQGR4h1Beald49/Nnn8A2UzYH/5fGgsFQ
 P0I+7i6qFa0PkkZwdlmzQx0SQ1SqQ9me/oy3STMZGwx+qRw8EWp//iRN2zOub9a/UZu1
 e1bQ==
X-Gm-Message-State: AOAM531Mm42uHa8PkW06VkdvqPraX1MAczWeSKsPVdWEwFmFxGkahiZK
 UjST4pwrjokyFX6gArt7GXRgU9RWD33064YlU1w=
X-Google-Smtp-Source: ABdhPJze8O6g9fE6ltSX85adg2jK4puYbKO8MUJwujXYHUy4P5RhKum5p0M5dGxwTqPtL4ATGFihpSZvv1m1jjx+STY=
X-Received: by 2002:a1f:9094:: with SMTP id s142mr1776422vkd.6.1592316579576; 
 Tue, 16 Jun 2020 07:09:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200615075816.2848-1-wsa+renesas@sang-engineering.com>
 <20200616121244.GN20149@phenom.ffwll.local>
In-Reply-To: <20200616121244.GN20149@phenom.ffwll.local>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 16 Jun 2020 15:05:58 +0100
Message-ID: <CACvgo52PaW97cxMeGhbpD4FUVy5BRAunaCxX3106OOAZm6x67A@mail.gmail.com>
Subject: Re: [PATCH 0/6] remove deprecated i2c_new_device API
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org,
 linux-fbdev <linux-fbdev@vger.kernel.org>, x86@kernel.org, 
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, 
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

On Tue, 16 Jun 2020 at 13:12, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Jun 15, 2020 at 09:58:09AM +0200, Wolfram Sang wrote:
> > I want to remove the above API this cycle, and just a few patches have
> > not made it into 5.8-rc1. They have been reviewed and most had been
> > promised to get into linux-next, but well, things happen. So, I hope it
> > is okay for everyone to collect them like this and push them via I2C for
> > 5.8-rc2.
>
> for the drm side of things:
>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >
> > One minor exception is the media documentation patch which I simply have
> > missed so far, but it is trivial.
> >
> > And then, finally, there is the removal of the old API as the final
> > patch. Phew, that's been a long ride.
> >
> > I am open for comments, of course.
> >
> > Happy hacking,
> >
> >    Wolfram
> >
> >
> > Wolfram Sang (6):
> >   drm: encoder_slave: fix refcouting error for modules
> >   drm: encoder_slave: use new I2C API

The first two are in drm-misc-next and are to be expected with the 5.9
merge window. As long as that doesn't cause major nuisance proceed as
you prefer.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
