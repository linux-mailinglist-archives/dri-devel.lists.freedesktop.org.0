Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1170E4BA62A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 17:40:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5595210EB8C;
	Thu, 17 Feb 2022 16:40:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9159110EBA3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 16:40:01 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id s1so4328762iob.9
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 08:40:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=ImFtJ/tr17hOJEhG0RpI04/WvpMzuYJGOCoRC+P1jcU=;
 b=Xcop621B3k6v3hwSj7p/DIFS+2gLxkRmrchNLRviMbkjET2k9sA4BlitJ1Hwb9Hacd
 N45o9hLSfs9KJefRvOO2xihFaFV4LNOqO/wQ3lgwsAL2Sf22mD3n7ot9GPnD8WjJL+Y4
 JRWmWHRf5Pws4A0Q9UMw/K5BDOe8gSIUibIvOPvobWaYhvCHax0e6i+KPgYQN2Jg5amq
 QXidCLEReoH3G/NeW0rlMUQg+3F58bE3m//x+0Ud5lsc2YmL1L0nV7e8CZkt3lpsFzOp
 cpkTXwd2Ol3JOXL88UNxiI3yYWWrv1WWaiLbeOTlAMvghio8CvO1o35mbEfVtbNo7/kB
 taTQ==
X-Gm-Message-State: AOAM530yUm30xcV6ZKDhJ1rO0OQUQ+yc5E1XLQzULQKpEIKog8gbWjc1
 3mgxQbNKy3Eq04lkwJNyFg==
X-Google-Smtp-Source: ABdhPJxHAw5LycZ1OYewf0GTZlfWxLt30hNfXF/X8mHzJU61uFavkrIgkSk2a0vYVPgrTG8BAsOUEA==
X-Received: by 2002:a6b:6c0e:0:b0:637:7360:c680 with SMTP id
 a14-20020a6b6c0e000000b006377360c680mr2556409ioh.201.1645116000761; 
 Thu, 17 Feb 2022 08:40:00 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id j14sm2049211ilc.62.2022.02.17.08.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 08:40:00 -0800 (PST)
Received: (nullmailer pid 3365329 invoked by uid 1000);
 Thu, 17 Feb 2022 16:39:55 -0000
From: Rob Herring <robh@kernel.org>
To: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <20220217105523.1525122-4-15330273260@189.cn>
References: <20220217105523.1525122-1-15330273260@189.cn>
 <20220217105523.1525122-4-15330273260@189.cn>
Subject: Re: [PATCH v9 3/4] Documentation/dt: Add descriptions for loongson
 display controller
Date: Thu, 17 Feb 2022 10:39:55 -0600
Message-Id: <1645115995.391878.3365328.nullmailer@robh.at.kernel.org>
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
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, devicetree@vger.kernel.org,
 suijingfeng <suijingfeng@loongson.cn>, Roland Scheidegger <sroland@vmware.com>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 17 Feb 2022 18:55:22 +0800, Sui Jingfeng wrote:
> From: suijingfeng <suijingfeng@loongson.cn>
> 
> Add DT documentation for loongson display controller found in
> LS2K1000, LS2K0500, LS7A1000 and LS7A2000.
> 
> v2: DT binding docs and includes should be a separate patch,
>     fix a warnning because of that.
> 
> Signed-off-by: suijingfeng <suijingfeng@loongson.cn>
> Signed-off-by: Sui Jingfeng <15330273260@189.cn>
> ---
>  .../loongson/loongson,display-controller.yaml | 114 ++++++++++++++++++
>  1 file changed, 114 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml: properties:interrupts: 'anyOf' conditional failed, one must be fixed:
	'minItems' is not one of ['maxItems', 'description', 'deprecated']
		hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
	'minItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref']
	'maxItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref']
	1 is less than the minimum of 2
		hint: Arrays must be described with a combination of minItems/maxItems/items
	hint: cell array properties must define how many entries and what the entries are when there is more than one entry.
	from schema $id: http://devicetree.org/meta-schemas/interrupts.yaml#
./Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/display/loongson/loongson,display-controller.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml: ignoring, error in schema: properties: interrupts
Error: Documentation/devicetree/bindings/display/loongson/loongson,display-controller.example.dts:22.30-31 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:378: Documentation/devicetree/bindings/display/loongson/loongson,display-controller.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1398: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1594138

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

