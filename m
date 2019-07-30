Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D613B7B020
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 19:33:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEA816E5E8;
	Tue, 30 Jul 2019 17:33:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 742456E5E8
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 17:33:35 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:64330
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hsW0D-0008M2-FC; Tue, 30 Jul 2019 19:33:33 +0200
Subject: Re: [RFC 4/4] drm/panel/ili9341: Support mi0283qt
To: Emil Velikov <emil.l.velikov@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20190729195526.13337-1-noralf@tronnes.org>
 <20190729195526.13337-5-noralf@tronnes.org>
 <ae0a000f-df7e-6c08-9a50-a5ed22a2845e@tronnes.org>
 <CAKMK7uH8S9xZNFNJkmrEjSasb0v6tnL5OMZRC-KyXiNiJj2U9A@mail.gmail.com>
 <20190730171245.GE14551@arch-x1c3>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <86b74e21-8a86-3c7b-9d32-2e6613004715@tronnes.org>
Date: Tue, 30 Jul 2019 19:33:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190730171245.GE14551@arch-x1c3>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=GJrsn1bdcBYnY48GmJnIJM+VfEno4mwKG4i6QTdz3Ew=; 
 b=Uoltjd4Txlh421ZVcJVhq63VWOCyDVFHfuYIQtRpIHzBfhi+Y/VPiA12Yb+TzzoxX0cwPKArujwKx9qKVWpE9eai6ls8XVi3UCiOvsdEycXmf1KzfOD7wd/fQyH/cMzdh4h/Tm2iRXXc5eKW3+TBOfB8UJ1e4EOGnv/96Xlqc2vYydJzz1FhDgCf5e3KanUdHrQ3dEmpUpA8Ppf+w8Qw0TuVHZ65aztTG00rhPjTKy+kHWE5+D2o0smyEmnN6eGH84ZYcafaM2/nP3DT1AWJqmNqak+sKLlAN2gvYNgo5ZcCJ+vUDILXUhKcIqcR3WFNdX1fWLlGrf3/41k9mSeQpw==;
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
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Josef Lusticky <josef@lusticky.cz>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMzAuMDcuMjAxOSAxOS4xMiwgc2tyZXYgRW1pbCBWZWxpa292Ogo+IE9uIDIwMTkvMDcv
MzAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4+IE9uIFR1ZSwgSnVsIDMwLCAyMDE5IGF0IDQ6MzAg
UE0gTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+IHdyb3RlOgo+Pj4KPj4+Cj4+
Pgo+Pj4gRGVuIDI5LjA3LjIwMTkgMjEuNTUsIHNrcmV2IE5vcmFsZiBUcsO4bm5lczoKPj4+PiBT
aWduZWQtb2ZmLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KPj4+PiAt
LS0KPj4+PiAgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWlsaXRlay1pbGk5MzQxLmMgfCAx
NzkgKysrKysrKysrKysrKysrKysrLQo+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgMTcwIGluc2VydGlv
bnMoKyksIDkgZGVsZXRpb25zKC0pCj4+Pj4KPj4+Cj4+PiBJIGhhdmUgcmVhbGlzZWQgdGhhdCB0
aGlzIHdpbGwgY2hhbmdlIHRoZSBEUk0gZHJpdmVyIG5hbWUgZnJvbSBtaTAyODNxdAo+Pj4gdG8g
ZHJtX21pcGlfZGJpLiBUaGlzIG1lYW5zIHRoYXQgdGhpcyBwYW5lbCB3aWxsIGxvb3NlIGl0cyBN
RVNBIGttc3JvWzFdCj4+PiBzdXBwb3J0LiBJIGhhdmVuJ3QgdHJpZWQgaXQsIGJ1dCB0aGlzIGlz
IHRoZSBmaXJzdCB0aGluZyB0aGF0IGdpdmVzIHRoaXMKPj4+IGRyaXZlciBhbnkgcmVhbCBhZHZh
bnRhZ2Ugb3ZlciBpdHMgZmJkZXYgY291bnRlcnBhcnQgaW4KPj4+IGRyaXZlcnMvc3RhZ2luZy9m
YnRmdCwgc28gSSBkb24ndCB3YW50IHRvIGxvb3NlIHRoYXQuCj4+PiBTbyBldmVuIGlmIE1JUEkg
REJJIHBhbmVsIHN1cHBvcnQgaXMgaW1wbGVtZW50ZWQgaW4gc29tZSBmb3JtLCBJIHdpbGwKPj4+
IHdhaXQgd2l0aCBjb252ZXJ0aW5nIG1pMDI4M3F0IHVudGlsIHNvbWVvbmUgaGFzIHVwZGF0ZWQg
dGhlIGttc3JvIGRyaXZlci4KPj4KPj4gV2h5IGRvZXMgaXQgY2hhbmdlPyBZb3Ugc2hvdWxkIGJl
IGFibGUgdG8gc3R1ZmYgd2hhdGV2ZXIgeW91IGZlZWwgbGlrZQo+PiBpbnRvIHRoZSBkcm0gZHJp
dmVyIG5hbWUsIHRoaXMgZG9lc24ndCBoYXZlIHRvIG1hdGNoIGVpdGhlciB5b3VyCj4+IHBsYXRm
b3JtL3NwaS93aGF0ZXZlciBkcml2ZXIgbmFtZSBub3IgdGhlIG1vZHVsZSBvcHRpb24uCj4gCj4g
TGFzdCB0aW1lIGkndmUgbG9va2VkIERSTSBkcml2ZXJzIHVzaW5nIHRoZSBtaXBpIGRzaSBoZWxw
ZXJzIGRvIF9ub3RfCj4gaGF2ZSAiZHJtX21pcGlfZHNpIiBhcyB0aGVpciBkcml2ZXIgbmFtZS4g
SGVuY2UgZHJpdmVycyB1c2luZyB0aGUgbWlwaQo+IGRiaSBzaG91bGQgbm90IGhhdmUgImRybV9t
aXBpX2RiaSIuCj4gCgpXaGF0IHB1cnBvc2UgZG9lcyB0aGUgRFJNIGRyaXZlciBuYW1lIHNlcnZl
IGZvciB1c2Vyc3BhY2U/CldoeSBjYW4ndCBpdCBiZSBjYWxsZWQgZHJtX21pcGlfZGJpPyBCZWNh
dXNlIG11bHRpcGxlIHBhbmVsIGRyaXZlcnMgd2lsbAp1c2UgdGhlIHNhbWUgbmFtZT8gWW91J3Jl
IHN0YXRlbWVudCBpbXBsaWVzIHRoYXQgdGhlcmUgYXJlIHNvbWUgcnVsZXMKcmVnYXJkaW5nIERS
TSBkcml2ZXIgbmFtaW5nLgoKPiBUaGF0IHNhaWQsIHdlIHNob3VsZCBwcm9iYWJseSBoaWdobGln
aHQgZXZlbiBtb3JlIHRoYXQgdGhlIGRyaXZlciBuYW1lCj4gaXMgYW4gQUJJLgo+IAoKVGhpcyBJ
IGRpZG4ndCBrbm93LgoKTm9yYWxmLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
