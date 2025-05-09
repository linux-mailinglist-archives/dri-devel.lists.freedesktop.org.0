Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0CFAB0A3D
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 08:05:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46BB110E9B2;
	Fri,  9 May 2025 06:05:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VJJur4Yc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEFAB10E9B2
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 06:04:57 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-39ee5a5bb66so1267847f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 08 May 2025 23:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746770696; x=1747375496; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+YH+J7PBU/JVJvTRTJ5fWHu9R175kV/9VAq5m9JiwHE=;
 b=VJJur4YcBO3C4fvsO7p3fPdSl0Hw5RssQzri5Fq/rXJBA2VueQHB1V4iW22MfQUbAN
 udjsSIcHNhYrW5BRLuJJdPqx4O2L87IuSTKsZ7ew30RifGzYTgVQK5/Vc3/+iwu470rf
 ourH/3oyLoRiNefWwFbLbilcNy2MPRNwARtW0L0IFCdpEvPJ5/euoF4SriO07itefD/m
 cG6+q/olzpqNdw6WIrPa7IzO51HEka/LHJrjoMUsWsUbr3zWZYMJkH9QqT2nt+ErO3Mn
 Xv49kg/ISLUk/TBg3eOcdmNOTEnnCNaGMKdFF4lzSgxpKloe1myFR0PTyNkBrUrZa53c
 i5Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746770696; x=1747375496;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+YH+J7PBU/JVJvTRTJ5fWHu9R175kV/9VAq5m9JiwHE=;
 b=ZLXcgFgt8N36D7uT5RolOpNGGpTl/eB9dQtc5X2Du508QDQtosVWRqPG0wbfgBNqUn
 Si9jAodK6bDQPPof9PJxqrQPcvwW8FGH5NkZGclCV1YqSfyrVWwVVJKbU8ZwsOiyMJ2D
 VxeIU2wHDWPdzMs5yO7bpZ40s5W6lwnP8a8MU7eJtaTgIed0FyCbM1P6y9w4axBhjwfl
 lNlrNIqJSf+VrB5ID2Jb9wHNMoElop1INeyUtFzsYsZdM7y4u4RsEl5jFotFj8LRpKl0
 vKmIHxdvQyx/oSJk7xszlczotYAuHRACIhnxFkvT5aiHhb6HGDur/+eBxP4xXQUPVvFp
 xwzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlc4bjineNoQhE6YT+rxGErQTob6AMLGRB8gWMr/VI4DoFBXNeiK9yEbOV1rlJ89sDDPAcZswHa64=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzzLs1Dk1IPibywuk+Ro9mpNf2OyDx5L7MjnaVh1mSthPRXdSUT
 4afWfuDa4lNWgrdjRrg7yQX1jRqhtHpN1UeMhqxJgWL+a+tOBoi0dYN4a0f/R3CIhFW40tN28PH
 re9OFy39nwVIh0oI1UiZ0Iva9H3Q=
X-Gm-Gg: ASbGnct302EHOAUwncgCZoRNbs/cQZ7WNbCL8rI1HpD4Ia5Ivp/xIFTIZJHPcQP63Hf
 rZ3nXOJmqinZpP9vpCesvMEr5hQRxmEpr79x7+EMSpCBOwdQ9VWZupxt3Im8H453xyFwk+zFq/E
 nU28AbdaiTxhdkxuDfp2smRXoCYWHulGH4ow==
X-Google-Smtp-Source: AGHT+IEoTNTrBaYbkjgRbGjpus29JTMUvaAhSH12iOiVqjFnAX+vMaEZKKf9Cq3jByjlaiW/E63KH8HOE7hW1bhzXd8=
X-Received: by 2002:a05:6000:4287:b0:3a0:b635:ea40 with SMTP id
 ffacd0b85a97d-3a1f64a3e3dmr1665593f8f.55.1746770695189; Thu, 08 May 2025
 23:04:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250506093340.106575-1-clamor95@gmail.com>
 <20250506093340.106575-3-clamor95@gmail.com>
 <48472736-4182-4d47-9980-6d63541f6975@wanadoo.fr>
