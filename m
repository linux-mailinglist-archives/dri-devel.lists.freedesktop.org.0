Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5562FB0C
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2019 13:40:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D0096E32C;
	Thu, 30 May 2019 11:39:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A086E095;
 Wed, 29 May 2019 19:30:48 +0000 (UTC)
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 178A03E80A;
 Wed, 29 May 2019 19:30:47 +0000 (UTC)
Date: Wed, 29 May 2019 15:30:46 -0400
From: Brian Masney <masneyb@onstation.org>
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [Freedreno] [PATCH RFC v2 0/6] ARM: qcom: initial Nexus 5
 display support
Message-ID: <20190529193046.GA19876@basecamp>
References: <20190509020352.14282-1-masneyb@onstation.org>
 <CACRpkda-7+ggoeMD9=erPX09OWteX0bt+qP60_Yv6=4XLqNDZQ@mail.gmail.com>
 <20190529011705.GA12977@basecamp>
 <CAOCk7NrRo2=0fPN_Sy1Bhhy+UV7U6uO5aV9uXZc8kc3VpSt71g@mail.gmail.com>
 <20190529013713.GA13245@basecamp>
 <CAOCk7NqfdNkRJkbJY70XWN-XvdtFJ0UVn3_9rbgAsNCdR7q5PQ@mail.gmail.com>
 <20190529024648.GA13436@basecamp>
 <CAOCk7NpC93ACr4jFm7SBOKSvFJSDhq2byX6BAYPX29BuYEkWnQ@mail.gmail.com>
 <20190529102822.GA15027@basecamp>
 <CAOCk7NoVknZOkFcki9c8hq2vkqLhBSfum05T9Srq8mtJjAaLyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOCk7NoVknZOkFcki9c8hq2vkqLhBSfum05T9Srq8mtJjAaLyQ@mail.gmail.com>
X-Mailman-Approved-At: Thu, 30 May 2019 11:39:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1559158247;
 bh=4hAGm9jsyCI3/b1K5x1cRkJ1u1uCXrMQWlcs3/4kggk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M+ksa92qE21lR6e9FRGoYaTcjW/5xYMh2O6q3svhEEVNnlww909FH3ozeFmK2mYX8
 q0OlKznqgdlYhJwRwZnqRlzVFquhcBzQeeiPNzMY3Oou0dqnRup+0sI8Pf84BNFKSw
 mNC/tiVgUSeZGfFmu+0kjBQfTQ+FsQmaMGqLGM4g=
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
Cc: Jonathan Marek <jonathan@marek.ca>, Dave Airlie <airlied@linux.ie>,
 MSM <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMjksIDIwMTkgYXQgMDg6NDE6MzFBTSAtMDYwMCwgSmVmZnJleSBIdWdvIHdy
