Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2408A9C86
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 16:17:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C50113CE2;
	Thu, 18 Apr 2024 14:17:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fX15OLhh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1F6113CDB
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 14:17:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E8B3A61867;
 Thu, 18 Apr 2024 14:17:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66EC4C4AF18;
 Thu, 18 Apr 2024 14:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713449853;
 bh=g3bociu/TKxYjBLoEsR045a0G3zCwH9uH+OLKgq63aY=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=fX15OLhhfVGSOCLKc7dIm4096I52YHgwNfdFqGAYQjhxNN63qVKdmqjw4nQI1OOeL
 Q3tXx0IDqscekZYeRUmryyJpO5D2pm34mY24QVo8AhEjD1bcsBUlU3ZM0inq7YEwS6
 uaZEtHve9eO4Hc/e2LEsE4K3utZC58IfdYU8j2MFTLLAh/hteP5qVKwP+cPt9xnsCp
 gI1uOJo1IK3wUNRUW8k6h7c0/syPGFaGvg0KXH0wN8ieeiW/pt65tefskjbjRPABUC
 Ss9Tw6mkZDrwLkZPvFYT5ug3jHqcwFSwZoz5PHdcvKqoiwsQtak3DAZZwx/N4I9/g5
 f4zVVMFJYyLvQ==
Date: Thu, 18 Apr 2024 09:17:32 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: lvzhaoxiong <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: dmitry.torokhov@gmail.com, conor+dt@kernel.org, dianders@google.com, 
 hsinyi@google.com, krzysztof.kozlowski+dt@linaro.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 benjamin.tissoires@redhat.co, devicetree@vger.kernel.org, jikos@kernel.org
In-Reply-To: <20240418124815.31897-2-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240418124815.31897-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240418124815.31897-2-lvzhaoxiong@huaqin.corp-partner.google.com>
Message-Id: <171344985111.1370788.4070620666918735217.robh@kernel.org>
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


On Thu, 18 Apr 2024 20:48:14 +0800, lvzhaoxiong wrote:
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240418124815.31897-2-lvzhaoxiong@huaqin.corp-partner.google.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

