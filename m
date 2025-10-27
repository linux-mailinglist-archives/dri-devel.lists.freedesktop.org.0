Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0082C0F4FA
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 17:32:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECF3710E167;
	Mon, 27 Oct 2025 16:32:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VrfrflEM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E0810E167
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 16:32:24 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3ecdf2b1751so3408586f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 09:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761582743; x=1762187543; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PF5KpKL469fVTXgAkVCiESe8ar89l86aILwHhnCjqVw=;
 b=VrfrflEMEKqzjPCnIdWvwXWAZuBAz1wzXkXYtNwcEhwqQxVvmo/hmqWnvYDKJbGyqS
 DgxplxxyL5z/ggooUId1+9q/FCEymlZaSRuiA2tKZpnwoP6gvJdJQhd7yugj7JUW5asZ
 uRbaGc7IdUfAAt0mOfSHjlsNKqTnVb52bVOx4chVW41AowhnOOyLu4j/Nx7wl2/DwYi+
 fRb+w2UV4KdLBY/DFi671oh1Flq+Ll6ZGoKDBr/UXwO9Pkn8qq/h62BLvMd30AvbIQb6
 sf520bZDvUUhZVDicOcdPPm099bzSzBjrouTxQdERDNaRczjtCGA+w/qnJuqNPS3Jt0C
 HSYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761582743; x=1762187543;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PF5KpKL469fVTXgAkVCiESe8ar89l86aILwHhnCjqVw=;
 b=PxvfG5xEjYTgVkAW/Se7UJE0k1+5YytM5ExhqAC0tcTA72ubbVXKlcmLVv2fG50/gj
 FaR0X4rdRqadc44ALKNBYKtYeJhgZwYdkWTqD6wCmNUeZZT+bK9kku8BDLpPv+lqjBKN
 EkepRUyh9aucLxcNRkJ4RHCjjEgy2uvyskptbuQhLtw+BjcqTUyi3a4IRsD3iXE4Zt1t
 iGlqClG6SggQbd9Aokt314NZ+UTp7obLAfYsWw8imR19Mzn7BJCh0m/ScUA0aCD5Up4g
 VfVvYyeSg0N20YVHzUJtDoiL0Qv7/EZUWRqM89BF/QX4HJLd3oSX2i16Bhu5t3SJHuww
 PXbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXK7jpko6+oSAUlsD4ggqDzPV6N2hxIXYsuU8UDrka0AUpTfVFSjbXpgv+lp1tW0FUQD4aDLCWXQrQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+y/UXCeYVInAK4equesa0lJF+/1id4q67KveaJezth0ZBMBvA
 hx6YG96VSJYn9zecja/peVezvZ9uTvcWac9WID346xfTqNI4eH+2PtH78AzdTS99aZ1Ro4vIZUH
 PChE1rk6pX62DERid8mwMIluzYymV6sE=
X-Gm-Gg: ASbGnctpV6K0WX4PTjM7l4PDbkt2IVdYbbdrFVu6tSZ85/grRt/4wyR4bGP7K2au8Rs
 4IURFczr1rPkVpOiwg3gGuwOymOv0KSTHJaG1HaNkqxUZfMDJmPi+ZMQYfxeMYj/bOUvY30sQiS
 6gQM+w83qqLe177w6/RLWlkrHm8BthTu1k+z9iIe6ojHlf0310t67ZkDHK4FV+iQdBn2Yc3zLfq
 X6FkTP0rg3WKV7QHsZtfgXH4SY7LdYAv9soh5sMfIe8urpxF53/S43KDiCx6DbT3nHmIyiB
X-Google-Smtp-Source: AGHT+IGnQKSD8LLMcix6lZzwNF5GRcP/d5ntwfmO8bYJcqFggKCrAfVq/BMs9d8iTrMYt/ReQHX0zgxmRp5XUkKSJ3s=
X-Received: by 2002:a5d:5f82:0:b0:426:d5de:e454 with SMTP id
 ffacd0b85a97d-429a7e84487mr290406f8f.31.1761582742690; Mon, 27 Oct 2025
 09:32:22 -0700 (PDT)
MIME-Version: 1.0
References: <20251022142051.70400-1-clamor95@gmail.com>
 <7c5a1a6e-cad2-46c3-b5cd-3e92ca6d99a7@kernel.org>
 <CAPVz0n1aj8A5L50WcO-W4jSH2t6kfi6qXN-2FkmZxiAYJUN3vg@mail.gmail.com>
 <f1ac1e4a-09cf-4cbc-8555-87111ef5810a@kernel.org>
In-Reply-To: <f1ac1e4a-09cf-4cbc-8555-87111ef5810a@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 27 Oct 2025 18:32:10 +0200
X-Gm-Features: AWmQ_blYaK_-CilYY_DzPCPq1WabsGLOdAlNNG0enxXFT4qytUlg4j6qbAg5jHY
Message-ID: <CAPVz0n1nZqhnDQfSHOK3uixJd_t1b04CrWzoTa3smXXD8g0mCg@mail.gmail.com>
Subject: Re: [PATCH v5 00/23] tegra-video: add CSI support for Tegra20 and
 Tegra30
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
 Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Aaron Kling <webgeek1234@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-staging@lists.linux.dev
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