b3RlOgo+IE9uIFdlZCwgTWF5IDI5LCAyMDE5IGF0IDQ6MjggQU0gQnJpYW4gTWFzbmV5IDxtYXNu
ZXliQG9uc3RhdGlvbi5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIFR1ZSwgTWF5IDI4LCAyMDE5IGF0
IDA4OjUzOjQ5UE0gLTA2MDAsIEplZmZyZXkgSHVnbyB3cm90ZToKPiA+ID4gT24gVHVlLCBNYXkg
MjgsIDIwMTkgYXQgODo0NiBQTSBCcmlhbiBNYXNuZXkgPG1hc25leWJAb25zdGF0aW9uLm9yZz4g
d3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBPbiBUdWUsIE1heSAyOCwgMjAxOSBhdCAwNzo0MjoxOVBN
IC0wNjAwLCBKZWZmcmV5IEh1Z28gd3JvdGU6Cj4gPiA+ID4gPiA+ID4gRG8geW91IGtub3cgaWYg
dGhlIG5leHVzIDUgaGFzIGEgdmlkZW8gb3IgY29tbWFuZCBtb2RlIHBhbmVsPyAgVGhlcmUKPiA+
ID4gPiA+ID4gPiBpcyBzb21lIGdsaXRjaHluZXNzIHdpdGggdmJsYW5rcyBhbmQgY29tbWFuZCBt
b2RlIHBhbmVscy4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gSXRzIGluIGNvbW1hbmQgbW9kZS4g
SSBrbm93IHRoaXMgYmVjYXVzZSBJIHNlZSB0d28gJ3BwIGRvbmUgdGltZSBvdXQnCj4gPiA+ID4g
PiA+IG1lc3NhZ2VzLCBldmVuIG9uIDQuMTcuIEJhc2VkIG9uIG15IHVuZGVyc3RhbmRpbmcsIHRo
ZSBwaW5nIHBvbmcgY29kZSBpcwo+ID4gPiA+ID4gPiBvbmx5IGFwcGxpY2FibGUgZm9yIGNvbW1h
bmQgbW9kZSBwYW5lbHMuCj4gPiA+ID4gPgo+ID4gPiA+ID4gQWN0dWFsbHksIHRoZSBwaW5nIHBv
bmcgZWxlbWVudCBleGlzdHMgaW4gYm90aCBtb2RlcywgYnV0ICdwcCBkb25lCj4gPiA+ID4gPiB0
aW1lIG91dCcgaXMgYSBnb29kIGluZGljYXRvciB0aGF0IGl0IGlzIGNvbW1hbmQgbW9kZS4KPiA+
ID4gPiA+Cj4gPiA+ID4gPiBBcmUgeW91IGFsc28gc2VlaW5nIHZibGFuayB0aW1lb3V0cz8KPiA+
ID4gPgo+ID4gPiA+IFllcywgaGVyZSdzIGEgc25pcHBldCBvZiB0aGUgZmlyc3Qgb25lLgo+ID4g
PiA+Cj4gPiA+ID4gWyAgICAyLjU1NjAxNF0gV0FSTklORzogQ1BVOiAwIFBJRDogNSBhdCBkcml2
ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYzoxNDI5IGRybV9hdG9taWNfaGVscGVyX3dh
aXRfZm9yX3ZibGFua3MucGFydC4xKzB4Mjg4LzB4MjkwCj4gPiA+ID4gWyAgICAyLjU1NjAyMF0g
W0NSVEM6NDk6Y3J0Yy0wXSB2Ymxhbmsgd2FpdCB0aW1lZCBvdXQKPiA+ID4gPiBbICAgIDIuNTU2
MDIzXSBNb2R1bGVzIGxpbmtlZCBpbjoKPiA+ID4gPiBbICAgIDIuNTU2MDM0XSBDUFU6IDAgUElE
OiA1IENvbW06IGt3b3JrZXIvMDowIE5vdCB0YWludGVkIDUuMi4wLXJjMS0wMDE3OC1nNzJjM2Mx
ZmQ1Zjg2LWRpcnR5ICM0MjYKPiA+ID4gPiBbICAgIDIuNTU2MDM4XSBIYXJkd2FyZSBuYW1lOiBH
ZW5lcmljIERUIGJhc2VkIHN5c3RlbQo+ID4gPiA+IFsgICAgMi41NTYwNTZdIFdvcmtxdWV1ZTog
ZXZlbnRzIGRlZmVycmVkX3Byb2JlX3dvcmtfZnVuYwo+ID4gPiA+IC4uLgo+ID4gPiA+Cj4gPiA+
ID4gPiBEbyB5b3UgaGF2ZSBidXN5Ym94Pwo+ID4gPiA+ID4KPiA+ID4gPiA+IENhbiB5b3UgcnVu
IC0KPiA+ID4gPiA+IHN1ZG8gYnVzeWJveCBkZXZtZW0gMHhGRDkwMDYxNAo+ID4gPiA+ID4gc3Vk
byBidXN5Ym94IGRldm1lbSAweEZEOTAwNzE0Cj4gPiA+ID4gPiBzdWRvIGJ1c3lib3ggZGV2bWVt
IDB4RkQ5MDA4MTQKPiA+ID4gPiA+IHN1ZG8gYnVzeWJveCBkZXZtZW0gMHhGRDkwMDkxNAo+ID4g
PiA+ID4gc3VkbyBidXN5Ym94IGRldm1lbSAweEZEOTAwQTE0Cj4gPiA+ID4KPiA+ID4gPiAjIGJ1
c3lib3ggZGV2bWVtIDB4RkQ5MDA2MTQKPiA+ID4gPiAweDAwMDIwMDIwCj4gPiA+Cj4gPiA+IE9r
LCBzbyBDVExfMCBwYXRoLCBjb21tYW5kIG1vZGUsIHBpbmcgcG9uZyAwLCB3aXRoIHRoZSBvdXRw
dXQgZ29pbmcgdG8gRFNJIDEuCj4gPiA+Cj4gPiA+IE5leHQgb25lIHBsZWFzZToKPiA+ID4KPiA+
ID4gYnVzeWJveCBkZXZtZW0gMHhGRDkxMkQzMAo+ID4KPiA+IEl0J3MgMHgwMDAwMDAwMCBvbiBt
YWlubGluZSBhbmQgNC4xNy4gSSB1c2VkIHRoZSBmb2xsb3dpbmcgc2NyaXB0IHRvCj4gPiBkdW1w
IHRoZSBlbnRpcmUgbWRwNSBtZW1vcnkgcmVnaW9uIGFuZCBhdHRhY2hlZCB0aGUgZHVtcCBmcm9t
IDQuMTcgYW5kCj4gPiA1LjJyYzEuCj4gPgo+IAo+IG9rLCAwIG1lYW5zIGF1dG9yZWZyZXNoIGlz
IG5vdCBvbi4gIFdoaWNoIGlzIGZpbmUuICBNeSBuZXh0IGd1ZXNzCj4gd291bGQgYmUgdGhlIHZi
bGFuayBjb2RlIGNoZWNraW5nIHRoZSBoYXJkd2FyZSB2YmxhbmsgY291bnRlciwgd2hpY2gKPiBk
b2Vzbid0IGV4aXN0Lgo+IEluIHZpZGVvIG1vZGUsIHRoZXJlIGlzIGEgZnJhbWUgY291bnRlciB3
aGljaCBpbmNyZW1lbnRzLCB3aGljaCBjYW4gYmUKPiB1c2VkIGFzIHRoZSB2YmxhbmsgY291bnRl
ci4gIFVuZm9ydHVuYXRlbHksIHRoYXQgaGFyZHdhcmUgaXNuJ3QgYWN0aXZlCj4gaW4gY29tbWFu
ZCBtb2RlLCBhbmQgdGhlcmUgaXNuJ3QgYW4gZXF1aXZhbGVudC4KPiAKPiBTbywgdGhlIHZibGFu
ayBjb2RlIGlzIGdvaW5nIHRvIHJlYWQgdGhlIHJlZ2lzdGVyLCBhbmQgbG9vayBmb3IgYW4KPiB1
cGRhdGUsIHdoaWNoIHdpbGwgbmV2ZXIgaGFwcGVuLCB0aHVzIGl0IHdpbGwgdGltZW91dC4gIFRo
ZXJlIGlzIGEKPiBiYWNrdXAgcGF0aCB3aGljaCB1c2VzIHRpbWVzdGFtcHMgKG5vIGhhcmR3YXJl
KSwgd2hpY2ggeW91IGNhbgo+IGFjdGl2YXRlIHdpdGggYSBxdWljayBoYWNrIC0gbWFrZSBtYXhf
dmJsYW5rX2NvdW50ID0gMCBhdCB0aGUKPiBmb2xsb3dpbmcgbGluZQo+IGh0dHBzOi8vZWxpeGly
LmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNw
L21kcDUvbWRwNV9rbXMuYyNMNzUzCgpUaGF0IGZpeGVkIHRoZSBpc3N1ZSEKCkkgcHJldmlvdXNs
eSBvYnNlcnZlZCB0aGF0IG1kcDVfZ2V0X3ZibGFua19jb3VudGVyLCBzcGVjaWZpY2FsbHkKbWRw
NV9lbmNvZGVyX2dldF9mcmFtZWNvdW50LCB3b3VsZCBhbHdheXMgcmV0dXJuIDAuCgpXaGF0J3Mg
dGhlIGJlc3Qgd2F5IHRvIGZpeCB0aGlzIGluIG1haW5saW5lPyBTZXQgdGhhdCB0byB6ZXJvIGlm
IGFueQpvZiB0aGUgaW50ZXJmYWNlIG1vZGVzIGlzIE1EUDVfSU5URl9EU0lfTU9ERV9DT01NQU5E
PwoKQnJpYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
