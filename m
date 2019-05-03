Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6ED1452A
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 09:28:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA85F89291;
	Mon,  6 May 2019 07:28:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06206883A9
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 16:55:39 +0000 (UTC)
Received: from mail-wr1-f69.google.com ([209.85.221.69])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <andrea.righi@canonical.com>)
 id 1hMbTF-0007o3-TM
 for dri-devel@lists.freedesktop.org; Fri, 03 May 2019 16:55:37 +0000
Received: by mail-wr1-f69.google.com with SMTP id t13so5232087wrm.10
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2019 09:55:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=v4PB/KtJcj+jKsWtMsEZdsEqYpm/3dtqF+jc9qu4DtM=;
 b=BD4b/Xvu6BvNpoFwHRI8Oi4KRqN/pSgyW3OF0Owshb5rNJOPyf0IId1ppJ5MhgZAdS
 LSEbcGqoo+r6zRu70pi+P7qqhGa0RswvOmxMn2ylU5xpgavZ7bxkv7B8RNHtVXywYsli
 ErC5ESfcW2eSvrNyJu6G11gIfEXjiMpBQW3bu40qPKKlbwipbPu35T4i0oDiCBpBdZ2i
 uz8+pf9472qT8nk10RSv5hT7nZx2QhGQY9is5gPWCy/JC2K1U5IhARtfd4hBjKSiWaT5
 bglvi2HmHN2V8pyKKAVJAHqYBFsclX6cZSvgYCQruGUC8RRawH5qTZ3wYDS8tjib/mkB
 1YoQ==
X-Gm-Message-State: APjAAAWRHLGe4zsHfbFR0j/VyMGrJImjciFp7IKXb8p+OgLq9QA90ade
 s2HccTZIS59vTzoy+ezubTMSdPXPXk1r3xGGT3CpCbvjq9LdiUYrt1UF93qyb0GVr+V13AoxDZ6
 ECwPVdwvENXjZ6xdjQ7MLbMxkQ/ACLpa5K5G9isXcHRvw4A==
X-Received: by 2002:a7b:cc91:: with SMTP id p17mr7038468wma.147.1556902537634; 
 Fri, 03 May 2019 09:55:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx1hZPUfBF839e9/ajKvR7uUiiGy0H+zfXnNTReDtbv/nwRnFlaRLq+sseA7vIDfEU3Jz+7Tw==
X-Received: by 2002:a7b:cc91:: with SMTP id p17mr7038460wma.147.1556902537442; 
 Fri, 03 May 2019 09:55:37 -0700 (PDT)
Received: from localhost (host28-131-dynamic.22-79-r.retail.telecomitalia.it.
 [79.22.131.28])
 by smtp.gmail.com with ESMTPSA id h131sm4571434wmh.44.2019.05.03.09.55.36
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 03 May 2019 09:55:36 -0700 (PDT)
Date: Fri, 3 May 2019 18:55:35 +0200
From: Andrea Righi <andrea.righi@canonical.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>
Subject: [PATCH] drm/amd/powerplay: remove spurious semicolon
Message-ID: <20190503165535.GA30964@xps-13>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Mon, 06 May 2019 07:27:59 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hersen wu <hersenxs.wu@amd.com>, amd-gfx@lists.freedesktop.org,
 Evan Quan <evan.quan@amd.com>, Rex Zhu <rex.zhu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVtb3ZlIHVubmVjZXNzYXJ5IHNlbWljb2xvbnMgYXQgdGhlIGVuZCBvZiBsaW5lLgoKU2lnbmVk
