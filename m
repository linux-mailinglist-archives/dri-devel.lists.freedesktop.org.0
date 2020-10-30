Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA522A006F
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:52:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 111826ED17;
	Fri, 30 Oct 2020 08:52:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52D2C6ED17
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 08:52:18 +0000 (UTC)
Date: Fri, 30 Oct 2020 08:52:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1604047935;
 bh=95JjZRfJrv2Btzh5dq+TWcbQv2ZkjC2FponeKNttJdM=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=coPd44oDDfEnL/L6fEhnI0On7F3cRE/BdkB/nC3DBwfzx2X62Um3c87jYYs7Gn73F
 3eEx8QhHI/H57crmYPfkVEVkeru6UMJoJCZfMTDGDSu6S7eCo40OF7SUfUXUERgxXC
 BqdnpvNyn3ctY5SLGAEwf1QbXGZ8BLjc2ZGmVgN7M0xcCYPUxsXAx21RyWvauacbZ1
 pkaBL3Pk3ue/EXjLW55h1Ilx9GQ7/MNbrQCp3lJ6fZhBQ5sqcE9mzfAL5dGqn53gEn
 r2TfLeQEocHO3tNn5wnuHsE8a2FBdhvvpgYl3y7ftmsUP7u971gMh1e2Yl/6Bz749m
 b+pnl8CqGd1kw==
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [systemd-devel] DisplayPort display non-persistent device naming
Message-ID: <BLmZP2Ol6VMDxu1BMFIsEsum0LcQmAIx2a3LXTBctSzGEHuv5Wanhijgn5RJFSHUtkRbLN7BXIzvSN3NqIfjvgNCCnOeiQFCj4hVUqgRk2M=@emersion.fr>
In-Reply-To: <20201030100901.51272cd9@eldfell>
References: <d23c3db1-1ae9-3f23-23a9-4d5d912c5108@gmail.com>
 <20201030100901.51272cd9@eldfell>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Marcin Kocur <marcin2006@gmail.com>, "systemd-devel@lists.freedesktop.org"
 <systemd-devel@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpZGF5LCBPY3RvYmVyIDMwLCAyMDIwIDk6MDkgQU0sIFBla2thIFBhYWxhbmVuIDxwcGFh
