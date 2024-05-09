Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 867D68C0C5F
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 10:17:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8DB810E1FD;
	Thu,  9 May 2024 08:17:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="k03KQNyz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFAE110E30F
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 08:17:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 01D2BCE1AF1;
 Thu,  9 May 2024 08:17:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED7B2C116B1;
 Thu,  9 May 2024 08:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715242645;
 bh=y7knbMNhnUUEDsLf9YXpNk8Dd2rj+1U27Xx9O8RvkhU=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=k03KQNyzI4Jgt7FTWXq2moOeRIeA91w0d7S0bl6Q3RBgiYz4hHTYnVcMHCpIcvKqW
 TvyJASFu47clC3KwaBHVHxpLDNr0jg1xOPU15gh38ASkwcSGfpbx8+zXvm4dBhScdL
 9dNzt5YTuI3dxP6WK1edT0NGhp0A2Zbms84mqJ0yi2BjymiGTtYgbEZq1Nj8z6sovV
 G4wl0ogsM+o5Zh1BADjp9YU6VSF3sqEiuB0v6ofUlZfIacMZbdot2Mp9KZmuVe6g3K
 OOlPkAfg9Rq2YJhJCJ9JHh/q9FmkCKDLFhhM1x3V2AZm1UdQU18dJDUGB7ZWVcI7yU
 H5Imjn1GElC0Q==
Date: Thu, 09 May 2024 03:17:23 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: devicetree@vger.kernel.org, benjamin.tissoires@redhat.co, 
 dmitry.torokhov@gmail.com, krzysztof.kozlowski+dt@linaro.org, 
 jikos@kernel.org, hsinyi@google.com, dianders@google.com, 
 dri-devel@lists.freedesktop.org, conor+dt@kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240509064336.9803-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240509064336.9803-1-lvzhaoxiong@huaqin.corp-partner.google.com>
Message-Id: <171524264306.4104969.8390645355822762827.robh@kernel.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: input: i2c-hid: Introduce Ilitek
 ili2900
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


On Thu, 09 May 2024 14:43:35 +0800, Zhaoxiong Lv wrote:
> From: lvzhaoxiong <lvzhaoxiong@huaqin.corp-partner.google.com>
> 
> The ili2900 touch screen chip same as ilitek ili9882t controller
> has a reset gpio.
> 
> Signed-off-by: lvzhaoxiong <lvzhaoxiong@huaqin.corp-partner.google.com>
> ---
>  Documentation/devicetree/bindings/input/ilitek,ili9882t.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/input/ilitek,ili9882t.yaml:22:5: [error] duplication of key "const" in mapping (key-duplicates)

dtschema/dtc warnings/errors:
make[2]: *** Deleting file 'Documentation/devicetree/bindings/input/ilitek,ili9882t.example.dts'
Documentation/devicetree/bindings/input/ilitek,ili9882t.yaml:22:5: found duplicate key "const" with value "ilitek,ili2900" (original value: "ilitek,ili9882t")
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/input/ilitek,ili9882t.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/input/ilitek,ili9882t.yaml:22:5: found duplicate key "const" with value "ilitek,ili2900" (original value: "ilitek,ili9882t")
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/input/ilitek,ili9882t.yaml: ignoring, error parsing file
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1430: dt_binding_check] Error 2
make: *** [Makefile:240: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240509064336.9803-1-lvzhaoxiong@huaqin.corp-partner.google.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

