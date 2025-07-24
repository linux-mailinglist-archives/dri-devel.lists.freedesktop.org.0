Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE67BB10B4B
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 15:24:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5CDB10E17A;
	Thu, 24 Jul 2025 13:24:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lNMBTCco";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EE6B10E148
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 10:14:24 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id
 e9e14a558f8ab-3e2c683524fso3405765ab.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 03:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753352063; x=1753956863; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zoxQrE9BQllINJgA23hOAwgoifAhEszw6BlmYIQoAW8=;
 b=lNMBTCcoFC2tSyRQZQsO+HoI71Yqw305oV/7IqToy+C/xZfpkIps+9aCuZt8lH97Rq
 rbYgD/o/hPuDrYhSVWvitHgUoLD3a35wt949t4n6Az6Z6pEdhc5yW8d4lVQJz3C60N3T
 BkGnrkzx9tRO6SuwxqMdKkyUnzWVON+JgTGQ/m41rENUKbdoTfre29vy7UzJ3oGqg9Jf
 QZNkkmipS8RMjhrjYzsZl1lvYILfFPZi1XUzeJC+gSPIwZdxTz7fWJ6xUXARgXVH4MyL
 M28btRHlzuuERopLKtja5aXC6LqPH8GJgXlt0BfxQc2O0DbPR5ZDf0+GCQpvDpaqglS3
 2kbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753352063; x=1753956863;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zoxQrE9BQllINJgA23hOAwgoifAhEszw6BlmYIQoAW8=;
 b=edDRx1M19ks/DmVS0bESkuk/Zjg4tS3TbkrNHRW9yg3knM9ogNy/dz9Vq0EROJX2AI
 ERzonQNhquhLug4+j5hhIEHTcE4JI6Ki4r/C0/Hvlq7YVVSILYYuwvRu4ItomULkpRf4
 CbMHF/81bKh7sLOv8mh39cmGL/kV8mdoV3DtSfLKudPnjFmo5G26aXagQHjMN2Rc3y+B
 d7gA5y+6trawZ2U60eZ1OBesC+Yk1KiKmS5UmbY9MYzaejRsUKKJQgf4TthQu7jsSubP
 QpFNz2r871L/DFg4HfetvTfxJ/TyOMxJAs6DLJYwlFlVn6fNNdSA2zrM2uTTsG3ZUtd4
 jlAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEHt9hdj9lL8GPFogET1lUWB6nMy5idjv2mV+TialW/RZEYJ9t+/Ht4Lb6uNUHJz78F7qTwrV0LL0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfCQRAvKEXk3dXfiq/+bIKVckXgaHqGbtxzqBbmMjH1ckhfofD
 DyG6Je5i2/Ql3sNnCS9lvwry4qxhdFnz1h2F6tro9qpTyBZIYOyiRIDKMV9AuPHnh6kfUnoDQpj
 0pnwXPrUsRTyygZnyUIvbqzTS5isMYGE=
X-Gm-Gg: ASbGncsPzWMhGvZdikbvJPXyvdxF9uTm2njLzFPIzRk49Wo4HL88ee/xPyCuDwVTMPZ
 6D725GfE+idJq7/A7YZpXo6tLM8rvr6ijcWJXdu6UgXpWu9EKgiFFU+TFl2vDGaEZmAL5UC6gqO
 3fjzXSPJi4ZJGDUtWyuZretCboPYewsF9xNLCZ7nEj8Lw5Pdxus++nmBSuMhcO7mEUsZZB61Vwp
 CDocQc=
X-Google-Smtp-Source: AGHT+IFuX+HkjjMmIqfOcPi1Vf9XVVv1BJDb7TK2k3LjKb0AvDjYDmsh1XyejNfF4igxDfky969ahsCQGQoG5Rin4/s=
X-Received: by 2002:a05:6e02:1945:b0:3e2:a40e:d29f with SMTP id
 e9e14a558f8ab-3e3418d71c5mr88504975ab.9.1753352063278; Thu, 24 Jul 2025
 03:14:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250724072248.1517569-1-shengjiu.wang@nxp.com>
 <20250724072248.1517569-3-shengjiu.wang@nxp.com> <87jz3ykpju.wl-tiwai@suse.de>
 <20250724-fair-sheep-of-success-e02586-mkl@pengutronix.de>
