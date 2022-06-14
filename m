Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FF554BD1E
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 23:58:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B369112D4F;
	Tue, 14 Jun 2022 21:58:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F4060112D4F
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 21:58:15 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id u2so7594137iln.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 14:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Dh0EwzPz3kqagP+w6qwTm8phrVMK+QxhIfwoboe697M=;
 b=OYiWPsiSfA672A8Ec/CxKQHsYFYdfR8PBm9YnzByfBJE63ZFeEC4Wkh1leHLQaPk0c
 qrwPp9Royg8qntCuq7K3zRL3/P5RF3CLDXgzwYexeyFSPsGRR24wDzWc4kPDt57PybJe
 7+G8/Jty/jyysvXv5N5jjYXx2xw5seJMd5LsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dh0EwzPz3kqagP+w6qwTm8phrVMK+QxhIfwoboe697M=;
 b=5YBkhsofMEzYFSEx0Ism19QVcbxFi6MELRIGyCAyJ/oLjAdwbT1xErZiMWuMKN1slL
 XLhDmpdzSe5FVkZH/NIsdQQ9/57IZin2/5axgX1lOc2ZSRC0RmNbshDeJHjuwVx/JFrW
 axCrv8++24BChpBOZWxhAsz5k8Gh0MVtD56qi/m8mSWq6x7gKX5djN5C2O3gnUu0LOn5
 DrpysxXAO8HBDTO0cAavJZ/JWoc3ikE0PgrJYeJnzNpdi9nLQxte5XxpW0v5wiNyPcl8
 trzyfkmFCRxRy8nN580MvunEXfyBMmY6tft2qVEEhm5MjWGkaZaFsiLJPE2bRpEXtSyG
 ezEA==
X-Gm-Message-State: AJIora8ZBSg2atvFoOILaCJVoqX6SD2htRyo2LFcR39wq+IHofmCdYae
 K+cobTJKmM98r8Axaeup3slsQLk9Xs6ulM+p
X-Google-Smtp-Source: AGRyM1vrilosioNAwOBIAR5JSLFkcH5zxSw6LHzZWYWEasIh9l0OwRBj4yyRuxmxbW62nJo7bKl93Q==
X-Received: by 2002:a05:6e02:168f:b0:2d3:c51d:7f69 with SMTP id
 f15-20020a056e02168f00b002d3c51d7f69mr4222643ila.64.1655243895181; 
 Tue, 14 Jun 2022 14:58:15 -0700 (PDT)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com.
 [209.85.166.173]) by smtp.gmail.com with ESMTPSA id
 r6-20020a924406000000b002cde6e352f8sm6020760ila.66.2022.06.14.14.58.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 14:58:14 -0700 (PDT)
Received: by mail-il1-f173.google.com with SMTP id h18so7577164ilj.7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 14:58:13 -0700 (PDT)
X-Received: by 2002:a05:6e02:1a6f:b0:2d3:ada4:2f11 with SMTP id
 w15-20020a056e021a6f00b002d3ada42f11mr4211456ilv.256.1655243893406; Tue, 14
 Jun 2022 14:58:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220418171757.2282651-1-dianders@chromium.org>
 <20220418101725.v3.2.Icea616f57331fbaa3d48c529f300c9a8ebd37fb5@changeid>
 <eb66c55c-cecb-0af0-8800-0a9e59d67a9b@linaro.org>
In-Reply-To: <eb66c55c-cecb-0af0-8800-0a9e59d67a9b@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 14 Jun 2022 14:57:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UhjnhZ8sERSugPbYomCMaYJig5_QYx_0=ZWAuNyaB+ww@mail.gmail.com>
Message-ID: <CAD=FV=UhjnhZ8sERSugPbYomCMaYJig5_QYx_0=ZWAuNyaB+ww@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] drm/panel-edp: Take advantage of
 wait_hpd_asserted() in struct drm_dp_aux
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Philip Chen <philipchen@chromium.org>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Jun 2, 2022 at 8:12 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 18/04/2022 20:17, Douglas Anderson wrote:
> > Let's add support for being able to read the HPD pin even if it's
> > hooked directly to the controller. This will allow us to get more
> > accurate delays also lets us take away the waiting in the AUX transfer
> > functions of the eDP controller drivers.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> > ---
> >
> > (no changes since v2)
> >
> > Changes in v2:
> > - Change is_hpd_asserted() to wait_hpd_asserted()
> >
> >   drivers/gpu/drm/panel/panel-edp.c | 33 +++++++++++++++++++++----------
> >   1 file changed, 23 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> > index 1732b4f56e38..086e0bf52fb9 100644
> > --- a/drivers/gpu/drm/panel/panel-edp.c
> > +++ b/drivers/gpu/drm/panel/panel-edp.c
> > @@ -417,6 +417,11 @@ static int panel_edp_get_hpd_gpio(struct device *dev, struct panel_edp *p)
> >       return 0;
> >   }
> >
> > +static bool panel_edp_can_read_hpd(struct panel_edp *p)
> > +{
> > +     return !p->no_hpd && (p->hpd_gpio || (p->aux && p->aux->wait_hpd_asserted));
> > +}
> > +
> >   static int panel_edp_prepare_once(struct panel_edp *p)
> >   {
> >       struct device *dev = p->base.dev;
> > @@ -441,17 +446,21 @@ static int panel_edp_prepare_once(struct panel_edp *p)
> >       if (delay)
> >               msleep(delay);
> >
> > -     if (p->hpd_gpio) {
> > +     if (panel_edp_can_read_hpd(p)) {
> >               if (p->desc->delay.hpd_absent)
> >                       hpd_wait_us = p->desc->delay.hpd_absent * 1000UL;
> >               else
> >                       hpd_wait_us = 2000000;
> >
> > -             err = readx_poll_timeout(gpiod_get_value_cansleep, p->hpd_gpio,
> > -                                      hpd_asserted, hpd_asserted,
> > -                                      1000, hpd_wait_us);
> > -             if (hpd_asserted < 0)
> > -                     err = hpd_asserted;
> > +             if (p->hpd_gpio) {
> > +                     err = readx_poll_timeout(gpiod_get_value_cansleep,
> > +                                              p->hpd_gpio, hpd_asserted,
> > +                                              hpd_asserted, 1000, hpd_wait_us);
> > +                     if (hpd_asserted < 0)
> > +                             err = hpd_asserted;
> > +             } else {
> > +                     err = p->aux->wait_hpd_asserted(p->aux, hpd_wait_us);
> > +             }
>
> I'm close to thinking that this construct deserves a separate helper.

Just to close the loop: I didn't try to create a helper for v5. I'm
not completely convinced that this will be common. I would tend to
expect that having HPD handled by a GPIO is somewhat rare. It's also
fairly rare to have a panel that's not handled by the generic
panel-edp. We ended up with the GPIO on trogdor because of the weird
debouncing on sn85dsi86 and we ended up with one case of not using
edp-panel on trogdor because of the weird power sequencing of the
Samsung OLED panel that's on homestar.

I'd also note that the generic eDP panel has a special case for
"timeout" which we don't have on the Samsung panel to handle at least
one panel I found that sometimes simply didn't come up but then
_would_ come up on a retry...

That doesn't mean we couldn't abstract it out later, of course. ;-)

-Doug


-Doug
