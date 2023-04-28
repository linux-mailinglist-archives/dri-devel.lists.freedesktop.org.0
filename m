Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A1B6F1A3E
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 16:10:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E9D10E147;
	Fri, 28 Apr 2023 14:09:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A409610E147
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 14:09:56 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-246fd87a124so27155a91.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 07:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682690996; x=1685282996;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p2b78iqTC7OToTOHQ6fHrEeDrWrCuNdZPNAb0fZD55U=;
 b=ZLkCHgrXybRzPv+DwSbafrfSNV39zdsVZBmrPykFn1NLr65U7rjnAkOXL8Fx2Jwat5
 DB+pVf5II54c4Gh9Zyj0uJ1V6NL14c08jj7TRJMdmg3g97eOvc2rWHBC3HzSTD1nXDBx
 MIRZ82u6JAEJzkuTRreiOBby//730kfRhqsCn6fng4ZLdqI58KGiJPjVn0p+2fiX35Aw
 nGy9W9/ffg1vzPYUW26EiIWFwZ3NdFPxjZHMH0vuj9dnPaoWB1Zz1wSE2Z6o5dBiIHsu
 FMcMoBNiMbUFoTITXmsH0gT/4i9fv4iwjlKSKDekjY45MN6Zo2MBeBvdYqmmNaA0kUWf
 XWZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682690996; x=1685282996;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p2b78iqTC7OToTOHQ6fHrEeDrWrCuNdZPNAb0fZD55U=;
 b=SkWgrX+Wq6U6n6CtGYjGUvjRG6e9Ct6hq84x/2R/PyohTTf0qfY6dn96udDs3RjQ6Y
 6ZGuq53eYOeubOX1t9BwoD2S36OGtkxfWbzGCzdSWrEt8hUVd8RZQR3fJGSfqZBMItgk
 Ezw7vdO0sq+sKVEcGvjqkRSPpzWhMFPCZfoqT1kcliVts/DCfI7CfZdWAp6fKcInWv0S
 P/ZbYLKCkK3Umnl4q3ie4PWNkzhebRB2EsBMEkf+Pb4mOK8+oC6kTTJy8hPFo+/Y+WOd
 8e6y9UjbYc4ZmzPtys2kYvZ2uaYpvCkrxyms61yhlMJ5/AYOEj77oSGOh4UKiWcvt00e
 xScQ==
X-Gm-Message-State: AC+VfDwd3/ZpMe0IZntQEwrp66Y3Z0AhOVZbFNj2OFJLM4ifb44MF6xS
 WnUSWyVBqVivdZ5/SPt+U7wjYqQnXyEiocp4d9I=
X-Google-Smtp-Source: ACHHUZ5AEt7w1BySwRThXroxDTX4QU1RNchIAB/DIvq3N/HIBZ2/uQDtKAhJKESIEP3SitEDbDdQb5t3yok7tYSQIKw=
X-Received: by 2002:a17:90a:bc8d:b0:246:a782:d94 with SMTP id
 x13-20020a17090abc8d00b00246a7820d94mr5992258pjr.7.1682690995638; Fri, 28 Apr
 2023 07:09:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230423121232.1345909-1-aford173@gmail.com>
 <CGME20230423121305eucas1p287a952d41b1884b117fa15a748b9e1a2@eucas1p2.samsung.com>
 <20230423121232.1345909-6-aford173@gmail.com>
 <b6b53da5-6986-a958-ef84-650b3a57ad9c@samsung.com>
 <CAHCN7x+vd-bP8NgS-cRrnm8ojq0kwUg6aXokJv6xSU7BrT04Vw@mail.gmail.com>
 <343f8d25-566f-9d14-64db-4e796cc9e406@samsung.com>
 <CAHCN7x+QU29Wv9TQEANhbxLcL4jCZUKbk+uGu2sOwhCcTt798A@mail.gmail.com>
 <46429c9b-cf14-a67e-81a8-b56be0350ea3@samsung.com>
