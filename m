Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 777E486B700
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 19:18:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 539BF10E3BB;
	Wed, 28 Feb 2024 18:18:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="TOwHYEYT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBD2610E3B3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 18:18:20 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id
 e9e14a558f8ab-365169e0938so159255ab.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 10:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709144300; x=1709749100;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yMuVBDlnhpO034F2/q+tE22z1XBw0OPkVpUXz7Iw1ik=;
 b=TOwHYEYT2eGXIA7h7hxxek9nuydtfn/CVLA0fXVSQNHucIxg+QNIWpppc72FbF/Ze4
 YQRs+8bXsV88iN73GzdEzlnqicqHljaHWk50hMnco5OV3X7IVEiLIKV5LZocKMrwfK3w
 Y9MKqH1LfiL0A5jztAGPIJUQcibGDXDYfMoLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709144300; x=1709749100;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yMuVBDlnhpO034F2/q+tE22z1XBw0OPkVpUXz7Iw1ik=;
 b=K6qnd228GBe94DxHVbHwu2gbEQQhm9HjKyCo8XCev8fZI/u513fVyX58uULvQvi5Jz
 Of+surbKamAjjeqMRk26OikY1rLbqJ49eqGh4x03NdZ0eytCKXjewurEkl7gavDYCtm7
 qib8abjlBz4cwnPgz7gv95utpU6+lJlvAfaAqojwLLbBHeEmR8oXT+0Y1qajJTgpHK7N
 jpaOytOHNJd+jQ2cXd/Fv3iXAKChgFTF2tYWbA3BNAQCeEV9QdfOFKccI7/qhk9AzjqV
 KQ3Waenpw+4QIjAUKBGSdgNLAb5dyiyBYsWftAbY3wuQ+Z8cUlGeV6Z5XR7NIB/h67Dj
 PKEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUX3XZ/blH+xBpNCvLu9dSD4CQ0PR3rBFI20xk3f0fiuSwEhbwBcrfpwn79MR3EjgWwQKnxusq4ZYbLnR6G4R/WkHgo15MN0pH6OpQjbSW9
X-Gm-Message-State: AOJu0YwNxj1LWgwddKB2EdLBYFYxIjLhHG9VPD+bvQJnIkW6MvxWxoRc
 qCJ+yvxrX1saoEm/WZAcTeduKwL/W/X3PW/3sMMSwyy+oZbeM36TumlDHhRSxg==
X-Google-Smtp-Source: AGHT+IHXEHGYeHKTpMNJ+KuzBh/Bght5BJMrKbIQmxnIMu1FTfUkGMBXH786Efps00aZM2tFe5bRbw==
X-Received: by 2002:a05:6e02:1e07:b0:365:102a:ee10 with SMTP id
 g7-20020a056e021e0700b00365102aee10mr154842ila.6.1709144299900; 
 Wed, 28 Feb 2024 10:18:19 -0800 (PST)
Received: from localhost (144.57.222.35.bc.googleusercontent.com.
 [35.222.57.144]) by smtp.gmail.com with UTF8SMTPSA id
 a24-20020a02ac18000000b004747f3fc39asm1951147jao.160.2024.02.28.10.18.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 10:18:19 -0800 (PST)
Date: Wed, 28 Feb 2024 18:18:18 +0000
From: Matthias Kaehlcke <mka@chromium.org>
To: Javier Carrasco <javier.carrasco@wolfvision.net>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helen Koike <helen.koike@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/8] usb: misc: onboard_hub: rename to onboard_dev
Message-ID: <Zd946sKywJNvIJq6@google.com>
References: <20240228-onboard_xvf3500-v5-0-76b805fd3fe6@wolfvision.net>
 <20240228-onboard_xvf3500-v5-2-76b805fd3fe6@wolfvision.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240228-onboard_xvf3500-v5-2-76b805fd3fe6@wolfvision.net>
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

On Wed, Feb 28, 2024 at 02:51:29PM +0100, Javier Carrasco wrote:
> This patch prepares onboad_hub to support non-hub devices by renaming
> the driver files and their content, the headers and their references.
> 
> The comments and descriptions have been slightly modified to keep
> coherence and account for the specific cases that only affect onboard
> hubs (e.g. peer-hub).
> 
> The "hub" variables in functions where "dev" (and similar names) variables
> already exist have been renamed to onboard_dev for clarity, which adds a
> few lines in cases where more than 80 characters are used.
> 
> No new functionality has been added.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
> ---
>  ...-usb-hub => sysfs-bus-platform-onboard-usb-dev} |   3 +-
>  MAINTAINERS                                        |   4 +-
>  drivers/usb/core/Makefile                          |   4 +-
>  drivers/usb/core/hub.c                             |   8 +-
>  drivers/usb/core/hub.h                             |   2 +-
>  drivers/usb/misc/Kconfig                           |  16 +-
>  drivers/usb/misc/Makefile                          |   2 +-
>  drivers/usb/misc/onboard_usb_dev.c                 | 519 +++++++++++++++++++++
>  .../misc/{onboard_usb_hub.h => onboard_usb_dev.h}  |  28 +-
>  ...ard_usb_hub_pdevs.c => onboard_usb_dev_pdevs.c} |  47 +-
>  include/linux/usb/onboard_dev.h                    |  18 +
>  include/linux/usb/onboard_hub.h                    |  18 -
>  12 files changed, 595 insertions(+), 74 deletions(-)

This does not rename/delete onboard_usb_hub.c. With a rename there would
probably be an actual diff for onboard_usb_dev.c instead of a new file,
which would help with reviewing.
