Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E9C56D037
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 18:54:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92A3112A3EC;
	Sun, 10 Jul 2022 16:54:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DB7412A3EC
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 16:54:19 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id m20so1523294ili.3
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 09:54:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=srd0SwVtQLc3vr70hEtn2ikS3RE4F1eFzPfbFQeWgLU=;
 b=dg5IyF3QgMba1Wd3n6QMVK4uof7jachTiLV4+hCe3Q1OfzPdTYsoVhwdtFiNSCBZqv
 blkarY+aiUAZKB8suFYKwUYZ7BiAqKSjFGvpjdTnzcZYJDD978MN+ZA2x/3cF44xnxEK
 1g+17aJZochhErrRQHS8ZbHdNxZiTEkoqKjAo/LL952qpdQ1AEWk6Ria7gmbKMmN8KKx
 1rU/cg2onHRsfdMauyOgBWEpCtySz653IpVyVgb+c/TJPwqkjmZkJb3lbeR2Iylh64wF
 OH2HtYgxvDNpBl1XsVoMBLTHqO1fDGB1sAp6iU6WSS1+9wSHesxSj7KJkrhdTBISBmvI
 cbxA==
X-Gm-Message-State: AJIora8VxdUkzwPgIyuVvuX/vvrLXZBcPb5vkhUWWKh3GYprdW8EA2u8
 Ry+S0gzrSe6vHeBoQIyb3Q==
X-Google-Smtp-Source: AGRyM1v1x2JdWQvDCpJxBK4+b963wTLaRb1e+97cWbaaqBkOkg7g/oVHKNEb23HT8ibw4XlDGTBdAg==
X-Received: by 2002:a05:6e02:15c5:b0:2d7:a1cf:6f87 with SMTP id
 q5-20020a056e0215c500b002d7a1cf6f87mr7648419ilu.30.1657472058051; 
 Sun, 10 Jul 2022 09:54:18 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 s5-20020a92d905000000b002dc0d2f7c7bsm1839960iln.4.2022.07.10.09.54.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 09:54:17 -0700 (PDT)
Received: (nullmailer pid 1602127 invoked by uid 1000);
 Sun, 10 Jul 2022 16:54:16 -0000
From: Rob Herring <robh@kernel.org>
To: MollySophia <mollysophia379@gmail.com>
In-Reply-To: <20220709141136.58298-1-mollysophia379@gmail.com>
References: <20220709141136.58298-1-mollysophia379@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: Add Novatek NT35596S
 panel bindings
Date: Sun, 10 Jul 2022 10:54:16 -0600
Message-Id: <1657472056.244279.1602126.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 09 Jul 2022 22:11:35 +0800, MollySophia wrote:
> Add documentation for "novatek,nt35596s" panel.
> 
> Signed-off-by: MollySophia <mollysophia379@gmail.com>
> ---
>  .../display/panel/novatek,nt35596s.yaml       | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt35596s.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/novatek,nt35596s.example.dtb: panel@0: 'reset-gpios' does not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/novatek,nt35596s.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

