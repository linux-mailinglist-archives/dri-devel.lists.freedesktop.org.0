Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B272D9D79EF
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 03:06:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A4DD10E06F;
	Mon, 25 Nov 2024 02:06:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MYCyg9Na";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31B6510E06F
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 02:06:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DCCA25C5826;
 Mon, 25 Nov 2024 02:06:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B31A7C4CED9;
 Mon, 25 Nov 2024 02:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732500412;
 bh=Gu5Wu6oqy5RrPJGF75jiB8mV6u7GUvi00veqq4oAV6I=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=MYCyg9Na2ZSPDLA10+VfV7vvGR536PZbxkdwlN9SVGiZXCNzmI4JkyDU4ml3fYcz8
 HOYLlKb2i8HldOFxv15S6gVnl2YWa8yYMfxL9gqs9YYgLXWpcE/DVzlDug1xD9AIUs
 xgoTY0HkEL1a5n/pQBK1zMeJRptg9wNThp07WVrBCiIL5cFOpefCPGp8BjBHUqKHRN
 Kbj7ZpslOPuKDpu1i7WKRP9xiMw7t1d3k3MO99sMOmwKaAaBDL0ISNZb4MUcli10bc
 r/JBxZUf/mUqJvtjdoBd7DjhpSa0A2R2aT6B04oJ2vAL0JntI9gx2hsAYXZvxVmRzC
 wk+GWhxiBC0VA==
Date: Sun, 24 Nov 2024 20:06:51 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, asahi@lists.linux.dev, 
 David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 linux-arm-kernel@lists.infradead.org, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Hector Martin <marcan@marcan.st>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Simona Vetter <simona@ffwll.ch>, 
 Sven Peter <sven@svenpeter.dev>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
In-Reply-To: <20241124-adpdrm-v1-1-3191d8e6e49a@gmail.com>
References: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com>
 <20241124-adpdrm-v1-1-3191d8e6e49a@gmail.com>
Message-Id: <173250040970.6667.2839660338071681474.robh@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindgins: display: Add Apple pre-DCP display
 controller bindings
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


On Sun, 24 Nov 2024 23:29:24 +0100, Sasha Finkelstein wrote:
> Add bindings for a secondary display controller present on certain
> Apple laptops.
> 
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  .../bindings/display/apple,display-pipe.yaml       | 59 ++++++++++++++++++++++
>  .../bindings/display/panel/apple,summit.yaml       | 24 +++++++++
>  2 files changed, 83 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/display/apple,display-pipe.yaml:21:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241124-adpdrm-v1-1-3191d8e6e49a@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

