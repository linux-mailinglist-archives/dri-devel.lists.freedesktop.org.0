Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F2F4AE7D9
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 04:29:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B80810E188;
	Wed,  9 Feb 2022 03:29:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com
 [209.85.161.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F37110E143
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 03:29:23 +0000 (UTC)
Received: by mail-oo1-f50.google.com with SMTP id
 t75-20020a4a3e4e000000b002e9c0821d78so1057262oot.4
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 19:29:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vrlWV0rjTSnyjpdLzphWMOjXtr2TKbwoXndPu2RhBe0=;
 b=7TmoTLRni7kplIpMzsmMQzxGvbAqDfKHgzYCNU5l2eetCwvt0FtTJzU2xdwMfdvkg4
 a2L2a4mMrqArfGeGnxAsvL2VUrUwebrM8lOUQvwMTSfgSHXRHI20Mt7oiUGWNLneKt6h
 oG3MwqyMqNC2IPg1UIgIYN3CMw9PSS7qQP/L4qA9Ybo8hVBouTE+Je1EKhpeyRaVXoCZ
 EHZVCezLf5zcG608KO8il2RNxdnMeTxEue1D86R9L6bX9DKRZ2cIvlqjP1sFcOneDZoK
 KhZ7aIc6sCVcFIY8AZuk5Ujfm8qsD7JmYx/UQizIumE6cSH2ZoxmSMDw+QBynAht4gz/
 pySw==
X-Gm-Message-State: AOAM533pTWV6/wdM3YQRelFt4vTCaolFfXai8uGYAOvFOziWswlErPor
 CWZj6gaK4KHP4/leZjzTqnKgQvYMxQ==
X-Google-Smtp-Source: ABdhPJwg7nlEH3UMRliehVkH3nRJwXn01xZwslphv83rqfb0xKxsi4EUU5JbtTxirfS7RJpHF3BCuA==
X-Received: by 2002:a05:6870:7385:: with SMTP id
 z5mr350695oam.228.1644377362569; 
 Tue, 08 Feb 2022 19:29:22 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id h17sm6098009otn.60.2022.02.08.19.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 19:29:21 -0800 (PST)
Received: (nullmailer pid 3581079 invoked by uid 1000);
 Wed, 09 Feb 2022 03:29:20 -0000
Date: Tue, 8 Feb 2022 21:29:20 -0600
From: Rob Herring <robh@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 13/27] dt-bindings: display: rockchip: dw-hdmi: Make
 unwedge pinctrl optional
Message-ID: <YgM1EGnuOdKnBFB/@robh.at.kernel.org>
References: <20220126145549.617165-1-s.hauer@pengutronix.de>
 <20220126145549.617165-14-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220126145549.617165-14-s.hauer@pengutronix.de>
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
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, kernel@pengutronix.de,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, Andy Yan <andy.yan@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 26 Jan 2022 15:55:35 +0100, Sascha Hauer wrote:
> None of the upstream device tree files has a "unwedge" pinctrl
> specified. Make it optional.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  .../devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml   | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
