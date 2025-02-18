Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7522A395AC
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 09:40:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB8E10E637;
	Tue, 18 Feb 2025 08:40:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ADXSoU2h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87DFD10E637
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 08:40:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B20185C370B;
 Tue, 18 Feb 2025 08:40:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F393BC4CEE2;
 Tue, 18 Feb 2025 08:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739868039;
 bh=n2akpTGWIUPiDpg5UDCEvSWvsCe8G6rT5xtsrG+8fOs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ADXSoU2h5CxSVEcQuDafN/DBP9NJEUTDWhG7UCNpYSZT4Q99xnCwTIanHO7ltSvrd
 VBebDKTTsq9YlskH27b4M5acTRUkpP8drTlj4l5Mb4L5KU5CPpNObQly0vK7j19VYc
 bUqnscRb97jlJ8GUCRuzrw3faT5fKO11IBoeExKEOy5BLpkGcAvViCKKTAZZ8TeZ16
 FnIkAqHbF/61fpt6gw6uP9Njp/0rXS3JzrdKPfX8wuj2RztPvyNmPqfa21Os7+UqsM
 sgRnU3j3ARQXwf1/MfUZx3E398TzqXUQhBnK1qJQlgBNhwcNe8QLX07dhK451TMQ52
 tOmhztHsscY4w==
Date: Tue, 18 Feb 2025 09:40:36 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: display: bridge: Document Solomon
 SSD2825
Message-ID: <20250218-wandering-angelfish-of-endurance-b35c2c@krzk-bin>
References: <20250217140910.108175-1-clamor95@gmail.com>
 <20250217140910.108175-2-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250217140910.108175-2-clamor95@gmail.com>
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

On Mon, Feb 17, 2025 at 04:09:09PM +0200, Svyatoslav Ryhel wrote:
> Add bindings for Solomon SSD2825 MIPI master bridge chip that connects an
> application processor with traditional parallel LCD interface and an LCD
> driver with MIPI slave interface. The SSD2825 supports both parallel RGB
> interface and serial SPI interface.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../display/bridge/solomon,ssd2825.yaml       | 141 ++++++++++++++++++
>  1 file changed, 141 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/solomon,ssd2825.yaml
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

