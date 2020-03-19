Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 911F418BF5E
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 19:29:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 953266EA57;
	Thu, 19 Mar 2020 18:29:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 163186EA57
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 18:29:30 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id l14so3192428ilj.8
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 11:29:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nuVG9R1fl5aV0113Wkqeyi+DwSUJE/i7o0mHYMU/pW0=;
 b=paGAXL13b4RN5JFNdvIGH0dEkAFSJ5+AlEXZn9RhZlwTBQVn1hh8dLe2pHxOoluMOO
 YnNgUGbDH/IRwoLfUBL8rr/2oCMRGknOYx0VHt0Vp6KDm54Qjf4JEkJMWFv6UL7rUriX
 3zxvRzHH8boE5EtrqYHDDCcunPF2P+DeneHYJUDxWZnIpZQnJAvS8sR95qK/lwGtIPbk
 T8P6Wk28Fxal3byhzYENEygEuaFs5ospzsRAc4+BtY74wq7iH7mVoRT1kGhlFn92qd/z
 8klG+DTZUROdbED2im794By+jBHkP+CM9RmRaYa10yYyFbDQ/gh3L4zTM8+lLjkUFEUT
 zEpw==
X-Gm-Message-State: ANhLgQ2SRe3M3ETIudigQTLWmNT3GR38zDZ2dFxCi9ctUnOrG4a8an3U
 tY237nTTUmRM4ikkjcLvmw==
X-Google-Smtp-Source: ADFU+vuYRWENnnjTGXdM/3tIX9NPpmnsPCMZgoJW/FYaAg8G19QayHs3ZHRHOhNCbt+PxUpH9dpgjA==
X-Received: by 2002:a92:9c54:: with SMTP id h81mr4599212ili.109.1584642569415; 
 Thu, 19 Mar 2020 11:29:29 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id c28sm1144757ilf.26.2020.03.19.11.29.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 11:29:28 -0700 (PDT)
Received: (nullmailer pid 16853 invoked by uid 1000);
 Thu, 19 Mar 2020 18:29:25 -0000
Date: Thu, 19 Mar 2020 12:29:25 -0600
From: Rob Herring <robh@kernel.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v13 2/6] dt-bindings: display: mediatek: control dpi pins
 mode to avoid leakage
Message-ID: <20200319182925.GA13920@bogus>
References: <20200311071823.117899-1-jitao.shi@mediatek.com>
 <20200311071823.117899-3-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200311071823.117899-3-jitao.shi@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cawa.cheng@mediatek.com,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 11, 2020 at 03:18:19PM +0800, Jitao Shi wrote:
> Add property "pinctrl-names" to swap pin mode between gpio and dpi mode. Set
> the dpi pins to gpio mode and output-low to avoid leakage current when dpi
> disabled.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dpi.txt  | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> index 58914cf681b8..260ae75ac640 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> @@ -17,6 +17,10 @@ Required properties:
>    Documentation/devicetree/bindings/graph.txt. This port should be connected
>    to the input port of an attached HDMI or LVDS encoder chip.
>  
> +Optional properties:
> +- pinctrl-names: Contain "default" and "sleep".

> +  pinctrl-names see Documentation/devicetree/bindings/pinctrlpinctrl-bindings.txt

Drop this line.

> +
>  Example:
>  
>  dpi0: dpi@1401d000 {
> @@ -27,6 +31,9 @@ dpi0: dpi@1401d000 {
>  		 <&mmsys CLK_MM_DPI_ENGINE>,
>  		 <&apmixedsys CLK_APMIXED_TVDPLL>;
>  	clock-names = "pixel", "engine", "pll";
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&dpi_pin_func>;
> +	pinctrl-1 = <&dpi_pin_idle>;
>  
>  	port {
>  		dpi0_out: endpoint {
> -- 
> 2.21.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
