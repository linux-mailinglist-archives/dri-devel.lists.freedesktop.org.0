Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 480BB9E1F05
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 15:25:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9226010EA1E;
	Tue,  3 Dec 2024 14:25:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="P1QUk00R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2DF410EA1E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 14:25:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1B5995C61C2;
 Tue,  3 Dec 2024 14:24:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74ECAC4CECF;
 Tue,  3 Dec 2024 14:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733235900;
 bh=2YzBw+E/SaxJ/Xhevrp8m+nYUF9iMZkfbG7PMPw8nWI=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=P1QUk00RJ2PQq+Qud5Wj6Mzq39OAz31Fl9JSjIedmjs2mJ5LYOEWDr9s8NMXluet/
 SS/ffNdlXggtzaImkIfGRdUEWBUUpQDQZP/g/a37xT8spsdDDvWreHJHAdROhfznQM
 nVCIfbP+cvg2lAud0q8TOme+5AzThCyB6tr3k1+0akaLGEPOdMr+FXUBc67yNp49+M
 1MCOAP/YHePnW+FLTlivfy7VPudy/TpYmHlo0YbMwK6Q0NnwQu/auewyxZT0LWN3F/
 Jm2Mc62VpmD/14mm30U5n0xjHkbldkxTaQgc3g9swouxv/61KjDqFLTsEVYEul4DFz
 jJvsOi0VhCcYg==
Date: Tue, 03 Dec 2024 08:24:59 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: maarten.lankhorst@linux.intel.com, aou@eecs.berkeley.edu, 
 wefu@redhat.com, jassisinghbrar@gmail.com, jszhang@kernel.org, 
 mturquette@baylibre.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, ulf.hansson@linaro.org, mripard@kernel.org, 
 linux-kernel@vger.kernel.org, frank.binns@imgtec.com, 
 matt.coster@imgtec.com, linux-riscv@lists.infradead.org, 
 linux-pm@vger.kernel.org, guoren@kernel.org, sboyd@kernel.org, 
 linux-clk@vger.kernel.org, m.szyprowski@samsung.com, drew@pdp7.com, 
 krzk+dt@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
 airlied@gmail.com, simona@ffwll.ch, tzimmermann@suse.de, 
 conor+dt@kernel.org
To: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20241203134137.2114847-6-m.wilczynski@samsung.com>
References: <20241203134137.2114847-1-m.wilczynski@samsung.com>
 <CGME20241203134155eucas1p1e90c71c4f8eb5da41d2cc8a500f54dc7@eucas1p1.samsung.com>
 <20241203134137.2114847-6-m.wilczynski@samsung.com>
Message-Id: <173323589655.1743530.2406812042403623910.robh@kernel.org>
Subject: Re: [RFC PATCH v1 05/14] dt-bindings: clock: thead,th1520: Add
 support for Video Output subsystem
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


On Tue, 03 Dec 2024 14:41:28 +0100, Michal Wilczynski wrote:
> The device tree bindings for the T-Head TH1520 SoC clocks currently
> support only the Application Processor (AP) subsystem. This commit
> extends the bindings to include the Video Output (VO) subsystem clocks.
> 
> Update the YAML schema to define the VO subsystem clocks, allowing the
> clock driver to configure and manage these clocks appropriately. This
> addition is necessary to enable the proper operation of the video output
> features on the TH1520 SoC.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../bindings/clock/thead,th1520-clk-ap.yaml   | 31 +++++++++++++++----
>  1 file changed, 25 insertions(+), 6 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241203134137.2114847-6-m.wilczynski@samsung.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

