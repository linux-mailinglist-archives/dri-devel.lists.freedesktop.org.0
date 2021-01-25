Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B1B302679
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 15:51:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6C206E0AF;
	Mon, 25 Jan 2021 14:51:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 915106E0AF
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 14:51:40 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id r189so15001695oih.4
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 06:51:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=wNTAmKC0zu5iO9mM7sxm7NcDuEttIlxDD2+2CiOrQPM=;
 b=lub0tRQNtZs5UMkqYa79J6HV28gHInWxYmt+qNNPxVnJaTtwcAj1Ov0wu99XFEb3V9
 FGE274d7CZY+iC01HUJclDOZ7SzGFk0JVLXskaKq/SqAZ/o8HKBjJR1r1nEBszIcutCX
 4VVK3bZ7twWogZ6Fd+4F8Gz+jKJwbp0FfMbJGoUFUE1fBBfpQIU73g78wVit2BhHrCIB
 8gvrXdeeYGxmRbY8TA5mL76zBnOOzq/jVk5ApxRaHg0IJEpqPNJTtQ0UJvlpMeMBGIiM
 jCVkeX9J8VW/YiIDtQFfvKdsRK6VBM4Nn+rUOvDZn0YdbLqUT4vrCjBrh2CvqkBYGNs3
 eCJA==
X-Gm-Message-State: AOAM530uGvvzQryxzPN+j+arfPn2hhwZweBLY/dC/XftimUrSsqyxOir
 0kMqR4HiJx2zYi0D+OzXxA==
X-Google-Smtp-Source: ABdhPJy3JbZEiAsAKDW30PEDE5gz4huf/K7EbGR5/y5uPiRGW74tdF3GYJ6R424CRyK9UhjP03yQNQ==
X-Received: by 2002:aca:d643:: with SMTP id n64mr318001oig.151.1611586299897; 
 Mon, 25 Jan 2021 06:51:39 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l11sm608502otf.59.2021.01.25.06.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 06:51:38 -0800 (PST)
Received: (nullmailer pid 327908 invoked by uid 1000);
 Mon, 25 Jan 2021 14:51:35 -0000
From: Rob Herring <robh@kernel.org>
To: Xin Ji <xji@analogixsemi.com>
In-Reply-To: <75e29d7386df2ebca4a8e3f0b91c8370a4a8f74f.1611572143.git.xji@analogixsemi.com>
References: <cover.1611572142.git.xji@analogixsemi.com>
 <75e29d7386df2ebca4a8e3f0b91c8370a4a8f74f.1611572143.git.xji@analogixsemi.com>
Subject: Re: [PATCH v3 1/3] dt-bindings:drm/bridge:anx7625:add HDCP support
 flag and swing reg
Date: Mon, 25 Jan 2021 08:51:35 -0600
Message-Id: <1611586295.672940.327907.nullmailer@robh.at.kernel.org>
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
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Nicolas Boichat <drinkcat@google.com>, David Airlie <airlied@linux.ie>,
 =?utf-8?q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Sheng Pan <span@analogixsemi.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 25 Jan 2021 19:12:21 +0800, Xin Ji wrote:
> Add 'bus-type' and 'data-lanes' define for port0, add HDCP support
> flag and DP tx lane0 and lane1 swing register array define.
> 
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> ---
>  .../bindings/display/bridge/analogix,anx7625.yaml  | 57 ++++++++++++++++++++--
>  1 file changed, 54 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.example.dt.yaml: encoder@58: ports: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.example.dt.yaml: encoder@58: ports:port@1:endpoint: Additional properties are not allowed ('remote-endpoint' was unexpected)
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml

See https://patchwork.ozlabs.org/patch/1431199

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
