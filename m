Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DD584FF0A
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 22:41:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 945BD10FE59;
	Fri,  9 Feb 2024 21:40:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fZLwruDr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D012B10FE59
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Feb 2024 21:40:56 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-42c1eb66355so10639601cf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Feb 2024 13:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707514856; x=1708119656; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BqC1tw6gJDNWLw++JYXcXya8hdc/7v97fM9sZ3v3p5Y=;
 b=fZLwruDr68chILZDyWgqKBA1mLWDI1csbvGwcI+lxKUR4YC138BqRS27Z4Z+S27vyp
 pmtmBMGN8sq6/3Sq3lMBDJFfDqilKpqo6RhXgMgsbDxvqVC2W6O2OlySnElmNCHUNSby
 OoPGRkjYRFLwers4geCgU/LjGRV8I3k3K93ccS/1ioSPT1Pf0SrL40+RN51m3TwCq9uT
 g+1R2Jp7ao/VvtH06mt/Ya+CypFLcMs0zxV96i4HJymfmm54zrJZUGOVyKGQtjS+emRV
 yOkXyA6ehQkJY3ztCvOXe/Vp/9J2878NsZ5TjhKUn4Qb9NR0hX3w7ak+Aq5Y2aNW1lV6
 0/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707514856; x=1708119656;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BqC1tw6gJDNWLw++JYXcXya8hdc/7v97fM9sZ3v3p5Y=;
 b=ubjopavkaFBgr9WfUT5T08Q+eEsZBxLVm9NvrlBoTb4uEbX6GiQYGRfXkCNStit3Gm
 pgnqYxy/JDeZB62QDCvJjwEXzZfN9Gym8xsb1IIJLdeM+Z4/jLSyRz7g6tV6DmHvZ2SZ
 nYAsrGPIbM7+VgPXU47JhtakEHgKGYzwCSotIvNmVErqYah2h+0JLFT8E6/RuAu3LUSJ
 Ym6EmQiRcSSF2lxaCkxTeb19uP6mwuL0aY1Ke4KuJ6x7rwuZvfYorhMLXvDNQhNA8xO9
 OHgADkwpaBQQZ2mHEt0U+26XKzFOXO5BZmmF9iylqiBn4zDDhD2wI8yKOgjPfPa8WLrM
 zNDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQmLjgJPer7+iQDz1oZYXbPPA2lDft9aK//hFeRTF5QyDwQQ5l0WSXZBv7gIXL8h8+ZVTVsyk7hVKwq8hMm9olFhdcwpCaIhF6Q4eLmRuo
X-Gm-Message-State: AOJu0YyPxRaJ4C2Fi8mVJVE7ZkW7gJlCqv+mbWrnIjypza+UPo3g7ZtE
 5Hhzlql28P1m4cnRjyAtkvOiBqa8TWgy89vPoAm/y6qk8Iptx80359C+50rrL/Cf5wDnB/seRVb
 ZnPVW472hHKO9d8nYzeIIsQSwuRM=
X-Google-Smtp-Source: AGHT+IF5gvtKEtRbqMFT9DtsloNuoM8rox9dN8vjMOCr6g51IQqmnopiz5gTtRjAEx6EidNNXKqiwRfaZ5aGa5orlw4=
X-Received: by 2002:a0c:e3c9:0:b0:68c:a4b8:3692 with SMTP id
 e9-20020a0ce3c9000000b0068ca4b83692mr428002qvl.56.1707514855651; Fri, 09 Feb
 2024 13:40:55 -0800 (PST)
MIME-Version: 1.0
References: <20240128021048.6059-1-hacc1225@gmail.com>
 <20240128021048.6059-2-hacc1225@gmail.com>
 <ZcX5ljSCc7nyr_NE@qwark.sigxcpu.org>
 <DM4PR05MB92294706259FB96A7A899C30A54B2@DM4PR05MB9229.namprd05.prod.outlook.com>
In-Reply-To: <DM4PR05MB92294706259FB96A7A899C30A54B2@DM4PR05MB9229.namprd05.prod.outlook.com>
From: Ao Zhong <hacc1225@gmail.com>
Date: Fri, 9 Feb 2024 22:40:44 +0100
Message-ID: <CAG9e_p28w1vzR_Z3W-F8N4+W5MkQ75msr9UK1n-0MOiK=rgsWg@mail.gmail.com>
Subject: Re: [PATCH RESEND 1/1] drm/panel: st7703: Fix Panel Initialization
 for Anbernic RG353V-V2
To: Chris Morgan <macromorgan@hotmail.com>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Cc: Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>, 
 dri-devel <dri-devel@lists.freedesktop.org>
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

Hello Chris Morgan, Guido G=C3=BCnther,

I will post a v2 patch. I will supplement the commit information and
attach the reference links I used when modifying the init sequence.

Ao Zhong

Am Fr., 9. Feb. 2024 um 22:35 Uhr schrieb Chris Morgan
<macromorgan@hotmail.com>:
>
> On Fri, Feb 09, 2024 at 11:08:22AM +0100, Guido G=C3=BCnther wrote:
> > Hi Ao,
> >
> > this doesn't say why that was changed but your cover letter
> > has that information:
> >
> > > After correcting these parameters by referencing the
> > > device tree in JELOS (which uses the BSP kernel for RK3566), the pane=
l
> > > started to work properly.
> >
> > Can you add that to the commit message and maybe add an URL as
> > reference please?
> >
> > I've added Chris to the cc: list. He submitted the original rg353v2
> > and we don't want to break other devices. Chris, do you have any means
> > to check these values?
>
> I checked. I'm not sure exactly how but when I fired up the most recent
> kernel this panel appeared to have problems with the init sequence as
> defined. After making the changes from this patch series it seems to be
> back to normal. So these changes appear to be needed for existing
> devices, and I'm not sure what could have caused the regression...
>
> Note the previous settings did still appear to work, the panel just
> took much longer to start working after the init sequence (as much
> as 20 seconds on cold boot, clearly indicating a problem).
>
> Thank you for the fix!
>
> Tested-by: Chris Morgan <macromorgan@hotmail.com>
>
> >
> > Cheers,
> >  -- Guido
> >
> > On Sun, Jan 28, 2024 at 03:10:48AM +0100, Ao Zhong wrote:
> > > This patch resolves the issue with the panel initialization of the
> > > Anbernic RG353V-V2 caused by incorrect parameters.
> > >
> > > Signed-off-by: Ao Zhong <hacc1225@gmail.com>
> > > ---
> > >  drivers/gpu/drm/panel/panel-sitronix-st7703.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/=
gpu/drm/panel/panel-sitronix-st7703.c
> > > index b55bafd1a8be..a346d6c3d283 100644
> > > --- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> > > +++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> > > @@ -357,8 +357,8 @@ static int rg353v2_init_sequence(struct st7703 *c=
tx)
> > >                            0x28, 0x03, 0xff, 0x00, 0x00, 0x00, 0x00);
> > >     mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETCYC, 0x80);
> > >     mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETBGP, 0x0a, 0x0a);
> > > -   mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETVCOM, 0x92, 0x92);
> > > -   mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETPOWER_EXT, 0x25, 0x22,
> > > +   mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETVCOM, 0x7f, 0x7f);
> > > +   mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETPOWER_EXT, 0x26, 0x62,
> > >                            0xf0, 0x63);
> > >     mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETMIPI, 0x33, 0x81, 0x05,
> > >                            0xf9, 0x0e, 0x0e, 0x20, 0x00, 0x00, 0x00, =
0x00,
> > > --
> > > 2.43.0
> > >
