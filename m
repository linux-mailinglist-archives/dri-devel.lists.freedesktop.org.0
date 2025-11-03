Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB0EC2BA3B
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 13:23:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FA1C10E11D;
	Mon,  3 Nov 2025 12:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="h5TUZXfL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEEE610E11D
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 12:23:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DD860600AC;
 Mon,  3 Nov 2025 12:23:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 714EFC4CEE7;
 Mon,  3 Nov 2025 12:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762172622;
 bh=EpC/d8RctC6D2NqwJF4B8XkTUMtzK+hUR+NvmNGudxM=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=h5TUZXfLSIYFJ+C2cLV9ax0DJ161K5smtwnP3xVGkkdPTXt40U284gb0Z/uV23oSF
 elCBcizGdQdFT13oahVuNhzFbdCjQfPxXIENiKiq5Nen29yLa6+qoy6dbvCY8nGdw0
 B/Wmuf8HxrgRReePKt492QshgpvpYibWOY1JFHSahs84eRJOKAmLAOrdp66d7DUvQd
 ++bIkcue+qPCUlSWNpZ2V+TstCOtylg+TX1nOBTK0kAIjkHC27j14q8dfMf/d4+PIy
 QG9gFqW5onW2zICCz9yP/hCLXCx7mXDGN+vT2NkYb3LU1xawhoRVf9QnfcDqD73ige
 o7JeGFN/HglMg==
Date: Mon, 03 Nov 2025 06:23:40 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Pengyu Luo <mitltlatltl@gmail.com>, 
 Daniel Thompson <danielt@kernel.org>, linux-leds@vger.kernel.org, 
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 linux-fbdev@vger.kernel.org
To: Junjie Cao <caojunjie650@gmail.com>
In-Reply-To: <20251103110648.878325-2-caojunjie650@gmail.com>
References: <20251103110648.878325-1-caojunjie650@gmail.com>
 <20251103110648.878325-2-caojunjie650@gmail.com>
Message-Id: <176217262093.2953282.2008834134717044680.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: backlight: Add Awinic
 AW99706 backlight
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


On Mon, 03 Nov 2025 19:06:47 +0800, Junjie Cao wrote:
> From: Pengyu Luo <mitltlatltl@gmail.com>
> 
> Add Awinic AW99706 backlight binding documentation.
> 
> Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
> ---
> Changes in v2:
> - use proper units for properties (Krzysztof)
> - drop non-fixed properties (Krzysztof)
> - add properties(max-brightness, default-brightness) (Krzysztof)
> - Link to v1: https://lore.kernel.org/linux-leds/20251026123923.1531727-2-caojunjie650@gmail.com
> 
>  .../leds/backlight/awinic,aw99706.yaml        | 100 ++++++++++++++++++
>  1 file changed, 100 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/awinic,aw99706.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/leds/backlight/awinic,aw99706.yaml:39:111: [warning] line too long (113 > 110 characters) (line-length)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251103110648.878325-2-caojunjie650@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

