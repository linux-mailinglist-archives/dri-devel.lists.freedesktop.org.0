Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E934D6427
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 15:55:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A700B10E054;
	Fri, 11 Mar 2022 14:55:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com
 [209.85.161.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CD4610E06B
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 14:55:33 +0000 (UTC)
Received: by mail-oo1-f54.google.com with SMTP id
 x26-20020a4a621a000000b00320d7d4af22so10762138ooc.4
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 06:55:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4vC10SOLI9xOKTVYszTXMZKBktQmr7QFcn56lUlHPqY=;
 b=Byb1diHUkSz6kjI/CRLsNebwgrhXTOs++eD09M0XDOdIfgUxmfDsz5sIgmx9wJ+Io8
 feaLNBMCorHLDaXKLyk11m08lZAEwGdVw7wTXTdOhCxxifhNHqTagy1QSUK6ifDke5vH
 RDXccqgK9O6B9rDgo+06U/Axw59dp+STiiB6pYggNwGIA64O1dLiFgj/WostlZ+iDRzD
 AIlhM3gDd2Yxtc8GNbTGwIeesGKT2LUn9TppiKp1UrgOiMaJumPPxmen5XIltju7M+SA
 Uc+4VXwTtJskAXmMEFOe8t3G8SsAp3hxfJYMMA++fTefd6ykLVqx8mMhU5zl5LhSqNOV
 W8Ng==
X-Gm-Message-State: AOAM531enH1RvBfCzg/I4gs7u81IupVrqy4nS3iY627/vJolMJRaS8nv
 hb/w7NjCH778/8y6r37gsw==
X-Google-Smtp-Source: ABdhPJyE+yG0Kmj8j3sIuXoUp3Io81NMMrA2r6Q0cA7nkN1tKUpiAx9HKkuSbr2kBPy0PNmsE3WMOw==
X-Received: by 2002:a05:6870:3929:b0:d9:a13b:2454 with SMTP id
 b41-20020a056870392900b000d9a13b2454mr11082044oap.162.1647010532202; 
 Fri, 11 Mar 2022 06:55:32 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 n23-20020a056870559700b000d47e9dabf0sm3791327oao.0.2022.03.11.06.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 06:55:31 -0800 (PST)
Received: (nullmailer pid 3777813 invoked by uid 1000);
 Fri, 11 Mar 2022 14:55:30 -0000
Date: Fri, 11 Mar 2022 08:55:30 -0600
From: Rob Herring <robh@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v8 10/24] dt-bindings: display: rockchip: dw-hdmi: Add
 additional clock
Message-ID: <Yiti4n0prhDLdYC+@robh.at.kernel.org>
References: <20220311083323.887372-1-s.hauer@pengutronix.de>
 <20220311083323.887372-11-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220311083323.887372-11-s.hauer@pengutronix.de>
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

On Fri, 11 Mar 2022 09:33:09 +0100, Sascha Hauer wrote:
> The rk3568 HDMI has an additional clock that needs to be enabled for the
> HDMI controller to work. It is not needed for the HDMI controller
> itself, but to make the SoC internal busses work.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
> 
> Notes:
>     Changes since v7:
>     - rename hclk to niu
> 
>  .../bindings/display/rockchip/rockchip,dw-hdmi.yaml        | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
