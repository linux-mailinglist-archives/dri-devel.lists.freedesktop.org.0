Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C962CC58D3A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 17:46:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F189010E8C8;
	Thu, 13 Nov 2025 16:46:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="A8mEga9R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BCD310E8C8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 16:46:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A2F5560127;
 Thu, 13 Nov 2025 16:46:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2C27C4CEF5;
 Thu, 13 Nov 2025 16:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763052369;
 bh=+SNBZZpwIVsQ1NMm9S2r0CGt8y213OHdKQwYS8JlXzw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A8mEga9Rmp51/7zGCoyQ8Ecsah26vWq7zE+u+7YzNSypa+OURY3wOD2ntrIuOCb1Q
 JEme03y2PBUgJ6J7Mp85nDQX+CFPREH8wMRLN3+c2kRiUPFPW/nOOmWqEiWXG083h8
 uz9cLSjIlrbHa1AOSCluR/uR5MDJoiQrHfrEa2fJGBWgYcRdJVmUkgzSiLZJ4bNCkt
 oSzBElibE5+KtXZ8X1XieuXRYpC6bQ/jJqg1F3wG1yqut6gGbG4VE8WG3m7ZOl3DZ3
 B/KpoJKIZjzpNQOpX22bjmrJsseposwHAbEzV5bL+KeDFZpp0N6vUKn20rp8ud9a3M
 fwIlh14+ShhuA==
Date: Thu, 13 Nov 2025 16:46:03 +0000
From: Lee Jones <lee@kernel.org>
To: Junjie Cao <caojunjie650@gmail.com>
Cc: Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: leds: backlight: Add Awinic AW99706
 backlight
Message-ID: <20251113164603.GP1949330@google.com>
References: <20251109032240.3422503-1-caojunjie650@gmail.com>
 <20251109032240.3422503-2-caojunjie650@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251109032240.3422503-2-caojunjie650@gmail.com>
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

On Sun, 09 Nov 2025, Junjie Cao wrote:

> Add Awinic AW99706 backlight binding documentation.
> 
> Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
> ---
> Changes in v3:
> - breaking a long line (Krzysztof)
> - rename backlight node (Krzysztof)
> - Link to v2: https://lore.kernel.org/linux-leds/20251103110648.878325-2-caojunjie650@gmail.com
> 
> Changes in v2:
> - use proper units for properties (Krzysztof)
> - drop non-fixed properties (Krzysztof)
> - add properties(max-brightness, default-brightness) (Krzysztof)
> - Link to v1: https://lore.kernel.org/linux-leds/20251026123923.1531727-2-caojunjie650@gmail.com
> 
>  .../leds/backlight/awinic,aw99706.yaml        | 101 ++++++++++++++++++
>  1 file changed, 101 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/awinic,aw99706.yaml

Applied (manually), thanks

-- 
Lee Jones [李琼斯]
