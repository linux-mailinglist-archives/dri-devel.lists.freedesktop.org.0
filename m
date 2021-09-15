Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A77BA40C5BF
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 14:56:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60DA889C37;
	Wed, 15 Sep 2021 12:56:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com
 [209.85.161.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30BD089C37
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 12:56:38 +0000 (UTC)
Received: by mail-oo1-f43.google.com with SMTP id
 k18-20020a4abd92000000b002915ed21fb8so843772oop.11
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 05:56:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=eNJrp4hkkii6jSrN5pnjt5uJ56GHQYA0aPuGCrBxI38=;
 b=Kt1TIJpHtYMBNObSFei4NjS3rt9Xo6YXV/WBRyMtKDV/FdmNfyrOLELnVMKcd2TSCh
 3XtPcVa1hEn4YDU7pNeNCkzadO0DEpgnP4lHMDUBm4WsUwb0jtdB7UKqVeSV4Ot7sUOH
 0QV/Jjow3RQpAty/Aw7vaCuKX/5dLBAc9Zq57Eimmnhosv7DHAjqnBTck2xAWRQyQPmR
 ByR7/LFggY6Qt/BIXpJk5uoaGo9Fl0ASTIeQa1tu4agE0NpbH3nZIsYBykwXY1aAkoZH
 X4aAVs0gzl/KStWe3lpqd7mqpVUw5plcUCUw83vba26TCmaSFa/g+DgRMt9drTg56waX
 9Eog==
X-Gm-Message-State: AOAM532EzrQXvkhYyX/c+C5hvuTeEwfhncIWVVpCSLm675pnjr9x4oi1
 lacIsrjIma8ki42WOF+GnA==
X-Google-Smtp-Source: ABdhPJzp3e1pp9Lsc7MCgmkwuRwGFXmv0jtuzCmDwFtPZNWP0m1xO3VgLzrqd10S/HkZQ6dlvYS0Sg==
X-Received: by 2002:a4a:de90:: with SMTP id v16mr18232123oou.42.1631710597319; 
 Wed, 15 Sep 2021 05:56:37 -0700 (PDT)
Received: from robh.at.kernel.org ([12.252.7.226])
 by smtp.gmail.com with ESMTPSA id y24sm3394365oto.40.2021.09.15.05.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 05:56:36 -0700 (PDT)
Received: (nullmailer pid 935948 invoked by uid 1000);
 Wed, 15 Sep 2021 12:56:34 -0000
From: Rob Herring <robh@kernel.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Lee Jones <lee.jones@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20210914200539.732093-2-paul.kocialkowski@bootlin.com>
References: <20210914200539.732093-1-paul.kocialkowski@bootlin.com>
 <20210914200539.732093-2-paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v9 1/4] dt-bindings: display: Document the Xylon LogiCVC
 display controller
Date: Wed, 15 Sep 2021 07:56:34 -0500
Message-Id: <1631710594.961761.935947.nullmailer@robh.at.kernel.org>
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

On Tue, 14 Sep 2021 22:05:36 +0200, Paul Kocialkowski wrote:
> The Xylon LogiCVC is a display controller implemented as programmable
> logic in Xilinx FPGAs.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  .../display/xylon,logicvc-display.yaml        | 302 ++++++++++++++++++
>  1 file changed, 302 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/xylon,logicvc-display.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/xylon,logicvc-display.example.dt.yaml: logicvc@43c00000: 'display@0' does not match any of the regexes: '^gpio@[0-9a-f]+$', 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/xylon,logicvc.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1528119

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

