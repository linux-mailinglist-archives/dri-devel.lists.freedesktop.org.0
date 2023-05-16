Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8875704E8D
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 15:02:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED0F10E09C;
	Tue, 16 May 2023 13:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC65510E09C
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 13:02:43 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1aaea3909d1so131556135ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 06:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684242163; x=1686834163;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kaXORhz+8RW894yoFfhPFe4LLGnVYgme5zSeBCWCFHk=;
 b=EHiMiNDFqzYZH5BSekJGhS8x7xb1zcmnIC701W+wG85+uJQPEJdKPET0bsK1LXHZJQ
 IcDScvY88OyXCdEXFqij1pGx17YZNgkM3Ff+FMp7W5gocdRo2lm9rnd7pwHTeaigt0Jy
 ew0IioPC+UFdRDyDR1hNECB9IYyn1rDdZcFS/7ukvhjavNMlrlhvk3wwNW/xRjHENNyI
 QNfamb/pddXHv/uPkGPD7zxlblSCOKcVjD9P4G6GB3/TsbIwb0vKLxjlEsFUJQhcOXaJ
 y/b1yWsdIb/1eaHvzpym4AKUlUIgAzlzu9J8B1wJU0PEJIMtZIShmRomeR3yNYVfvIyR
 rqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684242163; x=1686834163;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kaXORhz+8RW894yoFfhPFe4LLGnVYgme5zSeBCWCFHk=;
 b=gtIf7WbUvVO8fvP851068Cnpqub1ttaq15sVmwHkoHE7+vRIj37EQxlGpU2gz+SYaF
 sj1IFUAn38tqj1mBzXcqHP5e+XIa0XIFRnNi1sFI+TAsXI225Nqc0mefdm9jMMjPzrL5
 cY3v1U2ytPfDT6Bo3Woiahy/0wtxh9q9NVOUmbR3ikaLYyaif+czH7Aw1VGsGQX9UIgi
 Vm52zCvSsxIARMIBLXcdMyPg4aTHoiyWa8r+rcwLtBRvh/DEpjeDW4ZR6/7xxxhcCUjf
 ln0QFpguPTx2Z0s/OCZB5VfjYanv8GtdUZ7VYBwGPIwC/OgJRYCNhictvoO31dJbN9mV
 z54w==
X-Gm-Message-State: AC+VfDzh09paTbGKWCqPSG36/V632GsZJLkCTSNOxzwWk73MXzHYpZdz
 N3WX2CATga7Bam+iwpNidy9lmuoVj62Gi6YpfAQ=
X-Google-Smtp-Source: ACHHUZ51C0wEaA3yJ4UzgPmQyHJvXvfxH09GFBbgghyInTN0AWx4Cn/7unwTxVUGykHy2mSFqHyAPkaq0GDsPlkgo0w=
X-Received: by 2002:a17:902:ea07:b0:1ac:b0c5:77e5 with SMTP id
 s7-20020a170902ea0700b001acb0c577e5mr26208073plg.68.1684242162562; Tue, 16
 May 2023 06:02:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230515235713.232939-1-aford173@gmail.com>
 <20230515235713.232939-7-aford173@gmail.com>
 <CAGXv+5EDYvjOiAWDnQsrrp=0iWm54N+pR3O43xDFXYE=UxAw-g@mail.gmail.com>
