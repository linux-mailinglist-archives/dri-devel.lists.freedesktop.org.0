Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A151A14DA0B
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2020 12:44:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF5B6F95F;
	Thu, 30 Jan 2020 11:44:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 114116F95F
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2020 11:44:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81BD2328;
 Thu, 30 Jan 2020 03:44:38 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 623213F67D;
 Thu, 30 Jan 2020 03:44:38 -0800 (PST)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 212D2682F32; Thu, 30 Jan 2020 11:44:37 +0000 (GMT)
Date: Thu, 30 Jan 2020 11:44:37 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCHv5 00/34] Add AFBC support for Rockchip
Message-ID: <20200130114437.GS24863@e110455-lin.cambridge.arm.com>
References: <20191213173350.GJ624164@phenom.ffwll.local>
 <20191217145020.14645-1-andrzej.p@collabora.com>
 <abace7b9-388b-e161-3371-c3b2e5406ff5@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <abace7b9-388b-e161-3371-c3b2e5406ff5@collabora.com>
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
Cc: kernel@collabora.com, Mihail Atanassov <mihail.atanassov@arm.com>,
 David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, James Wang <james.qian.wang@arm.com>,
 Ayan Halder <Ayan.Halder@arm.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQW5kcnplaiwKClNvcnJ5IGZvciB0aGUgZGVsYXkgaW4gcmV2aWV3aW5nIHRoZSBwYXRjaGVz
LiBJIGFtIGhvcGluZyB0byBnZXQgdGhyb3VnaCB0aGUgcmV2aWV3CmVhcmx5IG5leHQgd2VlayBp
ZiB0aGF0IGlzIE9LIHdpdGggeW91LgoKQmVzdCByZWdhcmRzLApMaXZpdQoKT24gVGh1LCBKYW4g
MzAsIDIwMjAgYXQgMTA6MDg6MTVBTSArMDEwMCwgQW5kcnplaiBQaWV0cmFzaWV3aWN6IHdyb3Rl
Ogo+IEhpIEFsbCwKPiAKPiBBIGdlbnRsZSByZW1pbmRlci4KPiAKPiBQbGVhc2UgYWxzbyBzZWUg
aW5saW5lOgo+IAo+IFcgZG5pdSAxNy4xMi4yMDE5IG/CoDE1OjQ5LCBBbmRyemVqIFBpZXRyYXNp
ZXdpY3ogcGlzemU6Cj4gPiBUaGlzIHNlcmllcyBhZGRzIEFGQkMgc3VwcG9ydCBmb3IgUm9ja2No
aXAuIEl0IGlzIGluc3BpcmVkIGJ5Ogo+ID4gCj4gPiBodHRwczovL2Nocm9taXVtLmdvb2dsZXNv
dXJjZS5jb20vY2hyb21pdW1vcy90aGlyZF9wYXJ0eS9rZXJuZWwvKy9yZWZzL2hlYWRzL2ZhY3Rv
cnktZ3J1LTkwMTcuQi1jaHJvbWVvcy00LjQvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tj
aGlwX2RybV92b3AuYwo+ID4gCj4gPiBUaGlzIGlzIHRoZSBmaWZ0aCBpdGVyYXRpb24gb2YgdGhl
IGFmYmMgc2VyaWVzLiBCZXR3ZWVuIHYzIGFuZCB2NCBhIGxvdCBvZgo+ID4gcmV3b3JrIGhhcyBi
ZWVuIGRvbmUsIHRoZSBtYWluIGdvYWwgb2Ygd2hpY2ggd2FzIHRvIG1vdmUgYWxsIGFmYmMtcmVs
YXRlZAo+ID4gY2hlY2tzIHRvIGhlbHBlcnMsIHNvIHRoYXQgY29yZSBkb2VzIG5vdCBkZWFsIHdp
dGggaXQuCj4gPiAKPiA+IEEgbmV3IHN0cnVjdCBkcm1fYWZiY19mcmFtZWJ1ZmZlciBpcyBhZGRl
ZCwgd2hpY2ggc3RvcmVzIGFmYmMtcmVsYXRlZAo+ID4gZHJpdmVyLXNwZWNpZmljIGRhdGEuIEJl
Y2F1c2Ugb2YgdGhhdCwgaW4gZHJpdmVycyB0aGF0IHdpc2ggdG8KPiA+IHVzZSB0aGlzIGZlYXR1
cmUsIHRoZSBzdHJ1Y3QgbXVzdCBiZSBhbGxvY2F0ZWQgZGlyZWN0bHkgaW4gdGhlIGRyaXZlcgo+
ID4gY29kZSByYXRoZXIgdGhhbiBpbnNpZGUgaGVscGVycywgc28gdGhlIGZpcnN0IHBvcnRpb24g
b2YgdGhlIHBhdGNoc2V0Cj4gPiBkb2VzIHRoZSBuZWNlc3NhcnkgcmVmYWN0b3JpbmcuCj4gPiAK
PiA+IFRoZW4sIHRoZXJlIGFyZSAzIHVzZXJzIG9mIGFmYmM6IGtvbWVkYSwgbWFsaWRwIGFuZCwg
ZmluYWxseSwgcm9ja2NoaXAsCj4gPiB0aGUgbGF0dGVyIGJlaW5nIHRoZSB1bHRpbWF0ZSBwdXJw
b3NlIG9mIHRoaXMgd29yayBhbmQgdGhlIDMgc3Vic2VxdWVudAo+ID4gcG9ydGlvbnMgb2YgdGhl
IHBhdGNoc2V0IG1vdmUga29tZWRhIGFuZCBtYWxpZHAgdG8gZ2VuZXJpYyBoZWxwZXJzIGFuZCBh
ZGQKPiA+IGFmYmMgc3VwcG9ydCB0byByb2NrY2hpcC4KPiAKPiBJZiBjaGFuZ2VzIGluIGtvbWVk
YSBhbmQgbWFsaWRwIGlzIHRvbyBtdWNoIHRvIGRpZ2VzdCBhdCBhIHRpbWUgSSBjYW4KPiBmb2N1
cyBvbiByb2NrY2hpcCBvbmx5LiBUaGlzIHdvdWxkIGFtb3VudCB0byBwYXRjaGVzIDEtNCBhbmQg
MzMtMzQuCj4gQWZ0ZXIgYWxsIHRoZSB1bHRpbWF0ZSBwdXJwb3NlIG9mIHRoaXMgd29yayBhbmQg
dGltZSBzcGVudCBvbiBpdAo+IGlzIGxhbmRpbmcgYWZiYyBzdXBwb3J0IGZvciByb2NrY2hpcC4K
PiAKPiBSZWdhcmRzLAo+IAo+IEFuZHJ6ZWoKCi0tIAo9PT09PT09PT09PT09PT09PT09PQp8IEkg
d291bGQgbGlrZSB0byB8CnwgZml4IHRoZSB3b3JsZCwgIHwKfCBidXQgdGhleSdyZSBub3QgfAp8
IGdpdmluZyBtZSB0aGUgICB8CiBcIHNvdXJjZSBjb2RlISAgLwogIC0tLS0tLS0tLS0tLS0tLQog
ICAgwq9cXyjjg4QpXy/CrwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
