Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B05DD31E026
	for <lists+dri-devel@lfdr.de>; Wed, 17 Feb 2021 21:25:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 960F36E214;
	Wed, 17 Feb 2021 20:25:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0557D6E214
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Feb 2021 20:24:58 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id l3so16405655oii.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Feb 2021 12:24:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=fFAIBJRtS8lz4sWBKvSYwdMKZETWELFgP9KEyHLr6qo=;
 b=r9XI9JDmajFlUdgON1jmEyup9iL82dDdj1jk4WCFDi0phzP3QdQi4YLsskQkkbhspW
 D14oB4hafWZM20XTPi2BsFbpB7+2bHSa/uLuGapIRZnfjGei/mcP52T9VRGyWEP81mjh
 LDoa1m3WodR6M1KXRrFM693TMWx7xM6ELB7qotwSL1zNmEuEWLDMNJc6ibtiQ1+nTA9p
 IJZZWv1hMyKMlXbb/wRYrkzLQIuR0jKOK/9BKR0uJP+N0zyOl/tcrZJ5e9+qJtirw6fR
 c3agMvIcruab4ifCfPyq+F3lnL5unXmYlRH/09S8g4xsEjWkoJooy3bqE0fP46+2S0qh
 q70A==
X-Gm-Message-State: AOAM533R7Srn3Sd+rHINigux/+Mk/pvFzgP6nXIKjLb/YmOIVp76hwK+
 Cn+USbYPRjGFG9iBvvxjxQ==
X-Google-Smtp-Source: ABdhPJzYhqCcG+yX3Uzd3OscwPiULaH/YhQfG5nIUHIFUlKV3wM7OO7MID/izmLtsM8b3f8nwgSy/g==
X-Received: by 2002:aca:d0b:: with SMTP id 11mr401379oin.35.1613593498317;
 Wed, 17 Feb 2021 12:24:58 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w124sm659788oiw.40.2021.02.17.12.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:24:57 -0800 (PST)
Received: (nullmailer pid 2681061 invoked by uid 1000);
 Wed, 17 Feb 2021 20:24:51 -0000
From: Rob Herring <robh@kernel.org>
To: Adrien Grassein <adrien.grassein@gmail.com>
In-Reply-To: <20210214232904.1142706-2-adrien.grassein@gmail.com>
References: <20210214232904.1142706-1-adrien.grassein@gmail.com>
 <20210214232904.1142706-2-adrien.grassein@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: bridge: Add documentation
 for LT8912
Date: Wed, 17 Feb 2021 14:24:51 -0600
Message-Id: <1613593491.462326.2681060.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 narmstrong@baylibre.com, airlied@linux.ie, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 15 Feb 2021 00:29:03 +0100, Adrien Grassein wrote:
> Lontium LT8912 is a DSI to HDMI bridge.
> 
> Signed-off-by: Adrien Grassein <adrien.grassein@gmail.com>
> ---
>  .../display/bridge/lontium,lt8912.yaml        | 102 ++++++++++++++++++
>  MAINTAINERS                                   |   5 +
>  2 files changed, 107 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/lontium,lt8912.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
make[1]: *** Deleting file 'Documentation/devicetree/bindings/display/bridge/lontium,lt8912.example.dt.yaml'
Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/media/video-interfaces.yaml'
make[1]: *** [scripts/Makefile.lib:344: Documentation/devicetree/bindings/display/bridge/lontium,lt8912.example.dt.yaml] Error 255
make: *** [Makefile:1370: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1440379

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
