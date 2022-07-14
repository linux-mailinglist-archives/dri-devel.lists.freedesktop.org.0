Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 023CE5752C7
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 18:30:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C22FB11A0B1;
	Thu, 14 Jul 2022 16:29:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 470C311A0AD;
 Thu, 14 Jul 2022 16:29:58 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id e15so3126484edj.2;
 Thu, 14 Jul 2022 09:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZI0YHVo/gtkOB8tgyDWcbFNn6KxRA45rOQ9nm1YXK/Q=;
 b=qDcqaSAhw+hlOV5MLaMQb3gYMlJSXY1JVhNzIBNLgXH/Azc2KW0WxR+hxUZcNtDxm6
 InWFK4mBuPj0hpBt3PvwutZW5wUJKMYCh0SPUqO4ZXY8DZB7dVBAr/e2/bq6FEbr7j8a
 igiR4rkthJIEYAAJHPMok4ww9tD869WwPg8aAOKwa0/tachtsAIUBYQNJu2lL7dSTuFm
 bFNhX6QVDJRJBWkwMrW/0pxO6DFhcWycipykiOhv48CW/jjT0SmOfSn2DaggW8swX/WL
 s/UNX/NjcUc71qQNPXWtJfbQPctemAAkIZMZhE6w1fxcaNdrj5q5UAAKsh+KhhdrYB29
 25Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZI0YHVo/gtkOB8tgyDWcbFNn6KxRA45rOQ9nm1YXK/Q=;
 b=XXg0RRr6mNqM8hZDwrR4cLnUgKiC1h1WTQwqK7ryrqlqFywEabodhgyk0ScoNmNznD
 Lq+oUzd7hjo/9BTwJiKM58pjMVCCtpMmzM/oQKoSDy0ROZeWaqAJ1/1bW8FMv0ezrQn9
 aYGP2F4uJ0dtfRWnKAqdQ/YZf6dV2kbI7wNCn+wNYljxB2xAgnK56ISwEzuXA0v9Fnny
 eHmZPIC7KbnliBKmyHyOSgnK46E0GBIcJp84DUvVtEMQOb2bWweuB0Q2upi9abmV94q9
 tsQG7mVsX8uczoJFsvrTWctSMmCC3v03oTnSWbvCG0rBdKkXJe5sPxBHjYkTE1FQACTQ
 g1Ow==
X-Gm-Message-State: AJIora9kpCGT2q+4QMdSGYzT8Fr8NzWwizBjKZ2n1Zz8JVsKG3Q92qzI
 IJxGKJVa9Aa8GPiXJzOQd1/VlufPANSw24nebM4=
X-Google-Smtp-Source: AGRyM1v1rUkvs34Q+Hk692TjKXzRoe56b59xLKpN80MV6b/Wor2PR/mwxiLwKJwHkkS8wmVStWlwlpJkBoau4i75WJc=
X-Received: by 2002:a05:6402:13:b0:439:ffe8:bec9 with SMTP id
 d19-20020a056402001300b00439ffe8bec9mr13648034edu.297.1657816196801; Thu, 14
 Jul 2022 09:29:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220712224247.1950273-1-linux@roeck-us.net>
 <98b656f3-e506-90be-ebcc-898813051e74@amd.com>
In-Reply-To: <98b656f3-e506-90be-ebcc-898813051e74@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 14 Jul 2022 12:29:45 -0400
Message-ID: <CADnq5_OMayFN52hr7ZWFqMHPaV5_q7Hi+4LEbNMgfTPqo3__=w@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Enable building new display engine with
 KCOV enabled
To: Harry Wentland <harry.wentland@amd.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Leo Li <sunpeng.li@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, Jul 13, 2022 at 4:03 PM Harry Wentland <harry.wentland@amd.com> wrote:
>
> On 2022-07-12 18:42, Guenter Roeck wrote:
> > The new display engine uses floating point math, which is not supported
> > by KCOV. Commit 9d1d02ff3678 ("drm/amd/display: Don't build DCN1 when kcov
> > is enabled") tried to work around the problem by disabling
> > CONFIG_DRM_AMD_DC_DCN if KCOV_INSTRUMENT_ALL and KCOV_ENABLE_COMPARISONS
> > are enabled. The result is that KCOV can not be enabled on systems which
> > require this display engine. A much simpler and less invasive solution is
> > to disable KCOV selectively when compiling the display enagine while
> > keeping it enabled for the rest of the kernel.
> >
> > Fixes: 9d1d02ff3678 ("drm/amd/display: Don't build DCN1 when kcov is enabled")
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Leo Li <sunpeng.li@amd.com>
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Harry
>
> > ---
> >  drivers/gpu/drm/amd/display/Kconfig     | 2 +-
> >  drivers/gpu/drm/amd/display/dc/Makefile | 3 +++
> >  2 files changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
> > index b4029c0d5d8c..96cbc87f7b6b 100644
> > --- a/drivers/gpu/drm/amd/display/Kconfig
> > +++ b/drivers/gpu/drm/amd/display/Kconfig
> > @@ -6,7 +6,7 @@ config DRM_AMD_DC
> >       bool "AMD DC - Enable new display engine"
> >       default y
> >       select SND_HDA_COMPONENT if SND_HDA_CORE
> > -     select DRM_AMD_DC_DCN if (X86 || PPC64) && !(KCOV_INSTRUMENT_ALL && KCOV_ENABLE_COMPARISONS)
> > +     select DRM_AMD_DC_DCN if (X86 || PPC64)
> >       help
> >         Choose this option if you want to use the new display engine
> >         support for AMDGPU. This adds required support for Vega and
> > diff --git a/drivers/gpu/drm/amd/display/dc/Makefile b/drivers/gpu/drm/amd/display/dc/Makefile
> > index b4eca0236435..b801973749d2 100644
> > --- a/drivers/gpu/drm/amd/display/dc/Makefile
> > +++ b/drivers/gpu/drm/amd/display/dc/Makefile
> > @@ -26,6 +26,9 @@
> >  DC_LIBS = basics bios dml clk_mgr dce gpio irq link virtual
> >
> >  ifdef CONFIG_DRM_AMD_DC_DCN
> > +
> > +KCOV_INSTRUMENT := n
> > +
> >  DC_LIBS += dcn20
> >  DC_LIBS += dsc
> >  DC_LIBS += dcn10
>
