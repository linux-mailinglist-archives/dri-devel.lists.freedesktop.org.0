Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8F08CAC38
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 12:29:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BAD710E9A8;
	Tue, 21 May 2024 10:29:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="e/YYrNOU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2B3910E9A8
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 10:29:44 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-de60380c04aso3605245276.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 03:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716287383; x=1716892183; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hhxSfEN3YZHsURt9abVwnipYtfjc7URPzVX6S12WmaU=;
 b=e/YYrNOUHDs2RK22zkd/Ye0kRyvz/IjPOmnbHC4NZvoSGC6anOdMMoFynggojXmi3v
 7uD26IG1DbZcwOGhF+06Yyg5UsnkalF1pei2NTuHy7N4nqlYmXs8+lZJ7u7GA3XHq3wh
 8ngdo8SgVXx1JWbEFBtWzwfEI2ua5eEU5Hou5GWJA3U2aqlpjzuG2EhlKIusnDov/n73
 LEO7dsBxL5q/v4G6glwChpffZux3oxKrHV8ZiLWgnY2SQRZ4YC5pq7TAJqKpl5IZJXEH
 q07OHuK8aCT4ji+FKK/kV5oD2IbbOadsqJS36oTSJ0UKqMMeklrSy3sSnvAyQClXzK9W
 gOiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716287383; x=1716892183;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hhxSfEN3YZHsURt9abVwnipYtfjc7URPzVX6S12WmaU=;
 b=J9p3Lfwq6VzkZpG7lJgkGgI3+cto5Y/i31A+nozdXacceovaIF0SjEu6un0YSROwQf
 g744JAjKVzlKISoIMiCHWDRjvnE3Tpjof3vuqmZN1TBqe/ddwC7Jh9GXd816WXu6GJCW
 iVQCT2Vd1C4NNKsshlL2Heet+yByxUKo/6u+7Sww7Ce91kGrcociJm5JTgXLy7ECPnT2
 jf9EgnLgt1OBXtgcoGdMEA5q/8k4UBQOWb9ov+RNJcp4wwzaExCUdJChfTXaAOkXZS6i
 ECKdIpMcaxmx8TzmhzFS/FhD5bRVI2G62xxHMvYxjghQdsdHVfPnFaogpHknlkaRVyPm
 FpYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6KzrTUZzpTjuupEKev1govjtWaDT/sftAX98aKqu9iAv3tT5w0LIRQRB1AcmwAzek2yIP15Z6Xh7BSxnZLaBArps53F6oMZyEmEuQ3vbt
X-Gm-Message-State: AOJu0YzzQa7W/Bi0rehdHHe+MR6qTgl9Uri9OBFZcCKTVIPQviJxuwT+
 NaN+4ZP6ZnxbBWmtnphNJZFszmr2IbzsvQFR1lg9dOrhgj+gHLO75Tq/AowJP+62nR12PkkShry
 5DrR5SLnEdsUwHygmnMUxPFFqtsQsWsTcprfUqA==
X-Google-Smtp-Source: AGHT+IHEkPcbU/mY9ABnsDa2hRbs7hlpxgMWmqACXFmTwhxL+abQNPRnrk+hHryTOxcjSofFyV3Lr3Hzwi2viXteRkA=
X-Received: by 2002:a05:6902:4:b0:de5:705d:9373 with SMTP id
 3f1490d57ef6-dee4f1b7848mr26999598276.12.1716287383352; Tue, 21 May 2024
 03:29:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240415-ti-sci-pd-v1-0-a0e56b8ad897@ideasonboard.com>
 <20240415-ti-sci-pd-v1-2-a0e56b8ad897@ideasonboard.com>
 <d4cd0323-4792-49b0-a4e2-0bc92068e7f0@ideasonboard.com>
 <CAPDyKFqShuq98qV5nSPzSqwLLUZ7LxLvp1eihGRBkU4qUKdWwQ@mail.gmail.com>
 <d7bf10d1-9294-44b0-b9f4-193d1a4f26a0@ideasonboard.com>
In-Reply-To: <d7bf10d1-9294-44b0-b9f4-193d1a4f26a0@ideasonboard.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 21 May 2024 12:29:07 +0200
Message-ID: <CAPDyKFppS1CFZ7iDATfvT1=C+oqOR6sOGoV5Fc2PgXTn4NkUOQ@mail.gmail.com>
Subject: Re: [PATCH RFC 2/2] pmdomain: ti-sci: Support retaining PD boot time
 state
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Abel Vesa <abel.vesa@linaro.org>, Saravana Kannan <saravanak@google.com>, 
 Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
 Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>, Dave Gerlach <d-gerlach@ti.com>,
 J Keerthy <j-keerthy@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Santosh Shilimkar <santosh.shilimkar@oracle.com>,
 linux-arm-kernel@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Devarsh Thakkar <devarsht@ti.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 10 May 2024 at 12:19, Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> Hi,
