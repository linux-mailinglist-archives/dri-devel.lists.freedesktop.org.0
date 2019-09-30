Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02437C2DD8
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 09:13:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CCC66E514;
	Tue,  1 Oct 2019 07:13:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB0EF6E06B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 15:59:39 +0000 (UTC)
Date: Mon, 30 Sep 2019 17:59:37 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: sun8i-ui/vi: Fix layer zpos change/atomic modesetting
Message-ID: <20190930155937.rtvoxprayrkxodxo@core.my.home>
Mail-Followup-To: Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20190914220337.646719-1-megous@megous.com>
 <20190918141734.kerdbbaynwutrxf6@gilmour>
 <20190918152309.j2dbu63jaru6jn2t@core.my.home>
 <20190918201617.5gwzmshoxbcxbmrx@gilmour>
 <20190919122058.fhpuafogdq7oir2d@core.my.home>
 <20190919131244.35hmnp7jizegltp7@core.my.home>
 <20190920151142.ijistzhtcaenehx6@gilmour>
 <20190924124054.743s3tlw5qirghxo@core.my.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190924124054.743s3tlw5qirghxo@core.my.home>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
X-Mailman-Approved-At: Tue, 01 Oct 2019 07:13:05 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=megous.com; s=mail; 
 t=1569859177; bh=D2ejaUWp29uDGi/bAvIoPZtXvcgt2U13kUVwsfjN680=;
 h=Date:From:To:Subject:References:X-My-GPG-KeyId:From;
 b=bAy5AL9wyR8lQZ/ooSinafOoLY4OVl0wumhpX+V/u5L/fnoADyJ66LTqYnzt8F6uB
 vuhZu6xxYFeSRRDMUbG9iJKqZfp1uyDTvPWh+PDrHysZujX5/uIsBhfrcle2A/IukU
 9UgPwq3/qVl2BpEByIhmFriFzhbz8suwyIsUNrqw=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBUdWUsIFNlcCAyNCwgMjAxOSBhdCAwMjo0MDo1NFBNICswMjAwLCBtZWdvdXMgaGxh
