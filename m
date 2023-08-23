Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D02278537D
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 11:08:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1168F10E3FF;
	Wed, 23 Aug 2023 09:08:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1808310E3FF
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 09:08:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4D7AF60DC4;
 Wed, 23 Aug 2023 09:08:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0160C433C8;
 Wed, 23 Aug 2023 09:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692781720;
 bh=H4akoTsFqgDveGtXgAv0yH52y77xn/v60Efi9ZHUW+o=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=lEvfAdLHwqQIfmwZEt7iDPX5wRYFubMK/7NWmhTfAq1HWhIpEky0F1l6hiyXcHgfP
 Qk6kdt6NHjs/lgL27WisLr5Sd3eqYIvURXjtMxN01TIoX0SOaQb9e+TZjAJPZcqWk8
 +7x4JOt8S3lYUXwLEfVIj2oLyQm7Zf+3vXkFh5CUCYO1HhJIyYFnvzuSQMw3LOeLUF
 SWyjXAuIigv/VP+4XN9RULymXb/zL/5pxGNvQl+QGFuruFb67YrQA0DecF9UWHlSD0
 GriuVtEkZK6xfydSfIOlgUjnul3VsfGqov+kyu8+nPqhuYEOcLAm5Q40XkoxLQo3pW
 dZz8lsgjelfOw==
Received: (nullmailer pid 1524828 invoked by uid 1000);
 Wed, 23 Aug 2023 09:08:37 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230823081500.84005-2-krzysztof.kozlowski@linaro.org>
References: <20230823081500.84005-1-krzysztof.kozlowski@linaro.org>
 <20230823081500.84005-2-krzysztof.kozlowski@linaro.org>
Message-Id: <169278171739.1524810.6441506448861500441.robh@kernel.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: display: novatek,nt35950: define ports
Date: Wed, 23 Aug 2023 04:08:37 -0500
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Jianhua Lu <lujianhua000@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 23 Aug 2023 10:14:59 +0200, Krzysztof Kozlowski wrote:
> The panel-common schema does not define what "ports" property is, so
> bring the definition by referencing the panel-common-dual.yaml. Panels
> can be single- or dual-link, thus require only one port@0.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes since v2:
> 1. Use panel-common-dual
> 
> Changes since v1:
> 1. Rework to add ports to device schema, not to panel-common.
> ---
>  .../devicetree/bindings/display/panel/novatek,nt35950.yaml     | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/novatek,nt35950.yaml:
Error in referenced schema matching $id: http://devicetree.org/schemas/display/panel/panel-common-dual.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/novatek,nt35950.example.dtb: panel@0: False schema does not allow {'compatible': ['sharp,ls055d1sx04', 'novatek,nt35950'], 'reg': [[0]], 'backlight': [[4294967295]], 'reset-gpios': [[4294967295, 94, 0]], 'avdd-supply': [[4294967295]], 'avee-supply': [[4294967295]], 'dvdd-supply': [[4294967295]], 'vddio-supply': [[4294967295]], 'ports': {'#address-cells': [[1]], '#size-cells': [[0]], 'port@0': {'reg': [[0]], 'endpoint': {'remote-endpoint': [[4294967295]]}}, 'port@1': {'reg': [[1]], 'endpoint': {'remote-endpoint': [[4294967295]]}}}, '$nodename': ['panel@0']}
	from schema $id: http://devicetree.org/schemas/display/panel/novatek,nt35950.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230823081500.84005-2-krzysztof.kozlowski@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