=D0=BF=D0=BD, 27 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 18:3=
0 Hans Verkuil <hverkuil+cisco@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 27/10/2025 17:26, Svyatoslav Ryhel wrote:
> > =D0=BF=D0=BD, 27 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE =
18:08 Hans Verkuil <hverkuil+cisco@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >>
> >> Hi Svyatoslav,
> >>
> >> On 22/10/2025 16:20, Svyatoslav Ryhel wrote:
> >>> Add support for MIPI CSI device found in Tegra20 and Tegra30 SoC alon=
g
> >>> with a set of changes required for that.
> >>
> >> Other than patch 06/23 that looked iffy (although the original code wa=
s iffy as
> >> already), for which I posted a review, this series looks almost ready.
> >
> > 06/23 addresses issue I have encountered while testing with mt9m114 I
> > will add detailed explanation later in the 06/23 commit discussion.
> >
> >>
> >> Should the clk patches be merged together with the media patches? Or c=
an those
> >> go in via the clk subsystem? If it is the latter, then I'll need an Ac=
ked-by from the
> >> clk subsystem maintainer.
> >>
> >
> > I suppose this should be discussed between staging and clk subsystem
> > maintainers I am fine with any conclusion.
> >
> >> Regarding the bindings: all except 21/23 are Acked.
> >
> > Maybe you did not notice, but 21/23 has reviewed-by from Rob Herring.
>
> Ah yes, Rob replied. Good.
>
> >
> >>
> >> I have one question regarding testing: in the past I tested this drive=
r with a
> >> Jetson TX1 devkit and a camera sensor. One of the main reasons this dr=
iver is still
> >> in staging is that I never got that to work reliably: after 10-30 minu=
tes it would
> >> lose sync and streaming would stop.
> >>
> >> Unfortunately I never had the time to dig deeper into that.
> >>
> >> So have you tested this with a camera sensor? And if so, does it strea=
m reliably?
> >> I.e. just let it stream for 24 hours and see if that works.
> >>
> >> If it is reliable for you, then I think this driver should be moved to=
 drivers/media.
> >
> > Streaming works but I did not tested for such prolonged periods of
> > time. Scope of this patchset is bringing CSI support for
> > Tegra20/Tegra30, extended testing and move to media can be done in
> > followup.
>
> I'd really appreciate it if you can do a duration test. Perhaps start str=
eaming on
> Friday and let it run for the weekend?

With all do respect this will not happen any time soon.

> Regards,
>
>         Hans
>
> >
> >>
> >> Regards,
> >>
> >>         Hans
> >>
> >>>
> >>> ---
> >>> Changes in v2:
> >>> - vi_sensor gated through csus
> >>> - TEGRA30_CLK_CLK_MAX moved to clk-tegra30
> >>> - adjusted commit titles and messages
> >>> - clk_register_clkdev dropped from pad clock registration
> >>> - removed tegra30-vi/vip and used tegra20 fallback
> >>> - added separate csi schema for tegra20-csi and tegra30-csi
> >>> - fixet number of VI channels
> >>> - adjusted tegra_vi_out naming
> >>> - fixed yuv_input_format to main_input_format
> >>> - MIPI calibration refsctored for Tegra114+ and added support for
> >>>   pre-Tegra114 to use CSI as a MIPI calibration device
> >>> - switched ENOMEM to EBUSY
> >>> - added check into tegra_channel_get_remote_csi_subdev
> >>> - moved avdd-dsi-csi-supply into CSI
> >>> - next_fs_sp_idx > next_fs_sp_value
> >>> - removed host1x_syncpt_incr from framecounted syncpoint
> >>> - csi subdev request moved before frame cycle
> >>>
> >>> Changes in v3:
> >>> - tegra20 and tegra30 csi schema merged
> >>> - removed unneeded properties and requirements from schema
> >>> - improved vendor specific properties description
> >>> - added tegra20 csus parent mux
> >>> - improved commit descriptions
> >>> - redesigned MIPI-calibration to expose less SoC related data into he=
ader
> >>> - commit "staging: media: tegra-video: csi: add support for SoCs with=
 integrated
