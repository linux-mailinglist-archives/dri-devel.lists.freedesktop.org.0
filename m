Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CF2642AD
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 09:25:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F96C89B84;
	Wed, 10 Jul 2019 07:25:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1755 seconds by postgrey-1.36 at gabe;
 Wed, 10 Jul 2019 04:10:42 UTC
Received: from mx1.supremebox.com (mx1.supremebox.com [198.23.53.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E531D89A4A
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 04:10:42 +0000 (UTC)
Received: from 184-96-235-43.hlrn.qwest.net ([184.96.235.43]
 helo=[192.168.0.12]) by mx1.supremebox.com with esmtpa (Exim 4.89)
 (envelope-from <opensource@jilayne.com>)
 id 1hl3VT-0006mr-KH; Wed, 10 Jul 2019 03:42:59 +0000
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH v2] gpu/drm_memory: fix a few warnings
From: J Lovejoy <opensource@jilayne.com>
In-Reply-To: <alpine.DEB.2.21.1907082150170.1961@nanos.tec.linutronix.de>
Date: Tue, 9 Jul 2019 21:42:57 -0600
Message-Id: <472DABBB-81E5-4E79-9910-BA3C26936B40@jilayne.com>
References: <1562609151-7283-1-git-send-email-cai@lca.pw>
 <CAKb7UvhoW2F5LSf4B=vJhLykPCme_ixwbUBup_sBXjoQa72Fzw@mail.gmail.com>
 <1562614919.8510.9.camel@lca.pw>
 <alpine.DEB.2.21.1907082150170.1961@nanos.tec.linutronix.de>
To: Thomas Gleixner <tglx@linutronix.de>
X-Mailer: Apple Mail (2.3445.104.11)
X-Sender-Ident-agJab5osgicCis: opensource@jilayne.com
X-Mailman-Approved-At: Wed, 10 Jul 2019 07:25:20 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=jilayne.com
 ; s=default; h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:
 In-Reply-To:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=AYOKcfGVOYIwtnBpJskuZTTWudypmg8tOCQ67JADO40=; b=dJM475y+qQShcOTAhRStkp5NwL
 jhmtFFzuzeFwyduNeAEOLv/dvMSsoqagk34N8LSdXbQIQHoS9BIRso2BrhMavjMFb1+wfdg8u3XDH
 RfqC+cGxeXuZM1RwzbbBRwypWa0uCes4fBH0BpjZ2UkNp+Jv5B90LBwMIWlsQDt/n7m8=;
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
Cc: Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, rfontana@redhat.com,
 Qian Cai <cai@lca.pw>, Greg KH <gregkh@linuxfoundation.org>, joe@perches.com,
 linux-spdx@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cgo+IE9uIEp1bCA4LCAyMDE5LCBhdCAxOjU3IFBNLCBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGlu
dXRyb25peC5kZT4gd3JvdGU6Cj4gCj4gT24gTW9uLCA4IEp1bCAyMDE5LCBRaWFuIENhaSB3cm90
ZToKPj4gT24gTW9uLCAyMDE5LTA3LTA4IGF0IDE1OjIxIC0wNDAwLCBJbGlhIE1pcmtpbiB3cm90
ZToKPj4+PiAtLyoqCj4+Pj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBNSVQKPj4+PiAr
LyoKPj4+PiAgICogXGZpbGUgZHJtX21lbW9yeS5jCj4+Pj4gICAqIE1lbW9yeSBtYW5hZ2VtZW50
IHdyYXBwZXJzIGZvciBEUk0KPj4+PiAgICoKPj4+PiBAQCAtMTIsMjUgKzEzLDYgQEAKPj4+PiAg
ICogQ29weXJpZ2h0IDE5OTkgUHJlY2lzaW9uIEluc2lnaHQsIEluYy4sIENlZGFyIFBhcmssIFRl
eGFzLgo+Pj4+ICAgKiBDb3B5cmlnaHQgMjAwMCBWQSBMaW51eCBTeXN0ZW1zLCBJbmMuLCBTdW5u
eXZhbGUsIENhbGlmb3JuaWEuCj4+Pj4gICAqIEFsbCBSaWdodHMgUmVzZXJ2ZWQuCj4+Pj4gLSAq
Cj4+Pj4gLSAqIFBlcm1pc3Npb24gaXMgaGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0
byBhbnkgcGVyc29uIG9idGFpbmluZyBhCj4+Pj4gLSAqIGNvcHkgb2YgdGhpcyBzb2Z0d2FyZSBh
bmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUKPj4+PiAiU29mdHdhcmUiKSwK
Pj4+PiAtICogdG8gZGVhbCBpbiB0aGUgU29mdHdhcmUgd2l0aG91dCByZXN0cmljdGlvbiwgaW5j
bHVkaW5nIHdpdGhvdXQKPj4+PiBsaW1pdGF0aW9uCj4+Pj4gLSAqIHRoZSByaWdodHMgdG8gdXNl
LCBjb3B5LCBtb2RpZnksIG1lcmdlLCBwdWJsaXNoLCBkaXN0cmlidXRlLCBzdWJsaWNlbnNlLAo+
Pj4+IC0gKiBhbmQvb3Igc2VsbCBjb3BpZXMgb2YgdGhlIFNvZnR3YXJlLCBhbmQgdG8gcGVybWl0
IHBlcnNvbnMgdG8gd2hvbSB0aGUKPj4+PiAtICogU29mdHdhcmUgaXMgZnVybmlzaGVkIHRvIGRv
IHNvLCBzdWJqZWN0IHRvIHRoZSBmb2xsb3dpbmcgY29uZGl0aW9uczoKPj4+PiAtICoKPj4+PiAt
ICogVGhlIGFib3ZlIGNvcHlyaWdodCBub3RpY2UgYW5kIHRoaXMgcGVybWlzc2lvbiBub3RpY2Ug
KGluY2x1ZGluZyB0aGUKPj4+PiBuZXh0Cj4+Pj4gLSAqIHBhcmFncmFwaCkgc2hhbGwgYmUgaW5j
bHVkZWQgaW4gYWxsIGNvcGllcyBvciBzdWJzdGFudGlhbCBwb3J0aW9ucyBvZgo+Pj4+IHRoZQo+
Pj4+IC0gKiBTb2Z0d2FyZS4KPj4+PiAtICoKPj4+PiAtICogVEhFIFNPRlRXQVJFIElTIFBST1ZJ
REVEICJBUyBJUyIsIFdJVEhPVVQgV0FSUkFOVFkgT0YgQU5ZIEtJTkQsIEVYUFJFU1MKPj4+PiBP
Ugo+Pj4+IC0gKiBJTVBMSUVELCBJTkNMVURJTkcgQlVUIE5PVCBMSU1JVEVEIFRPIFRIRSBXQVJS
QU5USUVTIE9GIE1FUkNIQU5UQUJJTElUWSwKPj4+PiAtICogRklUTkVTUyBGT1IgQSBQQVJUSUNV
TEFSIFBVUlBPU0UgQU5EIE5PTklORlJJTkdFTUVOVC4gIElOIE5PIEVWRU5UIFNIQUxMCj4+Pj4g
LSAqIFZBIExJTlVYIFNZU1RFTVMgQU5EL09SIElUUyBTVVBQTElFUlMgQkUgTElBQkxFIEZPUiBB
TlkgQ0xBSU0sIERBTUFHRVMKPj4+PiBPUgo+Pj4gCj4+PiBUaGlzIHRhbGtzIGFib3V0IFZBIExp
bnV4IFN5c3RlbXMgYW5kL29yIGl0cyBzdXBwbGllcnMsIHdoaWxlIHRoZSBNSVQKPj4+IGxpY2Vu
Y2UgdGFsa3MgYWJvdXQgYXV0aG9ycyBvciBjb3B5cmlnaHQgaG9sZGVycy4KPiAKPiBUaGF0J3Mg
bG9va3MgbGlrYSBhIHZhbGlkIHN1YnN0aXR1dGlvbiBhbmQgZG9lcyBub3QgY2hhbmdlIHRoZSBt
ZWFuaW5nIG9mCj4gdGhlIGxpY2Vuc2UsIEFGQUlDVC4gCgpBcyBvZiB0aGUgMy42IHJlbGVhc2Ug
b2YgdGhlIFNQRFggTGljZW5zZSBMaXN0LCB3ZSB3aWxsIGhhdmUgYWRkZWQgbWFya3VwIHRvIGRl
bm90ZSB0aGF0IHRoZSBuYW1lIGluIHRoZSBkaXNjbGFpbWVyIGNhbiBiZSBjaGFuZ2VkIGFuZCBz
dGlsbCBjb25zaWRlcmVkIGEgbWF0Y2guIFRoaXMgaXMgYSBjb21tb24gc2NlbmFyaW8gaW4gb3Ro
ZXIgbGljZW5zZXMgKGxpa2UgdGhlIEJTRCBmYW1pbHkpLCBidXQgSSBkb27igJl0IHRoaW5rIHdl
4oCZZCBjb21lIGFjcm9zcyBpdCB1bnRpbCB0aGUgd29yayBvbiB0aGUga2VybmVsIGFuZCBhZGRp
bmcgU1BEWCBpZGVudGlmaWVycy4gU28sIHllcywgTUlUIHdvdWxkIGJlIHRoZSBjb3JyZWN0IFNQ
RFggaWRlbnRpZmllciBoZXJlIGFzIG9mIDMuNiAod2hpY2ggd2lsbCBiZSBwb3N0ZWQgaW4gYSBm
ZXcgZGF5cykuCgpGb3IgcmVmZXJlbmNlLCB0aGUgU1BEWCBMaWNlbnNlIExpc3QgbWF0Y2hpbmcg
Z3VpZGVsaW5lcyBjYW4gYmUgZm91bmQgaGVyZTogaHR0cHM6Ly9zcGR4Lm9yZy9zcGR4LWxpY2Vu
c2UtbGlzdC9tYXRjaGluZy1ndWlkZWxpbmVzIC0gc2VlIEd1aWRlbGluZSAyLjEuMyBzcGVjaWZp
Y2FsbHkuIFJlcGxhY2VhYmxlIHRleHQgaXMgbWFya2VkIHVwIGluIHRoZSBtYXN0ZXIgZmlsZXMg
dGhhdCBjb21wcmlzZSB0aGUgU1BEWCBMaWNlbnNlIExpc3QgYWNjb3JkaW5nIHRoZSB0aGUgWE1M
IHNjaGVtYSBhbmQgdGhlbiBkaXNwbGF5ZWQgaW4gY29sb3IgY29kZWQgdGV4dCBvbiB0aGUgd2Vi
c2l0ZSBwYWdlcyAoc2VlLCBmb3IgZXhhbXBsZSwgQlNELTMtQ2xhdXNlIC0gaHR0cHM6Ly9zcGR4
Lm9yZy9saWNlbnNlcy9CU0QtMy1DbGF1c2UuaHRtbAoKT2YgY291cnNlLCBpZiBhbnlvbmUgZmlu
ZHMgYW55IG90aGVyIGxpY2Vuc2UgdGV4dCB0aGF0IGRlc2VydmVzIHRoaXMga2luZCBvZiBhY2Nv
bW1vZGF0aW9uLCB5b3UgY2FuIGFsd2F5cyBtYWtlIGEgUFIgaGVyZTogaHR0cHM6Ly9naXRodWIu
Y29tL3NwZHgvbGljZW5zZS1saXN0LVhNTCA6KQoKdGhhbmtzLApKaWxheW5lClNQRFggbGVnYWwg
dGVhbSBjby1sZWFkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
