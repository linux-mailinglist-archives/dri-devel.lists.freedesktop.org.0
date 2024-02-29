Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D83186BDD8
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 02:05:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9053D10E0A4;
	Thu, 29 Feb 2024 01:04:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="dR8Fwy0b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4BF10E0A4
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 01:04:57 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 46e09a7af769-6e48153c13aso169991a34.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 17:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709168696; x=1709773496;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R+B/QFkmhGVByeQP+/pLiaj4NFRJ5VlaaL5Kc+sknpU=;
 b=dR8Fwy0bgNfaBlMeE9gk467+FI9nZ8c6Q4LyPxyqzbayM6yMnNmSYYah6PVhVc5BZr
 1Yh7FH+KjweXAjXsJZdkk6+zWOtmvlIOTYs5cN3BA9ixRNAbzB29UjBB66i9KkNs4KaM
 ab/hrwL/DWcY9GHd8U4dIppt6QQ+aDvw3/d6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709168696; x=1709773496;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R+B/QFkmhGVByeQP+/pLiaj4NFRJ5VlaaL5Kc+sknpU=;
 b=MynIy+ALz4yJuRDz46qNnnS9oK+KntF9k2O82SB5eZqmmD8C4FAW3RktRMWP1VDc3l
 Uu/lO/xB4kk5FkxpbHCgna3YfmrhaOuz8ApKUjmuTc1GUZzE+0ox5ePQEvMS7PdsICMt
 dQ/mVCGmNHLb3WHOpQYywsl8x5r161Y9Q2It1Rla0ovs5p3xOeN0wvxouwnSBuZFKKLC
 QNmYBda2y2EJqXvvqnr766j8/pOsuHgBJf0iUYxr+5Z1Q5MHH3PzBel/05BzT+4Lv7vO
 GZ0grkQIpKG6HU7HgmUB3ZuIE8+Mw69kCKeO0gIXMnPZRFT4Rvhkq50L+7fGST96uixJ
 3CCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUy7AOYGKOVcr6uq43mlmSESwvASV3t9xI4Rr97uBt9LxRZ+WsAt1X/i/EwCje5AbYEL0e3w/TiGAV54cPkC7NVEaQ03Xe+x5qOFxO5Q8Fr
X-Gm-Message-State: AOJu0Yye6cL2F0w0yysWHXKtBHyM05vAAgBeU7+SlmL/CM0wqGwMeZ2l
 DeOtE7WvUfrhO8sGHwM4zQfQNbGhGkPeamElWNvhXGDUfGrJ1E27sXm86sIj+oFMDPh7n87w248
 E7W9Uya94y/1piwoTLINffmPRNh7INZjMEmyFgkwClFTSjV4=
X-Google-Smtp-Source: AGHT+IFhWTqT6PtD4JEMKkFFd3nv0wlgYavQr4yUhVPVv9OfdNYWexXhMXSXQcwUC632H3U5Qtfim6FlE06VQO+AHt0=
X-Received: by 2002:a05:6830:2013:b0:6e4:8d2d:64e5 with SMTP id
 e19-20020a056830201300b006e48d2d64e5mr578147otp.13.1709168696649; Wed, 28 Feb
 2024 17:04:56 -0800 (PST)
MIME-Version: 1.0
References: <20240228011133.1238439-1-hsinyi@chromium.org>
 <20240228011133.1238439-4-hsinyi@chromium.org>
 <CAD=FV=VV6fprky=v9koiVGmWcXKL3V4F2LOu7FriPbT_zT6xyA@mail.gmail.com>
In-Reply-To: <CAD=FV=VV6fprky=v9koiVGmWcXKL3V4F2LOu7FriPbT_zT6xyA@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 28 Feb 2024 17:04:31 -0800
Message-ID: <CAJMQK-gmWHXNmxk4fWM0DEDN0kdUxVJF_D8pU_8CYCpBnd3-Ag@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/panel: panel-edp: Fix AUO 0x405c panel naming
 and add a variant
To: Doug Anderson <dianders@chromium.org>
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

On Wed, Feb 28, 2024 at 4:22=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Tue, Feb 27, 2024 at 5:11=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org=
> wrote:
> >
> > There are 2 different AUO panels using the same panel id. One of the
> > variants requires using overridden modes to resolve glitching issue as
> > described in commit 70e0d5550f5c ("drm/panel-edp: Add auo_b116xa3_mode"=
).
> > Other variants should use the modes parsed from EDID.
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> > v2: new
> > ---
> >  drivers/gpu/drm/panel/panel-edp.c | 17 ++++++++++++++++-
> >  1 file changed, 16 insertions(+), 1 deletion(-)
>
> The previous version of this patch that we reverted also had an
> override for AUO 0x615c. Is that one no longer needed?
>
>
> > @@ -1990,7 +2003,9 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
> >         EDP_PANEL_ENTRY('A', 'U', 'O', 0x239b, &delay_200_500_e50, "B11=
6XAN06.1"),
> >         EDP_PANEL_ENTRY('A', 'U', 'O', 0x255c, &delay_200_500_e50, "B11=
6XTN02.5"),
> >         EDP_PANEL_ENTRY('A', 'U', 'O', 0x403d, &delay_200_500_e50, "B14=
0HAN04.0"),
> > -       EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B=
116XAK01.0"),
> > +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B=
116XAN04.0 "),
> > +       EDP_PANEL_ENTRY2('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "=
B116XAK01.0 ",
> > +                        &auo_b116xa3_mode),
>
> The name string now has a space at the end of it. I _guess_ that's OK.
> Hmmm, but I guess you should update the kernel doc for "struct
> edp_panel_entry". The name field is described as "Name of this panel
> (for printing to logs)". Now it should include that it's also used for
> matching EDIDs in some cases too.

The space here is because in the EDID, there is space at the end,
before 0x0a (\n).
Okay I will update the kernel doc to mention that the same should be
exactly the same as the panel name.