In-Reply-To: <48472736-4182-4d47-9980-6d63541f6975@wanadoo.fr>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 9 May 2025 09:04:44 +0300
X-Gm-Features: AX0GCFv_03eCqlR5fKQ8OMhAozBUTZ4dDTAVo2y7TPMRcWAJrTLnSJhD2n38a3U
Message-ID: <CAPVz0n0DF6NUBc8BfAyOS7JCwjT0yrCwYgqPyfivA0o_onQzDg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] drm: bridge: Add support for Solomon SSD2825
 RGB/DSI bridge
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com, 
 andrzej.hajda@intel.com, conor+dt@kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com, jonas@kwiboo.se, 
 krzk+dt@kernel.org, linux-kernel@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 neil.armstrong@linaro.org, rfoss@kernel.org, robh@kernel.org, simona@ffwll.ch, 
 tzimmermann@suse.de
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

=D0=B2=D1=82, 6 =D1=82=D1=80=D0=B0=D0=B2. 2025=E2=80=AF=D1=80. =D0=BE 20:49=
 Christophe JAILLET
<christophe.jaillet@wanadoo.fr> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Le 06/05/2025 =C3=A0 11:33, Svyatoslav Ryhel a =C3=A9crit :
> > SSD2825 is a cost-effective MIPI Bridge Chip solution targeting mainly
> > smartphones. It can convert 24bit RGB interface into 4-lane MIPI-DSI
> > interface to drive display modules of up to 800 x 1366, while supportin=
g
> > AMOLED, a-si LCD or LTPS panel technologies for smartphone applications=
.
>
> Hi,
>
> ...
>
> > +config DRM_SOLOMON_SSD2825
> > +     tristate "SSD2825 RGB/DSI bridge"
> > +     depends on SPI_MASTER && OF
> > +     select DRM_MIPI_DSI
> > +     select DRM_KMS_HELPER
> > +     select DRM_PANEL
> > +     help
> > +       Say Y here if you want support for the Solomon SSD2825 RGB/DSI
> > +       SPI bridge driver.
> > +
> > +       Say M here if you want to support this hardware as a module.
> > +       The module will be named "solomon-ssd2825".
>
> Is it "solomon-ssd2825" or just "ssd2825"?
>
> > +
> >   config DRM_THINE_THC63LVD1024
> >       tristate "Thine THC63LVD1024 LVDS decoder bridge"
> >       depends on OF
>
> ...
>
> > +static int ssd2825_read_raw(struct ssd2825_priv *priv, u8 cmd, u16 *da=
ta)
> > +{
> > +     struct spi_device *spi =3D priv->spi;
> > +     struct spi_message msg;
> > +     struct spi_transfer xfer[2];
> > +     u8 tx_buf[2];
> > +     u8 rx_buf[2];
> > +     int ret;
> > +
> > +     memset(&xfer, 0, sizeof(xfer));
> > +
> > +     tx_buf[1] =3D (cmd & 0xFF00) >> 8;
> > +     tx_buf[0] =3D (cmd & 0x00FF);
> > +
> > +     xfer[0].tx_buf =3D tx_buf;
> > +     xfer[0].bits_per_word =3D 9;
> > +     xfer[0].len =3D 2;
> > +
> > +     xfer[1].rx_buf =3D rx_buf;
> > +     xfer[1].bits_per_word =3D 16;
> > +     xfer[1].len =3D 2;
> > +
> > +     spi_message_init(&msg);
> > +     spi_message_add_tail(&xfer[0], &msg);
> > +     spi_message_add_tail(&xfer[1], &msg);
> > +
> > +     ret =3D spi_sync(spi, &msg);
> > +     if (ret)
> > +             dev_err(&spi->dev, "spi_sync_read failed %d\n", ret);
>
> Maybe, just spi_sync in the message?
>
> > +
> > +     *data =3D rx_buf[1] | (rx_buf[0] << 8);
> > +
> > +     return 0;
>
> Is it on purpose that ret is never returned?
> Is it safe to update *data if ret is not 0?
>
> > +}
>

Acknowledged, thank you

> ...
>
> CJ