> >>>   MIPI calibration" dropped as unneeded
> >>> - improved tegra_channel_get_remote_device_subdev logic
> >>> - avdd-dsi-csi-supply moved from vi to csi for p2597 and p3450-0000
> >>> - software syncpoint counters switched to direct reading
> >>> - adjusted planar formats offset calculation
> >>>
> >>> Changes in v4:
> >>> - removed ifdefs from tegra_mipi_driver
> >>> - document Tegra132 MIPI calibration device
> >>> - switched to use BIT macro in tegra114-mipi
> >>> - pinctrl changes moved to a separate patch
> >>> - ERESTARTSYS workaround preserved for now
> >>> - tegra_mipi_add_provider replaced with devm_tegra_mipi_add_provider
> >>> - reworked bytesperline and sizeimage calculaion
> >>>
> >>> Changes in v5:
> >>> - dropped patch 1/24 of v4 since it was picked to pinctrl tree
> >>> - added reasoning for tegra132 comaptible into commit desctiption
> >>> - moved clocks into common section in tegra20-csi schema
> >>> - added note regarding ERESTARTSYS
> >>> ---
> >>>
> >>> Svyatoslav Ryhel (23):
> >>>   clk: tegra: set CSUS as vi_sensor's gate for Tegra20, Tegra30 and
> >>>     Tegra114
> >>>   dt-bindings: clock: tegra30: Add IDs for CSI pad clocks
> >>>   clk: tegra30: add CSI pad clock gates
> >>>   dt-bindings: display: tegra: document Tegra30 VI and VIP
> >>>   staging: media: tegra-video: expand VI and VIP support to Tegra30
> >>>   staging: media: tegra-video: vi: adjust get_selection op check
> >>>   staging: media: tegra-video: vi: add flip controls only if no sourc=
e
> >>>     controls are provided
> >>>   staging: media: tegra-video: csi: move CSI helpers to header
> >>>   gpu: host1x: convert MIPI to use operation function pointers
> >>>   dt-bindings: display: tegra: document Tegra132 MIPI calibration dev=
ice
> >>>   staging: media: tegra-video: vi: improve logic of source requesting
> >>>   staging: media: tegra-video: csi: move avdd-dsi-csi-supply from VI =
to
> >>>     CSI
> >>>   arm64: tegra: move avdd-dsi-csi-supply into CSI node
> >>>   staging: media: tegra-video: tegra20: set correct maximum width and
> >>>     height
> >>>   staging: media: tegra-video: tegra20: add support for second output=
 of
> >>>     VI
> >>>   staging: media: tegra-video: tegra20: adjust format align calculati=
ons
> >>>   staging: media: tegra-video: tegra20: set VI HW revision
> >>>   staging: media: tegra-video: tegra20: increase maximum VI clock
> >>>     frequency
> >>>   staging: media: tegra-video: tegra20: expand format support with
> >>>     RAW8/10 and YUV422/YUV420p 1X16
> >>>   staging: media: tegra-video: tegra20: adjust luma buffer stride
> >>>   dt-bindings: display: tegra: document Tegra20 and Tegra30 CSI
> >>>   ARM: tegra: add CSI nodes for Tegra20 and Tegra30
> >>>   staging: media: tegra-video: add CSI support for Tegra20 and Tegra3=
0
> >>>
> >>>  .../display/tegra/nvidia,tegra114-mipi.yaml   |   1 +
> >>>  .../display/tegra/nvidia,tegra20-csi.yaml     | 138 +++
> >>>  .../display/tegra/nvidia,tegra20-vi.yaml      |  19 +-
> >>>  .../display/tegra/nvidia,tegra20-vip.yaml     |   9 +-
> >>>  arch/arm/boot/dts/nvidia/tegra20.dtsi         |  19 +-
> >>>  arch/arm/boot/dts/nvidia/tegra30.dtsi         |  24 +-
> >>>  .../arm64/boot/dts/nvidia/tegra210-p2597.dtsi |   4 +-
> >>>  .../boot/dts/nvidia/tegra210-p3450-0000.dts   |   4 +-
> >>>  drivers/clk/tegra/clk-tegra114.c              |   7 +-
> >>>  drivers/clk/tegra/clk-tegra20.c               |  20 +-
> >>>  drivers/clk/tegra/clk-tegra30.c               |  21 +-
> >>>  drivers/gpu/drm/tegra/dsi.c                   |   1 +
> >>>  drivers/gpu/host1x/Makefile                   |   1 +
> >>>  drivers/gpu/host1x/mipi.c                     | 525 ++---------
> >>>  drivers/gpu/host1x/tegra114-mipi.c            | 483 +++++++++++
> >>>  drivers/staging/media/tegra-video/Makefile    |   1 +
> >>>  drivers/staging/media/tegra-video/csi.c       |  70 +-
> >>>  drivers/staging/media/tegra-video/csi.h       |  16 +
> >>>  drivers/staging/media/tegra-video/tegra20.c   | 820 +++++++++++++++-=
--
> >>>  drivers/staging/media/tegra-video/vi.c        |  56 +-
> >>>  drivers/staging/media/tegra-video/vi.h        |   6 +-
> >>>  drivers/staging/media/tegra-video/video.c     |   8 +-
> >>>  drivers/staging/media/tegra-video/vip.c       |   4 +-
> >>>  include/dt-bindings/clock/tegra30-car.h       |   3 +-
> >>>  include/linux/host1x.h                        |  10 -
> >>>  include/linux/tegra-mipi-cal.h                |  57 ++
> >>>  26 files changed, 1657 insertions(+), 670 deletions(-)
> >>>  create mode 100644 Documentation/devicetree/bindings/display/tegra/n=
vidia,tegra20-csi.yaml
> >>>  create mode 100644 drivers/gpu/host1x/tegra114-mipi.c
> >>>  create mode 100644 include/linux/tegra-mipi-cal.h
> >>>
> >>
>
