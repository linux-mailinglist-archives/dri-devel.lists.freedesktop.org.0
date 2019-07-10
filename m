Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E71364491
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 11:44:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA9989B00;
	Wed, 10 Jul 2019 09:44:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B8A89B00
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 09:44:43 +0000 (UTC)
Received: from shell.armlinux.org.uk
 ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:59340)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1hl98c-0005tt-RN; Wed, 10 Jul 2019 10:43:47 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.89)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1hl98T-0003nw-5z; Wed, 10 Jul 2019 10:43:37 +0100
Date: Wed, 10 Jul 2019 10:43:37 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Johannes Berg <johannes@sipsolutions.net>
Subject: Re: [PATCH 00/12] treewide: Fix GENMASK misuses
Message-ID: <20190710094337.wf2lftxzfjq2etro@shell.armlinux.org.uk>
References: <cover.1562734889.git.joe@perches.com>
 <5fa1fa6998332642c49e2d5209193ffe2713f333.camel@sipsolutions.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5fa1fa6998332642c49e2d5209193ffe2713f333.camel@sipsolutions.net>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j/WSDXca8rXK9NsDZMmI4ZGVD5lmMYmQNn9cX+c1P0c=; b=SuuW/7NN1z53N126yQd0mfU0n
 ntWsBeL22jFfrqe6UV7yYYjaWAb/mGvo82v/VpffWPeHAXC8qvHdMVqjvTeqQYorTqKjPyjcVkd0Y
 ehhidoReYAcrBOGYvK5hg+mxgyuD5Njr2SLIjID07Kvs0w8adz+Czb2UlD+NlXUjcnJQShORaFQ6X
 Xl3J1vYZGJzoNp6wHmHn8OimwqiNyO9IG6bSDFpjxItLMpKnIWdEU05QuowI2tkahamV/uty376Ez
 mf5JMQomwfeTQc+3SQ9pZj0NiYOkjfuIR3hSKUK/aQunmlQ7Q5KSFX7XpTfFzFgMc9EjJ+4N1wSfg
 nEpyIjNkA==;
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
 netdev@vger.kernel.org, Joe Perches <joe@perches.com>,
 linux-amlogic@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMTAsIDIwMTkgYXQgMTE6MTc6MzFBTSArMDIwMCwgSm9oYW5uZXMgQmVyZyB3
