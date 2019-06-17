Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE15487C6
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 17:48:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 188518919A;
	Mon, 17 Jun 2019 15:47:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C248913D;
 Mon, 17 Jun 2019 15:47:57 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:50461
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hctrP-0002ej-M6; Mon, 17 Jun 2019 17:47:55 +0200
Subject: Re: [PATCH 01/59] drm/todo: Improve drm_gem_object funcs todo
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-2-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <f326e4e2-2cc3-6e90-f9d3-96b5c8c8b070@tronnes.org>
Date: Mon, 17 Jun 2019 17:47:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614203615.12639-2-daniel.vetter@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=PjT+afcywmfzdbjrOqqXaV5K4mA8CVx532HIf8ZAUaI=; 
 b=uhgtKjVb5hPh52uyzajzncDnB2Q5suif51trCMrl807I552Mqgzsd/EITHuVYHqKvwLseMoQFwrimkfbwKGYFGrtQZbwG0c7fwwOfDbQ0k3MSwbPoOrsSZ7IygOPCgLXF1yeBYWc12/Nyorx/rtoWo84pOkol6qtYmFb3p96UxwMoyylWfeUbeHrN96299z3Y1Icdcrtuvq/rtSQiIxc53IUogCMrnqvyIo1tLkPLAFUplNxoTDGwhht4rCTJPsBgnD9d5/wgIRy9OVF0pLbAY3k79+yCuULrigTC/g2E8llaKCgn/vAU0SLgsgXwFDUSeU8I6lNSR52+YwxgicMOg==;
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMTQuMDYuMjAxOSAyMi4zNSwgc2tyZXYgRGFuaWVsIFZldHRlcjoKPiBXZSdyZSBraW5k
YSBnb2luZyBpbiB0aGUgd3JvbmcgZGlyZWN0aW9uLiBTcG90dGVkIHdoaWxlIHR5cGluZyBiZXR0
ZXIKPiBnZW0vcHJpbWUgZG9jcy4KPiAKPiBDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJt
YW5uQHN1c2UuZGU+Cj4gQ2M6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgo+IENj
OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+IENjOiBOb3JhbGYgVHLDuG5uZXMgPG5v
cmFsZkB0cm9ubmVzLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwu
dmV0dGVyQGludGVsLmNvbT4KPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QgfCA0
ICsrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdCBiL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0
Cj4gaW5kZXggYjRhNzZjMjcwM2U1Li4yMzU4M2YwZTM3NTUgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1l
bnRhdGlvbi9ncHUvdG9kby5yc3QKPiArKysgYi9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdAo+
IEBAIC0yMjgsNiArMjI4LDEwIEBAIHN0cnVjdCBkcm1fZ2VtX29iamVjdF9mdW5jcwo+ICBHRU0g
b2JqZWN0cyBjYW4gbm93IGhhdmUgYSBmdW5jdGlvbiB0YWJsZSBpbnN0ZWFkIG9mIGhhdmluZyB0
aGUgY2FsbGJhY2tzIG9uIHRoZQo+ICBEUk0gZHJpdmVyIHN0cnVjdC4gVGhpcyBpcyBub3cgdGhl
IHByZWZlcnJlZCB3YXkgYW5kIGRyaXZlcnMgY2FuIGJlIG1vdmVkIG92ZXIuCj4gIAo+ICtVbmZv
cnR1bmF0ZWx5IHNvbWUgb2YgdGhlIHJlY2VudGx5IGFkZGVkIEdFTSBoZWxwZXJzIGFyZSBnb2lu
ZyBpbiB0aGUgd3JvbmcKPiArZGlyZWN0aW9uIGJ5IGFkZGluZyBPUFMgbWFjcm9zIHRoYXQgdXNl
IHRoZSBvbGQsIGRlcHJlY2F0ZWQgaG9va3MuIFNlZQo+ICtEUk1fR0VNX0NNQV9WTUFQX0RSSVZF
Ul9PUFMsIERSTV9HRU1fU0hNRU1fRFJJVkVSX09QUywgYW5kIERSTV9HRU1fVlJBTV9EUklWRVJf
UFJJTUUuCj4gKwoKQm90aCBEUk1fR0VNX0NNQV9WTUFQX0RSSVZFUl9PUFMgYW5kIERSTV9HRU1f
U0hNRU1fRFJJVkVSX09QUyB1c2UgdGhlCkdFTSB2dGFibGUuIE9yIGFtIEkgbWlzc2luZyBzb21l
dGhpbmcgaGVyZT8KCk5vcmFsZi4KCj4gIFVzZSBEUk1fTU9ERVNFVF9MT0NLX0FMTF8qIGhlbHBl
cnMgaW5zdGVhZCBvZiBib2lsZXJwbGF0ZQo+ICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgCj4gCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
