Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CCA75A7D8
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 09:31:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7F0C10E56B;
	Thu, 20 Jul 2023 07:31:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 153EE10E56B
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 07:30:59 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f9fdb0ef35so717537e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 00:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shruggie-ro.20221208.gappssmtp.com; s=20221208; t=1689838258; x=1690443058; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DLpdS0nzS/H8+/h/goVnv+WGk0clAZf3NPIfiJp71qw=;
 b=HncJdPIMTX+qaBUzG5i7VRrv3rlQHnfotrPx77BG6Hos32iVEoRSfuqxZeQP0171dj
 ykH5K9ZhNSOvXRruKTEh95RBW7AO8GfX0bkO4yiwXe3YWtex88q/JArnx6WoZ/qN8ty0
 TwA28LqoAeJhPXIszAbArFSNQW7m4/Tx8ladtFdzd8w1JzwqHxvNA8OpEoacz2L/JPGC
 Db2+PuchclXWyfm+5CokonBKeA0oI4ppi2gj240FEX6Mdz0lluzwJTHf+6uIbvmEv1pi
 wWDs/OQi26gG8guKVQkN2kiVsoZ+Cb5ejFsLcAGM/i9W2W9y3ujgJIpOC4eEhzYxwn09
 RGrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689838258; x=1690443058;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DLpdS0nzS/H8+/h/goVnv+WGk0clAZf3NPIfiJp71qw=;
 b=RZnIQgcOgBq/1YYc5JdjfkX5iy5oMVDOuy4K759O3ywX+wRJNiD/fnpi6wmmGkJv9Y
 KZd2BVVjEf5NYHsc2lJEbsBw9zYlFv77/M477nukEhv12im5cbuJtYPKhQORwfUi0qiw
 0xBuv62k0/E4NfgPk8c8UYQJGLp0V+w5btsenOlLUJHmKq7YJVWrWhOeLwy74L4KXkOz
 uRVwnrSwBBu2lPCTp8laUQzZOWNImOdvsm9k/n7X5IbymCh5lSxm8NFMJ3pqwXYuEQcc
 2dRiN+/INoABhHdgCBTta928cTgYkyrO2OpN994a5sgWASTJJU2xywi0qAxIfMvXfH1g
 L68g==
X-Gm-Message-State: ABy/qLboM53SwKil67/p88gSA0vda2mCIql59du66nU39pQAIQsZ0pwl
 +UxnyVEMuuCIfQLBLmaWMXAAdCfW73205aSYTJXTOA==
X-Google-Smtp-Source: APBJJlFAiH/JoVFj0bMzbBtL7BPWkJik1Ym14XHd5gxOagEWC7ViCtUOB6qhZPnenQP/Nkl28TyhGjZUeoHXeOR3oaI=
X-Received: by 2002:a2e:924b:0:b0:2b6:d5af:1160 with SMTP id
 v11-20020a2e924b000000b002b6d5af1160mr1285758ljg.28.1689838258061; Thu, 20
 Jul 2023 00:30:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190716131005.761-1-bogdan.togorean@analog.com>
 <20230719060143.63649-1-alex@shruggie.ro>
In-Reply-To: <20230719060143.63649-1-alex@shruggie.ro>
From: Alexandru Ardelean <alex@shruggie.ro>
Date: Thu, 20 Jul 2023 10:30:46 +0300
Message-ID: <CAH3L5QqJ_VgS=_95WOK9-yj6dr1Qmkjyb_MNAjBgkgfxu3vW3g@mail.gmail.com>
Subject: Re: [PATCH v4] drm: adv7511: Fix low refresh rate register for
 ADV7533/5
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
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
Cc: neil.armstrong@linaro.org, rfoss@kernel.org, andrzej.hajda@intel.com,
 jonas@kwiboo.se, nuno.sa@analog.com, Laurent.pinchart@ideasonboard.com,
 bogdan.togorean@analog.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 19, 2023 at 9:02=E2=80=AFAM Alexandru Ardelean <alex@shruggie.r=
o> wrote:
>
> From: Bogdan Togorean <bogdan.togorean@analog.com>
>
> For ADV7533 and ADV7535 low refresh rate is selected using
> bits [3:2] of 0x4a main register.
> So depending on ADV model write 0xfb or 0x4a register.
>
> Fixes: 2437e7cd88e8 ("drm/bridge: adv7533: Initial support for ADV7533")
> Reviewed-by: Robert Foss <rfoss@kernel.org>
> Reviewed-by: Nuno Sa <nuno.sa@analog.com>
> Signed-off-by: Bogdan Togorean <bogdan.togorean@analog.com>
> Signed-off-by: Alexandru Ardelean <alex@shruggie.ro>
> ---

Right.
I forgot a changelog here.
Apologies

Changelog v3 -> v4:
* Ran ./scripts/checkpatch.pl --strict
* Added Reviewed-by: Robert Foss <rfoss@kernel.org>

Changelog v2 -> v3:
* https://lore.kernel.org/dri-devel/1c3fde3a873b0f948d3c4d37107c5bb67dc9f7b=
b.camel@gmail.com/T/#u
* Added my S-o-b tag back

Changelog v1 -> v2:
* https://lore.kernel.org/dri-devel/20190716131005.761-1-bogdan.togorean@an=
alog.com/
* added Fixes: tag
* added Reviewed-by: tag for Nuno


>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/d=
rm/bridge/adv7511/adv7511_drv.c
> index ddceafa7b637..8d6c93296503 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -786,8 +786,13 @@ static void adv7511_mode_set(struct adv7511 *adv7511=
,
>         else
>                 low_refresh_rate =3D ADV7511_LOW_REFRESH_RATE_NONE;
>
> -       regmap_update_bits(adv7511->regmap, 0xfb,
> -               0x6, low_refresh_rate << 1);
> +       if (adv7511->type =3D=3D ADV7511)
> +               regmap_update_bits(adv7511->regmap, 0xfb,
> +                                  0x6, low_refresh_rate << 1);
> +       else
> +               regmap_update_bits(adv7511->regmap, 0x4a,
> +                                  0xc, low_refresh_rate << 2);
> +
>         regmap_update_bits(adv7511->regmap, 0x17,
>                 0x60, (vsync_polarity << 6) | (hsync_polarity << 5));
>
> --
> 2.41.0
>
