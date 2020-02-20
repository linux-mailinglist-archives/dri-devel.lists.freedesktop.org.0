Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D406D1669F0
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 22:37:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C89EF6EE6C;
	Thu, 20 Feb 2020 21:37:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F6356EE6C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 21:37:15 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id c188so5063555qkg.4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 13:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TvOgxeV6q/hz2jhw1BkYuFW6F6UgnXyc569e2Apg3tI=;
 b=Q19syPFVhTWGp6aA8lun7A2sKPtueu+qDwkZzlHsVmpLdjYgwB91YcQG/QrVmDN1Sn
 +6b+40av8D746PqIyCMbOjNcm+rHX8lhkgtuILyQPRf3wyWUC/mXsCliywHmhQz4FOHs
 qaN4tU6vq7eTotiGTpgvTd+SxZ55u6/LLf4rmBwtFFuzGEOhLOoVl/YhpoD9cibv6m8V
 0myYdFJ5oN8kLfUTjXAJgA0BIdP+3s7L6MV9NMA7n4xuNhq3nwa2XaG5bcbcxDCl8SnC
 WwUYOhGdacD7XtVU82PQAMiDwpgLSFIwkAgEwvePPoIo+Pkwzkq8Rd4K5AhJqzDY9cwo
 //xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TvOgxeV6q/hz2jhw1BkYuFW6F6UgnXyc569e2Apg3tI=;
 b=JRGAzMZfw4l63GrJcBrs7zH8jXlwSydqOih/UmTs4hoMtOmiKctYlhRM0dV0q/7Gpo
 ibai6l/qs1q+y2pwVZ0qrjekcmgV/Z9H6KOYIKvU5/dKP8AKHQDxMVbBQcr3xK4QdP0L
 c2y2HbZ+dlzf7MEhGK0IC4W41zGliLk+vXF0YSe6qKcgiAB5I1lyTfv4bZKjRN276EIi
 SzTTv5L2tVbIH+j6dzsCK4rAZeUH7ACVCo1T4i32TxyWBLw+hW/CuCiBi+qNU6J40/Gn
 AeXghuGEl0TquV54D/dcaId1iIPUZpvTOFW740Bb8JFmYyBhpgtP6idfuglnWLsoS6fr
 yJ8Q==
X-Gm-Message-State: APjAAAXtyastSamlaNxlTUR+QSgp1hm9rREV4OG0EN3/zd8S4Xb7CG16
 FmMePgIvGCsmTCkPdvzXQSxG3lNWDeSALmiMPEeDP/Au
X-Google-Smtp-Source: APXvYqwuaNU/g8DZUMOkoTNKLgQBVvRTS4yLUHrZxtp6GWR40atVUC4MMgB8849+KTbNIVrCXT1WjazgLPyKD1Pt5zY=
X-Received: by 2002:a37:b285:: with SMTP id b127mr3341955qkf.413.1582234634423; 
 Thu, 20 Feb 2020 13:37:14 -0800 (PST)
MIME-Version: 1.0
References: <20200220083508.792071-1-anarsoul@gmail.com>
 <20200220083508.792071-3-anarsoul@gmail.com>
 <20200220135259.GC4998@pendragon.ideasonboard.com>
In-Reply-To: <20200220135259.GC4998@pendragon.ideasonboard.com>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Thu, 20 Feb 2020 13:37:01 -0800
Message-ID: <CA+E=qVeJfFZudSfM_U8n1r543oyYf+oGCma_fH-vNEQ9vZUP2w@mail.gmail.com>
Subject: Re: [PATCH 2/6] drm/bridge: anx6345: Clean up error handling in
 probe()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Samuel Holland <samuel@sholland.org>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>,
 Stephan Gerhold <stephan@gerhold.net>, Jonas Karlman <jonas@kwiboo.se>,
 Torsten Duwe <duwe@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>,
 arm-linux <linux-arm-kernel@lists.infradead.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 20, 2020 at 5:53 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Vasily,

Hi Laurent,

> Thank you for the patch.
>
> On Thu, Feb 20, 2020 at 12:35:04AM -0800, Vasily Khoruzhick wrote:
> > devm_regulator_get() returns either a dummy regulator or -EPROBE_DEFER,
> > we don't need to print scary message in either case.
> >
> > Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> > ---
> >  drivers/gpu/drm/bridge/analogix/analogix-anx6345.c | 8 ++------
> >  1 file changed, 2 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> > index 0d8d083b0207..0204bbe4f0a0 100644
> > --- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> > +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> > @@ -713,17 +713,13 @@ static int anx6345_i2c_probe(struct i2c_client *client,
> >
> >       /* 1.2V digital core power regulator  */
> >       anx6345->dvdd12 = devm_regulator_get(dev, "dvdd12");
> > -     if (IS_ERR(anx6345->dvdd12)) {
> > -             DRM_ERROR("dvdd12-supply not found\n");
> > +     if (IS_ERR(anx6345->dvdd12))
> >               return PTR_ERR(anx6345->dvdd12);
> > -     }
>
> There could be other errors such as -EBUSY or -EPERM. The following
> would ensure a message gets printed in those cases, while avoiding
> spamming the kernel log in the EPROBE_DEFER case.
>
>         if (IS_ERR(anx6345->dvdd12)) {
>                 if (PTR_ERR(anx6345->dvdd12) != -EPROBE_DEFER)
>                         DRM_ERROR("Failed to get dvdd12 supply (%d)\n",
>                                   PTR_ERR(anx6345->dvdd12));
>                 return PTR_ERR(anx6345->dvdd12);
>         }
>
> But maybe it's overkill ? With or without that change (for the second
> regulator below too),

Thanks, I'll do as you suggested.



> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> >       /* 2.5V digital core power regulator  */
> >       anx6345->dvdd25 = devm_regulator_get(dev, "dvdd25");
> > -     if (IS_ERR(anx6345->dvdd25)) {
> > -             DRM_ERROR("dvdd25-supply not found\n");
> > +     if (IS_ERR(anx6345->dvdd25))
> >               return PTR_ERR(anx6345->dvdd25);
> > -     }
> >
> >       /* GPIO for chip reset */
> >       anx6345->gpiod_reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
>
> --
> Regards,
>
> Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
