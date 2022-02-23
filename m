Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEA24C17D2
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 16:55:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F5C10E5BC;
	Wed, 23 Feb 2022 15:55:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com
 [209.85.161.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B669810E2DD
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 15:55:11 +0000 (UTC)
Received: by mail-oo1-f48.google.com with SMTP id
 i10-20020a4aab0a000000b002fccf890d5fso22861750oon.5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 07:55:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AY9Rst+R0XJdUuRWhEYpgduaPwSTvm033nlzuhQ6N64=;
 b=v6q2hWHAIGE2/typi7OzNDoZowA/J/qab7cxVAevLwYDDV5oo9dw+PCwhlrXP63gSQ
 2sQwe+BcGWq1to6sfnX1xkPBdE4dndpNjIElN0blyr4/XNsVK5BvPGnM95RHAYwfQw6E
 Z3v3cDzG01ZIRyQ12P9HmqyzZFGRg2jlQIi3XCifzdUzwA7Ua2BwQ98boActWc/DzzvU
 40+b8fHymIUcD2pLBDT1LD1vE29WarfyP5zeauIIXUKjFKe22tZgKZm5JbkpFcOsvdfn
 i3sGIrSch0wFuPi8kSPlUTUoN4lendyL2ucoIvKz/jxWcZmZjtCvqKGpri1J2dL9qExy
 r7pA==
X-Gm-Message-State: AOAM531vUu0ML1nZCwu+Mu8mEh1hzMxvSfVFFO+zhsAYpclCUFt/T50S
 PChFdL8pdgQu50TxTbt35A==
X-Google-Smtp-Source: ABdhPJx3cqGQBNB+wBd73wt4IykRtWY7bNDjTg6vOPJPvXlyPhl5eAy07J3mvRkLnak1pIURW1OOWQ==
X-Received: by 2002:a05:6870:2b16:b0:c2:8be1:8b0f with SMTP id
 ld22-20020a0568702b1600b000c28be18b0fmr129502oab.2.1645631710861; 
 Wed, 23 Feb 2022 07:55:10 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id f40sm37321oaq.34.2022.02.23.07.55.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 07:55:09 -0800 (PST)
Received: (nullmailer pid 1001324 invoked by uid 1000);
 Wed, 23 Feb 2022 15:55:08 -0000
Date: Wed, 23 Feb 2022 09:55:08 -0600
From: Rob Herring <robh@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v6 23/23] dt-bindings: display: rockchip: dw-hdmi: fix
 ports description
Message-ID: <YhZY3BV6WE2+XgnT@robh.at.kernel.org>
References: <20220217082954.2967889-1-s.hauer@pengutronix.de>
 <20220217082954.2967889-24-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220217082954.2967889-24-s.hauer@pengutronix.de>
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, Andy Yan <andy.yan@rock-chips.com>,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 17 Feb 2022 09:29:54 +0100, Sascha Hauer wrote:
> Current port description doesn't cover all possible cases. It currently
> expects one single port with two endpoints.
> 
> When the HDMI connector is described in the device tree there can be two
> ports, first one going to the VOP and the second one going to the connector.
> 
> Also on SoCs which only have a single VOP there will be only one
> endpoint instead of two.
> 
> This patch addresses both issues. With this there can either be a single
> port ("port") , or two of them ("port@0", "port@1") when the connector
> is also in the device tree. Also the first or only port can either have
> one endpoint ("endpoint") for single VOP SoCs or two ("endpoint@0",
> "endpoint@1") for dual VOP SoCs.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
> 
> Notes:
>     Changes since v5:
>     - new patch
> 
>  .../display/rockchip/rockchip,dw-hdmi.yaml    | 24 +++++++------------
>  1 file changed, 9 insertions(+), 15 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
