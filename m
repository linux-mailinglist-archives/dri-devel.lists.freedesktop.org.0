Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5F226154
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 12:04:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95B68898B7;
	Wed, 22 May 2019 10:04:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38AAA898C6
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 10:04:31 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.89)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hTO6m-0002xL-8W; Wed, 22 May 2019 12:04:28 +0200
Message-ID: <1558519467.2624.38.camel@pengutronix.de>
Subject: Re: [PATCH] drm: etnaviv: avoid DMA API warning when importing buffers
From: Lucas Stach <l.stach@pengutronix.de>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>, Fabio Estevam
 <festevam@gmail.com>
Date: Wed, 22 May 2019 12:04:27 +0200
In-Reply-To: <20190518213748.msdvolgiu5ykmaep@shell.armlinux.org.uk>
References: <E1gyDr8-0001cW-8d@rmk-PC.armlinux.org.uk>
 <20190225105423.jouccln33vj5xtyb@shell.armlinux.org.uk>
 <20190518175133.tpj255jzi7idhwxq@shell.armlinux.org.uk>
 <CAOMZO5C_nAMQM=ODU+_v3XMhcEDg_U+wY8c0-yR-cq_BWN_tVw@mail.gmail.com>
 <20190518213748.msdvolgiu5ykmaep@shell.armlinux.org.uk>
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: David Airlie <airlied@linux.ie>, Christoph Hellwig <hch@lst.de>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUnVzc2VsbCwKCkFtIFNhbXN0YWcsIGRlbiAxOC4wNS4yMDE5LCAyMjozNyArMDEwMCBzY2hy
aWViIFJ1c3NlbGwgS2luZyAtIEFSTQpMaW51eCBhZG1pbjoKPiBPbiBTYXQsIE1heSAxOCwgMjAx
OSBhdCAwNjowNDo0MlBNIC0wMzAwLCBGYWJpbyBFc3RldmFtIHdyb3RlOgo+ID4gSGkgUnVzc2Vs
bCwKPiA+IAo+ID4gT24gU2F0LCBNYXkgMTgsIDIwMTkgYXQgMjo1MSBQTSBSdXNzZWxsIEtpbmcg
LSBBUk0gTGludXggYWRtaW4KPiA+IDxsaW51eEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+ID4g
PiAKPiA+ID4gUGluZy4KPiA+IAo+ID4gVGhpcyBwYXRjaCBpcyBwcmVzZW50IGluIEx1Y2FzJyBw
dWxsIHJlcXVlc3Q6Cj4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9l
dG5hdml2LzIwMTktTWF5LzAwMjQ5MC5odG1sCj4gCj4gSSdtIHdvbmRlcmluZyB3aHkgaXQgZGlk
bid0IG1ha2UgNS4xIHNpbmNlIGl0J3MgYSByZWdyZXNzaW9uLgoKSSBkaWRuJ3Qgc2VlIHRoZSBp
bXBvcnRhbmNlIHRvIHB1dCB0aGlzIGludG8gZml4ZXMsIGFzIGl0J3MgZ2V0dGluZyByaWQKb2Yg
YSB3YXJuaW5nIHdoaWNoIHdpbGwgb25seSBiZSBwcmVzZW50IHdoZW4gYSBkZWJ1ZyBvcHRpb24g
aXMgZW5hYmxlZC4KU28gaXQgc2hvdWxkIGJlIGludmlzaWJsZSB0byBtb3N0IHVzZXJzIGFuZCBp
dCBkb2Vzbid0IHJlZ3Jlc3MKZnVuY3Rpb25hbGl0eS4KClJlZ2FyZHMsCkx1Y2FzCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
