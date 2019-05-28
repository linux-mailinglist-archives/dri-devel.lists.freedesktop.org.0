Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0AE2CD54
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 19:14:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D52AF6E273;
	Tue, 28 May 2019 17:13:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 367 seconds by postgrey-1.36 at gabe;
 Tue, 28 May 2019 15:26:36 UTC
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59EE989236
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 15:26:35 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/zvwDCv+Ds="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 44.18 DYNA|AUTH)
 with ESMTPSA id j04dc1v4SFKPrJe
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH
 bits, eq. 15360 bits RSA)) (Client did not present a certificate);
 Tue, 28 May 2019 17:20:25 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to
 dts
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CAHCN7xLzoCNW6q5yDCsqMHeNvdNegkGhd0N+q9+Gd8JUGbG=_g@mail.gmail.com>
Date: Tue, 28 May 2019 17:20:25 +0200
Message-Id: <BA6E7BE4-E87A-4B0A-A027-BEA7A9ACA670@goldelico.com>
References: <20190510194229.20628-1-aford173@gmail.com>
 <af325707-3e42-493d-e858-77878ef06138@ti.com>
 <CAHCN7xLzoCNW6q5yDCsqMHeNvdNegkGhd0N+q9+Gd8JUGbG=_g@mail.gmail.com>
To: Adam Ford <aford173@gmail.com>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Tue, 28 May 2019 17:13:51 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1559057194; 
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=qK0brR99/X2lpuUysXULzMIa3xw5IAnSWUKrYkjXFlY=;
 b=N5c9liBueBM5JNYvGYqKrHZ4p354weg4BDxMOgz2irpGDJVNA7lIT7T+OOtUXBSnB1
 ES+yhu/GaCuWyqwjuAFSuFVxDBIFiStW0/mUVb+dd2xwJO8NJrLbNInetPMQ9YJ3wQIk
 1x5ix4+ZJfKjbyJY2oI4LAQUpnOUAsrWU8a1qyJcdP5WFESC28YS5y0esBtr+OvyoMYG
 Rdhjhvfbt3IwaL0vgV4oFzd31G17MyqS41MvFDCpRVLjPYhgCasMZ4yAQUNTZyoEc+f3
 I81jASxX3l1C0rD/tQcEqQMiHXoiC+2s/sndBqQDKegpZHYf8rWrdH8zcIzFbnacJZMj
 ik6Q==
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
 devicetree <devicetree@vger.kernel.org>,
 =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 David Airlie <airlied@linux.ie>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Tony Lindgren <tony@atomide.com>,
 Rob Herring <robh+dt@kernel.org>, Linux-OMAP <linux-omap@vger.kernel.org>,
 Adam Ford <adam.ford@logicpd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cj4gQW0gMjguMDUuMjAxOSB1bSAxNzowOSBzY2hyaWViIEFkYW0gRm9yZCA8YWZvcmQxNzNAZ21h
