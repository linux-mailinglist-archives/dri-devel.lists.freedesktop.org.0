Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B328F6BBFF
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 13:58:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 527696E122;
	Wed, 17 Jul 2019 11:58:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B2D6E122
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 11:58:31 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:54758
 helo=localhost.localdomain)
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_CBC_SHA1:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hniZp-0007Eh-FT; Wed, 17 Jul 2019 13:58:29 +0200
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 00/10] drm/tinydrm: Remove tinydrm.ko
Date: Wed, 17 Jul 2019 13:58:07 +0200
Message-Id: <20190717115817.30110-1-noralf@tronnes.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
 bh=Oo7iw6oJpt1NRnYIzSyXG453WpuZpL24ekd/2nfUc2o=; 
 b=qevm5yt4LCv4fzbavm1FwLL7QFMuGVINFSuJt20wWCmHokryb6ecz8gFaK14jAMno1wHNh1fhHTI1HfZzcU1HdBRLTYT3oNB8iOilvtI6iiIYD9UoPGzJJRV4jyV9vdpJsP491pVWGDueQ56edZ2NGVcMLsc27p0HQgpsPpByrqqkE2tihpbSml7Pov9cTg3yFqpQp0v5auScXEUye7mMESMGQd3roXNI9Q9CnGdCQqRDJRRCVhExto6cWqTXfcbbm7QHl1vi7YUMYYpfLIndPUSX4LT8dffb26BaeZhHU4009L6smhYQtkli1JXqolGA8FEkV7vhUuW2JWLrnFuyA==;
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

