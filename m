Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 616072320DB
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 16:46:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD3496E53E;
	Wed, 29 Jul 2020 14:46:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 033FC6E527
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 14:46:15 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id d190so2958605wmd.4
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 07:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3iyFpM5/BXg/ovW1sf4meruZ9t5/ZCB/YXrufU01eIM=;
 b=dEkb4hGGoi60zjTJt0jGB+G3PDfjSdeL573SQ9ZlTLlJpbzG1mvzCSBPrSHaxFWnHq
 wesmd8C4xEWXcwAD1Ofb4i9NEiD0kjobimkh8lNMT9P7zphud59M7gvsf8rI5o+/IJSU
 MrAngD03i3HCsyt1Txo66Vf05UVhTcKOoix5sObcfZxIe1Lu0X16HuAqOm7PFHcOyyn9
 IlFo3DYouLlgCOXmEcZXqNVlVopPHNoQptmn8p1/GsNEbwE2oXZFBGVupjZCh3ouCWrD
 x01FzIMzGrNJkedjSqdos6FURUez3YonBiw2dRVOvO/TXWYZG67ueiYM2ONC0XXo2vJL
 axcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3iyFpM5/BXg/ovW1sf4meruZ9t5/ZCB/YXrufU01eIM=;
 b=qDQQhxSOh4CWnZPs7O4C9rvqM4rnEolnOYS4YzxhZ5PrfNd2kMm8LoWTIv+vP1KVB1
 rFhGx0x9R3k2KNy0G/5AHATygRHaoJO8WT7j7doxcrn+ozD0ROE1y+E5saqEJ3agGx2P
 O/AKi3lMRWTd3cE2ciDMhz9rAlPRsC36BHR6z46SwOW68T1JBY1r0TrYQtdL0rArJKdl
 d0Vw2s3at6EkGCrRWR7aTIMPtvzRK7VvsaJDoEwKuS3xNSd/m1Q+rWBFE+3iswhmdAoN
 oHWuciZUZ4cj1jkQgg85CF/U0wsXZ4vrwhyZBzZnDiRkNzlPvk/HrzaG9nlvG6JYEpYl
 0K1g==
X-Gm-Message-State: AOAM532/9T9MsO/pmlnJBe4K+cXzMYhdUWEAO2MJ4vjeXKm+R0uhyeMY
 jxRGvKpKaevVFrcRLhy5eHA74j76CUlkKshmjW9J+w==
X-Google-Smtp-Source: ABdhPJw/p50BFEtwezXo1Ruo1n5u3zHVab9meBJ37HMrBT8un5GezRt6kNuz774MxcXHPwwK69ieab/DodPZnsYLezc=
X-Received: by 2002:a1c:1d52:: with SMTP id d79mr6877815wmd.82.1596033973615; 
 Wed, 29 Jul 2020 07:46:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
 <a1f22aadc60a2f32022831a6348c8bbd6e1954c3.1594230107.git-series.maxime@cerno.tech>
 <CAPY8ntBLWrfagZ5-kQz+5Mkw4_KaaTP63_L3D4owJAfA5kFpzw@mail.gmail.com>
 <20200729144251.us6a2pgkjjmm53ov@gilmour.lan>
In-Reply-To: <20200729144251.us6a2pgkjjmm53ov@gilmour.lan>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 29 Jul 2020 15:45:57 +0100
Message-ID: <CAPY8ntD9MS_4G20v=Em-GyV0RjV=2gK0Tq+026WziKtv4a55wQ@mail.gmail.com>
Subject: Re: [PATCH v4 29/78] drm/vc4: crtc: Add a delay after disabling the
 PixelValve output
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 29 Jul 2020 at 15:42, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi,
>
> On Wed, Jul 29, 2020 at 03:09:21PM +0100, Dave Stevenson wrote:
> > On Wed, 8 Jul 2020 at 18:43, Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > In order to avoid pixels getting stuck in the (unflushable) FIFO between
> > > the HVS and the PV, we need to add some delay after disabling the PV output
> > > and before disabling the HDMI controller. 20ms seems to be good enough so
> > > let's use that.
> > >
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > ---
> > >  drivers/gpu/drm/vc4/vc4_crtc.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
> > > index d0b326e1df0a..7b178d67187f 100644
> > > --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> > > +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> > > @@ -403,6 +403,8 @@ static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
> > >         ret = wait_for(!(CRTC_READ(PV_V_CONTROL) & PV_VCONTROL_VIDEN), 1);
> > >         WARN_ONCE(ret, "Timeout waiting for !PV_VCONTROL_VIDEN\n");
> > >
> > > +       mdelay(20);
> >
> > mdelay for 20ms seems a touch unfriendly as it's a busy wait. Can we
> > not msleep instead?
>
> Since the timing was fairly critical, sleeping didn't seem like a good
> solution since there's definitely some chance you overshoot and end up
> with a higher time than the one you targeted.

Fair enough. I know timing is "entertaining" around some of the 2711
pipeline setup.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
