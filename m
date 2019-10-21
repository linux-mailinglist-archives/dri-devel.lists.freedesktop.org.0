Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBD5DF7E6
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 00:21:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90AB56E28B;
	Mon, 21 Oct 2019 22:21:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28AB66E1BD
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 18:08:06 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDVCbXA4Ewxc="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 44.28.1 DYNA|AUTH)
 with ESMTPSA id R0b2a8v9LI7xM5P
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH
 bits, eq. 15360 bits RSA)) (Client did not present a certificate);
 Mon, 21 Oct 2019 20:07:59 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH 1/7] dt-bindings: gpu: pvrsgx: add initial bindings
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20191021172557.GB5610@atomide.com>
Date: Mon, 21 Oct 2019 20:07:59 +0200
Message-Id: <C6CD5A50-7F0A-4F56-ABB9-CAEDF7E47A5D@goldelico.com>
References: <cover.1571424390.git.hns@goldelico.com>
 <f0fb68dc7bc027e5e911721852f6bc6fa2d77a63.1571424390.git.hns@goldelico.com>
 <CAL_Jsq+obsTSU3iP1wm_3-FsAJ4Mxiz0NbMY1_h5NeFn67Sj+A@mail.gmail.com>
 <CEA29A3B-4116-4FE3-8E18-0C97353688DC@goldelico.com>
 <20191021172557.GB5610@atomide.com>
To: Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Mon, 21 Oct 2019 22:21:17 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1571681285; 
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=qQ6zV65O4QTCFnYrPW5AcyzqoTnREY7XPbgJ3s1IDW8=;
 b=gVEHS2e0QFpY7gU0j7fPMJyGfVk/inNUkCt5T6MiY3yredwC3HFwieXty5W8XgSoBQ
 JQzZ2bR/mpO9G15aVju7G2uxBwDLzLMojHCC/q+BbQY3vVTusEaTHD1e7Nwr1eNAK0cb
 jMyKl7HkB567RcEKj+qEmuVTK/0/AXgAgOI3IZMlB/eP7JTgOTl04oko5RHGl3X3FUxq
 0auPwOb3A+FqcGdEmqI8MPdwuJ0ZLNKNvcqMQnO7iUzYLasOHGYvz3z+OIm5gvWaNKmm
 uevqWvnzmaSiB8lubUZLjiqYbomMWFxcCIfuQL72nMn1IK+hdTGi6Qb6WqwTQvIc7W4f
 GpQg==
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