In-Reply-To: <20250724-fair-sheep-of-success-e02586-mkl@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 24 Jul 2025 18:14:10 +0800
X-Gm-Features: Ac12FXy8l34qKKJsPON1hex-xaVDf1J211wM6fAeHOddOjpvI8f17HQ8iYSYGc8
Message-ID: <CAA+D8AN2B_RZ9iZ3qE5zMBfs7BMAkruSRQupoXyrsr7Tt+Gfkg@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] ALSA: Add definitions for the bits in IEC958
 subframe
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Takashi Iwai <tiwai@suse.de>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 imx@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com, 
 festevam@gmail.com, simona@ffwll.ch, robh@kernel.org, rfoss@kernel.org, 
 airlied@gmail.com, tiwai@suse.com, jernej.skrabec@gmail.com, 
 p.zabel@pengutronix.de, luca.ceresoli@bootlin.com, devicetree@vger.kernel.org, 
 conor+dt@kernel.org, tzimmermann@suse.de, jonas@kwiboo.se, victor.liu@nxp.com, 
 s.hauer@pengutronix.de, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 linux-sound@vger.kernel.org, perex@perex.cz, 
 linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org, 
 lumag@kernel.org, dianders@chromium.org, kernel@pengutronix.de, 
 cristian.ciocaltea@collabora.com, krzk+dt@kernel.org, shawnguo@kernel.org, 
 l.stach@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 24 Jul 2025 13:24:19 +0000
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

On Thu, Jul 24, 2025 at 3:40=E2=80=AFPM Marc Kleine-Budde <mkl@pengutronix.=
de> wrote:
>
> On 24.07.2025 09:37:09, Takashi Iwai wrote:
> > On Thu, 24 Jul 2025 09:22:44 +0200,
> > Shengjiu Wang wrote:
> > >
> > > The IEC958 subframe format SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE are us=
ed
> > > in HDMI and DisplayPort to describe the audio stream, but hardware de=
vice
> > > may need to reorder the IEC958 bits for internal transmission, so nee=
d
> > > these standard bits definitions for IEC958 subframe format.
> > >
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > ---
> > >  include/sound/asoundef.h | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > >
> > > diff --git a/include/sound/asoundef.h b/include/sound/asoundef.h
> > > index 09b2c3dffb30..7efd61568636 100644
> > > --- a/include/sound/asoundef.h
> > > +++ b/include/sound/asoundef.h
> > > @@ -12,6 +12,15 @@
> > >   *        Digital audio interface                                   =
   *
> > >   *                                                                  =
        *
> > >   *******************************************************************=
*********/
> > > +/* IEC958 subframe format */
> > > +#define IEC958_SUBFRAME_PREAMBLE_MASK      (0xf)
> > > +#define IEC958_SUBFRAME_AUXILIARY_MASK     (0xf<<4)
> > > +#define IEC958_SUBFRAME_SAMPLE_24_MASK     (0xffffff<<4)
> > > +#define IEC958_SUBFRAME_SAMPLE_20_MASK     (0xfffff<<8)
> > > +#define IEC958_SUBFRAME_VALIDITY   (0x1<<28)
> > > +#define IEC958_SUBFRAME_USER_DATA  (0x1<<29)
> > > +#define IEC958_SUBFRAME_CHANNEL_STATUS     (0x1<<30)
> > > +#define IEC958_SUBFRAME_PARITY             (0x1<<31)
> >
> > I'd use "U" suffix as it can reach to the MSB.
> > Also, you can put spaces around the operators to align with the
> > standard format, too.  I guess you followed to the other code there,
> > but following to the standard coding style would be better.
> >
> > With those addressed, feel free to take my ack for this patch:
>
> Or make use of the BIT() and GEN_MASK() helpers.

Is it acceptable to include the headers in this file?

Best regards
Shengjiu Wang


>
> Marc
>
> --
> Pengutronix e.K.                 | Marc Kleine-Budde          |
> Embedded Linux                   | https://www.pengutronix.de |
> Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
> Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |
