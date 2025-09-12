Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82697B5437E
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 09:08:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E80B610E38C;
	Fri, 12 Sep 2025 07:08:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VOQqYwWd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF0C10EBB5
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 07:08:07 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5607c2f1598so1763150e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 00:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757660886; x=1758265686; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W7sa4dPPTPYoYuKBZuN8JhwzRLpV6rUI5E+79YIK4mc=;
 b=VOQqYwWd/lErihBg7wTLJNi1jFfn8FXpMyk5BLNYbh9n2vAtsSuVwj7pm4UMmG80/E
 y2ki9AE01jCBBA9XUKp9lYgJ7A3BN3x0oAA/oyS51h8Zjg+iwjvIN7T15LN0sVrhnYQE
 QoclPcYbNluO4DvfLTajlgcOkM9HkvFSru/uZ1wUHxK8rXGWm2tQW+lkXB0kc1oh8F3o
 z9iAL6+HmRnTy/2KzO4TEVYPH7ivmc4K3HWGVfsibxToWTXlyTq+yID/HpZEd7evXXvN
 5ttD4wR6MnvMWzUxLFCU3D+EMonf+qmt0JqbmHUL48mLJz+P1E2C30VG+zMXBof3TGxC
 IzIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757660886; x=1758265686;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W7sa4dPPTPYoYuKBZuN8JhwzRLpV6rUI5E+79YIK4mc=;
 b=N7oR9IEZZ5+VzGdcloc+ydX98tp+yivY6CGv/Lt2eB0+WFkvg0dC6oM41DspouRHnA
 Hvv75jHLCrqCGmT6ZaY3Z2ckWmiOnV9fzWXqRiJZHA616vDbT4NR0OIkxPQE6CSCSjGp
 fZPsesAdWrp16p5TkgfYv7hzBv3s+AHQT03XUYjdWlz7MwEXBhlB2ulzJiseiZ4zcT9P
 /6BfWaaJjEnu+IyrTbvdWYdpW3fVqu1gpL58Ne3tY6DYBKSIU6K+hJ+QaSkufqeVmvwI
 4EfHmYC02klJ7Y8Pd8u0aSCImZVgvOWT8aUxapY/HgKOaBUd/vrTY/3ap7aLpDjffKR+
 ZwNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfpBna8RGBTxLP2XppK0WrUgEulLJf7Gf59CLOR1rSUgWXCFbPtJyA0idXtPruO+r1zSHeOAi9qKs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSMcT7ejfvI11TWpA1+YpvbPwL++RMnAaiVPhGgU82l3Y0G8Qo
 WYZSz2/7OyJqOEQHSVaGkDyGMNGbNRGLqQCdqyl4B5VswC9rKjab15cXFL5LEgh3y08kpBU5out
 Gd3sLmP6w9bmu8vF76BEM5SHjV7N5agA=
X-Gm-Gg: ASbGncsCaTw9nhvUvG+XQy1gkUCWUpDnAaA/6tDxYuLFzqv6FE7hYgYFlP4kocQjKrx
 ZqKkYaHQ1cVPJLXxIlH/LZBcgrQyFIOSQitGFJpzz77J5hCkFAQvufvrH6UR6qM+b3brta31IxP
 3oAH+zS72S9ruAYldc2S6+vr240tp/Cpp7ueRVRlHws2qeMV2sqir87raXDvOX51BeTJ/yIfayA
 Z3uX809PwYb0QvN0w==
X-Google-Smtp-Source: AGHT+IG0a/RzAkySA0zv4GtRtoMgb7fMz40QqFaDmGNUnRd1h2GrriKeQPDg7VZPJxieR37sFPCZyvmxOEUrMUgnUno=
X-Received: by 2002:a05:651c:542:b0:32a:6aa0:2173 with SMTP id
 38308e7fff4ca-3513fc37bd3mr5450921fa.20.1757660885920; Fri, 12 Sep 2025
 00:08:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250831-gk20a-devfreq-v1-1-c25a8f1169a8@gmail.com>
 <4f3d9122f3fe552f94827b83a7dce5d3bbdc23e2.camel@redhat.com>
 <CALHNRZ-h2ee5pyOx2YDDBDQzFnXxDFX5EzhjX5+DT25UbKj1MQ@mail.gmail.com>
 <rvfjkkpsqvk3uedaahzhwrao7bgnxvbn7hdm6goa2bn6co7ctk@2hbiwwvn6y2j>
In-Reply-To: <rvfjkkpsqvk3uedaahzhwrao7bgnxvbn7hdm6goa2bn6co7ctk@2hbiwwvn6y2j>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Fri, 12 Sep 2025 02:07:54 -0500
X-Gm-Features: Ac12FXwznuijRqzCnopDIstfQghwKQCFmHybp4tbVUQN04WRkgdFV7WmBtzwMqA
Message-ID: <CALHNRZ_hZ5rjGpt4rDmMvxcBBcW2fK6Q2Z_1oKzj+eBi6U-1+g@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau: Support devfreq for Tegra
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org
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

On Tue, Sep 9, 2025 at 7:05=E2=80=AFAM Thierry Reding <thierry.reding@gmail=
.com> wrote:
>
> On Sat, Sep 06, 2025 at 08:01:27PM -0500, Aaron Kling wrote:
> [...]
> > I should note that I have only actively tested this on gm20b and
> > gp10b. I am currently unable to get nouveau running on any gk20a
> > device I own. I am trying to target consumer devices such as the
> > shield tablet, which use the android bootloader. I can boot the kernel
> > just fine and tegra-drm works as well, however when nouveau tries to
> > probe, it hangs the first time it tries to access a register. I have
> > not yet been able to figure out why.
>
> These types of hangs typically indicate that the hardware is not powered
> on, not clocked or in reset. It's odd that it would hang during register
> access on gk20a because nothing significant has changed in any of the
> related drivers, as far as I know.
>
> One thing that you could try is passing the clk_ignore_unused and
> pd_ignore_unused command-line parameters when booting the kernel. If it
> works with those, try finding out which one of them is causing things to
> break to narrow down what we need to fix.

The ignore_unused params didn't make a difference, but this got me
looking closer at the power rails. I noticed that vdd-gpu for the
jetson-tk1 is set to always-on for mainline, which it is not on the
downstream kernel. Mirroring that to ardbeg resulted in nouveau
successfully probing. One of my other devices needed a pwm-regulator
for vdd-gpu, after which it also probes as expected. I will need to
double check the rest of my devices as well. Is there a known reason
why if vdd-gpu is a pmic regulator, it needs to be always-on, or is
this another unsolved mystery?

This change looks to be working okay on gk20a. It does a couple
transitions on startup. I'm having other issues getting full rendering
started, though. Kasan slab-out-of-bounds in nvkm_falcon_v1_load_imem
when drm_hwcomposer tries to start up. Looking into that separately
now, but that shouldn't block any of my open patches.

Aaron
