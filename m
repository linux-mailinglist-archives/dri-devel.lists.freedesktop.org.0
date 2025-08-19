Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F4DB2C39F
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 14:32:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F289210E15E;
	Tue, 19 Aug 2025 12:32:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KUV1pM+P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 114CF10E15E
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 12:32:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3B58061426;
 Tue, 19 Aug 2025 12:32:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9002C116C6;
 Tue, 19 Aug 2025 12:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755606750;
 bh=wjs09Gdigf2R0IE1uLQxql5R4PimNeWNLQzbngasLiU=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=KUV1pM+PSUrbgiuC2qfRrjBmoh/K7SwKUZPEG9Sx43lERH2mIAhJXE43x+YxV+SGd
 BdtNUMqKKJlINMh6dccC0ScwziqT9emXyV3D+9wnX46JUt0c61L45wM8zOfFf0CUsy
 97atbCKu7MfQ/4A3q50GqnxaNp6SbtNu00FjCioMQHjnpu///w0Wgu48LG7iKegR3U
 RtPibAw8lDKnpEhhsGpLfj9WdTX0+K7FHZIU0mYidnxYnEIqCUDkH/n/cMTfLHPWT7
 IhwS1l80k7T0xpDkP4EHbmRjQGlOAcqofRTPzapIJnpKAwBV6uY2JPtc91+jz2rP06
 rz76yHEIf9sUQ==
Date: Tue, 19 Aug 2025 07:32:29 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: imx@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org, 
 Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Daniel Thompson <danielt@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org, 
 linux-leds@vger.kernel.org, Helge Deller <deller@gmx.de>
To: Maud Spierings <maudspierings@gocontroll.com>
In-Reply-To: <20250819-max25014-v2-1-5fd7aeb141ea@gocontroll.com>
References: <20250819-max25014-v2-0-5fd7aeb141ea@gocontroll.com>
 <20250819-max25014-v2-1-5fd7aeb141ea@gocontroll.com>
Message-Id: <175560674579.26233.12902824583404207699.robh@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: backlight: Add max25014 bindings
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


On Tue, 19 Aug 2025 12:58:59 +0200, Maud Spierings wrote:
> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> with intgrated boost controller.
> 
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>  .../bindings/leds/backlight/maxim,max25014.yaml    | 79 ++++++++++++++++++++++
>  MAINTAINERS                                        |  5 ++
>  2 files changed, 84 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250819-max25014-v2-1-5fd7aeb141ea@gocontroll.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

