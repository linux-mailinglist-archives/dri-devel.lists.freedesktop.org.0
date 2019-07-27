Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A74775D5
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jul 2019 04:04:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD2B06EE7D;
	Sat, 27 Jul 2019 02:04:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 931CC6EE7D
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2019 02:04:52 +0000 (UTC)
Received: from pendragon.ideasonboard.com (om126200118163.15.openmobile.ne.jp
 [126.200.118.163])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AD2869B1;
 Sat, 27 Jul 2019 04:04:49 +0200 (CEST)
Date: Sat, 27 Jul 2019 05:04:44 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 3/3] drm/bridge: Add NWL MIPI DSI host controller support
Message-ID: <20190727020444.GC4902@pendragon.ideasonboard.com>
References: <cover.1563983037.git.agx@sigxcpu.org>
 <3158f4f8c97c21f98c394e5631d74bc60d796522.1563983037.git.agx@sigxcpu.org>
 <CAOMZO5BRbV_1du1b9eJqcBvvXSE2Mon3yxSPJxPpZgBqYNjBSg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOMZO5BRbV_1du1b9eJqcBvvXSE2Mon3yxSPJxPpZgBqYNjBSg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1564193090;
 bh=vVlrigtV/4n1LRYGHmQgWdMF36/DcZ6Ryvzw8aTcvZE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UGHkk32aSXSYBC9k0S8TYWWPJ71pvNcd6rc7G1goNemIr54JKb6ChRFqMrEYDjHb8
 Ax+tke8BzXReGpoaoSFuTNo8DxEGkVvLBj7qIvWKmH4ja72XH3ZfC5jBJr3uqTV1Ws
 Gglj4E5HHE/FjKncIgOJFdHhCU6i5Z9wAK7g4w18=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Lee Jones <lee.jones@linaro.org>,
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Robert Chiras <robert.chiras@nxp.com>, Chris Healy <cphealy@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sCgpPbiBGcmksIEp1bCAyNiwgMjAxOSBhdCAwNTowMTo1MlBNIC0wMzAwLCBGYWJpbyBF
c3RldmFtIHdyb3RlOgo+IEhpIEd1aWRvLAo+IAo+IFRoYW5rcyBmb3IgeW91ciB3b3JrIG9uIHRo
aXMgZHJpdmVyIQo+IAo+IE9uIFdlZCwgSnVsIDI0LCAyMDE5IGF0IDEyOjUyIFBNIEd1aWRvIEfD
vG50aGVyIDxhZ3hAc2lneGNwdS5vcmc+IHdyb3RlOgo+IAo+ID4gLS0tIC9kZXYvbnVsbAo+ID4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9pbXgtbndsL0tjb25maWcKPiA+IEBAIC0wLDAg
KzEsMTUgQEAKPiA+ICtjb25maWcgRFJNX0lNWF9OV0xfRFNJCj4gPiArICAgICAgIHRyaXN0YXRl
ICJTdXBwb3J0IGZvciBOb3J0aHdlc3QgTG9naWMgTUlQSSBEU0kgSG9zdCBjb250cm9sbGVyIgo+
ID4gKyAgICAgICBkZXBlbmRzIG9uIERSTSAmJiAoQVJDSF9NWEMgfHwgQVJDSF9NVUxUSVBMQVRG
T1JNIHx8IENPTVBJTEVfVEVTVCkKPiAKPiBUaGlzIElQIGNvdWxkIHBvdGVudGlhbGx5IGJlIGZv
dW5kIG9uIG90aGVyIFNvQ3MsIHNvIG5vIG5lZWQgdG8gbWFrZQo+IGl0IGRlcGVuZCBvbiBBUkNI
X01YQy4KCkknZCBnbyBldmVuIGZ1cnRoZXIgYW5kIG5vdCB1c2UgdGhlIHByZWZpeCBpbXggaW4g
dGhlIGRyaXZlciBuYW1lIG9yCmFueXdoZXJlIGluIHRoZSBjb2RlLgoKW3NuaXBdCgotLSAKUmVn
YXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
