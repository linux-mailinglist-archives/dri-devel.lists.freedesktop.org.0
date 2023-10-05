Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0E27BA911
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 20:28:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6917910E0E6;
	Thu,  5 Oct 2023 18:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A679810E0E6
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 18:28:23 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-6c4e38483d2so857267a34.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Oct 2023 11:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1696530503; x=1697135303;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OMcqqa1LovqwpJcoFuXPlVZW2k01ePyUDHDlcXz2dos=;
 b=nZwQhC2Ne9t8j2UlBCw5W7AH19AQ7s8UrWoPJnpY07duzvEZMwYUFYvq3eyHYRgopM
 c90OhPxEfn3Pk/g74x6MThO7znqQUCju1cjZNlIsj7lp9guRtxlhuFqZAgOqV5cLzQnk
 W9SzmV1qDIlQO1CX4M/bawOmcx/4Wo0bY7PII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696530503; x=1697135303;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OMcqqa1LovqwpJcoFuXPlVZW2k01ePyUDHDlcXz2dos=;
 b=OpsBu4m38BD9pqj6iVqVH+aaoKcbz3mRij3C7qvzqBvhPpMM5M9Fi5If8j91w1OVS3
 rZ6rcu3ZusyVgtMVSPvEqy7jUHZhUVicwyOrt2OxkAIIhQ5s9VrZ/erbRPSz3sq4OV81
 K3SbDV1sHzSK18LDcTNHnOZQ7Ct118KNKSjBfYdTCLd3IkXFE2mwKRMgJ8Y5hJ5Z91/1
 jxjZ2sF/Ktny91q/hQAmEvsJw9N8ouyhAKSTMBp4EobUTLny3TVsVLzj8IhQX7vaxzsg
 lYbp/QTLa/44ZXpd4ZfJEnX8wd9gFR2WFu6CzgFwGfPnN+0XwrPPy/u5ScIwtj4/eWKz
 lZBQ==
X-Gm-Message-State: AOJu0YzHNI/jFe8z45hsnQ0OV/gkC3ppO6vh4+XmL2wthBNG0+xr3LyH
 WP/nU2mW5l2xQZxxsPl4XupRixMLX9Z7ZTRya7VYcA==
X-Google-Smtp-Source: AGHT+IHYbHMUrTrmor7aa2xPGaR96QNF9urqFDhCGJGtucSFIieFcvATx/342Mtzc1GeLA+R4C8NjgkMA9Je+0IfIJw=
X-Received: by 2002:a9d:6e09:0:b0:6b9:ed64:1423 with SMTP id
 e9-20020a9d6e09000000b006b9ed641423mr5935370otr.2.1696530502812; Thu, 05 Oct
 2023 11:28:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230925150010.1.Iff672233861bcc4cf25a7ad0a81308adc3bda8a4@changeid>
 <b0037c9f-588b-4eb8-6415-0fe75bed264f@collabora.com>
 <CAD=FV=UWQgLLfU4X+6OUR5AWOkJKwG9J7BbKGRCgze6LTY6JNw@mail.gmail.com>
 <CAD=FV=UqG6DiAyjcLKeoUWKutepGd46Zx=8O-NWKoYC-fZEG6g@mail.gmail.com>
In-Reply-To: <CAD=FV=UqG6DiAyjcLKeoUWKutepGd46Zx=8O-NWKoYC-fZEG6g@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 5 Oct 2023 11:27:57 -0700
Message-ID: <CAJMQK-gHVRFbkBDP3Mbo8ofEPjK=ckpi+xaJvPFc_gr1ZFTfXw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Move AUX B116XW03 out of panel-edp back to
 panel-simple
To: Doug Anderson <dianders@chromium.org>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 jitao.shi@mediatek.com, Anton Bambura <jenneron@protonmail.com>,
 neil.armstrong@linaro.org, sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, quic_jesszhan@quicinc.com,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 5, 2023 at 11:11=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Tue, Sep 26, 2023 at 7:01=E2=80=AFAM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > Hi,
