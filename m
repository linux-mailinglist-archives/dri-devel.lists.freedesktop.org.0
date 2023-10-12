Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4728D7C6657
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 09:24:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F34D10E115;
	Thu, 12 Oct 2023 07:24:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF5F710E115
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 07:23:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CC6F1CE2555;
 Thu, 12 Oct 2023 07:23:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 849A3C433CA;
 Thu, 12 Oct 2023 07:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697095436;
 bh=hkw3GPAiv3QqU91HXOgB/Ith+aGeVqJdKk6L8jddygI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=UcQnC693fcCYJEIdqIGncIc2MkU8dRRhRl8UGYKg8UXWSmEtvl5Igbu8rz8HaKJKK
 SLpSqhJCWU+hynzbei9nk0NTLqDvGpeEK7Dcn3Wz5MG8iI3fFPHAsd9WWjN6tYfFJH
 24arMGPIsnrNZFTIqH+osU2fmL5YQkW8WhGDG+bJjRUgJQEO9MSK4CLo5eRrLnfIh7
 OpEwVtdwCBfxPYZXRy188se1JThva4MmUjqTQPQeAcLriymhKVeRjvraDdV6gO7Y/T
 k3+D6I2eT1dzLhbvQHCfOtYeC/W2/cYHg7MKjO1g+pUfAEGEYkQXDdqUlg9+jR6bw4
 /x7nIz+GmvVJw==
Received: (nullmailer pid 3961449 invoked by uid 1000);
 Thu, 12 Oct 2023 07:23:54 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20231012065822.1007930-6-javierm@redhat.com>
References: <20231012065822.1007930-1-javierm@redhat.com>
 <20231012065822.1007930-6-javierm@redhat.com>
Message-Id: <169709543435.3961410.18389221947480753316.robh@kernel.org>
Subject: Re: [PATCH v2 5/6] dt-bindings: display: Split common Solomon
 properties in their own schema
Date: Thu, 12 Oct 2023 02:23:54 -0500
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
Cc: Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 12 Oct 2023 08:58:14 +0200, Javier Martinez Canillas wrote:
> There are DT properties that can be shared across different Solomon OLED
> Display Controller families. Split them into a separate common schema to
> avoid these properties to be duplicated in different DT bindings schemas.
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
> 
> (no changes since v1)
> 
>  .../bindings/display/solomon,ssd-common.yaml  | 42 +++++++++++++++++++
>  .../bindings/display/solomon,ssd1307fb.yaml   | 28 +------------
>  MAINTAINERS                                   |  1 +
>  3 files changed, 44 insertions(+), 27 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/solomon,ssd-common.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/display/solomon,ssd-common.yaml:42:27: [error] no new line character at the end of file (new-line-at-end-of-file)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231012065822.1007930-6-javierm@redhat.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

