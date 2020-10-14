Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A208728DA4F
	for <lists+dri-devel@lfdr.de>; Wed, 14 Oct 2020 09:09:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA9F6EA12;
	Wed, 14 Oct 2020 07:09:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3FB16EA12
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Oct 2020 07:09:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 734DEB169;
 Wed, 14 Oct 2020 07:09:14 +0000 (UTC)
Date: Wed, 14 Oct 2020 09:09:13 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: "Ilpo =?UTF-8?B?SsOkcnZpbmVu?=" <ilpo.jarvinen@cs.helsinki.fi>
Subject: Re: drm/ast something ate high-res modes (5.3->5.6 regression)
Message-ID: <20201014090913.727e79bb@linux-uq9g>
In-Reply-To: <alpine.DEB.2.20.2010140938100.6967@whs-18.cs.helsinki.fi>
References: <alpine.DEB.2.20.2007081246050.12041@whs-18.cs.helsinki.fi>
 <5a3537c3-2c81-b9de-e4c7-c00577cdd43d@suse.de>
 <alpine.DEB.2.20.2009171407330.6530@whs-18.cs.helsinki.fi>
 <4ccd1076-29e3-044a-0696-fd205b100374@suse.de>
 <alpine.DEB.2.20.2010140938100.6967@whs-18.cs.helsinki.fi>
Organization: SUSE Software Solutions Germany GmbH
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkKCk9uIFdlZCwgMTQgT2N0IDIwMjAgMDk6NTg6MzcgKzAzMDAgKEVFU1QpICJJbHBvIErDpHJ2
aW5lbiIKPGlscG8uamFydmluZW5AY3MuaGVsc2lua2kuZmk+IHdyb3RlOgoKPiBPbiBUaHUsIDE3
IFNlcCAyMDIwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToKPiAKPiA+IEhpCj4gPiAKPiA+IEFt
IDE3LjA5LjIwIHVtIDEzOjE3IHNjaHJpZWIgSWxwbyBKw6RydmluZW46Cj4gPiA+IEhpLAo+ID4g
PiAKPiA+ID4gWWVzLCBJIGNhbiBidWlsZCBjdXN0b20ga2VybmVscyBhbmQgdGVzdCBidXQgSSB3
b24ndCBoYXZlIHRpbWUgZm9yIHRoYXQgCj4gPiA+IGJlZm9yZSB0aGUgZW5kIG9mIFNlcHRlbWJl
ciBzbyBJJ2xsIGRvIGl0IG9ubHkgdGhlbi4KPiA+IAo+ID4gTm8gcHJvYmxlbSwgdGhhdCdzIHN0
aWxsIGZpbmUuCj4gPiAKPiA+IEJlc3QgcmVnYXJkcwo+ID4gVGhvbWFzCj4gPiAKPiA+ID4gCj4g
PiA+IEFuZCB0aGFua3MgYSBsb3QgOi0pLgo+ID4gPiAKPiAKPiBUaGUgaGlnaC1yZXMgbW9kZSB3
b3JrcywgaG93ZXZlciwgSSB3YXNuJ3QgZXhwZWN0aW5nIGl0IHRvIGJlIHRoaXMgc2xvdyAKPiB0
aG91Z2ggYXMgSSBjYW4gc2VlIHRoZSBzbG93aXNoIHN3ZWVwcyB0byByZWRyYXcgdGhlIHNjcmVl
biBvciBsYXJnZSBwYXJ0cyAKPiBvZiBpdC4gTWF5YmUgeW91IG1lYW50IGFsbCBhbG9uZyB0aGlz
IHNsb3cgKEkgd2FzIGV4cGVjdGluZyBzb21ldGhpbmcgbGlrZSAKPiBtZW1jcHkgc2xvdyBhbmQg
dGhpcyBsb29rcyBkZWZpbml0ZWx5IG11Y2ggc2xvd2VyKT8KCkZpcnN0IG9mIGFsbCwgdGhhbmtz
IGZvciB0ZXN0aW5nLiBJIGRpZG4ndCBleHBlY3QgaXQgdG8gYmUgdGhhdCBzbG93IGVpdGhlci4K
Cj4gCj4gV2hpbGUgYSBsYXJnZSByZWRyYXdpbmcgb3BlcmF0aW9uIGlzIGdvaW5nIG9uLCBtb3Vz
ZSBjdXJzb3Igc3RvcHMgbW92aW5nIAo+IG5vcm1hbGx5IHVudGlsIGl0IGlzIG92ZXIgYW5kIGl0
IHRoZW4ganVtcHMgdG8gY2F0Y2ggdXAuIFdoZW4gdGhlIG1vdXNlIGlzIAo+IG92ZXIgc29tZXRo
aW5nIHRoYXQgZG9lc24ndCByZXF1aXJlIGxhcmdlIHJlZHJhdywgaXQgc2VlbXMgdG8gd29yayBx
dWl0ZSAKPiBub3JtYWxseS4KPiAKClRoYXQgc291bmRzIGJhZC4gVGhlIGN1cnNvciBpcyBkcmF3
biBieSBoYXJkd2FyZSwgc28gSSdkIGV4cGVjdCBpdCB0byBtb3ZlCnNtb290aGx5IGFjcm9zcyB0
aGUgc2NyZWVuLiBNYXliZSB0aGUgcG9zaXRpb24gdXBkYXRlIGlzIGJsb2NrZWQgZnJvbSB0aGUK
ZnJhbWVidWZmZXIncyBtZW1jcHkgd2l0aGluIHRoZSBrZXJuZWwgY29kZS4KCkkgd2FzIGhvcGlu
ZyB0aGUgcGVyZm9ybWFuY2Ugd291bGQgYmUgYWNjZXB0YWJsZSwgYnV0IHRoaXMgc291bmRzIGxp
a2UgYQpkZWFsYnJlYWtlciB0byBtZS4gSSBjYW4gbG9vayBhIGJpdCBjbG9zZXIgaWYgdGhlcmUg
YXJlIGlzc3Vlcy9idWdzIGluIHRoZQpjb2RlIHRoYXQgbWFrZSBpdCBydW4gc2xvdy4gTm90IGhv
bGRpbmcgbXkgYnJlYXRoIGZvciBpdCB0aG91Z2guLi4KCkJlc3QgcmVnYXJkcwpUaG9tYXMKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
