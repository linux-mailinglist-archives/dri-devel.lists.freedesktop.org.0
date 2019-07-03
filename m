Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8745F38B
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 09:26:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B493B6E285;
	Thu,  4 Jul 2019 07:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F6C6E15A
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 15:55:47 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x63FtjZS059883;
 Wed, 3 Jul 2019 10:55:45 -0500
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x63FtjsX001476
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 3 Jul 2019 10:55:45 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 3 Jul
 2019 10:55:45 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 3 Jul 2019 10:55:45 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x63FtidQ070121;
 Wed, 3 Jul 2019 10:55:45 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <tomi.valkeinen@ti.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/8] drm/omap: accept NULL for dma_addr in omap_gem_pin
Date: Wed, 3 Jul 2019 17:55:31 +0200
Message-ID: <20190703155536.28339-4-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190703155536.28339-1-jjhiblot@ti.com>
References: <20190703155536.28339-1-jjhiblot@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Thu, 04 Jul 2019 07:25:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1562169345;
 bh=mP6F39u6phwbe5nSbxR5D0TFXwCp5NMy1PkRGxhClQk=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=g5iZWIkMXiOvS0tNZZ8TqMLV7bjikfg2EzyHuH/iaLJojNvTWoNjuAbjAAN6Du8Nt
 LfuZmTIxLYVXaL2ARizzoMWy2cTucZUHTKoVcxixieUQpDJ7lZZVp84qlG0uZNO3GW
 wVT+Xr4tBkoZ3aqXjOw5tjAeDLb9TwDyK0nq/Br8=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KCkFsbG93IE5VTEwg
dG8gYmUgcGFzc2VkIGluICdkbWFfYWRkcicgZm9yIG9tYXBfZ2VtX3BpbigpLCBpbiBjYXNlIHRo
ZQpjYWxsZXIgZG9lcyBub3QgbmVlZCB0aGUgZG1hX2FkZHIuCgpTaWduZWQtb2ZmLWJ5OiBUb21p
IFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9v
bWFwZHJtL29tYXBfZ2VtLmMgfCA2ICsrKystLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRy
bS9vbWFwX2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9nZW0uYwppbmRleCAy
Yjc0NWIwY2ZiNzMuLjUyOTM1MzVlMDJlZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL29t
YXBkcm0vb21hcF9nZW0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2dlbS5j
CkBAIC04MTUsOSArODE1LDExIEBAIGludCBvbWFwX2dlbV9waW4oc3RydWN0IGRybV9nZW1fb2Jq
ZWN0ICpvYmosIGRtYV9hZGRyX3QgKmRtYV9hZGRyKQogCiAJCXJlZmNvdW50X2luYygmb21hcF9v
YmotPmRtYV9hZGRyX2NudCk7CiAKLQkJKmRtYV9hZGRyID0gb21hcF9vYmotPmRtYV9hZGRyOwor
CQlpZiAoZG1hX2FkZHIpCisJCQkqZG1hX2FkZHIgPSBvbWFwX29iai0+ZG1hX2FkZHI7CiAJfSBl
bHNlIGlmIChvbWFwX2dlbV9pc19jb250aWd1b3VzKG9tYXBfb2JqKSkgewotCQkqZG1hX2FkZHIg
PSBvbWFwX29iai0+ZG1hX2FkZHI7CisJCWlmIChkbWFfYWRkcikKKwkJCSpkbWFfYWRkciA9IG9t
YXBfb2JqLT5kbWFfYWRkcjsKIAl9IGVsc2UgewogCQlyZXQgPSAtRUlOVkFMOwogCQlnb3RvIGZh
aWw7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
