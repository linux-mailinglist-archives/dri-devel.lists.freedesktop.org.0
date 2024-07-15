Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0FB931CB3
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 23:43:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE6C710E1AD;
	Mon, 15 Jul 2024 21:43:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dKbBcDjK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A0C10E1AD
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 21:43:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8CF06CE1082;
 Mon, 15 Jul 2024 21:43:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97E1DC32782;
 Mon, 15 Jul 2024 21:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721079801;
 bh=T+QZtx2h4IduRZk0idxoI2YILjDJIPQFE6ClNUWQLP4=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=dKbBcDjKIp79JdN6eAA3Og3IUymkMs28WgwmtrRoIHGv2o3pasmG0PmDS8Qc9lrG/
 /Zbqd3hx4PCkBFYd2fHrZ0EuFT+JMLCpI3L4H6/kAp4F09hP8ymwUJOYiqulGbWget
 eGAkQepUsN+pAHpSaUZVG+fUwBdXKisUqxId9LCJg72OJC3W8UKTEdpYj2lh7amgxj
 Z3o3qgBmcXTE4jcDeniZX7LvQ8UMieds67It1miyyEil5zdK0jWt4b0kELTE393mns
 wcGxhnEBEbXyOxzHINllXBMgdnBiGU7qfbtPGOYVBEu33YeCcPjVbk/1Th4dPUD/j3
 FdmTLXtAA0uZA==
Date: Mon, 15 Jul 2024 15:43:19 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Aradhya Bhatia <a-bhatia1@ti.com>
Cc: Devicetree List <devicetree@vger.kernel.org>, 
 Francesco Dolcini <francesco@dolcini.it>, Jai Luthra <j-luthra@ti.com>, 
 David Airlie <airlied@gmail.com>, 
 Linux Kernel List <linux-kernel@vger.kernel.org>, 
 Jayesh Choudhary <j-choudhary@ti.com>, Conor Dooley <conor+dt@kernel.org>, 
 Udit Kumar <u-kumar1@ti.com>, Randolph Sapp <rs@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Nishanth Menon <nm@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Praneeth Bajjuri <praneeth@ti.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 DRI Development List <dri-devel@lists.freedesktop.org>, 
 Alexander Sverdlin <alexander.sverdlin@siemens.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20240715200953.1213284-4-a-bhatia1@ti.com>
References: <20240715200953.1213284-1-a-bhatia1@ti.com>
 <20240715200953.1213284-4-a-bhatia1@ti.com>
Message-Id: <172107979988.1595945.9666141982402158422.robh@kernel.org>
Subject: Re: [PATCH v2 3/4] dt-bindings: display: ti,am65x-dss: Add OLDI
 properties for AM625 DSS
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


On Tue, 16 Jul 2024 01:39:52 +0530, Aradhya Bhatia wrote:
> The DSS in AM625 SoC has 2 OLDI TXes. Refer the OLDI schema to add the
> support for the OLDI TXes.
> 
> The AM625 DSS VP1 (port@0) can connect and control 2 OLDI TXes, to use
> them in dual-link or cloned single-link OLDI modes. Add support for an
> additional endpoint under the port@0 to accurately depict the data flow
> path.
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
>  .../bindings/display/ti/ti,am65x-dss.yaml     | 134 ++++++++++++++++++
>  1 file changed, 134 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml: oldi-txes: Missing additionalProperties/unevaluatedProperties constraint

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240715200953.1213284-4-a-bhatia1@ti.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

