Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D0981C0D3
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 23:11:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA0A10E713;
	Thu, 21 Dec 2023 22:11:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0142A10E713
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 22:11:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id AAE96CE20B2;
 Thu, 21 Dec 2023 22:11:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B11FFC433C8;
 Thu, 21 Dec 2023 22:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703196689;
 bh=Z9hXMKVZ8tlGaA+HpSUiTzTbIZxbbxkEYRG/kNA4kKg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RlWXWltMmb5ueSr4sMV/rvCCcMB0vsaqeVLlqksmKzu29W2b2D9e4Mkafq87tEL0n
 cDkazvxzSAMTiK3BJx+VPLtx8sdv50XkDTwCfE+UZzopyuHTaKkypLu5tg2y7icrEz
 4J8zyW0h8/28JdxFMyX3khoOXa4hLu0w+JzIcZ7b4E1v7eck23ou1TIxBaNPm8a9lU
 eor1kZyUvKjTVAr+BP51zL7vSdQ7UT9bgnVZSOsNsCdAPKUoH4dNX+WCfJTmPS0FAp
 qtpnS6y2Xk7/ZRELmhLuEq7Tp2pyM2cg4T4L9IdeV3bPHV7nkdHBT/xCU39Ya0AiY5
 LC0Uzua1Ua1Cw==
Received: (nullmailer pid 182706 invoked by uid 1000);
 Thu, 21 Dec 2023 22:11:27 -0000
Date: Thu, 21 Dec 2023 16:11:27 -0600
From: Rob Herring <robh@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: display: ssd132x: Add vendor prefix
 to width and height
Message-ID: <170319668738.182673.3159926797028333161.robh@kernel.org>
References: <20231219203416.2299702-1-javierm@redhat.com>
 <20231219203416.2299702-3-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231219203416.2299702-3-javierm@redhat.com>
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
Cc: devicetree@vger.kernel.org, Jocelyn Falempe <jfalempe@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor@kernel.org>, dri-devel@lists.freedesktop.org,
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 19 Dec 2023 21:34:07 +0100, Javier Martinez Canillas wrote:
> Commit 2d23e7d6bacb ("dt-bindings: display: Add SSD132x OLED controllers")
> used the wrong properties for width and height, instead of the correct
> "solomon,width" and "solomon,height" properties.
> 
> Fix this by adding the vendor prefix to the width and height properties.
> 
> Fixes: 2d23e7d6bacb ("dt-bindings: display: Add SSD132x OLED controllers")
> Reported-by: Conor Dooley <conor@kernel.org>
> Closes: https://lore.kernel.org/dri-devel/20231218-example-envision-b41ca8efa251@spud/
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
> 
> (no changes since v1)
> 
>  .../devicetree/bindings/display/solomon,ssd132x.yaml | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

