Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF1474A5DB
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 23:25:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51A4210E06B;
	Thu,  6 Jul 2023 21:25:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 153F589811
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 21:25:30 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-51db8a4dc60so1228a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jul 2023 14:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1688678729; x=1691270729;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jveyGfyZnU4QZ4Tv50nsm4vX0ehG0ZXutB/fMm4ATqA=;
 b=LG1FG2Z4dz0E3iCs/Ok5I4yExx1U51TTgBhCOrEXXmox8Grv+QkinP2ikrBk4CzEHj
 qbDie08YAe6SxefoxBJg66h/vM/DNhqAUxy4T5XpjH/O4n4hiWginTOPYTErrVSIJDHF
 Y/aS5/EhGJuMpcAhZH6EOZXFKH3VZ6frlPpepZEVqr45740HdjWfREWcbbOmmQlVqIx5
 9XtQSLEbIeHxHm2Sk+GmuK+DC280dRX+UZ3hcKfLvGgknsZCq4hgow/dL0FYPeAP/mJD
 UlmlR/D6/W/SQkJ0nV82EQ7LlLNHJHTWoEd1OSzJbDPkr/Tpc91lWseoZNgsqEmRA14S
 jIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688678729; x=1691270729;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jveyGfyZnU4QZ4Tv50nsm4vX0ehG0ZXutB/fMm4ATqA=;
 b=lqTisIbxolsIaFGirE9HDn+n2+7egR20nJF43A5dwf4dcYmwas1tj3NxvgUl40o/Ph
 68eENKtp7Gt//GN+Uxa9pBhN8VCdER1pEGLhlN97j0PLORF/BKbS2CeL+Twh2nOe0Drf
 BDY17piFX1gA8fGXSuYqSzy2F/oekinHuEsIlJFcS9AoTeYEv5+v5q7nuMMSG1pu+aHw
 kkn6dVAiMrcSGKNu/iYvpPn1VuGre4TLPT+ATFC1xr0oxVFH7sBAXuofFBlVOV+zAxaH
 FawusHHh4nGEsFqKm1oXiJRqqlXjzQd6UeQHj7DfNuN6URGzU5e+K0YgAJG2YoPqdBLU
 eEAQ==
X-Gm-Message-State: ABy/qLZA4tLdWn7scGdc2huzKua8rl6aS0EViyPB04OsG4muUrOhxmKY
 m17G/nK3DGQNctTY/Tzrpy2Hi/7FSvdB5vkewIb66w==
X-Google-Smtp-Source: APBJJlHzbJ8ME0Uk9Q1RcdFhM+DvMx5GdQK1S9Q34hIjiYNqau+w5SO7xuMwn/G5bJWesXs2U4r9tBJgAHF+oXdHK60=
X-Received: by 2002:a50:c344:0:b0:506:90c4:b63b with SMTP id
 q4-20020a50c344000000b0050690c4b63bmr24265edb.4.1688678728980; Thu, 06 Jul
 2023 14:25:28 -0700 (PDT)
MIME-Version: 1.0
References: <1adda828-cf35-fb2c-6db5-f9ca91b5b62a@linaro.org>
 <20230525093151.2338370-1-yangcong5@huaqin.corp-partner.google.com>
 <20230525093151.2338370-5-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=W_Vw=WTuap60PtzU8Jc58T1PsEhJfY96NmFFgmC1DB9w@mail.gmail.com>
 <CACRpkdZkNio99zS+ttEXncOtS1TcYbfunKSKddErRDV1gTY43w@mail.gmail.com>
In-Reply-To: <CACRpkdZkNio99zS+ttEXncOtS1TcYbfunKSKddErRDV1gTY43w@mail.gmail.com>
From: Doug Anderson <dianders@google.com>
Date: Thu, 6 Jul 2023 14:25:16 -0700
Message-ID: <CAD=FV=Xx_Bf=Fr1aCmmcjXAv1CyMYwEFba7C6k_HRE1VPtTtHQ@mail.gmail.com>
Subject: Re: [v4 4/4] drm/panel: Support for Starry-ili9882t TDDI MIPI-DSI
 panel
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, hsinyi@google.com,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Jul 4, 2023 at 12:47=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Thu, Jun 1, 2023 at 5:55=E2=80=AFPM Doug Anderson <dianders@google.com=
> wrote:
> > On Thu, May 25, 2023 at 2:32=E2=80=AFAM Cong Yang
> > <yangcong5@huaqin.corp-partner.google.com> wrote:
> > >
> > > The Starry-ili9882 is a 10.51" WUXGA TFT panel. which fits in nicely =
with
> > > the existing panel-boe-tv101wum-nl6 driver. From the datasheet,MIPI n=
eed
> > > to keep the LP11 state before the lcm_reset pin is pulled high. So ad=
d
> > > lp11_before_reset flag.
> > >
> > > Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> > > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > >  .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 371 ++++++++++++++++=
++
> > >  1 file changed, 371 insertions(+)
> >
> > Applied to drm-misc-next:
> >
> > 8716a6473e6c drm/panel: Support for Starry-ili9882t TDDI MIPI-DSI panel
>
> Sorry for noticing too late and coming after the fact and complaining.
>
> We must stop using the panel-boe-tv101wum-nl6.c driver as a
> one-stop-shop for Chromium panels. The Starry panel in particular
> hardware-wise has nothing in common with the other panels in this
> driver and I'm suspicious about patch 3/4 as well.
>
> Please check my patch breaking it out to a separate driver, and
> if you could check internally if you have a datasheet for Ilitek
> ILI9882t or can use your vendor leverage to get one to improve
> on the driver (such as define the DCS commands...) that would
> be great.
>
> There are good reasons for grouping the panel drivers into
> respective display controller such as fixing bugs in one place
> and if we ever want to properly support things such as
> gamma correction it will provide the proper per-display-controller
> approach.

I mentioned in response to your patch #3 also [1], but closing the
loop here as well. The original reason several panels all ended up in
one driver was in response to Sam's feedback [2]. That was even
documented when the first of the "Chromium" panels landed in commit
93ee1a2c0f08 ("drm/panel: support for BOE and INX video mode panel").

In my mind it's really a tradeoff and I'm happy to go with whatever
consensus that others agree with. What I'm never super happy with,
though, is changing the bikeshed color too often, so I'd be really
curious to hear Sam's thoughts on the issue and whether he'd like to
see this driver broken out into a dozen drivers.

[1] https://lore.kernel.org/r/CAD=3DFV=3DXkr3Qpd8m_6Xta_2jL_ezbxsmMyarbKXTX=
L+UJLG9xNw@mail.gmail.com
[2] https://lore.kernel.org/all/YSPAseE6WD8dDRuz@ravnborg.org/
