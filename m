Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 494171228F6
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 11:33:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA2E66E994;
	Tue, 17 Dec 2019 10:32:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A211E6E4B6
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 10:47:15 +0000 (UTC)
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 681B6E0017;
 Mon, 16 Dec 2019 10:47:11 +0000 (UTC)
Date: Mon, 16 Dec 2019 11:47:09 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 2/2] drm/panel: simple: Add Satoz SAT050AT40H12R2 panel
 support
Message-ID: <20191216114709.0fca7240@xps13>
In-Reply-To: <20191214100911.GA2967@ravnborg.org>
References: <20191213182325.27030-1-miquel.raynal@bootlin.com>
 <20191213182325.27030-2-miquel.raynal@bootlin.com>
 <20191214100911.GA2967@ravnborg.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 17 Dec 2019 10:31:56 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLAoKU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPiB3cm90ZSBvbiBTYXQsIDE0
IERlYyAyMDE5IDExOjA5OjExCiswMTAwOgoKPiBIaSBNaXF1ZWwuCj4gCj4gT24gRnJpLCBEZWMg
MTMsIDIwMTkgYXQgMDc6MjM6MjVQTSArMDEwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IEFk
ZCBzdXBwb3J0IGZvciB0aGUgU2F0b3ogU0FUMDUwQVQ0MEgxMlIyIFJHQiBwYW5lbC4gIAo+IAo+
IEdvb2dsZSBmYWlsZWQgdG8gZmluZCB0aGlzIGRpc3BsYXkgLSBkbyB5b3UgaGF2ZSBhbnkgcG9p
bnRlcnMgdG8KPiBkYXRhc2hlZXQ/Cj4gCj4gVGhpcyB0dXJuZWQgdXA6IFNBVDA1MEFUNDBIMTJC
Mgo+IEJ1dCBJIGZhaWxlZCB0byBmaW5kIGFueSBkYXRhIHNoZWV0LgoKSSBjb3VsZCBub3QgZmlu
ZCB0aGUgZGF0YXNoZWV0IG15c2VsZiBvbiB0aGUgSW50ZXJuZXQsIEkgZm91bmQgb3RoZXIKZGF0
YXNoZWV0cyBvZiBvdGhlciBwYW5lbHMgZnJvbSB0aGUgc2FtZSB2ZW5kb3IgdGhvdWdoLgoKSSBj
b25maXJtIEkgYW0gdGFsa2luZyBhYm91dCB0aGUgUjIgcGFja2FnZSAobm90IEIyIHlvdXIgZmlu
ZCkuCgo+IAo+IEkgd29uZGVyIGlmIHRoZXJlIGlzIGFueSB0eXBpY2FsLCBtaW4sIG1heCB0aW1p
bmdzIC0gc28gd2UgY291bGQgdXNlCj4gZGlzcGxheV90aW1pbmcgcmF0aGVyIHRoYW4gZGlzcGxh
eV9tb2RlLgoKWWVzIHRoZXJlIGFyZSBtaW4vdHlwL21heCB0aW1pbmdzIGluIHRoZSBkYXRhc2hl
ZXQsIEkgZGlkbid0IGtub3cgYWJvdXQKZGlzcGxheV9tb2RlIChjb3BpZWQvcGFzdGVkIGFub3Ro
ZXIgcmFuZG9tIHRpbWluZyBzdHJ1Y3R1cmUgYW5kIGFkYXB0ZWQKaXQpLiBJIHdpbGwgdHJ5IHRv
IGFkYXB0LgoKPiAKPiBCZWZvcmUgdGhlIGNvbXBhdGlibGUgaXMgZG9jdW1lbnRlZCB0aGUgcGF0
Y2ggd2lsbCBub3QgYmUgYXBwbGllZC4KPiBTbyB5b3UgbmVlZCB0byBzdWJtaXQgYSBiaW5kaW5n
IGRvY3VtZW50IHRvbywKPiB3aGljaCBtdXN0IGJlIGluIG1ldGEtc2NoZW1hIHN5bnRheCAoLnlh
bWwpLgoKQW55IHJlYXNvbiB0byBjcmVhdGUgb25lIChhbG1vc3QgZW1wdHkpIGZpbGUgYnkgY29t
cGF0aWJsZT8gQXMKY29tcGFyaXNvbiwgc2ltcGxlIEkyQy9TUEkgZGV2aWNlcyB3aXRoIG5vIHNp
bmd1bGFyaXRpZXMgYXJlCmxpc3RlZCB0aGVyZToKRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3RyaXZpYWwtZGV2aWNlcy55YW1sCgpJJ2xsIGNyZWF0ZSBhIGJpbmRpbmdzIGZpbGUg
Zm9yIHRoaXMgcGFuZWwgdGhvdWdoLgoKVGhhbmtzLApNaXF1w6hsCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
