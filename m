Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C924B2B53
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 18:08:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 337D310EAD8;
	Fri, 11 Feb 2022 17:08:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F53A10EAD8
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 17:08:04 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id u3so10177480oiv.12
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 09:08:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=R7TWwHQgq/gUi7lhU9NsZIWS2INPHgAbX9uQVxuU8C8=;
 b=ju4Aycrub4h7yXuj5ma7mfaGSIHZdrh0mV7Qia5mQli5fSxBBLxKK7U+yW5tZe5nBw
 TKY0ZFyOr4g7CMMgtQKniAXtHfzotDAvY/mU5NS2ZFLGaA8b/xmelCvNX+6IYCT5KT0Z
 2rk+9FxH/OPPrSG61Sp8IgPeEj7kc2usJGtiCmKHO2Nq1F8DT9wynKPMd6FP7c1Ij3nw
 08m237sPl68eL8PIqtsvVSLiFSaT7uPmdR183GAjG2664HfWF/XgAoFXIaHaFRLhFn2F
 ZcGKiQKFOc2HzqvA4laRe+iDs0bOzWfmyd0Hlj2jB73/4TY53YIZ7Yfz5iJu5BrwTpWQ
 zeXA==
X-Gm-Message-State: AOAM5318FcEq6e06IcTGcCBteKv8v/D7H+smcw7JfTRCl8jpn56pMgxB
 IZ2lS+FrTfcKrlVRw+xoCw==
X-Google-Smtp-Source: ABdhPJyxSa9G6VEbAaX4cveou0lyE+/EhRjxN4fbYgq4kSA+bQ00S52Xggx1BCfmuOEo2hhcrNR4DA==
X-Received: by 2002:a05:6808:221d:: with SMTP id
 bd29mr675535oib.63.1644599283411; 
 Fri, 11 Feb 2022 09:08:03 -0800 (PST)
Received: from robh.at.kernel.org ([2607:fb90:5fee:dfce:b6df:c3e1:b1e5:d6d8])
 by smtp.gmail.com with ESMTPSA id
 z4sm9269527ota.7.2022.02.11.09.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 09:08:02 -0800 (PST)
Received: (nullmailer pid 530607 invoked by uid 1000);
 Fri, 11 Feb 2022 17:07:59 -0000
Date: Fri, 11 Feb 2022 11:07:59 -0600
From: Rob Herring <robh@kernel.org>
To: Michael Riesch <michael.riesch@wolfvision.net>
Subject: Re: [PATCH v6 1/5] dt-bindings: gpu: mali-bifrost: describe clocks
 for the rk356x gpu
Message-ID: <YgaX7ze76nFtEcN9@robh.at.kernel.org>
References: <20220209215549.94524-1-michael.riesch@wolfvision.net>
 <20220209215549.94524-2-michael.riesch@wolfvision.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220209215549.94524-2-michael.riesch@wolfvision.net>
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
 Sascha Hauer <s.hauer@pengutronix.de>, Alex Bee <knaerzche@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Peter Geis <pgwipeout@gmail.com>,
 Liang Chen <cl@rock-chips.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 09 Feb 2022 22:55:45 +0100, Michael Riesch wrote:
> From: Alex Bee <knaerzche@gmail.com>
> 
> The Bifrost GPU in Rockchip RK356x SoCs has a core and a bus clock.
> Reflect this in the SoC specific part of the binding.
> 
> Signed-off-by: Alex Bee <knaerzche@gmail.com>
> [move the changes to the SoC section]
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> ---
>  .../devicetree/bindings/gpu/arm,mali-bifrost.yaml | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
