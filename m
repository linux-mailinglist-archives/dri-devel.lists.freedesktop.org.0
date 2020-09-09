Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9072637A3
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 22:43:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 244C16F4FA;
	Wed,  9 Sep 2020 20:43:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 928AB6F4FA
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 20:43:42 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id y2so3642597ilp.7
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Sep 2020 13:43:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BvEuTgm2IZoHBm+jPm4TdnWSuIpSZHMUsLkTxZ2He2I=;
 b=d6Mc+MyaGwh3g/p7COik87PC4/F2YEEPwIcvtBTiHjxJjBSXP24wH7BuwZ38X3QZBJ
 /ULfvau9DHkTb7d8v4XEIYmeNHgOHnM944X0CZocE3mnj5+GGx8r8s5CpQqKyHMDtqj8
 K1vTvWRreKzA6H9Aj0XtzZqFLDhj3esrQVNkfboAsP1mHa+dET9dVk2Tg+Y22CyWwjNe
 jh4mrYHNoda6VzXYWGFcfrDmeRJ+ZHgrVZ5rx+mePdtylfpNwm16YT9+ZeN1YX4LDynX
 xLzg+533yhnzbuPkzK9kk2NCmfISOy5Req7mFF1retyix9s62VwcZfPHLbQG6l7cqz7Q
 r1tA==
X-Gm-Message-State: AOAM533FC6/NwQ9v0XME/lYJV0+oRxD7mqB3MCM3qcuzlagiUM8dVdmJ
 KReht+tjt9ULh7CW6z6BeA==
X-Google-Smtp-Source: ABdhPJy4rTKJaPZ/jWpOVJ4cgZzmcFL0VsJJo+wB8OY1va7sQv3j1LxWb/8BcCQh8lOkrHj8o37atg==
X-Received: by 2002:a05:6e02:685:: with SMTP id
 o5mr5246688ils.72.1599684221973; 
 Wed, 09 Sep 2020 13:43:41 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id a21sm1677462ioh.12.2020.09.09.13.43.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 13:43:41 -0700 (PDT)
Received: (nullmailer pid 3044856 invoked by uid 1000);
 Wed, 09 Sep 2020 20:43:31 -0000
Date: Wed, 9 Sep 2020 14:43:31 -0600
From: Rob Herring <robh@kernel.org>
To: "Robert Chiras (OSS)" <robert.chiras@oss.nxp.com>
Subject: Re: [PATCH 4/5] dt-bindings: display/bridge: nwl-dsi: Document
 fsl,clock-drop-level property
Message-ID: <20200909204331.GA3043802@bogus>
References: <1598613212-1113-1-git-send-email-robert.chiras@oss.nxp.com>
 <1598613212-1113-5-git-send-email-robert.chiras@oss.nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1598613212-1113-5-git-send-email-robert.chiras@oss.nxp.com>
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
Cc: Ondrej Jirman <megous@megous.com>, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 28, 2020 at 02:13:31PM +0300, Robert Chiras (OSS) wrote:
> From: Robert Chiras <robert.chiras@nxp.com>
> 
> Add documentation for a new property: 'fsl,clock-drop-level'.
> 
> Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
> ---
>  Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml b/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
> index 8b5741b..b415f4e 100644
> --- a/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
> @@ -143,6 +143,10 @@ properties:
>  
>      additionalProperties: false
>  
> +  clock-drop-level:

fsl, ?

> +    description:
> +      Specifies the level at wich the crtc_clock should be dropped

Needs a type $ref.

> +
>  patternProperties:
>    "^panel@[0-9]+$":
>      type: object
> -- 
> 2.7.4
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
