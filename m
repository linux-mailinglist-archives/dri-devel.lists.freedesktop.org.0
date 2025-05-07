Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF191AAEEFE
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 01:07:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C570710E202;
	Wed,  7 May 2025 23:07:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="teQm3MgY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63CED10E1C2;
 Wed,  7 May 2025 23:07:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 25F545C5F44;
 Wed,  7 May 2025 23:04:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 007F1C4CEE2;
 Wed,  7 May 2025 23:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746659234;
 bh=Tj+CpAv5Rlb15mBsouZqKDGarni4Uxcs5ytEL68aR8w=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=teQm3MgY/JIOJmtEzPcr940QQslHKja74ESjbeSSXw2N1lQ2wpNV+KNvY+ZsRY35y
 ckTdJoVtTkVnebvVJQAj7dfVo5RSrarAFX1px/KQ/G+V0y+vBSTRT1AewGiQkhmPaQ
 9Ez1/qKN28APvlNqNFPHQosGOdAXxTgD/H9j+IcQliIOXyCME8yesdmN5y93BfaDRA
 CWEHcKrFWRzLj85HUMxxSQ3lUMcBUUrseNYsQrMDubILNoFSjydlFaZKG92zokp4XJ
 +OU2IVV6nQrlyeoCAdkh/oayg5J94HVmjagDeYgc19OFzgSkLIItgzf+euof0aMAUw
 zXiG4YkmOt5PQ==
Date: Wed, 07 May 2025 18:07:12 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 Thomas Zimmermann <tzimmermann@suse.de>
To: "Rob Herring (Arm)" <robh@kernel.org>
In-Reply-To: <20250507215912.2748964-1-robh@kernel.org>
References: <20250507215912.2748964-1-robh@kernel.org>
Message-Id: <174665922903.2893840.15913516766743050523.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display/msm: hdmi: Fix constraints on
 additional 'port' properties
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


On Wed, 07 May 2025 16:59:12 -0500, Rob Herring (Arm) wrote:
> The MSM HDMI port nodes are missing any restrictions on additional
> properties. The $ref should be to "/properties/port" rather than
> "/$defs/port-base" as there are not additional properties in the nodes
> to define.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/display/msm/hdmi.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250507215912.2748964-1-robh@kernel.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

