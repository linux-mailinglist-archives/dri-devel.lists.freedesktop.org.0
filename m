Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4C69EE0ED
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 09:13:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FCC210E212;
	Thu, 12 Dec 2024 08:13:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="X403YC3n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0823510E212
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 08:13:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6BB975C5AFD;
 Thu, 12 Dec 2024 08:12:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0DBBC4CECE;
 Thu, 12 Dec 2024 08:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733991210;
 bh=yFRZ+IH3VruDCKluh2Mfy3YvjHuvC7u/oBOqXdHG/UQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X403YC3nzX85sUU0gMsuEEhNCgIEXOUpGQE5pbSXbWlnTW9NCHbM8Q3f9cGjpt+hA
 6Y0s/H8FcFTkbkCLs3YHflvhtK8mzxgctedejqkte9rAG9l195yutRCvrB07H/1szj
 MzwgVw8v+V34GvVlDRYINKQRhxlICRxQ/LPaCE19SlwBah4IFu/Dvp3ceFu4tVsTYk
 IsyjI5WujSg7PLnlEPJVoZDu33oE6xjyVdqhXbFdKzpb8PS4LZmhktymYDJPtgF/3a
 DFSFEWTPpsPCAH2wrAFpSFXRgFSjQeTuVIUunj7PaQ4qY1R/9VNZPoRkx0yWHb67Fc
 X86sGlmel0fiA==
Date: Thu, 12 Dec 2024 09:13:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Helge Deller <deller@gmx.de>, 
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/3] dt-bindings: leds: backlight: apple,dwi-bl: Add
 Apple DWI backlight
Message-ID: <6fazyksxkcbhugivwgozuyjdig37vnshbwtdmzjcbrqywgszvd@sm27uhqgsma4>
References: <20241211113512.19009-1-towinchenmi@gmail.com>
 <20241211113512.19009-2-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241211113512.19009-2-towinchenmi@gmail.com>
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

On Wed, Dec 11, 2024 at 07:34:37PM +0800, Nick Chan wrote:
> Add backlight controllers attached via Apple DWI 2-wire interface.
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>  .../bindings/leds/backlight/apple,dwi-bl.yaml | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