VGhpcyBzZXJpZXMgcmVtb3ZlcyB0aGUgcmVtYWluaW5nIGJpdHMgb2YgdGlueWRybS5rby4KClRo
ZXJlJ3Mgb25seSBvbmUgaXRlbSBsZWZ0IG9uIHRoZSB0aW55ZHJtIHRvZG8gbGlzdCBhbmQgdGhh
dCBpcyBtb3ZpbmcKb3V0IG1pcGlfZGJpLgoKTm90ZToKVGhpcyBkZXBlbmRzIG9uIGEgY29tbWl0
IHRoYXQganVzdCBlbnRlcmVkIExpbnVzJyB0cmVlOgplNmYzZjdlNGRjNzYgKCJzcGk6IEFkZCBz
cGlfaXNfYnB3X3N1cHBvcnRlZCgpIikKClNlcmllcyBpcyBhbHNvIGF2YWlsYWJsZSBoZXJlOgpo
dHRwczovL2dpdGh1Yi5jb20vbm90cm8vbGludXgvdHJlZS9yZW1vdmVfdGlueWRybV9rbwoKTm9y
YWxmLgoKTm9yYWxmIFRyw7hubmVzICgxMCk6CiAgZHJtOiBBZGQgU1BJIGNvbm5lY3RvciB0eXBl
CiAgZHJtL3Rpbnlkcm06IFVzZSBzcGlfaXNfYnB3X3N1cHBvcnRlZCgpCiAgZHJtL3Rpbnlkcm06
IFJlbW92ZSBzcGkgZGVidWcgYnVmZmVyIGR1bXBpbmcKICBkcm0vdGlueWRybTogUmVtb3ZlIHRp
bnlkcm1fc3BpX21heF90cmFuc2Zlcl9zaXplKCkKICBkcm0vdGlueWRybTogQ2xlYW4gdXAgdGlu
eWRybV9zcGlfdHJhbnNmZXIoKQogIGRybS90aW55ZHJtOiBNb3ZlIHRpbnlkcm1fc3BpX3RyYW5z
ZmVyKCkKICBkcm0vdGlueWRybTogTW92ZSB0aW55ZHJtX21hY2hpbmVfbGl0dGxlX2VuZGlhbigp
CiAgZHJtL3Rpbnlkcm0vcmVwYXBlcjogRG9uJ3QgdXNlIHRpbnlkcm1fZGlzcGxheV9waXBlX2lu
aXQoKQogIGRybS90aW55ZHJtL21pcGktZGJpOiBBZGQgbWlwaV9kYmlfaW5pdF93aXRoX2Zvcm1h
dHMoKQogIGRybS90aW55ZHJtOiBNb3ZlIHRpbnlkcm1fZGlzcGxheV9waXBlX2luaXQoKSB0byBt
aXBpLWRiaQoKIERvY3VtZW50YXRpb24vZ3B1L3Rpbnlkcm0ucnN0ICAgICAgICAgICAgICAgICB8
ICAxMiAtCiBEb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdCAgICAgICAgICAgICAgICAgICAgfCAg
IDMgLQogZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYyAgICAgICAgICAgICAgIHwgICAx
ICsKIGRyaXZlcnMvZ3B1L2RybS90aW55ZHJtL01ha2VmaWxlICAgICAgICAgICAgICB8ICAgMSAt
CiBkcml2ZXJzL2dwdS9kcm0vdGlueWRybS9jb3JlL01ha2VmaWxlICAgICAgICAgfCAgIDQgLQog
Li4uL2dwdS9kcm0vdGlueWRybS9jb3JlL3Rpbnlkcm0taGVscGVycy5jICAgIHwgMjA3IC0tLS0t
LS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vdGlueWRybS9jb3JlL3Rpbnlkcm0tcGlwZS5jICAg
fCAxNzkgLS0tLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vdGlueWRybS9oeDgzNTdkLmMgICAg
ICAgICAgICAgfCAgIDEgLQogZHJpdmVycy9ncHUvZHJtL3Rpbnlkcm0vaWxpOTIyNS5jICAgICAg
ICAgICAgIHwgICA1ICstCiBkcml2ZXJzL2dwdS9kcm0vdGlueWRybS9pbGk5MzQxLmMgICAgICAg
ICAgICAgfCAgIDEgLQogZHJpdmVycy9ncHUvZHJtL3Rpbnlkcm0vbWkwMjgzcXQuYyAgICAgICAg
ICAgIHwgICAxIC0KIGRyaXZlcnMvZ3B1L2RybS90aW55ZHJtL21pcGktZGJpLmMgICAgICAgICAg
ICB8IDI1NCArKysrKysrKysrKysrKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS90aW55ZHJtL3JlcGFw
ZXIuYyAgICAgICAgICAgICB8ICA1OCArKystCiBkcml2ZXJzL2dwdS9kcm0vdGlueWRybS9zdDc1
ODYuYyAgICAgICAgICAgICAgfCAgMzIgKy0tCiBkcml2ZXJzL2dwdS9kcm0vdGlueWRybS9zdDc3
MzVyLmMgICAgICAgICAgICAgfCAgIDEgLQogaW5jbHVkZS9kcm0vdGlueWRybS9taXBpLWRiaS5o
ICAgICAgICAgICAgICAgIHwgIDIyICstCiBpbmNsdWRlL2RybS90aW55ZHJtL3Rpbnlkcm0taGVs
cGVycy5oICAgICAgICAgfCAgNzUgLS0tLS0tCiBpbmNsdWRlL3VhcGkvZHJtL2RybV9tb2RlLmgg
ICAgICAgICAgICAgICAgICAgfCAgIDEgKwogMTggZmlsZXMgY2hhbmdlZCwgMjg1IGluc2VydGlv
bnMoKyksIDU3MyBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9k
cm0vdGlueWRybS9jb3JlL01ha2VmaWxlCiBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUv
ZHJtL3Rpbnlkcm0vY29yZS90aW55ZHJtLWhlbHBlcnMuYwogZGVsZXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvZ3B1L2RybS90aW55ZHJtL2NvcmUvdGlueWRybS1waXBlLmMKIGRlbGV0ZSBtb2RlIDEw
MDY0NCBpbmNsdWRlL2RybS90aW55ZHJtL3Rpbnlkcm0taGVscGVycy5oCgotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
