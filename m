Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30935F2B7
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2019 11:23:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBBA989187;
	Tue, 30 Apr 2019 09:23:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF51B89187
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 09:23:34 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 47B1D8048B;
 Tue, 30 Apr 2019 11:23:29 +0200 (CEST)
Date: Tue, 30 Apr 2019 11:23:27 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 01/19] drm: Add |struct drm_gem_vram_object| and helpers
Message-ID: <20190430092327.GA13757@ravnborg.org>
References: <20190429144341.12615-1-tzimmermann@suse.de>
 <20190429144341.12615-2-tzimmermann@suse.de>
 <20190429195855.GA6610@ravnborg.org>
 <1d14ef87-e1cd-4f4a-3632-bc045a1981c6@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1d14ef87-e1cd-4f4a-3632-bc045a1981c6@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=4dPDjfAGX_YviR3WrIMA:9 a=CjuIK1q_8ugA:10
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
Cc: airlied@linux.ie, puck.chen@hisilicon.com, Jerry.Zhang@amd.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 z.liuxinliang@hisilicon.com, hdegoede@redhat.com,
 kong.kongxinwei@hisilicon.com, ray.huang@amd.com, kraxel@redhat.com,
 zourongrong@gmail.com, christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhvbWFzLgoKPiA+PiArCj4gPj4gKy8qKgo+ID4+ICsgKiBSZXR1cm5zIHRoZSBjb250YWlu
ZXIgb2YgdHlwZSAmc3RydWN0IGRybV9nZW1fdnJhbV9vYmplY3QKPiA+PiArICogZm9yIGZpZWxk
IGJvLgo+ID4+ICsgKiBAYm86CQl0aGUgVlJBTSBidWZmZXIgb2JqZWN0Cj4gPj4gKyAqIFJldHVy
bnM6CVRoZSBjb250YWluaW5nIEdFTSBWUkFNIG9iamVjdAo+ID4+ICsgKi8KPiA+PiArc3RhdGlj
IGlubGluZSBzdHJ1Y3QgZHJtX2dlbV92cmFtX29iamVjdCogZHJtX2dlbV92cmFtX29mX2JvKAo+
ID4+ICsJc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibykKPiA+PiArewo+ID4+ICsJcmV0dXJu
IGNvbnRhaW5lcl9vZihibywgc3RydWN0IGRybV9nZW1fdnJhbV9vYmplY3QsIGJvKTsKPiA+PiAr
fQo+ID4gSW5kZW50IGZ1bm55LiBVU2Ugc2FtZSBpbmRlbnQgYXMgdXNlZCBpbiBvdGhlciBwYXJ0
cyBvZiBmaWxlIGZvcgo+ID4gZnVuY3Rpb24gYXJndW1lbnRzLgo+IAo+IElmIEkgcHV0IHRoZSBh
cmd1bWVudCBuZXh0IHRvIHRoZSBmdW5jdGlvbidzIG5hbWUsIGl0IHdpbGwgZXhjZWVkIHRoZQo+
IDgwLWNoYXJhY3RlciBsaW1pdC4gRnJvbSB0aGUgY29kaW5nLXN0eWxlIGRvY3VtZW50LCBJIGNv
dWxkIG5vdCBzZWUgd2hhdAo+IHRvIGRvIGluIHRoaXMgY2FzZS4gT25lIHNvbHV0aW9uIHdvdWxk
IG1vdmUgdGhlIHJldHVybiB0eXBlIHRvIGEKPiBzZXBhcmF0ZSBsaW5lIGJlZm9yZSB0aGUgZnVu
Y3Rpb24gbmFtZS4gSSd2ZSBub3Qgc2VlbiB0aGF0IGFueXdoZXJlIGluCj4gdGhlIHNvdXJjZSBj
b2RlLCBzbyBtb3ZpbmcgdGhlIGFyZ3VtZW50IG9udG8gYSBzZXBhcmF0ZSBsaW5lIGFuZAo+IGlu
ZGVudGluZyBieSBvbmUgdGFiIGFwcGVhcnMgdG8gYmUgdGhlIG5leHQgYmVzdCBzb2x1dGlvbi4g
UGxlYXNlIGxldCBtZQo+IGtub3cgaWYgdGhlcmUncyBpZiB0aGVyZSdzIGEgcHJlZmVycmVkIHN0
eWxlIGZvciBjYXNlcyBsaWtlIHRoaXMgb25lLgoKUmVhZGFiaWxpdHkgaGFzIElNTyBoaWdoZXIg
cHJpb3JpdHkgdGhhbiBzb21lIGxpbWl0IG9mIDgwIGNoYXJzLgpBbmQgaXQgaHVydHMgcmVhZGFi
aWxpdHkgKGF0IGxlYXN0IG15IE9DRCkgd2hlbiBzdHlsZSBjaGFuZ2VzCmFzIHlvdSBkbyB3aXRo
IGluZGVudCBoZXJlLiBTbyBteSBwZXJzb25hbCBwcmVmZXJlbmNlIGlzIHRvIGZpeAppbmRlbnQg
YW5kIGFjY2VjdCBsb25nZXIgbGluZXMuCgpCdXQgeW91IGFzayBmb3IgYSBwcmVmZXJyZWQgc3R5
bGUgLSB3aGljaCBJIGRvIG5vdCB0aGluayB3ZSBoYXZlIGluIHRoaXMKY2FzZS4gU28gaXQgYm9p
bHMgZG93biB0byB3aGF0IHlvdSBwcmVmZXIuCgpFbm91Z2ggYmlrZXNoZWRkaW5nLCB0aGFua3Mg
Zm9yIHRoZSBxdWljayByZXNwb25zZS4KCglTYW0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
