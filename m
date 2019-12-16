Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C301228CC
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 11:32:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CCF66E97F;
	Tue, 17 Dec 2019 10:31:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74A4A6E4AE
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 10:53:37 +0000 (UTC)
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id EB18C24000F;
 Mon, 16 Dec 2019 10:53:32 +0000 (UTC)
Date: Mon, 16 Dec 2019 11:53:31 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] drm/panel: simple: Support reset GPIOs
Message-ID: <20191216115331.5c6047f7@xps13>
In-Reply-To: <20191214102354.GB2967@ravnborg.org>
References: <20191213181325.26228-1-miquel.raynal@bootlin.com>
 <20191214102354.GB2967@ravnborg.org>
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLAoKU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPiB3cm90ZSBvbiBTYXQsIDE0
IERlYyAyMDE5IDExOjIzOjU0CiswMTAwOgoKPiBIaSBNaXF1ZWwuCj4gCj4gT24gRnJpLCBEZWMg
MTMsIDIwMTkgYXQgMDc6MTM6MjVQTSArMDEwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IFRo
ZSBwYW5lbCBjb21tb24gYmluZGluZ3MgcHJvdmlkZSBhIGdwaW9zLXJlc2V0IHByb3BlcnR5IHdo
aWNoIGlzCj4gPiBhY3RpdmUgbG93IGJ5IGRlZmF1bHQuIExldCdzIHN1cHBvcnQgaXQgaW4gdGhl
IHNpbXBsZSBkcml2ZXIuCj4gPiAKPiA+IERlLWFzc2VydGluZyB0aGUgcmVzZXQgcGluIGltcGxp
ZXMgYSBwaHlzaWNhbCBoaWdoLCB3aGljaCBpbiB0dXJucyBpcwo+ID4gYSBsb2dpYyBsb3cuCj4g
PiAKPiA+IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxp
bi5jb20+ICAKPiAKPiBDb2RlIGxvb2tzIGZpbmUgLSBidXQgSSBmYWlsIHRvIHNlZSB3aHkgc2lt
cGxlIHBhbmVscyB3b3VsZCByZXF1aXJlIGEKPiByZXNldCBwaW4uCj4gCj4gRG8geW91IGhhdmUg
YW55IHNpbXBsZSBwYW5lbHMgdGhhdCByZXF1aXJlcyB0aGlzLCBvciBkaWQgeW91IGFkZCBpdAo+
IGJlY2F1c2UgeW91IHNhdyBpdCBpbiB0aGUgcGFuZWwtY29tbW9uLnlhbWwgZmlsZT8KCk15IGhh
cmR3YXJlIGlzOgoKTFZEUyBJUCA8LS0tLS0tLS0tLT4gTFZEUyB0byBSR0IgYnJpZGdlIDwtLS0t
LS0tLS0tLS0+IFBhbmVsCgpXaGlsZSB0aGVyZSBpcyBhIHNpbXBsZSAiUkdCIHRvIExWRFMiIGJy
aWRnZSBkcml2ZXIsIHRoZXJlIGlzIG5vbmUKZG9pbmcgdGhlIHdvcmsgdGhlIG90aGVyIHdheSBh
cm91bmQuIEluIG15IGNhc2UsIHRoZSBicmlkZ2UgaGFzIGEgcmVzZXQKcGluLgoKQXMgdW50aWwg
bm93IHRoZXJlIGlzIG5vIHdheSB0byByZXByZXNlbnQgdGhlICJMVkRTIHRvIFJHQiIgYnJpZGdl
IGFuZApiZWNhdXNlIHRoZSBiaW5kaW5ncyBhbHJlYWR5IGRvY3VtZW50IHN1Y2ggcmVzZXQgcGlu
LCBJIGRlY2lkZWQgdG8gYWRkCnN1cHBvcnQgZm9yIGl0IGluIHRoZSBzaW1wbGUgcGFuZWwgZHJp
dmVyLgoKVGhhbmtzLApNaXF1w6hsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
