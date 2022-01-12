Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C12648BCBD
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 02:54:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AEEC10E337;
	Wed, 12 Jan 2022 01:54:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4659B10E337
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 01:54:49 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id s22so1511421oie.10
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 17:54:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yFu4YXdx41UOd1vz7CJnROycNl0bjAuTCz/ym7j7eQw=;
 b=tdAj/wVuBiqhIsMebQ4IXMdIrXuO6AGKlM7pdFUXxUyXf7IF3gWO8czXmuPM7Y9efE
 dcBMZWWpRTA7hwHrPrOFZhkzO5X+djfGgG29nYpmlVRRa5yZVgULw+uqfqwFL2uLPPqR
 c1KHGoGM9w3+zox0UNyHCsnnBKPm9U2Wl6hpgd/x+v3pgOXdT3q6Q9pYbq7aHmu0RfU+
 +6JM91zGi7fX7dkYP9NctsT1KStuTkLWRvFgwEHS1FQCpWBfwKz88u7mIwV/c1Em4Hwd
 1uTUIYAOhe3mZDivg+BqxVUheoIYI8ANXLpDaAoT31Ip2qir8dOb0zjeFB1iGCTZYPbn
 S2Sg==
X-Gm-Message-State: AOAM530ThzUMc8mu37MqNZhgWa/1/bEfhQSXLjElrWAyEsryPeS2Qfe6
 7KBqpL2Ih4mI7lNpJeklMA==
X-Google-Smtp-Source: ABdhPJzgCSk7w9DxNqhAYhWxkv43pujoIQ16tiGZjVM1hq+XIuSE6wC2gLvT4TgIg5bCndUVD3gFQw==
X-Received: by 2002:aca:c104:: with SMTP id r4mr3590467oif.93.1641952488564;
 Tue, 11 Jan 2022 17:54:48 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bh36sm455059oib.19.2022.01.11.17.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 17:54:47 -0800 (PST)
Received: (nullmailer pid 3905050 invoked by uid 1000);
 Wed, 12 Jan 2022 01:54:46 -0000
Date: Tue, 11 Jan 2022 19:54:46 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 2/6] dt-bindings: display: meson-vpu: add third DPI
 output port
Message-ID: <Yd405jhJtNSiOgzm@robh.at.kernel.org>
References: <20220107145515.613009-1-narmstrong@baylibre.com>
 <20220107145515.613009-3-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220107145515.613009-3-narmstrong@baylibre.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 07 Jan 2022 15:55:11 +0100, Neil Armstrong wrote:
> Add third port corresponding to the ENCL DPI encoder used to connect
> to DSI or LVDS transceivers.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../devicetree/bindings/display/amlogic,meson-vpu.yaml       | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
