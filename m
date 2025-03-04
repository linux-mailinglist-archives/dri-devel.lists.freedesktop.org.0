Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 476D0A4DC8A
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 12:27:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92A9410E314;
	Tue,  4 Mar 2025 11:27:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kuctRa9E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C4F210E314
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 11:27:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9FBC1A45055;
 Tue,  4 Mar 2025 11:22:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0741EC4CEE5;
 Tue,  4 Mar 2025 11:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741087656;
 bh=4KFBBF3Ao5HU3HgirJAXKEK8cCaqMTH0xugNMYsYIco=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=kuctRa9E5v64bZ+7Oc2Xsl/TmkYbNrxpoVbayvVM4YOnYgC52o2+kv/QDT//qQZTg
 LoBe7Cr+vfJYA9UVmMSzWHTqUePaOk8UDKry3rqjnLELMHi/PZJfNtgXJ2IhXQL3zU
 qAw76DR1GxOcP4Tq1iP/DK+sGa2rj2L/u0905iz1oXPdQ4K5kkamcdfhE6WvSvqDPA
 nuwHsra3WoGAKl/wsCvzH+vGoEukfisjBaUMJzsCp1CdXA6fcf+Gr2fogxBU5xAqHU
 MqITI7QxBtZ50PtdfomUQAJlzNDv18N3VcxUX1WwOgnPuZGMayxoTj1niuQ17ymeSt
 J9YO6SsmazMpQ==
Date: Tue, 04 Mar 2025 05:27:34 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: airlied@gmail.com, conor+dt@kernel.org, krzk+dt@kernel.org, 
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com, 
 tzimmermann@suse.de, simona@ffwll.ch, neil.armstrong@linaro.org, 
 jernej.skrabec@gmail.com, linux-kernel@vger.kernel.org, mripard@kernel.org, 
 devicetree@vger.kernel.org, jonas@kwiboo.se, rfoss@kernel.org, 
 maarten.lankhorst@linux.intel.com, dri-devel@lists.freedesktop.org
To: Liu Ying <victor.liu@nxp.com>
In-Reply-To: <20250304101530.969920-4-victor.liu@nxp.com>
References: <20250304101530.969920-1-victor.liu@nxp.com>
 <20250304101530.969920-4-victor.liu@nxp.com>
Message-Id: <174108765439.1932765.4056731627407364924.robh@kernel.org>
Subject: Re: [PATCH 3/5] dt-bindings: display: simple-bridge: Document DPI
 color encoder
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


On Tue, 04 Mar 2025 18:15:28 +0800, Liu Ying wrote:
> A DPI color encoder, as a simple display bridge, converts input DPI color
> coding to output DPI color coding, like Adafruit Kippah DPI hat[1] which
> converts input 18-bit pixel data to 24-bit pixel data(with 2 low padding
> bits in every color component though). Document the DPI color encoder.
> 
> [1] https://learn.adafruit.com/adafruit-dpi-display-kippah-ttl-tft/downloads
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  .../display/bridge/simple-bridge.yaml         | 89 ++++++++++++++++++-
>  1 file changed, 87 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/bridge/simple-bridge.example.dtb: /example-1/bridge: failed to match any schema with compatible: ['dpi-color-enoder']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250304101530.969920-4-victor.liu@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