> >
> > On Tue, Sep 26, 2023 at 1:06=E2=80=AFAM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> > >
> > > Il 26/09/23 00:00, Douglas Anderson ha scritto:
> > > > In commit 5f04e7ce392d ("drm/panel-edp: Split eDP panels out of
> > > > panel-simple") I moved a pile of panels out of panel-simple driver
> > > > into the newly created panel-edp driver. One of those panels, howev=
er,
> > > > shouldn't have been moved.
> > > >
> > > > As is clear from commit e35e305eff0f ("drm/panel: simple: Add AUO
> > > > B116XW03 panel support"), AUX B116XW03 is an LVDS panel. It's used =
in
> > > > exynos5250-snow and exynos5420-peach-pit where it's clear that the
> > > > panel is hooked up with LVDS. Furthermore, searching for datasheets=
 I
> > > > found one that makes it clear that this panel is LVDS.
> > > >
> > > > As far as I can tell, I got confused because in commit 88d3457ceb82
> > > > ("drm/panel: auo,b116xw03: fix flash backlight when power on") Jita=
o
> > > > Shi added "DRM_MODE_CONNECTOR_eDP". That seems wrong. Looking at th=
e
> > > > downstream ChromeOS trees, it seems like some Mediatek boards are
> > > > using a panel that they call "auo,b116xw03" that's an eDP panel. Th=
e
> > > > best I can guess is that they actually have a different panel that =
has
> > > > similar timing. If so then the proper panel should be used or they
> > > > should switch to the generic "edp-panel" compatible.
> > > >
> > > > When moving this back to panel-edp, I wasn't sure what to use for
> > > > .bus_flags and .bus_format and whether to add the extra "enable" de=
lay
> > > > from commit 88d3457ceb82 ("drm/panel: auo,b116xw03: fix flash
> > > > backlight when power on"). I've added formats/flags/delays based on=
 my
> > > > (inexpert) analysis of the datasheet. These are untested.
> > > >
> > > > NOTE: if/when this is backported to stable, we might run into some
> > > > trouble. Specifically, before 474c162878ba ("arm64: dts: mt8183:
> > > > jacuzzi: Move panel under aux-bus") this panel was used by
> > > > "mt8183-kukui-jacuzzi", which assumed it was an eDP panel. I don't
> > > > know what to suggest for that other than someone making up a bogus
> > > > panel for jacuzzi that's just for the stable channel.
> > > >
> > > > Fixes: 88d3457ceb82 ("drm/panel: auo,b116xw03: fix flash backlight =
when power on")
> > > > Fixes: 5f04e7ce392d ("drm/panel-edp: Split eDP panels out of panel-=
simple")
> > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > ---
> > > > I haven't had a snow or peach-pit hooked up for debugging / testing
> > > > for years. I presume that they must be broken and hope that this fi=
xes
> > > > them.
> > >
> > > We could avoid backport breakages by avoiding to backport this to any=
 kernel
> > > that doesn't contain commit 474c162878ba ("arm64: dts: mt8183: jacuzz=
i: Move
> > > panel under aux-bus")... because creating a dummy panel to get two wr=
ongs
> > > right is definitely not ok.
> >
> > Sure, except that leaves us with ... a breakage. :-P
> >
> > Although I haven't tested it, I have a hard time believing that
> > exynos5250-snow and exynos5420-peach-pit will work properly with the
> > panel defined as an eDP panel. That means that they will be broken. If
> > someone cared to get those fixed in a stable backport then we'd be
> > stuck deciding who to break. If you have any brilliant ideas then I'm
> > all ears.
> >
> > ...then again, I presume this has been broken since commit
> > 88d3457ceb82 ("drm/panel: auo,b116xw03: fix flash backlight when power
> > on"). That was a little over 3 years ago. Maybe I'm wrong and somehow
> > things still limp along and sorta work even though the panel is
> > defined incorrectly?
>
> I dug out a exynos5250-snow out of my pile and booted postmarket OS on
> it, which was shockingly easy/pleasant (kudos to those involved!). I
> found that it was booting a kernel based on 6.1.24. Digging into
> sysfs, I found that indeed it appeared to be using the "panel-edp"
> driver, so I guess it is limping along with the wrong driver and wrong
> flags...
>
> It wasn't totally clear for me how to build a new kernel and deploy it
> for postmarket OS, so I wasn't able to confirm this change. I've CCed
> the person listed on the postmarket OS wiki though to see if they have
> any insight.
>
> In any case, it sounds as if things are working well enough on older
> OSes, so maybe we can just skip trying to do any stable backport on
> this. It still seems like we should land it, though, since the current
> state of the world seems pretty broken. Anyone willing to give a
> Reviewed-by or Acked-by tag?
>

Acked-by: Hsin-Yi Wang <hsinyi@chromium.org>

> -Doug
