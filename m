Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D532399E2D7
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 11:33:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5164910E2CE;
	Tue, 15 Oct 2024 09:33:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="AnVFEawz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09CB210E2CE
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 09:33:11 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-6e2e4237da4so42626547b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 02:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1728984791; x=1729589591;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eNz9E/ZbYToPEHGGNEmmAdKDEa9b78YRVmnC3SHI02Q=;
 b=AnVFEawzFtCWk0iO4uwn89iNrWhRCwlw2z7facT7F7t1BIl3ovak146vBP4pYRpYz8
 3iltziRTH2kR20nuhAMGYhKzkvz/zMO7Zfj9cgQ8PZY9hbRGk2/cxRwK3d+CkmU710xj
 cnbpxNMeNCZlrziI8ZXjivOHM2DTPqI/unbLWwpmllXQKbhgY52OxbeAqsuP5kE/mdWk
 bp8rBpf3rYcH1yrGBRVLXv+vefZz109Y7YYAvoBDy7LzLleBnvVVjJeAxLk3DoMRYygD
 t1KaL0/5cyp8u8xpdETKUMeF0/ypbjgZMDgQc+IQvfRoBId/4jtjZLfb5aNEbokmRiIZ
 mq+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728984791; x=1729589591;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eNz9E/ZbYToPEHGGNEmmAdKDEa9b78YRVmnC3SHI02Q=;
 b=AnKXpZ2u4ZkMRd1EF76hDiPfCyGRvZDznoungnot1M1lh3vb6PTn8ldjxuPgqewPW1
 HJ17PbMxz4UL+01juOf+jddlnuTeqpnqaL0jM/0SOsB/4tc5DCd59vdzQdsM9mw1D3do
 dyB8cOVmWU8ds3/xPtRO46+hmW4KDUsrlEvgJx3tdFU8W7kmMC2fO37xapEGubnvPiWb
 F0knxbB/RuhM+97mp/RqWd1jINJukcgxw2y4dAtSoFjyVIYCg04CXG9qiuimcx8H7Xcb
 O0WwtQkFkHAwkUMivpGV/Zq9QmApYhwRnIP5EsdRDqSLNILBmW8o4cBMZsz2sET0ag20
 GPsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0od/t++ra612pbnIHmIbI8gatHNi/E4DNlyVfxGMzvjNMogZQfEjGAxclHNgWNkmSMkV/XLRS9xs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzsZ3T5hNPpgOnRz3IjYs5NCGQ6ecFF8ltBj0WEccyx+XkmICmt
 f3t70rK9jSwf9VuvEumbADs0nNRQ/Gw4VZh8DEBKE3Z6uo6OmRVe19dCcDqcuHgr0rv/6DvkNAM
 5Q0ZwuGsJrVZp0sguipnQ+zhPCgqLZJNUkrfR8Q==
X-Google-Smtp-Source: AGHT+IEhghAevnU2eSa7UKlVV78niFZT5nALF0UAJU2RYBJo5PtnOPChegfHNGRHZRY4C8+wPSYjrt8wGBMXDy7nmA8=
X-Received: by 2002:a05:690c:4489:b0:6af:6762:eba1 with SMTP id
 00721157ae682-6e3479c1971mr120439917b3.20.1728984790794; Tue, 15 Oct 2024
 02:33:10 -0700 (PDT)
MIME-Version: 1.0
References: <c657d3e9-e4fb-4dac-a611-45655511e500@gmx.net>
 <CAPY8ntDAMq_oTM+ua0pcFroTiWkDyhXSj++oGxOq+ODajm8++Q@mail.gmail.com>
 <3f35403e-f42f-4936-9297-68b56818aeee@gmx.net>
 <20241014-warm-savvy-wrasse-ed984e@houat>
 <CAPY8ntAFzT4uBT47kDnDjEcSZXLonV-n_ixZ6L1_LAcfQPwS8Q@mail.gmail.com>
 <17f8f497-1238-4555-824b-b5a3fb699a98@gmx.net>
In-Reply-To: <17f8f497-1238-4555-824b-b5a3fb699a98@gmx.net>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 15 Oct 2024 10:32:55 +0100
Message-ID: <CAPY8ntBegA_L58s30F4FSO+=q78Xt5XA4kvYq38zAvsgR2DSrQ@mail.gmail.com>
Subject: Re: vc4: HDMI Sink doesn't support RGB, something's wrong.
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Florian Fainelli <florian.fainelli@broadcom.com>
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

On Mon, 14 Oct 2024 at 22:16, Stefan Wahren <wahrenst@gmx.net> wrote:
>
>
> Am 14.10.24 um 12:54 schrieb Dave Stevenson:
> > On Mon, 14 Oct 2024 at 10:04, Maxime Ripard <mripard@kernel.org> wrote:
> >> Hi,
> >>
> >> On Sun, Oct 13, 2024 at 09:57:58PM GMT, Stefan Wahren wrote:
> >>> Am 13.10.24 um 21:11 schrieb Dave Stevenson:
> >>>> Hi Stefan.
> >>>>
> >>>> On Sun, 13 Oct 2024, 18:19 Stefan Wahren, <wahrenst@gmx.net> wrote:
> >>>>
> >>>>      Hi,
> >>>>
> >>>>      i recently switch for my suspend2idle tests from Raspberry Pi Bullseye
> >>>>      to Bookworm. After that testing suspend2idle shows a new warning
> >>>>      which i
> >>>>      never saw before:
> >>>>
> >>>>      HDMI Sink doesn't support RGB, something's wrong.
> >>>>
> >>>>
> >>>> Can you provide the edid of your display please?
> ...
> >>>
> >>>
> >>> The failure is coming from sink_supports_format_bpc()[1], but the flag
> >>> for DRM_COLOR_FORMAT_RGB444 should have been set from
> >>> update_display_info()[2] parsing the EDID.
> >>>
> >>> Loading that EDID in via drm.edid_firmware has given me a console at
> >>> 1920x1200@60 without any issues, so I'm a little confused as to what
> >>> is going on.
> Since this warning only occurs on resume and not during normal boot, i
> would assume there is no issue with EDID. Maybe the flag get lost. I
> should have mention that X11 doesn't recover in this case and the
> display stays black.

Ah, I hadn't realised you meant it was only on resume that it didn't
come back up.

I suspect you're right that the state gets lost somehow. It may be
triggered by the returning of connector_status_unknown on the
connector, but haven't traced it back.

If I pick up your patches, what do I need to add to replicate this?

  Dave
