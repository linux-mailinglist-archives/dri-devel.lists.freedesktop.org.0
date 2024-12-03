Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C50679E1F02
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 15:25:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A40210E070;
	Tue,  3 Dec 2024 14:25:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Co2V7fSy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE72610E070
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 14:25:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B09225C275C;
 Tue,  3 Dec 2024 14:24:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BD77C4CED8;
 Tue,  3 Dec 2024 14:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733235899;
 bh=DKmOU7vnkUqoQgoBcoXntMTXjpSRQwhxPRgQDZ5KdtU=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=Co2V7fSy5ZfdLr+VU+LEXPhBV1RGVb3XC0N4BvcXmZle40bb/bDgxXKxbL8EWyEgX
 ehTkv5t4EHupg8b3wg66x51JtG/jCwgDNrNZadsTi2ZHt+lWO0+3bto9DKBEj3O7GW
 h1OSEnLghbB8E9MbSCd4qA0YanTnWyeS0RrZFPBPpupM4RpbLRB8IoS4HTXDRLiH6G
 ehB7Cu1myEGkH9U9L/laOJ7tr+D2U6Al15ozJGDl8ZO/kXyYtRPi8xbClkPoHEUOOI
 PdGnXBIcuYwNFgQlMDAprEzCI4d1xtIgq7EdQaHMRhzw3Vhp8aI1B+zL8bYZC5+dxT
 yVOXtExy4DzyA==
Date: Tue, 03 Dec 2024 08:24:57 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: mripard@kernel.org, m.szyprowski@samsung.com, 
 maarten.lankhorst@linux.intel.com, mturquette@baylibre.com, 
 aou@eecs.berkeley.edu, tzimmermann@suse.de, frank.binns@imgtec.com, 
 simona@ffwll.ch, wefu@redhat.com, jszhang@kernel.org, 
 linux-pm@vger.kernel.org, drew@pdp7.com, guoren@kernel.org, 
 palmer@dabbelt.com, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, paul.walmsley@sifive.com, 
 linux-clk@vger.kernel.org, ulf.hansson@linaro.org, 
 linux-kernel@vger.kernel.org, krzk+dt@kernel.org, sboyd@kernel.org, 
 dri-devel@lists.freedesktop.org, matt.coster@imgtec.com, airlied@gmail.com, 
 jassisinghbrar@gmail.com, conor+dt@kernel.org
To: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20241203134137.2114847-3-m.wilczynski@samsung.com>
References: <20241203134137.2114847-1-m.wilczynski@samsung.com>
 <CGME20241203134151eucas1p18edf7fb37cd8f30983a559d7481f560b@eucas1p1.samsung.com>
 <20241203134137.2114847-3-m.wilczynski@samsung.com>
Message-Id: <173323589571.1743485.13611709278152187222.robh@kernel.org>
Subject: Re: [RFC PATCH v1 02/14] dt-bindings: clock: thead,th1520: Rename
 header file
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


On Tue, 03 Dec 2024 14:41:25 +0100, Michal Wilczynski wrote:
> As support for clocks from new subsystems is being added to the T-Head
> TH1520 SoC, the header file name should reflect this broader scope. The
> existing header file 'thead,th1520-clk-ap.h' includes the '-ap' suffix,
> indicating it's specific to the Application Processor (AP) subsystem.
> 
> Rename the header file to 'thead,th1520-clk.h' to generalize it for all
> subsystems.  Update all references to this header file accordingly.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../devicetree/bindings/clock/thead,th1520-clk-ap.yaml        | 4 ++--
>  .../devicetree/bindings/mailbox/thead,th1520-mbox.yaml        | 2 +-
>  MAINTAINERS                                                   | 2 +-
>  arch/riscv/boot/dts/thead/th1520.dtsi                         | 2 +-
>  drivers/clk/thead/clk-th1520.h                                | 2 +-
>  .../clock/{thead,th1520-clk-ap.h => thead,th1520-clk.h}       | 0
>  6 files changed, 6 insertions(+), 6 deletions(-)
>  rename include/dt-bindings/clock/{thead,th1520-clk-ap.h => thead,th1520-clk.h} (100%)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.example.dts:24:18: fatal error: dt-bindings/clock/thead,th1520-clk.h: No such file or directory
   24 |         #include <dt-bindings/clock/thead,th1520-clk.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.example.dts:18:18: fatal error: dt-bindings/clock/thead,th1520-clk.h: No such file or directory
   18 |         #include <dt-bindings/clock/thead,th1520-clk.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.example.dtb] Error 1
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1506: dt_binding_check] Error 2
make: *** [Makefile:251: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241203134137.2114847-3-m.wilczynski@samsung.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

