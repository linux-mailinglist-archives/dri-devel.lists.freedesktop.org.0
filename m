Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 005F5C67DE1
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 08:16:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9998210E0E2;
	Tue, 18 Nov 2025 07:16:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ilC7Rmvc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A7310E0E2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 07:16:48 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-477619f8ae5so34007205e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 23:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763450207; x=1764055007; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/KTXy4LYc+3eURkyFEtAu5JtRy+tCU0zvqdQk5bTLU0=;
 b=ilC7Rmvcj3xePtIjdHZMM897kikdBDyvbeblUlw2trMWxAHOA/EkqMiLhIKtMMuZ10
 ysUf1KOHmpMVEM7++BUtQCdelhz3/SJqi5qxi9ev0gc6Pm5UbSO4Ij24yeNHSm+F17dJ
 OHFZKbPakD6pN12SEz6TAQ9a7cB1UC6ylzWVpPz1+7n/eAwE2WIw3r/PIBh939qPU/RB
 6ThKWfva4INYpMG++XqhMGuZzHwtCE4efSKw9vbo5WUJUPRAg17BNwHZJOPyng7CzC07
 Akralw27mQO5Y5EYCwZXCpgDNn2o4/HvxmgjVtmrPi4lTm7kcwYP8d/ozlq0fB1FmAos
 Yvkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763450207; x=1764055007;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/KTXy4LYc+3eURkyFEtAu5JtRy+tCU0zvqdQk5bTLU0=;
 b=fRvHUcp8dU8nCqMjIncK7yxSoxeeiOxa9d3kL/HM3oxrs+rXQXkdXAjeY8USr2THbu
 ttA4oNMd5lwg1Tx9DkvZeJsYYv0cJztgY5YHQ4b1IT65SDqdBtC9VI9eSg1AAwslzkwY
 pg14JIhGTXLun4PubtI5Fd4fgbZ9fdcMkp3gnSsi/Go6Fg0FrwsYiwcJhPwVGilGTxhT
 tR3naCtyUlOqnIr1Wilftqam+p4guJ4wa4EFFu9aupBy74QakmYppqX+43KRzKGeFXsP
 y3t5Jd+XzNUogj02y7YJVOBAEdfuf5pfsmDXCuyL0tyzhkJl8NAY4qroRsUsFocHQYjR
 ItvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWorjf27cWpwiOgfym8FmnxM8A5oWUsrjgLsEHCe2yLFbmCF+9vG5k184kcy3ossZmh4llilDYVpgQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxthYYy5zPaMB+10ziyypeDyBfiS0uC0afF+d/NUt2+Lip8sRZT
 O8ArW25fncVsWGgX/dRUz7vxjOPXomrtJGS6vI0HJhKZr8Yw38Tt3oytUYzU1iuuChyMokl4JQ6
 oKM72Fn4ZfBSBuuQBMcduSf7Y9LH2/eI=
X-Gm-Gg: ASbGncuhl7zHUUb2cSPrFvduuY3R6jM3J/s3C3Jn9Un5Hubw8KH6PYfvYCEF4VS0O+u
 YiOQAqq0Lt4IXJiElos/EHWiOUsOrLPJF0k5BC6qIe9bW2L9NZanNV2B+ckIvbPRegK9CVR+D9t
 3AE0FDYsAdVhzwv1hUvt5nJcleamIYnTZQolBt12Uq9wClO8//AnyW8SaDUeUbuMiR/+DJejUAx
 z78Q/9Z5Pq1nnvg8MhWdr2U/Aqqec3i3TDsZEmqZIPAX5jS9b/Jox7T9PfYUk7QKqOUMC2Yd9GP
 YfoZGgI=
X-Google-Smtp-Source: AGHT+IE8eWHTzx3ciz5rS3jZUxmLAR3nOWJrIZLlZT32SvvuGpdP8yMosOXzwXWHhwq5spIUyYIVyvJj9viWhF5Bm9Y=
X-Received: by 2002:a05:600c:3587:b0:477:79f8:daa8 with SMTP id
 5b1f17b1804b1-4778fe7e760mr152755075e9.17.1763450206831; Mon, 17 Nov 2025
 23:16:46 -0800 (PST)
MIME-Version: 1.0
References: <20251022144930.73272-1-clamor95@gmail.com>
 <20251022144930.73272-3-clamor95@gmail.com>
 <mzapp3ekwj3xdzqjjwkwn2hdfunf75fnd3wwxfsr5nce5guhoa@k2dgiw4sngrd>
