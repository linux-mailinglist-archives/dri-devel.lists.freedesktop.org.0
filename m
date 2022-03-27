Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 498A94E87F5
	for <lists+dri-devel@lfdr.de>; Sun, 27 Mar 2022 16:02:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E954610E3B8;
	Sun, 27 Mar 2022 14:02:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D268710E3B8
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Mar 2022 14:02:14 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id z8so13099005oix.3
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Mar 2022 07:02:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=ESfFqUyi5DO4us9FBeXvh3yFju448DlfeiezEoyiJ+o=;
 b=siyku5CjNanPJWEU3+RtGrFr0wlR69rVgpsXmTnbhhm5JNDu/HDH69LmiVNRNXs2MZ
 +72Q8KttIQru2209wTxtoDhICJVAgPEu9EzrhTq8vMFnEiwqb/eLGHkBKgno7pXvLNMh
 j2mKhMdJvmMWxMrmHTDKh7Yy//7cjomt2SSRuLk6S5ZOzVvQD0AQUqqPbDomr9DM0+pK
 5Tbetg12g5MrcPf9zwjvis/Cfc3JD/xka4e7bLpAzBNcFgbuN+1FFz/IwDDK8sMu6kpF
 XE/0aphhasRtUunOpqEwLf6fSGZ/eELRoBqiox7pDfijqTuk0P9RWfHgeUxrkCuB+V30
 Wmtg==
X-Gm-Message-State: AOAM531CqeJ+Iz5kTGr3xMsYBd6dS4BXduVom3C3S9vmTZ/PshQfkDWw
 qBWBxe7LhkHH2TXmNHYLrg==
X-Google-Smtp-Source: ABdhPJxdXmCXwfJxnUC4f+8NgXNJS8r1JCu8KDUQA7dtspjSpD7unbMjCem5Kdi/CNB+OZol7qMxhA==
X-Received: by 2002:a54:4516:0:b0:2ec:8ee8:90c3 with SMTP id
 l22-20020a544516000000b002ec8ee890c3mr13594539oil.81.1648389733902; 
 Sun, 27 Mar 2022 07:02:13 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 15-20020a056870004f00b000def9984dc9sm445438oaz.7.2022.03.27.07.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 07:02:13 -0700 (PDT)
Received: (nullmailer pid 4042147 invoked by uid 1000);
 Sun, 27 Mar 2022 14:02:11 -0000
From: Rob Herring <robh@kernel.org>
To: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <20220327113846.2498146-4-15330273260@189.cn>
References: <20220327113846.2498146-1-15330273260@189.cn>
 <20220327113846.2498146-4-15330273260@189.cn>
Subject: Re: [PATCH v12 3/6] dt-bindings: display: Add Loongson display
 controller
Date: Sun, 27 Mar 2022 09:02:11 -0500
Message-Id: <1648389731.700898.4042146.nullmailer@robh.at.kernel.org>
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
Cc: Qing Zhang <zhangqing@loongson.cn>, David Airlie <airlied@linux.ie>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, devicetree@vger.kernel.org,
 suijingfeng <suijingfeng@loongson.cn>, Roland Scheidegger <sroland@vmware.com>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 27 Mar 2022 19:38:43 +0800, Sui Jingfeng wrote:
> Add DT bindings and simple usages for Loongson display controller
> found in LS7A1000 bridges chip and LS2k1000 SoC.
> 
> Signed-off-by: Sui Jingfeng <15330273260@189.cn>
> ---
>  .../loongson/loongson,display-controller.yaml | 322 ++++++++++++++++++
>  1 file changed, 322 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/loongson/loongson,display-controller.example.dt.yaml: display-controller@6,1: 'ports' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1609879

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

