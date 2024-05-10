Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8656F8C2C06
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 23:44:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 163FE10E1BB;
	Fri, 10 May 2024 21:43:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J6qoTgsu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EB4A10E1BB
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 21:43:58 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-5e42b4bbfa4so1469916a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 14:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715377437; x=1715982237; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rbj0m2f2QYfPFhMHqFk4yDca0m9jJq1tkTFZyZAwwvE=;
 b=J6qoTgsuGkcEZI4bUDJ/q/A91gOwWmLNVttlVI7GEWCK+isXJZ0EGlLczEtAFVGb/Q
 HjwBwwSZm8s27SBVbjvmTkcj3uDFxWUk+M4TZiYOGMQlFAsVXalcWBaPHgUUUFDrZu41
 VJ/js/c2m8ADE+WD+/r1p12V21inF8G7etRQCdrGo7+FHYFJBL8v45haFhmXkU7iyt41
 CuTZWVvbi7s2wsmcsOcDulYzVnK85cDxGUHpXuCfLREdioP7zym/xYeS0BD1ws4ZwSEp
 4+pS1uejb9dY5kTAFxCySnytMKCRNe9d4mAoRfQLf0HV/KqYklcNlykY+Bv2T/SH9Lwv
 P/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715377437; x=1715982237;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rbj0m2f2QYfPFhMHqFk4yDca0m9jJq1tkTFZyZAwwvE=;
 b=nnP3Y01455O1koaVRp7z01qBVdxarGW3jFAKWQ6VQeMDr7hCNbB+bErZ72pj5dU8cg
 XYnNlml8y29bXhFLMov3GLNbKMcBXEgHevmkYhVHgX3ylW2XCGYvl433NOr8+WysJP+S
 qb/DhZ+SB1Y490ok5+ebERQ2lQvEjFLFx0csJZ/x7cWSPVxKJtxLvbuS6M8KVkq7Hsbw
 RQ0OmgNSxOHqt5i7HPWFaSkISYGEK43lI3E25w6nzyq7cJvfCBSQ8uMRkvTyoNVm0QMs
 DPW0aFvsUhP30BCQuTzAaTewUhw8COcmPEZM7SSyD/Weqg4MLxzkEXF8p2pW3aeI6M/D
 ym4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQ7lA4RRyAMV1p/OzUeY5xJ8eXbux7HPu2aih+PAZrnszmT28fYWNQEtjt/g55Acxu7cEFj1V9GTgnoLPxEWHkRJLTmtwIMESgbVFfgrDq
X-Gm-Message-State: AOJu0YzOxARbbxVZybYNjmsyViP1zfVEw/CzeaxCscMr61tG9NprIFQm
 pp+JSfZcZMdE7Omz88VWtUHlvx+3xeHzw7oTFkcGP0fvE7Mc3zGtTtFh0bNLUj49kDaLTMw6qYf
 IIv87+ZaBlPdTbHa8Z3ZZ+cmNJ1iQ5WOBLs0=
X-Google-Smtp-Source: AGHT+IFfVrozGM2vaadK9UrpFrP98qUXh8WZsCiQVseBOTtYFa9DnTxKekjuHfLQLMXqDnFeT0efYO/0Pnjwmn0R8Zg=
X-Received: by 2002:a05:6300:808c:b0:1af:af86:ce44 with SMTP id
 adf61e73a8af0-1afde1b7259mr4352990637.40.1715377437527; Fri, 10 May 2024
 14:43:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240509-jdi-use-disable-v1-1-5c175b2ea1ee@gmail.com>
 <rpita5o6za64p7tamasssb2fja6h6ipr5cibh6gs7klkijyk6r@mausrcet2ycx>
 <CAGsSOWWAotJPz+o8HSYTrXtq6H7Vrw9KXZX1jDZLgqfudKsnyg@mail.gmail.com>
 <CAGsSOWX9YcuBpxQZ5kPm6zbMbM6iZqPK3bk=dgKyUZPjq++GXQ@mail.gmail.com>
 <kjlcqkfipct4d54hrtmwdsrifxvuq3qocv5bcmwsufrbxtvvq2@52grw5ijqx4k>
In-Reply-To: <kjlcqkfipct4d54hrtmwdsrifxvuq3qocv5bcmwsufrbxtvvq2@52grw5ijqx4k>
From: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>
Date: Fri, 10 May 2024 23:43:46 +0200
Message-ID: <CAGsSOWU=NopJmDK09vLFXa1Riq=8-Rn=U3ZsXqE-8vnL28nTkA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: jdi-fhd-r63452: move DCS off commands to
 disable
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Fri, May 10, 2024 at 8:02=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Fri, May 10, 2024 at 09:10:34AM +0200, Barnab=C3=A1s Cz=C3=A9m=C3=A1n =
wrote:
> > On Fri, May 10, 2024 at 8:46=E2=80=AFAM Barnab=C3=A1s Cz=C3=A9m=C3=A1n =
<trabarni@gmail.com> wrote:
> > >
> > > On Fri, May 10, 2024 at 2:56=E2=80=AFAM Dmitry Baryshkov
> > > <dmitry.baryshkov@linaro.org> wrote:
> > > >
> > > > On Thu, May 09, 2024 at 08:14:07PM +0200, Barnab=C3=A1s Cz=C3=A9m=
=C3=A1n wrote:
> > > > > Move DCS off commands from .unprepare to .disable so that they
> > > > > actually reach the DSI host.
> > > > >
> > > > > Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <trabarni@gmail.com=
>
> > > > > ---
> > > > >  drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c | 12 ++++++++++--
> > > > >  1 file changed, 10 insertions(+), 2 deletions(-)
> > > >
> > > > I don't think this is correct. If the driver sends enable commands =
in
> > > > prepare, it should be able to send commands during unprepare too.
> > > >
> > > It cannot send commands in unprepare, there are multiple panel driver=
s
> > > what do the same.
> > > Every panel drivers which have DCS commands to be sent in unprepare
> > > has similar error messages with mdp5/dpu.
> > >
> > > [   92.322564] panel-td4320-boeplus c994000.dsi.0: sending command
> > > 0x28 failed: -22
> > > [   92.322635] panel-td4320-boeplus c994000.dsi.0: Failed to
> > > un-initialize panel: -22
> > >
> > >
> > Here is the error messages, these are comes from unprepare by every pan=
el off:
> > [  121.295290] panel-jdi-fhd-r63452 994000.dsi.0: transmit data failed:=
 -22
> > [  121.295368] panel-jdi-fhd-r63452 994000.dsi.0: Failed to
> > un-initialize panel: -22
> > [  184.783019] panel-jdi-fhd-r63452 994000.dsi.0: transmit data failed:=
 -22
> > [  184.783066] panel-jdi-fhd-r63452 994000.dsi.0: Failed to
> > un-initialize panel: -22
> > with this patch these errors no more.
> > .prepare works because of this flag ctx->panel.prepare_prev_first =3D t=
rue;
>
> The flag should also invert the order of post_disable chain. It well
> might be that the drm/msm/dsi driver shuts down the DSI link too soon.
> Please consider fixing the MSM DSI driver instead.
>
Ok, thank you i look forward to it.
> --
> With best wishes
> Dmitry
