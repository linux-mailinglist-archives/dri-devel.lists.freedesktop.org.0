Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 874A943F9F3
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 11:33:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C1D36EA26;
	Fri, 29 Oct 2021 09:33:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 709C26EA26
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 09:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CndVQumI3AmJcTN9QjVmztpnvBa8Y3ayGPnj6RHPOAk=; b=S5rvlnm+YWnjZXwjESU4Cg9RkO
 1oBbvOtf8vlGrivD0exvKmG0JIpjsoc+PTkH6ccKmlrERZzQcrxC4uSvu1FnUXch/g3Ufoyx+4Zbc
 7watAkRcNQcZ1voNNBWUYuEa+90pWl6GPIEPMwxRkQzhQMigIYRkDqAVqNCf7tCNAiIRCp4KVj62X
 LouPAmvZsuDT+DZ6CqZKAc9C2Jm3V3eNuEkSrmQKDA7Wvgig0EmQYekp/Xbw87PLOEy74YkdG/6MF
 +ZNGJpole4xXsYrl23p3ChgLFSBr0OAbWQ2TTZ6S+T1rQrdC1lOyRwiRJRfshHGYhNykv+D+SHeQu
 31MQr1DA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55376)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1mgOG1-0008SP-Si; Fri, 29 Oct 2021 10:33:05 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1mgOFz-0001Uu-OQ; Fri, 29 Oct 2021 10:33:03 +0100
Date: Fri, 29 Oct 2021 10:33:03 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>,
 =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Magnus Damm <magnus.damm@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>,
 "open list:TI ETHERNET SWITCH DRIVER (CPSW)" <linux-omap@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 3/3] [RFC] dt-bindings: display: bridge: nxp,tda998x:
 Convert to json-schema
Message-ID: <YXu/zwjYqoqYgfLx@shell.armlinux.org.uk>
References: <cover.1634822085.git.geert+renesas@glider.be>
 <1f6bf58d76efc2e869b800534b818d1451ef98a2.1634822085.git.geert+renesas@glider.be>
 <YXtIsCnJ+L5zqCVk@robh.at.kernel.org>
 <YXusEUpTBUdvS7LY@shell.armlinux.org.uk>
 <CAMuHMdX+Ke54zyi2Z2ROk-2xpbcXU6+FFH71gEz0vEBXCAgVXw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdX+Ke54zyi2Z2ROk-2xpbcXU6+FFH71gEz0vEBXCAgVXw@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 29, 2021 at 10:28:22AM +0200, Geert Uytterhoeven wrote:
> Hi Russell,
> 
> Thanks for your comments!
> 
> No, you can still use port:
> 
> +oneOf:
> +  - required:
> +      - port
> +  - required:
> +      - ports
> 
> When using ports, no further requirements are set, but perhaps port@0
> should be made required in that case?

Maybe I don't understand the binding description then, but to me it
looks like you require both port@0 and port@1.

The reality of the driver is that it makes almost no use of the graph
itself, except via drm_of_find_possible_crtcs() to find the connected
CRTCs. If it is connected to an I2S source, then it probably needs a
port specification for that. If someone wants to describe the HDMI
connector (which I don't see any point in) then they likely need a
port specification for that too. However, the driver itself doesn't
care about any of those.

So, describing the port nodes makes no sense.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
