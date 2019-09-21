Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC75CBA234
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2019 14:05:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 227496E0A2;
	Sun, 22 Sep 2019 12:04:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 532086E04A
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2019 06:49:48 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,531,1559512800"; d="scan'208";a="320165530"
Received: from ip-215.net-89-2-7.rev.numericable.fr (HELO hadrien)
 ([89.2.7.215])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Sep 2019 08:20:46 +0200
Date: Sat, 21 Sep 2019 08:20:45 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: Lucas Stach <l.stach@pengutronix.de>, Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH] UNCLEAN: fix semicolon.cocci warnings
Message-ID: <alpine.DEB.2.21.1909210819180.3303@hadrien>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Ezequiel Garcia <ezequiel@collabora.com>, kbuild-all@01.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbToga2J1aWxkIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+CgpSZW1vdmUgdW5uZWVkZWQg
c2VtaWNvbG9ucy4KCkdlbmVyYXRlZCBieTogc2NyaXB0cy9jb2NjaW5lbGxlL21pc2Mvc2VtaWNv
bG9uLmNvY2NpCgpGaXhlczogODQxYjA0NzUxZGMwICgiVU5DTEVBTjogYWRkIEhETUkgVFggZHJp
dmVyIikKQ0M6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPgpTaWduZWQtb2Zm
LWJ5OiBrYnVpbGQgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogSnVs
aWEgTGF3YWxsIDxqdWxpYS5sYXdhbGxAbGlwNi5mcj4KLS0tCgp0cmVlOiAgIGdpdDovL2dpdC5p
bmZyYWRlYWQub3JnL3VzZXJzL2V6ZXF1aWVsZy9saW51eCBoYW50cm8tdnB1LXBvc3Rwcm9jLWZv
ci01LjUtMgpoZWFkOiAgIDU0ZWQ2MTZmYjkwMTZiODliN2JjZGI5YzhjOGJkNWYwNTMyYzBkZWYK
Y29tbWl0OiA4NDFiMDQ3NTFkYzBhNjdjY2JkYzA3YjQ0NjU1ZDlhZDM1ZTYxYWU3IFszNTgvNTEx
XSBVTkNMRUFOOiBhZGQgSERNSSBUWCBkcml2ZXIKOjo6Ojo6IGJyYW5jaCBkYXRlOiA1IGhvdXJz
IGFnbwo6Ojo6OjogY29tbWl0IGRhdGU6IDMgZGF5cyBhZ28KCiB1dGlsLmMgfCAgICA0ICsrLS0K
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Nkbi1oZHAvbWFpbGJveC1pZi91dGlsLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9jZG4taGRwL21haWxib3gtaWYvdXRpbC5jCkBAIC0xNDgsNyAr
MTQ4LDcgQEAgdTMyIGludGVybmFsX3Zta21zZyh2b2xhdGlsZSB1OCAqZGVzdCwgaQogCQlpZiAo
c2l6ZSA+IDApIHsKIAkJCWludGVybmFsX2l0b2JlKHZhX2FyZyh2bCwgaW50KSwgZGVzdCwgc2l6
ZSk7CiAJCQlkZXN0ICs9IHNpemU7Ci0JCQlsZW4gKz0gc2l6ZTs7CisJCQlsZW4gKz0gc2l6ZTsK
IAkJfSBlbHNlIHsKIAkJCW1lbWNweSgodm9pZCAqKWRlc3QsIHZhX2FyZyh2bCwgdm9pZCAqKSwg
LXNpemUpOwogCQkJZGVzdCAtPSBzaXplOwpAQCAtMjE0LDcgKzIxNCw3IEBAIHZvaWQgaW50ZXJu
YWxfdnJlYWRtc2coc3RhdGVfc3RydWN0ICpzdGEKIAkJCWRlZmF1bHQ6CiAJCQkJcHJfd2Fybigi
V2FybmluZy4gVW5zdXBwb3J0ZWQgdmFyaWFibGUgc2l6ZS5cbiIpOwogCQkJCW1lbWNweShwdHIs
IHNyYywgc2l6ZSk7Ci0JCQl9OworCQkJfQoKIAkJCXNyYyArPSBzaXplOwogCQl9IGVsc2Ugewpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
