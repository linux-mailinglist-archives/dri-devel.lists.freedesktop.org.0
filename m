Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 075523FC9A6
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 16:23:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5700C6E087;
	Tue, 31 Aug 2021 14:22:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF456E087
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 14:22:56 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 w19-20020a17090aaf9300b00191e6d10a19so2551636pjq.1
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 07:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=agCwJbjopXjgdjmt4UnQYJb9rZ+TRxYP+Vp/4vfg7+k=;
 b=xUfPT7uqyNTLbSkt8EJkfnL621vuvL4YaeyQMQcEyMiFDL4/I5sTnl5XcQ5k3PpyE9
 Rjs+X9He+NEyKrm3YHptM2QT7wsAMniI7Dk5IXuxP0CgeoQzedp6hG4mkDvWv6vYUdjD
 uoO9n4eDgTjDFTzMOizrpN9LrpGx6wRzgNrSmrwXzhRsgt43uULPFtYQRHdmG9OgSnST
 6NZ2aINyRolFvpynKmPIPcfSQ8OCvenMfgfOdK8upQh+Te0gCDws+NKP/ZLTJ6NpfhPY
 j113oi2x/NWHM4B6HltsQfeuRoVdi22TthwV51cFm5KQ0w8WMCejRSd8q8OxFu3lhJ2o
 4VQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=agCwJbjopXjgdjmt4UnQYJb9rZ+TRxYP+Vp/4vfg7+k=;
 b=mku9ggBWqELwDUZ9eul9bjxqxYg7ThJRma+13cEDnhH3UknXf6ZZt8I5CHajEPyXtY
 97oDJuL3bn07xsbgKkZuzV4Ph1X3JTKTgrMNAg8uvViodJoyT8NANaHU2mxNvKGZCjF0
 wXVFv3UjfrBTdj2t1XcnM0qrgplKk48fCjCpJ38Y7lNdtRvfP0JJRDCx2GbQjGFT4iQo
 rS7X9qU6F6b5AvL0CO8mse3xTGRqhspDTENET0GKTnh4j4hfSeTYt2G6BQJLq+t3W6vL
 v8AvQkatOL5YPaV0qdQnShfzMjT2zZsOVRaAFeHEe0/kkZvpTKXlutxCkvPnIyuQ5KL2
 D5Ew==
X-Gm-Message-State: AOAM53176I7UTwaGjm2UdZDDaW2JqWlDWZDeDIVzrLFHuHEj1OZiDiRN
 Kt9FkzzALUk8kJQ70rzCxcTTcPoQ/+51dJztnv3Nkw==
X-Google-Smtp-Source: ABdhPJxRfsG7ydqj58dpKD9O7I8cMNgCJ98STKID3Y4Eep+EHuVwC6xKW+BLX4aQHDJ5ezz2uuvo491L64pugzlwrjE=
X-Received: by 2002:a17:90b:4c8b:: with SMTP id
 my11mr5588645pjb.220.1630419775900; 
 Tue, 31 Aug 2021 07:22:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210827163956.27517-1-paul@crapouillou.net>
 <27e68baf-5797-9c66-37b2-382cb8792467@baylibre.com>
In-Reply-To: <27e68baf-5797-9c66-37b2-382cb8792467@baylibre.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 31 Aug 2021 16:22:44 +0200
Message-ID: <CAG3jFytAdkt5DDzsm9T+buAL0vqS-X4M66aNyOaB8=5N3CbKWg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/bridge: it66121: Initialize {device,vendor}_ids
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Paul Cercueil <paul@crapouillou.net>, Phong LE <ple@baylibre.com>, 
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 list@opendingux.net, dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 30 Aug 2021 at 11:40, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 27/08/2021 18:39, Paul Cercueil wrote:
> > These two arrays are populated with data read from the I2C device
> > through regmap_read(), and the data is then compared with hardcoded
> > vendor/product ID values of supported chips.
> >
> > However, the return value of regmap_read() was never checked. This is
> > fine, as long as the two arrays are zero-initialized, so that we don't
> > compare the vendor/product IDs against whatever garbage is left on the
> > stack.
> >
> > Address this issue by zero-initializing these two arrays.
> >
>
> Fixes: 988156dc2fc9 ("drm: bridge: add it66121 driver")
>
> > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> > ---
> >  drivers/gpu/drm/bridge/ite-it66121.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
> > index 2f2a09adb4bc..b130d01147c6 100644
> > --- a/drivers/gpu/drm/bridge/ite-it66121.c
> > +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> > @@ -889,7 +889,7 @@ static irqreturn_t it66121_irq_threaded_handler(int irq, void *dev_id)
> >  static int it66121_probe(struct i2c_client *client,
> >                        const struct i2c_device_id *id)
> >  {
> > -     u32 vendor_ids[2], device_ids[2], revision_id;
> > +     u32 revision_id, vendor_ids[2] = { 0 }, device_ids[2] = { 0 };
> >       struct device_node *ep;
> >       int ret;
> >       struct it66121_ctx *ctx;
> >
>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Applied series to drm-misc-next.
