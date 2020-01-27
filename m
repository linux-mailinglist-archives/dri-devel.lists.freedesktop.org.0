Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC18B14A75B
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 16:39:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41E1E6EBEF;
	Mon, 27 Jan 2020 15:39:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14D3F6EBEF;
 Mon, 27 Jan 2020 15:39:30 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id r27so8739780otc.8;
 Mon, 27 Jan 2020 07:39:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EBD6M+xr/YPO88cJtsIa6Ug0pqwut1eElHk7vtXakf0=;
 b=m3vQt4gsY71CGpANyN61tP61AVPNAkkkGRZxkU2Vcq/+mlLNcVrYkxD28ycJQPvoPm
 WMp1AR5SELEThdCcVkClt5JI0Aj0Resk9gmwh/Baw36Pyo/EeX0oFY2eFkkJ39TVvUmU
 zzpmTXUyS/4ljelJfvYlpzzQhMOWgl3B30mYlAHheORm3qaUfoHsaypT0dlhSI4v9BxK
 Ve4j6cyAgncwB7fJQj+WzRKxFnMlJ++GyEQVpTbiwwoXWN5/Sr57KLbFe0y1Hk3d769S
 zSO+038tmKbe07ECDT3IrgzNpkGkfvgxzAhteznTOA/Q/MgQaBdl3o/TYFscxVzQposL
 8QIA==
X-Gm-Message-State: APjAAAUL/uAmELLdGghmuqjHbFBGaD8mnUY8EFuCtpCp2csGEC+QtJci
 7FzX2jWjRvv23iZVfrYZMw==
X-Google-Smtp-Source: APXvYqyrytH//FFyEpbASQFRXqGKhY2g1B0JjSVzAXcSlavAhpNASn79x/8LpmfrZ3Yg8Y9FFMagFA==
X-Received: by 2002:a9d:472:: with SMTP id 105mr11861944otc.150.1580139569354; 
 Mon, 27 Jan 2020 07:39:29 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p83sm4879498oia.51.2020.01.27.07.39.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2020 07:39:28 -0800 (PST)
Received: (nullmailer pid 4318 invoked by uid 1000);
 Mon, 27 Jan 2020 15:39:27 -0000
Date: Mon, 27 Jan 2020 09:39:27 -0600
From: Rob Herring <robh@kernel.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v9 09/12] dt-bindings: display: bridge: lvds-codec: Add
 new  bus-width prop
Message-ID: <20200127153927.GA4282@bogus>
References: <20200127110043.2731697-1-boris.brezillon@collabora.com>
 <20200127110043.2731697-10-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200127110043.2731697-10-boris.brezillon@collabora.com>
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
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Mark Rutland <mark.rutland@arm.com>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 intel-gfx-trybot@lists.freedesktop.org, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 27 Jan 2020 12:00:40 +0100, Boris Brezillon wrote:
> Add the bus-width property to describe the input bus format.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> Changes in v7:
> * Rebase on top of lvds-codec changes
> * Drop the data-mapping property
> 
> Changes in v3:
> * New patch
> ---
>  .../devicetree/bindings/display/bridge/lvds-codec.yaml    | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
