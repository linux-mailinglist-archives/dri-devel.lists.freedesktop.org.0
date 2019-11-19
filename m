Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6A4102758
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 15:51:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED2636E921;
	Tue, 19 Nov 2019 14:51:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D03276E920
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 14:51:04 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B80EFC2ECC;
 Tue, 19 Nov 2019 14:41:54 +0000 (UTC)
Received: from paltsev-e7480.internal.synopsys.com
 (paltsev-e7480.internal.synopsys.com [10.121.3.76])
 by mailhost.synopsys.com (Postfix) with ESMTP id 096C6A0066;
 Tue, 19 Nov 2019 14:41:52 +0000 (UTC)
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: dri-devel@lists.freedesktop.org,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH 2/4] DRM: ARC: PGU: cleanup supported format list code
Date: Tue, 19 Nov 2019 17:41:45 +0300
Message-Id: <20191119144147.8022-3-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191119144147.8022-1-Eugeniy.Paltsev@synopsys.com>
References: <20191119144147.8022-1-Eugeniy.Paltsev@synopsys.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=synopsys.com; s=mail; 
 t=1574174515; bh=UxM7GkeegeLhnO6SHHYpc+n30A4Lz5lkq5h2P2p9FQo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i5vTu8yZfQa4+mw1sqUYNzugmQthZjEJt3/ZT1uYV2Y+D2JGXbhwxh40P6yGqqfDe
 3aZHMPa15xx9fBL9E8Teuz/z4Ztwrv+Xv9tNdEz8QjHWKtAn87l9RCwKJ4E4LbZRCa
 DPe6biz0gtzfH2ZDJ0pAKAiuGTc/mJxKlZzakiZTcc+/YZN0goEYxdu4xuAtiPTG+e
 NKgjzjCvzaiH+muaNqiYX/7lCfXwoBtabxNAlxdPNo1r7Svpmk6PiiBm1khv4iiufZ
 W60qCJ+qKmruGJkXg8DPx7SR7+EaeNBKLZQrU8hWQKSMWfPrnwQgzaBMoDvRyUfSZ3
 onwIolGHwO9jQ==
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
Cc: David Airlie <airlied@linux.ie>, linux-snps-arc@lists.infradead.org,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

