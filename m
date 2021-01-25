Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B4C302D3F
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 22:09:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048636E284;
	Mon, 25 Jan 2021 21:09:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 641076E284
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 21:09:52 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id i25so4877836oie.10
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 13:09:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8EGUy8U2RwJyq81BEAVJtm2VF5/FAEU46s/eVOgFMfY=;
 b=BtnBKZUsmZSB8psVnp6KOK46X11jcNw7spskLgz3t197xOsgmEOam8HTpkNpKPRRhG
 Acfr4cutT3KXeBXGRBw2TkX+Ocd2KfelJggXbih1ew/zPVsCj6Ay6lqroN8lv/Z+cgGU
 cBnsjWiX9IUkZaE5NJUVF8N8/lBcNHfN3/OUIYELiJycGljOBKzMX3NjTgKLBLZBbS55
 fhRB1tYkOeyBTUgnzQJUt7AUJe33vc64JpApxPSAp4TTBENse9OsCu1uZPX85qCaaqQ2
 BAkSOtUwzTWL0l+LGAvu6R8tQwO/5iPe49c+PDyAGeQllIVxuJuNNF0iAxJHLeOS94Uk
 UPog==
X-Gm-Message-State: AOAM5333mleNZQvEUIiOVWoWzzg6iz0n4Jo7f+WoOVQ1cgGmiE9q25Qh
 cr9dLTx6hE2MBZPNHIF/oA==
X-Google-Smtp-Source: ABdhPJw/TL7yZ8JQWTLegv05bAk7wOK5tF1q2AOv/129pN+7Xi2JhuVEPqRl+CgJDDIq7XfPlIDQBA==
X-Received: by 2002:a05:6808:8e3:: with SMTP id d3mr820427oic.10.1611608991785; 
 Mon, 25 Jan 2021 13:09:51 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n19sm3702063otk.57.2021.01.25.13.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 13:09:50 -0800 (PST)
Received: (nullmailer pid 997768 invoked by uid 1000);
 Mon, 25 Jan 2021 21:09:48 -0000
Date: Mon, 25 Jan 2021 15:09:48 -0600
From: Rob Herring <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v2 04/14] dt-bindings: display: bridge: Add i.MX8qm/qxp
 pixel combiner binding
Message-ID: <20210125210948.GA997706@robh.at.kernel.org>
References: <1610616132-8220-1-git-send-email-victor.liu@nxp.com>
 <1610616132-8220-5-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1610616132-8220-5-git-send-email-victor.liu@nxp.com>
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 Laurent.pinchart@ideasonboard.com, narmstrong@baylibre.com, airlied@linux.ie,
 s.hauer@pengutronix.de, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kishon@ti.com, a.hajda@samsung.com,
 vkoul@kernel.org, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 mchehab@kernel.org, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 14 Jan 2021 17:22:02 +0800, Liu Ying wrote:
> This patch adds bindings for i.MX8qm/qxp pixel combiner.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v1->v2:
> * Use graph schema. (Laurent)
> * Use enum instead of oneOf + const for the reg property of pixel combiner
>   channels. (Rob)
> 
>  .../display/bridge/fsl,imx8qxp-pixel-combiner.yaml | 144 +++++++++++++++++++++
>  1 file changed, 144 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
