Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB1DA29B84
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 21:56:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E935B10E1D1;
	Wed,  5 Feb 2025 20:56:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Y0LJv8qr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B58B910E401
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 20:54:21 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5440efe97baso71831e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2025 12:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1738788859; x=1739393659;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gnfNJ31w8XMj5OUdUcMgE4H0lYz13gL6Ny9TiCxl+MI=;
 b=Y0LJv8qriG/8kI/nDKRzFRjbXzYBH9oaN1x8CpGVDIK22RqjXYPLLsS668gGKMVpIB
 kUpKhCxkkH7wS7wbAtEieh0XrXn5T0hJh7YnXzATmrfyQXb0gYQ/re44i49ucUStWqQy
 MpHQoZc6OH0P2TOiKqFnXgWCqyIkF5IWMbMEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738788859; x=1739393659;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gnfNJ31w8XMj5OUdUcMgE4H0lYz13gL6Ny9TiCxl+MI=;
 b=rZUoT2CsuguAmsCz+sEp4qk+lRYoONKP8XomEvvG/mWEwMTZvtSiQwQkZKC8vuRx+6
 XCnqI2GA43IbazK0YGF5gCSPlhRDY3eEionMHfc/uRaO/4g9xrkWMTB6B3Idx++ccTQ2
 AkkTMmDEyOe2O6xMNMkrF0HvD8o4wWF6CnuxEJCr1DkHAk+7P+/6phBxphOFtqoh007l
 Y1odMK5HrBxjrMuwhu0kVpiEEmQTL7ngvvMNNR6BeLNA0Zxlzk7kLHTPo2rABuHpxzbr
 3b45Glv+Y+ITpwtU7gdZAlL+LNH+jhqtH9XBrqP56dq54w826JpN476NwNySUJE+mU1m
 x/Xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYbgdlerYQnaSVxevTdCqA3HzpQNu8namj3kNwvMQCU5tAT0rMP9u5shoe281znAm8Ru6Ksy0TNPY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yza2KR8CkNPl4M/Ni3LO+2WlwFeq37Y/I4HmHm08SNBD9OPW4CC
 IY2w243UKR5MCxJwUFqzsI0BBAa1BPxbkoM0urG0dsJvATxTUyqbN+6n96fQoBaiFMn9UZjyprB
 +eg==
X-Gm-Gg: ASbGncs71yWW91ht60oxU98oqfN/q8DydMR6LpwAumvfivYDnVsUS3JNUWKTx6dTu7j
 awQjj2zFH7L7+yoXYmLVAxJfBGEFZgj7DynBwGcFv7PulRxLv3ld3DTXlFM2xhgCn5BYTw4CgLh
 m8t5f3cSox9Nz85zgr7SKyvJk1TDKrs6UNq21si5mzdEeuo2VTn8atdBN0hKKzy6tq3KU+lY46w
 8eXxpDUFduaUiuxnv6v6nibwZBgE/N1jfrpLY8i0Blyz4RpMi1fI81TZ0SREDUm8py+01ij1GJZ
 zSGIUzwJAFd61XhzurVtazqQb1pc/2UKi3ANZnb8mNVy5FtGxjV7tpQ=
X-Google-Smtp-Source: AGHT+IEoE5+L+mAmVR7yHjI91Vg8Hi8Y9ltm9Z4zz7QEyinaXuzPYQKLBtyTkPA9ltAda1I8c4C3MA==
X-Received: by 2002:a05:6512:3409:b0:53e:23ec:b2e7 with SMTP id
 2adb3069b0e04-54405a6c0b9mr1456885e87.34.1738788859409; 
 Wed, 05 Feb 2025 12:54:19 -0800 (PST)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com.
 [209.85.167.43]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543ebeb0a74sm1958864e87.109.2025.02.05.12.54.18
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 12:54:18 -0800 (PST)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-543e47e93a3so210919e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2025 12:54:18 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW4Sxd45YvXDKGFwU/enzqXcKkNDCU5bhslu2zGfqOgi+QX6UVWN3V4yQOEv8HPyG3ug0KYNJAk/kI=@lists.freedesktop.org
X-Received: by 2002:a05:6512:3c8d:b0:540:1f7d:8bce with SMTP id
 2adb3069b0e04-54405a6c098mr1369123e87.38.1738788858213; Wed, 05 Feb 2025
 12:54:18 -0800 (PST)
MIME-Version: 1.0
References: <20250201185439.157613-1-tejasvipin76@gmail.com>
 <CAD=FV=U+eg5P7qC9pMCQTc-eaPK2DgpC6xkqswFRc7FnQBYeJA@mail.gmail.com>
In-Reply-To: <CAD=FV=U+eg5P7qC9pMCQTc-eaPK2DgpC6xkqswFRc7FnQBYeJA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 5 Feb 2025 12:54:06 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V8xJtqYjdUmDZfdd9XP6r75-7-nDp1OL7pvE+wo0ZFDg@mail.gmail.com>
X-Gm-Features: AWEUYZk4A2PtUDWgKQwwAC8_vv9GiJYpZFEbo6pTOKrZFhPqND757eFC71ksSKU
Message-ID: <CAD=FV=V8xJtqYjdUmDZfdd9XP6r75-7-nDp1OL7pvE+wo0ZFDg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: sharp-ls060t1sx01: transition to mipi_dsi
 wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Hi,

On Mon, Feb 3, 2025 at 9:59=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Sat, Feb 1, 2025 at 10:55=E2=80=AFAM Tejas Vipin <tejasvipin76@gmail.c=
om> wrote:
> >
> > Changes the sharp-ls060t1sx01 panel to use multi style functions for
>
> Not worth spinning for this, but s/Changes/Change/
>
> > improved error handling.
> >
> > Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> > ---
> >  .../gpu/drm/panel/panel-sharp-ls060t1sx01.c   | 59 +++++--------------
> >  1 file changed, 16 insertions(+), 43 deletions(-)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> I'll wait a few days and apply if there are no objections.

Pushed to drm-misc-next:

[1/1] drm/panel: sharp-ls060t1sx01: transition to mipi_dsi wrapped function=
s
      commit: 7e3bf00047cdfe2b09e9a0d77b99bedc15406bfa
