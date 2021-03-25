Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4863349795
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 18:08:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBFA56EB80;
	Thu, 25 Mar 2021 17:08:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B2B46EB7F;
 Thu, 25 Mar 2021 17:08:21 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id m13so2794194oiw.13;
 Thu, 25 Mar 2021 10:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1PkoObgjDP1C1nJf3TQFBvDH6KCzgdXB9bud0P2XCd0=;
 b=ssVNbWY7QaP0IX3/njd3dS76K+/y6hzcso4UF4Fq0mrzK8WUfF5Ddw2Wfx8q2nIimR
 01Ra6V0tUQhLWZlIYjNCoW7qVtfNQaEFazZY6ghESyOGIgIp2JjWATAgMXKMvRV0FgwB
 2d2td2CN9LIpmdKYRUoRcbeRKFlxwhSJt90QoCUm00jpEoIAvV82Xznqz7rFbGgX/kgJ
 tPkFjVSvKPCGxAIk1Uchsresky+7M/9UYHu/GrSJ/k1OHBWdgprhW93GzLQIOT4zwEBy
 giTdviKYTvl5UX8NxuYws3Hnjktd1PiJpOOb5TiOx2iD3Ky3GV4k7jajhidS6OFCuNsx
 1Nnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1PkoObgjDP1C1nJf3TQFBvDH6KCzgdXB9bud0P2XCd0=;
 b=NhkHcZVujX947NS8gsq2baijtQsQCChimsQY3deh7e46vO1DPNj3j49YT962cnzWqq
 mB/1GO51Vl83vFStRaN7f900Ry2YEy5Ht/Ja0ean2KFdtVAPNw033Y2J/0WW8dnyNvK5
 Fe/+f0i+mC/3AtuOdKQ1U3ohEorr0ZzdNEX6eYPiiBgAT4hAESDM+SZziRI4UoZI/Fdi
 6xuHCKZ24HOE7hgGtWcYfVOeRaxkdeiNM1PuGS7UstFXApJSFLwSk80eV5HmbDITV3mk
 O/PPk8vztnVum6uFinQCXsyEa0CrtGfaYVOtt1G78T8EYFwF95ON606IYFY+kSXj8xFx
 ks5A==
X-Gm-Message-State: AOAM5326xekUHSwWEeJVUClRvMjBiMORiZBkVh9PK6pcmCj5HybbAZ3j
 vxYlQ6vVL+LnaUCXLOpckcIwGPWNNE5vtVbbj70=
X-Google-Smtp-Source: ABdhPJwN6SLyKxUYQXpoYiFP9yp1Ip5mQhoWAwFyE4e7a/0zLr1UczMSFR/yhlDae8rWuqlA2R2yl8Ee+E8EL6ooSt4=
X-Received: by 2002:a05:6808:68a:: with SMTP id
 k10mr4720367oig.120.1616692100977; 
 Thu, 25 Mar 2021 10:08:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210322210612.1786322-1-unixbhaskar@gmail.com>
 <9696cd2a-bac2-15ba-c8e4-434df7b5cee0@infradead.org>
In-Reply-To: <9696cd2a-bac2-15ba-c8e4-434df7b5cee0@infradead.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 25 Mar 2021 13:08:09 -0400
Message-ID: <CADnq5_OP6rhH48wCWQVFrAC4iH0-v4ihREPMx8qOa=DkHKAehw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd: Fix a typo in two different sentences
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: Bhaskar Chowdhury <unixbhaskar@gmail.com>, Dave Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, "Quan, Evan" <evan.quan@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Mar 22, 2021 at 6:45 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 3/22/21 2:06 PM, Bhaskar Chowdhury wrote:
> >
> > s/defintion/definition/ .....two different places.
> >
> > Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
>
> > ---
> >  drivers/gpu/drm/amd/include/atombios.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/include/atombios.h b/drivers/gpu/drm/amd/include/atombios.h
> > index c1d7b1d0b952..47eb84598b96 100644
> > --- a/drivers/gpu/drm/amd/include/atombios.h
> > +++ b/drivers/gpu/drm/amd/include/atombios.h
> > @@ -1987,9 +1987,9 @@ typedef struct _PIXEL_CLOCK_PARAMETERS_V6
> >  #define PIXEL_CLOCK_V6_MISC_HDMI_BPP_MASK           0x0c
> >  #define PIXEL_CLOCK_V6_MISC_HDMI_24BPP              0x00
> >  #define PIXEL_CLOCK_V6_MISC_HDMI_36BPP              0x04
> > -#define PIXEL_CLOCK_V6_MISC_HDMI_36BPP_V6           0x08    //for V6, the correct defintion for 36bpp should be 2 for 36bpp(2:1)
> > +#define PIXEL_CLOCK_V6_MISC_HDMI_36BPP_V6           0x08    //for V6, the correct definition for 36bpp should be 2 for 36bpp(2:1)
> >  #define PIXEL_CLOCK_V6_MISC_HDMI_30BPP              0x08
> > -#define PIXEL_CLOCK_V6_MISC_HDMI_30BPP_V6           0x04    //for V6, the correct defintion for 30bpp should be 1 for 36bpp(5:4)
> > +#define PIXEL_CLOCK_V6_MISC_HDMI_30BPP_V6           0x04    //for V6, the correct definition for 30bpp should be 1 for 36bpp(5:4)
> >  #define PIXEL_CLOCK_V6_MISC_HDMI_48BPP              0x0c
> >  #define PIXEL_CLOCK_V6_MISC_REF_DIV_SRC             0x10
> >  #define PIXEL_CLOCK_V6_MISC_GEN_DPREFCLK            0x40
> > --
>
>
> --
> ~Randy
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
