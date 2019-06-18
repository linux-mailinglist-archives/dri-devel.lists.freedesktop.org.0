Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 246CC4B2DC
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 09:12:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 568CF6E30B;
	Wed, 19 Jun 2019 07:11:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs35.siol.net [185.57.226.226])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E7F6E20B
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 17:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTP id 1EA4E5203EB;
 Tue, 18 Jun 2019 19:23:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta12.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta12.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id SvDg82OCXHri; Tue, 18 Jun 2019 19:23:21 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTPS id A4E9F5223EF;
 Tue, 18 Jun 2019 19:23:21 +0200 (CEST)
Received: from jernej-laptop.localnet (cpe-86-58-52-202.static.triera.net
 [86.58.52.202]) (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Zimbra) with ESMTPA id 76FF65203EB;
 Tue, 18 Jun 2019 19:23:18 +0200 (CEST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH] drm/bridge/synopsys: dw-hdmi: Handle audio for more clock
 rates
Date: Tue, 18 Jun 2019 19:23:18 +0200
Message-ID: <6219398.I55JWXAmVF@jernej-laptop>
In-Reply-To: <20190617235558.64571-1-dianders@chromium.org>
References: <20190617235558.64571-1-dianders@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Jun 2019 07:10:14 +0000
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
Cc: linux-rockchip@lists.infradead.org, David Airlie <airlied@linux.ie>,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 narmstrong@baylibre.com, seanpaul@chromium.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, dgreid@chromium.org,
 Zheng Yang <zhengyang@rock-chips.com>, Sam Ravnborg <sam@ravnborg.org>,
 Thomas Gleixner <tglx@linutronix.de>, cychiang@chromium.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkhCgpEbmUgdG9yZWssIDE4LiBqdW5paiAyMDE5IG9iIDAxOjU1OjU4IENFU1QgamUgRG91Z2xh
