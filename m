Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC15870B27
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 21:06:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51FA210F476;
	Mon,  4 Mar 2024 20:06:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="gLmGJ7we";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com
 [209.85.160.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AA1610F476
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 20:05:58 +0000 (UTC)
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-21fd5eb7161so2007214fac.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 12:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709582757; x=1710187557;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nxf/mA/VgPtg2OrsbLLlCUBuEWdcx/aWwnqkxYTHIhA=;
 b=gLmGJ7wewtqn3GfFuzJ6dQDuKKUNAy83+tUh8GNZR1fpdD3tlzYO/KrCCo4O6JjBLC
 k8qGbQQ1uPoAjEQ+cDWd/KARMz9mpzhWh50ymQwEathP5KYnxSjxHOk2LGh+F/xCFGIy
 Kaar5CXLnoGtO+QiTLAufFVU/K6EoV3KUPYbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709582757; x=1710187557;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nxf/mA/VgPtg2OrsbLLlCUBuEWdcx/aWwnqkxYTHIhA=;
 b=IWf0S6gx3ZbZPJfsIFi+HOdED7INANI4mkmWXEVgto3ZgV1M9Q92eYco0x0f68Tpc7
 siL48eew6TCvMImjoTxFvKsbftHSDN9i5J8ZyOm1oEJNOy9pWb6iTZZjz/Zbt4/Vlqho
 HKBVlQnVLrB6bTrDECXza7VvkrWL8zQTBSZiLHuUBx/6af7Q+pWe4Wumk7ThAunKvWkV
 1sKK5V/Vtp2JBCtPcKTz3bfCeDqEFb16jCUEtkU2oDE5jcPnjWjHXptvCXQgXBRt1mUr
 IPeDjeaMtulTiC6BH4dIYGFxP83k0kftwInGsRnliZswqjIHN9N5LLten/rjKo+UsPw7
 NH1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpMjAwJh89104krPmcrjVipUPn4QnPiWzB2Yw5BEvoq8VYVzYbXNsg32BE2TsmDy020wpujt/B4lVazaSzednvVW4X+fH9FVvltpHDq4pq
X-Gm-Message-State: AOJu0YwI+FKxozTfDKlNIl9Oe6bYEij7IVxK0txlXC1/QqNy+C4+sJ8G
 pZ6NjP5hTWhMAISps9XdweRgOJmLsg6kqifako4eQonxFa5sV5ZgoXwZiD43X7z4X1ULUBC4p54
 p1ltOSCogQNHhpwTXpPB/2YWTH7DAFPjWuxKR
X-Google-Smtp-Source: AGHT+IE97L3oTLhc1yeQSjlUUd8Y0K4I0glbVsOWyXn/G7S75Iw50C7dw0+Pn1PVvGHgaApTgYqbPPxFxk5s3UdWknY=
X-Received: by 2002:a05:6871:206:b0:21f:1f78:adc9 with SMTP id
 t6-20020a056871020600b0021f1f78adc9mr12265436oad.29.1709582757348; Mon, 04
 Mar 2024 12:05:57 -0800 (PST)
MIME-Version: 1.0
References: <20240228011133.1238439-1-hsinyi@chromium.org>
 <20240228011133.1238439-4-hsinyi@chromium.org>
 <CAD=FV=VV6fprky=v9koiVGmWcXKL3V4F2LOu7FriPbT_zT6xyA@mail.gmail.com>
In-Reply-To: <CAD=FV=VV6fprky=v9koiVGmWcXKL3V4F2LOu7FriPbT_zT6xyA@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 4 Mar 2024 12:05:31 -0800
Message-ID: <CAJMQK-gMvTVWr7b_+3+KLWCAMNQQEtoXg6qZLVset7GLRgeVqQ@mail.gmail.com>
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

I currently don't have the exact panel to verify at hand. If the
dependent code is agreed and accepted, I will send out a patch for
this panel later.


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
