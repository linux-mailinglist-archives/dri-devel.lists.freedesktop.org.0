Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E52B04F30
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 05:39:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D270E10E147;
	Tue, 15 Jul 2025 03:39:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rrK6YWYH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F8F10E2B7
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 03:39:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E21A45C55E8;
 Tue, 15 Jul 2025 03:39:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FEECC4CEE3;
 Tue, 15 Jul 2025 03:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752550748;
 bh=pg10ZRkdYeFnXEcWEcbRD3J1Z6ySQm+62tlViyEQr5k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rrK6YWYHM7y0MorMV5i/x+xFVHVEhtPLGf//HVYZn11oPkoFPafLs0jagWYUvenc8
 j9SjLcIGnZaB3NhQAw6CSCcrYRXLEMlImsy3mGvZBnXzjAGUXi0d6k3/TCLyoiCyvV
 7zIS63H8DGDQd6s1kbswsmeEWZ6OnKwxBfeEpVPE0ll2tWSYUQFi+WP+Zh20fKiLWi
 kFm1DAyweGqo1mhJWwLQNxO39IZL70ozUMMx9t2cPDYrZLa3PIQeYMIi4umYfHjl2m
 vBabltEniOHle/HiTiCH1zpIBeNM/O924bbQl5fq8fRQ9bj3YH252Lpd/FDFs/1fqf
 kl7q0lCdRuJ+A==
Date: Mon, 14 Jul 2025 22:39:07 -0500
From: Rob Herring <robh@kernel.org>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: display: sitronix,st7571: add optional
 inverted property
Message-ID: <20250715033907.GA4184449-robh@kernel.org>
References: <20250714-st7571-format-v1-0-a27e5112baff@gmail.com>
 <20250714-st7571-format-v1-2-a27e5112baff@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714-st7571-format-v1-2-a27e5112baff@gmail.com>
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

On Mon, Jul 14, 2025 at 10:04:00AM +0200, Marcus Folkesson wrote:
> Depending on which display that is connected to the controller, an "1"
> means either a black or a white pixel.
> 
> The supported formats (R1/R2/XRGB8888) expects the pixels
> to map against (4bit):
> 00 => Black
> 01 => Dark Gray
> 10 => Light Gray
> 11 => White
> 
> If this is not what the display map against, the controller has support
> to invert these values.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  Documentation/devicetree/bindings/display/sitronix,st7571.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/sitronix,st7571.yaml b/Documentation/devicetree/bindings/display/sitronix,st7571.yaml
> index 4fea782fccd701f5095a08290c13722a12a58b52..065d61b718dc92e04419056b1e2d73fd0b2cb345 100644
> --- a/Documentation/devicetree/bindings/display/sitronix,st7571.yaml
> +++ b/Documentation/devicetree/bindings/display/sitronix,st7571.yaml
> @@ -28,6 +28,11 @@ properties:
>      description:
>        Display supports 4-level grayscale.
>  
> +  sitronix,inverted:
> +    type: boolean
> +    description: |

Don't need '|'.

> +      Display pixels are inverted, i.e. 0 is white and 1 is black.
> +
>    reset-gpios: true
>    width-mm: true
>    height-mm: true
> 
> -- 
> 2.49.0
> 
