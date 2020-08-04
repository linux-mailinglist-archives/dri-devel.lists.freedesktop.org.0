Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D2323C6C9
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 09:14:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079726E51B;
	Wed,  5 Aug 2020 07:13:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E99F89D83
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 17:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1596562816;
 bh=xj2mO6FXcqa+VAPR3RpZMLHRpg7TKnj7zvekr6g51y0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=fc3E3HwHvZK7xYq4qip9hx4hEQ2qNK2hpgOSVN6GDhNr002x7U3BDYznrUMjFsdl7
 ec6ljDUzeXcdJvyjsdyZbkl9DlZ7c/tFoO5qIW2NF+yKtCs6MR4iu1S5HN46Pb8iYa
 4FUL21dO0aT/+gm8jGK4IlbZzX8sd9bMWGGUfN6g=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.144.119] ([217.61.144.119]) by web-mail.gmx.net
 (3c-app-gmx-bap28.server.lan [172.19.172.98]) (via HTTP); Tue, 4 Aug 2020
 19:40:16 +0200
MIME-Version: 1.0
Message-ID: <trinity-5335a61e-b8f0-4441-9fe9-0827cdd67ce4-1596562816887@3c-app-gmx-bap28>
From: Frank Wunderlich <frank-w@public-files.de>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Aw: Re: [PATCH v4 6/6] arm: dts: mt7623: add display subsystem
 related device nodes
Date: Tue, 4 Aug 2020 19:40:16 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <3966b4f687f2fabf9041059dd5f39165177a6ef6.camel@infradead.org>
References: <20200804165555.75159-1-linux@fw-web.de>
 <20200804165555.75159-8-linux@fw-web.de>
 <3966b4f687f2fabf9041059dd5f39165177a6ef6.camel@infradead.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:cE3oyYRo7iHumadFLkcHlNNvUrLjo0Ue9IPpAdmst9Y1FT4tnAKLaXaNWUgBVzrY00Gxm
 9sEl45trA+gwdzPyqBA9uEG1EzcMTFkHajKljxhOoyiLziRoFgritPbipiZS241ElB28ug8hV2nd
 iN+CNpG5RX76zBM1e886lmE8QT3/J6eW0dacRzuWMCGkJIE5D+Qydg0vvjmhoOWF06bfreAhsJLa
 Ibb1cJwKgPCBBvv76uhqvjl51kNKqQIEafGEIOX2JOl83D2btgP0edCyiiCDI5ZfoIM2NwF2pAxh
 UA=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vt70ifthSno=:7aBvSJ4cHShtukoqpqya+b
 jqkQg445TBJlwdMpcZMrOuVYr2f1xSOD+2I0jKcsaKU9oUpJhKt5qDLi3cMYKFD+ILa7bISev
 miuNSx16Fsi6jKm5gqG8nTWGh5rmHgZ2uaShiop2UCszl8GrX1HfYM93hcFS1XR4Vnwow+OYA
 ZKzSUWEIWJ3/1tO5MiFs8sT4JA69Tx5niAEOskzMgcv42FFVucbuWEeFenZrLIaFDkJdqNFnJ
 FNypNCdYdtgN8D/NgnVJweSijwRJk4wSvIFmKMC2QgLp9+6vL7MiAvtWQZmCcLpVlm6WnsS7x
 8C46fpsMwqY4eH4uUPLfhrB5LJAcsHwC+vH3T0nTXqE9auM+W7YN/OQM+tno7fPFs9LeyTw3u
 dCLvwHL7m2U0c2hjl75cYCpa+vt3ILot6r9qfAMXDvknkjM5iYtkAj42yCJ/+Tlo+VyvUEmjf
 y6SAjansKK7piBH0Lj7mHdaqNCl8Pw9ytrZs+coE8tXWj0aiPo8OOGwet87Em8JX0nawxD3wb
 nwWLKh3aEV+0orPdVEFrrBJX5uAJlYc1qxeUs+5TOMq4x0JsEoKSBEBfAwqQoYRDwc4lPi5u0
 cfg2JWiMs1NT0DV0utl0kBCvdoIEfRYyhwqskEWuTAdJV9oUayadq09mNPDsNb8Q3jjI+Y9D9
 VWXBcxCdKmlsdoOnTl1+m8V9IhWmQuPY0RDgTpgXpzP+/szSfGNoEyXQ/upDl4/fW8eg=
X-Mailman-Approved-At: Wed, 05 Aug 2020 07:13:16 +0000
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Frank Wunderlich <linux@fw-web.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Gesendet: Dienstag, 04. August 2020 um 19:24 Uhr
> Von: "David Woodhouse" <dwmw2@infradead.org>

> > +	mipi_tx0: mipi-dphy@10010000 {
> > +		compatible = "mediatek,mt7623-mipi-tx",
> > +			     "mediatek,mt2701-mipi-tx";
> > +		reg = <0 0x10010000 0 0x90>;
> > +		clocks = <&clk26m>;
> > +		clock-output-names = "mipi_tx0_pll";
> > +		#clock-cells = <0>;
> > +		#phy-cells = <0>;
> > +	};
>
> Doesn't this (and some others) also need status="disabled" since
> they're not present on MT7623A? Or maybe it's time to split mt7623.dtsi
> into a mt7623n.dtsi which includes mt7623a.dtsi and adds the extra
> components?

do you have a MT7623A board for testing? is there any list which components are existing on mt7623a? or should i disable all of them and re-enable them in bpi-r2 dts?

regards Frank
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
