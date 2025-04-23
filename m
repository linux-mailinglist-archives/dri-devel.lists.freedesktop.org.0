Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE650A98FED
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 17:15:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C7D310E216;
	Wed, 23 Apr 2025 15:15:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PIRBDESg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F5F910E6DB
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 15:15:06 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-310447fe59aso263371fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 08:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745421304; x=1746026104;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sH43wZDSA6ULvKiQsCxo4qPmgt69ZgTMoXJGnjlxiDE=;
 b=PIRBDESgZNJqHBWIVudwDIkWzBDrpD2B637V8SXc/b310vn7h2R9Sr7LYAoD6/BvY9
 VkvnQ33ksOXAvn5Xt6kaJUFtbfrsL4NQ/hENpkHTKfHCHbnyK8KgCgGHwyFsQVO4bvJk
 5iQGl3qfrpyCoO84S6VKGqe0Q2ON/XhdknBGKtFgh3w5Klu1zLFmrsFtBH35raZW4Bdq
 COg6np0r6bULU9e9G/liO9Lg8lqj3p7ckenQfpMvINx2b05A9AUBTMN0o+FtAQbQzgYX
 UYprIJlAFENoStD3ZoGbQ+iMDViG38OA8PtF02h11bAmFaI/U5yGioPfySBDU6vVrP75
 E+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745421304; x=1746026104;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sH43wZDSA6ULvKiQsCxo4qPmgt69ZgTMoXJGnjlxiDE=;
 b=o5YCXIE1XmMGjHWwbVi/GMpJ6+L8ooaxnkHZn2oEc5JszSpvUr4S/sEDem9vEerFTd
 bMMJxKTqZ73t5rm02KfZ1+I1cwuDXf0bCdTjo6DjvwZn0tFAO/J8w3C7lvBtFGDtpG9w
 CFf00BcjnFOH0gVhxXNI4eb60zeznhlU3as7ogkl38PCgHiGQkYGcvmfzrAhLI87X+F4
 TPfpj15LccD5DdnwPaKVwLzEUbBn8sxA7W6WdOHAal04c3Kg/1XygiSfKWvhUT589uE1
 zQEgxZn14tvYaQnZbZpROma26TcW/OyQR+gtZRlqOcyUKTcazmLsUHoKiRzjMC4F9NRt
 BWCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCqnbijUAk9Kx1+btemzEE7YvOpsf2RaA6X3D6K++fPTaaFoWkj9moJOJXnnMEjrP8Z/QJRPKTf1g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvZk82o+6s8LkTZ1e13qgRDQMBQVVizYrHsntl74baG3QkK0P/
 Pur0F6aDH2Y+8b3Gr7HVfiVRCRTjcTHqJsqaW6rgRHWKpjA+6Au+X1KHf7IrcGdiwLhs0pJwja0
 CUAo9moz4y3/9mBR/QY6d3WJAYYjlCCIrGT5wbg==
X-Gm-Gg: ASbGncuuX3pbeYhq/okaFhz3KwjZq0ocaR4vlEdR5+lLBvb1L/JTK+VdUFNNxhM9bgw
 mnx9QOWFy/PKeHQLT3RjIKVNGWLsNLQXpLsjl3HfYHb9BGgjhYzkoEwzaMu8pzu35vYeyGx+gZI
 X1T2SCZUmxwP+ZE3l0BiO1+NBpaP4RVwyG6g0Mksj9JzeVIAyLVR0rpg==
X-Google-Smtp-Source: AGHT+IFrc3N9fcKjWkQwInkGwP1iuM17+E4Bour+4L9YjNC2svIFlMVYhIXA3SO1RVqWs6dRS/QAl2y1mWeHhZ5nAD4=
X-Received: by 2002:a2e:a914:0:b0:30b:c91d:35cb with SMTP id
 38308e7fff4ca-310904c99dfmr62404951fa.4.1745421304301; Wed, 23 Apr 2025
 08:15:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250408-gpiochip-set-rv-video-v1-1-200ea4d24a29@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-video-v1-1-200ea4d24a29@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 17:14:52 +0200
X-Gm-Features: ATxdqUEaDlHUdTm4mGFk2lweVXhbcBmvMoXiFs3_P4h8ihoSePSMtu8I7HWwBPg
Message-ID: <CAMRc=MdYQ9zsOqiuVTR4vJ-D6YZ5gsxm6akQXaK6AoD_XFO0hg@mail.gmail.com>
Subject: Re: [PATCH] fbdev: via: use new GPIO line value setter callbacks
To: Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Helge Deller <deller@gmx.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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

On Tue, Apr 8, 2025 at 9:42=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones.
> ---

Gentle ping.

Bart
