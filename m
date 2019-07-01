Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 798D15B58F
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 09:13:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FBB789F19;
	Mon,  1 Jul 2019 07:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 860BA89C1B
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2019 03:39:28 +0000 (UTC)
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16]
 helo=dragon.dunlab)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hhnA2-0005HP-JY; Mon, 01 Jul 2019 03:39:22 +0000
To: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] drm: bridge: DRM_SIL_SII8620 should depend on, not select
 INPUT
Message-ID: <8baa25c0-498b-d321-4e6a-fe987a4989ba@infradead.org>
Date: Sun, 30 Jun 2019 20:39:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Mon, 01 Jul 2019 07:12:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WmShzI9iFuKGxmB8xLb0p4KOmNmec9AETrO7/tG34T0=; b=Qn7AHdhRQFyigFqNMTVizzZAh
 Hj1RMvU2sMlXLkyWgMj2cs6q9Szx7vdGU9yu9gioYef22lNmR+J/sSdAGE/a9kJ7jDVEzh2TvlX8S
 w4lQZqPLfIN9OrKs1wcdZfEtFVlS/qKdMDbabY8NP11WGPzugE6MPTCKjQPvvw2gTOlJu0Cd4fbC5
 28HpYaANDX9JJyU5Z06cEFF4awRRUdiBd3rPlAG7ywv4wyFkgMZM2N2bs2qf2N540acZkpYW06R5/
 12BcK9+TFp3iMWKrw0cJtcEMk/4LllcBxMcUJ6NURE27oul16kBfEmLW+tR6bf8MIdwPT59iYyqwu
 2+Pw6KL3Q==;
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
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+CgpBIHNpbmdsZSBkcml2
ZXIgc2hvdWxkIG5vdCBlbmFibGUgKHNlbGVjdCkgYW4gZW50aXJlIHN1YnN5c3RlbSwKc3VjaCBh
cyBJTlBVVCwgc28gY2hhbmdlIHRoZSAnc2VsZWN0JyB0byAiZGVwZW5kcyBvbiIuCgpGaXhlczog
ZDZhYmU2ZGY3MDZjICgiZHJtL2JyaWRnZTogc2lsX3NpaTg2MjA6IGRvIG5vdCBoYXZlIGEgZGVw
ZW5kZW5jeSBvZiBSQ19DT1JFIikKClNpZ25lZC1vZmYtYnk6IFJhbmR5IER1bmxhcCA8cmR1bmxh
cEBpbmZyYWRlYWQub3JnPgpDYzogSW5raSBEYWUgPGlua2kuZGFlQHNhbXN1bmcuY29tPgpDYzog
QW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KQ2M6IExhdXJlbnQgUGluY2hhcnQg
PExhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKLS0tCkxpbnVzIGhhcyB3cml0dGVuIHRoaXMgYSBjb3VwbGUgb2YgdGlt
ZXMgaW4gdGhlIGxhc3QgMTUgeWVhcnMgb3Igc28sCmJ1dCBteSBzZWFyY2ggZnUgY2Fubm90IGZp
bmQgaXQuICBBbmQgdGhlcmUgYXJlIGEgZmV3IGRyaXZlcnMgaW4gdGhlCmtlcm5lbCB0cmVlIHRo
YXQgZG8gdGhpcywgYnV0IHdlIHNob3VsZG4ndCBiZSBhZGRpbmcgbW9yZSB0aGF0IGRvIHNvLgoK
IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZpZyB8ICAgIDMgKy0tCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgotLS0gbG54LTUyLXJjNy5vcmlnL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZpZworKysgbG54LTUyLXJjNy9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL0tjb25maWcKQEAgLTgzLDEwICs4Myw5IEBAIGNvbmZpZyBEUk1fUEFSQURFX1BT
ODYyMgogCiBjb25maWcgRFJNX1NJTF9TSUk4NjIwCiAJdHJpc3RhdGUgIlNpbGljb24gSW1hZ2Ug
U0lJODYyMCBIRE1JL01ITCBicmlkZ2UiCi0JZGVwZW5kcyBvbiBPRgorCWRlcGVuZHMgb24gT0Yg
JiYgSU5QVVQKIAlzZWxlY3QgRFJNX0tNU19IRUxQRVIKIAlpbXBseSBFWFRDT04KLQlzZWxlY3Qg
SU5QVVQKIAlzZWxlY3QgUkNfQ09SRQogCWhlbHAKIAkgIFNpbGljb24gSW1hZ2UgU0lJODYyMCBI
RE1JL01ITCBicmlkZ2UgY2hpcCBkcml2ZXIuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
