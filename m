Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BBF58792
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 18:48:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C990B6E21C;
	Thu, 27 Jun 2019 16:48:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A15AF6E21D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 16:48:26 +0000 (UTC)
Received: from shell.armlinux.org.uk
 ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:59084)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1hgXZM-0004A0-By; Thu, 27 Jun 2019 17:48:20 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.89)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1hgXZL-0000ks-0I; Thu, 27 Jun 2019 17:48:19 +0100
Date: Thu, 27 Jun 2019 17:48:18 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [REGRESSION] drm/etnaviv: command buffer outside valid memory
 window
Message-ID: <20190627164818.5ybdvgjhxgq32jfe@shell.armlinux.org.uk>
References: <20190622161623.eiameq5dmcysbqor@shell.armlinux.org.uk>
 <1561627215.2587.38.camel@pengutronix.de>
 <20190627100417.dtym5ojrxaik4kg5@shell.armlinux.org.uk>
 <20190627143247.47gksjqbssbcr3bl@shell.armlinux.org.uk>
 <1561646970.2587.48.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1561646970.2587.48.camel@pengutronix.de>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lwEEXgTWLgTpQYI/zHZzcDRrCKZoBnJQ06NZQEnbPbE=; b=iGrQdE8wb97DjlHmA1U6RoOOT
 Sr2AbjoeGQCcQo+hIvQWJBNo/XIp2vFrz89CsZXy4qHfCQk+ffxgtnlaHsTs9RfyCLO/CipZSCZEt
 bu9vr515Tc5RKvfCTDvzRN3D6rzzmDs3/p1BsxHZP9w/nCTsDAI+BW+ZEck1Nezfqk0B7QJaVUQ47
 bkoI0Wy0A6hm7WQ/Lz0P83PXCHldvLqY+Nn5lUdENn3sHT/I4Z7kwuD/6PxY14Jr9b0Xsn6bes4g0
 eootg6FIn/3ixD+SBd2khhvXn92X/88UAGsV0dlGgxJUV71iPTdhw5qyzdgpfahY6dd5VMk1e+G3F
 p8NprHgAw==;
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgMDQ6NDk6MzBQTSArMDIwMCwgTHVjYXMgU3RhY2ggd3Jv
dGU6Cj4gQW0gRG9ubmVyc3RhZywgZGVuIDI3LjA2LjIwMTksIDE1OjMyICswMTAwIHNjaHJpZWIg
UnVzc2VsbCBLaW5nIC0gQVJNIExpbnV4IGFkbWluOgo+ID4gT24gVGh1LCBKdW4gMjcsIDIwMTkg
YXQgMTE6MDQ6MTdBTSArMDEwMCwgUnVzc2VsbCBLaW5nIC0gQVJNIExpbnV4IGFkbWluIHdyb3Rl
Ogo+ID4gPiBPbiBUaHUsIEp1biAyNywgMjAxOSBhdCAxMToyMDoxNUFNICswMjAwLCBMdWNhcyBT
dGFjaCB3cm90ZToKPiA+ID4gPiBBbSBTYW1zdGFnLCBkZW4gMjIuMDYuMjAxOSwgMTc6MTYgKzAx
MDAgc2NocmllYiBSdXNzZWxsIEtpbmcgLSBBUk0gTGludXggYWRtaW46Cj4gPiA+ID4gPiBXaGls
ZSB1cGRhdGluZyBteSB2YXJpb3VzIHN5c3RlbXMgZm9yIHRoZSBUQ1AgU0FDSyBpc3N1ZSwgSSBu
b3RpY2UKPiA+ID4gPiA+IHRoYXQgd2hpbGUgbW9zdCBwbGF0Zm9ybXMgYXJlIGhhcHB5LCB0aGUg
Q3Vib3gtaTQgaXMgbm90LsKgwqBEdXJpbmcKPiA+ID4gPiA+IGJvb3QsIHdlIGdldDoKPiA+ID4g
PiA+IAo+ID4gPiA+ID4gW8KgwqDCoMKgMC4wMDAwMDBdIGNtYTogUmVzZXJ2ZWQgMjU2IE1pQiBh
dCAweDMwMDAwMDAwCj4gPiA+ID4gPiAuLi4KPiA+ID4gPiA+IFvCoMKgwqDCoDAuMDAwMDAwXSBL
ZXJuZWwgY29tbWFuZCBsaW5lOiBjb25zb2xlPXR0eW14YzAsMTE1MjAwbjggY29uc29sZT10dHkx
IHZpZGVvPW14Y2ZiMDpkZXY9aGRtaSByb290PS9kZXYvbmZzIHJ3IGNtYT0yNTZNIGFoY2lfaW14
LmhvdHBsdWc9MSBzcGxhc2ggcmVzdW1lPS9kZXYvc2RhMQo+ID4gPiA+ID4gW8KgwqDCoMKgMC4w
MDAwMDBdIERlbnRyeSBjYWNoZSBoYXNoIHRhYmxlIGVudHJpZXM6IDEzMTA3MiAob3JkZXI6IDcs
IDUyNDI4OCBieXRlcykKPiA+ID4gPiA+IFvCoMKgwqDCoDAuMDAwMDAwXSBJbm9kZS1jYWNoZSBo
YXNoIHRhYmxlIGVudHJpZXM6IDY1NTM2IChvcmRlcjogNiwgMjYyMTQ0IGJ5dGVzKQo+ID4gPiA+
ID4gW8KgwqDCoMKgMC4wMDAwMDBdIE1lbW9yeTogMTc5MDk3MksvMjA5NzE1MksgYXZhaWxhYmxl
ICg4NDcxSyBrZXJuZWwgY29kZSwgNjkzSyByd2RhdGEsIDI4NDRLIHJvZGF0YSwgNTAwSyBpbml0
LCA4MDYySyBic3MsIDQ0MDM2SyByZXNlcnZlZCwgMjYyMTQ0SyBjbWEtcmVzZXJ2ZWQsIDEzMTA3
MjBLIGhpZ2htZW0pCj4gPiA+ID4gPiAuLi4KPiA+ID4gPiA+IFvCoMKgwqAxMy4xMDEwOThdIGV0
bmF2aXYtZ3B1IDEzMDAwMC5ncHU6IGNvbW1hbmQgYnVmZmVyIG91dHNpZGUgdmFsaWQgbWVtb3J5
IHdpbmRvdwo+ID4gPiA+ID4gW8KgwqDCoDEzLjE3MTk2M10gZXRuYXZpdi1ncHUgMTM0MDAwLmdw
dTogY29tbWFuZCBidWZmZXIgb3V0c2lkZSB2YWxpZCBtZW1vcnkgd2luZG93Cj4gPiA+ID4gCj4g
PiA+ID4gWWVzLCB0aGF0J3MgYSByZWdyZXNzaW9uIGR1ZSB0byBkaWZmZXJlbnQgZGVmYXVsdCBD
TUEgYXJlYSBwbGFjZW1lbnQKPiA+ID4gPiBhbmQgZXRuYXZpdiBub3QgYmVpbmcgc21hcnQgZW5v
dWdoIHRvIG1vdmUgdGhlIGxpbmVhciB3aW5kb3cgdG8gdGhlCj4gPiA+ID4gcmlnaHQgb2Zmc2V0
Lgo+ID4gPiAKPiA+ID4gQXMgaXQncyBhIHVzZXIgdmlzaWJsZSByZWdyZXNzaW9uLCBpdCBuZWVk
cyBmaXhpbmcsIGVpdGhlciBieSByZXZlcnRpbmcKPiA+ID4gdGhlIGNoYW5nZXMgdGhhdCBjYXVz
ZWQgaXQgb3IgYnkgc29tZSBvdGhlciBpc3N1ZS7CoMKgSW4gdGhlIGtlcm5lbCwgdGhlCj4gPiA+
IHBvbGljeSBpcyAiaWYgYSBidWcgZml4IGNhdXNlcyBhIHJlZ3Jlc3Npb24sIHRoZSBidWcgZml4
IHdhcyBpdHNlbGYKPiA+ID4gd3JvbmciLsKgwqBXZSBkb24ndCBmaXggb25lIHBlcnNvbidzIGJ1
ZyBpZiBpdCBjYXVzZXMgYSByZWdyZXNzaW9uIGZvcgo+ID4gPiBzb21lb25lIGVsc2UuCj4gPiA+
IAo+ID4gPiBQbGVhc2UgcmVzb2x2ZSB0aGUgYWNrbm93bGVkZ2VkIHJlZ3Jlc3Npb24uCj4gCj4g
VGhlIHJlZ3Jlc3Npb24gaXMgY2F1c2VkIGR1ZSB0byBhIGRpZmZlcmVudCBDTUEgcGxhY2VtZW50
LCB3aGljaCBpcwo+IG91dHNpZGUgb2YgdGhlIGNvbnRyb2wgb2YgZXRuYXZpdi4gSWYgeW91IGNh
biBwb2ludCB0byB0aGUgY29tbWl0Cj4gY2F1c2luZyB0aGlzIGNoYW5nZSBpbiBwbGFjZW1lbnQg
d2UgY291bGQgd29yayB3aXRoIHRoZQo+IGF1dGhvcnMvbWFpbnRhaW5lcnMgb2YgdGhpcyBjb2Rl
IHRvIGdldCByaWQgb2YgdGhlIHJlZ3Jlc3Npb24uCj4gQ3VycmVudGx5IEkgZG9uJ3QgaGF2ZSB0
aGUgYmFuZHdpZHRoIHRvIHBpbnBvaW50IHRoZSBvZmZlbmRpbmcgY29kZQo+IGNoYW5nZS4KCk9r
LCB0aGFua3MgZm9yIHRoZSBleHBsYW5hdGlvbi4KCldlbGwsIHRoZSBwcm9ibGVtIGhhcyBiZWNv
bWUgd2VpcmRlci4gIEknbSB1bmFibGUgdG8gcmVwcm9kdWNlIHRoZSBoYW5nCm5vdyAtIHRoZSBv
bmx5IGNoYW5nZSBoYXMgYmVlbiB0byBhZGQgeW91ciBwYXRjaCBmb3IgdGhlIHVubG9hZCBpc3N1
ZSwKYXMgd2VsbCBhcyB0ZW1wb3JhcmlseSBkaXNhYmxpbmcgbGlnaHRkbSdzIHN0YXJ0dXAgYXQg
Ym9vdCAod2hpY2ggaXMKbm93IGJhY2sgYXMgaXQgd2FzLikgIE9kZC4KCi0tIApSTUsncyBQYXRj
aCBzeXN0ZW06IGh0dHBzOi8vd3d3LmFybWxpbnV4Lm9yZy51ay9kZXZlbG9wZXIvcGF0Y2hlcy8K
RlRUQyBicm9hZGJhbmQgZm9yIDAuOG1pbGUgbGluZSBpbiBzdWJ1cmJpYTogc3luYyBhdCAxMi4x
TWJwcyBkb3duIDYyMmticHMgdXAKQWNjb3JkaW5nIHRvIHNwZWVkdGVzdC5uZXQ6IDExLjlNYnBz
IGRvd24gNTAwa2JwcyB1cApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
