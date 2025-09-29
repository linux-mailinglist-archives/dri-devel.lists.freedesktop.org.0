Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F26BA8CC6
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 11:59:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD30A10E3E2;
	Mon, 29 Sep 2025 09:59:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hOB9jE/e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 830FF10E3E2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 09:59:18 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-72ce9790acdso50226137b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 02:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759139957; x=1759744757; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2KUdznDw5vZ05JufQlJyZkuSTNllnaQhlyyX0vFY+xA=;
 b=hOB9jE/elYI076zJLp4XJZ/S94IUDS2xrw4Wg7+xuBw9/IFUi8uGoo3A1g0psZUVv7
 QpoPqTIV1RiXhWkoV5BcvK8L3qF52udiYmG0dx2tgsQt6bTXB1cZgwSjclqKtixoYSgm
 BuPh2N5Q0kJUIhTCCEBviw9jlYOG4Xu6eu8UMS98pJMhrUHuoamL+G8FORI7Qdnv9RFv
 nsxjJqwpoJrqeM6Z9lotj+QmCP2YMpHdP0M+dIB/D8i9iEz0BJh9v7/P3L79PQ0Z+igb
 YLmHDEem6ALISQDufjhuKeQbxP6hG6Z4OoBvinEuOvuzgemQzMYAMcENfS4ohPzcEsxH
 J9FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759139957; x=1759744757;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2KUdznDw5vZ05JufQlJyZkuSTNllnaQhlyyX0vFY+xA=;
 b=Hop2Cz62gI8do3W+PUi3Zg1cdYiPqEMbzOnRYIOexxWV3ZtIQd6lPej75HxET99T4k
 k+HYFbU+6jafaPLuVSCblLtyg348jJOp+CbQ+RX/KFAI8qEthQlX5S5Mb4zaRNRE7rW+
 t0piX0RXqhk5yiVwwSekHkHSkzAWby6tg4e4t1jwB6ZE9gXAzRIkGv/pWUX2uGXj+Nl6
 AaHt5JAhT6MZS4/tmL/wQ5FcePUHLzCblLezA/ocTrV5VkgItuyj8aAGatFwtAlDmgSL
 hyYAeeP9vfJobRS3jCoYe7A4GaW3aFsKzgDhx7b1wpjhnwCIXqq38Pb/UQgdX6K+n0Af
 tCRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzcUGjMgOGDDbxlZl3UjJPAmhn3EnDB20UXYVlUYBx8lX2exsdgwW4CZBPyEPB6WrcVHPKhetX1ww=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6yejs2s+fybUO9RlfR7V2xzxA63IFVHZedMjDEyWbt/s2/xT0
 D0gxVQpiyg90ktkXh/coQL/9gNPDkJM7dy99Gf0AISNU2zi0QWDRxACqHklzNDmDHw3rKm8cBN7
 edVFFXuoRBYwRBuLG2ytWDt/5mgiv3/DKFcEfshnYxQ==
X-Gm-Gg: ASbGnctQPPou//HsPveZ3gKvcEK3JouMG+iAK8xKaoNcly69W0J+iGXHMP6HoSSlUjz
 24KInIYvpAMTZaXnsOmgdrtOxoxZOAYH/+W46h7fdFRFxFOTI+YbMtpVBO05ihd6pOe/tOo78n1
 lBva3QQKH8gCYouqpua3JxVItBvwhW4NzyczOnxD1PNxQ+rajaFyKVyPKnOjkRvjpbGsdxjN7k6
 MEAyL1m
X-Google-Smtp-Source: AGHT+IHKB6dZwmkkiRTmQMJ6qqV5u+Z5RUcKikaK+UuufgwTUJ8RoCQyTBvf2kQBGXi0WQ0jZXHoQTtqUIZWVWUBjSA=
X-Received: by 2002:a05:690e:1a4f:b0:636:f1d:e26 with SMTP id
 956f58d0204a3-6361a8734e7mr18613222d50.32.1759139956833; Mon, 29 Sep 2025
 02:59:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250923-mt8196-gpufreq-v4-0-6cd63ade73d6@collabora.com>
 <20250923-mt8196-gpufreq-v4-8-6cd63ade73d6@collabora.com>
 <CAPDyKFpLNJRRxWPm2Eye+Fs8go-LNwWGzPUPPKmNVJkyK5N3Dw@mail.gmail.com>
 <2015216.PYKUYFuaPT@workhorse>
In-Reply-To: <2015216.PYKUYFuaPT@workhorse>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 29 Sep 2025 11:58:40 +0200
X-Gm-Features: AS18NWDi6KooeuuBdFZYN2-L6gygoxiX5visVgVu6hIAQ09WtQulOO0qEvr47Zc
Message-ID: <CAPDyKFoCPkNsbq8s3d6cQXxfFhiYH1kjrocNdq8=v+g+LY8c6A@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] pmdomain: mediatek: Add support for MFlexGraphics
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-hardening@vger.kernel.org, 
 linux-pm@vger.kernel.org
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

[...]

>
> I actually have a question about a mystery that has been puzzling
> me as I work on v5: when unloading the driver that uses the PD
> (panthor) and my driver using `modprobe -r panthor mtk_mfg_pmdomain`,
> I see that sometimes detach_dev is called with the pd status
> reportedly being off, but according to my own power-on/power-off
> counting I hacked in, it actually being on. It then proceeds to

Yes, ->detach_dev() may be called for a device, when its corresponding
PM domain is both on or off.

> call my remove, which results in three splats from the regulator
> subsystem as the regulators weren't balanced with disables before
> they were freed, which isn't the main problem but more a symptom
> of the bigger problem that power_off and power_on calls don't
> appear to be balanced by the pmdomain subsystem when a driver is
> removed under certain circumstances.

If the callbacks aren't called in a properly balanced manner that
would be a bug in genpd. Certainly.

>
> Did I run into a core pmdomain bug here, or do I have to balance
> the power_on/off myself somehow in detach_dev? If the latter, I'm
> struggling to figure out how I can determine that the PD is still
> on without doing my own bookkeeping, as pmdomain core seems to clear
> these fields before my detach_dev gets to them :(

When genpd_dev_pm_detach() is called, the device is being detached
from its genpd and part of that procedure means calling the
->detach_dev() callback.

When the device has been detached, we may have the PM domain being
powered-on for no good reason. That's why we also punt a work to check
if we can turn it off (see the call to genpd_queue_power_off_work()).

Kind regards
Uffe
