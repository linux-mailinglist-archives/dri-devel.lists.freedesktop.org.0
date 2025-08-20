Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1D2B2D529
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 09:46:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C10FF10E241;
	Wed, 20 Aug 2025 07:46:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZdoUNVYf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACC3C10E241
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 07:46:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 982AD60204;
 Wed, 20 Aug 2025 07:46:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B88C6C4CEEB;
 Wed, 20 Aug 2025 07:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755675984;
 bh=nEGzvYYrNHjBD+BsPHTYKJ//lWK16bNqWvxHypFf4xo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZdoUNVYfWppzQsbJFbLvj37skiHTu/Ow5EoHq0IpyfGCpoAYFJpA6rmUzogEnEVJ5
 nzOjWsMH4W2PBwEgIQ/l/CPLDy4C3I17yxo4QVr1ojlGvU3or7N0T/x9JlndIinSQG
 a/MYiUgfpwetaEQfsO8lqpuNXZpR629++TRjR3RIm+QBOcz3EMCZjh2pOnOSbCP+Q6
 cj9cyc+ralb9+NIi21l+5ChXq+VvcFdg4L9160IMUFuGKywNdR1XWB7MN5swnJiUYK
 qr/GBhtDDzJcM60v32dApW1zlP1PkNPrV/8zbH93yBgKwEtFa6ySl6XwODFm7WQqY9
 XGqjsAJk6/msQ==
Date: Wed, 20 Aug 2025 09:46:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: display: panel: document Synaptics
 TDDI panel
Message-ID: <20250820-heretic-ivory-vole-4f3d63@kuoka>
References: <20250819-panel-synaptics-tddi-v4-0-448f466d16a6@disroot.org>
 <20250819-panel-synaptics-tddi-v4-1-448f466d16a6@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250819-panel-synaptics-tddi-v4-1-448f466d16a6@disroot.org>
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

On Tue, Aug 19, 2025 at 08:26:44PM +0530, Kaustabh Chakraborty wrote:
> Document the Synaptics TDDI (Touch/Display Integration) panel hardware.
> Along with the MIPI-DSI panel, these devices also have an in-built LED
> backlight device and a touchscreen, all packed together in a single chip.
> 
> Also, add compatibles for supported panels - TD4101 and TD4300. Both
> have the '-panel' suffix so as to remove any ambiguity between the panel
> and touchscreen chips.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  .../display/panel/synaptics,td4300-panel.yaml      | 89 ++++++++++++++++++++++

I am not going to do the work twice... you need to clearly document
reasons of dropping people's review.

Best regards,
Krzysztof

