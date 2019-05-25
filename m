Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BC92B41A
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 14:04:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9C3289BC2;
	Mon, 27 May 2019 12:04:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90A6F89701
 for <dri-devel@lists.freedesktop.org>; Sat, 25 May 2019 07:30:32 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id t1so6276064pgc.2
 for <dri-devel@lists.freedesktop.org>; Sat, 25 May 2019 00:30:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=CBmogAJUB339Ep3aXj31B9OMK/rErdF2S8y1zyAwxG8=;
 b=srQ7GLyGx+50kF/IecqaGY7Svchav1UpIoxsxysd7Mooh0GUD4U5oDtJIPnNlgGcjv
 EY2uoF4aJYJnBSzARVKkuro4gobQZ2v6mO6ingGMYvZVN1+RBiz38ysLFWriM4Qwzk7T
 /vVkfqJ/BbhgWvYL78iL1fNQcTqw5wQRQdw+F1DbiExowoZxSSKHL03fr/U0jpLKaWyG
 Qkv9PgaRJRTSDRDigkjzWqmHoMqxbqKFbEDdyhSOKAZcSlRVIfvzSl8quJ2e40XiSkPP
 JWZxnOjBNxj3yJ/7Tzws6q/hojWliAbMho6pjmjYOriCEnCSPpU6stln74Q36va8dYA1
 GtkQ==
X-Gm-Message-State: APjAAAUbWLkti8d+X25WOsvzedxLKBiYQW9MtbITCCQrMAv3c7pCPiQI
 G6Vm7zkpxCzYSc83WLTe8tA=
X-Google-Smtp-Source: APXvYqw7Nq85Uzgu9ty/HtMjyUAeqWceKF3Gt7yedRT3adN5M/+iBJ1YlHGs4JhsHdTqos3PGcqKCA==
X-Received: by 2002:a17:90a:9bc4:: with SMTP id
 b4mr14672395pjw.100.1558769432212; 
 Sat, 25 May 2019 00:30:32 -0700 (PDT)
Received: from hari-Inspiron-1545 ([183.83.92.73])
 by smtp.gmail.com with ESMTPSA id o1sm11126605pfa.66.2019.05.25.00.30.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 25 May 2019 00:30:31 -0700 (PDT)
Date: Sat, 25 May 2019 13:00:26 +0530
From: Hariprasad Kelam <hariprasad.kelam@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Hariprasad Kelam <hariprasad.kelam@gmail.com>,
 Matteo Croce <mcroce@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/omapdrm: fix warning PTR_ERR_OR_ZERO can be used
Message-ID: <20190525073026.GA7114@hari-Inspiron-1545>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Mon, 27 May 2019 12:03:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=CBmogAJUB339Ep3aXj31B9OMK/rErdF2S8y1zyAwxG8=;
 b=gC7rjIYRif8KrFeSxZoE9bJlUrDLPnpp7ZpN+7izHNxWjxDoQuzz+UUUnL8ZzbKXlV
 +B+vMKfrWfIeZyu50/RqmmDvaZvvcomBBnbCxByHK6MTJdZcLSf7b3kOD/TPwmc1G/HV
 T7FpRL9zA9x8q8pUhh2pIBE5QzA0M1V2F1PiMju/i8P2djnihcmj4OPTnLX6LL6Qs6qw
 9HjzQeghf/VQlKZikMYyWp2YZ+oeTA3Z1/1YOqRybLOeU91UzmgyCrbGB1qoRZ6CaWdP
 kiBY5F2yRud1Ug9od78Uhw+qnYJVCXz71BY5XFLIVtfzLQlxIpVAur1T79R9plOEgy93
 uHww==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Zml4IGJlbG93IHdhcm5pbmdzIHJlcG9ydGVkIGJ5IGNvY2NpY2hlY2sKCi4vZHJpdmVycy9ncHUv
