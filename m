Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40036AC8225
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 20:27:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8076610E21E;
	Thu, 29 May 2025 18:27:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="A5+bEy2q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11DD510E767
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 18:27:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7726860010;
 Thu, 29 May 2025 18:27:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC670C4CEE7;
 Thu, 29 May 2025 18:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748543260;
 bh=tUOd0i9aWh62z/M/bOtetrCc2SMGSBcYIhoErkaGfCQ=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=A5+bEy2qePCV8yhkkEUkuAJXwp7ssYOxnY4DRDNXrRySqVYq/nj1yky0Gj1X6oSUj
 643A7syOHwYmaSCtb9ttZubWFzSR8yOxkHt441Qa+2K7LeUcUVVCVagA+MngJyS0YJ
 yiTGsAx1xrgVd4u6tFsuPZgxqnWEjy0Cbpm2Tb0JX/07iMJm65zTA7vHKq33qqddEA
 ZWhp94VWaXHS3hcEtZZYO8wi6lCPUlmYa5pb6UIiTdkCog26rAP+HV85Q7SVrOAYy6
 BMux35qsRSjTyCR2G2fjqRTB41Qr2Upw1aYYK42hpVP0si6Mu/patsuAVaTqyZBJLm
 UytRZvmITofLA==
Date: Thu, 29 May 2025 13:27:38 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, 
 dri-devel@lists.freedesktop.org, Simona Vetter <simona@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20250529164822.777908-1-Frank.Li@nxp.com>
References: <20250529164822.777908-1-Frank.Li@nxp.com>
Message-Id: <174854325819.3595451.10273154567966477690.robh@kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: display: convert himax,hx8357d.txt to
 yaml format
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


On Thu, 29 May 2025 12:48:21 -0400, Frank Li wrote:
> Convert himax,hx8357d.txt to yaml format.
> 
> Additional changes:
> - add spi parent node in examples.
> - ref to spi-peripheral-props.yaml.
> - change himax,hx8357a to himax,hx8357 to align driver and existed dts.
> - add himax,hx8369a and fallback to himax,hx8369.
> - allow gpios-reset, spi-cpha and spi-cpol to align existed dts.
> - add im-gpios for interface selections.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/display/himax,hx8357.yaml        | 77 +++++++++++++++++++
>  .../bindings/display/himax,hx8357d.txt        | 26 -------
>  2 files changed, 77 insertions(+), 26 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/himax,hx8357.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/himax,hx8357d.txt
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/himax,hx8357.yaml: gpios-reset: missing type definition

doc reference errors (make refcheckdocs):
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/himax,hx8357d.txt
MAINTAINERS: Documentation/devicetree/bindings/display/himax,hx8357d.txt

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250529164822.777908-1-Frank.Li@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

