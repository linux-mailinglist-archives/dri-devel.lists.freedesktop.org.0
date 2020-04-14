Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2C71A8E1B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 23:56:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F7089BB2;
	Tue, 14 Apr 2020 21:56:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3294B89BB2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 21:56:24 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id l21so1327535otd.9
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 14:56:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+o2yriNr4v3rniMWdemUISKQYsPGQxqAvPZbiefW6UE=;
 b=G1wXaT0evwj7nQ0QFBipoqQPh7G37kDSNewHqbX6x8qfsImWFkMplfb8VDO89kDMCm
 3y01podiDc5Z+EIWPXARad6QHOkvz0kbK4nUogNM7VqmlgXlsdkgXit64i99qTTokp7i
 6YXlk0VVbzMrYA6vZzx+HzSMYPBIXunYk7g7fE04b02A2kbCKdXVd/XJnBYWvQM75JBb
 +SgI8EzHNHovnFnvX+NnnebtOx0gu8XR0nLP3YWarKfIX2yR6hLh24CZAhxlPpuZFb6X
 tHQR3e8/Juq6mkT3OrVP7x0HftKfA8lWpPKeeTUKh7+wHUxWMqoXC1znDXbgdHX2p2Wh
 K69Q==
X-Gm-Message-State: AGi0PuZBckc84TY3OWaBwHghB7uLAOndBEypGD4u70i/VFQ6MS+epvsV
 w48JdxO6pP7pm4vfuec2Ag==
X-Google-Smtp-Source: APiQypLhFPB4rMGpKjdNYF2xubgNfmpg+NIvA1YQpl0vgKNyYqbR+tf3if9hzLDvVOEv6qMG8K/tig==
X-Received: by 2002:a05:6830:60b:: with SMTP id
 w11mr18023314oti.96.1586901383492; 
 Tue, 14 Apr 2020 14:56:23 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r24sm5890903otq.9.2020.04.14.14.56.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 14:56:22 -0700 (PDT)
Received: (nullmailer pid 31154 invoked by uid 1000);
 Tue, 14 Apr 2020 21:56:21 -0000
Date: Tue, 14 Apr 2020 16:56:21 -0500
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH 1/4] dt-bindings: display: bridge: Reject additional
 properties in ports node
Message-ID: <20200414215621.GA31081@bogus>
References: <20200405232318.26833-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200405232318.26833-2-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200405232318.26833-2-laurent.pinchart+renesas@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon,  6 Apr 2020 02:23:15 +0300, Laurent Pinchart wrote:
> Document the #address-cells and #size-cells properties of the ports node
> in the schemas of the bridge DT bindings, and set additionalProperties
> to false to reject additional properties.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  .../devicetree/bindings/display/bridge/anx6345.yaml       | 8 ++++++++
>  .../devicetree/bindings/display/bridge/lvds-codec.yaml    | 8 ++++++++
>  .../devicetree/bindings/display/bridge/ps8640.yaml        | 8 ++++++++
>  3 files changed, 24 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
