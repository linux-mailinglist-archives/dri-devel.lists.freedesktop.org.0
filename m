Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C45A34DCA
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 19:36:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EE3610E109;
	Thu, 13 Feb 2025 18:36:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="g+eBORRU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A65110E109
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 18:36:51 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5450f38393aso1128087e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 10:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739471810; x=1740076610;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6MXgt8K1fqxe7oAyzFvQ5u+fTJ1UmsA6LGu4qS+I3xQ=;
 b=g+eBORRUgBis5qlhlUeRYHWffb/HSnimZJb+iOveH9xix8ZZ2xZrwViiYCgUPKl3nU
 flwyU7Od1Ix+6FVQ8oLrOf1n6elxdYPxjzjznn/fjB7EyPMY29qu4qnJCShiRd2hz9M6
 I/PY2PwVKgVRmkczQIXMCdgBVajEWfBz7la4r/M2oqVi7fTblGpXVxQ685nsT6TKGXSx
 3ctOkdr7jDJfO2lXARwxMsWV7vqJbBBJ6OMsCc0MEXoM4Qhwy7rVkxVQvBYcA8zzOofa
 5ylNxQaMcxhxfXjAdtd0a4ixvC/5055F+Jic9yHndvAvYJILfKQsQDHC6s8Koj730NUt
 e1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739471810; x=1740076610;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6MXgt8K1fqxe7oAyzFvQ5u+fTJ1UmsA6LGu4qS+I3xQ=;
 b=nfEx/+2d58e8ImhjhWLVE/BDb1lbeX7ywI0Big0pwa3Ro5QdgM4GU3hdz6R67OVf1i
 JVV+mG9LD3+xirg0IHsY41xiKxoHOEPyUKzTJD4BL60INOaDJNmWhfO2IksxqJaYS7Cn
 THHoaNTa2LEOC9hmRiojJfEkNlSvJHdsLV3nC2DAvwzqBBv+Hdz7vE5MNXUpb4mJe9wA
 /N5aJskroDskX/AZIN1w8WS1p+Rckr9D3rAKX44kghC7XFHXXgqXqMm3USLrwZHuVnjF
 4yMoRqc3rggNCZqf6SQKSOLUU6W9nodjgay31GGESfrhxl4UM06dZtpgTQlNIiF+mVY8
 UCZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXR3jCqKTTr0hE//4VQWgpBlLIaVJzjCPD+JVxHY/W6B63NlF+yVx+ub4pxg4sZTWr9oHX8gPdlAYI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3KWCiXn9g+WAT+qgHpFRapOf7XK6VkZvtf45RGqlfAW8Hi+wm
 ScYMsd2/ntk2osi9Th2qav3QOt5RwVrKpQqSKQ0FnxmxJz0nbVmlzAHnOe138q4lyNZH6kevIC9
 7COaz0ihroTSU0CvlhLpQTA97jna8hrI1Dx5aVw==
X-Gm-Gg: ASbGncv7CZBZus8BRK8tFzLNGP3PHZT2awGuG7XqZ+poEvKLaQe+MS760BNKHrjvDLR
 hJ6xBiZX+LAWOb8LVPOJSocCrvI40TaAzAv2GxPaDW88sSdVAtVIteuSfbKjjvaguYeH7arq+rN
 eojz3lenRFSwfOrHfnMbDp0PwVibRX
X-Google-Smtp-Source: AGHT+IGS6rZ5QoysfkI0qHoJmFvWRDPx9d8qV86s8a9//PI16K2BiXEPn/UKdP9YO5UDgyQ2advyGUV8KL3E064dBuY=
X-Received: by 2002:a05:6512:1195:b0:545:9e1:e824 with SMTP id
 2adb3069b0e04-545184bc12fmr3451856e87.48.1739471809751; Thu, 13 Feb 2025
 10:36:49 -0800 (PST)
MIME-Version: 1.0
References: <20250213182527.3092371-1-andriy.shevchenko@linux.intel.com>
 <20250213182527.3092371-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250213182527.3092371-2-andriy.shevchenko@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 13 Feb 2025 19:36:38 +0100
X-Gm-Features: AWEUYZkqCv_yLp89wB5ocJkqXxJ0d_HsrRMQvT3Q1hOD30OWbUeTKkdx_i3cu5E
Message-ID: <CAMRc=Mf0MMKB40gC1hJLwY1i1Bjj+aKKDfFN9sYUzG_Z5Hu1iQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm: Move for_each_if() to util_macros.h for wider
 use
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Alexandru Ardelean <aardelean@baylibre.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Linus Walleij <linus.walleij@linaro.org>
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

On Thu, Feb 13, 2025 at 7:25=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Other subsystem(s) may want to reuse the for_each_if() macro.
> Move it to util_macros.h to make it globally available.
>
> Suggested-by: Bartosz Golaszewski <brgl@bgdev.pl>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Who would pick it up? Should I take it via the GPIO tree and provide
an immutable branch for the DRM tree?

Bart
