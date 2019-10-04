Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD92CCB44
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2019 18:38:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 169C76E3A8;
	Sat,  5 Oct 2019 16:37:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA076E2DA;
 Fri,  4 Oct 2019 09:30:38 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 620A540E5AC3BEA84624;
 Fri,  4 Oct 2019 17:30:35 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.439.0; Fri, 4 Oct 2019
 17:30:29 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <Bhawanpreet.Lakha@amd.com>, <harry.wentland@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>, <airlied@linux.ie>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: Make some functions static
Date: Fri, 4 Oct 2019 17:37:40 +0800
Message-ID: <1570181860-135298-1-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 05 Oct 2019 16:37:29 +0000
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
Cc: zhengbin13@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4IHNwYXJzZSB3YXJuaW5nczoKCmRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZGNwLmM6MzI6Njogd2FybmluZzogc3ltYm9sICdscF93
cml0ZV9pMmMnIHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/CmRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZGNwLmM6
NDI6Njogd2FybmluZzogc3ltYm9sICdscF9yZWFkX2kyYycgd2FzIG5vdCBkZWNsYXJlZC4gU2hv
dWxkIGl0IGJlIHN0YXRpYz8KZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9h
bWRncHVfZG0vYW1kZ3B1X2RtX2hkY3AuYzo1Mjo2OiB3YXJuaW5nOiBzeW1ib2wgJ2xwX3dyaXRl
X2RwY2QnIHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/CmRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZGNwLmM6NTk6
Njogd2FybmluZzogc3ltYm9sICdscF9yZWFkX2RwY2QnIHdhcyBub3QgZGVjbGFyZWQuIFNob3Vs
ZCBpdCBiZSBzdGF0aWM/CgpSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5j
b20+ClNpZ25lZC1vZmYtYnk6IHpoZW5nYmluIDx6aGVuZ2JpbjEzQGh1YXdlaS5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGRjcC5jIHwg
MTIgKysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVf
ZG0vYW1kZ3B1X2RtX2hkY3AuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVf
ZG0vYW1kZ3B1X2RtX2hkY3AuYwppbmRleCAyNDQzYzIzLi43NzE4MWRkIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZGNwLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGRjcC5j
CkBAIC0yOSw3ICsyOSw4IEBACiAjaW5jbHVkZSAiZG1faGVscGVycy5oIgogI2luY2x1ZGUgPGRy
bS9kcm1faGRjcC5oPgoKLWJvb2wgbHBfd3JpdGVfaTJjKHZvaWQgKmhhbmRsZSwgdWludDMyX3Qg
YWRkcmVzcywgY29uc3QgdWludDhfdCAqZGF0YSwgdWludDMyX3Qgc2l6ZSkKK3N0YXRpYyBib29s
CitscF93cml0ZV9pMmModm9pZCAqaGFuZGxlLCB1aW50MzJfdCBhZGRyZXNzLCBjb25zdCB1aW50
OF90ICpkYXRhLCB1aW50MzJfdCBzaXplKQogewoKIAlzdHJ1Y3QgZGNfbGluayAqbGluayA9IGhh
bmRsZTsKQEAgLTM5LDcgKzQwLDggQEAgYm9vbCBscF93cml0ZV9pMmModm9pZCAqaGFuZGxlLCB1
aW50MzJfdCBhZGRyZXNzLCBjb25zdCB1aW50OF90ICpkYXRhLCB1aW50MzJfdAogCXJldHVybiBk
bV9oZWxwZXJzX3N1Ym1pdF9pMmMobGluay0+Y3R4LCBsaW5rLCAmY21kKTsKIH0KCi1ib29sIGxw
X3JlYWRfaTJjKHZvaWQgKmhhbmRsZSwgdWludDMyX3QgYWRkcmVzcywgdWludDhfdCBvZmZzZXQs
IHVpbnQ4X3QgKmRhdGEsIHVpbnQzMl90IHNpemUpCitzdGF0aWMgYm9vbAorbHBfcmVhZF9pMmMo
dm9pZCAqaGFuZGxlLCB1aW50MzJfdCBhZGRyZXNzLCB1aW50OF90IG9mZnNldCwgdWludDhfdCAq
ZGF0YSwgdWludDMyX3Qgc2l6ZSkKIHsKIAlzdHJ1Y3QgZGNfbGluayAqbGluayA9IGhhbmRsZTsK
CkBAIC00OSwxNCArNTEsMTYgQEAgYm9vbCBscF9yZWFkX2kyYyh2b2lkICpoYW5kbGUsIHVpbnQz
Ml90IGFkZHJlc3MsIHVpbnQ4X3Qgb2Zmc2V0LCB1aW50OF90ICpkYXRhLAogCXJldHVybiBkbV9o
ZWxwZXJzX3N1Ym1pdF9pMmMobGluay0+Y3R4LCBsaW5rLCAmY21kKTsKIH0KCi1ib29sIGxwX3dy
aXRlX2RwY2Qodm9pZCAqaGFuZGxlLCB1aW50MzJfdCBhZGRyZXNzLCBjb25zdCB1aW50OF90ICpk
YXRhLCB1aW50MzJfdCBzaXplKQorc3RhdGljIGJvb2wKK2xwX3dyaXRlX2RwY2Qodm9pZCAqaGFu
ZGxlLCB1aW50MzJfdCBhZGRyZXNzLCBjb25zdCB1aW50OF90ICpkYXRhLCB1aW50MzJfdCBzaXpl
KQogewogCXN0cnVjdCBkY19saW5rICpsaW5rID0gaGFuZGxlOwoKIAlyZXR1cm4gZG1faGVscGVy
c19kcF93cml0ZV9kcGNkKGxpbmstPmN0eCwgbGluaywgYWRkcmVzcywgZGF0YSwgc2l6ZSk7CiB9
CgotYm9vbCBscF9yZWFkX2RwY2Qodm9pZCAqaGFuZGxlLCB1aW50MzJfdCBhZGRyZXNzLCB1aW50
OF90ICpkYXRhLCB1aW50MzJfdCBzaXplKQorc3RhdGljIGJvb2wKK2xwX3JlYWRfZHBjZCh2b2lk
ICpoYW5kbGUsIHVpbnQzMl90IGFkZHJlc3MsIHVpbnQ4X3QgKmRhdGEsIHVpbnQzMl90IHNpemUp
CiB7CiAJc3RydWN0IGRjX2xpbmsgKmxpbmsgPSBoYW5kbGU7CgotLQoyLjcuNAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
