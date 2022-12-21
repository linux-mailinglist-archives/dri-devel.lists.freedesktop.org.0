Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0267653200
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 14:46:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4245F10E094;
	Wed, 21 Dec 2022 13:46:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com
 [209.85.160.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E41110E094
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 13:46:01 +0000 (UTC)
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-144b21f5e5fso19153676fac.12
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 05:46:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TEqm+cWQNHqjxZ1dYY94SUrdlxLeTyeNr9UU8bL+CN4=;
 b=wdxkb7M1LacPHQ+HunbgBAXF1p4VhBl2JUQ6xJprRpQ8egYqB16OLDrnCryS+m4hLo
 qNZ54gh1WnhLTMK9hJ3ReIsI3C7EhoFOglJxk6lj0dX1VqbLYuT0ZepbQlKMRKNCHZow
 i5cDDhbZBKaNPSlGvBi2VrF+0TJLt9VXzF6x8E0/dZ2j0djQBF9IEOs7c6wmoKxdPXgX
 SQqV4LeRtoRYDjfbh4tm7OjJRFu/WwE7fdnAqtMBVr97shYAYpUkkowjMpuI5QnfqiI1
 b9/65ZGjXahIJSmYRkSd5f8UASusYr/P+mNk2+vn/zf7IxG5heyhe/w7bsuhPJuQ1bO9
 OBxw==
X-Gm-Message-State: AFqh2kpMxqPaQlVAkUBcW5Jdax17h03PmlkryIugFprPOONJ/lYzwh+G
 47gtnQUmCA+kTzZS3lnqzQ==
X-Google-Smtp-Source: AMrXdXshd+N5tqnvx4BjYWqMK259JeDpgS2H3sA2FNIH3uuAerbwEWb38/uWerAxzHpfXw2bAA+a7A==
X-Received: by 2002:a05:6870:40c8:b0:148:15ba:8869 with SMTP id
 l8-20020a05687040c800b0014815ba8869mr996840oal.8.1671630360299; 
 Wed, 21 Dec 2022 05:46:00 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 n22-20020a056870559600b0014435b51ef7sm7304861oao.30.2022.12.21.05.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 05:45:59 -0800 (PST)
Received: (nullmailer pid 2733906 invoked by uid 1000);
 Wed, 21 Dec 2022 13:45:59 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Jianhua Lu <lujianhua000@gmail.com>
In-Reply-To: <20221221070216.17850-1-lujianhua000@gmail.com>
References: <20221221070216.17850-1-lujianhua000@gmail.com>
Message-Id: <167162961165.2717636.4535164259604449279.robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: leds: backlight: add binding for Kinetic
 KTZ8866 backlight
Date: Wed, 21 Dec 2022 07:45:59 -0600
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
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 21 Dec 2022 15:02:16 +0800, Jianhua Lu wrote:
> Add device tree bindings for the Kinetic KTZ8866 backlight driver.
> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---
>  .../leds/backlight/kinetic,ktz8866.yaml       | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml: properties:compatible:items: {'const': 'kinetic,ktz8866'} is not of type 'array'
	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221221070216.17850-1-lujianhua000@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

