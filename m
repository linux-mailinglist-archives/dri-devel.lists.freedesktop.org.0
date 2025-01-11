Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9A2A0A2AF
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jan 2025 11:18:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A02AF10E0CC;
	Sat, 11 Jan 2025 10:18:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BXYVsA2H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF1510E0CC
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jan 2025 10:18:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 63A045C4793;
 Sat, 11 Jan 2025 10:17:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C5D7C4CED2;
 Sat, 11 Jan 2025 10:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736590683;
 bh=hZ30PF9MK7V/3XvgwOYQIRHwGq6CMsygfh0lC3ErEBg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BXYVsA2Hn5PDzesEHTT6xq7nz1CFfawJHWqMM6NhR9qRsjPoI5WHGZYN0zu8YBAAg
 VXbHGJZSK1LowXcGMJoQe9r/I3tCd8/e2tbnwM0VExDT9MF3Yaip6G5C8bW2dMFhiM
 UMZLNDtWArfCAGuQe/l8VxFu4M9oxZdQPPtLtIlbnrayFNCEkdYUihY9KVGlKvJ0GE
 yXwIknj8mmiwpkg37i9Bbe2Z9MKJDMdcMi8lTZvcpXyu2WrBO9KBP7AkbDeYLBEm0E
 tce0qa0IDCWdSfF1GB+fgWOqI8yEUuKoOWEoAXGSEkpH955HMU2KzvIHynTK2wOnt0
 /dYvyHkJpXugw==
Date: Sat, 11 Jan 2025 11:17:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ao Xu <ao.xu@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, 
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/11] dt-bindings: display: meson-dw-hdmi: Add
 compatible for S4 HDMI controller
Message-ID: <iqy3ff7sltfy7hq4scvtt2sumcghexhj3bj4r2wi7rtbpcqrou@7qwjwh7kgfb7>
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
 <20250110-drm-s4-v1-1-cbc2d5edaae8@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250110-drm-s4-v1-1-cbc2d5edaae8@amlogic.com>
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

On Fri, Jan 10, 2025 at 01:39:51PM +0800, Ao Xu wrote:
> Add devicetree document for S4 HDMI controller
> 
> Signed-off-by: Ao Xu <ao.xu@amlogic.com>
> ---
>  Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
> index 84d68b8cfccc86fd87a6a0fd2b70af12e51eb8a4..6e0a8369eee915fab55af24d450a6c40e08def38 100644
> --- a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
> @@ -55,6 +55,7 @@ properties:
>            - const: amlogic,meson-gx-dw-hdmi
>        - enum:
>            - amlogic,meson-g12a-dw-hdmi # G12A (S905X2, S905Y2, S905D2)
> +          - amlogic,meson-s4-dw-hdmi # S4 (S905Y4)

Judging by of_device_id table this is compatible, so use proper
fallbacks or explain in commit msg why not.

Best regards,
Krzysztof

