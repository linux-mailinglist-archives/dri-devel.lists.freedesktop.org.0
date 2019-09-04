Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1705BA8612
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 17:33:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F3F89B61;
	Wed,  4 Sep 2019 15:33:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3359589B61
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 15:33:04 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:61758
 helo=[192.168.10.177])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1i5XHJ-0000C1-K5; Wed, 04 Sep 2019 17:33:01 +0200
Subject: Re: [PATCH] drm: Use EOPNOTSUPP, not ENOTSUPP
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20190904143942.31756-1-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <5869d55b-1294-89a1-6108-f8203b26a204@tronnes.org>
Date: Wed, 4 Sep 2019 17:32:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904143942.31756-1-daniel.vetter@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=gpu7aXjMeeAzm8/LxL3t6csXZo9/o2jdyJiLLEfwTqo=; 
 b=BWirf9IUNPh5Iq21w/mXBXRGQlAry9LXyNTDoPGXB4axC46Km6LESZIqrhBy4nUMwyIENPQWE1TjeKUYk5YRZRYum69dkATdgvTS8+whUNaLuDYmuWdkd2HdUgD2f8E+nqM7BmOB6seosAr/q0eUcXv6dKchBGaHPTu8wye1VAe3rRq0TOJzq/1TIiSMvAZl7OAKxUfBwYLXB3ZPypMP7wx+coLduwXyIoH1XocJ5zjjK2w22XrY6xXJUPdqa9jBebA5zDktd0/oR5cKUiHfdOBLn8CTzRbfAiDvNKJXRskIKV6bzxmZ4sSLA6060nX5zhzquKMFvUvRFo21PFhgWA==;
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
Cc: Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Jos=c3=a9_Roberto_de_Souza?= <jose.souza@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>,
 Andres Rodriguez <andresx7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMDQuMDkuMjAxOSAxNi4zOSwgc2tyZXYgRGFuaWVsIFZldHRlcjoKPiAtIGl0J3Mgd2hh
dCB3ZSByZWNvbW1lbmQgaW4gb3VyIGRvY3M6Cj4gCj4gaHR0cHM6Ly9kcmkuZnJlZWRlc2t0b3Au
b3JnL2RvY3MvZHJtL2dwdS9kcm0tdWFwaS5odG1sI3JlY29tbWVuZGVkLWlvY3RsLXJldHVybi12
YWx1ZXMKPiAKPiAtIGl0J3MgdGhlIG92ZXJ3aGVsbWluZ2x5IHVzZWQgZXJyb3IgY29kZSBmb3Ig
Im9wZXJhdGlvbiBub3QKPiAgIHN1cHBvcnRlZCIsIGF0IGxlYXN0IGluIGRybSBjb3JlIChzbGln
aHRseSBsZXNzIHNvIGluIGRyaXZlcnMpOgo+IAo+ICQgZ2l0IGdyZXAgRU9QTk9UU1VQIC0tIGRy
aXZlcnMvZ3B1L2RybS8qYyB8IHdjIC1sCj4gODMKPiAkIGdpdCBncmVwIEVOT1RTVVAgLS0gZHJp
dmVycy9ncHUvZHJtLypjIHwgd2MgLWwKPiA1Cj4gCj4gLSBpbmNsdWRlL2xpbnV4L2Vycm5vLmgg
bWFrZXMgaXQgZmFpcmx5IGNsZWFyIHRoYXQgdGhlc2UgYXJlIGZvciBuZnN2Mwo+ICAgKHBsdXMg
dGhleSBhbHNvIGhhdmUgZXJyb3IgY29kZXMgYWJvdmUgNTEyLCB3aGljaCBpcyB0aGUgYmxvY2sg
d2l0aAo+ICAgc29tZSBzcGVjaWFsIGJlaGF2aW91ciAuLi4pCj4gCj4gLyogRGVmaW5lZCBmb3Ig
dGhlIE5GU3YzIHByb3RvY29sICovCj4gCj4gSWYgdGhlIGFib3ZlIGlzbid0IHJlZmxlY3Rpbmcg
Y3VycmVudCBwcmFjdGljZSwgdGhlbiBJIGd1ZXNzIHdlIHNob3VsZAo+IGF0IGxlYXN0IHVwZGF0
ZSB0aGUgZG9jcy4KPiAKPiBDYzogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBp
bnRlbC5jb20+Cj4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51
eC5pbnRlbC5jb20+Cj4gQ2M6IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4KPiBD
YzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFu
ZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBDYzogQW5kcmVzIFJvZHJpZ3VleiA8YW5kcmVzeDdAZ21h
aWwuY29tPgo+IENjOiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KPiBTaWdu
ZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiAtLS0K
PiAgZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgICAgIHwgNiArKystLS0KPiAgZHJpdmVycy9n
cHUvZHJtL2RybV9taXBpX2RiaS5jIHwgMiArLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKCkFja2VkLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5v
cmFsZkB0cm9ubmVzLm9yZz4KCkJlbiBIdXRjaGluZ3MgbWFkZSB0aGlzIGNvbW1lbnRbMV0gaW4g
YSB0aHJlYWQgYWJvdXQgdXNlIG9mIEVOT1RTVVBQIGluCmRyaXZlcnM6CgogIGdsaWJjJ3Mgc3Ry
ZXJyb3IoKSByZXR1cm5zIHRoZXNlIHN0cmluZ3MgZm9yIEVOT1RTVVBQIGFuZCBFT1BOT1RTVVBQ
CiAgcmVzcGVjdGl2ZWx5OgoKICAiVW5rbm93biBlcnJvciA1MjQiCiAgIk9wZXJhdGlvbiBub3Qg
c3VwcG9ydGVkIgoKU28gYXQgbGVhc3QgZm9yIGVycm9ycyByZXR1cm5lZCB0byB1c2Vyc3BhY2Ug
RU9QTk9UU1VQUCBtYWtlcyBzZW5zZS4KCk5vcmFsZi4KClsxXSBodHRwczovL3BhdGNod29yay5v
emxhYnMub3JnL3BhdGNoLzMwOTYyNy8jNjkwOTk3Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
