Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0549E9793CD
	for <lists+dri-devel@lfdr.de>; Sun, 15 Sep 2024 01:40:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57A2310E07F;
	Sat, 14 Sep 2024 23:40:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YNUN2dIL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3BDD10E07F
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Sep 2024 23:39:59 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-7a9a30a0490so360220585a.3
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Sep 2024 16:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726357198; x=1726961998; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KNiLC9yIqzSFrDj7dhKEamKTUs7tim6by4sA4P0KRMM=;
 b=YNUN2dILmw7cGC1OrazhIuuG7MPhms4yKUgFRO2ir0vzXm8WDV6Jy2w8sLB0LDqvSN
 mOwc7yGtRPa1aLCQZkhdL1bu+ONoHt6R4DkVauVO0hVbThMVEY+MXFsgI9Rvs2PUDo1d
 a2W0nnKrvut2M4ymkr72sURqoIVIglafc4jOn1W6TuUmIYYC5QCM+skxKW5qsjqTKC49
 xjdU0Im8Kf8oxmX2spW4dfVLl7BaiviowrG8QW5QmhkkjC6k9qYCRc7ICaBEKuM/kQ1u
 K/acggGExY+dJEabY4iN9ISBe4ZRsu9+udC4mM4r5523pxhPbI5VNr3oHFMFXY3yxcLE
 dqKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726357198; x=1726961998;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KNiLC9yIqzSFrDj7dhKEamKTUs7tim6by4sA4P0KRMM=;
 b=DVfRIqhpKNt7LxtIG0Jtq5JW9KHuT8C0xlHqFjMTTekWvPjYMJKUhRqo7XWuh1Orah
 qpha+bPufoCb8OOqNvSphms7VpsEQAd/LT6HxhwGT8YU2/gc1+9ypFSF7+G8OoSl5LPN
 vwGf2h+eeg0uwxKPATzVCLfPlNEeYrMyEY0c0Wjzu/zhHERdmPm2vU0HyXGDhoMnnrS3
 Qm9Bjopy3iREFgG3c3a5eUg2b52/V6Q1rg7iHzqenhdExuON2omyKa93LF02PEDaH2Eb
 yl1A44SGkd0f3tsvb//ZOa3QBS8xHtpdT2ZuReDC8flVugtL23D37H20Y1guP1qQLMHU
 BChw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnpOIC4+2Z3+beIJ8nWYNwP8IkSot94J0Yrelee1J+aEhWmuIyAAUfhlrxSlIijoMegStD0F3MEIk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXWTwYa8DG1w0FB2CutWuG1O1D5yld6n2mkBZcWCGsjSpGHo/6
 qcitv4cDOFqEDqRazbxirO4ASuDI2heu4fD3OcZjfk3FhyvNxKtJ
X-Google-Smtp-Source: AGHT+IFc0J5CoyQ8jeRWmCtEJ8yaJztt/TGB5Ou6Z8EfWoWRWpnOH/8UJPeuV8AFHaApQK4MhV6Eag==
X-Received: by 2002:a05:620a:2910:b0:7a9:b839:1e87 with SMTP id
 af79cd13be357-7a9e5f3d252mr1836226285a.39.1726357198429; 
 Sat, 14 Sep 2024 16:39:58 -0700 (PDT)
Received: from VM-Arch (ool-1826d901.dyn.optonline.net. [24.38.217.1])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7ab3e95e9bdsm112982585a.16.2024.09.14.16.39.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 16:39:57 -0700 (PDT)
Date: Sat, 14 Sep 2024 19:39:54 -0400
From: Alex Lanzano <lanzano.alex@gmail.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Mehdi Djait <mehdi.djait@bootlin.com>
Cc: christophe.jaillet@wanadoo.fr, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org
Subject: Re: [PATCH v6 0/2] Add driver for Sharp Memory LCD
Message-ID: <wasfy7vwlvw2kikj4szgj6m4pdiqhmkub4g5jg4wop2nzb3hzc@oo6mrj7q2jt3>
References: <20240905124432.834831-1-lanzano.alex@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240905124432.834831-1-lanzano.alex@gmail.com>
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

Hi all,

Just a friendly ping. Please send feedback whenever possible.

Best regards,
Alex

On Thu, Sep 05, 2024 at 08:43:58AM GMT, Alex Lanzano wrote:
> This patch series add support for the monochrome Sharp Memory LCD
> panels. This series is based off of the work done by Mehdi Djait.
> 
> References:
> https://lore.kernel.org/dri-devel/71a9dbf4609dbba46026a31f60261830163a0b99.1701267411.git.mehdi.djait@bootlin.com/
> https://www.sharpsde.com/fileadmin/products/Displays/2016_SDE_App_Note_for_Memory_LCD_programming_V1.3.pdf
> 
> Co-developed-by: Mehdi Djait <mehdi.djait@bootlin.com>
> Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
> Signed-off-by: Alex Lanzano <lanzano.alex@gmail.com>
> ---
> Changes in v6:
> - Rebase off latest drm-misc-next
> - Replace pwm_apply_state with pwm_apply_might_sleep
> 
> Changes in v5:
> - Address minor style issues in sharp-memory.c
> 
> Changes in v4:
> - Remove redundant dev_err
> 
> Changes in v3:
> - Fix file path in MAINTAINERS file
> - Address review comments
> - Simplify mode selection based on match data instead of model
> 
> Changes in v2:
> - Credited Mehdi Djait in commit messages
> - Renamed sharp,sharp-memory.yaml to sharp,ls010b7dh04.yaml
> - Using strings instead of int for vcom-mode in dt-binding
> - Fixed indentation of binding example
> - Removed binding header
> - Removed extra whitespace in sharp-memory.c
> - Fixed error handling in sharp-memory.c
> - Added match data to of_device_id table to be in-sync with spi_device_id table
> - Replaced redundant function with spi_get_device_match_data
> - Sorted header files in sharp-memory.c
> ---
> 
> Alex Lanzano (2):
>   dt-bindings: display: Add Sharp Memory LCD bindings
>   drm/tiny: Add driver for Sharp Memory LCD
> 
>  .../bindings/display/sharp,ls010b7dh04.yaml   |  92 +++
>  MAINTAINERS                                   |   6 +
>  drivers/gpu/drm/tiny/Kconfig                  |  20 +
>  drivers/gpu/drm/tiny/Makefile                 |   1 +
>  drivers/gpu/drm/tiny/sharp-memory.c           | 682 ++++++++++++++++++
>  5 files changed, 801 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/sharp,ls010b7dh04.yaml
>  create mode 100644 drivers/gpu/drm/tiny/sharp-memory.c
> 
> -- 
> 2.46.0
> 
