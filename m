Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE65423D77E
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 09:39:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 477806E87D;
	Thu,  6 Aug 2020 07:39:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA9866E505
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 07:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1596612461;
 bh=NJ3W3FnV8FjFCOCq58j3yAlSrdAYyv5IGb5zxRxgkfo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=lAOSobc5fopmfGe+oOaxYD7Jy/WzyrAHtMMke/Dmv8efLVmgsahLM76obUI3okfDU
 +8bMz36Qz+5+M96NIlP0RcYrMGIs0+ikGMFrQNCtqpl6VcfmQDL30SUPDdrECclCTN
 FxULD2Gl+bgdiTP+rdozURGA8bZeCz6N01fPoH2E=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [80.208.209.197] ([80.208.209.197]) by web-mail.gmx.net
 (3c-app-gmx-bap13.server.lan [172.19.172.83]) (via HTTP); Wed, 5 Aug 2020
 09:27:41 +0200
MIME-Version: 1.0
Message-ID: <trinity-16cee263-ff59-4595-adc1-738071745162-1596612461427@3c-app-gmx-bap13>
From: Frank Wunderlich <frank-w@public-files.de>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Aw: Re:  Re: [PATCH v4 6/6] arm: dts: mt7623: add display subsystem
 related device nodes
Date: Wed, 5 Aug 2020 09:27:41 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <45d34c6cc19c2e5c13f9e88a8e04bdae9259ffdc.camel@infradead.org>
References: <20200804165555.75159-1-linux@fw-web.de>
 <20200804165555.75159-8-linux@fw-web.de>
 <3966b4f687f2fabf9041059dd5f39165177a6ef6.camel@infradead.org>
 <trinity-5335a61e-b8f0-4441-9fe9-0827cdd67ce4-1596562816887@3c-app-gmx-bap28>
 <45d34c6cc19c2e5c13f9e88a8e04bdae9259ffdc.camel@infradead.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:SEYuaGP8Vwnd5amGqCfH/R98lwowQCF73eBx323W8BgrPpA2kZEH4ZYzVh+cqYPgXlfne
 jmvkrfQn2+cSr6UquFT+158ips5sk6liAJNFWXpNpd03rBFrDSTkaZ5kBjDw6Vrd40zkAZIMeD51
 FmdtAWuvoPjYHnDnMeho1Loqho42ttzdgxxW767qwHymTlJQl4ba0Br7JdclPuR+LD30YLs2kcl+
 Cc5cwNse9u8FpaNt/FNM+Y9Rn+ptbEUTCSGCW0Lz/4ss/kjaa6VMpE84LGpe+THzqcRyiglhwUUa
 DQ=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yakE5sTu7hc=:eKQHR+4doAROunHdQVNri5
 bxXCgNSvyBn9pA2iUvkHpdCaLALTxZr4W7lxP7ix0LMobilUK/ha/UgdNuGXSi/aG4qVJ8omT
 SYhZq8KoqSNBQ0kPQuF71vrLkQHkdpSBj0yfTeEZ5rnLuxU4gCGMvuepoNQrOycxl/jA/eB3h
 Trgv9rBzDci79BRGSY36aGqoTT+T4MvdDZk4zpzGFWRACN7kljThE4EYbHxUwxMzy3rShiSpC
 Dd+4SCcGU/WAUW+zxTe39Zl0tfQGucJHkNjwgRH3CM74Lls+Udaj2lhzr9mr7Y+cmbtWR6CzS
 VKsQIyG5Va6Vl3nkvDL5310F284gpf5m9pOU68s071y5e2GZ1WhnepxelxOj5UKnUqSME7DB8
 J3Iq+Yc6mHGX/EEBihZvEa30eKAynhDfxsbvnEEnO36eFAGNBpWTEViMiLChr5ZJGooB1+vxY
 F0HZ/rl8Ots6zyQg+LIfXjMHwLg7sEIZ81ewCTrwjugdSmZrsG8qe1OcOvmQT9u2L8uYESqQX
 xvGKNjJMfZe2UBGTYgs0tLywAsZwmZpGwPfer9nT4wfpRCMQOrVDsSEIDgRmXygYZ8J8r0Wsd
 BvHf+fRnCOPfDqJLxIc7MEEKt3N+YKcgMLIS3GGLN7rpC2OaxFpEG98X3ePLZNfRurJdSPTqx
 +wH64s6EooRPLCasHTDv29N3wlOVwgnzDWC5bGCGcI5l1hGSK2klP3xPbslW5imBUF+c=
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
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Frank Wunderlich <linux@fw-web.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CC Rob Herring + devicetree List + Sean

> Gesendet: Dienstag, 04. August 2020 um 20:02 Uhr
> Von: "David Woodhouse" <dwmw2@infradead.org>
> On Tue, 2020-08-04 at 19:40 +0200, Frank Wunderlich wrote:
> > > Gesendet: Dienstag, 04. August 2020 um 19:24 Uhr
> > > Von: "David Woodhouse" <dwmw2@infradead.org>
> > > > +	mipi_tx0: mipi-dphy@10010000 {
> > > > +		compatible = "mediatek,mt7623-mipi-tx",
> > > > +			     "mediatek,mt2701-mipi-tx";
> > > > +		reg = <0 0x10010000 0 0x90>;
> > > > +		clocks = <&clk26m>;
> > > > +		clock-output-names = "mipi_tx0_pll";
> > > > +		#clock-cells = <0>;
> > > > +		#phy-cells = <0>;
> > > > +	};
> > >
> > > Doesn't this (and some others) also need status="disabled" since
> > > they're not present on MT7623A? Or maybe it's time to split
> > > mt7623.dtsi
> > > into a mt7623n.dtsi which includes mt7623a.dtsi and adds the extra
> > > components?

any opinions about this? should i disable all new nodes and enable them in the
dts for specific board (bpi-r2/mt7623n-rfb)?

have prepared it here [1]

> > do you have a MT7623A board for testing? is there any list which
> > components are existing on mt7623a? or should i disable all of them
> > and re-enable them in bpi-r2 dts?
>
> The UniElec U7623 board (which is supported in OpenWrt) is MT7623A.
>
> I was told that MT7623N has GPU and HDMI, while the MT7623A has a
> built-in mt7530 switch. Does that imply the switch on the MT7623N
> boards is *external*?
yes, bananapi r2 has external mt7530 switch connected to gmacs 0+1 with its ports 6+5

> If so, that means that mt7623n.dtsi maybe shouldn't just include
> mt7623a.dtsi because it's not a strict superset; maybe they should both
> include a common mt7623.dtsi that has the parts that are truly common?
>
> I also suspect the switch definition from the UniElec U7623 dts should
> probably move to this new mt7623a.dtsi? That's not upstream yet though.

or should we split dtsi to have a common part (mt7623.dtsi), and one for
soc (mt7623n.dtsi/mt7623a.dtsi)?

mt7623.dtsi => mt7623n.dtsi => mt7623n-bananapi-bpi-r2.dts
mt7623.dtsi => mt7623a.dtsi => mt7623a-unielec-u7623.dts (not existing yet,
openwrt seems to use a board-specific dtsi)

regards Frank

[1] https://github.com/frank-w/BPI-R2-4.14/commits/5.8-hdmi4mainline
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
