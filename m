Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FF5A4993E
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 13:28:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E49B10E297;
	Fri, 28 Feb 2025 12:28:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QvCon2Gx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0287710E297
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 12:28:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 22C6E60008;
 Fri, 28 Feb 2025 12:28:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39577C4CEEC;
 Fri, 28 Feb 2025 12:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740745709;
 bh=mTxyB5LfIETi+uJvOVDQqxXR+KxU8npM8MnbMmEt/n0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QvCon2GxURZLGP41UlqCFBsm/k6EHWKtK8TKpZwIps0xE3JxVpXYPf6Idk0a1xcxm
 OMwKPb5n2jzmPix3DVoA5xuVJkSxqzhK/zcoYynXQP1WMZh5MKWITEmC1bvVnMvUFb
 jBUV46WR0Tdekr+Mme41JFuwt+PyAumTEjJ1pUkw75nbpfEAwjmeEF1TgJJZ28JvRa
 6XrfTi4203h9GmQYf0apk3u1o9TZYhPbyV9/tTaYwXwDQ2sm9rENEEczzL3J+fz37f
 aJzzs3zRkqn1JKGlRIhGK+QpPEfUXq8vipSlLS7fPPTXE71U4uZDKx81xyCEsloq/F
 WJtfQ2NhJOctg==
Date: Fri, 28 Feb 2025 06:28:22 -0600
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev,
 David Airlie <airlied@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 devicetree@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
 Shawn Guo <shawnguo@kernel.org>, dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, Steven Price <steven.price@arm.com>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sebastian Reichel <sre@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 7/9] dt-bindings: gpu: mali-valhall-csf: Document i.MX95
 support
Message-ID: <20250228122822.GA2321092-robh@kernel.org>
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-8-marex@denx.de>
 <174068152164.3906545.6393185343383919273.robh@kernel.org>
 <77585efa-29f0-47ef-af02-d927a512b9ae@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77585efa-29f0-47ef-af02-d927a512b9ae@denx.de>
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

On Thu, Feb 27, 2025 at 09:31:48PM +0100, Marek Vasut wrote:
> On 2/27/25 7:38 PM, Rob Herring (Arm) wrote:
> > 
> > On Thu, 27 Feb 2025 17:58:07 +0100, Marek Vasut wrote:
> > > The instance of the GPU populated in Freescale i.MX95 is the
> > > Mali G310, document support for this variant.
> > > 
> > > Signed-off-by: Marek Vasut <marex@denx.de>
> > > ---
> > > Cc: Boris Brezillon <boris.brezillon@collabora.com>
> > > Cc: Conor Dooley <conor+dt@kernel.org>
> > > Cc: David Airlie <airlied@gmail.com>
> > > Cc: Fabio Estevam <festevam@gmail.com>
> > > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > > Cc: Liviu Dudau <liviu.dudau@arm.com>
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > > Cc: Rob Herring <robh@kernel.org>
> > > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > > Cc: Sebastian Reichel <sre@kernel.org>
> > > Cc: Shawn Guo <shawnguo@kernel.org>
> > > Cc: Simona Vetter <simona@ffwll.ch>
> > > Cc: Steven Price <steven.price@arm.com>
> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > Cc: devicetree@vger.kernel.org
> > > Cc: dri-devel@lists.freedesktop.org
> > > Cc: imx@lists.linux.dev
> > > Cc: linux-arm-kernel@lists.infradead.org
> > > ---
> > >   Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > 
> > My bot found errors running 'make dt_binding_check' on your patch:
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > 
> > 
> > doc reference errors (make refcheckdocs):
> > 
> > See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250227170012.124768-8-marex@denx.de
> It seems there are no errors in this list ?

That's an artifact that a prior patch in this series failed.

Rob
