Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBE97A6A43
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 19:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B24B910E14F;
	Tue, 19 Sep 2023 17:54:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB77A10E14F
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 17:54:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id B5A19CE13D4;
 Tue, 19 Sep 2023 17:54:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15678C433C8;
 Tue, 19 Sep 2023 17:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695146061;
 bh=m4QJ0BEqXBcCMqumpvL8l5Izb8BPtm/4/9KcdbA0EfM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NhnGC71YjdIe4G8IbxqHxJeePYOZdypo3Am3KAlW5f6VlznflAFwn+aIOI6GpVcj0
 UYO1g9QS6JB61M63XrK2+1oVkcaFKufHjUmmXWLV5RqCWF9Blboc9GhLTLOlKggPdf
 SDepgoTGbDmFeSLwgQDZZvDGClX4QY/fzgvTmxLMgukQhT6JN5GeZG0ys0ovRxxdc4
 WAidbUjXW8jADcyYNa7FfwniAoDz/Ih5DVo70WRONOQn9EqZOStKpKh047vbGoyRaC
 qvoMCirg0PYAjpWQLvKuOgD8ifj7XBKz8h1Nk1ZSjFkuWXJ19yPjPad6ejy28im/Nk
 LlaFfT4j7P8aQ==
Received: (nullmailer pid 4151433 invoked by uid 1000);
 Tue, 19 Sep 2023 17:54:19 -0000
Date: Tue, 19 Sep 2023 12:54:19 -0500
From: Rob Herring <robh@kernel.org>
To: Alicja Michalska <alka@sakamoto.pl>
Subject: Re: [PATCH] dt-bindings: display: anx7814: Add definition for anx7816
Message-ID: <169514605849.4151400.3982298179222197691.robh@kernel.org>
References: <ZQjFabKW7QvrvsnG@tora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZQjFabKW7QvrvsnG@tora>
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@gmail.com,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, jonas@kwiboo.se,
 dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 18 Sep 2023 23:49:44 +0200, Alicja Michalska wrote:
> As requested by Robert Foss <rfoss@kernel.org>, this patch adds
> definition for anx7816. It supplements the patch submitted to dri-devel.
> 
> Signed-off-by: Alicja Michalska <ahplka19@gmail.com>
> ---
>  .../devicetree/bindings/display/bridge/analogix,anx7814.yaml     | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

