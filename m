Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4414D23D784
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 09:40:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 054C36E880;
	Thu,  6 Aug 2020 07:39:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4303889AC0
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 08:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1596617396;
 bh=KouBFqPcVdY/N2jpqO+a5lVPiMqUcEXz0mYKHefvmGY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=PQ7H44NKYk24ie8whky4P/jtvHI4A3RB5Ggj+HPlOdWg5moXiKOsEEGJf26zYDqDb
 vfED0TdDZhJ8LzdqPusAOPTY3PjZlnRWwDXRTRL3WrRN/o33l55OP1BrQfiw01gADm
 1uMXYlTYrbbNv4yza3AzyOVWCPWSwEzUrIiCb/Lk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [80.208.209.197] ([80.208.209.197]) by web-mail.gmx.net
 (3c-app-gmx-bap13.server.lan [172.19.172.83]) (via HTTP); Wed, 5 Aug 2020
 10:49:56 +0200
MIME-Version: 1.0
Message-ID: <trinity-35b75199-be7e-4e56-bfc9-1d8bf7075df1-1596617396324@3c-app-gmx-bap13>
From: Frank Wunderlich <frank-w@public-files.de>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Aw: Re:  Re:  Re: [PATCH v4 6/6] arm: dts: mt7623: add display
 subsystem related device nodes
Date: Wed, 5 Aug 2020 10:49:56 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <bde8de134f59c4375e4048faf124c61af0b95920.camel@infradead.org>
References: <20200804165555.75159-1-linux@fw-web.de>
 <20200804165555.75159-8-linux@fw-web.de>
 <3966b4f687f2fabf9041059dd5f39165177a6ef6.camel@infradead.org>
 <trinity-5335a61e-b8f0-4441-9fe9-0827cdd67ce4-1596562816887@3c-app-gmx-bap28>
 <45d34c6cc19c2e5c13f9e88a8e04bdae9259ffdc.camel@infradead.org>
 <trinity-16cee263-ff59-4595-adc1-738071745162-1596612461427@3c-app-gmx-bap13>
 <bde8de134f59c4375e4048faf124c61af0b95920.camel@infradead.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:02+hrQwIbNKgot54dm3HJDNKjTwKbsyfpioUZ2s9RwWRJQMTA7VOZRh/pL3a9UGoFVTCN
 ERILIMlNaDjkc2TrLP6Gpib+y9jm1gT93Gao0qy6TOyS7ZY5Pcmiwa/hFmqqBw0sETOOim7kdheu
 QrkKaZxd7kwCxWiPRVRs9Pmzo8H/6Yf7oVgLuRlm1LNtnp20Z0bybSKu/XlUT6O3aPAOSAKdTtL+
 Z5whKcy09j+dZ6HoVVNVfUZGSTZ1QRskLbtCPoKU8es+a/aXSpcl6T8dUGYxw6dTA/aBrl0rZfzX
 vE=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:sGV1u3BLYEs=:ZmeFvu+MGFu42w9/0EZtNz
 y3ygbRJ/gxvzAKmPS0TDo3EqFrrvRTbvlEgmMQphdULdqverfTtQWhDOvuYX4H9XeTbDYHICh
 1u4nPRhU8LkBfK3OQmKDaFH52AsaQoUPcpNmMFqfXgT2zismRqV4YY/DzhRedSMjbW/LXFX5O
 9f7pJWQR/dzVelZFUa6ktefaFla1rztZfdhFaUoCMkM/6daiFmBOTW6BxP/PfcS581BqmFRvx
 kBqCAOKJN3+cXCFP/xnHMSZfPHlzY1hmvATTKLz+Y6VCSnJ6vCcbjujVUjEkqCOECZCpHjjBK
 3MxKUsIb53GKhcCQWbS+t+6c3lhZCuevgl0ISDshpHINWCIIdvqpAT1qPqihdu1YoVeSAp4jw
 qpdG3elw3uN2wUkYCF+804pajrgO7t0IJ2JaUJHEQ3tV8xrUkA4ENN5dv+PNeOdwh9n0Mvbxw
 HwPEJ0/j3unee2GpYuPG46ZIuA4LU/8RQKdQFDvxzD6Z4WJkDHwiEWinthNXCbpy1tivg3VnK
 5tc8jHH4eOvtsmFzG/AOh4Yib9Ts2ifF3dEcLYDT1k8/baNDPqKIs4fB/HH5zU+LVNg4mcTNr
 /ZZMS/yynDp3VUr5tkPcQ3aiIHtJO7vWqHYKlM9Z65CMilYkQFILL6kJHjWVbrET0GuGryUdz
 MLqM6V6DDQqqyb4nxNRY5/s21N7uiwhZIw6BDbNtXsFaj0hWdzTMhVOzfin8up3/DNLI=
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

> Gesendet: Mittwoch, 05. August 2020 um 10:36 Uhr
> Von: "David Woodhouse" <dwmw2@infradead.org>

> > mt7623.dtsi => mt7623n.dtsi => mt7623n-bananapi-bpi-r2.dts
> > mt7623.dtsi => mt7623a.dtsi => mt7623a-unielec-u7623.dts (not existing yet,
> > openwrt seems to use a board-specific dtsi)
>
> Yes, I think we should.

i want to see what MTK/DT owner says to this...
my current way will be still adding the nodes to existing mt7623.dtsi (like ryder lee did it in original patch)
but disabling them to not break mt7623a and splitting it afterwards.

> I'll create mt7623a.dtsi and upstream the U7623 support; I think that
> can happen without conflicting with anything you do.
>
> I note that the GPU node has been added to mt7623.dtsi in 5.8 too;
> that'll want to move to the new mt7623n.dtsi that you create, along
> with your other new additions.

i guess mali-node also needs to be moved to mt7623n.dtsi, so my current way seems right...
but it's decision of MTK/DT owner. if they make a note i squash the disabling-commit into this and post v5

regards Frank
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
