Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A3234E86E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 15:08:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B636E8D8;
	Tue, 30 Mar 2021 13:08:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com
 [209.85.161.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B566E8D8
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 13:08:46 +0000 (UTC)
Received: by mail-oo1-f42.google.com with SMTP id
 125-20020a4a1a830000b02901b6a144a417so3743573oof.13
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 06:08:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=1gfS/FZgsSlTDvonh4zEOwfHDiIijaYYz+3P+d8VVFw=;
 b=BdY+f39y7VB5TRRnChTVpZomvlpe+PHxr4MTx65KjqRyLHkaTGbs1GAQvyUzWQ5Z+C
 TxIFtQyPrbjWo0ImlWEa7CWB1aSBJYf7mqMLxWbhMSV7e9pXL/luE+ykNRTAfZ3+4a0y
 hfmiyzy6DzK5KAgnWEQUpneUfvjEI/HatqJNEsCXWYx4JlAqDnwYkscR2OmklYhBYCuv
 02n4cbcx4k6F5wsyLOe1Vy4Pn8lc++ppOfgZ8N8p7zSV95YpKHPui3gEa9eUAS1dIM1W
 zylmQ/VRo1cLcvmX5gc5BFh8/BeTjMcA78MS/YiakE1ORMhr/oi3zUXdxn2ocrqX+RDH
 o35g==
X-Gm-Message-State: AOAM530WFwEIdSFdQfx/QKDpgdDFFE1dPEn5C2m8qsMGYZkZyCxlvOA7
 XKna7fWpKI0/0kfko1399Q==
X-Google-Smtp-Source: ABdhPJzzvKlEfJNv8JhWPt3b0O+9AbUdIf1MqLuOlBsnaySUti5vvohhqfbs115O/M8S3LPGzvf1qg==
X-Received: by 2002:a4a:eaca:: with SMTP id s10mr11984098ooh.5.1617109725675; 
 Tue, 30 Mar 2021 06:08:45 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m14sm5251681otn.69.2021.03.30.06.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 06:08:44 -0700 (PDT)
Received: (nullmailer pid 173730 invoked by uid 1000);
 Tue, 30 Mar 2021 13:08:43 -0000
From: Rob Herring <robh@kernel.org>
To: Daniel Mack <daniel@zonque.org>
In-Reply-To: <20210329191414.2191095-2-daniel@zonque.org>
References: <20210329191414.2191095-1-daniel@zonque.org>
 <20210329191414.2191095-2-daniel@zonque.org>
Subject: Re: [PATCH v7 1/2] dt-bindings: display: add bindings for newhaven,
 1.8-128160EF
Date: Tue, 30 Mar 2021 08:08:43 -0500
Message-Id: <1617109723.693046.173729.nullmailer@robh.at.kernel.org>
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
Cc: airlied@linux.ie, devicetree@vger.kernel.org, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 29 Mar 2021 21:14:13 +0200, Daniel Mack wrote:
> This adds documentation for a new ILI9163 based, SPI connected display.
> 
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> ---
>  .../display/panel/ilitek,ili9163.yaml         | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9163.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/display/panel/panel/panel-common.yaml'
xargs: dt-doc-validate: exited with status 255; aborting
make[1]: *** Deleting file 'Documentation/devicetree/bindings/display/panel/ilitek,ili9163.example.dt.yaml'
Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/display/panel/panel/panel-common.yaml'
make[1]: *** [scripts/Makefile.lib:377: Documentation/devicetree/bindings/display/panel/ilitek,ili9163.example.dt.yaml] Error 255
make: *** [Makefile:1414: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1459781

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
