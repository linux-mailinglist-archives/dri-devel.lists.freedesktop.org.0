Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 958923F4BB0
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 15:30:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7759892F2;
	Mon, 23 Aug 2021 13:30:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B67D892F2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 13:30:20 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 x9-20020a056830278900b0051b8be1192fso15585667otu.7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 06:30:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=XGH/N+L2+U1AK/PyLB02W0HR4smVzphBSVo0yrwHj3w=;
 b=k+gYknd0F/jI4YQnoXVe8BDaPtkC9OMSEFoJZ7ZOf9iuO48ZDnWCUpNwWRCsdl5nu5
 uT8ehv3PuplmkkJDiVWGivLZcZ+0vJptx4KUndFuuadeCia9LHNFsLWoW3hfGG+lwbjO
 GaVIN7IpOkUi2AhY3s863VcwG2n1Vju6H3xsldGktn9xFRxdZwLKbb3GptV7G2Wcyxdh
 GbeH52Z6F+GBlw+ZFz2VK10S8CNW5iX29e2DlIz2cjJd1ZTDAwfLXZi9wIv5e/7+/151
 KO7JPfVJPfv2wYqpZlWukZpmezcDKV4ZEwQ17glaeLjonPvEKSMpLfew+V336bggNUX+
 HOMg==
X-Gm-Message-State: AOAM530/0YrsCeY/klFjXc9LSvKbc7QXBbUVfiBZb+4EHi4qFFowM+vI
 OXwaOpEqW8IPkLie7/X7ZA==
X-Google-Smtp-Source: ABdhPJx8MpP3QPsG5GX1aNHO4CPWW9ZkwZhCZKv98klIVnxne4wAuE8z6lu9K5L2pzMB/LMgJwCh2Q==
X-Received: by 2002:a05:6808:21a3:: with SMTP id
 be35mr11438422oib.31.1629725418110; 
 Mon, 23 Aug 2021 06:30:18 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id u15sm2015752oor.34.2021.08.23.06.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 06:30:17 -0700 (PDT)
Received: (nullmailer pid 1982770 invoked by uid 1000);
 Mon, 23 Aug 2021 13:30:13 -0000
From: Rob Herring <robh@kernel.org>
To: yangcong <yangcong5@huaqin.corp-partner.google.com>
Cc: daniel@ffwll.ch, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 thierry.reding@gmail.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 dianders@google.com, sam@ravnborg.org
In-Reply-To: <20210823115125.1070257-3-yangcong5@huaqin.corp-partner.google.com>
References: <20210823115125.1070257-1-yangcong5@huaqin.corp-partner.google.com>
 <20210823115125.1070257-3-yangcong5@huaqin.corp-partner.google.com>
Subject: Re: [v2 2/2] dt-bindngs: display: panel: Add BOE tv110c9m-ll3 panel
 bindings
Date: Mon, 23 Aug 2021 08:30:13 -0500
Message-Id: <1629725413.512809.1982769.nullmailer@robh.at.kernel.org>
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

On Mon, 23 Aug 2021 19:51:25 +0800, yangcong wrote:
> Add documentation for boe tv110c9m-ll3 panel.
> 
> Signed-off-by: yangcong <yangcong5@huaqin.corp-partner.google.com>
> ---
>  .../display/panel/boe,tv110c9m-ll3.yaml       | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/boe,tv110c9m-ll3.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/display/panel/boe,tv110c9m-ll3.example.dts:25.42-43 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/display/panel/boe,tv110c9m-ll3.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1419: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1519635

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