LW9mZi1ieTogQW5kcmVhIFJpZ2hpIDxhbmRyZWEucmlnaGlAY2Fub25pY2FsLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRfcG93ZXJwbGF5LmMgICAgICAgICB8IDgg
KysrKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL2hhcmR3YXJlbWFu
YWdlci5jIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kX3Bv
d2VycGxheS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kX3Bvd2VycGxheS5j
CmluZGV4IDNmNzNmN2NkMThiOS4uMTA1MmY1MTE5MDg3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9hbWRfcG93ZXJwbGF5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvYW1kX3Bvd2VycGxheS5jCkBAIC0xMzA0LDcgKzEzMDQsNyBAQCBzdGF0
aWMgaW50IHBwX25vdGlmeV9zbXVfZW5hYmxlX3B3ZSh2b2lkICpoYW5kbGUpCiAKIAlpZiAoaHdt
Z3ItPmh3bWdyX2Z1bmMtPnNtdXNfbm90aWZ5X3B3ZSA9PSBOVUxMKSB7CiAJCXByX2luZm9fcmF0
ZWxpbWl0ZWQoIiVzIHdhcyBub3QgaW1wbGVtZW50ZWQuXG4iLCBfX2Z1bmNfXyk7Ci0JCXJldHVy
biAtRUlOVkFMOzsKKwkJcmV0dXJuIC1FSU5WQUw7CiAJfQogCiAJbXV0ZXhfbG9jaygmaHdtZ3It
PnNtdV9sb2NrKTsKQEAgLTEzNDEsNyArMTM0MSw3IEBAIHN0YXRpYyBpbnQgcHBfc2V0X21pbl9k
ZWVwX3NsZWVwX2RjZWZjbGsodm9pZCAqaGFuZGxlLCB1aW50MzJfdCBjbG9jaykKIAogCWlmICho
d21nci0+aHdtZ3JfZnVuYy0+c2V0X21pbl9kZWVwX3NsZWVwX2RjZWZjbGsgPT0gTlVMTCkgewog
CQlwcl9kZWJ1ZygiJXMgd2FzIG5vdCBpbXBsZW1lbnRlZC5cbiIsIF9fZnVuY19fKTsKLQkJcmV0
dXJuIC1FSU5WQUw7OworCQlyZXR1cm4gLUVJTlZBTDsKIAl9CiAKIAltdXRleF9sb2NrKCZod21n
ci0+c211X2xvY2spOwpAQCAtMTM2MCw3ICsxMzYwLDcgQEAgc3RhdGljIGludCBwcF9zZXRfaGFy
ZF9taW5fZGNlZmNsa19ieV9mcmVxKHZvaWQgKmhhbmRsZSwgdWludDMyX3QgY2xvY2spCiAKIAlp
ZiAoaHdtZ3ItPmh3bWdyX2Z1bmMtPnNldF9oYXJkX21pbl9kY2VmY2xrX2J5X2ZyZXEgPT0gTlVM
TCkgewogCQlwcl9kZWJ1ZygiJXMgd2FzIG5vdCBpbXBsZW1lbnRlZC5cbiIsIF9fZnVuY19fKTsK
LQkJcmV0dXJuIC1FSU5WQUw7OworCQlyZXR1cm4gLUVJTlZBTDsKIAl9CiAKIAltdXRleF9sb2Nr
KCZod21nci0+c211X2xvY2spOwpAQCAtMTM3OSw3ICsxMzc5LDcgQEAgc3RhdGljIGludCBwcF9z
ZXRfaGFyZF9taW5fZmNsa19ieV9mcmVxKHZvaWQgKmhhbmRsZSwgdWludDMyX3QgY2xvY2spCiAK
IAlpZiAoaHdtZ3ItPmh3bWdyX2Z1bmMtPnNldF9oYXJkX21pbl9mY2xrX2J5X2ZyZXEgPT0gTlVM
TCkgewogCQlwcl9kZWJ1ZygiJXMgd2FzIG5vdCBpbXBsZW1lbnRlZC5cbiIsIF9fZnVuY19fKTsK
LQkJcmV0dXJuIC1FSU5WQUw7OworCQlyZXR1cm4gLUVJTlZBTDsKIAl9CiAKIAltdXRleF9sb2Nr
KCZod21nci0+c211X2xvY2spOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvaHdtZ3IvaGFyZHdhcmVtYW5hZ2VyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9od21nci9oYXJkd2FyZW1hbmFnZXIuYwppbmRleCBjMWM1MWMxMTVlNTcuLjcwZjdmNDdh
MmZjZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvaGFy
ZHdhcmVtYW5hZ2VyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3Iv
aGFyZHdhcmVtYW5hZ2VyLmMKQEAgLTc2LDcgKzc2LDcgQEAgaW50IHBobV9zZXRfcG93ZXJfc3Rh
dGUoc3RydWN0IHBwX2h3bWdyICpod21nciwKIGludCBwaG1fZW5hYmxlX2R5bmFtaWNfc3RhdGVf
bWFuYWdlbWVudChzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyKQogewogCXN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2ID0gTlVMTDsKLQlpbnQgcmV0ID0gLUVJTlZBTDs7CisJaW50IHJldCA9IC1FSU5W
QUw7CiAJUEhNX0ZVTkNfQ0hFQ0soaHdtZ3IpOwogCWFkZXYgPSBod21nci0+YWRldjsKIAotLSAK
Mi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
