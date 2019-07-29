Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC791796CC
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 21:55:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A1896E1D3;
	Mon, 29 Jul 2019 19:55:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A2989D44
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 19:55:48 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:57528
 helo=localhost.localdomain)
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_CBC_SHA1:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hsBkI-0003F7-6y; Mon, 29 Jul 2019 21:55:46 +0200
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 0/4] drm/mipi-dbi: Support panel drivers
Date: Mon, 29 Jul 2019 21:55:22 +0200
Message-Id: <20190729195526.13337-1-noralf@tronnes.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
 bh=dYiWPS00hd1Ya6xf94NYBtNfNi5AxS+aP/56O35HEdk=; 
 b=uMNzIF98uOSCGdhJFJ2sCB59EqBUZdF/5WmEO3sTCaIT96f0EIvJAaF+qrRByzh0e2Em5+EUf98OPwAaRHLwHSr5aYScWhX32DbHf18w8X+0HkJZ55vntHE/usu+k/oI+RF/PdQ4cvllTL5yp9PzqoBlUogeRJcvkRc7yJ9QKc72pKvcsiJ87378lJqE8eMqPOc6p1wdE4sGqkIpOR6csxOcBTnamJ7Sya2wrGMMSI2v/vNwWE4ByIdD4LhEfcF1LGhHlFpV3iY4LY6OaHuNKw9GZfJ+GZB5Tek1KDiF3u29sQfQd8r9mGxHZ3bFlwbhZaY0EF/OwlAjZCCJuf+fjQ==;
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
Cc: daniel.vetter@ffwll.ch, josef@lusticky.cz, thierry.reding@gmail.com,
 laurent.pinchart@ideasonboard.com, sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5zcGlyZWQgYnkgdGhlIHRocmVhZFsxXSBmb2xsb3dpbmcgdGhlIHN1Ym1pc3Npb24gb2YgYSBu
ZXcgaWxpOTM0MQpwYW5lbCBkcml2ZXJbMl0sIEkgc2V0IG91dCB0byBzZWUgaWYgSSBjb3VsZCBz
dXBwb3J0IHBhbmVsIGRyaXZlcnMgaW4KZHJtX21pcGlfZGJpLgoKSSBoYXZlIGluY2x1ZGVkIHRo
ZSBvcmlnaW5hbCBkcml2ZXIsIGRvbmUgc29tZSBwcmVwIHdvcmsgb24gaXQsIGFkZGVkCnBhbmVs
IHN1cHBvcnQgdG8gZHJtX21pcGlfZGJpIGFuZCBjb252ZXJ0ZWQgbWkwMjgzcXQgdG8gdGhpcyBu
ZXcgcGFuZWwKZHJpdmVyLgoKVGhlIGJpZyBxdWVzdGlvbiBpcyB3aGV0aGVyIG9yIG5vdCBwYW5l
bCBkcml2ZXJzIHNob3VsZCBiZSBhbGxvd2VkIHRvCnR1cm4gdGhlbXNlbHZlcyBpbnRvIGZ1bGwg
ZmxlZGdlZCBEUk0gZHJpdmVycy4KCk5vcmFsZi4KClsxXQpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9hcmNoaXZlcy9kcmktZGV2ZWwvMjAxOS1KdWx5LzIyODE5My5odG1sClsyXSBodHRw
czovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvMzE2NTI4LwoKSm9zZWYgTHVzdGlj
a3kgKDEpOgogIGRybS9wYW5lbDogQWRkIElsaXRlayBJTEk5MzQxIHBhcmFsbGVsIFJHQiBwYW5l
bCBkcml2ZXIKCk5vcmFsZiBUcsO4bm5lcyAoMyk6CiAgZHJtL3BhbmVsL2lsaTkzNDE6IFJlYmFz
ZSBhbmQgc29tZSBtb3JlCiAgZHJtL21pcGktZGJpOiBTdXBwb3J0IGNvbW1hbmQgbW9kZSBwYW5l
bCBkcml2ZXJzCiAgZHJtL3BhbmVsL2lsaTkzNDE6IFN1cHBvcnQgbWkwMjgzcXQKCiBNQUlOVEFJ
TkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNiArCiBkcml2ZXJzL2dw
dS9kcm0vZHJtX21pcGlfZGJpLmMgICAgICAgICAgICAgICB8IDExMCArKysrKwogZHJpdmVycy9n
cHUvZHJtL3BhbmVsL0tjb25maWcgICAgICAgICAgICAgICAgfCAgIDkgKwogZHJpdmVycy9ncHUv
ZHJtL3BhbmVsL01ha2VmaWxlICAgICAgICAgICAgICAgfCAgIDEgKwogZHJpdmVycy9ncHUvZHJt
L3BhbmVsL3BhbmVsLWlsaXRlay1pbGk5MzQxLmMgfCA0NTIgKysrKysrKysrKysrKysrKysrKwog
aW5jbHVkZS9kcm0vZHJtX21pcGlfZGJpLmggICAgICAgICAgICAgICAgICAgfCAgIDggKwogNiBm
aWxlcyBjaGFuZ2VkLCA1ODYgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1pbGl0ZWstaWxpOTM0MS5jCgotLSAKMi4yMC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