In-Reply-To: <CAGXv+5EDYvjOiAWDnQsrrp=0iWm54N+pR3O43xDFXYE=UxAw-g@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 16 May 2023 08:02:30 -0500
Message-ID: <CAHCN7xKdr1syQS6RKNnuAuEEbsbDQjEnOdJcYdaFNDEnYVuK6w@mail.gmail.com>
Subject: Re: [PATCH V6 6/6] drm: bridge: samsung-dsim: Support non-burst mode
To: Chen-Yu Tsai <wenst@chromium.org>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, aford@beaconembedded.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jagan Teki <jagan@amarulasolutions.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 15, 2023 at 10:26=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> On Tue, May 16, 2023 at 7:57=E2=80=AFAM Adam Ford <aford173@gmail.com> wr=
ote:
> >
> > The high-speed clock is hard-coded to the burst-clock
> > frequency specified in the device tree.  However, when
> > using devices like certain bridge chips without burst mode
> > and varying resolutions and refresh rates, it may be
> > necessary to set the high-speed clock dynamically based
> > on the desired pixel clock for the connected device.
> >
> > This also removes the need to set a clock speed from
> > the device tree for non-burst mode operation, since the
> > pixel clock rate is the rate requested from the attached
> > device like a bridge chip.  This should have no impact
> > for people using burst-mode and setting the burst clock
> > rate is still required for those users.  If the burst
> > clock is not present, change the error message to
> > dev_info indicating the clock use the pixel clock.
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> > Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> > Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> > Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> > ---
> >  drivers/gpu/drm/bridge/samsung-dsim.c | 27 +++++++++++++++++++++------
> >  1 file changed, 21 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/br=
idge/samsung-dsim.c
> > index 3944b7cfbbdf..03b21d13f067 100644
> > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > @@ -655,16 +655,28 @@ static unsigned long samsung_dsim_set_pll(struct =
samsung_dsim *dsi,
> >
> >         dsi->hs_clock =3D fout;
> >
> > +       dsi->hs_clock =3D fout;
> > +
>
> Not sure about the double assignment. Was this caused by a rebase?

Oops,

I moved this to the previous patch since the updated dphy changes
needed to know the hs_clock. I must forgot to check this when I
applied the subsequent patch, so the double assignment appeared.  I am
surprised the patch tool didn't complain.  I guess the good news is
that nothing is broken, but the bad news is I have to spam everyone
with a V7.  I'll wait a couple days to see if anything finds anything
else.

adam
>
> ChenYu
>
> >         return fout;
> >  }
> >
> >  static int samsung_dsim_enable_clock(struct samsung_dsim *dsi)
> >  {
> > -       unsigned long hs_clk, byte_clk, esc_clk;
> > +       unsigned long hs_clk, byte_clk, esc_clk, pix_clk;
> >         unsigned long esc_div;
> >         u32 reg;
> > +       struct drm_display_mode *m =3D &dsi->mode;
> > +       int bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> > +
> > +       /* m->clock is in KHz */
> > +       pix_clk =3D m->clock * 1000;
> > +
> > +       /* Use burst_clk_rate if available, otherwise use the pix_clk *=
/
> > +       if (dsi->burst_clk_rate)
> > +               hs_clk =3D samsung_dsim_set_pll(dsi, dsi->burst_clk_rat=
e);
> > +       else
> > +               hs_clk =3D samsung_dsim_set_pll(dsi, DIV_ROUND_UP(pix_c=
lk * bpp, dsi->lanes));
> >
> > -       hs_clk =3D samsung_dsim_set_pll(dsi, dsi->burst_clk_rate);
> >         if (!hs_clk) {
> >                 dev_err(dsi->dev, "failed to configure DSI PLL\n");
> >                 return -EFAULT;
> > @@ -935,7 +947,7 @@ static void samsung_dsim_set_display_mode(struct sa=
msung_dsim *dsi)
> >         u32 reg;
> >
> >         if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
> > -               int byte_clk_khz =3D dsi->burst_clk_rate / 1000 / 8;
> > +               int byte_clk_khz =3D dsi->hs_clock / 1000 / 8;
> >                 int hfp =3D (m->hsync_start - m->hdisplay) * byte_clk_k=
hz / m->clock;
> >                 int hbp =3D (m->htotal - m->hsync_end) * byte_clk_khz /=
 m->clock;
> >                 int hsa =3D (m->hsync_end - m->hsync_start) * byte_clk_=
khz / m->clock;
> > @@ -1785,10 +1797,13 @@ static int samsung_dsim_parse_dt(struct samsung=
_dsim *dsi)
> >                         return PTR_ERR(pll_clk);
> >         }
> >
> > +       /* If it doesn't exist, use pixel clock instead of failing */
> >         ret =3D samsung_dsim_of_read_u32(node, "samsung,burst-clock-fre=
quency",
> > -                                      &dsi->burst_clk_rate, 0);
> > -       if (ret < 0)
> > -               return ret;
> > +                                      &dsi->burst_clk_rate, 1);
> > +       if (ret < 0) {
> > +               dev_info(dev, "Using pixel clock for HS clock frequency=
\n");
> > +               dsi->burst_clk_rate =3D 0;
> > +       }
> >
> >         ret =3D samsung_dsim_of_read_u32(node, "samsung,esc-clock-frequ=
ency",
> >                                        &dsi->esc_clk_rate, 0);
> > --
> > 2.39.2
> >
