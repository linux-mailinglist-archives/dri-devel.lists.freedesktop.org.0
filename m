Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CE37D829
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 11:03:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 297AC6E417;
	Thu,  1 Aug 2019 09:03:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B8916E417
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 09:03:01 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7192xQc124061;
 Thu, 1 Aug 2019 04:02:59 -0500
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7192x3D027534
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 1 Aug 2019 04:02:59 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 1 Aug
 2019 04:02:59 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 1 Aug 2019 04:02:59 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7192v7x002667;
 Thu, 1 Aug 2019 04:02:58 -0500
Subject: Re: [PATCH v2 0/8] drm/omap: OMAP_BO flags
To: Jean-Jacques Hiblot <jjhiblot@ti.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>
References: <20190708104520.24217-1-jjhiblot@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <911cb7a8-aec5-0e8a-d82f-aeec2777d2df@ti.com>
Date: Thu, 1 Aug 2019 12:02:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190708104520.24217-1-jjhiblot@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1564650179;
 bh=U2z4e033b8OgXOgxEAVT+dfRUmIuH9+p+AUMsdFFPxg=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=iBZGoqmXXefz0eXBcm/MCj3x/c20v8u/vsF1Hh1sH3f25blfQL3BEODguJln07ctI
 FzEBv6EMhNjxgwWnbE2cG6YWA9fcQL4F9xV6aYABORm/uIroBGFZRLn1EJV30035m6
 JvXpWxRIUX256PlaqThIAJOibZmzLrXE4TAnBGoE=
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
Cc: jsarha@ti.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSkosCgpPbiAwOC8wNy8yMDE5IDEzOjQ1LCBKZWFuLUphY3F1ZXMgSGlibG90IHdyb3RlOgo+
IEEgZmlyc3QgdmVyc2lvbiBvZiB0aGlzIHdvcmsgaGFkIGJlZW4gc2VudCBieSBUb21pIFZhbGtl
aW5lbiBpbiBtYXkgMjAxNwo+IChodHRwczovL3d3dy5zcGluaWNzLm5ldC9saXN0cy9kcmktZGV2
ZWwvbXNnMTQwNjYzLmh0bWwpLgo+IAo+IFRoaXMgc2VyaWVzIGFkZHMgYSBmZXcgbmV3IE9NQVBf
Qk8gZmxhZ3MgdG8gaGVscCB0aGUgdXNlcnNwYWNlIG1hbmFnZQo+IHNpdHVhdGlvbnMgd2hlcmUg
aXQgbmVlZHMgdG8gdXNlIGxvdHMgb2YgYnVmZmVycywgYW5kIHdvdWxkIGN1cnJlbnRseSBydW4K
PiBvdXQgb2YgVElMRVIgc3BhY2UuIFRoZSBUSUxFUiBzcGFjZSBpcyBsaW1pdGVkIHRvIG1hcHBp
bmcgMTI4TUIgYXQgYW55IGdpdmVuCj4gdGltZSBhbmQgc29tZSBhcHBsaWNhdGlvbnMgbWlnaHQg
bmVlZCBtb3JlLgo+IAo+IFRoaXMgc2VyZXMgaXMgYWxzbyB0aGUgb3Bwb3J0dW5pdHkgdG8gZG8g
c29tZSBjbGVhbnVwIGluIHRoZSBmbGFncyBhbmQKPiBpbXByb3ZlIHRoZSBjb21tZW50cyBkZXNj
cmliaW5nIHRoZW0uCj4gCj4gVGhlIHVzZXItc3BhY2UgcGF0Y2hlcyBmb3IgbGliZHJtLCBhbHRo
b3VnaCByZWFkeSwgaGF2ZW4ndCBiZWVuIHBvc3RlZCB5ZXQuCj4gSXQgd2lsbCBiZSBiZSBkb25l
IHdoZW4gdGhpcyBzZXJpZXMgaGF2ZSBiZWVuIGRpc2N1c3NlZCBhbmQgaG9wZWZ1bGx5IGluCj4g
dGhlIHByb2Nlc3Mgb2YgZ2V0dGluZyBtZXJnZWQuCj4gCj4gSkoKPiAKPiBjaGFuZ2VzIGluIHYy
Ogo+IC0gZml4ZWQgYnVpbGQgZXJyb3IgdGhhdCBjcmVwdCBpbiBkdXJpbmcgcmViYXNlIGJlZm9y
ZSBzZW5kaW5nIChzb3JyeQo+ICAgIGFib3V0IHRoYXQpCj4gLSByZXdvcmsgdGhlIHJlZmNvdW50
IHBhcnQgYSBiaXQuCj4gCj4gSmVhbi1KYWNxdWVzIEhpYmxvdCAoMSk6Cj4gICAgZHJtL29tYXA6
IHVzZSByZWZjb3VudCBBUEkgdG8gdHJhY2sgdGhlIG51bWJlciBvZiB1c2VycyBvZiBkbWFfYWRk
cgo+IAo+IFRvbWkgVmFsa2VpbmVuICg3KToKPiAgICBkcm0vb21hcDogYWRkIG9tYXBfZ2VtX3Vu
cGluX2xvY2tlZCgpCj4gICAgZHJtL29tYXA6IGFjY2VwdCBOVUxMIGZvciBkbWFfYWRkciBpbiBv
bWFwX2dlbV9waW4KPiAgICBkcm0vb21hcDogY2xlYW51cCBPTUFQX0JPIGZsYWdzCj4gICAgZHJt
L29tYXA6IHJlbW92ZSBPTUFQX0JPX1RJTEVEIGRlZmluZQo+ICAgIGRybS9vbWFwOiBjbGVhbnVw
IE9NQVBfQk9fU0NBTk9VVCB1c2UKPiAgICBkcm0vb21hcDogYWRkIG9tYXBfZ2VtX3ZhbGlkYXRl
X2ZsYWdzKCkKPiAgICBkcm0vb21hcDogYWRkIE9NQVBfQk8gZmxhZ3MgdG8gYWZmZWN0IGJ1ZmZl
ciBhbGxvY2F0aW9uCgpXZXJlIHRoZXJlIGFueSBjaGFuZ2VzIHRvIHRoZXNlIHBhdGNoZXMgY29t
cGFyZWQgdG8gdGhlIG9uZXMgSSBzZW50IGEgCmZldyB5ZWFycyBiYWNrPwoKSWYgSSByZWNhbGwg
cmlnaHQsIG9uZSB2YWxpZCBjb21tZW50IGZyb20gTGF1cmVudCB3YXMgYWxzbyBhYm91dCBhZGRp
bmcgCmtlcm5lbC1kb2MgZm9yIGluY2x1ZGUvdWFwaS9kcm0vb21hcF9kcm0uaC4gVGhlIE9NQVBf
Qk9fKiBmbGFncyBjb3VsZCAKaGF2ZSBhIGJpdCBtb3JlIGV4cGxhbmF0aW9ucyBpbiB0aGUgZm9y
bSBvZiBrZXJuZWwgZG9jLgoKICBUb21pCgotLSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBP
eSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNzIElE
OiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
