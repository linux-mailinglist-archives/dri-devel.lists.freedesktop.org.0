Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6824E5BD6
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 00:32:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02DE410E1B7;
	Wed, 23 Mar 2022 23:32:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5593B10E1B7
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 23:32:37 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id b130so1025244pga.13
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 16:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mnsP+tMZLvgKS0fCPnxZExSwywnKa6Ll9vIAaASFPSk=;
 b=AYHoW4kJ7A6T2evKIXisrXHC6TGRlDRhF+vNsSRxL2VTY/hY8Ug7Fhl+efep6xLlzN
 ARcN0T26G3ZfG31zwC7ILNrsnZbmVfbRSUTWzVdzzuto2c1ui2vdk6RnZjQ4AH7kcrJ6
 HC5bgupLyup/RwOY9lvzoMYpgwjahyk19jWX7e4LoLrHr+sDCZuNT5ACQ+yZiQyq5pwZ
 schnkZUXLgN5B4Vgho8PUx9upiP4KgeVN1Qj2Nfg4k4bilhCej/dWF12yhXBFDaPbUwc
 RrtOAVnvCIFPIEXZeIYNlaXoQ9FwDxb86EP74peUyyBdoEaGnGdLX1vdk4FlPBCAdpXS
 4bUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mnsP+tMZLvgKS0fCPnxZExSwywnKa6Ll9vIAaASFPSk=;
 b=4LJG260KoLau1bUTpGKAtUEPHauC+q4wtD/9JNpsLqNkLUPQ1OfcTuA4Hs+M8IbLCr
 AGpf7tFFkbxA1477jaAZppwIhNzup3FaD4G+P2BgCqGz0387jylSmActRx+kHTIDcU2C
 Zu6JfuTIC4eqxljak85JHRFXpngf6dAqH7EQjGGgwf+getXhSg8i77JHRtKxNRiBI37n
 3Eu88MNZY9uWGpZDdaA4BbD7RStNm9EcOejbD8L2VcU8CD4pSkZpy95G4kTUeGtHldax
 iC015L4m01dStAEj2ia7YepYIrMS2QQPZNc5oDjChEkc6Y9rWFwO83wBzb8+Tgue6GC9
 mZNg==
X-Gm-Message-State: AOAM531sW2iUuGDkIHkhi6fyoTNmF2QDhyfIZkLTJmZWveUJPrwAxNLt
 w8kch5TrlLqX4+CBigzcSTky8GMtwxFllh2ha2V8Pw==
X-Google-Smtp-Source: ABdhPJx6E7T4CTM2T4k2S79psVZzaBosIjiRt3v1f0YYcZ47a7wZV02fFCTFVCAyPk5n7QE9f8SGCK+DeeJXxLBN1x4=
X-Received: by 2002:a05:6a00:1307:b0:4b0:b1c:6fd9 with SMTP id
 j7-20020a056a00130700b004b00b1c6fd9mr2278035pfu.27.1648078356634; Wed, 23 Mar
 2022 16:32:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220303163654.3381470-1-jagan@amarulasolutions.com>
 <c13b6b1e-04b2-b013-7cdd-dbf960808ea5@kontron.de>
 <CAMty3ZDwp=H2qasdPxLXNo6XcmbYGcMyf3+KeOus6NDrdth9_Q@mail.gmail.com>
In-Reply-To: <CAMty3ZDwp=H2qasdPxLXNo6XcmbYGcMyf3+KeOus6NDrdth9_Q@mail.gmail.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Wed, 23 Mar 2022 16:32:24 -0700
Message-ID: <CAJ+vNU3VJXp7PL0WDL046f=gU3NMusznuMNqbbmgvnNM8Bq1Mw@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] drm: exynos: dsi: Convert drm bridge
To: Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, Sam Ravnborg <sam@ravnborg.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Robert Foss <robert.foss@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 9, 2022 at 6:01 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Hi Frieder,
>
> On Wed, Mar 9, 2022 at 6:54 PM Frieder Schrempf
> <frieder.schrempf@kontron.de> wrote:
> >
> > Hi Jagan,
> >
> > Am 03.03.22 um 17:36 schrieb Jagan Teki:
> > > Updated series about drm bridge conversion of exynos dsi.
> > >
> > > Previous version can be accessible, here [1].
> > >
> > > Patch 1: tc358764 panel_bridge API
> > >
> > > Patch 2: connector reset
> > >
> > > Patch 3: bridge attach in MIC
> > >
> > > Patch 4: panel_bridge API
> > >
> > > Patch 5: bridge conversion
> > >
> > > Patch 6: atomic functions
> > >
> > > [1] https://patchwork.amarulasolutions.com/cover/1839
> > >
> > > Any inputs?
> >
> > Thanks for your efforts. I didn't follow the whole history, but I'm
> > looking forward and hope to see upstream support for the i.MX8MM DSIM in
> > the not too distant future.
> >
> > Can you give me a short update about the state of this patchset? Are
> > there still any major obstacles?
> >
> > I can't help with testing on Exynos, but if you have the matching
> > follow-up patches for i.MX8MM support somewhere around I could do some
> > tests with those on i.MX8MM.
>
> Unfortunately, it is getting slow due to existing exynos dsi drivers.
> Idea is to push exynos and then move the bridge as per Mailing-list
> discussion. I have initial series to support i.MX8MM on linux-next [1]
> which is working on my setup. However I'm waiting for this series to
> move further to send those on the mailing list. Indeed I'm solely
> relaying on Marek testing to move further as I too don't have Exynos
> hardware to validate.
>
> [1] https://github.com/openedev/kernel/tree/imx8mm-dsi
>
> Thanks,
> Jagan.

Marek,

Have you had any time to test Jagan's latest series? There are several
of us waiting for the exynos series so as to gain support for imx8m
MIPI DSI on top of it.

What hardware is required to test this and where can it be found?

Best regards,

Tim
