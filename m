Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A655A70912
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 21:00:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54BC489DC0;
	Mon, 22 Jul 2019 19:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A188D89DC0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 19:00:18 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:56032
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hpdXk-0001Wz-Fo; Mon, 22 Jul 2019 21:00:16 +0200
Subject: Re: [PATCH 0/6] drm/tinydrm: Move mipi_dbi
To: Eric Anholt <eric@anholt.net>, dri-devel@lists.freedesktop.org
References: <20190720134709.15186-1-noralf@tronnes.org>
 <877e8aeyg8.fsf@anholt.net>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <e4fa9709-e23e-9336-29b7-3d30fbfa86dd@tronnes.org>
Date: Mon, 22 Jul 2019 21:00:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <877e8aeyg8.fsf@anholt.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=7lF2NRd1P4aQqjPOSNrL5mmWFlItrI6Vw0sA5uHhDPE=; 
 b=LIC1Il5McsSJpxfm1TemGI0Xnnzi2Mx6DcssggSojK9pqCWo52sglWHBqhj1hDCh2zWC/8eiC0ndtfqhQmg7M+WPJlhwL2eBHMYsaA85G9pwrtP8NQkJxXNPDH3IxrcEhPoMohvGJT/TQEIgAsqEd3GEklDBXFHL50i/zUIHKdgZNg5AKXOsk47WyH7LMU6d6DD980eE1PIgIN9dL2jhDe77qAyHEtmVlr6qr0eefflcpT0kl/3JZ3HiS+rHWJgAu85LP0awqqa2euQFPLrAvDWYD6tuibP+3bcj8DVX0bGJgHYucIuBu1OJvdNHo1uq59OAkJAuhEBcp0hro4vp/g==;
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
Cc: david@lechnology.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMjIuMDcuMjAxOSAyMC4wNiwgc2tyZXYgRXJpYyBBbmhvbHQ6Cj4gTm9yYWxmIFRyw7hu
bmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+IHdyaXRlczoKPiAKPj4gVGhpcyBzZXJpZXMgdGlja3Mg
b2ZmIHRoZSBsYXN0IHRpbnlkcm0gdG9kbyBlbnRyeSBhbmQgbW92ZXMgb3V0IG1pcGlfZGJpCj4+
IHRvIGJlIGEgY29yZSBoZWxwZXIuCj4+Cj4+IEl0IHNwbGl0cyBzdHJ1Y3QgbWlwaV9kYmkgaW50
byBhbiBpbnRlcmZhY2UgcGFydCBhbmQgYSBkaXNwbGF5IHBpcGVsaW5lCj4+IHBhcnQgKHVwbG9h
ZCBmcmFtZWJ1ZmZlciBvdmVyIFNQSSkuIEkgYWxzbyB0b29rIHRoZSBvcHBvcnR1bml0eSB0bwo+
PiByZW5hbWUgdGhlIGFtYmlndW91cyAnbWlwaScgdmFyaWFibGUgbmFtZSB0byAnZGJpJy4gVGhp
cyBsaW5lcyB1cCB3aXRoCj4+IHRoZSB1c2Ugb2YgdGhlICdkc2knIHZhcmlhYmxlIG5hbWUgaW4g
dGhlIE1JUEkgRFNJIGhlbHBlci4KPj4KPj4gTm90ZToKPj4gVGhpcyBkZXBlbmRzIG9uIHNlcmll
czogZHJtL3Rpbnlkcm06IFJlbW92ZSB0aW55ZHJtLmtvCj4+Cj4+IFNlcmllcyBpcyBhbHNvIGF2
YWlsYWJsZSBoZXJlOgo+PiBodHRwczovL2dpdGh1Yi5jb20vbm90cm8vbGludXgvdHJlZS9tb3Zl
X21pcGlfZGJpCj4gCj4gQ29uZ3JhdHVsYXRpb25zIG9uIG1ha2luZyBpdCB0byB0aGlzIHN0YWdl
LiAgVGhpcyBsb29rcyBsaWtlIGEgZmluZQo+IGNvbmNsdXNpb24gdG8gdGlueWRybS4KPiAKClRo
YW5rcywgaXQgdG9vayBhIHdoaWxlLCBidXQgcmVhbGx5IG5pY2UgdG8gZmluYWxseSBnZXQgaGVy
ZS4KClRoZXJlIGFyZSBvbmx5IHR3byBwYXRjaGVzIGxlZnQgdG8gZG8gbm93LCBvbmUgdG8gcmVt
b3ZlIHRoZSBtZW51Y29uZmlnCnNvIHRoZSBkcml2ZXJzIGFyZSB2aXNpYmxlIGJ5IGRlZmF1bHQg
YW5kIHBlb3BsZSBjYW4gc3RhcnQgcHV0dGluZyB0aGVpcgp0aW55IGRyaXZlcnMgaGVyZSwgYW5k
IHNlY29uZGx5IHRvIGNoYW5nZSB0aGUgZm9sZGVyIG5hbWUgdG8gJ3RpbnknIGFzCkRhbmllbCB3
YW50cyBpdC4KCj4gQWNrZWQtYnk6IEVyaWMgQW5ob2x0IDxlcmljQGFuaG9sdC5uZXQ+Cj4gCgpU
aGFua3MsIGNhcmUgdG8gdGFrZSBhIGxvb2sgYXQgdmVyc2lvbiAyIG9mIHRoZSBzZXJpZXM/IEkg
aGFkIHRvIGFkZCAzCnBhdGNoZXMgdG8gZGVhbCB3aXRoIGEga2NvbmZpZyBkZXBlbmRlbmN5IHRo
YXQgSSBoYWQgbWlzc2VkIG91dCBvbi4KCk5vcmFsZi4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
