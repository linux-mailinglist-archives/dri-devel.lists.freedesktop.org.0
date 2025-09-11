Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA5DB53A7A
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 19:37:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF2D10E3E0;
	Thu, 11 Sep 2025 17:37:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="PzZgTEr7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C928110E3E0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 17:37:36 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-e98a18faa25so651005276.2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 10:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1757612256; x=1758217056;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5jVZWNLKcKM8wCphzFXQ/l/QW+Jhy7EgAiQZsEXF9kc=;
 b=PzZgTEr7fKc+GXn7YrhUKvjZKy4xmI5TeW7aYhX2AO9Fo/oXEKZ3Fhcie/85XEUSwT
 jNuJKnnJKio0RzFtkxXxsF31fctFqQHwEsJTIlI+HzfGWY91+2uG8v8jfF3z8l1lgUzw
 j6YDIdGFylOkovy2Hfxvp9b0EB8ALn5oLSeunTSHI6zUKEsPNrYm9SHl6Z6b92nSlO/o
 dUcJBufMe1c0mMBjqfgA9/CsEpgbC17FDWav9U0Qyk5gFbod4kfddMtadyr+AGFTc6Nl
 XlHtwhAT97+9PSNSBwjbr8nxEsc1ZzjdVU3223NoTlSLhvqkSB6+x9wOf0m8/MvYl76N
 cqkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757612256; x=1758217056;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5jVZWNLKcKM8wCphzFXQ/l/QW+Jhy7EgAiQZsEXF9kc=;
 b=jQn0fMHZo4+iPe82jweoo3s8XGNU4RJ+kYQNd3/ZQR+FX2WpxxoPn8H0aFu72rEj5v
 N6Wfgsz4XqO6SXH5CG1R4vy7X340LS0cmF4inCA8QDvu9U+MQu3O3Rl4UX6mrQzV20NW
 yXkupp0D8WS9xEkwKGXt2YNKbbRhrphW/dJjtVMr2YYsZAgJyJhVT+fHCoSDIB6kKDN9
 r3WLGjco4Flh63illFgQ9QrrhSjkRGx7NJz977csHF3X5piNNjHrY+U3mv5hAQEbeihE
 i+TeofJgbqIJB/Qf4GJjaALhXOUu6D/+YsM3HC0DJX4nkVvc9TQ8k+IUqGnqJtk3asWd
 n9AQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkYenOIPR4lMXqgNJ8nxb4ovmkpkR3rpp7orUkTZnvqo7aWKLWzLB9bP80ybHtxTersULJ7wlIhbs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEB+R1jkVBlK3EKrgi0OKo8B1YoQwFWSJ7X1Ms79gZM1aq9DO/
 MePTfP+DuWGPpcxUvTK9Ya/kClXSvMGMK/qgE5P/u8eH0tJPxEYNU2d1Cu8YriFvwksOnIMCtgc
 xoJg1NTYynFx0TrmP74UOqG1XwHwe/RTFtU3UKiY7QQ==
X-Gm-Gg: ASbGncuj2suiDRcZZ19tz7acCsRDRsWhQu+JAExnxRyRj5Wo2qOPLYThp0yGv03IOc9
 djXAHCCYdvIDA+iVMYFpPBVbX/ZjgZt2EGL51J/9irairetDW5JKK0xoDje9qagFaWR6oHUZHad
 tlzbYNHUjIw4hldP9qsETaLRNJMc9a3WBjgzXZOHqHB3gIm3ltg5WRPwlM/8P88IsJmiee3Ezlf
 PMCf4lhIZffRqIQXr6ShBceTHgDBsbUxOdgCRlMZNmAmREtkw==
X-Google-Smtp-Source: AGHT+IHg3z78/B6fI9f1AMjPO5oxiQby/zjwNbzluvzX55f2ZzdxIU/duCJf16X+pSWshaOiz1nVxZsPH9u3Xi8SEBU=
X-Received: by 2002:a05:6902:6c0b:b0:e95:325e:4b8 with SMTP id
 3f1490d57ef6-ea3d99ef88amr56711276.9.1757612255720; Thu, 11 Sep 2025 10:37:35
 -0700 (PDT)
MIME-Version: 1.0
References: <20250705-drm-hdmi-connector-cec-v7-1-d14fa0c31b74@oss.qualcomm.com>
 <pz5luqbagulactqp7h237apoostl64rcrnvmu53eauvtb6cqly@nsmzsvbfixrr>
 <bmbu6dfhr4i37fxlqo7ltalkzz6bocb5whuv34x437k3crie5j@ndtqjrv64n5j>
 <CAPY8ntD-q6nZcVJmo5OG_6U5cxdOVdwKLJChsQZd_ZFjCRuGZQ@mail.gmail.com>
In-Reply-To: <CAPY8ntD-q6nZcVJmo5OG_6U5cxdOVdwKLJChsQZd_ZFjCRuGZQ@mail.gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 11 Sep 2025 18:37:18 +0100
X-Gm-Features: Ac12FXyNwgL-u4JnPwi9yRAYSOfR42S_UZmT1-j1hRuLUlLyzC6xzIVWqjaTRcQ
Message-ID: <CAPY8ntAspTdWB6nNXrkNpZ9TYUtbkxJc_QB3ZmF5iGC31_U33Q@mail.gmail.com>
Subject: Re: [PATCH RESEND v7] drm/vc4: hdmi: switch to generic CEC helpers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>
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

On Wed, 10 Sept 2025 at 15:21, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Dmitry
>
> On Fri, 5 Sept 2025 at 17:51, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Fri, Aug 15, 2025 at 06:11:57PM +0300, Dmitry Baryshkov wrote:
> > > On Sat, Jul 05, 2025 at 01:05:13PM +0300, Dmitry Baryshkov wrote:
> > > > Switch VC4 driver to using CEC helpers code, simplifying hotplug and
> > > > registration / cleanup. The existing vc4_hdmi_cec_release() is kept for
> > > > now.
> > > >
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > Reviewed-by: Maxime Ripard <mripard@kernel.org>
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > ---
> > > > This is a part of the HDMI CEC rework, posting separately to let it be
> > > > tested by the maintainers.
> > > > ---
> > > > Changes in v7:
> > > > - Dropped all applied patches, keeping just VC4
> > > > - Link to v6: https://lore.kernel.org/r/20250517-drm-hdmi-connector-cec-v6-0-35651db6f19b@oss.qualcomm.com
> > > >
> > >
> > > Can I please get Tested-by for this patch? It has been R-B'ed, but I
> > > totally don't think it should be applied without testing on the actual
> > > hardware...
> >
> > And another ping to get it tested by...
>
> Apologies - I'll find a display or AVR that supports CEC tomorrow to test.

I've only got a Sony soundbar here that supports CEC, but I can
control the volume and mute status of that from the Pi, read the
status back, and monitor mode is reporting power on/off events.

A colleague is going to give it more of a test via Kodi when he gets a
chance, but I'm happy to give it a:

Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Sorry for the delay in doing that testing.

  Dave