aWwuY29tPjoKPiAKPiBPbiBUdWUsIE1heSAyOCwgMjAxOSBhdCA0OjExIEFNIFRvbWkgVmFsa2Vp
bmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+IHdyb3RlOgo+PiAKPj4gSGksCj4+IAo+PiBPbiAx
MC8wNS8yMDE5IDIyOjQyLCBBZGFtIEZvcmQgd3JvdGU6Cj4+PiBDdXJyZW50bHkgdGhlIHNvdXJj
ZSBjb2RlIGlzIGNvbXBpbGVkIHVzaW5nIGhhcmQtY29kZWQgdmFsdWVzCj4+PiBmcm9tIENPTkZJ
R19PTUFQMl9EU1NfTUlOX0ZDS19QRVJfUENLLiAgVGhpcyBwYXRjaCBhbGxvd3MgdGhpcwo+Pj4g
Y2xvY2sgZGl2aWRlciB2YWx1ZSB0byBiZSBtb3ZlZCB0byB0aGUgZGV2aWNlIHRyZWUgYW5kIGJl
IGNoYW5nZWQKPj4+IHdpdGhvdXQgaGF2aW5nIHRvIHJlY29tcGlsZSB0aGUga2VybmVsLgo+Pj4g
Cj4+PiBTaWduZWQtb2ZmLWJ5OiBBZGFtIEZvcmQgPGFmb3JkMTczQGdtYWlsLmNvbT4KPj4gCj4+
IEkgdW5kZXJzdGFuZCB3aHkgeW91IHdhbnQgdG8gZG8gdGhpcywgYnV0IEknbSBub3Qgc3VyZSBp
dCdzIGEgZ29vZCBpZGVhLgo+PiBJdCdzIHJlYWxseSBzb21ldGhpbmcgdGhlIGRyaXZlciBzaG91
bGQgZmlndXJlIG91dCwgYW5kIGlmIHdlIGFkZCBpdCB0bwo+PiB0aGUgRFQsIGl0IGVmZmVjdGl2
ZWx5IGJlY29tZXMgYW4gQUJJLgo+PiAKPj4gVGhhdCBzYWlkLi4uIEknbSBub3Qgc3VyZSBob3cg
Z29vZCBvZiBhIGpvYiB0aGUgZHJpdmVyIGNvdWxkIGV2ZXIgZG8sIGFzCj4+IGl0IGNhbid0IGtu
b3cgdGhlIGZ1dHVyZSBzY2FsaW5nIG5lZWRzIG9mIHRoZSB1c2Vyc3BhY2UgYXQgdGhlIHRpbWUg
aXQKPj4gaXMgY29uZmlndXJpbmcgdGhlIGNsb2NrLiBBbmQgc28sIEknbSBub3QgbmFja2luZyB0
aGlzIHBhdGNoLCBidXQgSQo+PiBkb24ndCBmZWVsIHZlcnkgZ29vZCBhYm91dCB0aGlzIHBhdGNo
Li4uCj4+IAo+PiBUaGUgc2V0dGluZyBhbHNvIGFmZmVjdHMgYWxsIG91dHB1dHMgKGV4bHVkaW5n
IHZlbmMpLCB3aGljaCBtYXkgbm90IGJlCj4+IHdoYXQgdGhlIHVzZXIgd2FudHMuIFRoZW4gYWdh
aW4sIEkgdGhpbmsgdGhpcyBzZXR0aW5nIGlzIHJlYWxseSBvbmx5Cj4+IG5lZWRlZCBvbiBPTUFQ
MiAmIDMsIHdoaWNoIGhhdmUgb25seSBhIHNpbmdsZSBvdXRwdXQuIEJ1dCB0aGF0J3MgdGhlCj4+
IHNhbWUgd2l0aCB0aGUgY3VycmVudCBrY29uZmlnIG9wdGlvbiwgb2YgY291cnNlLgo+PiAKPj4g
U28sIHRoZSBjdXJyZW50IENPTkZJR19PTUFQMl9EU1NfTUlOX0ZDS19QRVJfUENLIGlzIGFuIHVn
bHkgaGFjaywgaW4gbXkKPj4gb3BpbmlvbiwgYW5kIG1vdmluZyBpdCB0byBEVCBtYWtlcyBpdCBh
IHdvcnNlIGhhY2sgPSkuIEJ1dCBJIGRvbid0IGhhdmUKPj4gYW55IGdvb2Qgc3VnZ2VzdGlvbnMg
ZWl0aGVyLgo+IAo+IEFzIGl0IHN0YW5kcyB0aGUgTG9naWMgUEQgT01BUDM1IGFuZCBBTTM3L0RN
MzcgYm9hcmRzIChTT00tTFYgYW5kCj4gVG9ycGVkbykgcmVxdWlyZSB0aGlzIHRvIGJlIGhhcmQg
Y29kZWQgdG8gNCBvciBpdCBoYW5ncyBkdXJpbmcgc3RhcnQuCj4gVGhpcyBpcyB0aGUgY2FzZSBm
b3IgYWxsIHZlcnNpb25zIDQuMisuICBJIGhhdmVuJ3QgdGVzdGVkIGl0IHdpdGgKPiBvbGRlciBz
dHVmZi4gIFRvbnkgaGFzIGEgRE0zNzMwIFRvcnBlZG8ga2l0IGFuZCByZXBvcnRlZCB0aGUgaGFu
Z2luZwo+IGlzc3VlIHRvIG1lLiBJIHRvbGQgaGltIHRvIHNldCB0aGF0IHZhbHVlIHRvIDQgdG8g
bWFrZSBpdCBub3QgaGFuZy4KPiBIZSBhc2tlZCB0aGF0IEkgbW92ZSBpdCB0byB0aGUgRFQgdG8g
YXZvaWQgY3VzdG9tIGtlcm5lbHMuICBJIGFncmVlCj4gaXQncyBhIGhhY2ssIGJ1dCBpZiBpdCdz
IGNyZWF0ZSBhIGN1c3RvbWl6ZWQgZGVmY29uZmlnIGZpbGUgZm9yIDQKPiBib2FyZHMgb3IgbW9k
aWZ5IHRoZSBkZXZpY2UgdHJlZSwgaXQgc2VlbXMgbGlrZSB0aGUgZGV2aWNlIHRyZWUKPiBhcHBy
b2FjaCBpcyBsZXNzIGludHJ1c2l2ZS4KCldlbGwsIGlmIHRoaXMgYm9hcmRzIG5lZWRzIGEgZmFj
dG9yIDQgdG8gYmUgZGVmaW5lZCwgaXQgaXMgSU1ITwoxMDAgJSBjb3JyZWN0IHRvIGRlc2NyaWJl
IHRoaXMgaW4gdGhlIERUUyBhbmQgbm93aGVyZSBlbHNlLiBMaWtlCm1pbmltdW0gYW5kIG1heGlt
dW0gdm9sdGFnZSBvZiBhIHJlZ3VsYXRvciB3aGljaCBpcyBhbHNvIHZlcnkgYm9hcmQKc3BlY2lm
aWMuCgpVbmxlc3MgaXQgY2FuIGJlIGZpZ3VyZWQgb3V0IGF1dG9tYXRpY2FsbHkuIElmIGl0IHR1
cm5zIG91dCBsYXRlcgp0aGF0IGl0IGNhbiwgSSB3b3VsZCBhc3N1bWUgdGhlIGRyaXZlcnMgY2Fu
IHNpbXBseSBpZ25vcmUgdGhlIGhpbnQKaW4gdGhlIERUUz8KCkp1c3QgbXkgMmN0cyB3aXRob3V0
IGtub3dpbmcgZGV0YWlscyBhbmQgaGF2aW5nIHRlc3RlZCBhbnl0aGluZwpvbiBvdXIgRE0zNyBi
b2FyZHMuCgpCUiwKTmlrb2xhdXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
