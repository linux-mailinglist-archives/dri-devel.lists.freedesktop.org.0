Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC2DAD5D99
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 19:58:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61FA610E154;
	Wed, 11 Jun 2025 17:58:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="WkGh9g68";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com
 [91.218.175.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E3D10E154
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 17:58:17 +0000 (UTC)
Date: Wed, 11 Jun 2025 13:52:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1749664344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4xFAvj2G5VnN2oADUrjOMQLWSOzD8+mWMWxdA4/gXps=;
 b=WkGh9g68gWOHLnoNJXve7+hzhqKiQAdR0Rj2NXjDUlGVWZX161sjbqguO+g/sxHPJ0Hpq+
 KLWaJQh0bx6ndqXMpvcQP/Y3tnZVGEU7ZheePnFoegfMFq5p2wn/CraG//QBRUH032nazx
 HTPz8t4b+NrczcM3aEMNBf8xZeAaVnxIioyk+5t9SolpoofK9fGl/v4RJIFSe/+Y4FSz/S
 xCJ7tetaSPzQk7U4usSIJCroH6cbYALUSXstGLeSR+/Fk4t3usc3vWWZRoHdfMjy19Od98
 jql7hgU2r+FswNQ0YiQY7H7YD4ArtkVbBjV1RA2krIu5r0TsjfqMsKByaXa+GQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: fnkl.kernel@gmail.com
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: Add Apple SoC GPU
Message-ID: <aEnCUycX_x1zNN1D@blossom>
References: <20250611-sgx-dt-v1-0-7a11f3885c60@gmail.com>
 <20250611-sgx-dt-v1-1-7a11f3885c60@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611-sgx-dt-v1-1-7a11f3885c60@gmail.com>
X-Migadu-Flow: FLOW_OUT
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

> +      - description: Driver-opaque calibration blob
> +      - description: Calibration blob
...
> +      - const: hw-cal-a
> +      - const: hw-cal-b

For me these descriptions raise more questions than what they're meant
to describe... Maybe "First hardware calibration blob" and "Second
hardware calibration blob" or something. I don't fully get why A is
opaque and B is not, I don't think there's really such a distinction in
reality.

> +    description:
> +      MacOS version the current firmware is paired with, used to pick

macOS
