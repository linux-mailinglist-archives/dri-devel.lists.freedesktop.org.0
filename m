Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FE187C2F5
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 19:44:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B98410FCDF;
	Thu, 14 Mar 2024 18:44:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dK0zyDEK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48ACD10FCDE
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 18:44:19 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-5ca29c131ebso892642a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 11:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710441859; x=1711046659; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kJz+3GphfQRjGfzcUODxvqODVcMOmDoo08SCKA5W6Co=;
 b=dK0zyDEK9BRZNqO0OVBiCPamVmOyyYFi9mFU8aktsO7c4eTGsf1XxarlDw8yf5Qhim
 kVfy2+/8ACk7H4mARnHgsyMYJnfBdfvwLxSPdgKAWC4g6y4OwGrKtVIFdzfzYdu1RPn6
 cmSh3d5TOO43KE9HODMXAAuvgjykp3FNvY+FRFA2gcNptLSbDXAoA3GN+Lu1FzgrpZsM
 wzmcNS+RfsgVGPxDJP0ptU6bqzCSqVITTCWbK8N3sFuM0i4rcJMqtnOTl7KokzGUXfXz
 sJfB3atDGAzOcO399CaIqwYmXL17J5kxJZKkkGq441a59VgTiS+4X2ljSpM2b4vkHoN6
 WW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710441859; x=1711046659;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kJz+3GphfQRjGfzcUODxvqODVcMOmDoo08SCKA5W6Co=;
 b=IGXATTI74ikv1CCUFvgQ2Cp6SUHysOnsdiQgeHsoOzMv0Wjfn6ER6WBnGCz4b6xk8/
 0BY6kdNx7R36+TZx8Zgtu/r3s5ttBYTdmseTKjxKJ9YVvdm8/JOnFlqcfzSeXLJD3606
 Zu51k7P5WlVdD9luRtl+7qqE0ccJpUa9Eu+TcHIWxvjCouJ45aApLfHwIGKR5B2/6Iv3
 2IlMYvSpdveYlPfElv0FCShRMrNEi5m5YxwXQY0nKT5Epwms1DTdg6Jfav3Ci5dJqqDr
 p7EwgiyNHwCjmKEaoGLNUIsZ3tSvhVdb22FZGF9k5AbzrM6tRKgrKVBqsugG2w4rQNY9
 uRew==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFGHPNAJdarFGpZJtcwCm0FU20TZk+ZVR8FYUzoYKWgPIbkQg6ci6L3emhJ2QIXplAYnLtfHv7eH3Cyq1uF/1G1eyRbKh8kvntk635anW1
X-Gm-Message-State: AOJu0Yz3bZpGvt/3WQwrsXUcHvOTBta10cT6npdH1x/x3mJEvGB/2DG4
 G99rEK68xO1QTs8u+kr02+iaogDAU4tkZUr+ub8cnT8okUhJnSroZgbHKmFSbWdZ/i3RSYfbor5
 gar+Or77Fb0oHRuVU4/vFWCRCSeE=
X-Google-Smtp-Source: AGHT+IHVh0RTfRsRb9qBzH00kDp5190hZcjprlGA9pYXBm6DQD2MCRakmxgYPKjHRPex76AnjnKvRQ0FLazeWULWWyg=
X-Received: by 2002:a05:6a20:9745:b0:1a3:17f0:c4f3 with SMTP id
 hs5-20020a056a20974500b001a317f0c4f3mr1010234pzc.35.1710441858697; Thu, 14
 Mar 2024 11:44:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240313154857.12949-1-tzimmermann@suse.de>
 <20240313154857.12949-2-tzimmermann@suse.de>
 <CANiq72=5V_XChzDhaaWNC+B4LP7gqivPZj5Y10qqS4SkQTGB_A@mail.gmail.com>
 <20240313175434.GA96726@ravnborg.org>
In-Reply-To: <20240313175434.GA96726@ravnborg.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 14 Mar 2024 19:44:06 +0100
Message-ID: <CANiq72k0yhmEh3720HBDaE8dJt6wUNrcxCopbNvc096DJhQsrQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] auxdisplay/ht16k33: Replace use of fb_blank with
 backlight helper
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Andy Shevchenko <andy@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, lee@kernel.org,
 daniel.thompson@linaro.org, 
 jingoohan1@gmail.com, deller@gmx.de, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
 Robin van der Gracht <robin@protonic.nl>, Miguel Ojeda <ojeda@kernel.org>
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

On Wed, Mar 13, 2024 at 6:54=E2=80=AFPM Sam Ravnborg <sam@ravnborg.org> wro=
te:
>
> The driver does not set BL_CORE_SUSPENDRESUME so that part is a nop.

The driver may not set it now, but it is still not the same logic (and
unless I am missing something it would not generate the same code
either, so not sure I would say it is a "nop" in that sense).

But, yeah, I only meant to say that the commit message could be more
accurate (e.g. mention why the difference does not matter) -- that is
why I quoted the message instead of the code. Apologies if that was
unclear.

Cheers,
Miguel
