Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F23AEAC06D1
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 10:16:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 065A010E7D9;
	Thu, 22 May 2025 08:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="C7akfoFn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D440110EC84
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 08:16:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5497F5C568C;
 Thu, 22 May 2025 08:13:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 931FCC4CEE4;
 Thu, 22 May 2025 08:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747901768;
 bh=KMc63RmTzPcR/81j0drv6M/ddsUQd+ajSyxtG85Ui/I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C7akfoFnEQDybY3kmBGiab4XMcKqhRgGaO9Xcn4WMAmy/KOo6Ov5FJhuHE252+57N
 wAraR4i7GdUapYu9QH27lm296PjPHXaadys2oIfaj7yXrYM6ah+H1wIOGEeDcx8ohP
 iswaUGq3uGaMsJMDtOUzfUWnq3r1sioi3pulREExlc+JotF0JVcKDrQrv5X2QEgdM6
 KvRJSWjDOyMBoTdU6ObQhtAyHtfmEkeZ3jc8bkDOfd4Mh3q6SpvFG5BPnJr/y+dST4
 XlfWBTZ2fLOndWe8HKk/XMu7WXx0ekIWjcf7GYEYTpyfvsJfbn+mTuZJxD7gyew7gF
 mmAh+/recW7aQ==
Date: Thu, 22 May 2025 10:16:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: display: imx: convert fsl, dcu.txt to
 yaml format
Message-ID: <20250522-practical-beryl-corgi-be233d@kuoka>
References: <20250521165310.307339-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250521165310.307339-1-Frank.Li@nxp.com>
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

On Wed, May 21, 2025 at 12:53:09PM GMT, Frank Li wrote:
> Convert fsl,dcu.txt to yaml format.
> 
> Additional changes:
> - remove label in example.
> - change node to display-controller in example.
> - use 32bit address in example.
> - add interrupts property.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Stefan Agner <stefan@agner.ch>
> ---
> Change from v1 to v2
> - add Reviewed-by: Stefan Agner <stefan@agner.ch> review tag
> - add interrupt

Thanks for doing the conversions and for review from Stefan and
Alexander.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

