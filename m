Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BA2101ADB
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:04:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC0F36EBA0;
	Tue, 19 Nov 2019 08:04:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A66876E0F8
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 14:37:11 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmMlw43pqoI="
X-RZG-CLASS-ID: mo00
Received: from mbp-13-nikolaus.fritz.box
 by smtp.strato.de (RZmta 44.29.0 DYNA|AUTH)
 with ESMTPSA id L09db3vAIEb8TUi
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH
 bits, eq. 15360 bits RSA)) (Client did not present a certificate);
 Mon, 18 Nov 2019 15:37:08 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [RFCv1 11/42] ARM: dts: omap: add channel to DSI panels
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20191118143332.nyyr6hb4b5c34xew@earth.universe>
Date: Mon, 18 Nov 2019 15:37:12 +0100
Message-Id: <7CBD93FA-60AB-4313-BF9C-230BDE2DAE7D@goldelico.com>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
 <20191117024028.2233-12-sebastian.reichel@collabora.com>
 <2db2d505-2f92-621c-ba7c-552b89255594@ti.com>
 <20191118143332.nyyr6hb4b5c34xew@earth.universe>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Tue, 19 Nov 2019 08:04:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1574087829; 
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=NccyzmP1agUOJi6AkNkNhwRgnV6m5woxZkl+LYAkrB8=;
 b=KWmZ9LwpEr2bLXMYmc2iF1MZJyeyKRmnRueS/OvgqxMQArqRcgswirfvxBWAzwai0T
 0N7/jZYSm8gGiyJ5HGOxlZYwoD/aAUAgyY4vuSFKlDMFKGURRKivR1pbJeEfzJRQUSqX
 W2hEvmPWvZyvf6HXiYUXI3iYP//1Sc+PWaRJXeiC2LUbYYM7+GvpD5OgSva62nDfF65f
 DHrc4o4vTx4MBrr0EOB8F+mSG2nPW/+//3XgfiMXo+uPT7Qf37NrJwjmG9iWnh9MTbjd
 UjaTTI26h2FGmSoLbTT8E8N0NFcDX8YjBIcJcIfED65S0ouAMIl2FFo0Xqch0WLaouF2
 N+VQ==
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
Cc: kernel@collabora.com, Tony Lindgren <tony@atomide.com>,
 Merlijn Wajer <merlijn@wizzup.org>, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cj4gQW0gMTguMTEuMjAxOSB1bSAxNTozMyBzY2hyaWViIFNlYmFzdGlhbiBSZWljaGVsIDxzZWJh
