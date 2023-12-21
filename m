Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8798881C0D0
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 23:11:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9D4C10E6EF;
	Thu, 21 Dec 2023 22:11:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F04910E6EF
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 22:11:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1F92561309;
 Thu, 21 Dec 2023 22:11:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A1EDC433C8;
 Thu, 21 Dec 2023 22:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703196667;
 bh=l/kng9zyEiAwckm6pSVVW08SeFJWGMt/bBmLADFWOo0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zub9895/30rjVokS1uM49Mh06/RD8bO32fJbF94+s6N3RUXc2Kj4Gqi4/qn3/W1LA
 fghTCAjHP/2EdTsbVkejK9PywZhEDRPWZv6Tor5xmfsaJ2tHUarKQn8Gku9hhkZ61K
 2hRYv4yrNZ3CFlJivWW7Fi4KqDtD172u0aHXTAzN+pusunkxynV9MVJOTr2xEF7tJy
 0TAr8HW0QvDWZ4pHrUkKXsGXMSzLAp20G2CxOK+ysZfKDAHQNenB9mQEMoKCxhiN81
 ET5xK4YApjS3EQROSjIlYdE8s99xUa9HRoXQknmg2u+6Zr7iQ0PR8dzWnji1CtmZa8
 kqf18ykTgVhrg==
Received: (nullmailer pid 182105 invoked by uid 1000);
 Thu, 21 Dec 2023 22:11:05 -0000
Date: Thu, 21 Dec 2023 16:11:05 -0600
From: Rob Herring <robh@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: display: ssd1307fb: Add vendor
 prefix to width and height
Message-ID: <170319666507.182055.13407104511306194810.robh@kernel.org>
References: <20231219203416.2299702-1-javierm@redhat.com>
 <20231219203416.2299702-2-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231219203416.2299702-2-javierm@redhat.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Conor Dooley <conor@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Jocelyn Falempe <jfalempe@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@gmail.com>, Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 19 Dec 2023 21:34:06 +0100, Javier Martinez Canillas wrote:
> The commit 591825fba8a2 ("dt-bindings: display: ssd1307fb: Remove default
> width and height values") used the wrong properties for width and height,
> instead of the correct "solomon,width" and "solomon,height" properties.
> 
> Fix this by adding the vendor prefix to the width and height properties.
> 
> Fixes: 591825fba8a2 ("dt-bindings: display: ssd1307fb: Remove default width and height values")
> Reported-by: Conor Dooley <conor@kernel.org>
> Closes: https://lore.kernel.org/dri-devel/20231218-example-envision-b41ca8efa251@spud/
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
> 
> (no changes since v1)
> 
>  .../bindings/display/solomon,ssd1307fb.yaml   | 20 +++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

