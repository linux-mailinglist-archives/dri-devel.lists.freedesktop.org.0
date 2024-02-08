Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF55B84E1AD
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 14:16:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B260810E74C;
	Thu,  8 Feb 2024 13:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KBDk+ko6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F3710E720
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 13:16:00 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-1d746856d85so14057415ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Feb 2024 05:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707398159; x=1708002959; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D8Dp3BKeiZZKDAqJdXYO0Ke5gALNhbM/RCCF/9rM4yU=;
 b=KBDk+ko6EuMMAeow700Iw4GR/zb0xspaaKV9XMAet/5qChTWEblWoE3R4ogx2vIE3A
 d4t3YbOliSicrfw745oDJqLueWQqnSZSqStXdHKAusfBOH8PIjLFfYC6mlwDVdnF3TYN
 O9v442/heU8dpkOjlMX1WlkBz7Xrj11VI3M+rHIXqVur8Apc/WVODv8iap8VX1ibEvoP
 W1EPHJkbN4ewSbqSI3cgGPaVeLGnhIcxiWWNf6pjhEZdb3lUXPSSDQWVspJT4r47UWnH
 ocQ6cuZUGcjlvfpQim+aDQkX2PswpRtEHGibwuN8NYjGe1QK9g6GztJvBCQpcAGwIv58
 zCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707398159; x=1708002959;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D8Dp3BKeiZZKDAqJdXYO0Ke5gALNhbM/RCCF/9rM4yU=;
 b=Eoi1rmwYByK+ObsVphaCttgSi2+c47qvOqJ+vKxPk3h/3pqcVKbn8dFs7hEoqBv4pF
 cZwqvcPzxwmHXKSNvCh3yDh0pf8KAqFXOExzPrKom8a+8VeCz5K+hEYbdSAM7gV/e8Bh
 KIu1cn+rOWWS7UXVDht4p7xcfyuADnU1e3nZWzHOZCwibwtUgdxJKSkBbxcjA1N2//VK
 qQLEZRvAJg6/J7y7R5J5mshMNwpHOwIqpartJ6UTrwCKcUHKRJrnOleJ6B3vxo1XXMXH
 eNWHhLSn870qyPaOQ97MHBeYuVY3ORkYvyVRF4jozW61rS0OBPLPVdvh5AdT6lFu9dOZ
 xgww==
X-Gm-Message-State: AOJu0YxYveadWLnNKABkYGHei94xreIBEnXVEamivMUdsz1yceQQCpXK
 hldh8+dwCo4C5XuFH/3nsIgipSQfhIJc6JQ+RT/EcjpzFf44xwNnkYpqKsR9QQ+YqgO4XCOmx4r
 H6xNmdyZHFiLVdaNzkpTJkCDqwNI=
X-Google-Smtp-Source: AGHT+IE/CAKMPbroR8bnQix8tNmZwX1tZA2jxbhk7gQBcadNJRAkSVcjp7iPkE/azE/A4cvEvq7A64+NprUUb0rHG5w=
X-Received: by 2002:a17:90a:e2c2:b0:296:f9e9:5d45 with SMTP id
 fr2-20020a17090ae2c200b00296f9e95d45mr1709115pjb.32.1707398158977; Thu, 08
 Feb 2024 05:15:58 -0800 (PST)
MIME-Version: 1.0
References: <20231212033259.189718-1-aford173@gmail.com>
 <20231212033259.189718-2-aford173@gmail.com>
 <CAHCN7xKKMzOtVaEXzgTgsO4yZF0JZ6=o+TFJOeTCza0fMGss2w@mail.gmail.com>
 <e2688a01-47d2-4f89-ab92-252f378d37ba@kontron.de>
In-Reply-To: <e2688a01-47d2-4f89-ab92-252f378d37ba@kontron.de>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 8 Feb 2024 07:15:47 -0600
Message-ID: <CAHCN7xL-a9EK0Zk4K8k4Eiktsop9+KN34rY=yOvjN_==WTqULw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/bridge: samsung-dsim: Fix porch calcalcuation
 rounding
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: dri-devel@lists.freedesktop.org, aford@beaconembedded.com, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Michael Tretter <m.tretter@pengutronix.de>,
 Marco Felsch <m.felsch@pengutronix.de>, linux-kernel@vger.kernel.org
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

On Mon, Jan 29, 2024 at 2:17=E2=80=AFAM Frieder Schrempf
<frieder.schrempf@kontron.de> wrote:
>
> On 25.01.24 19:44, Adam Ford wrote:
> > On Mon, Dec 11, 2023 at 9:33=E2=80=AFPM Adam Ford <aford173@gmail.com> =
wrote:
> >>
> >> When using video sync pulses, the HFP, HBP, and HSA are divided betwee=
n
> >> the available lanes if there is more than one lane.  For certain
> >> timings and lane configurations, the HFP may not be evenly divisible.
> >> If the HFP is rounded down, it ends up being too small which can cause
> >> some monitors to not sync properly. In these instances, adjust htotal
> >> and hsync to round the HFP up, and recalculate the htotal.
> >>
> >> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de> # Kontron BL=
 i.MX8MM with HDMI monitor
> >> Signed-off-by: Adam Ford <aford173@gmail.com>
> >
> > Gentle nudge on this one.  Basically this fixes an issue with the 8MP,
> > but it's still unknown why it doesn't work on 8MM or 8MN, but Frieder
> > confirmed there are no regressions on 8MM or 8MN.
>

Inki,

Is there something you need which is holding this back?  It's been
nearly two months since I posted the initial patch.

Thank you,

adam

> I only tested two specific display setups on i.MX8MM. So of course I
> can't confirm the absence of regressions in general.
>
> Anyway, I think this should be applied.