cyBBbmRlcnNvbiBuYXBpc2FsKGEpOgo+IExldCdzIGFkZCBzb21lIGJldHRlciBzdXBwb3J0IGZv
ciBIRE1JIGF1ZGlvIHRvIGR3X2hkbWkuCj4gU3BlY2lmaWNhbGx5Ogo+IAo+IDEuIEZvciA0NC4x
IGtIeiBhdWRpbyB0aGUgb2xkIGNvZGUgbWFkZSB0aGUgYXNzdW1wdGlvbiB0aGF0IGFuIE4gb2YK
PiA2MjcyIHdhcyByaWdodCBtb3N0IG9mIHRoZSB0aW1lLiAgVGhhdCB3YXNuJ3QgdHJ1ZSBhbmQg
dGhlIG5ldyB0YWJsZQo+IHNob3VsZCBnaXZlIGJldHRlciA0NC4xIGtIeiBhdWRpbyBmb3IgbWFu
eSBtb3JlIHJhdGVzLgo+IAo+IDIuIFRoZSBuZXcgdGFibGUgaGFzIHZhbHVlcyBmcm9tIHRoZSBI
RE1JIHNwZWMgZm9yIDI5NyBNSHogYW5kIDU5NAo+IE1Iei4KPiAKPiAzLiBUaGVyZSBpcyBub3cg
Y29kZSB0byB0cnkgdG8gY29tZSB1cCB3aXRoIGEgbW9yZSBpZGVhIE4vQ1RTIGZvcgo+IGNsb2Nr
IHJhdGVzIHRoYXQgYXJlbid0IGluIHRoZSB0YWJsZS4gIFRoaXMgY29kZSBpcyBhIGJpdCBzbG93
IGJlY2F1c2UKPiBpdCBpdGVyYXRlcyBvdmVyIGV2ZXJ5IHBvc3NpYmxlIHZhbHVlIG9mIE4gYW5k
IHBpY2tzIHRoZSBiZXN0IG9uZSwgYnV0Cj4gaXQgc2hvdWxkIG1ha2UgYSBnb29kIGZhbGxiYWNr
Lgo+IAo+IDQuIFRoZSBuZXcgY29kZSBhbGxvd3MgZm9yIHBsYXRmb3JtcyB0aGF0IGtub3cgdGhl
eSBtYWtlIGEgY2xvY2sgcmF0ZQo+IHNsaWdodGx5IGRpZmZlcmVudGx5IHRvIHBpY2sgZGlmZmVy
ZW50IE4vQ1RTIHZhbHVlcy4gIEZvciBpbnN0YW5jZSBvbgo+IHJrMzI4OCB3ZSBjYW4gbWFrZSAy
NSwxNzYsNDcxIEh6IGluc3RlYWQgb2YgMjUsMTc0LDgyNS4xNzQ4Li4uIEh6Cj4gKDI1LjIgTUh6
IC8gMS4wMDEpLiAgQSBmdXR1cmUgcGF0Y2ggdG8gdGhlIHJrMzI4OCBwbGF0Zm9ybSBjb2RlIGNv
dWxkCj4gZW5hYmxlIHN1cHBvcnQgZm9yIHRoaXMgY2xvY2sgcmF0ZSBhbmQgc3BlY2lmeSB0aGUg
Ti9DVFMgdGhhdCB3b3VsZCBiZQo+IGlkZWFsLgo+IAo+IE5PVEU6IHRoZSBvZGRlc3QgcGFydCBv
ZiB0aGlzIHBhdGNoIGNvbWVzIGFib3V0IGJlY2F1c2UgY29tcHV0aW5nIHRoZQo+IGlkZWFsIE4v
Q1RTIG1lYW5zIGtub3dpbmcgdGhlIF9leGFjdF8gY2xvY2sgcmF0ZSwgbm90IGEgcm91bmRlZAo+
IHZlcnNpb24gb2YgaXQuICBUaGUgZHJtIGZyYW1ld29yayBtYWtlcyB0aGlzIGhhcmRlciBieSBy
b3VuZGluZyByYXRlcwo+IHRvIGtIeiwgYnV0IGV2ZW4gaWYgaXQgZGlkbid0IHRoZXJlIG1pZ2h0
IGJlIGNhc2VzIHdoZXJlIHRoZSBpZGVhbAo+IHJhdGUgY291bGQgb25seSBiZSBjYWxjdWxhdGVk
IGlmIHdlIGtuZXcgdGhlIHJlYWwgKG5vbi1pbnRlZ3JhbCkgcmF0ZS4KPiBUaGlzIG1lYW5zIHRo
YXQgaW4gY2FzZXMgd2hlcmUgd2Uga25vdyAob3IgYmVsaWV2ZSkgdGhhdCB0aGUgdHJ1ZSByYXRl
Cj4gaXMgc29tZXRoaW5nIG90aGVyIHRoYW4gdGhlIHJhdGUgd2UgYXJlIHRvbGQgYnkgZHJtLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IERvdWdsYXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9y
Zz4KCldoaWNoIGJ1cyBpcyB1c2VkIGZvciBhdWRpbyB0cmFuc2ZlciBvbiB5b3VyIGRldmljZT8g
SWYgaXQgaXMgSTJTLCB3aGljaCBpcyAKY29tbW9ubHkgdXNlZCwgdGhlbiBwbGVhc2UgYmUgYXdh
cmUgb2YgdGhpcyBwYXRjaDoKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMv
ZHJpLWRldmVsLzIwMTktSnVuZS8yMjE1MzkuaHRtbAoKSXQgYXZvaWRzIGV4YWN0IE4vQ1RTIGNh
bGN1bGF0aW9uIGJ5IGVuYWJsaW5nIGF1dG8gZGV0ZWN0aW9uLiBJdCBpcyB3ZWxsIAp0ZXN0ZWQg
b24gbXVsdGlwbGUgU29DcyBmcm9tIEFsbHdpbm5lciwgQW1sb2dpYyBhbmQgUm9ja2NoaXAuCgpC
ZXN0IHJlZ2FyZHMsCkplcm5lagoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