>
> On 03/05/2024 16:45, Ulf Hansson wrote:
> > + Abel, Saravanna, Stephen
> >
> > On Mon, 15 Apr 2024 at 19:17, Tomi Valkeinen
> > <tomi.valkeinen@ideasonboard.com> wrote:
> >>
> >> On 15/04/2024 19:00, Tomi Valkeinen wrote:
> >>> Add a new flag, TI_SCI_PD_KEEP_BOOT_STATE, which can be set in the dts
> >>> when referring to power domains. When this flag is set, the ti-sci
> >>> driver will check if the PD is currently enabled in the HW, and if so,
> >>> set the GENPD_FLAG_ALWAYS_ON flag so that the PD will stay enabled.
> >>>
> >>> The main issue I'm trying to solve here is this:
> >>>
> >>> If the Display Subsystem (DSS) has been enabled by the bootloader, the
> >>> related PD has also been enabled in the HW. When the tidss driver
> >>> probes, the driver framework will automatically enable the PD. While
> >>> executing the probe function it is very common for the probe to return
> >>> EPROBE_DEFER, and, in rarer cases, an actual error. When this happens
> >>> (probe() returns an error), the driver framework will automatically
> >>> disable the related PD.
> >>>
> >>> Powering off the PD while the DSS is enabled and displaying a picture
> >>> will cause the DSS HW to enter a bad state, from which (afaik) it can't
> >>> be woken up except with full power-cycle. Trying to access the DSS in
> >>> this state (e.g. when retrying the probe) will usually cause the board
> >>> to hang sooner or later.
> >>>
> >>> Even if we wouldn't have this board-hangs issue, it's nice to be able to
> >>> keep the DSS PD enabled: we want to keep the DSS enabled when the
> >>> bootloader has enabled the screen. If, instead, we disable the PD at the
> >>> first EPROBE_DEFER, the screen will (probably) go black.
> >>
> >> A few things occurred to me. The driver is supposed to clear the
> >> GENPD_FLAG_ALWAYS_ON when the driver has probed successfully. There are
> >> two possible issues with that:
> >>
> >> - Afaics, there's no API to do that, and currently I just clear the bit
> >> in genpd->flags. There's a clear race there, so some locking would be
> >> required.
> >>
> >> - This uses the GENPD_FLAG_ALWAYS_ON flag to say "PD is always on, until
> >> the driver has started". If the PD would have GENPD_FLAG_ALWAYS_ON set
> >> for other reasons, the driver would still go and clear the flag, which
> >> might break things.
> >>
> >> Also, unrelated to the above and not a problem in practice at the very
> >> moment, but I think clocks should also be dealt with somehow. Something,
> >> at early-ish boot stage, should mark the relevant clocks as in use, so
> >> that there's no chance they would be turned off when the main kernel has
> >> started (the main display driver is often a module).
> >>
> >> It would be nice to deal with all the above in a single place. I wonder
> >> if the tidss driver itself could somehow be split into two parts, an
> >> early part that would probe with minimal dependencies, mainly to reserve
> >> the core resources without doing any kind of DRM init. And a main part
> >> which would (somehow) finish the initialization at a later point, when
> >> we have the filesystem (for firmware) and the other bridge/panel drivers
> >> have probed.
> >>
> >> That can be somewhat achieved with simplefb or simpledrm, though, but we
> >> can't do any TI DSS specific things there, and it also creates a
> >> requirement to have either of those drivers built-in, and the related DT
> >> nodes to be added.
> >
> > Without going into too much detail, this and similar problems have
> > been discussed in the past. With the fw_devlink and the ->sync_state()
> > callback we are getting closer to a solution, but for genpd a solution
> > is still pending.
> >
> > If you want to read up on earlier discussions and join us moving
> > forward, that would be great. The last attempt for genpd to move this
> > forward was posted by Abel Vesa:
> > https://lore.kernel.org/linux-pm/20230621144019.3219858-1-abel.vesa@linaro.org/
> >
> > Beyond that, we have also discussed various solutions at the last LPC
> > in Richmond. I think the consensus at that point was that Saravana
> > targeted to post something for clocks - and when that was done, we
> > should do the similar thing for genpd. Anyway, I have looped them into
> > this thread, so they can share any updates on their side of the
> > matter.
>
> If I understand the series correctly, it has an issue at least for this
> case/platform.
>
> The devlinks are between the consumer devices and the PD provider
> device. TI SCI PD provider has quite a lot of PDs, and all the consumers
> would have to be probed before any of the PDs could be disabled. So, to
> get the display PD disabled, I would have to load, e.g., the GPU driver
> (which I don't even have).
>
> I believe this is the case for the clocks also.
>
> Perhaps that can be considered a feature, but I fear that in practice it
> would mean that most of the time for most users all the boot-time
> enabled powerdomains would be always on.
>
> Nevertheless, I believe the series would fix the issue mentioned in this
> patch, so I'll see if I can get the series working on the TI platform to
> get a bit more experience on this whole issue.

[...]

Just to share a brief update on this matter. I have had an offlist
chat with Saravana and some Qcom guys about this topic. In particular
we looked closer at some implementation details.

Allow me a few weeks, then I will post a series for genpd to implement
the above. I will keep you posted and would appreciate reviews and
tests, of course.

Kind regards
Uffe
