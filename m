Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A6A9E227F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 16:25:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 804C410E205;
	Tue,  3 Dec 2024 15:25:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BibNDSdI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8255C10E205
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 15:25:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 16E54A416B5;
 Tue,  3 Dec 2024 15:23:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4D98C4CECF;
 Tue,  3 Dec 2024 15:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733239518;
 bh=X/PwEvQP5tU0vB8EoXqX3xfn/sW++pmyf4vXD3OCWfI=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=BibNDSdIxD5dJNes1vJ7140QWABbcfK++KnAHPuRH34JJyltkmOovhdFy1ythpMcf
 Jgt+X0vAfjdECQevLJNkTTtUM9aIJAefQRcN5aRk2mOXcIzItQZYV+TYYf9kHkbMsN
 JB43bQz718szORF+xGZB1wrbaN6402z/7dJ/e1OMHJI4QMRkr2M/Wup8ldZAAW0bHL
 arhJtg9HrfmdBNiCy15xVrQcxPODNLdMDZXsFOpjw4CqjZyn88aCXAoj1G/CVJOTCa
 OLhJ7kNSWUAGXTiDqyC6R2x/C0ATmOvC9ytIP2sxvUPXMX5LD7v2D0pMT91r9TTHee
 kco2TN/wiPeGg==
Date: Tue, 03 Dec 2024 09:25:16 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: m.szyprowski@samsung.com, frank.binns@imgtec.com, 
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 paul.walmsley@sifive.com, jszhang@kernel.org, 
 linux-riscv@lists.infradead.org, ulf.hansson@linaro.org, 
 mturquette@baylibre.com, wefu@redhat.com, conor+dt@kernel.org, 
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org, 
 airlied@gmail.com, aou@eecs.berkeley.edu, matt.coster@imgtec.com, 
 guoren@kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 sboyd@kernel.org, simona@ffwll.ch, drew@pdp7.com, krzk+dt@kernel.org, 
 jassisinghbrar@gmail.com, mripard@kernel.org, palmer@dabbelt.com, 
 tzimmermann@suse.de
To: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20241203134137.2114847-9-m.wilczynski@samsung.com>
References: <20241203134137.2114847-1-m.wilczynski@samsung.com>
 <CGME20241203134159eucas1p1eafefef0dfe7f2b6343a639733012bcf@eucas1p1.samsung.com>
 <20241203134137.2114847-9-m.wilczynski@samsung.com>
Message-Id: <173323951617.1836905.12806289628083482638.robh@kernel.org>
Subject: Re: [RFC PATCH v1 08/14] dt-bindings: power: thead,th1520: Add
 support for power domains
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


On Tue, 03 Dec 2024 14:41:31 +0100, Michal Wilczynski wrote:
> Add power domain support to the Thead TH1520 clock controller bindings.
> This enables devices to specify their power domain dependencies,
> improving power management for components like the GPU.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../bindings/power/thead,th1520-power.yaml    | 52 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/thead,th1520-power.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/power/thead,th1520-power.example.dtb: vosys@ffef528000: compatible: ['syscon'] is too short
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/power/thead,th1520-power.example.dtb: vosys@ffef528000: reg: [[255, 4015161344], [0, 4096]] is too long
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241203134137.2114847-9-m.wilczynski@samsung.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