c3RpYW4ucmVpY2hlbEBjb2xsYWJvcmEuY29tPjoKPiAKPiBIaSwKPiAKPiBPbiBNb24sIE5vdiAx
OCwgMjAxOSBhdCAwMzowNTowN1BNICswMjAwLCBUb21pIFZhbGtlaW5lbiB3cm90ZToKPj4gT24g
MTcvMTEvMjAxOSAwNDozOSwgU2ViYXN0aWFuIFJlaWNoZWwgd3JvdGU6Cj4+PiBUaGUgc3RhbmRh
cmQgYmluZGluZyBmb3IgRFNJIHJlcXVpcmVzLCB0aGF0IHRoZSBjaGFubmVsIG51bWJlcgo+Pj4g
b2YgdGhlIHBhbmVsIGlzIGVuY29kZWQgaW4gRFQuIFRoaXMgYWRkcyB0aGUgY2hhbm5lbCBudW1i
ZXIgaW4KPj4+IGFsbCBPTUFQMy01IGJvYXJkcywgaW4gcHJlcGFyYXRpb24gZm9yIHVzaW5nIGNv
bW1vbiBpbmZyYXN0cnVjdHVyZS4KPj4+IAo+Pj4gU2lnbmVkLW9mZi1ieTogU2ViYXN0aWFuIFJl
aWNoZWwgPHNlYmFzdGlhbi5yZWljaGVsQGNvbGxhYm9yYS5jb20+Cj4+PiAtLS0KPj4+ICAuLi4v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3BhbmVsLWRzaS1jbS50eHQgICAgICB8
IDQgKysrLQo+Pj4gIGFyY2gvYXJtL2Jvb3QvZHRzL29tYXAzLW45NTAuZHRzICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgMyArKy0KPj4+ICBhcmNoL2FybS9ib290L2R0cy9vbWFwMy5kdHNp
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDMgKysrCj4+PiAgYXJjaC9hcm0vYm9v
dC9kdHMvb21hcDQtZHJvaWQ0LXh0ODk0LmR0cyAgICAgICAgICAgICAgICAgICAgfCAzICsrLQo+
Pj4gIGFyY2gvYXJtL2Jvb3QvZHRzL29tYXA0LXNkcC5kdHMgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgNiArKysrLS0KPj4+ICBhcmNoL2FybS9ib290L2R0cy9vbWFwNC5kdHNpICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8IDYgKysrKysrCj4+PiAgYXJjaC9hcm0vYm9vdC9k
dHMvb21hcDUuZHRzaSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA2ICsrKysrKwo+
Pj4gIDcgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPj4g
Cj4+IElzIHRoaXMgcmVxdWlyZWQgb25seSBpbiB0aGUgLnR4dCwgb3IgYWxzbyBieSB0aGUgZHJp
dmVyPyBUaGlzIGRvZXMgYnJlYWsKPj4gYmFja3dhcmQgY29tcGF0aWJpbGl0eSB3aXRoIHRoZSBk
dGJzLCBhbmQgdGhlcmUncyBhbHdheXMgc29tZW9uZSB3aG8gd29uJ3QKPj4gbGlrZSBpdC4KPiAK
PiBJIGFkZCBhIGNvbXBhdGlibGUgc3RyaW5nIGZvciB0aGUgRHJvaWQgNCBwYW5lbCBpbiBhZGRp
dGlvbiB0byB0aGUKPiBnZW5lcmljIG9uZSwgd2hpY2ggaXMgbm90IHJlYWxseSByZXF1aXJlZCBh
bmQganVzdCBhIHByZWNhdXRpb24gaW4KPiBjYXNlIHdlIG5lZWQgc29tZSBxdWlya3MgaW4gdGhl
IGZ1dHVyZS4KPiAKPiBCdXQgSSBoYWQgdG8gYWRkIHRoZSBEU0kgY2hhbm5lbCB0byBEVCwgd2hp
Y2ggaXMgcmVxdWlyZWQgdG8gZm9sbG93Cj4gdGhlIHN0YW5kYXJkIERTSSBiaW5kaW5ncy4gV2Ug
Y2Fubm90IHVzZSB0aGUgZ2VuZXJpYyBpbmZyYXN0cnVjdHVyZQo+IHdpdGhvdXQgdGhpcyBjaGFu
Z2UuIFRlY2huaWNhbGx5IGl0IHNob3VsZCBoYXZlIGJlZW4gdGhlcmUgYWxsIHRoZQo+IHRpbWUs
IGl0IGlzIG9ubHkgd29ya2luZyBiZWNhdXNlIGl0IGlzIGN1cnJlbnRseSBoYXJkY29kZWQgdG8g
MCBpbgo+IHRoZSBwYW5lbCBkcml2ZXIuCgpJcyBpdCBwb3NzaWJsZSB0byBjaGFuZ2UgaXQgdG8g
ZGVmYXVsdCB0byBjaGFubmVsIDwwPiBpZiByZWcgaXMgbm90CnNwZWNpZmllZD8KCj4gCj4gVExE
UjogWWVzLCBpdCBpcyByZXF1aXJlZCBieSB0aGUgZHJpdmVyIGFuZCBpdCBkb2VzIGJyZWFrIGJh
Y2t3YXJkCj4gY29tcGF0aWJpbGl0eSBmb3IgTjk1MCAocGFuZWwgZG9lcyBub3QgeWV0IHdvcmsg
b24gbWFpbmxpbmUsIHNpbmNlCj4gdGhlIE9NQVAzIHF1aXJrcyBhcmUgbWlzc2luZyBpbiB0aGUg
b21hcGRybSBEU0kgY29kZSksIG9tYXA0LXNkcCAoCj4gdW50ZXN0ZWQsIEkgZG8gbm90IGtub3cg
aWYgaXRzIHdvcmtpbmcpIGFuZCBEcm9pZCA0IChrbm93biB0byBiZQo+IHdvcmtpbmcgd2l0aCBj
dXJyZW50IG1haW5saW5lIGNvZGUsIG1vc3QgbGlrZWx5IHBlb3BsZSB1cGRhdGUgdGhlaXIKPiBE
VCBhbnl3YXlzKS4KPiAKPiAtLSBTZWJhc3RpYW4KCkJSLApOaWtvbGF1cwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
