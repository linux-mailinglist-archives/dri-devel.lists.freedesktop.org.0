Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E57557C29D
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 05:21:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F11C610E5B0;
	Thu, 21 Jul 2022 03:21:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E46EE11B36D
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 03:21:25 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id m17so113977wrw.7
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 20:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yp8UseCrak3Uf7ZMCku83+o+h8VdCTPmgbNqPdL/mic=;
 b=CWUDWwoFiqmSGU594z2yMobPBq5pAqEvzEkfu+LhpngVJg8+AB17WOtYFUaOLL3w/O
 WZho1Qu5XCZaEiphXiRPHKtYVElMDWAJP16GepKTPRvoGBYykFbFg6t4aRMmgv2wuIdI
 3cPqRJ9B5aiYxPIjxulAhMdSjndzkcdd0VaCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yp8UseCrak3Uf7ZMCku83+o+h8VdCTPmgbNqPdL/mic=;
 b=cBFH5iVmh+D63tS9szNOtZ8sRqSUud+L3aq78TP8VtKWca9ddAdS3HMAIzWOwD5JKv
 mxrP7Txs45sc4eGwnEI/Nhr6X++C7V7QzVd75lMrO/G/Ayk8D2IKNZaiBzVH5a0EryWL
 s9Opw5I1P/5QXYLZb9wuEr7YuN1bHZhYQMng68F51eszBaeRK6jMyXIZvifn3Ign2BUv
 w2EEp8RJqGedq515zXgqL/URilY8OuT8oVqFhKyZ9u235s4cFk3LulzcwyEAopzANGp1
 sInvYwR869R2PwAVmnCISIBigh8MqLACclBHzXJiZVnlas95t5ewus0zuI5Ya34CkTDN
 nc6Q==
X-Gm-Message-State: AJIora8dY+eCqZTxRCLJ59QZTxkkBRxRG73hvWo6mb/Wq5tJFD4eU/um
 8UthdIg4ImRVlPAnYrGK2GBbue8vKsfPAHdk5mfuLw==
X-Google-Smtp-Source: AGRyM1vXWKjhZfkFxxLgAqLrdrUS9zjdNtBJmP2AvtzG3M6MPXGe4Kuq83Pcwy/jiil49jxrZHAjerDJBVq2qFdBaGY=
X-Received: by 2002:a5d:4cce:0:b0:21d:755b:d4f8 with SMTP id
 c14-20020a5d4cce000000b0021d755bd4f8mr34773870wrt.190.1658373684373; Wed, 20
 Jul 2022 20:21:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220713031547.11641-1-allen.chen@ite.com.tw>
 <CAG3jFyvDWXZsSKaztKgbAUOY8DNFb81KvSpG5fQC=t1dUZp8oA@mail.gmail.com>
In-Reply-To: <CAG3jFyvDWXZsSKaztKgbAUOY8DNFb81KvSpG5fQC=t1dUZp8oA@mail.gmail.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Thu, 21 Jul 2022 11:21:13 +0800
Message-ID: <CAEXTbpeJweJEzPC-cRXYCGGoLM73-8Px8FY6P9hajk2V9eKbLw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: it6505: Add i2c api power on check
To: Robert Foss <robert.foss@linaro.org>
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
Cc: Kenneth Hung <Kenneth.Hung@ite.com.tw>, Pin-yen Lin <treapking@google.com>,
 David Airlie <airlied@linux.ie>, allen <allen.chen@ite.com.tw>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>,
 open list <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Hermes Wu <Hermes.Wu@ite.com.tw>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Robert,

The same patch has been reviewed and applied as
86088f88a25c76baac304b6f887e5da2c30c4e07 in "drm/bridge: it6505: Fixes
bugs" series.

We accidentally sent this out as an individual patch and forgot to
revoke this after sending out the complete series.

Sorry about that.

Regards,
Pin-yen

On Tue, Jul 19, 2022 at 11:26 PM Robert Foss <robert.foss@linaro.org> wrote:
>
> On Wed, 13 Jul 2022 at 05:16, allen <allen.chen@ite.com.tw> wrote:
> >
> > From: allen chen <allen.chen@ite.com.tw>
> >
> > Use i2c bus to read/write when it6505 power off will occur i2c error.
> > Add this check will prevent i2c error when it6505 power off.
> >
> > Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
> > Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
> > Reviewed-by: Robert Foss <robert.foss@linaro.org>
> > ---
> >  drivers/gpu/drm/bridge/ite-it6505.c | 12 ++++++++++--
> >  1 file changed, 10 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> > index aa5e0aa1af85..cfd2c3275dc5 100644
> > --- a/drivers/gpu/drm/bridge/ite-it6505.c
> > +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> > @@ -518,6 +518,9 @@ static int it6505_read(struct it6505 *it6505, unsigned int reg_addr)
> >         int err;
> >         struct device *dev = &it6505->client->dev;
> >
> > +       if (!it6505->powered)
> > +               return -ENODEV;
> > +
> >         err = regmap_read(it6505->regmap, reg_addr, &value);
> >         if (err < 0) {
> >                 dev_err(dev, "read failed reg[0x%x] err: %d", reg_addr, err);
> > @@ -533,6 +536,9 @@ static int it6505_write(struct it6505 *it6505, unsigned int reg_addr,
> >         int err;
> >         struct device *dev = &it6505->client->dev;
> >
> > +       if (!it6505->powered)
> > +               return -ENODEV;
> > +
> >         err = regmap_write(it6505->regmap, reg_addr, reg_val);
> >
> >         if (err < 0) {
> > @@ -550,6 +556,9 @@ static int it6505_set_bits(struct it6505 *it6505, unsigned int reg,
> >         int err;
> >         struct device *dev = &it6505->client->dev;
> >
> > +       if (!it6505->powered)
> > +               return -ENODEV;
> > +
> >         err = regmap_update_bits(it6505->regmap, reg, mask, value);
> >         if (err < 0) {
> >                 dev_err(dev, "write reg[0x%x] = 0x%x mask = 0x%x failed err %d",
> > @@ -2553,13 +2562,12 @@ static int it6505_poweron(struct it6505 *it6505)
> >                 usleep_range(10000, 20000);
> >         }
> >
> > +       it6505->powered = true;
> >         it6505_reset_logic(it6505);
> >         it6505_int_mask_enable(it6505);
> >         it6505_init(it6505);
> >         it6505_lane_off(it6505);
> >
> > -       it6505->powered = true;
> > -
> >         return 0;
> >  }
> >
> > --
> > 2.25.1
> >
>
> This patch no longer applies to the drm-misc-next tree, could you
> rebase it and send out a v3?