In-Reply-To: <mzapp3ekwj3xdzqjjwkwn2hdfunf75fnd3wwxfsr5nce5guhoa@k2dgiw4sngrd>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 18 Nov 2025 09:16:35 +0200
X-Gm-Features: AWmQ_bkV8027WSudecPgIokkxJAlJtxrZFbDhKQAoi57jFryZZw6HtTknmXqldw
Message-ID: <CAPVz0n0fkMYV-O4xWTBELd6HtKR83wrs+DS1wTVDOXdWuAK2OA@mail.gmail.com>
Subject: Re: [PATCH v5 23/23] staging: media: tegra-video: add CSI support for
 Tegra20 and Tegra30
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Mikko Perttunen <mperttunen@nvidia.com>,
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

=D0=BF=D0=BD, 17 =D0=BB=D0=B8=D1=81=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 13:5=
6 Thierry Reding <thierry.reding@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Oct 22, 2025 at 05:49:30PM +0300, Svyatoslav Ryhel wrote:
> > Add support for MIPI CSI device and calibration logic found in Tegra20 =
and
> > Tegra30 SoC.
> >
> > To get CSI operational, an additional syncpoint was allocated to serve =
as
> > the CSI frame counter. Both VIP and CSI use an existing syncpoint for V=
I
> > frame start events. That said, the frame capture function was refactore=
d
> > to reflect the addition of the CSI syncpoint, and the CSI-specific
> > configuration is guarded by the presence of a passed CSI channel struct=
ure
> > pointer.
> >
> > The camera capture setup's configuration was reconsidered: the first tw=
o
> > writes must be done before tegra_channel_set_stream for MIPI calibratio=
n
> > to work properly; the third write was moved to VIP/CSI-specific functio=
ns
> > since it must be source-specific; the function was placed after
> > tegra_channel_set_stream so the initial sequence is preserved and expan=
ded.
> >
> > CSI configuration sequences were added based on downstream 3.1 kernel
> > sources and adjusted to the existing video-tegra framework. Although
> > Tegra20 and Tegra30 have the same set of configurations, they differ by
> > the number of clocks used by CSI.
> >
> > Dropped the software syncpoint counters in favor of reading syncpoints
> > directly and passing the incremented value to the polling function. If =
the
> > syncpoint increase fails, the PP is reset. This change should prevent
> > possible race conditions.
> >
> > MIPI calibration logic was registered in CSI since Tegra20 and Tegra30
> > have no dedicated hardware block for these operations and use CSI. Thes=
e
> > calls are used for both CSI and DSI to work properly, which is why MIPI
> > calibration cannot be contained within CSI. The pads passed to the
> > calibration calls resemble CSI PORT_A (0), CSI PORT_B (1), DSI-A (3) an=
d
> > DSI-B (4).
> >
> > Co-developed-by: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
> > Signed-off-by: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/staging/media/tegra-video/csi.c     |  23 +
> >  drivers/staging/media/tegra-video/csi.h     |   4 +
> >  drivers/staging/media/tegra-video/tegra20.c | 620 ++++++++++++++++++--
> >  drivers/staging/media/tegra-video/vi.h      |   2 -
> >  drivers/staging/media/tegra-video/video.c   |   6 +
> >  5 files changed, 608 insertions(+), 47 deletions(-)
>
> Sorry, didn't realize that this was supposed to be part of the earlier
> series that contains the opsification since it shows up as separate
> patch series. Admittedly the numbering should've given it away... Thanks
> Mikko for pointing that out.
>
> Anyway, most of my objections remain. You can implement this here just
> the same even without most of the extra churn in the prior patch. No
> need for moving things to a different header, just keep adding the new
> ops stuff to the existing one, which all drivers that need the
> calibration functionality already include anyway (including this). Also

So you propose to bloat host1x header with more mipi calibration stuff
just because someone placed those functions in there, instead of
creating a dedicated mipi calibration header. Even though mipi
calibration has NOTING to do with host1x, in case of Tegra114+ it is a
dedicated hw block not connected with host1x at all, and in
Tegra20/Tegra30 it is integrated part of CSI and not a direct hw block
on host1x. Having a dedicated header for mipi calibration seems more
logical then continue bloating host1x with unrelated stuff decreasing
its maintainability.

> no need to split out the SoC specific bits from the mipi.c file since,
> like I said, it's not going to grow anymore and can just remain as it
> is.
>

I proposed in that patch to separate mipi calibration framework which
is used by all Tegra SoC generations from SoC specific parts used by
Tegra114+ if form of dedicated hw block and Tegra20/Tegra30 as a part
of CSI. This enhances maintainability and improves transparency, while
you propose to squash everything into a single file making it a
maintainers hell.

> Thierry
