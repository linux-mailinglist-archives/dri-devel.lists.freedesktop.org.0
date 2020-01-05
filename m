Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC40130A18
	for <lists+dri-devel@lfdr.de>; Sun,  5 Jan 2020 23:07:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A3A89DB9;
	Sun,  5 Jan 2020 22:06:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD6D89DB9;
 Sun,  5 Jan 2020 22:06:57 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id x18so30539893vsq.4;
 Sun, 05 Jan 2020 14:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Uw6b7W2hJ0QLRZ1xDtPnAWhipPvQAM3seWtHwc/JeWI=;
 b=n4jadz24z7JBewNrViqatR++YynQbD5azEZKxjZxFfvD368syVdZM1Ub7qpNXso0kX
 rhnOVjJ964h2axKqSfgW9ZGznWx5H37Wta9Zic+/tf5qtQ3Kw2Jls8ePPuwAIH1LEu9n
 /ITeQn9WUJVapcMrLG2KqGvJlEZkHWC6J9Chv4sGuO13joIoxXIoAoYk7zPjHfgnkxyG
 pC+oU2JPFCZTH5XDn5WF5GCI5f14EuYDHEsIWPn7tdx59Ebsi9LeB6pvCQsmpJ98ToEc
 geFFpUkywXbDL6iGW5LiilUZSb4WgxoECXQMA9oHdFfJkBZb1wyCeHD/MqBNwxnnlp+k
 9zzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Uw6b7W2hJ0QLRZ1xDtPnAWhipPvQAM3seWtHwc/JeWI=;
 b=QVwyqkslOzTeL003ghehOJ8GA5qtUFA9dfWxjXzFn1vdAcQsYyd5hkm6yPCcAGlSKC
 eZO2w0bSbT8/RzI1eLMCKEFqj8QmiGtUJzfdKNGIJcndADc2v2DUDf2bQQV8O/+zQN8G
 9Y2dN6UEvWYCU+EmKjS3NLehaZ+g9dS7q3u6+b/16xofkaOAGy4kB13eOnLEdC14fTgo
 V3FQMnj69RnVQ5OB6mvSZ/UUh7HkWqANLRXahcU+7gx9XMODqKR25ekGQgBTszONldF/
 cenGIIGJ3wC8yZFXL/hVNlKD+dEdkm3NBJ6TsO2TLn2bJoB4sApI3+XG8j0Bzh935C5S
 6/Iw==
X-Gm-Message-State: APjAAAWv4JB9kjw1ZzEcfUwsdq+VRzg82iW7Gw2ibzRsjQiCqLtFsbgH
 EAJhqZ3ewlO8k2/ceYvwF8OU3WWmpfLGi8i2lrk=
X-Google-Smtp-Source: APXvYqwbEJS1ZTfGghkXr5NcdUxqdwwl79ExOgPhvtn/LUVDP0xDOgcJaiiG+qAns3Cs0+AZewOfp016/f8BBavPXUI=
X-Received: by 2002:a67:1447:: with SMTP id 68mr34488742vsu.76.1578262016414; 
 Sun, 05 Jan 2020 14:06:56 -0800 (PST)
MIME-Version: 1.0
References: <20191231205607.1005-1-wambui.karugax@gmail.com>
 <20200101184843.GA3856@dvetter-linux.ger.corp.intel.com>
In-Reply-To: <20200101184843.GA3856@dvetter-linux.ger.corp.intel.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Mon, 6 Jan 2020 08:06:45 +1000
Message-ID: <CACAvsv5YEB0njcvFBhHWiCumuHroAqMm-T+fA8gJfsXijy+LVg@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: remove set but unused variable.
To: Wambui Karuga <wambui.karugax@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, 
 Dave Airlie <airlied@linux.ie>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, 
 ML nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
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

On Thu, 2 Jan 2020 at 04:48, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, Dec 31, 2019 at 11:56:07PM +0300, Wambui Karuga wrote:
> > The local variable `pclks` is defined and set but not used and can
> > therefore be removed.
> > Issue found by coccinelle.
> >
> > Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
> > ---
> >  drivers/gpu/drm/nouveau/dispnv04/arb.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/dispnv04/arb.c b/drivers/gpu/drm/nouveau/dispnv04/arb.c
> > index 362495535e69..f607a04d262d 100644
> > --- a/drivers/gpu/drm/nouveau/dispnv04/arb.c
> > +++ b/drivers/gpu/drm/nouveau/dispnv04/arb.c
> > @@ -54,7 +54,7 @@ static void
> >  nv04_calc_arb(struct nv_fifo_info *fifo, struct nv_sim_state *arb)
> >  {
> >       int pagemiss, cas, width, bpp;
> > -     int nvclks, mclks, pclks, crtpagemiss;
> > +     int nvclks, mclks, crtpagemiss;
>
> Hm, reading the code (just from how stuff is named) I wonder whether the
> original idea was that the calculation for us_p should us pclks, not
> nvclks, but given that this code is as old as the initial nouveau merge
> probably not a good idea to touch it. Plus I guess not many with a vintage
> nv04 in working condition around to even test stuff ...
>
> Ben, what should we do here?
I looked at the original code from xf86-video-nv, and pclks is
similarly unused there also, so, I'd vote for just picking up this
patch.  I don't believe anyone has the knowledge+hw anymore to mess
with it in any other way.

Ben.

> -Daniel
>
> >       int found, mclk_extra, mclk_loop, cbs, m1, p1;
> >       int mclk_freq, pclk_freq, nvclk_freq;
> >       int us_m, us_n, us_p, crtc_drain_rate;
> > @@ -69,7 +69,6 @@ nv04_calc_arb(struct nv_fifo_info *fifo, struct nv_sim_state *arb)
> >       bpp = arb->bpp;
> >       cbs = 128;
> >
> > -     pclks = 2;
> >       nvclks = 10;
> >       mclks = 13 + cas;
> >       mclk_extra = 3;
> > --
> > 2.17.1
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
