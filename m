Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EDA212E3B
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 22:51:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3863F6E156;
	Thu,  2 Jul 2020 20:51:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14FDC6E156
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 20:51:48 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id i25so30454663iog.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jul 2020 13:51:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rcmf522YzRsjQGuzsW0MDCpwiVqvv14uH+p7wGyNLDs=;
 b=l34RawewK4pTGnFh7vJoB/ZVeFRZkwEaINcDfdIjp+s4HlMX8bMAibGtx9hSvD5zvI
 5BlwMhWlIHRg/+11fk9yJ1K1rST5TCsKb2e9/OIVlpPu2OLNmxqMh0RSshFqshVcv51P
 HH+NoMq9+Dhh8+ypb3PRsMMI/N5XmnyT8KKQWhr4HTmwbutQR9ckaXKTF34lksxjZYZ/
 f3ubMCu/L/26gP0pzEAy3FDqrrjSGSgTJkFc4WjtdTaPCWvPi/c0h2hEjPD/6DDsXhZT
 fpNgI/m7Ch/JJjnsCzVnVnuyLVaF8pfmoSrZ7kqcQR3ciVVFJ1LhXOfmMifVJ43/JrQx
 wZow==
X-Gm-Message-State: AOAM532xP9gbQ2Z+ipecJyEhKD1+WAdQmOsacjoBLFw6mKP15fMBG1tV
 y9ZJi3LKBJzXcOxVC2AvMQ==
X-Google-Smtp-Source: ABdhPJySM9jU/gTpvtpT3zaOet81vYx3jYRYc+7n0XVexCFz3T+hidfEsgv5ZE431Xid0foaBnN57Q==
X-Received: by 2002:a6b:ee02:: with SMTP id i2mr9168719ioh.110.1593723107239; 
 Thu, 02 Jul 2020 13:51:47 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id w10sm5427766ilo.10.2020.07.02.13.51.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 13:51:46 -0700 (PDT)
Received: (nullmailer pid 1671716 invoked by uid 1000);
 Thu, 02 Jul 2020 20:51:43 -0000
Date: Thu, 2 Jul 2020 14:51:43 -0600
From: Rob Herring <robh@kernel.org>
To: Ondrej Jirman <megous@megous.com>
Subject: Re: [PATCH v7 02/13] dt-bindings: panel: Convert rocktech,
 jh057n00900 to yaml
Message-ID: <20200702205143.GA1670522@bogus>
References: <20200701162928.1638874-1-megous@megous.com>
 <20200701162928.1638874-3-megous@megous.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200701162928.1638874-3-megous@megous.com>
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
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-sunxi@googlegroups.com, Purism Kernel Team <kernel@puri.sm>,
 Samuel Holland <samuel@sholland.org>, David Airlie <airlied@linux.ie>,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Bhushan Shah <bshah@kde.org>, linux-kernel@vger.kernel.org,
 Martijn Braam <martijn@brixit.nl>, Luca Weiss <luca@z3ntu.xyz>,
 Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 01 Jul 2020 18:29:17 +0200, Ondrej Jirman wrote:
> Convert Rocktech MIPI DSI panel driver from txt to yaml bindings.
> 
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> ---
>  .../display/panel/rocktech,jh057n00900.txt    | 23 -------
>  .../display/panel/rocktech,jh057n00900.yaml   | 66 +++++++++++++++++++
>  2 files changed, 66 insertions(+), 23 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/nwl-dsi.example.dt.yaml: panel@0: '#address-cells', '#size-cells', 'port@0' do not match any of the regexes: 'pinctrl-[0-9]+'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/nwl-dsi.example.dt.yaml: panel@0: 'vcc-supply' is a required property
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/nwl-dsi.example.dt.yaml: panel@0: 'iovcc-supply' is a required property
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/nwl-dsi.example.dt.yaml: panel@0: 'reset-gpios' is a required property


See https://patchwork.ozlabs.org/patch/1320690

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
