Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD3A4C38EB
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 23:42:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6086E10E83A;
	Thu, 24 Feb 2022 22:42:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com
 [209.85.161.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42F0F10E83A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 22:42:54 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id
 r41-20020a4a966c000000b0031bf85a4124so4109979ooi.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 14:42:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=umB9yAeuY31ST5Z4+hFHkjF0GD+Hu+TObWrQZ6jCCZ0=;
 b=sRMX3a9er3J70DIzvSVokta3QQoswS3y9tvyOAJmoFEgKM6xXNVGx1GG7xaPkYv1TX
 TWAc9/i4hu9CNWdNffWA5GwvuIZe90HqfNIInkTo8NH80gc3T3Am6fbLUcVhK8zw4kww
 4c/hjxgrWlmCLS3ssiMOdLh07j8Pq5fIcf3HLfM3TLOKUsmNtKumfbka6guGYiamJTWx
 E1KMJP+zPm2xHl9eY6XfJBBZFniaDFWrbl0ZmDLS9HEXDq0RUhaUw5m05by9DZ7W7P9B
 GGzQC01eWQB44WFQUNRtJXtgZsxxYWwA/dXA9iPogpQ5YzbY573bfMueLxXM7kW4TG7i
 2j2w==
X-Gm-Message-State: AOAM533mbVHKIUPcPvPJ3GJgcnXPVepjNzUwINtz0qtOExSPXVPC8x2z
 HYI16n5DTuVjErOVJTkFpg==
X-Google-Smtp-Source: ABdhPJycE04S548CoykfCRSkjqLayOGIOoiW6r1HdJF3EiI0U2siDvmXO1Jo5fo6vbH/haJidkOpiA==
X-Received: by 2002:a05:6870:3c06:b0:d2:c68f:a900 with SMTP id
 gk6-20020a0568703c0600b000d2c68fa900mr146032oab.33.1645742573462; 
 Thu, 24 Feb 2022 14:42:53 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 h3-20020a4aa9c3000000b003181c02e7ccsm264965oon.47.2022.02.24.14.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 14:42:52 -0800 (PST)
Received: (nullmailer pid 3728887 invoked by uid 1000);
 Thu, 24 Feb 2022 22:42:51 -0000
Date: Thu, 24 Feb 2022 16:42:51 -0600
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH V3 02/12] dt-bindings: display: bridge: tc358867:
 Document DSI data-lanes property
Message-ID: <YhgJ6wcLtrq5QZYE@robh.at.kernel.org>
References: <20220224195817.68504-1-marex@denx.de>
 <20220224195817.68504-3-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220224195817.68504-3-marex@denx.de>
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
Cc: devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 24 Feb 2022 20:58:07 +0100, Marek Vasut wrote:
> It is necessary to specify the number of connected/used DSI data lanes when
> using the DSI input port of this bridge. Document the 'data-lanes' property
> of the DSI input port.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: devicetree@vger.kernel.org
> To: dri-devel@lists.freedesktop.org
> ---
> V3: - New patch
> ---
>  .../display/bridge/toshiba,tc358767.yaml       | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
