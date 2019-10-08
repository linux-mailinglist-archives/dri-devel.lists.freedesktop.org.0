Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC621CFD80
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 17:23:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C49D6E837;
	Tue,  8 Oct 2019 15:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 639226E837
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 15:23:17 +0000 (UTC)
Date: Tue, 08 Oct 2019 15:23:06 +0000
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [v4] drm: two planes with the same zpos have undefined ordering
Message-ID: <RUbEhsoPntscxbp2045XSnjArAZAqHdZq-U-itTrsU7Qffdfk8wk6WW0JDdXkvH8nUAAmYcwTz02Ayi59JLdVBuD38F3fLnXtFcuvciI_l8=@emersion.fr>
In-Reply-To: <CAKMK7uGRuk7gtOm0f2cWfQYAXgdxHnoCAV3Wt4SWqX7dq-D_xQ@mail.gmail.com>
References: <3FTYuSJGBfAG_MnVn604lEDUu1q2h6tI--IJOCx5Yp1SRwQig7s2AfLuleVvOS9WN1lLqAlXCWJu_Z60u3BnZfqCgFHDd_nPOUCAipaNpLk=@emersion.fr>
 <20190929061549.GA28809@jamwan02-TSP300>
 <3q-AW_DkhdIpH9Ip7_2kdcVNHwdKnhIH4k2PjfN-80KlJ0Qe3jIVH6CxMSQc-niJGdLyzzKsUcXjUyu1z9fTjHwg5-eWvOWbhnblUurueKo=@emersion.fr>
 <20190930100707.178723d1@eldfell.localdomain>
 <20191008095904.GL16989@phenom.ffwll.local>
 <20191008143936.6f49b098@eldfell.localdomain>
 <CAKMK7uG49xQ75MovfKHksq1WLiXj3SHYSjFHAUqg3SDPmrxvvA@mail.gmail.com>
 <v6alE7r1055E0bjQLf4OZU6BUkfL_xfCKvow6LcJEv_PNJnULXbMgN6HdyDw0IzIa9FI9TjgNM2_iBP7xMGD1O30cOZZdzbSwXtuuio3nNw=@emersion.fr>
 <CAKMK7uGRuk7gtOm0f2cWfQYAXgdxHnoCAV3Wt4SWqX7dq-D_xQ@mail.gmail.com>
