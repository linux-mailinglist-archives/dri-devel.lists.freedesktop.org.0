Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C625B0BEE5
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 10:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A01A10E492;
	Mon, 21 Jul 2025 08:29:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YwbDn7ou";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1615710E492
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 08:29:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id ECDE0A5285E;
 Mon, 21 Jul 2025 08:29:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1469FC4CEED;
 Mon, 21 Jul 2025 08:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753086568;
 bh=bkAFOrOZr/SvPe37BUtI1L5AwFmY9z3H9MvIusDOwfQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YwbDn7ouIaFxMvO+7i/Q+Sj0HAZLinB0h6iXSiEaSNOuvQDO/BAoqTJId9vLma4nA
 CqjceBdrP+kU8R9RXl097f4i2Kzwi32a+f5JdwvxR7jcM5XCcPG+1yggEq1wiin0yN
 6SfKuxlBNLrzaDS61079Uu90B4S5FmvrVK74Ma9xOy2fXJqVRyDwURxbFS18tKohhT
 jPka0lp6B8sQxCC0m0cr+sYsPK5WwyhGUdlWYXIILoRwodvp8DXpzcRKJ9DqpzndtX
 3pnV69bCidiZdHhvW+6XpkxPMoaaFxDItlbrrKxrThm3mWO11T+l4MYOPQ1SAELlJj
 3vzYjCFl4XhRw==
Date: Mon, 21 Jul 2025 10:29:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>, Chris Morgan <macroalpha82@gmail.com>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>, 
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH v2 02/12] dt-bindings: allwinner: add H616 DE33 bus binding
Message-ID: <20250721-augmented-woodpecker-of-warranty-9f59ca@kuoka>
References: <20250720085047.5340-1-ryan@testtoast.com>
 <20250720085047.5340-3-ryan@testtoast.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250720085047.5340-3-ryan@testtoast.com>
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

On Sun, Jul 20, 2025 at 08:48:40PM +1200, Ryan Walklin wrote:
>  
>    reg:
> @@ -47,9 +49,6 @@ patternProperties:
>    "^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+$":
>      type: object
>      additionalProperties: true
> -    properties:
> -      reg:
> -        maxItems: 1
>  
>      required:
>        - reg

Then this is also not needed, but usually we expect here specific
children enforced by compatible (see for example qcom display bindings).
What sort of children do you have here?


Best regards,
Krzysztof

