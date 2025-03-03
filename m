Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DACA4C7C8
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 17:43:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE0DA10E4A4;
	Mon,  3 Mar 2025 16:43:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="tcCzM1+o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com
 [91.218.175.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB84610E4A4
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 16:43:23 +0000 (UTC)
Date: Mon, 3 Mar 2025 11:43:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1741020197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0xN0OgCy3b1q5LuDbAE8X1hj9Ed53fv0LtyLgIvHWLw=;
 b=tcCzM1+oyyL625hQt8o31zf6qJpyDtm+6hpAXzLVKn+/ZxZTb9Q+WuR4NdZ0cXeFmwq6CB
 XNOdD4XSj7+1UviD4gsBYGkbLNrZExowUqMcwPB58T8FwPXfe5Y3+4lO8IWcJNcRIf8FSS
 Sl0gw+6ZKMZVxSPbxK1esQNoxAj3H4Eu/WGKT7nUKTuqziWx8nRw/roEeS1cgxNI8z2zJ7
 TsaoQhvUIucMFJRo3Ze4aB6/UiozFezKIOqpJrCMT+NhM6XullJbqA5Cv3v3+O2K/xvVjM
 EbJCFW77yP0ce+qQoHXbO/igKXviqatuHW1i9jZ6JrlqnaOyMJm1D3bFTyT3Fw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>, fnkl.kernel@gmail.com,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev,
 Janne Grunau <j@jannau.net>, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Neal Gompa <neal@gompa.dev>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Nick Chan <towinchenmi@gmail.com>
Subject: Re: [PATCH v7 0/5] Driver for pre-DCP apple display controller.
Message-ID: <Z8XcH7xoDC7TA7ZC@blossom>
References: <20250217-adpdrm-v7-0-ca2e44b3c7d8@gmail.com>
 <c3927b51-55ef-4a38-8931-18ff00caa8d8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3927b51-55ef-4a38-8931-18ff00caa8d8@linaro.org>
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

> > Sasha Finkelstein (5):
> >        dt-bindings: display: Add Apple pre-DCP display controller
> >        drm: adp: Add Apple Display Pipe driver
> >        drm: panel: Add a panel driver for the Summit display
> >        arm64: dts: apple: Add touchbar screen nodes
> >        MAINTAINERS: Add entries for touchbar display driver
> > 
> >   .../display/apple,h7-display-pipe-mipi.yaml        |  83 +++
> >   .../bindings/display/apple,h7-display-pipe.yaml    |  88 +++
> >   .../bindings/display/panel/apple,summit.yaml       |  58 ++
> >   MAINTAINERS                                        |  16 +
> >   arch/arm64/boot/dts/apple/t8103-j293.dts           |  31 ++
> >   arch/arm64/boot/dts/apple/t8103.dtsi               |  61 ++
> >   arch/arm64/boot/dts/apple/t8112-j493.dts           |  31 ++
> >   arch/arm64/boot/dts/apple/t8112.dtsi               |  61 ++
> >   drivers/gpu/drm/Kconfig                            |   2 +
> >   drivers/gpu/drm/Makefile                           |   1 +
> >   drivers/gpu/drm/adp/Kconfig                        |  17 +
> >   drivers/gpu/drm/adp/Makefile                       |   5 +
> >   drivers/gpu/drm/adp/adp-mipi.c                     | 276 +++++++++
> >   drivers/gpu/drm/adp/adp_drv.c                      | 617 +++++++++++++++++++++
> >   drivers/gpu/drm/panel/Kconfig                      |   9 +
> >   drivers/gpu/drm/panel/Makefile                     |   1 +
> >   drivers/gpu/drm/panel/panel-summit.c               | 132 +++++
> >   17 files changed, 1489 insertions(+)
> > ---
> > base-commit: b62cef9a5c673f1b8083159f5dc03c1c5daced2f
> > change-id: 20241124-adpdrm-25fce3dd8a71
> > 
> > 
> 
> All patches are reviewed, can we funnel patches 1, 2 & 5 via drm-misc-next now ?

I'm planning to do so today, just need to get dim setup first :)
