Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5919485FBEF
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 16:11:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C710810E96E;
	Thu, 22 Feb 2024 15:11:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="E8RlOOzj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D84F310E96E
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 15:11:26 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2d2533089f6so25422731fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 07:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708614684; x=1709219484;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+1MyTAa9W6rwmrz4X17WTkjYYC8wuvxkD+qfkCmD8gA=;
 b=E8RlOOzj+fvUj6RTK9I62HdmZUzcEaos4LoKkR1vVmcLQRmnRcHD4lHyTi2vSBW65V
 XjrmxB9U3l7Z9Kd66FfL0/fh7nUZmlnrD9UqikDPmqmJz0XZazLDqV8gXBlV+fWRwe6t
 ja+rkGGR9bP/rrid3Pmm85+KGq62zvsxjjXZtQCXJIS7fcXP14VS2qakSyYvVHyBJJ/R
 O60ERtOIlxte7f1WpGIDCADYYcWgyFLSy12Lt2Noa2Nq8jrZFJ4JDD5lr7vu36BkmlNl
 nWMMND4Iklys4gm0ALYr+CmMjbzRbH8q65J6UfJLBuA8twtKVXsQH5czPMVIODxF+qvZ
 ua3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708614684; x=1709219484;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+1MyTAa9W6rwmrz4X17WTkjYYC8wuvxkD+qfkCmD8gA=;
 b=dU+VuADixBDHmv4yPsUbKADbQa2oqBOdqR8Z4q67Qwaoxl613aZIg2s9Con5V3HSsF
 fcDDf2WHFcehIw2oBO0ZhDXZ3p3mrPzgqp0FhCfF3Z1fa10spdXH/3s57LFXMAmW25Nt
 tppmPYkZP/oJnqtTyO3msyADcGzS/dgHueLYe6tdb8Z8SZdPWCGkjQyMOuLdhH4At053
 /B5WlLraz4r8tDS17dIPMghxf3MZyJ7yEPVNP8kDTDSSJwnJhN2pEKyKeLZPzGgzNNk/
 l++gvApL7o38FzNUZujI7kawMd1p9SzWQpX9SlDqyqKD990CH+Nzu7FuW6oqtN8UFYjU
 YvTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqYR7vfqxBroA2D2chuVd2ghBeOVYG+ClVjLG6vHDTepjN5Gr6LvB8WhVUIWbmXLDcMlVUbwH9srOWMf7QWtvPeWkzUvfm89vXl3voOhBE
X-Gm-Message-State: AOJu0YzKlOPHkY84prOwGYu6bJC1cHD/QaqcwCfhOfpVmQ1OCDO8GVw4
 IhtFRsy+jOIoCp7+4cwl1NungZNFXHlbzZiHaTBsJbjfceZfeOznDVxuFf8cotzS21z49Ov9cBX
 5vrjEs3jm2MQzckpudMesxOSfnnyrRziMJQsRhA==
X-Google-Smtp-Source: AGHT+IGw3hbqPWYN/3vfhhQBFzrTvi1PbeoR9WvH0886TzS1KyGrr602I8E8lLCB6pIuc8bHxZF8tDM1xPYr0gG8zd8=
X-Received: by 2002:a2e:b166:0:b0:2d2:6002:c239 with SMTP id
 a6-20020a2eb166000000b002d26002c239mr1510902ljm.3.1708614684451; Thu, 22 Feb
 2024 07:11:24 -0800 (PST)
MIME-Version: 1.0
References: <20240222145838.12916-1-kabel@kernel.org>
In-Reply-To: <20240222145838.12916-1-kabel@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 22 Feb 2024 16:11:11 +0100
Message-ID: <CAMRc=McWhC0ZdR55TMkkdVov=dwT0=H-4_c4J-bq0quRpvyoBw@mail.gmail.com>
Subject: Re: [PATCH 1/2] devm-helpers: Add resource managed version of mutex
 init
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc: linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay <ogabbay@kernel.org>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Aleksandr Mezin <mezin.alexander@gmail.com>, Jean Delvare <jdelvare@suse.com>, 
 Guenter Roeck <linux@roeck-us.net>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, 
 Sebastian Reichel <sre@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-gpio@vger.kernel.org, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-hwmon@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
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

On Thu, Feb 22, 2024 at 3:58=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org>=
 wrote:
>
> A few drivers are doing resource-managed mutex initialization by
> implementing ad-hoc one-liner mutex dropping functions and using them
> with devm_add_action_or_reset(). Help drivers avoid these repeated
> one-liners by adding managed version of mutex initialization.
>
> Use the new function devm_mutex_init() in the following drivers:
>   drivers/gpio/gpio-pisosr.c
>   drivers/gpio/gpio-sim.c

Yes, please!

For GPIO part:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
