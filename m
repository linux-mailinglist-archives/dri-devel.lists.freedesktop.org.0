Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 133AAA1ADEE
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 01:30:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7897010E08D;
	Fri, 24 Jan 2025 00:30:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="j/Vjoa92";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B98510E08D
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 00:30:34 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-53e389d8dc7so1723801e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 16:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1737678631; x=1738283431;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jwUdhzUcT/+g0Yt1m9YM5C5e54+Sg1OVGx+QoUxel7Y=;
 b=j/Vjoa92gxeqOIO+LqFNo92UyLWYRTe2FtjhQfpA4DezJSVV7U+rh2jeBgZ5elNQCh
 GB3gFXtcF9nx3oPDhl7jtsLwiGnlbrj0Ps5pSN+4YUDepie1HI8lWKMKSSZrZnlrEbAf
 aPlSjlyesAxguPmgDJOp5+q7rt8RDP2GFIbHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737678631; x=1738283431;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jwUdhzUcT/+g0Yt1m9YM5C5e54+Sg1OVGx+QoUxel7Y=;
 b=cFUVGJnfkvMJP5+J1Vzi+SeOSbrt5M/8h96bmmzf2xRFVtYcX7yJGpMM5ENBC2bTP4
 pTKLElDJ4/TfROHd2JjzKdnWqxSOuLk+ZYrZoJ/DM/Lh80K7fRDASwGZHCfvA87aljh9
 SXy9ehPc+Gpk75KEd0OBFY02Il6m1Np0Z3stuZJdf4Pq+9I849TdZyO6wBrGXCBn7/53
 xiI3pygld1/Nf/4Z2r+qNpdh6RdS/gVjuDdOoIZbq+HLXQPMufxSeGni6K3XbNnF9rKU
 FYFp9K0AYy+KJCj9bnc6eYmBjrlNQ8+YfaEn75epdw+h+2xyK+l/P4Pw2ffJ6DWgPbnf
 N2Jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqPVKPTm9OskT6CgjVVFETDcgoBONN6zNnwNyII2aGM7Qinb3r7bLdTVhJWCw84xikPyI8oNoOGUk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjiVAkQGFNIfz/R+2y8Wggvoyj8G4pV32FYpIudoNc2hXawHxN
 q61YSo/TbBPSVdn++orlrXVE7mJ9cBX3ePQETPoNj56t/PT7YjWNqDCn6SZQ5w4O82c4f6OMw1l
 Fb+1w
X-Gm-Gg: ASbGncuDiAzb87RFozY7hCW8+wy7Hsv/0Bf77GI+XeuTgm27EncVfibeIC25Ixw8UE2
 bnnC8a54YCpHO2GKlx43XTJTuqft2JPXigeSAztqfc6roO2pQ2So0Y3SqRS43nN1u1qwVMEbBLW
 Gjj4HVvk8ylIERHki8687DaeD14kjqTJPd+isvM5+kWnW1yRJNQKQcdv59RZ+nbXdTQqtA1Xu1+
 PGh4m1USN7tUX4pbSZpAJ2PqN7ug6gXyZZgMbBzo5+7qCoDSI1etZoLcVs9ociE1UoDLpIopUNg
 pFI3dIP1aZF7xRwc+DOjvxcgNksBGsr1BySgJPj641kiAjMCQUYX7Xy1+9E=
X-Google-Smtp-Source: AGHT+IGeQKp/VOwGCRyLSZUve/Pi3XOp9SomVnVG6xDUBvLXccVpd7nSlpN5kDubaJpV6PZTkDideA==
X-Received: by 2002:a05:6512:1154:b0:540:17ac:b379 with SMTP id
 2adb3069b0e04-5439c241580mr8113128e87.25.1737678630819; 
 Thu, 23 Jan 2025 16:30:30 -0800 (PST)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com.
 [209.85.208.181]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c8368362sm95371e87.124.2025.01.23.16.30.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2025 16:30:29 -0800 (PST)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-30227c56b11so13683231fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 16:30:29 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXZZxOyyp8pzZGkTULlhc0yAInprMkaVHFenP96WAmvMmIFZPadlRa4zgGGkxkqwlKnzKxvNbYs+mY=@lists.freedesktop.org
X-Received: by 2002:a05:651c:1309:b0:300:3a15:8f0d with SMTP id
 38308e7fff4ca-3072cb284e5mr99531441fa.34.1737678628894; Thu, 23 Jan 2025
 16:30:28 -0800 (PST)
MIME-Version: 1.0
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
 <20250123100747.1841357-13-damon.ding@rock-chips.com>
 <rwn3g7tqgjnc525cjqtivgfgedhooiayn5nujng7bdzazgqhle@wfpuvoyr2tii>