ZHJtL29tYXBkcm0vZHNzL2hkbWlfcGh5LmM6MTk3OjEtMzogV0FSTklORzoKUFRSX0VSUl9PUl9a
RVJPIGNhbiBiZSB1c2VkCi4vZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2hkbWk0X2NvcmUu
Yzo5Mzc6MS0zOiBXQVJOSU5HOgpQVFJfRVJSX09SX1pFUk8gY2FuIGJlIHVzZWQKLi9kcml2ZXJz
L2dwdS9kcm0vb21hcGRybS9kc3MvaGRtaTVfY29yZS5jOjkxMzoxLTM6IFdBUk5JTkc6ClBUUl9F
UlJfT1JfWkVSTyBjYW4gYmUgdXNlZAouL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9oZG1p
NC5jOjYwMToxLTM6IFdBUk5JTkc6IFBUUl9FUlJfT1JfWkVSTwpjYW4gYmUgdXNlZAoKU2lnbmVk
LW9mZi1ieTogSGFyaXByYXNhZCBLZWxhbSA8aGFyaXByYXNhZC5rZWxhbUBnbWFpbC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2hkbWk0LmMgICAgICB8IDUgKy0tLS0KIGRy
aXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9oZG1pNF9jb3JlLmMgfCA2ICsrLS0tLQogZHJpdmVy
cy9ncHUvZHJtL29tYXBkcm0vZHNzL2hkbWk1X2NvcmUuYyB8IDQgKy0tLQogZHJpdmVycy9ncHUv
ZHJtL29tYXBkcm0vZHNzL2hkbWlfcGh5LmMgICB8IDQgKy0tLQogNCBmaWxlcyBjaGFuZ2VkLCA1
IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9vbWFwZHJtL2Rzcy9oZG1pNC5jIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2hk
bWk0LmMKaW5kZXggNjMzOWUyNy4uY2NlNTNmMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L29tYXBkcm0vZHNzL2hkbWk0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2hk
bWk0LmMKQEAgLTU5OCwxMCArNTk4LDcgQEAgc3RhdGljIGludCBoZG1pX2F1ZGlvX3JlZ2lzdGVy
KHN0cnVjdCBvbWFwX2hkbWkgKmhkbWkpCiAJCSZoZG1pLT5wZGV2LT5kZXYsICJvbWFwLWhkbWkt
YXVkaW8iLCBQTEFURk9STV9ERVZJRF9BVVRPLAogCQkmcGRhdGEsIHNpemVvZihwZGF0YSkpOwog
Ci0JaWYgKElTX0VSUihoZG1pLT5hdWRpb19wZGV2KSkKLQkJcmV0dXJuIFBUUl9FUlIoaGRtaS0+
YXVkaW9fcGRldik7Ci0KLQlyZXR1cm4gMDsKKwlyZXR1cm4gUFRSX0VSUl9PUl9aRVJPKGhkbWkt
PmF1ZGlvX3BkZXYpOwogfQogCiAvKiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2hkbWk0X2NvcmUuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9vbWFwZHJtL2Rzcy9oZG1pNF9jb3JlLmMKaW5kZXggZTM4NGI5NS4uMWJjZGI1NCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2hkbWk0X2NvcmUuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvaGRtaTRfY29yZS5jCkBAIC05MzQsOCArOTM0LDYgQEAg
aW50IGhkbWk0X2NvcmVfaW5pdChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LCBzdHJ1Y3Qg
aGRtaV9jb3JlX2RhdGEgKmNvcmUpCiAKIAlyZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2VfYnlu
YW1lKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAiY29yZSIpOwogCWNvcmUtPmJhc2UgPSBkZXZtX2lv
cmVtYXBfcmVzb3VyY2UoJnBkZXYtPmRldiwgcmVzKTsKLQlpZiAoSVNfRVJSKGNvcmUtPmJhc2Up
KQotCQlyZXR1cm4gUFRSX0VSUihjb3JlLT5iYXNlKTsKLQotCXJldHVybiAwOworCQorCXJldHVy
biBQVFJfRVJSX09SX1pFUk8oY29yZS0+YmFzZSk7CiB9CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vb21hcGRybS9kc3MvaGRtaTVfY29yZS5jIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0v
ZHNzL2hkbWk1X2NvcmUuYwppbmRleCAwMmVmYWJjLi4wMjJjMmNlIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvaGRtaTVfY29yZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9vbWFwZHJtL2Rzcy9oZG1pNV9jb3JlLmMKQEAgLTkxMCw4ICs5MTAsNiBAQCBpbnQgaGRtaTVf
Y29yZV9pbml0KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsIHN0cnVjdCBoZG1pX2NvcmVf
ZGF0YSAqY29yZSkKIAogCXJlcyA9IHBsYXRmb3JtX2dldF9yZXNvdXJjZV9ieW5hbWUocGRldiwg
SU9SRVNPVVJDRV9NRU0sICJjb3JlIik7CiAJY29yZS0+YmFzZSA9IGRldm1faW9yZW1hcF9yZXNv
dXJjZSgmcGRldi0+ZGV2LCByZXMpOwotCWlmIChJU19FUlIoY29yZS0+YmFzZSkpCi0JCXJldHVy
biBQVFJfRVJSKGNvcmUtPmJhc2UpOwogCi0JcmV0dXJuIDA7CisJcmV0dXJuIFBUUl9FUlJfT1Jf
WkVSTyhjb3JlLT5iYXNlKTsKIH0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJt
L2Rzcy9oZG1pX3BoeS5jIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2hkbWlfcGh5LmMK
aW5kZXggOTkxNTkyMy4uYTdkNzA0MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL29tYXBk
cm0vZHNzL2hkbWlfcGh5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2hkbWlf
cGh5LmMKQEAgLTE5NCw4ICsxOTQsNiBAQCBpbnQgaGRtaV9waHlfaW5pdChzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2LCBzdHJ1Y3QgaGRtaV9waHlfZGF0YSAqcGh5LAogCiAJcmVzID0gcGxh
dGZvcm1fZ2V0X3Jlc291cmNlX2J5bmFtZShwZGV2LCBJT1JFU09VUkNFX01FTSwgInBoeSIpOwog
CXBoeS0+YmFzZSA9IGRldm1faW9yZW1hcF9yZXNvdXJjZSgmcGRldi0+ZGV2LCByZXMpOwotCWlm
IChJU19FUlIocGh5LT5iYXNlKSkKLQkJcmV0dXJuIFBUUl9FUlIocGh5LT5iYXNlKTsKIAotCXJl
dHVybiAwOworCXJldHVybiBQVFJfRVJSX09SX1pFUk8ocGh5LT5iYXNlKTsKIH0KLS0gCjIuNy40
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
