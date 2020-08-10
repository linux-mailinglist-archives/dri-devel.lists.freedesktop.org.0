Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B5C240CF4
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 20:27:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A5A89FDB;
	Mon, 10 Aug 2020 18:27:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D708B89FDB
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 18:27:15 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 4F7CB20023;
 Mon, 10 Aug 2020 20:27:13 +0200 (CEST)
Date: Mon, 10 Aug 2020 20:27:12 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: allen <allen.chen@ite.com.tw>
Subject: Re: [PATCH v1 1/2] ite-it6505 change trigger conditions
Message-ID: <20200810182712.GA408647@ravnborg.org>
References: <1597053278-25421-1-git-send-email-allen.chen@ite.com.tw>
 <1597053278-25421-2-git-send-email-allen.chen@ite.com.tw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1597053278-25421-2-git-send-email-allen.chen@ite.com.tw>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=d2tX9T8KrmGLFF5Hj1IA:9 a=CjuIK1q_8ugA:10
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Kenneth Hung <Kenneth.Hung@ite.com.tw>,
 Pi-Hsun Shih <pihsun@chromium.org>, Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>,
 David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Hermes Wu <Hermes.Wu@ite.com.tw>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Allen.

On Mon, Aug 10, 2020 at 05:53:17PM +0800, allen wrote:
> it6505 changes trigger conditions.
> ---
>  Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> index 2c50016..bf0e889 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> @@ -73,7 +73,7 @@ examples:
>  
>          dp-bridge@5c {
>              compatible = "ite,it6505";
> -            interrupts = <152 IRQ_TYPE_EDGE_FALLING 152 0>;
> +            interrupts = <152 IRQ_TYPE_LEVEL_LOW 152 0>;
>              reg = <0x5c>;
>              pinctrl-names = "default";
>              pinctrl-0 = <&it6505_pins>;
I fail to see the need for this. The example shall describe the binding
and is not necessarily a correct description of the HW.
People should look in the dts file for the HW descriptions, not the
binding examples. So I have dropped this patch.

	Sam

> -- 
> 1.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
