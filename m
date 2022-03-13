Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D80864D7563
	for <lists+dri-devel@lfdr.de>; Sun, 13 Mar 2022 13:57:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1245510E021;
	Sun, 13 Mar 2022 12:57:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAB9910E021
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Mar 2022 12:57:11 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id x200so25791832ybe.6
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Mar 2022 05:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fkXYlJ6C6wkFx+x1ssKNLuodQj89i4Wuj3dyn8HZpf4=;
 b=e6LfJXTDrJfr5e+FFTBR0v8xULBC4J7mRTDfbLN9gxn7hKKROSV7ZupjXMLbjousk1
 xo3TallrpFvTBcUxLYiWQoDzUINEUjp0OnUTfRNdrVUYmyiY4gjx//bLKVUYDi31D+Pf
 c1qPal5zb3zJU2M1jTTSUein/9JRR1fbzyWfhW5Gqbt2uUlGJNWuMkLEqPNqg01VBjcp
 vUaEA7NxHf2krE4SbXeHOv3AcOMnRsdHQ9giyIm6nWRalg/MkCJpdKMuO4Z1smX5fazZ
 aH6qJY53kFdK7D3JZ+RuT4jMwsBmBMo/2JCUN9UsIeTkzEZLYJzxlTPQBEtEWzS+TH5u
 KLrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fkXYlJ6C6wkFx+x1ssKNLuodQj89i4Wuj3dyn8HZpf4=;
 b=K0PbER5hrffgVP0SRLNb7seQ0b93cpPJ8TC/aL3V74hn7AMJs+sEsOecUMbDfSxYJI
 KDX8zprhqvomjtX444a68mYvAwzLcTZlAkJGcFbx+0gaz2d8dSvRImjXuT59Kl85H+X3
 uT3weK+leh/poGR09M2EpKMFufkSZ0Gv/9bSNBt3FQbOO4wVkdnW+wodOII4B2n1kZgE
 VZ76vGuKsia6vDg6YNTfxQsPlKC83WaEc0eukHCC7RvVFt9+lacCJzwnfOgAK7A0AsaU
 x4nq43IEXJphsT5PDzg1JT6XtfkaBxafjzGmG/sxKrw0HjiBAn8K7gDhWbZnBmyV5JcR
 GBew==
X-Gm-Message-State: AOAM531yNcvjk8jQRUVzjJOh4gnpxMijMCZB7J+B0ORL8xbKjcuyyJmh
 BaVQLA+DMGiURjyxiMmqPAL488Z1nLWZ5VnEzhs=
X-Google-Smtp-Source: ABdhPJxH2ISX8S+q91FSxXNkK8blf42NUZjIRur4xEN3Knox2qgPaszmg0iOARYnwXKwf7vmcknjfuEcvofiXpzpTFc=
X-Received: by 2002:a25:e697:0:b0:629:1f4a:5a3c with SMTP id
 d145-20020a25e697000000b006291f4a5a3cmr14243335ybh.228.1647176227256; Sun, 13
 Mar 2022 05:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220126202427.3047814-1-pgwipeout@gmail.com>
 <3AFD1DD4-AF0A-4ECC-B4F5-E6BD6B9F1BB7@gmail.com>
In-Reply-To: <3AFD1DD4-AF0A-4ECC-B4F5-E6BD6B9F1BB7@gmail.com>
From: Peter Geis <pgwipeout@gmail.com>
Date: Sun, 13 Mar 2022 08:56:55 -0400
Message-ID: <CAMdYzYq06QSmFAwCuTmBYy4LfQAQDxzx2PGc8HOB1iEjxXHGyg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: synopsys/dw-hdmi: set cec clock rate
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: dri-devel@lists.freedesktop.org, Archit Taneja <architt@codeaurora.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Pierre-Hugues Husson <phh@phh.me>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 13, 2022 at 6:13 AM Piotr Oniszczuk
<piotr.oniszczuk@gmail.com> wrote:
>
>
>
> > Wiadomo=C5=9B=C4=87 napisana przez Peter Geis <pgwipeout@gmail.com> w d=
niu 26.01.2022, o godz. 21:24:
> >
> > The hdmi-cec clock must be 32khz in order for cec to work correctly.
> > Ensure after enabling the clock we set it in order for the hardware to
> > work as expected.
> > Warn on failure, in case this is a static clock that is slighty off.
> > Fixes hdmi-cec support on Rockchip devices.
> >
> > Fixes: ebe32c3e282a ("drm/bridge: synopsys/dw-hdmi: Enable cec clock")
> >
> > Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> > ---
> > drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 7 +++++++
> > 1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/dr=
m/bridge/synopsys/dw-hdmi.c
> > index 54d8fdad395f..1a96da60e357 100644
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > @@ -48,6 +48,9 @@
> >
> > #define HDMI14_MAX_TMDSCLK    340000000
> >
> > +/* HDMI CEC needs a clock rate of 32khz */
> > +#define HDMI_CEC_CLK_RATE    32768
> > +
> > enum hdmi_datamap {
> >       RGB444_8B =3D 0x01,
> >       RGB444_10B =3D 0x03,
> > @@ -3347,6 +3350,10 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_de=
vice *pdev,
> >                               ret);
> >                       goto err_iahb;
> >               }
> > +
> > +             ret =3D clk_set_rate(hdmi->cec_clk, HDMI_CEC_CLK_RATE);
> > +             if (ret)
> > +                     dev_warn(hdmi->dev, "Cannot set HDMI cec clock ra=
te: %d\n", ret);
> >       }
> >
> >       /* Product and revision IDs */
> > --
> > 2.25.1
> >
> >
> > _______________________________________________
> > Linux-rockchip mailing list
> > Linux-rockchip@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-rockchip
>
> Peter,
>
> On my 5.17-rc7 with applied rk356x VOP2 v8 series - this patch makes CEC =
working on rk3566.
> Unfortunately it breaks working ok CEC on rk3399 rockpi-4b.
>
> Reverting this patch brings back CEC on rk3399 - but rk3366 becomes with =
non working CEC
>
> I'm not sure how to move forward with this....

I was worried about that, thanks for testing it.
Can you send me the cec_clk rate before and after this patch?

>
> br
