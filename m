Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B748C67CE48
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 15:37:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A59B410E90F;
	Thu, 26 Jan 2023 14:36:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15D5810E90F
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 14:36:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8DCE8B81D0C;
 Thu, 26 Jan 2023 14:36:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63CFAC433EF;
 Thu, 26 Jan 2023 14:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674743813;
 bh=98SAiW8EasNhUbmpf7pK4esoZxbZJjAiXnvFOnNwpKk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gfCcCUKFz6Gf+RF5hWJAETkkcjsUp4jjQwmKHYRZl2R1mfNN5X7BZhl9yZeLCRiNg
 9qrLPNiuf8Bdz/n/ZRZc3JoJ3OvC14jm/WyHIvfBNX5i0V7NvEZnfeacpPSGjIaNIn
 AHCae3F/UGrV+7DYjtBQ5dkOIH88nYZlCTQvOPMu426rpviKIIWWeu4viLSbNukEeS
 iB6FU32UFkQ6b3sMR+H8g0jGJlwpjgHPjY867Sa3QyKwYkuBsKR1eY6eCoA/3LQSbk
 iS65fr8vXaIPamQpqApfmdpfVLqYbddK9asoMx3HlrsPURrGIzQNXZPce4al/VqT65
 gKI4Ve43pwssQ==
Date: Thu, 26 Jan 2023 14:36:47 +0000
From: Lee Jones <lee@kernel.org>
To: Jianhua Lu <lujianhua000@gmail.com>
Subject: Re: [PATCH v9 2/2] backlight: ktz8866: Add support for Kinetic
 KTZ8866 backlight
Message-ID: <Y9KP/0cVKBp6d7qc@google.com>
References: <20230120155018.15376-1-lujianhua000@gmail.com>
 <20230120155018.15376-2-lujianhua000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230120155018.15376-2-lujianhua000@gmail.com>
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
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Pavel Machek <pavel@ucw.cz>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 20 Jan 2023, Jianhua Lu wrote:

> Add support for Kinetic KTZ8866 backlight, which is used in
> Xiaomi tablet, Mi Pad 5 series. This driver lightly based on
> downstream implementation [1].
> [1] https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/elish-r-oss/drivers/video/backlight/ktz8866.c
> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---
> Changes in v2:
>   - Add missing staitc modifier to ktz8866_write function.
> 
> Changes in v3:
>   - Add 2022 to Copyright line.
>   - Sort headers.
>   - Remove meaningless comment.
>   - Use definitions instead of hardcoding.
>   - Add missing maintainer info.
> 
> Changes in v4:
>   - Change 2022 to 2023.
>   - Remove useless macro and enum.
>   - Describe settings by devicetree.
>   - Move header file to C file.
> 
> Changes in v5:
>   - Change "2023" to "2022, 2023" in Copyright line.
>   - Set scale property for backlight.
> 
> Changes in v6:
>   - Correct devicetree property name.
> 
> Changes in v7:
>   - Remove unnecessary sleep statement.
>   - Fix code style.
>   - Add vddpos and vddneg supply devicetree parse.
>   - Add enabel-gpio devicetree parse.
> 
> Changes in v8:
>   - Modify devicetree parse according to dt bindings.
> 
> No changes in v9
> 
>  MAINTAINERS                       |   6 +
>  drivers/video/backlight/Kconfig   |   8 ++
>  drivers/video/backlight/Makefile  |   1 +
>  drivers/video/backlight/ktz8866.c | 209 ++++++++++++++++++++++++++++++
>  4 files changed, 224 insertions(+)
>  create mode 100644 drivers/video/backlight/ktz8866.c

Applied, thanks

-- 
Lee Jones [李琼斯]
