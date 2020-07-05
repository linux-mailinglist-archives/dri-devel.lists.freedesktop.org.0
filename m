Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7D0214DE0
	for <lists+dri-devel@lfdr.de>; Sun,  5 Jul 2020 17:58:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC3676E1EE;
	Sun,  5 Jul 2020 15:58:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADDC16E1EE
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jul 2020 15:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:Cc:To:Subject:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NHevZJPUkjg54LOPyXWTmOALzTwaDHaAfPBRFrHmVf0=; b=Y03bGvTD32hKlEebGxu9pVvp6F
 iQoIsYXOXAZSnnVj4UC9eAfVZQ26XN1QU5cVgOioREGDSq/yf9i4ZzYBufEK/s4JC27DI0ECfy0zA
 ms7+t+aMqa49Q6rJmfuvbe7CAf31WyZstwJHY3l7zaoVhD3lpZhQaEhQwwP1EtZgesWzA8SG+vdll
 sksnG7f8NKyqqidBc0v9svMibBJ9G3MUg3l+MbDDe7d9o6VIqfVzKAsRlQKbCz1qyvolt5e/omWEU
 U2YuvN9PBA+6RQsZJrOuFfX+OSrlz8uhJoHmz11ORT5u2joutANDReIJl8xR0PNQDSC33g45Wx5rv
 OAdfSMVA==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:55281
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1js724-0003uP-St; Sun, 05 Jul 2020 17:58:20 +0200
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH] drm/dbi: Fix SPI Type 1 (9-bit) transfer
To: Paul Cercueil <paul@crapouillou.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20200703141341.1266263-1-paul@crapouillou.net>
Message-ID: <0dda6b3f-ea8c-6a7e-5c7c-f26874b825c8@tronnes.org>
Date: Sun, 5 Jul 2020 17:58:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200703141341.1266263-1-paul@crapouillou.net>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMDMuMDcuMjAyMCAxNi4xMywgc2tyZXYgUGF1bCBDZXJjdWVpbDoKPiBUaGUgZnVuY3Rp
b24gbWlwaV9kYmlfc3BpMV90cmFuc2ZlcigpIHdpbGwgdHJhbnNmZXIgaXRzIHBheWxvYWQgYXMg
OS1iaXQKPiBkYXRhLCB0aGUgOXRoIChNU0IpIGJpdCBiZWluZyB0aGUgZGF0YS9jb21tYW5kIGJp
dC4gSW4gb3JkZXIgdG8gZG8gdGhhdCwKPiBpdCB1bnBhY2tzIHRoZSA4LWJpdCB2YWx1ZXMgaW50
byAxNi1iaXQgdmFsdWVzLCB0aGVuIHNldHMgdGhlIDl0aCBiaXQgaWYKPiB0aGUgYnl0ZSBjb3Jy
ZXNwb25kcyB0byBkYXRhLCBjbGVhcnMgaXQgb3RoZXJ3aXNlLiBUaGUgNyBNU0IgYXJlCj4gcGFk
ZGluZy4gVGhlIGFycmF5IG9mIG5vdyAxNi1iaXQgdmFsdWVzIGlzIHRoZW4gcGFzc2VkIHRvIHRo
ZSBTUEkgY29yZQo+IGZvciB0cmFuc2Zlci4KPiAKPiBUaGlzIGZ1bmN0aW9uIHdhcyBicm9rZW4g
c2luY2UgaXRzIGludHJvZHVjdGlvbiwgYXMgdGhlIGxlbmd0aCBvZiB0aGUKPiBTUEkgdHJhbnNm
ZXIgd2FzIHNldCB0byB0aGUgcGF5bG9hZCBzaXplIGJlZm9yZSBpdHMgY29udmVyc2lvbiwgYnV0
IHRoZQo+IHBheWxvYWQgZG91YmxlZCBpbiBzaXplIGR1ZSB0byB0aGUgOC1iaXQgLT4gMTYtYml0
IGNvbnZlcnNpb24uCj4gCj4gRml4ZXM6IDAyZGQ5NWZlMzE2OSAoImRybS90aW55ZHJtOiBBZGQg
TUlQSSBEQkkgc3VwcG9ydCIpCj4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPiAjIDQuMTAK
ClRoZSBjb2RlIHdhcyBtb3ZlZCB0byBkcm1fbWlwaV9kYmkuYyBpbiA1LjQgc28gdGhpcyBwYXRj
aCB3b24ndCBhcHBseQpiZWZvcmUgdGhhdC4KCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBDZXJjdWVp
bCA8cGF1bEBjcmFwb3VpbGxvdS5uZXQ+Cj4gLS0tCgpUaGFua3MgZm9yIGZpeGluZyB0aGlzLCBj
bGVhcmx5IEkgZGlkbid0IHRlc3QgdGhpcy4gUHJvYmFibHkgYmVjYXVzZSB0aGUKYXV4IHNwaSBp
cCBibG9jayBvbiB0aGUgUmFzcGJlcnJ5IFBpIHRoYXQgY2FuIGRvIDkgYml0IGRpZG4ndCBoYXZl
IGEKZHJpdmVyIGF0IHRoZSB0aW1lLiBEaWQgeW91IGFjdHVhbGx5IHRlc3QgdGhpcyBvciB3YXMg
aXQgc3BvdHRlZCByZWFkaW5nCnRoZSBjb2RlPwoKUmV2aWV3ZWQtYnk6IE5vcmFsZiBUcsO4bm5l
cyA8bm9yYWxmQHRyb25uZXMub3JnPgoKPiAgZHJpdmVycy9ncHUvZHJtL2RybV9taXBpX2RiaS5j
IHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9taXBpX2RiaS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9taXBpX2RiaS5jCj4gaW5kZXggYmIyN2M4Mjc1N2YxLi5iZjc4ODhhZDlh
ZDQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9taXBpX2RiaS5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9taXBpX2RiaS5jCj4gQEAgLTkyMyw3ICs5MjMsNyBAQCBzdGF0
aWMgaW50IG1pcGlfZGJpX3NwaTFfdHJhbnNmZXIoc3RydWN0IG1pcGlfZGJpICpkYmksIGludCBk
YywKPiAgCQkJfQo+ICAJCX0KPiAgCj4gLQkJdHIubGVuID0gY2h1bms7Cj4gKwkJdHIubGVuID0g
Y2h1bmsgKiAyOwo+ICAJCWxlbiAtPSBjaHVuazsKPiAgCj4gIAkJcmV0ID0gc3BpX3N5bmMoc3Bp
LCAmbSk7Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
