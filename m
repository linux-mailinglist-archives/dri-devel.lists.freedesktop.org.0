Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 406ABED41F
	for <lists+dri-devel@lfdr.de>; Sun,  3 Nov 2019 19:15:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C0226E037;
	Sun,  3 Nov 2019 18:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 803B06E037
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Nov 2019 18:15:52 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 9D73D5C2BE3;
 Sun,  3 Nov 2019 19:15:50 +0100 (CET)
MIME-Version: 1.0
Date: Sun, 03 Nov 2019 19:15:49 +0100
From: Stefan Agner <stefan@agner.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: Overlay support in the i.MX7 display
In-Reply-To: <20191101084318.GA8428@pendragon.ideasonboard.com>
References: <20191101084318.GA8428@pendragon.ideasonboard.com>
Message-ID: <67057f1082886726268f346f49c23051@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1572804950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S+/UABCDinadtw63ATNaDHAFZFEIeKGjqQ5seYW2+5Y=;
 b=rkdAdML4+/Vshtn3Z9jw+7BAgb386KpDQ88j5k2dy+hPwteBW0OzFOKJp53xuYqM+8Prel
 dQ03nv0vgmnJRv234NbPdwMew6kIHnRCrb7XmpvjoroZb95pi66AdYxJHlfkcs2V8djAgU
 8r9UFsWDEqOGz8UUKzIGv37FwDQITuA=
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
Cc: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwKCk9uIDIwMTktMTEtMDEgMDk6NDMsIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6
Cj4gSGVsbG8sCj4gCj4gSSdtIGxvb2tpbmcgYXQgdGhlIGF2YWlsYWJsZSBvcHRpb25zIHRvIHN1
cHBvcnQgb3ZlcmxheXMgaW4gdGhlIGRpc3BsYXkKPiBwaXBlbGluZSBvZiB0aGUgaS5NWDcuIFRo
ZSBMQ0RJRiBpdHNlbGYgdW5mb3J0dW5hbHRleSBkb2Vzbid0IHN1cHBvcnQKPiBvdmVybGF5cywg
dGhlIGZlYXR1cmUgYmVpbmcgaW1wbGVtZW50ZWQgaW4gdGhlIFBYUC4gQSBkcml2ZXIgZm9yIHRo
ZSBQWFAKPiBpcyBhdmFpbGFibGUgYnV0IG9ubHkgc3VwcG9ydHMgb2xkZXIgU29DcyB3aG9zZSBQ
WFAgZG9lc24ndCBzdXBwb3J0Cj4gb3ZlcmxheXMuIFRoaXMgZHJpdmVyIGlzIGltcGxlbWVudGVk
IGFzIGEgVjRMMiBtZW0ybWVtIGRyaXZlciwgd2hpY2gKPiBtYWtlcyBzdXBwb3J0IG9mIGFkZGl0
aW9uYWwgaW5wdXQgY2hhbm5lbHMgaW1wb3NzaWJsZS4KClRoYW5rcyBmb3IgYnJpbmdpbmcgdGhp
cyB1cCwgaXQgaXMgYSB0b3BpYyBJIGhhdmUgd29uZGVyZWQgdG9vOgpJbnRlcmFjdGlvbiBiZXR3
ZWVuIFBYUCBhbmQgbXhzZmIuCgpJIGFtIG5vdCB2ZXJ5IGZhbWlsaWFyIHdpdGggdGhlIFY0TDIg
c3Vic3lzdGVtIHNvIHRha2UgbXkgb3BpbmlvbnMgd2l0aAphIGdyYWluIG9mIHNhbHQuCgo+IAo+
IEhlcmUgYXJlIHRoZSBvcHRpb25zIEkgY2FuIGVudmlzaW9uOgo+IAo+IC0gRXh0ZW5kIHRoZSBl
eGlzdGluZyBQWFAgZHJpdmVyIHRvIHN1cHBvcnQgbXVsdGlwbGUgY2hhbm5lbHMuIFRoaXMgaXMK
PiAgIHRlY2huaWNhbGx5IGZlYXNpYmxlLCBidXQgd2lsbCByZXF1aXJlIG1vdmluZyBhd2F5IGZy
b20gdGhlIFY0TDIKPiAgIG1lbTJtZW0gZnJhbWV3b3JrLCB3aGljaCB3b3VsZCBicmVhayB1c2Vy
c3BhY2UuIEkgZG9uJ3QgdGhpbmsgdGhpcwo+ICAgcGF0aCBjb3VsZCBsZWFkIGFueXdoZXJlLgo+
IAo+IC0gV3JpdGUgYSBuZXcgUFhQIGRyaXZlciBmb3IgdGhlIGkuTVg3LCBzdGlsbCB1c2luZyBW
NEwyLCBidXQgd2l0aAo+ICAgbXVsdGlwbGUgdmlkZW8gbm9kZXMuIFRoaXMgd291bGQgYWxsb3cg
YmxlbmRpbmcgbXVsdGlwbGUgbGF5ZXJzLCBidXQKPiAgIHdvdWxkIHJlcXVpcmUgd3JpdGluZyB0
aGUgb3V0cHV0IHRvIG1lbW9yeSwgd2hpbGUgdGhlIFBYUCBoYXMgc3VwcG9ydAo+ICAgZm9yIGRp
cmVjdCBjb25uZWN0aW9ucyB0byB0aGUgTENESUYgKHRocm91Z2ggc21hbGwgU1JBTSBidWZmZXJz
KS4KPiAgIFBlcmZvcm1hbmNlcyB3b3VsZCB0aHVzIGJlIHN1Ym9wdGltYWwuIFRoZSBBUEkgd291
bGQgYWxzbyBiZSBhd2t3YXJkLAo+ICAgYXMgdXNpbmcgdGhlIFBYUCBmb3IgZGlzcGxheSB3b3Vs
ZCByZXF1aXJlIHVzYWdlIG9mIFY0TDIgaW4KPiAgIGFwcGxpY2F0aW9ucy4KClNvIHRoZSB2aWRl
byBub2RlcyB3b3VsZCBiZSBzaW5rcz8gSSB3b3VsZCBleHBlY3Qgb3ZlcmxheXMgdG8gYmUgdXNh
YmxlCnRocm91Z2ggS01TLCBJIGd1ZXNzIHRoYXQgd291bGQgdGhlbiBub3Qgd29yaywgY29ycmVj
dD8KCj4gCj4gLSBFeHRlbmQgdGhlIG14c2ZiIGRyaXZlciB3aXRoIFBYUCBzdXBwb3J0LCBhbmQg
ZXhwb3NlIHRoZSBQWFAgaW5wdXRzIGFzCj4gICBLTVMgcGxhbmVzLiBUaGUgUFhQIHdvdWxkIG9u
bHkgYmUgdXNlZCB3aGVuIGF2YWlsYWJsZSwgYW5kIHdvdWxkIGJlCj4gICB0cmFuc3BhcmVudCB0
byBhcHBsaWNhdGlvbnMuIFRoaXMgd291bGQgaG93ZXZlciBwcmV2ZW50IHVzaW5nIGl0Cj4gICBz
ZXBhcmF0ZWx5IGZyb20gdGhlIGRpc3BsYXkgKHRvIHBlcmZvcm0gbXVsdGktcGFzcyBhbHBoYSBi
bGVuZGluZyBmb3IKPiAgIGluc3RhbmNlKS4KCktNUyBwbGFuZXMgYXJlIHdlbGwgZGVmaW5lZCBh
bmQgYXJlIHdlbGwgaW50ZWdyYXRlZCB3aXRoIHRoZSBLTVMgQVBJLCBzbwpJIHByZWZlciB0aGlz
IG9wdGlvbi4gQnV0IGlzIHRoaXMgY29tcGF0aWJsZSB3aXRoIHRoZSBjdXJyZW50bHkKc3VwcG9y
dGVkIHZpZGVvIHVzZS1jYXNlPyBFLmcuIGNvdWxkIHdlIG1ha2UgUFhQIGF2YWlsYWJsZSB0aHJv
dWdoIFY0TDIKYW5kIHRocm91Z2ggRFJNL214c2ZiPwoKTm90IHN1cmUgd2hhdCB5b3VyIHVzZSBj
YXNlIGlzIGV4YWN0bHksIGJ1dCB3aGVuIHBsYXlpbmcgYSB2aWRlbyBJCndvbmRlciB3aGVyZSBp
cyB0aGUgaGlnaGVyIHZhbHVlIHVzaW5nIFBYUDogQ29sb3IgY29udmVyc2lvbiBhbmQgc2NhbGlu
ZwpvciBjb21wb3NpdGluZy4uLj8gSSB3b3VsZCBleHBlY3QgaGlnaGVyIHZhbHVlIGluIHRoZSBm
b3JtZXIgdXNlIGNhc2UuCgo+IAo+IFdoYXQgd291bGQgYmUgdGhlIGJlc3Qgb3B0aW9uIGdvaW5n
IGZvcndhcmQgPyBXb3VsZCBhbnkgb2YgeW91LCBieSBhbnkKPiBjaGFuY2UsIGhhdmUgYWxyZWFk
eSBzdGFydGVkIHdvcmsgaW4gdGhpcyBhcmVhID8KCkkgaGF2ZSBub3Qgd29ya2VkIGluIHRoYXQg
YXJlYSwgc28gZmVlbCBmcmVlIQoKLS0KU3RlZmFuCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
