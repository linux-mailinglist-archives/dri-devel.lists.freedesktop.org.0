Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3909124EA2
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 18:02:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B56B6E915;
	Wed, 18 Dec 2019 17:02:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AD4C6E915
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 17:02:18 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id b18so3315609otp.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 09:02:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JaI7AY/5dEsE+PzKKfws1NegVl++uA5oApSBgLNQCls=;
 b=ZCw9aDeLIeSoET+5dXSucbiThiyzLSnqRS521IrPe0Qe/JYIb3iOThSkk7T+NchBxl
 S9vRrUDM5zSQxuURfD0uWuJwg11bJlupq12eCh7aZZ0oY9JFJ2Ydv2cgcH5fpkUA0jdi
 c0eEUE+RfjG4wq/RP6f7avM8dh/FkuaQThluZUCbx97/NTsxX5hWsafsnkjTOokIiZ9t
 tqf0pv68mXKcin04mU03V5dnjZbZFC8MFl2Fz1e4i+XJKeCvEdalUV5hVF/9dn3oXLxQ
 GtMc6IConVx07Lg8BlVE6tn4h3BMP5Dd3sYAw1XH7aUF9K6JHNbDKJ4aiNecsJS4R4JY
 Wr5g==
X-Gm-Message-State: APjAAAVGORZOBkb8HsZYyvh9yCzUUSlVyaERi3sxhSLCZLCGaehWaXV9
 1IhJhmTo2k3feZzd11/JdQ==
X-Google-Smtp-Source: APXvYqzOiFGi11lFLhBbyJQ2UV01N4xUjbtoI1m67WTwLSZq6goK5Ks+0SR2sX/w079C4Hu9mqDTmw==
X-Received: by 2002:a9d:7c8f:: with SMTP id q15mr3730626otn.341.1576688537723; 
 Wed, 18 Dec 2019 09:02:17 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r13sm963542oic.52.2019.12.18.09.02.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 09:02:17 -0800 (PST)
Date: Wed, 18 Dec 2019 11:02:16 -0600
From: Rob Herring <robh@kernel.org>
To: matthias.bgg@kernel.org
Subject: Re: [resend PATCH v6 02/12] dt-bindings: mediatek: Add compatible
 for mt7623
Message-ID: <20191218170216.GA18152@bogus>
References: <20191207224740.24536-1-matthias.bgg@kernel.org>
 <20191207224740.24536-3-matthias.bgg@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191207224740.24536-3-matthias.bgg@kernel.org>
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
Cc: mark.rutland@arm.com, rdunlap@infradead.org, airlied@linux.ie,
 mturquette@baylibre.com, dri-devel@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com, ulrich.hecht+renesas@gmail.com,
 linux-clk@vger.kernel.org, drinkcat@chromium.org, wens@csie.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 frank-w@public-files.de, sean.wang@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 linux-arm-kernel@lists.infradead.org, mbrugger@suse.com, sboyd@kernel.org,
 sean.wang@kernel.org, linux-kernel@vger.kernel.org, matthias.bgg@kernel.org,
 enric.balletbo@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat,  7 Dec 2019 23:47:30 +0100, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <mbrugger@suse.com>
> 
> MediaTek mt7623 uses the mt2701 binings as fallback.
> Document this in the binding description.
> 
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,disp.txt      | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
