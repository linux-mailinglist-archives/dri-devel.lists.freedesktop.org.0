Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2864ACC5F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 23:58:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B2710E36F;
	Mon,  7 Feb 2022 22:58:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F3710E36F
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 22:58:51 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id u3so2824096oiv.12
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Feb 2022 14:58:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7iQ/HCHGMfUq18N0ggH9zm9kPkgWbGz6GFBfexz5eEg=;
 b=4fGsO9eerpmHzA+88ds4JMegCtXBegzhS9Q8qi8rGnoGb4AZBxm8tKCnfjzqnRd3a4
 C0f1oyErjiKtrDqkmQRJm/bgMbMfLHeda2VelOfw9DMph9nfM6DPF464HQdwyXeGst8w
 tY9Ai//LK3KOLGv9AQwAEcWiDVsH3/TsNkkpG9Hb2lBAbWWg2DjaOM6PmQcVe0Av5Smb
 Xo15KsU8PcRPV2AWVjrkgGGmlcoMiDuaFw2+kqetTFxY4QmgswObPnaGTS2nPbqqDq9M
 3NmWCk2YitjgkxUKvhwTXdBXMXCiBTBm2OjNXSMmPjyH/FkvOGwVjQ6z+whZSvldAAu0
 VO9Q==
X-Gm-Message-State: AOAM531QvLnUd0rFt+8iZJMbLmW6FXPiXkj4n6tJ5pJ4HL2Z9nOmwgT8
 OrbVW2H02/uQ4jIhGzeyxQ==
X-Google-Smtp-Source: ABdhPJz+QDzCqgeIDhpCBZ4gIBz3u04DsrKXfk8UFSm0Xh2STxBE4nr0brJuDwUn2jZUImjkI50ZXw==
X-Received: by 2002:aca:3b41:: with SMTP id i62mr539202oia.151.1644274730968; 
 Mon, 07 Feb 2022 14:58:50 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id j2sm2172404ooj.2.2022.02.07.14.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 14:58:50 -0800 (PST)
Received: (nullmailer pid 1085731 invoked by uid 1000);
 Mon, 07 Feb 2022 22:58:49 -0000
Date: Mon, 7 Feb 2022 16:58:49 -0600
From: Rob Herring <robh@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Subject: Re: [PATCH 4/6 v2] dt-bindings: display: simple: add Geekworm MZP280
 Panel
Message-ID: <YgGkKSZJ6NkW1KUJ@robh.at.kernel.org>
References: <20220124165526.1104-1-macroalpha82@gmail.com>
 <20220124165526.1104-5-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220124165526.1104-5-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, emma@anholt.net, airlied@linux.ie,
 robh+dt@kernel.org, thierry.reding@gmail.com, dri-devel@lists.freedesktop.org,
 Chris Morgan <macromorgan@hotmail.com>, mchehab@kernel.org, sam@ravnborg.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 24 Jan 2022 10:55:24 -0600, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> The Geekworm MZP280 panel is a 480x640 (portrait) panel with a
> capacitive touch interface and a 40 pin header meant to interface
> directly with the Raspberry Pi. The screen is 2.8 inches diagonally,
> and there appear to be at least 4 distinct versions all with the same
> panel timings.
> 
> Timings were derived from drivers posted on the github located here:
> https://github.com/tianyoujian/MZDPI/tree/master/vga
> 
> Additional details about this panel family can be found here:
> https://wiki.geekworm.com/2.8_inch_Touch_Screen_for_Pi_zero
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