cm90ZToKPiBPbiBUdWUsIDIwMTktMDctMDkgYXQgMjI6MDQgLTA3MDAsIEpvZSBQZXJjaGVzIHdy
b3RlOgo+ID4gVGhlc2UgR0VOTUFTSyB1c2VzIGFyZSBpbnZlcnRlZCBhcmd1bWVudCBvcmRlciBh
bmQgdGhlCj4gPiBhY3R1YWwgbWFza3MgcHJvZHVjZWQgYXJlIGluY29ycmVjdC4gIEZpeCB0aGVt
Lgo+ID4gCj4gPiBBZGQgY2hlY2twYXRjaCB0ZXN0cyB0byBoZWxwIGF2b2lkIG1vcmUgbWlzdXNl
cyB0b28uCj4gPiAKPiA+IEpvZSBQZXJjaGVzICgxMik6Cj4gPiAgIGNoZWNrcGF0Y2g6IEFkZCBH
RU5NQVNLIHRlc3RzCj4gCj4gSU1ITyB0aGlzIGRvZXNuJ3QgbWFrZSBhIGxvdCBvZiBzZW5zZSBh
cyBhIGNoZWNrcGF0Y2ggdGVzdCAtIGp1c3QgdGhyb3cKPiBpbiBhIEJVSUxEX0JVR19PTigpPwoK
TXkgcGVyc29uYWwgdGFrZSBvbiB0aGlzIGlzIHRoYXQgR0VOTUFTSygpIGlzIHJlYWxseSBub3Qg
dXNlZnVsLCBpdCdzCmp1c3QgcHVyZSBvYmZ1c2NhdGlvbiBhbmQgbGVhZHMgdG8gZXhhY3RseSB0
aGVzZSBraW5kcyBvZiBtaXN0YWtlcy4KClllcywgSSBmdWxseSB1bmRlcnN0YW5kIHRoZSBhcmd1
bWVudCB0aGF0IHlvdSBjYW4ganVzdCBzcGVjaWZ5IHRoZQpzdGFydCBhbmQgZW5kIGJpdHMsIGFu
ZCBpdCBfaW4gdGhlb3J5XyBtYWtlcyB0aGUgY29kZSBtb3JlIHJlYWRhYmxlLgoKSG93ZXZlciwg
dGhlIHByb2JsZW0gaXMgd2hlbiB3cml0aW5nIGNvZGUuICBHRU5NQVNLKGEsIGIpLiAgSXMgYSB0
aGUKc3RhcnRpbmcgYml0IG9yIGVuZGluZyBiaXQ/ICBJcyBiIHRoZSBudW1iZXIgb2YgYml0cz8g
IEl0J3MgY29uZnVzaW5nCmFuZCBjYXVzZXMgbWlzdGFrZXMgcmVzdWx0aW5nIGluIGluY29ycmVj
dCBjb2RlLiAgQSBCVUlMRF9CVUdfT04oKQpjYW4gY2F0Y2ggc29tZSBvZiB0aGUgY2FzZXMsIGJ1
dCBub3QgYWxsIG9mIHRoZW0uCgpGb3IgZXhhbXBsZToKCglHRU5NQVNLKDYsIDIpCgp3b3VsZCBz
YXRpc2lmeSB0aGUgcmVxdWlyZW1lbnQgdGhhdCBhID4gYiwgc28gYSBCVUlMRF9CVUdfT04oKSB3
aWxsCm5vdCB0cmlnZ2VyLCBidXQgd2FzIHRoZSBhdXRob3IgbWVhbmluZyAweDNjIG9yIDB4YzA/
CgpQZXJzb25hbGx5LCBJJ3ZlIGRlY2lkZWQgSSBhbSBfbm90XyBnb2luZyB0byB1c2UgR0VOTUFT
SygpIGluIG15IGNvZGUKYmVjYXVzZSBJIHN0cnVnZ2xlIHRvIGdldCB0aGUgbWFjcm8gYXJndW1l
bnRzIGNvcnJlY3QgLSBJJ20gX211Y2hfCmhhcHBpZXIsIGFuZCBpdCBpcyB3YXkgbW9yZSByZWxp
YWJsZSBmb3IgbWUgdG8gd3JpdGUgdGhlIG1hc2sgaW4gaGV4Cm5vdGF0aW9uLgoKSSB0aGluayB0
aGlzIGlzIHdoZXJlIHVzZSBvZiBhIHRlcm5hcnkgb3BlcmF0b3Igd291bGQgY29tZSBpbiB1c2Uu
ICBUaGUKbm9ybWFsIHdheSBvZiB3cml0aW5nIGEgbnVtYmVyIG9mIGJpdHMgdGVuZHMgdG8gYmUg
ImE6YiIsIHNvIGlmIEdFTk1BU0sKdG9vayBzb21ldGhpbmcgbGlrZSBHRU5NQVNLKDY6MiksIHRo
ZW4gSSdkIGhhdmUgbGVzcyBpc3N1ZSB3aXRoIGl0LApiZWNhdXNlIGl0J3MgYXJndW1lbnQgaXMg
dGhlbiBpbiBhIGZhbWlsaWFyIG5vdGF0aW9uLgoKWWVzLCBJJ20gc3VyZSB0aGF0IHNvbWVvbmUg
d2lsbCBwb2ludCBvdXQgdGhhdCB0aGUgR0VOTUFTSyBhcmd1bWVudHMKYXJlIGp1c3QgaW4gdGhl
IHNhbWUgb3JkZXIsIGJ1dCB0aGF0IGRvZXNuJ3QgcHJldmVudCBfbWVfIGZyZXF1ZW50bHkKZ2V0
dGluZyBpdCB3cm9uZyAtIGFuZCB0aGF0J3MgdGhlIHBvaW50LiAgVGhlIG1hY3JvIHNlZW1zIHRv
IG1lIHRvCmNhdXNlIG1vcmUgcHJvYmxlbXMgdGhhbiBpdCBzb2x2ZXMuCgotLSAKUk1LJ3MgUGF0
Y2ggc3lzdGVtOiBodHRwczovL3d3dy5hcm1saW51eC5vcmcudWsvZGV2ZWxvcGVyL3BhdGNoZXMv
CkZUVEMgYnJvYWRiYW5kIGZvciAwLjhtaWxlIGxpbmUgaW4gc3VidXJiaWE6IHN5bmMgYXQgMTIu
MU1icHMgZG93biA2MjJrYnBzIHVwCkFjY29yZGluZyB0byBzcGVlZHRlc3QubmV0OiAxMS45TWJw
cyBkb3duIDUwMGticHMgdXAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
