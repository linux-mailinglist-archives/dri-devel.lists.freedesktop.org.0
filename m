Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7A0956C86
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 16:00:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D1DC10E0DD;
	Mon, 19 Aug 2024 14:00:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pCD5a4Sn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 094A110E0DD
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 14:00:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 54B5460684
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 14:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 063E4C32782
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 14:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724076013;
 bh=3WLrkjUnr9LlqLwIEsGZ1N/7WjLoqXupEz/SOJAYq7Y=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pCD5a4Snq+pWCR43HGybi8uhb2LTCbbEvx6O3waFOhlXCpJLzdC0UViD1vKV09t0P
 V5Sg5/E7BQIx3TwBkSdLTRgW61hFqdrptnuFepUPXuk1J64GOPLJvxpBa9VwUHX6VT
 FDmyrU6vLYSBrjH/QMwqj4kNAM2ouwnhvZA9ksfWCmyOSj0+6eJECEPM6mPBGsRMrW
 4xawj8Oz/c+NdE5Gr/1ZhVlK88/WrwMgju7m1iYzbsRfcLNREwW+Pxs5vDfZH2OqZA
 jCCKhXLeOr4g7IquP2YC213u0pmbgkdEodxEupOaydx+PK2wddFIvUHtWTh9buiQ6M
 u9pMwxGxdC7Ag==
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-2702920901aso268659fac.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 07:00:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVckKbEeU6/H1XTvR+p/fBbrFqlcSdQcSIqw/fHGxfV74KpCz99QIsLwj/HhlAmIls7qnIxWVUduF8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0/Ziutd3PL95eEWeJGo8mNl8cnIPk4g8CmBbnyvaoSFoqk2jG
 gaCv0/z5Iy7I/NUg0j2NYt20hVWtTrhSAUPuVo0SsYuvkGzbShW8PDW0DF+W1UaLybwUg03XXDd
 yXxufSGQRXBYlBbqXvz7U9//ADyk=
X-Google-Smtp-Source: AGHT+IGcDoqLgza7vPj01i2Jw/Z7VOE0538tkQpE47TOLRLTY+IvwaqIwtPPkILmDyaquWJA0iDPj0JncgUYV4+fWCM=
X-Received: by 2002:a05:6870:ecaa:b0:260:e5e1:2411 with SMTP id
 586e51a60fabf-2701c50f7abmr5632480fac.6.1724076012360; Mon, 19 Aug 2024
 07:00:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240814190159.15650-1-hdegoede@redhat.com>
 <Zr0PD5d2bqpikxf_@smile.fi.intel.com>
In-Reply-To: <Zr0PD5d2bqpikxf_@smile.fi.intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 19 Aug 2024 15:59:58 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jLe_NF5+2RQanyPWng9wYXEtuxcTrapcW8QX-wshjm5g@mail.gmail.com>
Message-ID: <CAJZ5v0jLe_NF5+2RQanyPWng9wYXEtuxcTrapcW8QX-wshjm5g@mail.gmail.com>
Subject: Re: [PATCH 0/3] ACPI/video / platform/x86: Add backlight=native quirk
 for Dell OptiPlex 7760 AIO
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-acpi@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org
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

On Wed, Aug 14, 2024 at 10:10=E2=80=AFPM Andy Shevchenko <andy@kernel.org> =
wrote:
>
> On Wed, Aug 14, 2024 at 09:01:56PM +0200, Hans de Goede wrote:
> > Hi Rafael,
> >
> > 6.10 has a new backlight driver for UART attached backlight controller
> > boards found in some Dell All in One models.
> >
> > Now the first AIO has turned up which has not only the DSDT bits for th=
is,
> > but also an actual controller attached to the UART, yet it is not using
> > this controller for backlight control (it needs GPU native control).
> >
> > I did not tie the dell-uart-backlight into acpi_video_get_backlight_typ=
e()
> > yet, so the first 2 patches in this series deal with that and the third
> > patch adds a DMI quirk to select native backlight control on top.
> >
> > Backlight control used to work on the Dell OptiPlex 7760 AIO with kerne=
l
> > 6.9 and older, so this is a regression and I would like to see this
> > series merged as fixes for 6.11.
> >
> > Rafael, the drivers/platform/x86/dell/dell-uart-backlight.c are small
> > and isolated. So I believe it is best if you take the entire series,
> > to avoid conflicts if any other drivers/apci/video_detect.c DMI quirks
> > show up this cycle.
>
> FWIW,
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
>
> I find this quite small and I agree this would be nice to have as fixes.

Applied as fixes for 6.11-rc, thanks!
