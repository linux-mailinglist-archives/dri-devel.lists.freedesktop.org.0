Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3386923D775
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 09:39:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1E8B6E196;
	Thu,  6 Aug 2020 07:39:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9651789F6D
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 13:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1596632512;
 bh=30nFNzwPxZmz9Y2oABIElubYun9r6VlJJIvIzFQZ2Xg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=NvNUEbg1eTjb8vxJMZ0W8xXnbs9/JscXJ3mszIMsD8v9lFpwCVgS5DVp8WSBERSCM
 KGFK7GawcJMt7WSUcLSQG4vMclL0NulaBgvSve8sxjwqV9nIfEirpf19ggzIz1ZoS+
 oUAD6LODuMyoWnSzYRV19IJHRPQpDzIcJizHw1Lg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [80.208.209.197] ([80.208.209.197]) by web-mail.gmx.net
 (3c-app-gmx-bap13.server.lan [172.19.172.83]) (via HTTP); Wed, 5 Aug 2020
 15:01:52 +0200
MIME-Version: 1.0
Message-ID: <trinity-9f86ac52-5249-44e7-b51d-1ee00850f544-1596632511956@3c-app-gmx-bap13>
From: Frank Wunderlich <frank-w@public-files.de>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Aw: [PATCH 2/3] arm: dts: mt7623: move MT7623N GPU to separate
 mt7623n.dtsi file
Date: Wed, 5 Aug 2020 15:01:52 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20200805113013.2763510-2-dwmw2@infradead.org>
References: <8ef96e4d02ef82e171409945ee6cc0348c4fe594.camel@infradead.org>
 <20200805113013.2763510-1-dwmw2@infradead.org>
 <20200805113013.2763510-2-dwmw2@infradead.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:G8MRnqoV1D2B0ErxKua+b90DZKS/NUdemUbrgGRwofr3Vs3wa3sLtGJLSaIjAmckjfQuY
 N2q+Z1WAU5keJxhmjgF2SFnKLAx/+ssSg5jG4hUSN4rhMAozwVfyIJHClWHwJMkftrm1YI9Hdl3N
 N2EZp25fXiSYSNd4CgWyeh3C56OTSnt6jPqOH91UQ3q3+VeqQ8/hSKikviDmaPX5zjuc+ZoBk88W
 vF8v75+g6PyEv8XnV1zeMlKR5e7LgiTjKKDbo3QbXbuY0GPdBBboJNcu7cnHK7c5hBWoJyu0lqbH
 o0=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:jiGjo3r8E60=:SBV9Be3eLAX/vuefSNp4aT
 LkYXJUqZT8gJj5PqcNiEwuwkS6pryGTowBjPlaoDRcO0PpqHZF3SIL8U6V3RY7Wn7BCn6bj4o
 Etz6RdBQ4pAfWntN20HvWnRT9RwtwiQNOjdcYq2tiY5pZn0vJ0E62+HJ3KfVh2jc4r4NQgGBY
 PLjmlL2O2TeWsHBqCeIfHIT7Oy2889kOIWIJkWb5iWXv3Suw+lHxJSnxEce3WpXNPFu2whau2
 KaAnWxDuLN5H5mXGf6gf2aYTY5vHoUFB0SDZKnHj30EM/AvPXTIuKM/KZrvAT6CkJZASi1RBW
 wAnnWjiv95cUOcwEJ7yq08IterdkJFn++PEtDgeRpnnCmO9++OPT4wUsdb/uXbOcc26zYB+JU
 ajzULtPfh7SjFTOjPLwj0ypXysExotP3Krs1vBFVECARsiPTfeEgw4HGzjlr+h8kP+afXwAEQ
 yprfDYRgMyKmVj96fjfF3rBhHtytYk1o2UU2t/s4hQssUzGOXf9dLl0cVk//6bqMYnwG8H2cY
 DUzmTP0UOx73F4+nwW2EizlJZcZ7HXTAKRg/sKvuTJ5psVDH5Ss4Dm6TtACBHcFHt8YEkxZnS
 eHzfZXNZXe0d/mR7iMqk1jm7yM3ox7eF2Qqnw/IjwY2BEbL2uXKgFUtltb3qGp4uRqnbAcFOy
 dZZmG6aVBAmKCcWwlGYbwZV5vNM8kXO2C5Pyy1RWYWhkGvsOQsMJ1I7MaJrueJZCof9E=
X-Mailman-Approved-At: Thu, 06 Aug 2020 07:39:21 +0000
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 chunhui dai <chunhui.dai@mediatek.com>, David Airlie <airlied@linux.ie>,
 Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Frank Wunderlich <linux@fw-web.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi David

> Gesendet: Mittwoch, 05. August 2020 um 13:30 Uhr
> Von: "David Woodhouse" <dwmw2@infradead.org>
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> The MT7623A doesn't have a GPU; add it only for MT7623N boards.
>
> Fixes: 1f6ed224594 ("arm: dts: mt7623: add Mali-450 device node")
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

> diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
> index 3a6b856e5b74..dcd2f5ba4e20 100644
> --- a/arch/arm/boot/dts/mt7623.dtsi
> +++ b/arch/arm/boot/dts/mt7623.dtsi
> @@ -734,30 +734,6 @@ g3dsys: syscon@13000000 {
>  		#reset-cells = <1>;
>  	};
>
> -	mali: gpu@13040000 {
> -		compatible = "mediatek,mt7623-mali", "arm,mali-450";
...
> -		clocks = <&topckgen CLK_TOP_MMPLL>,
> -			 <&g3dsys CLK_G3DSYS_CORE>;
> -		clock-names = "bus", "core";
> -		power-domains = <&scpsys MT2701_POWER_DOMAIN_MFG>;
> -		resets = <&g3dsys MT2701_G3DSYS_CORE_RST>;
> -	};

i guess you should to move g3dsys too, and maybe the mmsys which is also drm-related?

I can add this to my series, but before i change my series, i need advice from MTK/DT owners whats the preferred way ;)

regards Frank
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
