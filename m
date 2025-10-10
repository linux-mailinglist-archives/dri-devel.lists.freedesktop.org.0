Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 392C3BCCDBC
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 14:23:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9586A10E2A3;
	Fri, 10 Oct 2025 12:23:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aeRIWE7N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB4CD10E2A3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 12:23:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8D58F49C4D;
 Fri, 10 Oct 2025 12:23:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40CA1C4CEF8;
 Fri, 10 Oct 2025 12:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760098989;
 bh=Ntjn9fyuKnQVUZGVjj8nFGhDuIRoBdlR6hdaZ6+9248=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=aeRIWE7Nho+YE8ZLRMc6f0tSRqNjyMPiPRmTtbgSzSvoP/GTGAUVqCoyOEiSxwBxn
 hommapvhNPLPNYQXCQJUI6K//7DBg3KAh3MchfLMURL3H1JJNczCKHViGILZSd3l99
 nmncKadPtwmja/jWelb8G5M3gsL4G8PbUxj7Zi6qgotCqmfIGXb4tZAl7VnJ7lA8JK
 8rM1uOm4M7iy38J5GEvmea4HqBEfswmikh896tdKYo/h6dttDwd1kD8WI/uFHycu3j
 RAOEjhuwMQOV73qaIxPCRwd9oAptkjVpRZf7AdgNylGzDPNotx9plvBhV35neRWMiK
 B306Xkw9iogrg==
Date: Fri, 10 Oct 2025 07:23:08 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: mripard@kernel.org, devicetree@vger.kernel.org, 
 jessica.zhang@oss.qualcomm.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, airlied@gmail.com, 
 neil.armstrong@linaro.org, tzimmermann@suse.de, dianders@chromium.org, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, conor+dt@kernel.org, 
 krzk+dt@kernel.org
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
In-Reply-To: <20251010093751.2793492-2-yelangyan@huaqin.corp-partner.google.com>
References: <20251010093751.2793492-1-yelangyan@huaqin.corp-partner.google.com>
 <20251010093751.2793492-2-yelangyan@huaqin.corp-partner.google.com>
Message-Id: <176009896093.7733.11526501318381620350.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: Add Tianma
 TL121BVMS07-00 panel
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


On Fri, 10 Oct 2025 17:37:50 +0800, Langyan Ye wrote:
> Add device tree bindings for the Tianma TL121BVMS07-00 12.1-inch
> MIPI-DSI TFT LCD panel. The panel is based on the Ilitek IL79900A
> controller.
> 
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> ---
>  .../display/panel/ilitek,il79900a.yaml        | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,il79900a.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/ilitek,il79900a.example.dtb: panel@0 (tianma,il79900a): 'backlight' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/panel/ilitek,il79900a.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251010093751.2793492-2-yelangyan@huaqin.corp-partner.google.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