Cj4gQW0gMjEuMTAuMjAxOSB1bSAxOToyNSBzY2hyaWViIFRvbnkgTGluZGdyZW4gPHRvbnlAYXRv
bWlkZS5jb20+Ogo+IAo+ICogSC4gTmlrb2xhdXMgU2NoYWxsZXIgPGhuc0Bnb2xkZWxpY28uY29t
PiBbMTkxMDIxIDE1OjQ2XToKPj4+IEFtIDIxLjEwLjIwMTkgdW0gMTc6MDcgc2NocmllYiBSb2Ig
SGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPjoKPj4+IE9uIEZyaSwgT2N0IDE4LCAyMDE5IGF0
IDE6NDYgUE0gSC4gTmlrb2xhdXMgU2NoYWxsZXIgPGhuc0Bnb2xkZWxpY28uY29tPiB3cm90ZToK
Pj4+PiArT3B0aW9uYWwgcHJvcGVydGllczoKPj4+PiArLSB0aW1lcjogICAgICAgdGhlIHRpbWVy
IHRvIGJlIHVzZWQgYnkgdGhlIGRyaXZlci4KPj4+IAo+Pj4gTmVlZHMgYSBiZXR0ZXIgZGVzY3Jp
cHRpb24gYW5kIHZlbmRvciBwcmVmaXggYXQgbGVhc3QuCj4+IAo+PiBJIGFtIG5vdCB5ZXQgc3Vy
ZSBpZiBpdCBpcyB2ZW5kb3Igc3BlY2lmaWMgb3IgaWYgYWxsCj4+IFNHWCBpbXBsZW1lbnRhdGlv
bnMgbmVlZCBzb21lIHRpbWVyLgo+PiAKPj4+IAo+Pj4gV2h5IGlzIHRoaXMgbmVlZGVkIHJhdGhl
ciB0aGFuIHVzaW5nIHRoZSBPUydzIHRpbWVycz8KPj4gCj4+IEJlY2F1c2Ugbm9ib2R5IHVuZGVy
c3RhbmRzIHRoZSBjdXJyZW50IChvdXQgb2YgdHJlZSBhbmQKPj4gcGxhbm5lZCBmb3Igc3RhZ2lu
ZykgZHJpdmVyIHdlbGwgZW5vdWdoIHdoYXQgdGhlIHRpbWVyCj4+IGlzIGRvaW5nLiBJdCBpcyBj
dXJyZW50bHkgaGFyZCBjb2RlZCB0aGF0IHNvbWUgb21hcCByZWZlcgo+PiB0byB0aW1lcjcgYW5k
IG90aGVycyB1c2UgdGltZXIxMS4KPiAKPiBKdXN0IGNvbmZpZ3VyZSBpdCBpbiB0aGUgZHJpdmVy
IGJhc2VkIG9uIHRoZSBjb21wYXRpYmxlCj4gdmFsdWUgdG8ga2VlcCBpdCBvdXQgb2YgdGhlIGR0
cy4gSXQncyBiZXN0IHRvIHN0aWNrIHRvCj4gc3RhbmRhcmQgYmluZGluZ3MuCgpJTUhPIGxlYWRz
IHRvIHVnbHkgY29kZS4uLiBTaW5jZSB0aGUgdGltZXIgaXMgbm90IHBhcnQgb2YKdGhlIFNHWCBJ
UFIgbW9kdWxlIGJ1dCBvbmUgb2YgdGhlIE9NQVAgdGltZXJzIGl0IGlzIHNvcnQKb2YgaGFyZHdh
cmUgY29ubmVjdGlvbiB0aGF0IGNhbiBiZSBjaG9zZW4gYSBsaXR0bGUgYXJiaXRyYXJpbHkuCgpU
aGlzIGlzIHRoZSBtYWluIHJlYXNvbiB3aHkgSSB0aGluayBhZGRpbmcgaXQgdG8gYSBkZXZpY2Ug
dHJlZQpzb3VyY2Ugc28gdGhhdCBhIGJvYXJkIHRoYXQgcmVhbGx5IHJlcXVpcmVzIHRvIHVzZSBh
IHRpbWVyCmZvciBhIGRpZmZlcmVudCBwdXJwb3NlLCBjYW4gcmVhc3NpZ24gaXQuIFRoaXMgaXMg
bm90IHBvc3NpYmxlCmlmIHdlIGhhcmQtY29kZSB0aGF0IGludG8gdGhlIGRyaXZlciBieSBzY2Fu
bmluZyBmb3IKY29tcGF0aWJsZS4gSW4gdGhhdCBjYXNlIHRoZSBkcml2ZXIgbXVzdCBjaGVjayBi
b2FyZCBjb21wYXRpYmxlCm5hbWVzLi4uCgpCdXQgaWYgd2UgZ2FpbiBhIGJldHRlciB1bmRlcnN0
YW5kaW5nIG9mIGl0cyByb2xlIGluIHRoZSBkcml2ZXIKKGRvZXMgaXQgcmVhbGx5IG5lZWQgYSBk
ZWRpY2F0ZWQgdGltZXIgYW5kIGZvciB3aGF0IGFuZCB3aGljaApwcm9wZXJ0aWVzIHRoZSB0aW1l
ciBtdXN0IGhhdmUpIHdlIGNhbiBwcm9iYWJseSByZXBsYWNlIGl0LgoKPiAKPj4+PiArLSBpbWcs
Y29yZXM6ICAgbnVtYmVyIG9mIGNvcmVzLiBEZWZhdWx0cyB0byA8MT4uCj4+PiAKPj4+IE5vdCBk
aXNjb3ZlcmFibGU/Cj4+IAo+PiBOb3Qgc3VyZSBpZiBpdCBpcy4gVGhpcyBpcyBwcm9iYWJseSBh
dmFpbGFibGUgaW4gdW5kb2N1bWVudGVkCj4+IHJlZ2lzdGVycyBvZiB0aGUgc2d4Lgo+IAo+IFRo
aXMgdG9vLCBhbmQgd2hhdGV2ZXIgbm9uLXN0YW5kcmQgb3RoZXIgcHJvcGVyaXRpZXMKPiB5b3Ug
bWlnaHQgaGF2ZS4KCkhlcmUgaXQgaXMgYSBmZWF0dXJlIG9mIHRoZSBTR1ggSVBSIG9mIHRoZSBT
b0MsIGkuZS4KZGVzY3JpYmVzIHRoYXQgdGhlIGhhcmR3YXJlIGhhcyBvbmUgb3IgdHdvIGNvcmVz
LgoKQlIsCk5Ja29sYXVzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
