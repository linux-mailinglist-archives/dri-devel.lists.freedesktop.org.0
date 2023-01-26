Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4391967CE43
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 15:36:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 203B210E90D;
	Thu, 26 Jan 2023 14:36:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E8D10E90D
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 14:36:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 056D461851;
 Thu, 26 Jan 2023 14:36:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 575CEC433D2;
 Thu, 26 Jan 2023 14:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674743778;
 bh=7nbBSRNGEontRbdD8GVbYdMCjS4jqmZWPhqfyLc7pEM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TxHFTGU0QFjWNjwOLWt56/8FeklWCuXPdXfETgWP3wUbeqvj8yEvKsZZAekmtWSyV
 mCrE/O9D+CeHSqfAmUwgAcZnGmb9/oL/Dcaojo3Y3i6mbJSxF4NXBFTWxA7ny/eT6p
 kWPbQuZ6NQqYyw+Z5+EFopPz8xF1rQKsgM+2qW5t6u+yNcP/eoockpCacgqYhMPdHE
 RJquKLmC6AEQpqq4w0F1wxsBxFdWyEbo5j6RwskPDDfoeTcE8MEPJWwgKEVEw+j4KX
 GSQphhaZppAqC5Y4/9c4fLWOCm/lkm9VD49uvfUqbAYkmnNerT97G2Ve/GMytKdkvM
 l4zAEtmpJqZVw==
Date: Thu, 26 Jan 2023 14:36:12 +0000
From: Lee Jones <lee@kernel.org>
To: Jianhua Lu <lujianhua000@gmail.com>
Subject: Re: [PATCH v9 1/2] dt-bindings: leds: backlight: Add Kinetic KTZ8866
 backlight
Message-ID: <Y9KP3K7Oup8hw21W@google.com>
References: <20230120155018.15376-1-lujianhua000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230120155018.15376-1-lujianhua000@gmail.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 20 Jan 2023, Jianhua Lu wrote:

> Add Kinetic KTZ8866 backlight binding documentation.
> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> Changes in v2:
>   - Remove "items" between "compatible" and "const: kinetic,ktz8866".
>   - Change "additionalProperties" to "unevaluatedProperties".
> 
> Changes in v3:
>   - Add Krzysztof's R-b.
> 
> Changes in v4:
>   - Drop Krzysztof's R-b.
>   - Add some new properties.
> 
> Changes in v5:
>   - Add missing enum under property description.
>   - Rename uncorrect properties.
> 
> Changes in v6:
>   - Correct wrong property suffix and description.
> 
> Changes in v7:
>   - Add vddpos and vddeg supply.
>   - Use enable-gpios instead of defining enable pin.
> 
> Changes in v8:
>   - Rename current ramping time. 
>   - Rename led ramping time. 
> 
> Changes in v9:
>   - Add Krzysztof's R-b.
>   - Add missing 1μs to the enum of "kinetic,led-enable-ramp-delay-ms".
> 
>  .../leds/backlight/kinetic,ktz8866.yaml       | 76 +++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml

Applied, thanks

-- 
Lee Jones [李琼斯]
