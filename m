Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BADE13C6
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 10:11:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B2E6E9AC;
	Wed, 23 Oct 2019 08:11:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F7F6E841
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 15:12:05 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/zswDWtng=="
X-RZG-CLASS-ID: mo00
Received: from mbp-13-nikolaus.fritz.box
 by smtp.strato.de (RZmta 44.28.1 DYNA|AUTH)
 with ESMTPSA id R0b2a8v9MFBmRcM
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH
 bits, eq. 15360 bits RSA)) (Client did not present a certificate);
 Tue, 22 Oct 2019 17:11:48 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH 1/7] dt-bindings: gpu: pvrsgx: add initial bindings
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20191022150202.GJ5610@atomide.com>
Date: Tue, 22 Oct 2019 17:11:48 +0200
Message-Id: <CC62CE92-28DF-406E-B61C-22F8F341AAFB@goldelico.com>
References: <cover.1571424390.git.hns@goldelico.com>
 <f0fb68dc7bc027e5e911721852f6bc6fa2d77a63.1571424390.git.hns@goldelico.com>
 <CAL_Jsq+obsTSU3iP1wm_3-FsAJ4Mxiz0NbMY1_h5NeFn67Sj+A@mail.gmail.com>
 <CEA29A3B-4116-4FE3-8E18-0C97353688DC@goldelico.com>
 <20191021172557.GB5610@atomide.com>
 <C6CD5A50-7F0A-4F56-ABB9-CAEDF7E47A5D@goldelico.com>
 <20191022150202.GJ5610@atomide.com>
To: Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Wed, 23 Oct 2019 08:09:38 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1571757124; 
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=Pqwznfr/SwLHT8oLe0EESmmfaLFtEj2ZVFAktZnberQ=;
 b=kbsENwkzH5Sf7l9UjaT7RynwS/sGaO3G0R54SsYShT2MTpMJMhggDrU8sPSWksfOm/
 0RWqqzqcrqVUOPDE8xXpEcbpOfuPRnJ9VbODQcfQ2huZWLJQg0wRlYNvzb/gd38MMBLX
 4bTFyXWwTgmOewHO+aytFGJimmEQwub6ba4S1kKwiB3vEx4dQGLOnZVLYnNTtitTvuJ6
 WtSa+/XMDawBFXEb5w6L/SFYl5jW6cujDw1dELCQTGra0xByzsz3ZyskeWNwdYLH/cbp
 Z5wzl6ikdz3iShB84BoiCAoEhAnWMNOnpRLQZML7CI6oLewje0A2Ztq9E8zZiW2UmVv1
 I2Tg==
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>,
 =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 kernel@pyra-handheld.com, linux-omap <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVG9ueSwKCj4gQW0gMjIuMTAuMjAxOSB1bSAxNzowMiBzY2hyaWViIFRvbnkgTGluZGdyZW4g
