Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C2E3F88CA
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 15:26:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E83E06E84E;
	Thu, 26 Aug 2021 13:26:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79AD96E84E
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 13:26:07 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 y14-20020a0568302a0e00b0051acbdb2869so3470164otu.2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 06:26:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=2o4OhJ2JQkPtoaQGdSaMZ6wV1LKdoU5Xo2BeBtn6dQo=;
 b=HILeOm751OInCuEo284di5mQQdHr0LK16vrU2X4A1gNO4kfHXAA2wJMrtWPYEh95CU
 xALtfIm/c7P4dFt+wD0OEa5tmqlURzlsWHMT5OXW8wUx8Bp5/vKcOJCvK7DDb1klaYBS
 gVgGlGmj0QeP38s/7glhObuz7NlVsDULxdef02YEuYrkc2NAJzfraqmuWCUC8VWf/b9r
 4Ff+tN26s67OkPnjo++WfxWvtoOfDCVOaIBSn3SU7ULtXprLd39L3vgWjdSnnH2CSp25
 ZM0gl9mvkbsFZcVXL9cZ2brxA3qR2ao/vNGvFpbwnNk/TbLSWxObS3eJx2LMM+ibu1KP
 Vomg==
X-Gm-Message-State: AOAM530u0lQhzl46kHwDYWo2CrX/b7ILL+td0d+eF4gz3YjDFL5OdAA3
 oxSeHMdRlvzliEemaJMVqA==
X-Google-Smtp-Source: ABdhPJwgIxeiiEIYRJSGhRksrfozuX03sL79KteMqhx3Q4ivlxzWPU1LZCt26qy+FhsGzG9JshpPpA==
X-Received: by 2002:a9d:798c:: with SMTP id h12mr3034753otm.215.1629984366555; 
 Thu, 26 Aug 2021 06:26:06 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id b3sm634202oie.1.2021.08.26.06.26.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 06:26:05 -0700 (PDT)
Received: (nullmailer pid 1033388 invoked by uid 1000);
 Thu, 26 Aug 2021 13:26:01 -0000
From: Rob Herring <robh@kernel.org>
To: yangcong <yangcong5@huaqin.corp-partner.google.com>
Cc: thierry.reding@gmail.com, sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 dianders@google.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 airlied@linux.ie, daniel@ffwll.ch
In-Reply-To: <20210826110311.613396-3-yangcong5@huaqin.corp-partner.google.com>
References: <20210826110311.613396-1-yangcong5@huaqin.corp-partner.google.com>
 <20210826110311.613396-3-yangcong5@huaqin.corp-partner.google.com>
Subject: Re: [v3 2/2] dt-bindngs: display: panel: Add BOE tv110c9m-ll3 panel
 bindings
Date: Thu, 26 Aug 2021 08:26:01 -0500
Message-Id: <1629984361.395478.1033387.nullmailer@robh.at.kernel.org>
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

On Thu, 26 Aug 2021 19:03:11 +0800, yangcong wrote:
> Add documentation for boe tv110c9m-ll3 panel.
> 
> Signed-off-by: yangcong <yangcong5@huaqin.corp-partner.google.com>
> ---
>  .../display/panel/boe,tv110c9m-ll3.yaml       | 81 +++++++++++++++++++
>  1 file changed, 81 insertions(+)
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

See https://patchwork.ozlabs.org/patch/1521039

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