dm5pIHdyb3RlOgo+ID4gPiAgT24gZmlyc3QgcnVuIG9mIHRoZSBYIHNlcnZlciwgb25seSB0aGUg
YmxhY2sgc2NyZWVuIGFuZCB0aGUgbGF5ZXIKPiA+ID4gIGNvbnRhaW5pbmcgdGhlIGN1cnNvciBp
cyB2aXNpYmxlLiBTd2l0Y2hpbmcgdG8gY29uc29sZSBhbmQgYmFjawo+ID4gPiAgY29ycmVjdHMg
dGhlIHNpdHVhdGlvbi4KPiA+ID4KPiA+ID4gIEkgaGF2ZSBkdW1wZWQgcmVnaXN0ZXJzLCBhbmQg
Zm91bmQgb3V0IHRoaXM6Cj4gPiA+Cj4gPiA+ICAoSW4gYm90aCBjYXNlcyB0aGVyZSBhcmUgdHdv
IGVuYWJsZWQgcGxhbmVzLCBwbGFuZSAxIHdpdGggenBvcyAwIGFuZAo+ID4gPiAgcGxhbmUgMyB3
aXRoIHpwb3MgMSkuCj4gPiA+Cj4gPiA+ICAxKSBGaXJzdCBYb3JnIHJ1bjoKPiA+ID4KPiA+ID4g
ICAgMHgwMTEwMTAwMCA6IDAwMDAwMjAxCj4gPiA+ICAgIDB4MDExMDEwODAgOiAwMDAwMDAzMAo+
ID4gPgo+ID4gPiAgICBCTERfRklMTF9DT0xPUl9DVEw6IChha2EgU1VOOElfTUlYRVJfQkxFTkRf
UElQRV9DVEwpCj4gPiA+ICAgICAgUDFfRU4KPiA+ID4KPiA+ID4gICAgQkxEX0NIX1JUQ1RMOiAo
YWthIFNVTjhJX01JWEVSX0JMRU5EX1JPVVRFKQo+ID4gPiAgICAgIFAwX1JUQ1RMIGNoYW5uZWww
Cj4gPiA+ICAgICAgUDFfUlRDVEwgY2hhbm5lbDMKPiA+ID4KPiA+ID4gIDIpIEFmdGVyIHN3aXRj
aCB0byBjb25zb2xlIGFuZCBiYWNrIHRvIFhvcmc6Cj4gPiA+Cj4gPiA+ICAweDAxMTAxMDAwIDog
MDAwMDAzMDEKPiA+ID4gIDB4MDExMDEwODAgOiAwMDAwMDAzMQo+ID4gPgo+ID4gPiAgICBCTERf
RklMTF9DT0xPUl9DVEw6Cj4gPiA+ICAgICAgUDFfRU4gYW5kIFAwX0VOCj4gPiA+Cj4gPiA+ICAg
IEJMRF9DSF9SVENUTDoKPiA+ID4gICAgICBQMF9SVENUTCBjaGFubmVsMQo+ID4gPiAgICAgIFAx
X1JUQ1RMIGNoYW5uZWwzCj4gPiA+Cj4gPiA+ICBXaGF0IGhhcHBlbnMgaXMgdGhhdCBzdW44aV91
aV9sYXllcl9lbmFibGUoKSBmdW5jdGlvbiBtYXkgZGlzYWJsZQo+ID4gPiAgYmxlbmRpbmcgcGlw
ZXMgZXZlbiBpZiBpdCBpcyBubyBsb25nZXIgYXNzaWduZWQgdG8gaXRzIGxheWVyLCBiZWNhdXNl
Cj4gPiA+ICBvZiBpbmNvcnJlY3Qgc3RhdGUvenBvcyB0cmFja2luZyBpbiB0aGUgZHJpdmVyLgo+
ID4gPgo+ID4gPiAgSW4gcGFydGljdWxhciwgbGF5ZXIgMSBpcyBjb25maWd1cmVkIHRvIHpwb3Mg
MCBhbmQgdGh1cyB1c2VzIHBpcGUgMC4KPiA+ID4gIFdoZW4gbGF5ZXIgMyBpcyBlbmFibGVkIGJ5
IFggc2VydmVyLCBzdW44aV91aV9sYXllcl9lbmFibGUoKSB3aWxsIGdldAo+ID4gPiAgY2FsbGVk
IHdpdGggb2xkX3pwb3M9MCB6cG9zPTEsIHdoaWNoIHdpbGwgbGVhZCB0byBkaXNhYmxpbmcgb2Yg
cGlwZSAwLgo+ID4gPgo+ID4gPiAgSW4gZ2VuZXJhbCB0aGlzIGlzc3VlIGNhbiBoYXBwZW4gdG8g
YW55IGxheWVyIGR1cmluZyBlbmFibGUgb3IgenBvcwo+ID4gPiAgY2hhbmdlcyBvbiBtdWx0aXBs
ZSBsYXllcnMgYXQgb25jZS4KPiA+ID4KPiA+ID4gIFRvIGNvcnJlY3QgdGhpcyB3ZSBub3cgcGFz
cyBwcmV2aW91cyBlbmFibGVkL2Rpc2FibGVkIHN0YXRlIG9mIHRoZQo+ID4gPiAgbGF5ZXIsIGFu
ZCBwYXNzIHJlYWwgcHJldmlvdXMgenBvcyBvZiB0aGUgbGF5ZXIgdG8KPiA+ID4gIHN1bjhpX3Vp
X2xheWVyX2VuYWJsZSgpIGFuZCByZXdvcmsgdGhlIHN1bjhpX3VpX2xheWVyX2VuYWJsZSgpIGZ1
bmN0aW9uCj4gPiA+ICB0byByZWFjdCB0byB0aGUgc3RhdGUgY2hhbmdlcyBjb3JyZWN0bHkuIElu
IG9yZGVyIHRvIG5vdCBjb21wbGljYXRlCj4gPiA+ICB0aGUgYXRvbWljX2Rpc2FibGUgY2FsbGJh
Y2sgd2l0aCBhbGwgb2YgdGhlIGFib3ZlIGNoYW5nZXMsIHdlIHNpbXBseQo+ID4gPiAgcmVtb3Zl
IGl0IGFuZCBpbXBsZW1lbnQgYWxsIHRoZSBjaGFuZXMgYXMgcGFydCBvZiBhdG9taWNfdXBkYXRl
LCB3aGljaAo+ID4gPiAgYWxzbyByZWR1Y2VzIHRoZSBjb2RlIGR1cGxpY2F0aW9uLgo+ID4gCj4g
PiBJJ20gbm90IGV2ZW4gc3VyZSB3aHkgd2UgbmVlZCB0aGF0IG9sZCBzdGF0ZS4gQ2FuJ3Qgd2Ug
anVzdCByZXNldAo+ID4gY29tcGxldGVseSB0aGUgd2hvbGUgdGhpbmcgYW5kIGRvIHRoZSBjb25m
aWd1cmF0aW9uIGFsbCBvdmVyIGFnYWluPwo+IAo+IFRoYXQgd291bGQgYmUgbmljZSBmcm9tIGEg
ZGV2IHN0YW5kcG9pbnQgaWYgd2UgY2FuIGdldCBhIGNvbXBsZXRlIHN0YXRlIGZvciBhbGwKPiBw
bGFuZXMgYXQgb25jZSBmcm9tIERSTSBjb3JlLCBidXQgaG93PyBEUk0gaGVscGVyIGdpdmVzIGNh
bGxiYWNrcwo+IGZvciB1cGRhdGluZyBpbmRpdmlkdWFsIHBsYW5lcyB3aXRoIHByZXYgYW5kIG5l
dyBzdGF0ZS4gVGhlc2UgaW5kaXZpZHVhbCBsYXllcgo+IGNoYW5nZSBub3RpZmljYXRpb25zIGRv
bid0IG1hcCBuaWNlbHkgdG8gaG93IHBpcGVzIGFyZSByZXByZXNlbnRlZCBpbiB0aGUgbWl4ZXIK
PiByZWdpc3RlcnMuCgpJZiBhbnlvbmUgd2FudHMgdG8gcHVyc3VlIHRoaXMgZnVydGhlciwgZmVl
bCBmcmVlIHRvLiBJJ20gbm90IHBsYW5uaW5nIHRvCnB1cnN1ZSB0aGlzIGZpeCBmdXJ0aGVyLCBh
dCB0aGUgbW9tZW50LgoKcmVnYXJkcywKCW8uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