R2V0IHJpZCBvZiAnc2ltcGxlZmJfZm9ybWF0JyBzdHJ1Y3R1cmUgdXNhZ2UgYXMgd2Ugb25seSB1
c2UgaXRzCidmb3VyY2MnIGZpZWxkLgoKU2lnbmVkLW9mZi1ieTogRXVnZW5peSBQYWx0c2V2IDxF
dWdlbml5LlBhbHRzZXZAc3lub3BzeXMuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hcmMvYXJj
cGd1X2NydGMuYyB8IDI1ICsrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAxMSBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYXJjL2FyY3BndV9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJjL2FyY3BndV9j
cnRjLmMKaW5kZXggMzFkOTgyNGM0NmNjLi41NDczYjE5YTUyZWUgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hcmMvYXJjcGd1X2NydGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJjL2Fy
Y3BndV9jcnRjLmMKQEAgLTIwLDkgKzIwLDkgQEAKIAogI2RlZmluZSBFTkNPREVfUEdVX1hZKHgs
IHkpCSgoKCh4KSAtIDEpIDw8IDE2KSB8ICgoeSkgLSAxKSkKIAotc3RhdGljIHN0cnVjdCBzaW1w
bGVmYl9mb3JtYXQgc3VwcG9ydGVkX2Zvcm1hdHNbXSA9IHsKLQl7ICJyNWc2YjUiLCAxNiwgezEx
LCA1fSwgezUsIDZ9LCB7MCwgNX0sIHswLCAwfSwgRFJNX0ZPUk1BVF9SR0I1NjUgfSwKLQl7ICJy
OGc4YjgiLCAyNCwgezE2LCA4fSwgezgsIDh9LCB7MCwgOH0sIHswLCAwfSwgRFJNX0ZPUk1BVF9S
R0I4ODggfSwKK3N0YXRpYyBjb25zdCB1MzIgYXJjX3BndV9zdXBwb3J0ZWRfZm9ybWF0c1tdID0g
eworCURSTV9GT1JNQVRfUkdCNTY1LAorCURSTV9GT1JNQVRfUkdCODg4LAogfTsKIAogc3RhdGlj
IHZvaWQgYXJjX3BndV9zZXRfcHhsX2ZtdChzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCkBAIC0zMCwy
MCArMzAsMjAgQEAgc3RhdGljIHZvaWQgYXJjX3BndV9zZXRfcHhsX2ZtdChzdHJ1Y3QgZHJtX2Ny
dGMgKmNydGMpCiAJc3RydWN0IGFyY3BndV9kcm1fcHJpdmF0ZSAqYXJjcGd1ID0gY3J0Y190b19h
cmNwZ3VfcHJpdihjcnRjKTsKIAljb25zdCBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiA9IGNy
dGMtPnByaW1hcnktPnN0YXRlLT5mYjsKIAl1aW50MzJfdCBwaXhlbF9mb3JtYXQgPSBmYi0+Zm9y
bWF0LT5mb3JtYXQ7Ci0Jc3RydWN0IHNpbXBsZWZiX2Zvcm1hdCAqZm9ybWF0ID0gTlVMTDsKKwl1
MzIgZm9ybWF0ID0gRFJNX0ZPUk1BVF9JTlZBTElEOwogCWludCBpOwogCXUzMiByZWdfY3RybDsK
IAotCWZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHN1cHBvcnRlZF9mb3JtYXRzKTsgaSsrKSB7
Ci0JCWlmIChzdXBwb3J0ZWRfZm9ybWF0c1tpXS5mb3VyY2MgPT0gcGl4ZWxfZm9ybWF0KQotCQkJ
Zm9ybWF0ID0gJnN1cHBvcnRlZF9mb3JtYXRzW2ldOworCWZvciAoaSA9IDA7IGkgPCBBUlJBWV9T
SVpFKGFyY19wZ3Vfc3VwcG9ydGVkX2Zvcm1hdHMpOyBpKyspIHsKKwkJaWYgKGFyY19wZ3Vfc3Vw
cG9ydGVkX2Zvcm1hdHNbaV0gPT0gcGl4ZWxfZm9ybWF0KQorCQkJZm9ybWF0ID0gYXJjX3BndV9z
dXBwb3J0ZWRfZm9ybWF0c1tpXTsKIAl9CiAKLQlpZiAoV0FSTl9PTighZm9ybWF0KSkKKwlpZiAo
V0FSTl9PTihmb3JtYXQgPT0gRFJNX0ZPUk1BVF9JTlZBTElEKSkKIAkJcmV0dXJuOwogCiAJcmVn
X2N0cmwgPSBhcmNfcGd1X3JlYWQoYXJjcGd1LCBBUkNQR1VfUkVHX0NUUkwpOwotCWlmIChmb3Jt
YXQtPmZvdXJjYyA9PSBEUk1fRk9STUFUX1JHQjU2NSkKKwlpZiAoZm9ybWF0ID09IERSTV9GT1JN
QVRfUkdCNTY1KQogCQlyZWdfY3RybCAmPSB+QVJDUEdVX01PREVfUkdCODg4X01BU0s7CiAJZWxz
ZQogCQlyZWdfY3RybCB8PSBBUkNQR1VfTU9ERV9SR0I4ODhfTUFTSzsKQEAgLTE5NSwxOCArMTk1
LDE1IEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX3BsYW5lICphcmNfcGd1X3BsYW5lX2luaXQoc3RydWN0
IGRybV9kZXZpY2UgKmRybSkKIHsKIAlzdHJ1Y3QgYXJjcGd1X2RybV9wcml2YXRlICphcmNwZ3Ug
PSBkcm0tPmRldl9wcml2YXRlOwogCXN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lID0gTlVMTDsKLQl1
MzIgZm9ybWF0c1tBUlJBWV9TSVpFKHN1cHBvcnRlZF9mb3JtYXRzKV0sIGk7CiAJaW50IHJldDsK
IAogCXBsYW5lID0gZGV2bV9remFsbG9jKGRybS0+ZGV2LCBzaXplb2YoKnBsYW5lKSwgR0ZQX0tF
Uk5FTCk7CiAJaWYgKCFwbGFuZSkKIAkJcmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7CiAKLQlmb3Ig
KGkgPSAwOyBpIDwgQVJSQVlfU0laRShzdXBwb3J0ZWRfZm9ybWF0cyk7IGkrKykKLQkJZm9ybWF0
c1tpXSA9IHN1cHBvcnRlZF9mb3JtYXRzW2ldLmZvdXJjYzsKLQogCXJldCA9IGRybV91bml2ZXJz
YWxfcGxhbmVfaW5pdChkcm0sIHBsYW5lLCAweGZmLCAmYXJjX3BndV9wbGFuZV9mdW5jcywKLQkJ
CQkgICAgICAgZm9ybWF0cywgQVJSQVlfU0laRShmb3JtYXRzKSwKKwkJCQkgICAgICAgYXJjX3Bn
dV9zdXBwb3J0ZWRfZm9ybWF0cywKKwkJCQkgICAgICAgQVJSQVlfU0laRShhcmNfcGd1X3N1cHBv
cnRlZF9mb3JtYXRzKSwKIAkJCQkgICAgICAgTlVMTCwKIAkJCQkgICAgICAgRFJNX1BMQU5FX1RZ
UEVfUFJJTUFSWSwgTlVMTCk7CiAJaWYgKHJldCkKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
