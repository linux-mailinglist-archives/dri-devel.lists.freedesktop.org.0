Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B336D10B312
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 17:19:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD1CD6E0EA;
	Wed, 27 Nov 2019 16:19:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C04CD6E0EA
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 16:19:12 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 562EA80503;
 Wed, 27 Nov 2019 17:19:09 +0100 (CET)
Date: Wed, 27 Nov 2019 17:19:07 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [PATCH 28/30] drm/sti: sti_vdo: Use drm_bridge_init()
Message-ID: <20191127161907.GA17176@ravnborg.org>
References: <20191126131541.47393-1-mihail.atanassov@arm.com>
 <20191126131541.47393-29-mihail.atanassov@arm.com>
 <20191126193740.GC2044@ravnborg.org>
 <2161383.jsAorMfJJG@e123338-lin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2161383.jsAorMfJJG@e123338-lin>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=anWFpgVYN7cw7xR4DrkA:9 a=CjuIK1q_8ugA:10 a=pHzHmUro8NiASowvMSCR:22
 a=Ew2E2A-JSTLzCXPT_086:22
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
Cc: David Airlie <airlied@linux.ie>, nd <nd@arm.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWloYWlsLgoKPiA+IAo+ID4gSSBjYW4gc2VlIGZyb20gZ3JlcHBpbmcgdGhhdCBicmlkZ2Uu
ZHJpdmVyX3ByaXZhdGUgaXMgdXNlZAo+ID4gaW4gYSBjb3VwbGUgb2Ygb3RoZXIgZmlsZXMgaW4g
c3RpLwo+ID4gCj4gPiBMaWtlIHN0aV9oZG1pLmM6Cj4gPiAgICAgICAgIGJyaWRnZS0+ZHJpdmVy
X3ByaXZhdGUgPSBoZG1pOwo+ID4gICAgICAgICBicmlkZ2UtPmZ1bmNzID0gJnN0aV9oZG1pX2Jy
aWRnZV9mdW5jczsKPiA+ICAgICAgICAgZHJtX2JyaWRnZV9hdHRhY2goZW5jb2RlciwgYnJpZGdl
LCBOVUxMKTsKPiA+IAo+ID4gCj4gPiBJIHdvbmRlciBpZiBhIGRybV9icmlkZ2VfaW5pdCgpIHNo
b3VsZCBiZSBhZGRlZCB0aGVyZS4KPiA+IEkgZGlkIG5vdCBsb29rIGNsb3NlbHkgLSBidXQgaXQg
bG9va2VkIHN1c3Bpc2lvdXNseS4KPiAKPiBNeSBnb2FsIHdpdGggZHJtX2JyaWRnZV9pbml0KCkg
d2FzIHRvIGdldCBkZXZsaW5rcyBzb3J0ZWQgb3V0IGZvcgo+IGNyb3NzLW1vZHVsZSB1c2VzIG9m
IGEgZHJtX2JyaWRnZSAodmlhIG9mX2RybV9maW5kX2JyaWRnZSgpKSwgc28gSSBvbmx5Cj4gY29u
c2lkZXJlZCBsb2NhdGlvbnMgd2hlcmUgZHJtX2JyaWRnZV9hZGQvcmVtb3ZlKCkgd2VyZSB1c2Vk
Lgo+IAo+IFdvdWxkIHlvdSBiZSBva2F5IHdpdGggYSBwcm9taXNlIHRvIHB1c2ggYSBjbGVhbnVw
IG9mIHRoaXMgb25lIGFuZCB0aGUKPiBvbmUgaW4gc3RpX2hkYS5jIGFmdGVyIHBhdGNoIDEvMzAg
bGFuZHMgaW4gc29tZSBmb3JtPyBJJ2QgcmF0aGVyIG5vdAo+IG1ha2UgdGhpcyBzZXJpZXMgbXVj
aCBsb25nZXIsIGl0J3MgYWxyZWFkeSBwdXNoaW5nIGl0IGF0IDMwIDopLgoKQWJzb2x1dGVseSAt
IG15IGRyaXZlLWJ5IGNvbW1lbnQgd2FzIG1vcmUgb3V0IG9mIGNvbmNlcm4gaWYgdGhpcwp3YXMg
bWlzc2luZy4gQSBjbGVhbi11cCBsYXRlciBzb3VucyBnb29kLgoKCVNhbQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
