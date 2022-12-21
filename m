Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87993654DA9
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 09:44:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6359110E5FB;
	Fri, 23 Dec 2022 08:44:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C90A310E144
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 14:08:14 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id w26so10760846pfj.6
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 06:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rjjOsySxC8KtamJqbFsBGyGlUqooXGkZCEvhMDcPZMc=;
 b=PjlRdBqA4xcsiWU9cyQfMYZUemYMA9B0sNlIsb2eDL6j61bmg4T8jXbDt3o27xT9FE
 IRs0LOGnmBLpX5gMoQfgDo++GH3NYSX5/LNLDpPDiseQ/hVwswV1QDyyMn7iWKjzMaFM
 v0fbmRhZDSv/fBSaPyFmheGGMnrzLqc+IW9gd0ASdn2kIW2a3KZNh0XaNaSQBSmF8kAV
 y5dRAHyrcGovOtC+471UBb4bu6S8cZ7VzA+RTcW2nyaWOFUjiitKZ2XUCawCauP0CNkt
 SdvQDCg3p8HPRO04s3uUWqd9DGhTq3+2TJhB92j8/gpKUItH8XdlS9pt6Z7vn2Mgclbn
 dWZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rjjOsySxC8KtamJqbFsBGyGlUqooXGkZCEvhMDcPZMc=;
 b=UeUgYnC0fAhfo4rYPxCeEG2P44O+feiskXPE+X1++WPRPy0dhH6iX9/fSgmGscIGmQ
 t6841zxbBKlwvYt63IqHFgFpWx27q273yIlmD4v1E5bhnip7L1jR6jt0O+uWT9wA9Y3z
 UTUUWIuu2b5UH2zsKybmPUEH3E+mxeGayA6HH2Ug+GEvM9kkjxP/+hWsiVSuOffqAxXV
 CWNZ7HKUQXV6t3NxDuglBot4M8dJ2YeWtwJtcHzRA3ot4ZG8rbk03/CSHFAx+IkuAhzo
 N1kW+Ckuo85vjyhYBN7Sg/ec3HkUH7p51Q296/Jx7PNM2gtXnu3aGS+V7kxHpAqGbm2W
 0zdQ==
X-Gm-Message-State: AFqh2krvlheZTa+5wQvKibzMJbSp/p+XXOyx9w2ky2Q7EJYVT+LW0uxE
 4uthEqy/TgE7OblFY35QKpg=
X-Google-Smtp-Source: AMrXdXtyGf2rgvJjdtB6ak8nDkAHOfT0HtK/RO5tQoqnIbQHTPLGtucPkNOxJ/HFsmsWZyiTY/lJxA==
X-Received: by 2002:a62:6102:0:b0:578:3bc0:57d7 with SMTP id
 v2-20020a626102000000b005783bc057d7mr2068137pfb.13.1671631694307; 
 Wed, 21 Dec 2022 06:08:14 -0800 (PST)
Received: from Gentoo ([45.62.172.3]) by smtp.gmail.com with ESMTPSA id
 o198-20020a62cdcf000000b00575d90636dcsm10622810pfg.6.2022.12.21.06.08.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 06:08:13 -0800 (PST)
Date: Wed, 21 Dec 2022 22:08:07 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: leds: backlight: add binding for
 Kinetic KTZ8866 backlight
Message-ID: <Y6MTR0g6O0j37ogY@Gentoo>
References: <20221221070216.17850-1-lujianhua000@gmail.com>
 <167162961165.2717636.4535164259604449279.robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <167162961165.2717636.4535164259604449279.robh@kernel.org>
X-Mailman-Approved-At: Fri, 23 Dec 2022 08:44:25 +0000
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

On Wed, Dec 21, 2022 at 07:45:59AM -0600, Rob Herring wrote:
> 
> On Wed, 21 Dec 2022 15:02:16 +0800, Jianhua Lu wrote:
> > Add device tree bindings for the Kinetic KTZ8866 backlight driver.
> > 
> > Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> > ---
> >  .../leds/backlight/kinetic,ktz8866.yaml       | 37 +++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml: properties:compatible:items: {'const': 'kinetic,ktz8866'} is not of type 'array'
> 	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221221070216.17850-1-lujianhua000@gmail.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

I have resent a new patch and gotten rip of errors of the old dt-binding yaml.
