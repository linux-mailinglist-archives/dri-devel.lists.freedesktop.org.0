Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BB016BCAC
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 09:54:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B32D16EA4A;
	Tue, 25 Feb 2020 08:53:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C253A6EA60
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 08:52:33 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id p23so15339164edr.5
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 00:52:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K+2A/gft6LrFZSl1mPAmF46n0w4UjXc0APhIZ+UJahU=;
 b=kAMbZ6qiCF1mcXId1q3D9/gLz/L/781DRn9dEMoOWqparcpl2TNh/Oz+d9ZdMywjmj
 TCk7nVMqE7kzBwBFEQio8mtHMSbAHFCdrrtI+Ef86CNGy+LCK2rDZskCRFx1XwvVkUF+
 m0dfKzPwVX4NGqOlaYWVLBVGo29y/xEDbJ4GI7TPNRlD9RCztq9cixW3hGJaMihYM9P8
 vR60yUTbKSuTUKZOSF/n4sEQyKdZ4szrBrPG81bTv/jm9Hc3dVpDsvLJTxudC3cEGu0X
 DYuSyAM6bnUDtK5ICLZYrJkcxzNN8bWgu2gwSC+KAftMhN8BLmMAe/hcfL8HkC/sb8Bj
 JEow==
X-Gm-Message-State: APjAAAUp78lEpp0CyjA/4p4O7uyu62qkyuG261Yc/xml1eMSJsVRpaTy
 K4aovcuKAhouCfZF+BVcJy0VvnBMJUo=
X-Google-Smtp-Source: APXvYqzA1CN9iDNaB3MdU6zBdaQSP4h813xUEkRPqZJ8yyyOkaUGIMS9MKWFXgYUJy4XD5rxq7cjqw==
X-Received: by 2002:a17:906:cd17:: with SMTP id
 oz23mr50018261ejb.91.1582620751448; 
 Tue, 25 Feb 2020 00:52:31 -0800 (PST)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com.
 [209.85.221.48])
 by smtp.gmail.com with ESMTPSA id y4sm935955ejp.50.2020.02.25.00.52.30
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2020 00:52:30 -0800 (PST)
Received: by mail-wr1-f48.google.com with SMTP id z15so5344023wrl.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 00:52:30 -0800 (PST)
X-Received: by 2002:a5d:604a:: with SMTP id j10mr5439322wrt.181.1582620750522; 
 Tue, 25 Feb 2020 00:52:30 -0800 (PST)
MIME-Version: 1.0
References: <20200224173901.174016-1-jernej.skrabec@siol.net>
 <20200224173901.174016-7-jernej.skrabec@siol.net>
 <20200225083448.6upblnctjjrbarje@gilmour.lan>
In-Reply-To: <20200225083448.6upblnctjjrbarje@gilmour.lan>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 25 Feb 2020 16:52:18 +0800
X-Gmail-Original-Message-ID: <CAGb2v64g7Q4e+ic08pA7tbamgToOjyYzuzqP0bpqBZjRuRUrPA@mail.gmail.com>
Message-ID: <CAGb2v64g7Q4e+ic08pA7tbamgToOjyYzuzqP0bpqBZjRuRUrPA@mail.gmail.com>
Subject: Re: [PATCH 6/7] drm/sun4i: de2: Don't return de2_fmt_info struct
To: Maxime Ripard <maxime@cerno.tech>, Jernej Skrabec <jernej.skrabec@siol.net>
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
Cc: David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 25, 2020 at 4:35 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi,
>
> On Mon, Feb 24, 2020 at 06:39:00PM +0100, Jernej Skrabec wrote:
> > Now that de2_fmt_info contains only DRM <-> HW format mapping, it
> > doesn't make sense to return pointer to structure when searching by DRM
> > format. Rework that to return only HW format instead.
> >
> > This doesn't make any functional change.
> >
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > ---
> >  drivers/gpu/drm/sun4i/sun8i_mixer.c    | 15 +++++++++++----
> >  drivers/gpu/drm/sun4i/sun8i_mixer.h    |  7 +------
> >  drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 10 +++++-----
> >  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 12 ++++++------
> >  4 files changed, 23 insertions(+), 21 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > index e078ec96de2d..56cc037fd312 100644
> > --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > @@ -27,6 +27,11 @@
> >  #include "sun8i_vi_layer.h"
> >  #include "sunxi_engine.h"
> >
> > +struct de2_fmt_info {
> > +     u32     drm_fmt;
> > +     u32     de2_fmt;
> > +};
> > +
> >  static const struct de2_fmt_info de2_formats[] = {
> >       {
> >               .drm_fmt = DRM_FORMAT_ARGB8888,
> > @@ -230,15 +235,17 @@ static const struct de2_fmt_info de2_formats[] = {
> >       },
> >  };
> >
> > -const struct de2_fmt_info *sun8i_mixer_format_info(u32 format)
> > +int sun8i_mixer_drm_format_to_hw(u32 format, u32 *hw_format)
> >  {
> >       unsigned int i;
> >
> >       for (i = 0; i < ARRAY_SIZE(de2_formats); ++i)
> > -             if (de2_formats[i].drm_fmt == format)
> > -                     return &de2_formats[i];
> > +             if (de2_formats[i].drm_fmt == format) {
> > +                     *hw_format = de2_formats[i].de2_fmt;
> > +                     return 0;
> > +             }
> >
> > -     return NULL;
> > +     return -EINVAL;
> >  }
>
> I'm not too sure about that one. It breaks the consistency with the
> other functions, and I don't really see a particular benefit to it?

I guess we could just define an "invalid" value, and have the function
return that if can't find a match? I'm guessing 0x0 is valid, so maybe
0xffffffff or 0xdeadbeef ?

That would keep consistency with everything else all the while
removing the level of indirection you wanted to.

ChenYu


> The rest of the series is
> Acked-by: Maxime Ripard <mripard@kernel.org>
>
> Maxime
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
