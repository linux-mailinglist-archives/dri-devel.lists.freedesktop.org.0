Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1929B242F91
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 21:48:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F7A6E156;
	Wed, 12 Aug 2020 19:48:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A24B6E156
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 19:48:51 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id u126so4243402iod.12
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 12:48:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hRNiGbsn2Klh2xCNE7Gtg8MuI1Y7qcBaq3qUuH/rT9s=;
 b=nA6fZBi0PHaYshPe/LJrchWJqJlyyeP4ryMb9XCJjs7RMSYUIaizbwqB6EPia6DsPz
 Z6OYHxTX5SYZKTMVxFhsVNGxtbTLG3COzv6IvqI3z3ZwImWM0EotoCsjG3TSFAr/qPS/
 vzmZL/e5qHmN/3DTXAIDVbSbUsj+rnNacuvtCPKoBS+h1fkCBvucayAElBkyNxrK5NX0
 sn+lKE/lxtP3JSObNGn9ryWEtUBIBy+g61Mr9OedTaPMdh/UiWVy27lrEQIrU8QogHLI
 pvpWDqArWZ/ZCBmVmWF1g4MJnKkHkMuk4CqPWgfWWHg+sB1vsYuGmC08OIwlh2Q3VS4C
 QmRg==
X-Gm-Message-State: AOAM530BOwHj+BoCzX+OVrPogvSrYujbGbP+XWUL5oOz1JgAHYTkKAk1
 Zg/PpUepTEwujwjDwVgGDA==
X-Google-Smtp-Source: ABdhPJyxAortV0AQ1QeT0h9Xr+MvWeTPQwamvEw4MT49E/2BBXcwCtsNqev9qL0vlOs9rPbK4Ym8bA==
X-Received: by 2002:a02:aa87:: with SMTP id u7mr1124311jai.13.1597261730560;
 Wed, 12 Aug 2020 12:48:50 -0700 (PDT)
Received: from xps15 ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id t14sm1426283ios.18.2020.08.12.12.48.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 12:48:49 -0700 (PDT)
Received: (nullmailer pid 2593379 invoked by uid 1000);
 Wed, 12 Aug 2020 19:48:47 -0000
Date: Wed, 12 Aug 2020 13:48:47 -0600
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH V3 1/2] dt-bindings: Add DT bindings for Toshiba TC358762
 DSI-to-DPI bridge
Message-ID: <20200812194847.GA2593349@bogus>
References: <20200809105705.6334-1-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200809105705.6334-1-marex@denx.de>
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 09 Aug 2020 12:57:04 +0200, Marek Vasut wrote:
> Add DT bindings for Toshiba TC358762 DSI-to-DPI bridge, this
> one is used in the Raspberry Pi 7" touchscreen display unit.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> To: dri-devel@lists.freedesktop.org
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: devicetree@vger.kernel.org
> ---
> V2: Fix dt_binding_check errors
> V3: Add ... at the end of example
> ---
>  .../display/bridge/toshiba,tc358762.yaml      | 127 ++++++++++++++++++
>  1 file changed, 127 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/toshiba,tc358762.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