In-Reply-To: <rwn3g7tqgjnc525cjqtivgfgedhooiayn5nujng7bdzazgqhle@wfpuvoyr2tii>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 23 Jan 2025 16:30:17 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WKsA9fcq-LzGcYmgbMuMLUp5SMggpzBzZnvd3sxGf9BQ@mail.gmail.com>
X-Gm-Features: AWEUYZmXU1D9ya-D7zW5B92vNI1k79fpY-WVkms-sf4EzP7id3527uV9rKgvOPs
Message-ID: <CAD=FV=WKsA9fcq-LzGcYmgbMuMLUp5SMggpzBzZnvd3sxGf9BQ@mail.gmail.com>
Subject: Re: [PATCH v6 12/14] drm/edp-panel: Add LG Display panel model
 LP079QX1-SP0V
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Damon Ding <damon.ding@rock-chips.com>, heiko@sntech.de, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org,
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com, 
 l.stach@pengutronix.de, andy.yan@rock-chips.com, hjc@rock-chips.com, 
 algea.cao@rock-chips.com, kever.yang@rock-chips.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
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

Hi,

On Thu, Jan 23, 2025 at 3:31=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, Jan 23, 2025 at 06:07:45PM +0800, Damon Ding wrote:
> > The raw edid for LP079QX1-SP0V panel model is:
> >
> > 00 ff ff ff ff ff ff 00 16 83 00 00 00 00 00 00
> > 04 17 01 00 a5 10 0c 78 06 ef 05 a3 54 4c 99 26
> > 0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> > 01 01 01 01 01 01 ea 4e 00 4c 60 00 14 80 0c 10
> > 84 00 78 a0 00 00 00 18 00 00 00 10 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 00 00 00 00 fe 00 4c
> > 50 30 37 39 51 58 31 2d 53 50 30 56 00 00 00 fc
> > 00 43 6f 6c 6f 72 20 4c 43 44 0a 20 20 20 00 3f
> >
> > Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> > ---
> >  drivers/gpu/drm/panel/panel-edp.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
>
> Please use get_maintainers.pl when compiling To/Cc lists. Added Douglas
> to CC manually.
>
> Or, better, split irrelevant patches to separate series.
>
> >
> > diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/=
panel-edp.c
> > index f8511fe5fb0d..77e3fd3ed160 100644
> > --- a/drivers/gpu/drm/panel/panel-edp.c
> > +++ b/drivers/gpu/drm/panel/panel-edp.c
> > @@ -1808,6 +1808,12 @@ static const struct panel_delay delay_200_150_e5=
0 =3D {
> >       .enable =3D 50,
> >  };
> >
> > +static const struct panel_delay delay_50_500_e200 =3D {
> > +     .hpd_absent =3D 50,
> > +     .unprepare =3D 500,
> > +     .enable =3D 200,
> > +};

Wow, hpd_absent is 50ms. That's excellent!

I was curious if this was really correct since it's the lowest I've
seen, but I searched the internet and found a datasheet that confirms
it. Crazy. Although my datasheet has that whole section grayed out and
says "Measurement not available". How worried should be about that? I
guess if "hpd_absent" of 50 eventually doesn't work it can always be
increased.

Looking at that datasheet (assuming you can find the same one), I
wonder how you handle the T4 120ms requirement. It looks like that's
the time from tcon reset (which is nearly power on) until you're
allowed to put valid data on the panel. I _think_ you could meet the
requirement via setting `powered_on_to_enable` to 320 though, right?
...or maybe 335 to handle the maximum value of "tcon_reset" (no idea
how you control this signal). If I remember correctly (it's been a
while), things will already be clocking but outputting black when the
panel's "enable" function is called. After the function is called then
we'll turn on the backlight (and still outputting black) and
eventually we'll put valid data. So as long as you consider the
continued output of black as "valid data" then the timing diagram is
satisfied.

BTW: don't you also need a 200 ms "disable"?


> >  #define EDP_PANEL_ENTRY(vend_chr_0, vend_chr_1, vend_chr_2, product_id=
, _delay, _name) \
> >  { \
> >       .ident =3D { \
> > @@ -1955,6 +1961,8 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
> >       EDP_PANEL_ENTRY('C', 'S', 'W', 0x1100, &delay_200_500_e80_d50, "M=
NB601LS1-1"),
> >       EDP_PANEL_ENTRY('C', 'S', 'W', 0x1104, &delay_200_500_e50, "MNB60=
1LS1-4"),
> >
> > +     EDP_PANEL_ENTRY('E', 'T', 'C', 0x0000, &delay_50_500_e200, "LP079=
QX1-SP0V"),

I don't love that the ID is 0x0000. That makes me nervous that the
panel vendor isn't setting the ID properly. ...but at least the string
matches in the EDID so hopefully that will be enough to uniquely
identify things.
