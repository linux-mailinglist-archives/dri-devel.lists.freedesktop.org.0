Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC13D4AE7DF
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 04:30:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A5C810E3D4;
	Wed,  9 Feb 2022 03:30:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C548B10E2BE
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 03:30:29 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id v67so1194431oie.9
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 19:30:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=m7oHOuveJzjB7zvN+hnuLSMzifBzu2e4cvQ37V0Sy9A=;
 b=VcIjbxaCPXlmmrlb9eP1bZT8E6cIAM/VXjr1Z0M7ARF4zBQHmCu1wAZgI+NMAFgqRe
 1fmbBLYh0LFX+D5R78Dg2a5XiXEmAVeG2qjPrqlNBJmeulOPgfoiFJ5HfNBsEv5/RNTZ
 NratKOz72BuUtbioXe6dd2aOVKYQN5zPeXMbeaAuhdovlv0E+T7hkOuxC5LlyyaAA6ld
 LQQloLJIDFwN15aA35SQLmpgmQw5OVfPo38sk6n1lZKFLU7geOVt5eff7VwkVYjL+8ss
 GGTRjT+vi9D6EhzmgSgY6hWV/TnoQy8T8HhUifVVunPkYpWrOgFPF2w2MB1WKi278aXM
 9rYw==
X-Gm-Message-State: AOAM533VOiuCcFxcePDC+co59GgzexSlRYTwtKjFa4Vs1p+bDXgEd75h
 jlCzIuMUWMaMh8uklDln2w==
X-Google-Smtp-Source: ABdhPJwQW+Z7UZFyx5cKb/tU/AIPO7Ff6qsz6P71dMzoL3waysd8bq9+j1OieOPYWxiCOUyE2Qan5A==
X-Received: by 2002:a05:6808:189f:: with SMTP id
 bi31mr117634oib.5.1644377428874; 
 Tue, 08 Feb 2022 19:30:28 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id c6sm6025419ooo.19.2022.02.08.19.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 19:30:28 -0800 (PST)
Received: (nullmailer pid 3582798 invoked by uid 1000);
 Wed, 09 Feb 2022 03:30:27 -0000
Date: Tue, 8 Feb 2022 21:30:27 -0600
From: Rob Herring <robh@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 15/27] dt-bindings: display: rockchip: dw-hdmi: Add
 regulator support
Message-ID: <YgM1U+4wqcky0KQy@robh.at.kernel.org>
References: <20220126145549.617165-1-s.hauer@pengutronix.de>
 <20220126145549.617165-16-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220126145549.617165-16-s.hauer@pengutronix.de>
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

On Wed, 26 Jan 2022 15:55:37 +0100, Sascha Hauer wrote:
> The RK3568 has HDMI_TX_AVDD0V9 and HDMI_TX_AVDD_1V8 supply inputs
> needed for the HDMI port. Add the binding for these supplies.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  .../bindings/display/rockchip/rockchip,dw-hdmi.yaml   | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
