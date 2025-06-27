Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0EEAEB0F1
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 10:08:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E47DC10E337;
	Fri, 27 Jun 2025 08:08:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="M8DivVTB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 524A010E337
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 08:08:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CE92B5C6953;
 Fri, 27 Jun 2025 08:08:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADB9FC4CEED;
 Fri, 27 Jun 2025 08:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751011709;
 bh=PYP9Imqu5GjDkVBHcvLr+ztBK6R3xQ+B5FYXugyhx3c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M8DivVTBC8AdBk4Fn/V/IyMSs5cc29CEAiWP0gy3wE+6Rbj6bjo7KK5GhYoiMBsaV
 /qrPrjmRHAtZjZHrpNC2OQOX1l7kpCRcva5Tuo3gCWhxUndg2auts/kO8ZjSEyyVqw
 RaffDG9g62XJVhm3nHAfd4p7He45PfaBv3a8IL7CqYdiu7m1oOYjOiTLzukEq08w9P
 8ncQO0Wy+GENY3BcPxhucS104Hgfmfd0NbpLtXcdY+35jcT8BGL7U1LF9LtZqpe2qI
 iiywZ0Zl07ZTDFxOAd5rrH7i/FPgfWl0V+oyoqD99s38d4cgPeb05K8qAL98lvHfjg
 mZ8JJDpyN7W3g==
Date: Fri, 27 Jun 2025 10:08:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Hans de Goede <hdegoede@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: display: simple-framebuffer: Add
 interconnects property
Message-ID: <20250627-mysterious-optimistic-bird-acaafb@krzk-bin>
References: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
 <20250623-simple-drm-fb-icc-v2-1-f69b86cd3d7d@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250623-simple-drm-fb-icc-v2-1-f69b86cd3d7d@fairphone.com>
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

On Mon, Jun 23, 2025 at 08:44:45AM +0200, Luca Weiss wrote:
> Document the interconnects property which is a list of interconnect
> paths that is used by the framebuffer and therefore needs to be kept
> alive when the framebuffer is being used.
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/display/simple-framebuffer.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
> index 296500f9da05e296dbbeec50ba5186b6b30aaffc..f0fa0ef23d91043dfb2b220c654b80e2e80850cd 100644
> --- a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
> +++ b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
> @@ -79,6 +79,9 @@ properties:
>    power-domains:
>      description: List of power domains used by the framebuffer.
>  
> +  interconnects:
> +    description: List of interconnect paths used by the framebuffer.
> +

maxItems: 1, or this is not a simple FB anymore. Anything which needs
some sort of resources in unknown way is not simple anymore. You need
device specific bindings.

Best regards,
Krzysztof

