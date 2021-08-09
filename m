Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 883D53E4907
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 17:40:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE55B8984D;
	Mon,  9 Aug 2021 15:40:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A69FD8984D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 15:40:11 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id 188so26388246ioa.8
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Aug 2021 08:40:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=As94hk4XEdH5kfCbYz6LcUTvcmBGi03P0gCwR26CciE=;
 b=j2xiQ/IjQHm5auNFKISxB4L0JgyeMgEeUwk2aJPmFMTMzeEixC1fU8OgHvNzBHGrMN
 JfX4ej4lv2yeNQednMrV8Enq8dJAaf5qeXloJYVX51RuipOmUZ3m79V5GjOaPpL/hLSn
 rFoQT6eL0rc615MPAL9U+UXOdztdEHBg4Ur2dAsqxd7xG5Uao7p0Ge5cKbcTeXDF1Lsy
 +3I2qhFuVOCrPqBpLhhfbXHLbJ88WIWzeDKq4Brfyuf/T7VsZlO8XmwBzCIac/DlsyqE
 mv6tc8zw4gkfADEboSbhDvGL12c3aINKIiOMl8FpxAcGo3a/SEjPrsFCmmVk30cl4ExW
 JiCw==
X-Gm-Message-State: AOAM530rsQGyXwZ0vv8FJlT5x2RdsXnSvNtLakAlUR6zpX+LSXRat9RC
 nemJmitH7zfI/izuRgwcOw==
X-Google-Smtp-Source: ABdhPJwElvvFchy8n+O48fkEeMa07Kd4ZxR0GXYipP579UkeMGnPqKGkEc9DguQ5ddfmH74/SBXViA==
X-Received: by 2002:a5d:8990:: with SMTP id m16mr9628iol.170.1628523610558;
 Mon, 09 Aug 2021 08:40:10 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id d9sm10370303ilu.9.2021.08.09.08.40.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 08:40:09 -0700 (PDT)
Received: (nullmailer pid 3895391 invoked by uid 1000);
 Mon, 09 Aug 2021 15:40:08 -0000
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
In-Reply-To: <20210808035053.58074-1-dmitry.baryshkov@linaro.org>
References: <20210808035053.58074-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: add bindings for the Sharp LS060T1SX01
 panel
Date: Mon, 09 Aug 2021 09:40:08 -0600
Message-Id: <1628523608.142555.3895390.nullmailer@robh.at.kernel.org>
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

On Sun, 08 Aug 2021 06:50:52 +0300, Dmitry Baryshkov wrote:
> Add devicetree bindings for the Sharp LS060T1SX01 6.0" FullHD panel
> using NT35695 driver. This panel can be found i.e. in the Dragonboard
> Display Adapter bundle.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../display/panel/sharp,ls060t1sx01.yaml      | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ls060t1sx01.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/display/panel/sharp,ls060t1sx01.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/display/panel/sharp,ls060t1sx01.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/sharp,ls060t1sx01.yaml: duplicate '$id' value 'http://devicetree.org/schemas/display/panel/sharp,ls043t1le01.yaml#'

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1514772

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

