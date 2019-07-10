Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEDD64A57
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 18:01:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE4606E112;
	Wed, 10 Jul 2019 16:01:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0115.hostedemail.com
 [216.40.44.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC4B56E112
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 16:01:32 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id A05E28368EF4;
 Wed, 10 Jul 2019 16:01:31 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 
X-HE-Tag: balls52_46dfd74d6cd5c
X-Filterd-Recvd-Size: 2713
Received: from XPS-9350.home (cpe-23-242-196-136.socal.res.rr.com
 [23.242.196.136]) (Authenticated sender: joe@perches.com)
 by omf18.hostedemail.com (Postfix) with ESMTPA;
 Wed, 10 Jul 2019 16:01:26 +0000 (UTC)
Message-ID: <c94a0a50c41c7530354b4a662ee945212424c8c7.camel@perches.com>
Subject: Re: [PATCH 00/12] treewide: Fix GENMASK misuses
From: Joe Perches <joe@perches.com>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>, Johannes Berg
 <johannes@sipsolutions.net>
Date: Wed, 10 Jul 2019 09:01:25 -0700
In-Reply-To: <b9c3b83c9be50286062ae8cefd5d38e2baa0fb22.camel@perches.com>
References: <cover.1562734889.git.joe@perches.com>
 <5fa1fa6998332642c49e2d5209193ffe2713f333.camel@sipsolutions.net>
 <20190710094337.wf2lftxzfjq2etro@shell.armlinux.org.uk>
 <b9c3b83c9be50286062ae8cefd5d38e2baa0fb22.camel@perches.com>
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
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
Cc: devel@driverdev.osuosl.org, linux-mmc@vger.kernel.org,
 alsa-devel@alsa-project.org, Benjamin Fair <benjaminfair@google.com>,
 linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, Nancy Yuen <yuenn@google.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 netdev@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDE5LTA3LTEwIGF0IDA4OjQ1IC0wNzAwLCBKb2UgUGVyY2hlcyB3cm90ZToKPiBP
biBXZWQsIDIwMTktMDctMTAgYXQgMTA6NDMgKzAxMDAsIFJ1c3NlbGwgS2luZyAtIEFSTSBMaW51
eCBhZG1pbiB3cm90ZToKPiA+IE9uIFdlZCwgSnVsIDEwLCAyMDE5IGF0IDExOjE3OjMxQU0gKzAy
MDAsIEpvaGFubmVzIEJlcmcgd3JvdGU6Cj4gPiA+IE9uIFR1ZSwgMjAxOS0wNy0wOSBhdCAyMjow
NCAtMDcwMCwgSm9lIFBlcmNoZXMgd3JvdGU6Cj4gPiA+ID4gVGhlc2UgR0VOTUFTSyB1c2VzIGFy
ZSBpbnZlcnRlZCBhcmd1bWVudCBvcmRlciBhbmQgdGhlCj4gPiA+ID4gYWN0dWFsIG1hc2tzIHBy
b2R1Y2VkIGFyZSBpbmNvcnJlY3QuICBGaXggdGhlbS4KPiA+ID4gPiAKPiA+ID4gPiBBZGQgY2hl
Y2twYXRjaCB0ZXN0cyB0byBoZWxwIGF2b2lkIG1vcmUgbWlzdXNlcyB0b28uCj4gPiA+ID4gCj4g
PiA+ID4gSm9lIFBlcmNoZXMgKDEyKToKPiA+ID4gPiAgIGNoZWNrcGF0Y2g6IEFkZCBHRU5NQVNL
IHRlc3RzCj4gPiA+IAo+ID4gPiBJTUhPIHRoaXMgZG9lc24ndCBtYWtlIGEgbG90IG9mIHNlbnNl
IGFzIGEgY2hlY2twYXRjaCB0ZXN0IC0ganVzdCB0aHJvdwo+ID4gPiBpbiBhIEJVSUxEX0JVR19P
TigpPwo+IAo+IEkgdHJpZWQgdGhhdC4KPiAKPiBJdCdkIGNhbid0IGJlIGRvbmUgYXMgaXQncyB1
c2VkIGluIGRlY2xhcmF0aW9ucwo+IGFuZCBpbmNsdWRlZCBpbiBhc20gZmlsZXMgYW5kIGl0IHVz
ZXMgdGhlIFVMKCkKPiBtYWNyby4KPiAKPiBJIGFsc28gdHJpZWQganVzdCBtYWtpbmcgaXQgZG8g
dGhlIHJpZ2h0IHRoaW5nCj4gd2hhdGV2ZXIgdGhlIGFyZ3VtZW50IG9yZGVyLgoKSSBmb3Jnb3Qu
CgpJIGFsc28gbWFkZSBhbGwgdGhvc2UgYXJndW1lbnRzIHdoZW4gaXQgd2FzCmludHJvZHVjZWQg
aW4gMjAxMy4KCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3BhdGNod29yay9wYXRjaC80MTQyNDgv
Cgo+IE9oIHdlbGwuCgp5ZWFoLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