Feedback-ID: FsVprHBOgyvh0T8bxcZ0CmvJCosWkwVUg658e_lOUQMnA9qynD8O1lGeniuBDfPSkDAUuhiKfOIXUZBfarMyvA==:Ext:ProtonMail
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF autolearn=ham
 autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.protonmail.ch
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=emersion.fr; s=protonmail; t=1570548194;
 bh=/rUwQXuzy5rwlxjpfN8wxLujNpMwpIGh7KiNSa6WIB8=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=fy8uVOjZFa5ywU4V3vDbjfF+4Ae8F6lurjd/o96N0AP5k6xQIhz6a4lvAAqfjnDqF
 qqDqrsrsZHPJ3pZgLHWM7yFZK03ssO0DY7x/akx/fqxMrVrWLmcNzluzgfjwHP7s3T
 aSIP0PXNWc0iNj/SHFchcmOf2GNT0+wCWYN9Quk8=
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: nd <nd@arm.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 Marius Vlad <marius.vlad@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlc2RheSwgT2N0b2JlciA4LCAyMDE5IDY6MTYgUE0sIERhbmllbCBWZXR0ZXIgPGRhbmll
bEBmZndsbC5jaD4gd3JvdGU6Cgo+IE9uIFR1ZSwgT2N0IDgsIDIwMTkgYXQgNToxMSBQTSBTaW1v
biBTZXIgY29udGFjdEBlbWVyc2lvbi5mciB3cm90ZToKPgo+ID4gT24gVHVlc2RheSwgT2N0b2Jl
ciA4LCAyMDE5IDY6MDMgUE0sIERhbmllbCBWZXR0ZXIgZGFuaWVsQGZmd2xsLmNoIHdyb3RlOgo+
ID4KPiA+ID4gPiA+ID4gPiBJbiBhbnkgY2FzZSwgdGhpcyBkb2Vzbid0IGNoYW5nZSB0aGUgcGF0
Y2ggaXRzZWxmLiBQcm9iYWJseSBzb21ldGhpbmcgd29ydGgKPiA+ID4gPiA+ID4gPiBtZW50aW9u
bmluZyBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFllcywg
cmVjb3JkaW5nIHRoZXNlIHVzZSBjYXNlcyB3b3VsZCBiZSB2ZXJ5IG5pY2UuCj4gPiA+ID4gPgo+
ID4gPiA+ID4gVGhlcmUncyBhIGxvdCBtb3JlIGh3IHRoYXQgZG9lcyB0aGUgc2FtZSB0cmlja3Mg
KHF1YWxjb20gaXMgb25lIGZvciBzdXJlKS4KPiA+ID4gPiA+IEltbyBiZWZvcmUgd2UgZW5jb2Rl
IHRoaXMgd2Ugc2hvdWxkIG1ha2Ugc3VyZSB0aGF0Ogo+ID4gPiA+ID4gYSkgZXZlcnlvbmUgaXMg
aGFwcHkgd2l0aCB0aGlzIG5ldyB1YXBpCj4gPiA+ID4KPiA+ID4gPiBTb3JyeSwgd2hhdCBuZXcg
VUFQST8KPiA+ID4gPiBXZSdyZSBqdXN0IHRyeWluZyB0byBtYWtlIHRoZSBkb2N1bWVudGF0aW9u
IG1hdGNoIHdoYXQgY3VycmVudGx5Cj4gPiA+ID4gaGFwcGVucywgcmlnaHQ/Cj4gPiA+Cj4gPiA+
IEl0J3Mgc28gbXVjaCBuZXcgdWFwaSB0aGF0IEkndmUgc2VudCBvdXQgYSBmZXcgcmV2ZXJ0cyBm
b3IgNS40IChpdAo+ID4gPiBsYW5kZWQgaW4gdGhhdCBtZXJnZSB3aW5kb3cpIHRvIHVuZG8gdGhl
IHN0dWZmIHRoZSBhcm0gZHJpdmVyIHRlYW0gaGFzCj4gPiA+IGRvbmUgKGl0IGRpZG4ndCBjb21l
IHdpdGggdXNlcnNwYWNlLCBwcm9wZXIgZGlzY3Vzc2lvbiBvbiBkcmktZGV2ZWwsCj4gPiA+IGRv
Y3Mgb3IgdGVzdGNhc2VzIGluIGlndCkuIEkgYWxzbyBqdXN0IHNwb3R0ZWQgdGhhdCBhIGxlZnRv
dmVyIGlzIHRoYXQKPiA+ID4gYXJtL2tvbWVkYSBzdGlsbCBjb21wdXRlcyBpdHMgb3duIHZlcnNp
b24gb2Ygbm9ybWFsaXplZF96cG9zLCB3aGljaAo+ID4gPiBwcm9iYWJseSBzaG91bGQgYmUgZGl0
Y2hlZCB0b28gKGl0J3Mgbm90IGFjdHVhbGx5IGRpZmZlcmVudCBmcm9tIHRoZQo+ID4gPiBvbmUg
aW4gaGVscGVycyB3aXRob3V0IHRoZSByZXZlcnRlZCB1YXBpKS4KPiA+ID4gU28geWVhaCwgc2Vw
YXJhdGUgcGF0Y2ggOi0pCj4gPgo+ID4gSSBkb24ndCBnZXQgaXQuIERvIHlvdSB3YW50IHRvIHNw
bGl0IHRoZSBkb2NzIGNoYW5nZXMgZm9yIHVzZXItc3BhY2UsCj4gPiBvbmx5IGtlZXBpbmcgdGhl
IGRvYyBjaGFuZ2VzIGZvciBkcml2ZXJzIGluIHRoaXMgcGF0Y2g/Cj4gPiBVc2VyLXNwYWNlIGNv
dWxkIGFscmVhZHkgc2VlIGR1cGxpY2F0ZSB6cG9zIGJlY2F1c2Ugb2YgdGhlIG5vbi1hdG9taWMK
PiA+IEFQSS4gSSBkb24ndCB0aGluayB0aGlzIGludHJvZHVjZXMgYSBuZXcgdUFQSS4KPgo+IEkn
bSB0YWxraW5nIHNwZWNpZmljYWxseSBhYm91dCB0aGUgImR1cGxpY2F0ZWQgenBvcyB2YWx1ZXMg
aW5kaWNhdGUKPiBzcGVjaWFsIGNsb25lZCBwbGFuZXMgbGlrZSBpbiB0aGUgYXJtIGV4YW1wbGUi
IGNsYXJpZmljYXRpb24uIE5vdAo+IGFib3V0IHNwbGl0dGluZyB0aGUgenBvcyBkb2N1bWVudGF0
aW9uIGFueSBtb3JlLCB0aGF0J3MgaW5kZWVkIGp1c3QKPiBkb2N1bWVudGluZyBleGlzdGluZyB1
YXBpLiBCdXQgYXNzaWduaW5nIHRoZSBzcGVjaWFsIG1lYW5pbmcgdG8KPiBkdXBsaWNhdGVkIHpw
b3MgdmFsdWVzIChpbnN0ZWFkIG9mIGp1c3QgImNhbiBoYXBwZW4gYmVjYXVzZSBub24tYXRvbWlj
Cj4gbGVnYWN5IHVzZXJzcGFjZSIpLCB0aGF0IGlzIG5ldyB1YXBpLiBFc3BlY2lhbGx5IGlmIHdl
IGFsbG93Cj4gZHVwbGljYXRlZCB6cG9zIGZvciBpbW11dGFibGUgcHJvcGVydGllcyAoYWZhaWsg
dGhhdCBkb2Vzbid0IGV4aXN0Cj4geWV0KS4KCk9oLCBJIHNlZS4gVGhhdCBtYWtlcyBzZW5zZSwg
d2lsbCBzZW5kIGEgbmV3IHZlcnNpb24uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
