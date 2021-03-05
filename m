Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A88D32F3A0
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 20:14:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A0636EC1F;
	Fri,  5 Mar 2021 19:14:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com
 [209.85.161.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9484E6EC1F
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 19:14:38 +0000 (UTC)
Received: by mail-oo1-f53.google.com with SMTP id l11so677738oov.13
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Mar 2021 11:14:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ahnVuVrp3hmi8OUmRx9LZ5ZjgKO6WwU83me0vSNT/jM=;
 b=lZsf+/m1aGkOdQ8HUcyJf6+nXDVcK01bB+MLyv3d/Hd5u2rfndMnmKvuCSN1JrIAGF
 e9gHtbSFoviTdtG7odLybDfn+O/7kXH0LKGiNCk7Jxk952xOLknKQYMJ5i3V8jwQyuQY
 B91olXSe+uGVsaIbBONLjdCDj9e1ocX958W9+6PDAv2xb44mGeqkiRfWhrq/9XMISdMa
 wIjSs2i3WgVEoQiE2nwg0PetRQ5v1t+gl5fIqVKO17BmJwFbJ207YTFEu+ueSXjE8i6c
 /Obb1YSU6tvEM9sEBhf1ILdnVQWDjBHlStj4zKy4CjJRUep6bFkgJIg22/82UgYJnAZe
 EEQg==
X-Gm-Message-State: AOAM531P3IkyqSabiwpZrKM2HUPoiAbeU9Jd9h+NQOdCW1na2Fr7ZNgH
 Ph8OvxcR7lSWK2AIBajCBw==
X-Google-Smtp-Source: ABdhPJxAtGAYmnXHAGusGObW6k43DZ48CS1JE+xa7Bv8d5o3UT8yuZqG/VMK0adpv9k9plZkOCTHCQ==
X-Received: by 2002:a4a:6b44:: with SMTP id h4mr8948136oof.38.1614971677892;
 Fri, 05 Mar 2021 11:14:37 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y143sm694815oie.50.2021.03.05.11.14.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 11:14:37 -0800 (PST)
Received: (nullmailer pid 495683 invoked by uid 1000);
 Fri, 05 Mar 2021 19:14:36 -0000
Date: Fri, 5 Mar 2021 13:14:36 -0600
From: Rob Herring <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v7] dt-bindings: display: panel: one file of all simple
 LVDS panels with dual ports
Message-ID: <20210305191436.GA495631@robh.at.kernel.org>
References: <1613017672-2734-1-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1613017672-2734-1-git-send-email-victor.liu@nxp.com>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 11 Feb 2021 12:27:52 +0800, Liu Ying wrote:
> To complement panel-simple.yaml, create panel-simple-lvds-dual-ports.yaml.
> panel-simple-lvds-dual-ports.yaml is for all simple LVDS panels that
> have dual LVDS ports and require only a single power-supply.
> The first port receives odd pixels, and the second port receives even pixels.
> Optionally, a backlight and an enable GPIO can be specified as properties.
> 
> Panels with swapped pixel order, if any, need dedicated bindings.
> 
> Migrate 'auo,g133han01', 'auo,g185han01', 'auo,g190ean01',
> 'koe,tx26d202vm0bwa' and 'nlt,nl192108ac18-02d' over to the new file.
> 
> The objectives with one file for all the simple LVDS panels with dual ports are:
> - Make it simpler to add bindings for this kind of LVDS panels
> - Keep the number of bindings file lower
> - Keep the binding documentation for this kind of LVDS panels more consistent
> - Make it possible for drivers to get pixel order via
>   drm_of_lvds_get_dual_link_pixel_order(), as the 'ports' property is required
> 
> Suggested-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v6->v7:
> * Reference '#/$defs/port-base' instead of '#/properties/port'. (Rob)
> 
> v5->v6:
> * Use OF graph schema.
> * Drop Rob's R-b tag, as review is needed.
> 
> v4->v5:
> * Require the 'ports' property and update commit message accordingly. (Rob)
> * Add Rob's R-b tag.
> 
> v3->v4:
> * Add type and descriptions for dual-lvds-{odd,even}-pixels properties.
>   Also, update descriptions for port@0 and port@1 properties accordingly. (Rob)
> 
> v2->v3:
> * Do not allow 'port' property. (Rob)
> * Define port number. (Rob)
> * Specify 'dual-lvds-odd-pixels' and 'dual-lvds-even-pixels' properties. (Rob)
> 
> v1->v2:
> * Correct pixel order in example LVDS panel node.
> 
>  .../panel/panel-simple-lvds-dual-ports.yaml        | 118 +++++++++++++++++++++
>  .../bindings/display/panel/panel-simple.yaml       |  10 --
>  2 files changed, 118 insertions(+), 10 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
