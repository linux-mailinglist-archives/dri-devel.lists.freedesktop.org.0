Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB5DA6368C
	for <lists+dri-devel@lfdr.de>; Sun, 16 Mar 2025 17:57:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53A4610E1B3;
	Sun, 16 Mar 2025 16:57:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="Baqsm9zj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux1587.grserver.gr (unknown [185.138.42.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 490E110E1B3
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 16:57:31 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by linux1587.grserver.gr (Postfix) with ESMTPSA id 283CE2E094F8
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 18:57:19 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1742144239;
 bh=kq8pZLX+Ny0SbU2MreWxKEtohSNSFr7XvUB/gKUgfzY=;
 h=Received:From:Subject:To;
 b=Baqsm9zjtfccdT8sM6b8saHofnvEvtUQvkar6AIdsZNm9f3NAE47XTLEwfaiNw9pp
 DPQj7IHOQuHi8lnWMcgqNRNd8rc2Erc6KZw6osCimACUHaNH7ewiI0NPx+lf/UtrN5
 nG3vSyKEcKXa4ODjfNrqxKC0tYKZb1HRhgT6jdro=
Authentication-Results: linux1587.grserver.gr;
 spf=pass (sender IP is 209.85.208.173) smtp.mailfrom=lkml@antheas.dev
 smtp.helo=mail-lj1-f173.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-30bf1d48843so34732921fa.2
 for <dri-devel@lists.freedesktop.org>;
 Sun, 16 Mar 2025 09:57:19 -0700 (PDT)
X-Gm-Message-State: AOJu0Yyda1XFZftvdU1Eh8x3Z++6PzzCj9EzTE79Eh/RZ7FWmquNZyc6
 Y5d9lg9kfv1xg67lY69/Ff5dkBlPFWrOEkyfvpAGbPuXJNY4HF0yrVx/GwiYxPWK4cf0bMRjDul
 oRwmuyYJYQfkv/v0X8W8YSwLXkJ4=
X-Google-Smtp-Source: AGHT+IEOCK0iCLibCspqhpr0MBl5XsKfS2sj8C1C0BJ51dxoORCu2i2PnbRd4u/KBCXflGZKkTCo74I2QWMaxTNJOD0=
X-Received: by 2002:a05:651c:1507:b0:30b:ca48:1095 with SMTP id
 38308e7fff4ca-30c4a75e7e0mr44619641fa.7.1742144238418; Sun, 16 Mar 2025
 09:57:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250222164321.181340-1-lkml@antheas.dev>
In-Reply-To: <20250222164321.181340-1-lkml@antheas.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sun, 16 Mar 2025 17:57:06 +0100
X-Gmail-Original-Message-ID: <CAGwozwFnd2Qi+0p9mSR9vD3tNB9Bih1SvAO8oOOj9OTTdmeixA@mail.gmail.com>
X-Gm-Features: AQ5f1JottSL5_vJG_Nb3mJBRPoPflLwnrPlZ0CAuvwnOtHKL-_m6zTs6z_9zCLw
Message-ID: <CAGwozwFnd2Qi+0p9mSR9vD3tNB9Bih1SvAO8oOOj9OTTdmeixA@mail.gmail.com>
Subject: Re: [PATCH 0/5] drm: panel-orientation-quirks: Add 2024 OneXPlayer
 line & ZOTAC Zone orientation quirks
To: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: <174214423957.16045.1094218501477788684@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean
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

On Sat, 22 Feb 2025 at 17:43, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>
> A number of OneXPlayer handhelds have come out with portrait panels.
> Specifically, those are the X1 AMD and Intel variants, X1 Mini, and F1 Pro.
> For X1 specifically, they also have spurious battery reporting within their
> digitizer. The Zotac Gaming Zone also has a portrait OLED panel, so add
> that as well.
>
> Antheas Kapenekakis (5):
>   drm: panel-orientation-quirks: Add OneXPlayer X1 AMD and Intel quirk
>   drm: panel-orientation-quirks: Add OneXPlayer X1 Mini (AMD) quirk
>   drm: panel-orientation-quirks: Add OneXPlayer F1Pro quirk
>   HID: Add quirk to ignore the touchscreen battery on OneXPlayer X1
>   drm: panel-orientation-quirks: Add Zotac Gaming Zone quirk
>
>  .../gpu/drm/drm_panel_orientation_quirks.c    | 42 +++++++++++++++++++
>  drivers/hid/hid-ids.h                         |  1 +
>  drivers/hid/hid-input.c                       |  2 +
>  3 files changed, 45 insertions(+)
>
> --
> 2.48.1
>

I'd like to push this along. We already have the ack for HID. Did I
miss anyone on the list? Full context [1]

+cc Hans

[1] https://lore.kernel.org/all/20250222164321.181340-1-lkml@antheas.dev/