In-Reply-To: <46429c9b-cf14-a67e-81a8-b56be0350ea3@samsung.com>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 28 Apr 2023 09:09:44 -0500
Message-ID: <CAHCN7xKcHELG3n8+f4pjj05NCFUhBfz0_q_huN9bP65Fv6Ombg@mail.gmail.com>
Subject: Re: [PATCH V2 5/6] drm: bridge: samsung-dsim: Support non-burst mode
To: Marek Szyprowski <m.szyprowski@samsung.com>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, aford@beaconembedded.com,
 dri-devel@lists.freedesktop.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dario.binacchi@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 28, 2023 at 9:04=E2=80=AFAM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> On 28.04.2023 15:35, Adam Ford wrote:
> > On Fri, Apr 28, 2023 at 7:31=E2=80=AFAM Marek Szyprowski
> > <m.szyprowski@samsung.com> wrote:
> >> On 24.04.2023 12:00, Adam Ford wrote:
> >>> On Mon, Apr 24, 2023 at 3:25=E2=80=AFAM Marek Szyprowski
> >>> <m.szyprowski@samsung.com> wrote:
> >>>> On 23.04.2023 14:12, Adam Ford wrote:
> >>>>> The high-speed clock is hard-coded to the burst-clock
> >>>>> frequency specified in the device tree.  However, when
> >>>>> using devices like certain bridge chips without burst mode
> >>>>> and varying resolutions and refresh rates, it may be
> >>>>> necessary to set the high-speed clock dynamically based
> >>>>> on the desired pixel clock for the connected device.
> >>>>>
> >>>>> This also removes the need to set a clock speed from
> >>>>> the device tree for non-burst mode operation, since the
> >>>>> pixel clock rate is the rate requested from the attached
> >>>>> device like an HDMI bridge chip.  This should have no
> >>>>> impact for people using burst-mode and setting the burst
> >>>>> clock rate is still required for those users.
> >>>>>
> >>>>> Signed-off-by: Adam Ford <aford173@gmail.com>
> >>>> This one breaks Exynos-5433 based TM2e board with a DSI panel.
> >>> Marek S,
> >>>
> >>> Thank you for testing!  I knoiw there are several of us who appreciat=
e
> >>> your testing this since it's hard to know if something broke without
> >>> hardware.  Is there any way you can tell me if the flag is set to
> >>> enable MIPI_DSI_MODE_VIDEO_BURST?
> >> TM2e board uses the DSI panel operated in command mode and handled by
> >> panel-samsung-s6e3ha2.c driver. The MIPI_DSI_MODE_VIDEO_BURST flag is
> >> not set by the driver. However, the MIPI_DSI_CLOCK_NON_CONTINUOUS flag=
s
> >> is set there. I really have no idea if setting VIDEO_BURST would make
> >> sense together with CLOCK_NON_CONTINUOUS or not. Maybe the driver lack=
s
> >> setting it?
> >>
> >>
> >>> I was trying to be diligent about not breaking your boards, but
> >>> without your boards, it's difficult.  The theory was that if
> >>> MIPI_DSI_MODE_VIDEO_BURST is set and there is a burst clock set in th=
e
> >>> device tree, it would use the burst clock.
> >>>
> >>> As a fall-back I could just simply check for the presence of the
> >>> burst_clock_rate instead of both MIPI_DSI_MODE_VIDEO_BURST and
> >>> burst_clock_rate.
> >> Maybe you should extend your check also for the
> >> MIPI_DSI_CLOCK_NON_CONTINUOUS flag? Does it make sense?
> > Looking at some of the devices that might attach in the future, It
> > appears that ti-sn65dsi86.c sets this flag.  It's a display port
> > bridge, so I would expect it to need a variable clock rate similar to
> > how the HDMI bridge that I need works.  I am concerned that I make the
> > burst clock dependent on MIPI_DSI_CLOCK_NON_CONTINUOUS, it might break
> > the Display Port bridge.
> >
> > I think it's better to just check if the samsung,burst-clock-frequency
> > is present in the device tree and use it when present.  If it's not
> > present, then fall back to the pixel clock of the connected device.
>
> Right, this sounds rational.
>
> > I looked at a bunch of Exynos parts, and it looks like they all use
> > the samsung,burst-clock-frequency device tree setting.  Is that true,
> > or did I miss one?
>
> That true. All Exynos based boards with DSI panels use constant DSI
> burst frequency defined in the device tree.

Thanks for the feedback.  I'll try to get another rev of this series
pushed later today or Monday.

adam
>
>
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>