PHRvbnlAYXRvbWlkZS5jb20+Ogo+IAo+ICogSC4gTmlrb2xhdXMgU2NoYWxsZXIgPGhuc0Bnb2xk
ZWxpY28uY29tPiBbMTkxMDIxIDE4OjA4XToKPj4gCj4+PiBBbSAyMS4xMC4yMDE5IHVtIDE5OjI1
IHNjaHJpZWIgVG9ueSBMaW5kZ3JlbiA8dG9ueUBhdG9taWRlLmNvbT46Cj4+PiAKPj4+ICogSC4g
Tmlrb2xhdXMgU2NoYWxsZXIgPGhuc0Bnb2xkZWxpY28uY29tPiBbMTkxMDIxIDE1OjQ2XToKPj4+
Pj4gQW0gMjEuMTAuMjAxOSB1bSAxNzowNyBzY2hyaWViIFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtl
cm5lbC5vcmc+Ogo+Pj4+PiBPbiBGcmksIE9jdCAxOCwgMjAxOSBhdCAxOjQ2IFBNIEguIE5pa29s
YXVzIFNjaGFsbGVyIDxobnNAZ29sZGVsaWNvLmNvbT4gd3JvdGU6Cj4+Pj4+PiArT3B0aW9uYWwg
cHJvcGVydGllczoKPj4+Pj4+ICstIHRpbWVyOiAgICAgICB0aGUgdGltZXIgdG8gYmUgdXNlZCBi
eSB0aGUgZHJpdmVyLgo+Pj4+PiAKPj4+Pj4gTmVlZHMgYSBiZXR0ZXIgZGVzY3JpcHRpb24gYW5k
IHZlbmRvciBwcmVmaXggYXQgbGVhc3QuCj4+Pj4gCj4+Pj4gSSBhbSBub3QgeWV0IHN1cmUgaWYg
aXQgaXMgdmVuZG9yIHNwZWNpZmljIG9yIGlmIGFsbAo+Pj4+IFNHWCBpbXBsZW1lbnRhdGlvbnMg
bmVlZCBzb21lIHRpbWVyLgo+Pj4+IAo+Pj4+PiAKPj4+Pj4gV2h5IGlzIHRoaXMgbmVlZGVkIHJh
dGhlciB0aGFuIHVzaW5nIHRoZSBPUydzIHRpbWVycz8KPj4+PiAKPj4+PiBCZWNhdXNlIG5vYm9k
eSB1bmRlcnN0YW5kcyB0aGUgY3VycmVudCAob3V0IG9mIHRyZWUgYW5kCj4+Pj4gcGxhbm5lZCBm
b3Igc3RhZ2luZykgZHJpdmVyIHdlbGwgZW5vdWdoIHdoYXQgdGhlIHRpbWVyCj4+Pj4gaXMgZG9p
bmcuIEl0IGlzIGN1cnJlbnRseSBoYXJkIGNvZGVkIHRoYXQgc29tZSBvbWFwIHJlZmVyCj4+Pj4g
dG8gdGltZXI3IGFuZCBvdGhlcnMgdXNlIHRpbWVyMTEuCj4+PiAKPj4+IEp1c3QgY29uZmlndXJl
IGl0IGluIHRoZSBkcml2ZXIgYmFzZWQgb24gdGhlIGNvbXBhdGlibGUKPj4+IHZhbHVlIHRvIGtl
ZXAgaXQgb3V0IG9mIHRoZSBkdHMuIEl0J3MgYmVzdCB0byBzdGljayB0bwo+Pj4gc3RhbmRhcmQg
YmluZGluZ3MuCj4+IAo+PiBJTUhPIGxlYWRzIHRvIHVnbHkgY29kZS4uLiBTaW5jZSB0aGUgdGlt
ZXIgaXMgbm90IHBhcnQgb2YKPj4gdGhlIFNHWCBJUFIgbW9kdWxlIGJ1dCBvbmUgb2YgdGhlIE9N
QVAgdGltZXJzIGl0IGlzIHNvcnQKPj4gb2YgaGFyZHdhcmUgY29ubmVjdGlvbiB0aGF0IGNhbiBi
ZSBjaG9zZW4gYSBsaXR0bGUgYXJiaXRyYXJpbHkuCj4+IAo+PiBUaGlzIGlzIHRoZSBtYWluIHJl
YXNvbiB3aHkgSSB0aGluayBhZGRpbmcgaXQgdG8gYSBkZXZpY2UgdHJlZQo+PiBzb3VyY2Ugc28g
dGhhdCBhIGJvYXJkIHRoYXQgcmVhbGx5IHJlcXVpcmVzIHRvIHVzZSBhIHRpbWVyCj4+IGZvciBh
IGRpZmZlcmVudCBwdXJwb3NlLCBjYW4gcmVhc3NpZ24gaXQuIFRoaXMgaXMgbm90IHBvc3NpYmxl
Cj4+IGlmIHdlIGhhcmQtY29kZSB0aGF0IGludG8gdGhlIGRyaXZlciBieSBzY2FubmluZyBmb3IK
Pj4gY29tcGF0aWJsZS4gSW4gdGhhdCBjYXNlIHRoZSBkcml2ZXIgbXVzdCBjaGVjayBib2FyZCBj
b21wYXRpYmxlCj4+IG5hbWVzLi4uCj4+IAo+PiBCdXQgaWYgd2UgZ2FpbiBhIGJldHRlciB1bmRl
cnN0YW5kaW5nIG9mIGl0cyByb2xlIGluIHRoZSBkcml2ZXIKPj4gKGRvZXMgaXQgcmVhbGx5IG5l
ZWQgYSBkZWRpY2F0ZWQgdGltZXIgYW5kIGZvciB3aGF0IGFuZCB3aGljaAo+PiBwcm9wZXJ0aWVz
IHRoZSB0aW1lciBtdXN0IGhhdmUpIHdlIGNhbiBwcm9iYWJseSByZXBsYWNlIGl0Lgo+IAo+IFdl
bGwgaG93IGFib3V0IGp1c3QgbGVhdmUgb3V0IHRoZSB0aW1lciBmcm9tIHRoZSBiaW5kaW5nCj4g
Zm9yIG5vdywgYW5kIGp1c3QgY2FycnkgYSBwYXRjaCBmb3IgaXQgdW50aWwgaXQgaXMga25vd24K
PiBpZi93aHkgaXQncyByZWFsbHkgbmVlZGVkPwo+IAo+IElmIGl0J3MgbmVlZGVkLCB5ZWFoIEkg
YWdyZWUgYSB0aW1lciBwcm9wZXJ0eSBzaG91bGQgYmUKPiB1c2VkLgoKT2ssIGZpbmUuIEknbGwg
c3BsaXQgdGhlIGJpbmRpbmdzIGludG8gYSBwYXRjaCB3aXRob3V0IGFuZAprZWVwIGEgcHJpdmF0
ZSBwYXRjaCB0byBhZGQgdGhpcyBmb3Igb3VyIGRldmVsb3BtZW50IHRyZWUuClRoZW4gd2UgZWl0
aGVyIG5lZWQgaXQgb3IgZHJvcCBpdC4KCj4gCj4+Pj4+PiArLSBpbWcsY29yZXM6ICAgbnVtYmVy
IG9mIGNvcmVzLiBEZWZhdWx0cyB0byA8MT4uCj4+Pj4+IAo+Pj4+PiBOb3QgZGlzY292ZXJhYmxl
Pwo+Pj4+IAo+Pj4+IE5vdCBzdXJlIGlmIGl0IGlzLiBUaGlzIGlzIHByb2JhYmx5IGF2YWlsYWJs
ZSBpbiB1bmRvY3VtZW50ZWQKPj4+PiByZWdpc3RlcnMgb2YgdGhlIHNneC4KPj4+IAo+Pj4gVGhp
cyB0b28sIGFuZCB3aGF0ZXZlciBub24tc3RhbmRyZCBvdGhlciBwcm9wZXJpdGllcwo+Pj4geW91
IG1pZ2h0IGhhdmUuCj4+IAo+PiBIZXJlIGl0IGlzIGEgZmVhdHVyZSBvZiB0aGUgU0dYIElQUiBv
ZiB0aGUgU29DLCBpLmUuCj4+IGRlc2NyaWJlcyB0aGF0IHRoZSBoYXJkd2FyZSBoYXMgb25lIG9y
IHR3byBjb3Jlcy4KPiAKPiBIZXJlIHlvdSBjYW4gaGF2ZSBhIHN0YW5kYXJkIGR0cyBiaW5kaW5n
IGJ5IHB1dHRpbmcgdGhpcwo+IGludG8gZHJpdmVyIHN0cnVjdCBvZl9kZXZpY2VfaWQgbWF0Y2gg
LmRhdGEuIFRoZW4gd2hlbgo+IHNvbWVib2R5IGZpZ3VyZXMgb3V0IGhvdyB0byByZWFkIHRoYXQg
ZnJvbSB0aGUgaGFyZHdhcmUsCj4gaXQgY2FuIGJlIGp1c3QgZHJvcHBlZC4KCkhtLiBIb3cgc2hv
dWxkIHRoYXQgd29yaz8gU29tZSBTb0MgaGF2ZSB0aGUgc2d4NTQ0IGFzIHNpbmdsZQpjb3JlIGFu
ZCBvdGhlcnMgYXMgZHVhbCBjb3JlLiBUaGlzIGltaG8gZG9lcyBub3QgZml0IGludG8KdGhlICJp
bWcsc2d4NTQ0LSRyZXZpc2lvbiIgc2NoZW1lIHdoaWNoIGNvdWxkIGJlIG1hdGNoZWQgdG8uCgpC
dXQgbWF5YmUgd2UgZG8gaXQgdGhlIHNhbWUgYXMgd2l0aCB0aGUgdGltZXIgZm9yIHRoZSBtb21l
bnQsCmkuZS4ga2VlcCBpdCBpbiBzb21lIHVucHVibGlzaGVkIHBhdGNoIHNldC4KCkF0IHRoZSBt
b21lbnQgSSBoYXZlIG1vcmUgcHJvYmxlbXMgdW5kZXJzdGFuZGluZyBob3cgdGhlIHlhbWwKdGhp
bmcgd29ya3MuIEkgdW5kZXJzdGFuZCBhbmQgZnVsbHkgc3VwcG9ydCB0aGUgb3ZlcmFsbCBnb2Fs
LApidXQgaXQgaXMgcXVpdGUgZGlmZmljdWx0IHRvIGdldCBhIHN0YXJ0IGhlcmUuIEFuZCB0aGVy
ZSBkbyBub3QKc2VlbSB0byBiZSB0b29scyBvciBzY3JpcHRzIHRvIGhlbHAgY29udmVydGluZyBm
cm9tIG9sZCBzdHlsZQp0ZXh0IGZvcm1hdCAoZXZlbiBpZiBub3QgcGVyZmVjdCwgdGhpcyB3b3Vs
ZCBiZSBoZWxwZnVsKSBhbmQKSSBoYXZlIG5vIHlhbWwgZWRpdG9yIHRoYXQgaGVscHMga2VlcGlu
ZyB0aGUgaW5kZW50YXRpb24KY29ycmVjdC4gU28gdGhpcyBzbG93cyBkb3duIGEgdjIgYSBsaXR0
bGUgYml0LgoKQlIgYW5kIHRoYW5rcywKTmlrb2xhdXMKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
