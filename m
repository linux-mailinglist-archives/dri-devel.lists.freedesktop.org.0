Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 756012612C9
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 16:36:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D66C56E846;
	Tue,  8 Sep 2020 14:36:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 4159 seconds by postgrey-1.36 at gabe;
 Tue, 08 Sep 2020 14:35:59 UTC
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7C516E846
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 14:35:59 +0000 (UTC)
Received: from [192.168.0.20]
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2900D3B;
 Tue,  8 Sep 2020 16:35:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1599575751;
 bh=PxKNg87pbqlGsiqqN7yqG8jWEtELrqZ/9wZYhmKnasQ=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=DorOY8Y6kwJ0Su/Lqj9yFCUvEAYUzs1qoCg2jsnY987ugQFtQrEAgm8JMj2W8nlC/
 Zxcn2VjA6/iZJlRJbq/ECn+MKDBuIlzoRoW2RESHj74y2Tp8rbBbCmZhpZeRKKnv5Z
 hUDU3yUWCabLMl2XpjEczLjE051F3lF6iFBtJgc4=
Subject: Re: [PATCH v2 03/10] dt-bindings: display: renesas: dw-hdmi: Add
 R8A77961 support
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Rob Herring <robh+dt@kernel.org>, Laurent
 <laurent.pinchart@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <87o8mhrtxo.wl-kuninori.morimoto.gx@renesas.com>
 <87k0x5rtwi.wl-kuninori.morimoto.gx@renesas.com>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <b351ab59-131d-c65e-250f-bb5ebf64a4f8@ideasonboard.com>
Date: Tue, 8 Sep 2020 15:35:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87k0x5rtwi.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-GB
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
Reply-To: kieran.bingham+renesas@ideasonboard.com
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Linux-DT <devicetree@vger.kernel.org>,
 "\(Renesas\) shimoda" <yoshihiro.shimoda.uh@renesas.com>,
 Magnus <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Morimoto-san,

On 08/09/2020 01:34, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This patch adds R-Car M3-W+ (R8A77961) SoC bindings.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  .../devicetree/bindings/display/bridge/renesas,dw-hdmi.txt       | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
> index e6526ab485d0..2086f4514911 100644
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
> @@ -16,6 +16,7 @@ Required properties:
>    - "renesas,r8a774b1-hdmi" for R8A774B1 (RZ/G2N) compatible HDMI TX
>    - "renesas,r8a7795-hdmi" for R8A7795 (R-Car H3) compatible HDMI TX
>    - "renesas,r8a7796-hdmi" for R8A7796 (R-Car M3-W) compatible HDMI TX
> +  - "renesas,r8a77961-hdmi" for R8A77961 (R-Car M3-W+) compatible HDMI TX
>    - "renesas,r8a77965-hdmi" for R8A77965 (R-Car M3-N) compatible HDMI TX
>    - "renesas,rcar-gen3-hdmi" for the generic R-Car Gen3 and RZ/G2 compatible
>  			     HDMI TX
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
