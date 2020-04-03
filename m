Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6FA19D083
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 08:54:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75C376EAFB;
	Fri,  3 Apr 2020 06:54:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9A636E194
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 02:17:45 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 57552E9F6934C14C73BC;
 Fri,  3 Apr 2020 10:17:42 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Fri, 3 Apr 2020
 10:17:32 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <b.zolnierkie@samsung.com>, <dri-devel@lists.freedesktop.org>,
 <linux-fbdev@vger.kernel.org>
Subject: [PATCH] video: fbdev: matroxfb: remove dead code and set but not used
 variable
Date: Fri, 3 Apr 2020 10:16:09 +0800
Message-ID: <20200403021609.20968-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 03 Apr 2020 06:54:15 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Jason Yan <yanaijie@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4IHRoZSBmb2xsb3dpbmcgZ2NjIHdhcm5pbmc6Cgpkcml2ZXJzL3ZpZGVvL2ZiZGV2L21hdHJv
eC9nNDUwX3BsbC5jOjMzNjoxNTogd2FybmluZzogdmFyaWFibGUK4oCYcGl4ZWxfdmNv4oCZIHNl
dCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCiAgdW5zaWduZWQgaW50
IHBpeGVsX3ZjbzsKICAgICAgICAgICAgICAgXn5+fn5+fn5+CgpSZXBvcnRlZC1ieTogSHVsayBS
b2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+ClNpZ25lZC1vZmYtYnk6IEphc29uIFlhbiA8eWFuYWlq
aWVAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L21hdHJveC9nNDUwX3BsbC5j
IHwgMjIgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvbWF0cm94L2c0NTBfcGxsLmMg
Yi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L21hdHJveC9nNDUwX3BsbC5jCmluZGV4IGMxNWY4YTU3NDk4
ZS4uZmY4ZTMyMWEyMmNlIDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L21hdHJveC9n
NDUwX3BsbC5jCisrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvbWF0cm94L2c0NTBfcGxsLmMKQEAg
LTMzMywxMSArMzMzLDkgQEAgc3RhdGljIGludCBfX2c0NTBfc2V0Y2xrKHN0cnVjdCBtYXRyb3hf
ZmJfaW5mbyAqbWluZm8sIHVuc2lnbmVkIGludCBmb3V0LAogCQkJIHVuc2lnbmVkIGludCAqZGVs
dGFhcnJheSkKIHsKIAl1bnNpZ25lZCBpbnQgbW5wY291bnQ7Ci0JdW5zaWduZWQgaW50IHBpeGVs
X3ZjbzsKIAljb25zdCBzdHJ1Y3QgbWF0cm94X3BsbF9saW1pdHMqIHBpOwogCXN0cnVjdCBtYXRy
b3hfcGxsX2NhY2hlKiBjaTsKIAotCXBpeGVsX3ZjbyA9IDA7CiAJc3dpdGNoIChwbGwpIHsKIAkJ
Y2FzZSBNX1BJWEVMX1BMTF9BOgogCQljYXNlIE1fUElYRUxfUExMX0I6CkBAIC00MjAsNyArNDE4
LDYgQEAgc3RhdGljIGludCBfX2c0NTBfc2V0Y2xrKHN0cnVjdCBtYXRyb3hfZmJfaW5mbyAqbWlu
Zm8sIHVuc2lnbmVkIGludCBmb3V0LAogCQkJCQogCQkJCW1ucCA9IG1hdHJveGZiX0RBQ19pbiht
aW5mbywgTTEwNjRfWFBJWFBMTENNKSA8PCAxNjsKIAkJCQltbnAgfD0gbWF0cm94ZmJfREFDX2lu
KG1pbmZvLCBNMTA2NF9YUElYUExMQ04pIDw8IDg7Ci0JCQkJcGl4ZWxfdmNvID0gZzQ1MF9tbnAy
dmNvKG1pbmZvLCBtbnApOwogCQkJCW1hdHJveGZiX0RBQ191bmxvY2tfaXJxcmVzdG9yZShmbGFn
cyk7CiAJCQl9CiAJCQlwaSA9ICZtaW5mby0+bGltaXRzLnZpZGVvOwpAQCAtNDQxLDI1ICs0Mzgs
NiBAQCBzdGF0aWMgaW50IF9fZzQ1MF9zZXRjbGsoc3RydWN0IG1hdHJveF9mYl9pbmZvICptaW5m
bywgdW5zaWduZWQgaW50IGZvdXQsCiAJCQl1bnNpZ25lZCBpbnQgZGVsdGE7CiAKIAkJCXZjbyA9
IGc0NTBfbW5wMnZjbyhtaW5mbywgbW5wKTsKLSNpZiAwCQkJCi0JCQlpZiAocGxsID09IE1fVklE
RU9fUExMKSB7Ci0JCQkJdW5zaWduZWQgaW50IGJpZywgc21hbGw7Ci0KLQkJCQlpZiAodmNvIDwg
cGl4ZWxfdmNvKSB7Ci0JCQkJCXNtYWxsID0gdmNvOwotCQkJCQliaWcgPSBwaXhlbF92Y287Ci0J
CQkJfSBlbHNlIHsKLQkJCQkJc21hbGwgPSBwaXhlbF92Y287Ci0JCQkJCWJpZyA9IHZjbzsKLQkJ
CQl9Ci0JCQkJd2hpbGUgKGJpZyA+IHNtYWxsKSB7Ci0JCQkJCWJpZyA+Pj0gMTsKLQkJCQl9Ci0J
CQkJaWYgKGJpZyA9PSBzbWFsbCkgewotCQkJCQljb250aW51ZTsKLQkJCQl9Ci0JCQl9Ci0jZW5k
aWYJCQkKIAkJCWRlbHRhID0gcGxsX2ZyZXFfZGVsdGEoZm91dCwgZzQ1MF92Y28yZihtbnAsIHZj
bykpOwogCQkJZm9yIChpZHggPSBtbnBjb3VudDsgaWR4ID4gMDsgaWR4LS0pIHsKIAkJCQkvKiA9
PSBpcyBpbXBvcnRhbnQ7IGR1ZSB0byBuZXh0cGxsIGFsZ29yaXRobSB3ZSBnZXQKLS0gCjIuMTcu
MgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
