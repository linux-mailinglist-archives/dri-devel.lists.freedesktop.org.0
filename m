Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDB99E1F07
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 15:25:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 532E910EA26;
	Tue,  3 Dec 2024 14:25:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ViPykzP+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D2910EA23
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 14:25:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EA7735C61F0;
 Tue,  3 Dec 2024 14:24:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82C3FC4CED8;
 Tue,  3 Dec 2024 14:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733235902;
 bh=3TKmXmpGABry9oSTFFXvSq6pX10XyahRQRIHFkooJ9U=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=ViPykzP+sBvHyHt7Xd0oRVDSF+xonpAPnOrijJ+0Pbp26DGv0Cdvrht8+TIpc2sWE
 kJPD2rafQfO3kcF4UuE4GtuYKOBXphzyGjrTTwcTXAmzC3ez56j+n4MDHUjiRbWSTf
 96usMdwPzLVCKTZq9txbogysHjFofNHPuVnJ2Sknt4qwn1kbHYr5WqRPrDI6Pdqqap
 yRkFb5eMkdEvzsZMUdKUxD7ExbAkQ5KaFqhtfpAyH2PjJjxPeldOyIfhRbJEkI0ms0
 b/FWkBWN6+yyPWtmW3TD2UAYGwaHNxr8r8j/dGsRMFF1dS/O3IbqfkMSn0Md3+C9WO
 PHgCOkz0SFcsQ==
Date: Tue, 03 Dec 2024 08:25:00 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: mripard@kernel.org, frank.binns@imgtec.com, aou@eecs.berkeley.edu, 
 jszhang@kernel.org, sboyd@kernel.org, guoren@kernel.org, 
 m.szyprowski@samsung.com, dri-devel@lists.freedesktop.org, 
 maarten.lankhorst@linux.intel.com, wefu@redhat.com, 
 jassisinghbrar@gmail.com, simona@ffwll.ch, conor+dt@kernel.org, 
 devicetree@vger.kernel.org, mturquette@baylibre.com, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, krzk+dt@kernel.org, 
 ulf.hansson@linaro.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
 linux-riscv@lists.infradead.org, tzimmermann@suse.de, drew@pdp7.com, 
 airlied@gmail.com, matt.coster@imgtec.com, linux-pm@vger.kernel.org
To: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20241203134137.2114847-7-m.wilczynski@samsung.com>
References: <20241203134137.2114847-1-m.wilczynski@samsung.com>
 <CGME20241203134156eucas1p2326d84fcef2ee0914586122520b18dcc@eucas1p2.samsung.com>
 <20241203134137.2114847-7-m.wilczynski@samsung.com>
Message-Id: <173323589751.1743555.13494050245769190862.robh@kernel.org>
Subject: Re: [RFC PATCH v1 06/14] dt-bindings: clock: thead,th1520: Rename
 YAML schema file
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


On Tue, 03 Dec 2024 14:41:29 +0100, Michal Wilczynski wrote:
> As support for clocks from new subsystems is being added to the T-Head
> TH1520 SoC, the Device Tree binding YAML schema file name should reflect
> this broader scope.  The existing schema file 'thead,th1520-clk-ap.yaml'
> includes the '-ap' suffix, indicating it's specific to the Application
> Processor (AP) subsystem.
> 
> Rename the YAML schema file to 'thead,th1520-clk.yaml' to generalize it
> for all subsystems. Update all references to this schema file
> accordingly.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../clock/{thead,th1520-clk-ap.yaml => thead,th1520-clk.yaml}   | 2 +-
>  MAINTAINERS                                                     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename Documentation/devicetree/bindings/clock/{thead,th1520-clk-ap.yaml => thead,th1520-clk.yaml} (96%)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241203134137.2114847-7-m.wilczynski@samsung.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

