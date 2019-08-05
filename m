Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E551E811C8
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 07:52:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66EB189D8E;
	Mon,  5 Aug 2019 05:52:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F253B89D8E
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 05:52:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5D0C030C1CD6;
 Mon,  5 Aug 2019 05:52:48 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-81.ams2.redhat.com
 [10.36.116.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1362B60BE5;
 Mon,  5 Aug 2019 05:52:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2CA2F11AAA; Mon,  5 Aug 2019 07:52:47 +0200 (CEST)
Date: Mon, 5 Aug 2019 07:52:47 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [RFC 2/6] udmabuf: add ability to set access flags on udmabuf
Message-ID: <20190805055247.dvagkiyugletjuau@sirius.home.kraxel.org>
References: <20190801022517.1903-1-gurchetansingh@chromium.org>
 <20190801022517.1903-3-gurchetansingh@chromium.org>
 <20190801064023.sd3jxlg6aqls523g@sirius.home.kraxel.org>
 <CAAfnVBn=ckrOkGW1bv4aHeO4vNVtVB_yKj8tTmDhsLPmOjj3nw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAfnVBn=ckrOkGW1bv4aHeO4vNVtVB_yKj8tTmDhsLPmOjj3nw@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Mon, 05 Aug 2019 05:52:48 +0000 (UTC)
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMDIsIDIwMTkgYXQgMDk6NDU6MTVBTSAtMDcwMCwgR3VyY2hldGFuIFNpbmdo
IHdyb3RlOgo+IE9uIFdlZCwgSnVsIDMxLCAyMDE5IGF0IDExOjQwIFBNIEdlcmQgSG9mZm1hbm4g
PGtyYXhlbEByZWRoYXQuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBXZWQsIEp1bCAzMSwgMjAxOSBh
dCAwNzoyNToxM1BNIC0wNzAwLCBHdXJjaGV0YW4gU2luZ2ggd3JvdGU6Cj4gPiA+IFRoZSBtYWlu
IHVzZSBmb3IgdWRtYWJ1ZiBpcyBzZW5kaW5nIGd1ZXN0IG1lbW9yeSBwYWdlcwo+ID4gPiB0byB0
aGUgaG9zdC4KPiA+ID4KPiA+ID4gSXQncyBnZW5lcmFsbHkgYSBiYWQgaWRlYSB0byBoYXZlIHRv
IHNlcGFyYXRlIG1hcHBpbmdzIHdpdGgKPiA+ID4gZGlmZmVyZW50IGF0dHJpYnV0ZXMuIEZvciBl
eGFtcGxlLCBhIFdDIG1hcHBpbmcgdGhlIGd1ZXN0Cj4gPiA+IGtlcm5lbCBhbmQgY2FjaGVkIG1h
cHBpbmcgb24gdGhlIGhvc3QgaXMgcHJvYmxlbWF0aWMuCj4gPiA+Cj4gPiA+IEFkZCBjcmVhdGlv
biB0aW1lIGZsYWdzIHNvIHRoZSB1c2VyIGhhcyByZXNwb25zaWJpbGl0eSBmb3IKPiA+ID4gdGhl
IHNwZWNpZmljIHVzZSBjYXNlLgo+ID4KPiA+ID4gLSNkZWZpbmUgVURNQUJVRl9GTEFHU19DTE9F
WEVDICAgICAgICAweDAxCj4gPiA+ICsjZGVmaW5lIFVETUFCVUZfRkxBR1NfQ0xPRVhFQyAgICAw
eDAxCj4gPiA+ICsjZGVmaW5lIFVETUFCVUZfRkxBR1NfUFJPVF9OT05FICAweDAyCj4gPiA+ICsj
ZGVmaW5lIFVETUFCVUZfRkxBR1NfUFJPVF9SRUFEICAweDA0Cj4gPiA+ICsjZGVmaW5lIFVETUFC
VUZfRkxBR1NfUFJPVF9XUklURSAweDA4Cj4gPgo+ID4gWyBkaWRuJ3QgbG9vayBhdCBmb2xsb3d1
cCBwYXRjaGVzIHlldCBdCj4gPgo+ID4gWW91IGNhbid0IGhhdmUgcmVhZG9ubHkvd3JpdGVvbmx5
IGRtYWJ1ZnMuCj4gPiBTbyB0aGF0IGlzbid0IGdvaW5nIHRvIGZseS4KPiA+Cj4gPiBUaGUgY29t
bWl0IG1lc3NhZ2Ugc3VnZ2VzdHMgdGhpcyBpcyBmb3IgY2FjaGUgYXR0cmlidXRlcyBub3QgcHJv
dGVjdGlvbiwKPiA+IHNvIGhhdmluZyB0aGUgZmxhZ3MgbWlnaHQgbWFrZSBzZW5zZSwgYnV0IHBs
ZWFzZSBkb24ndCBuYW1lIHRoZSBmbGFncwo+ID4gUFJPVF8qIHRoZW4uCj4gCj4gT2theSwgSSds
bCBjaGFuZ2UgdGhlIGZsYWdzIHRvIENBQ0hFRCAvIFVOQ0FDSEVEIC8gV1JJVEVfQ09NQklORSAo
bGlrZQo+IG1zbV9kcm0uaCkuICBBbmQgc2luY2UgdGhlIGRtYSBhcGkgZG9lc24ndCB3b3JrIG9u
IHg4NiBbMV0sIHdlJ2xsIGhhdmUKPiB0byBjYWxsIGRybV9jZmx1c2hfcGFnZXMgaW4gdGhlIGd1
ZXN0LiAgU2luY2UgY2FjaGluZyBpcyBwcml2aWxlZ2VkIG9uCj4gQVJNIGFuZCBub3Qgb24geDg2
LCB0aGF0ICpzaG91bGQqIGdldCB1cyB3cml0ZS1jb21iaW5lIGd1ZXN0IGJ1ZmZlcnMuCj4gCj4g
WzFdIGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2RyaS1kZXZlbC8yMDE5
LUF1Z3VzdC8yMjkxNjEuaHRtbAoKQWgsIHNvIHlvdSBhcmUgYXdhcmUgb2YgdGhlIHZnZW0gY2Fj
aGUgc3luY2hyb25pemF0aW9uIHBhdGNoZXMuCgpJdCdzIHByb2JhYmx5IGEgZ29vZCBpZGVhIHRv
IHdhaXQgdW50aWwgdGhhdCBpcyBmaW5hbGx5IHNldHRsZWQgYmVmb3JlCmZvbGxvd2luZyB3aXRo
IHVkbWFidWYuCgpjaGVlcnMsCiAgR2VyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