bGFuZW5AZ21haWwuY29tPiB3cm90ZToKCj4gT24gVGh1LCAyOSBPY3QgMjAyMCAyMTo1MzozNCAr
MDEwMAo+IE1hcmNpbiBLb2N1ciBtYXJjaW4yMDA2QGdtYWlsLmNvbSB3cm90ZToKPgo+ID4gSGVs
bG8sCj4gPiB0aGlzIGlzIHRoZSBvdXRwdXQgb2YgdHVybmluZyBvZmYgYW5kIG9uIG15IGRpc3Bs
YXkgKHVzaW5nIHBvd2VyIGJ1dHRvbik6Cj4KPiAuLi4KPgo+ID4gVGhlIG1vbml0b3Igd2FzIHZp
c2libGUgaW4geHJhbmRyIGFzIERQLTIsIGFmdGVyIHBvd2VyIG9mZiBhbmQgb24gaXQncwo+ID4g
dmlzaWJsZSBhcyBEUC0zIChEUC0yIGlzIHN0aWxsIHRoZXJlICJkaXNjb25uZWN0ZWQiKS4KPiA+
IEl0J3MgdHJvdWJsZXNvbWUgZm9yOgo+ID4KPiA+IC0gICBHVUkgZGlzcGxheSBjb25maWd1cmF0
b3JzCj4gPgo+ID4gLSAgIHNjcmlwdGluZwo+ID4KPiA+IC0gICBmb3IgWG9yZyBjb25maWd1cmF0
aW9uIHdoaWNoIHN0b3BzIHRvIHdvcms6Cj4gPgo+ID4KPiA+IFNlY3Rpb24gIk1vbml0b3IiCj4g
PiDCoMKgwqAgSWRlbnRpZmllcsKgICJEUC0yIgo+ID4gwqDCoMKgIE9wdGlvbsKgwqDCoMKgwqAg
IlByaW1hcnkiICJ0cnVlIgo+ID4gRW5kU2VjdGlvbgo+ID4gSXMgdGhpcyBhIGJ1ZyBvciBhIGZl
YXR1cmU/Cj4KPiBIaSwKPgo+IHRoaXMgaXMgaG93IHRoZSBrZXJuZWwgRFJNIHN1Yi1zeXN0ZW0g
d29ya3MuIFRoZSBjb25uZWN0b3IgbmFtZXMgYXJlCj4gbm90IHBlcnNpc3RlbnQgaW4gZ2VuZXJh
bCwganVzdCBsaWtlIHlvdSBjYW4ndCBleHBlY3QgdGhhdCB0aGUgc2FtZSBnZngKPiBjYXJkIGFw
cGVhcnMgYWx3YXlzIGF0IHRoZSBzYW1lIC9kZXYvZHJpL2NhcmROIG5vZGUgaWYgeW91IGhhdmUK
PiBzZXZlcmFsLiBCeSBkZWZhdWx0LCBjYXJkTiBub2RlcyBhcmUgYXNzaWduZWQgaW4gdGhlIG9y
ZGVyIG9mIHdoaWNoCj4gZHJpdmVyIGluc3RhbmNlIGhhcHBlbnMgdG8gaW5pdGlhbGl6ZSBmaXJz
dCBhbmQgaXQgY2FuIGJlIHJhbmRvbS4KPgo+IFVzdWFsbHkgaGFyZC13aXJlZCAoaW4gaGFyZHdh
cmUpIGNvbm5lY3RvcnMganVzdCBoYXBwZW4gdG8gYWx3YXlzIGJlCj4gZGlzY292ZXJlZCBpbiB0
aGUgc2FtZSBvcmRlciwgYW5kIGlmIHlvdSBvbmx5IGhhdmUgYSBzaW5nbGUgZ2Z4IGNhcmQgaW4K
PiB5b3VyIG1hY2hpbmUsIHRoZSBjb25uZWN0b3IgbmFtaW5nIGlzIHByYWN0aWNhbGx5IHBlcnNp
c3RlbnQuIFRoaXMgaXMKPiBhbiBhY2NpZGVudC4gSXQgaXMgbm90IGd1YXJhbnRlZWQgaWYgeW91
IGhhdmUgbXVsdGlwbGUgY2FyZHMgb3IgeW91Cj4gaGF2ZSBNU1QgY29ubmVjdG9ycy4KPgo+IE1T
VCBjb25uZWN0b3JzIGNhbiBhcHBlYXIgYW5kIGRpc2FwcGVhciBkeW5hbWljYWxseS4gVGhlcmUg
aXMgYSBLTVMKPiBwcm9wZXJ0eSB0aGF0IGF0dGVtcHRzIHRvIHJlZmxlY3Qgc29tZXRoaW5nIGFi
b3V0IHRoZSBNU1QgdG9wb2xvZ3kgc28KPiB0aGF0IHlvdSBtaWdodCBoYXZlIHNvbWUgaG9wZSB0
byBtYXRjaCBhICJjb25uZWN0b3IiLCBidXQgdGhpcyBpcyBub3QKPiBpbiB0aGUgY29ubmVjdG9y
IG5hbWUuIFRoZSBjb25jZXB0IG9mIGEgcGVyc2lzdGVudCBjb25uZWN0b3IgaXMKPiBwcm9ibGVt
YXRpYyBpZiB0aGUgY29ubmVjdG9yIGlzIGluIGEgTVNUIG1vbml0b3IgZm9yIGRhaXN5LWNoYWlu
aW5nCj4gbW9yZSBtb25pdG9ycyAtIHlvdSBjYW4gYWx3YXlzIHVucGx1ZyB0aGUgZmlyc3QgbW9u
aXRvciBtYWtpbmcgdGhlCj4gY29ubmVjdG9yIGRpc2FwcGVhciAobm90IGp1c3QgYmVjb21lIGRp
c2Nvbm5lY3RlZCkuCj4KPiBJZiB5b3Ugd2FudCByZWxpYWJsZSBtb25pdG9yIG1hdGNoaW5nLCBt
b25pdG9yIHNlcmlhbCBudW1iZXIgKGlmCj4gcHJlc2VudCkgd291bGQgYmUgYSBtb3JlIHJlbGlh
YmxlIG1ldGhvZC4gSSdtIG5vdCBzdXJlIFhvcmcgY29uZmlnIGhhcwo+IG1hdGNoaW5nIHJ1bGVz
IGZvciB0aGF0IHRob3VnaCwgYnV0IEkgc3VwcG9zZSBSYW5kUiBiYXNlZCBjb25maWd1cmF0aW9u
Cj4gdXRpbGl0aWVzIGNvdWxkIGRvIGl0Lgo+Cj4gSWYgeW91IHdhbnQgdG8gZGlzY3VzcyB0aGlz
IGZ1cnRoZXIsIGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QgaXMgdGhlCj4gcGxhY2UgLSBDYydkLiBO
b3RoaW5nIHRvIGRvIHdpdGggc3lzdGVtZCBoZXJlLCBub3IgZXZlbiB3aXRoIHVkZXYuCgpJZiB5
b3UgcmVhbGx5IHdhbnQgdG8gcmVsaWFibHkgbWF0Y2ggdGhlIHBoeXNpY2FsIGNvbm5lY3Rvciwg
dGhpcwpwcm9wb3NhbCBmcm9tIFZpbGxlIG1heSBoZWxwOgoKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvYXJjaGl2ZXMvZHJpLWRldmVsLzIwMTktSnVuZS8yMjE5MDIuaHRtbAoKSW4gZmFj
dCwgTVNUIGNvbm5lY3RvcnMgYWxyZWFkeSBhbGwgaGF2ZSBhIFBBVEggcHJvcC4gV2hhdCB3ZSdy
ZQptaXNzaW5nIGlzIGEgUEFUSCBwcm9wIGZvciBvdGhlciBjb25uZWN0b3JzIGFzIHdlbGwuCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
