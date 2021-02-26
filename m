Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AA1326252
	for <lists+dri-devel@lfdr.de>; Fri, 26 Feb 2021 13:09:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 020E66E3F4;
	Fri, 26 Feb 2021 12:09:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5ED36E3F4
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 12:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=069mkm7tqItUG64Ib7wUtneTZFgWoa3IFZJXAvEdDLw=; b=dLfKwVJh7zQUEaYCNBkkubHqqr
 ktYyAfOJhtunI4nYnifVe4V5LgzTWkZeQujkEhMpOcxOyUh5aL2E9H4UNKk5yz3bzJKG/KAgB0djH
 3T4oB1NeEpJDYReVt0iDNm4AY8cqyt4TF1ePmSlTA/kJ+aovs8QSAOIGx1o2/57qoWw0+zlZZse2R
 vsg4BPJbhQc5PojOwsbvPt0/FdWRe4TuAC1HzrULRL1qzWYkNNDW6mkAjFHUJ7DUZk6SgXn4ZiwDp
 M41saTuaKFIz575OJcR6ILGnZxsWyH0uG/6vV2+dRrWxObfNjPfHScffIPcTsmFrcM8/+OQpu+kZl
 0PkEbyig==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:65161
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1lFbvr-0007hf-M6; Fri, 26 Feb 2021 13:09:19 +0100
Subject: Re: [PATCH v6 3/3] drm: Add GUD USB Display driver
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
To: Peter Stuge <peter@stuge.se>
References: <20210219121702.50964-1-noralf@tronnes.org>
 <20210219121702.50964-4-noralf@tronnes.org>
 <20210219214243.11330.qmail@stuge.se>
 <5c00a868-3a2f-438b-3670-ee86caef4d2a@tronnes.org>
Message-ID: <3ee3fad6-61be-b848-a68f-df7c2e0001f9@tronnes.org>
Date: Fri, 26 Feb 2021 13:09:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <5c00a868-3a2f-438b-3670-ee86caef4d2a@tronnes.org>
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
Cc: hudson@trmm.net, markus@raatikainen.cc,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org, th020394@gmail.com, lkundrak@v3.sk,
 pontus.fuchs@gmail.com, sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMjAuMDIuMjAyMSAxOC4yNywgc2tyZXYgTm9yYWxmIFRyw7hubmVzOgo+IAo+IAo+IERl
biAxOS4wMi4yMDIxIDIyLjQyLCBza3JldiBQZXRlciBTdHVnZToKCj4+Cj4+IE1vcmUgZ2VuZXJh
bGx5IGl0J3Mgbm90IHZlcnkgdHlwaWNhbCBpbiBVU0IgdG8gcmVwb3J0IHRoZSBkYXRhIHNpemUK
Pj4gc2VwYXJhdGVseSBmcm9tIHRoZSBkYXRhIGl0c2VsZiwgaWYgcmVwb3J0aW5nIHNpemUgZXhw
bGljaXRseSBhdCBhbGwuCj4+Cj4+IFNpemVzIGNhbiBiZSBwYXJ0IG9mIHRoZSBkYXRhIHN0cnVj
dHVyZSBpdHNlbGYgKGxpa2UgaW4gZGVzY3JpcHRvcnMpIGJ1dAo+PiBvbiB0aGUgYXBwbGljYXRp
b24gbGF5ZXIgKGxpa2UgaGVyZSkgaXQncyBjb252ZW5pZW50IHRvIGp1c3QgZGVjaWRlIGEKPj4g
c2Vuc2libGUgZml4ZWQgbWF4aW11bSBzaXplIGFuZCBsZXQgdGhlIGhvc3QgdHJ5IHRvIGFsd2F5
cyB0cmFuc2Zlcgo+PiB0aGF0IHNpemUgd2hpbGUgYWNjZXB0aW5nIHNob3J0IHRyYW5zZmVycy4g
VW5saWtlIHJlYWQoKSBhIHNob3J0Cj4+IHRyYW5zZmVyIG9ubHkgZXZlciBoYXBwZW5zIGlmIGFu
ZCB3aGVuIGEgZGV2aWNlIGludGVuZHMgZm9yIGl0LAo+PiBzbyB0aGF0J3MgbGlrZSBhbiBpbi1i
YW5kIGhhbmRzaGFrZSBidXQgImZvciBmcmVlIi4KPj4KPj4gT2gsIGFuZCBkb2VzL3Nob3VsZCB0
aGUgR1VEIEVESUQgY2hhbmdlIGlmIHRoZSBwYW5lbCAiYmVoaW5kIiB0aGUgZGV2aWNlCj4+IENQ
VSBvbiBhIGhvdHBsdWdnYWJsZSBjb25uZWN0b3IgY2hhbmdlcz8gSXQgd291bGRuJ3QgYmUgZ3Jl
YXQgdG8gcmVxdWlyZQo+PiBHVUQgZHJpdmVyIHJlcHJvYmUgaW4gdGhhdCBjYXNlLiBCdXQgbWF5
YmUgRFJNIHJlcXVpcmVzIHRoYXQgYW55d2F5Pwo+Pgo+IAo+IElmIGd1ZF9jb25uZWN0b3Jfc3Rh
dHVzX3JlcS5zdGF0dXMgaGFzIGNoYW5nZWQgc2luY2UgbGFzdCBwb2xsIG9yCj4gR1VEX0NPTk5F
Q1RPUl9TVEFUVVNfQ0hBTkdFRCBpcyBzZXQsIERSTSB3aWxsIG5vdGlmeSB1c2Vyc3BhY2Ugd2hp
Y2gKPiB3aWxsIHJlcHJvYmUgdGhlIGNvbm5lY3Rvci4gY29ubmVjdG9yLT5lcG9jaF9jb3VudGVy
KysgaW4KPiBndWRfY29ubmVjdG9yX3N0YXR1c19yZXF1ZXN0KCkgdHJpZ2dlcnMgdGhhdC4KPiAK
Pj4KPj4gSSdtIHNvcnJ5IEkgZGlkbid0IHNwb3QgdGhpcyBwYXR0ZXJuIGVhcmxpZXIsIEkgdW5k
ZXJzdGFuZCB0aGF0IGl0J3MgbGF0ZQo+PiBpbiB0aGUgZ2FtZSBhbmQgdGhhdCBjaGFuZ2luZyBp
dCBuZWVkcyB0aGUgZ2FkZ2V0IHRvIGNoYW5nZSBhcyB3ZWxsLCBidXQgSQo+PiBkbyByZWFsbHkg
dGhpbmsgdGhpcyBpcyBhIHdvcnRod2hpbGUgY2hhbmdlIHRocm91Z2hvdXQgdGhlIHByb3RvY29s
Lgo+Pgo+IAo+IEkgc2VlIHdoYXQgeW91IG1lYW4sIEknbGwgZ2l2ZSBpdCBhIHRyeS4KPiAKClBl
dGVyLCBwbGVhc2UgaGF2ZSBhIGxvb2sgYXQgdGhpcyBkaWZmIGFuZCBzZWUgaWYgSSdtIG9uIHRo
ZSByaWdodCB0cmFjawpoZXJlOiBodHRwczovL2dpc3QuZ2l0aHViLmNvbS9ub3Ryby9hNDNhOTNh
M2FhMGNjNzVkOTMwODkwYjdiMjU0ZmMwYQoKSSB3YW50IHRvIGF2b2lkIHdhaXN0aW5nIGEgcGF0
Y2ggdmVyc2lvbiBjeWNsZSBieSBiZWluZyB3YXkgb2ZmLgoKTm9yYWxmLgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
