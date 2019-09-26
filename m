Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 717DBBED55
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 10:25:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F8036EE65;
	Thu, 26 Sep 2019 08:25:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 857DF6EE65
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 08:25:09 +0000 (UTC)
Received: from localhost (unknown [192.168.167.193])
 by lucky1.263xmail.com (Postfix) with ESMTP id 8A99668135;
 Thu, 26 Sep 2019 16:25:07 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P24701T140118476191488S1569486296531843_; 
 Thu, 26 Sep 2019 16:25:07 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <1af4b4c1788e9f87dccb81098897a452>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: dri-devel@lists.freedesktop.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
From: Sandy Huang <hjc@rock-chips.com>
To: dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 2/3] drm/rockchip: Add rockchip_vop_get_offset to get offset
Date: Thu, 26 Sep 2019 16:24:48 +0800
Message-Id: <1569486289-152061-3-git-send-email-hjc@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569486289-152061-1-git-send-email-hjc@rock-chips.com>
References: <1569486289-152061-1-git-send-email-hjc@rock-chips.com>
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
Cc: linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHJvY2tjaGlwX3ZvcF9nZXRfb2Zmc2V0IHRvIGdldCBvZmZzZXQsIHRoaXMgY2FuIGNvbXBh
dGlibGUgbGVnYWN5CmFuZCBibG9ja19oL3cgZm9ybWF0IGRlc2NyaWJlLgoKU2lnbmVkLW9mZi1i
eTogU2FuZHkgSHVhbmcgPGhqY0Byb2NrLWNoaXBzLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
cm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5jIHwgNjEgKysrKysrKysrKysrKysrKysrKysrKysr
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1MiBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5jCmluZGV4IDJmODIx
YzUuLmNlNzQyMTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hp
cF9kcm1fdm9wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92
b3AuYwpAQCAtMjQ5LDYgKzI0OSw1NiBAQCBzdGF0aWMgYm9vbCBoYXNfcmJfc3dhcHBlZCh1aW50
MzJfdCBmb3JtYXQpCiAJfQogfQogCitzdGF0aWMgdTMyIHJvY2tjaGlwX3ZvcF9nZXRfb2Zmc2V0
KHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKnN0YXRlLCB1OCBwbGFuZSkKK3sKKwljb25zdCBzdHJ1
Y3QgZHJtX2Zvcm1hdF9pbmZvICppbmZvOworCXN0cnVjdCBkcm1fcmVjdCAqc3JjID0gJnN0YXRl
LT5zcmM7CisJc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIgPSBzdGF0ZS0+ZmI7CisJdTMyIGZv
cm1hdCA9IGZiLT5mb3JtYXQtPmZvcm1hdDsKKwl1OCBoX2RpdiA9IDEsIHZfZGl2ID0gMTsKKwl1
MzIgYmxvY2tfdywgYmxvY2tfaCwgYmxvY2tfc2l6ZSwgYmxvY2tfc3RhcnRfeSwgbnVtX2hibG9j
a3M7CisJdTMyIHNhbXBsZV94LCBzYW1wbGVfeTsKKwl1MzIgb2Zmc2V0OworCisJaW5mbyA9IGRy
bV9mb3JtYXRfaW5mbyhmb3JtYXQpOworCWlmICghaW5mbyB8fCBwbGFuZSA+PSBpbmZvLT5udW1f
cGxhbmVzKQorCQlyZXR1cm4gMDsKKworCWlmIChwbGFuZSA+IDApIHsKKwkJaF9kaXYgPSBmYi0+
Zm9ybWF0LT5oc3ViOworCQl2X2RpdiA9IGZiLT5mb3JtYXQtPnZzdWI7CisJfQorCisJc3dpdGNo
IChmb3JtYXQpIHsKKwljYXNlIERSTV9GT1JNQVRfTlYxMl8xMDoKKwljYXNlIERSTV9GT1JNQVRf
TlYyMV8xMDoKKwljYXNlIERSTV9GT1JNQVRfTlYxNl8xMDoKKwljYXNlIERSTV9GT1JNQVRfTlY2
MV8xMDoKKwljYXNlIERSTV9GT1JNQVRfTlYyNF8xMDoKKwljYXNlIERSTV9GT1JNQVRfTlY0Ml8x
MDoKKwkJYmxvY2tfdyA9IGRybV9mb3JtYXRfaW5mb19ibG9ja193aWR0aChmYi0+Zm9ybWF0LCBw
bGFuZSk7CisJCWJsb2NrX2ggPSBkcm1fZm9ybWF0X2luZm9fYmxvY2tfaGVpZ2h0KGZiLT5mb3Jt
YXQsIHBsYW5lKTsKKwkJYmxvY2tfc2l6ZSA9IGZiLT5mb3JtYXQtPmNoYXJfcGVyX2Jsb2NrW3Bs
YW5lXTsKKworCQlzYW1wbGVfeCA9IChzcmMtPngxID4+IDE2KSAvIGhfZGl2OworCQlzYW1wbGVf
eSA9IChzcmMtPnkxID4+IDE2KSAvIHZfZGl2OworCQlibG9ja19zdGFydF95ID0gKHNhbXBsZV95
IC8gYmxvY2tfaCkgKiBibG9ja19oOworCQludW1faGJsb2NrcyA9IHNhbXBsZV94IC8gYmxvY2tf
dzsKKworCQlvZmZzZXQgPSBmYi0+cGl0Y2hlc1twbGFuZV0gKiBibG9ja19zdGFydF95OworCQlv
ZmZzZXQgKz0gYmxvY2tfc2l6ZSAqIG51bV9oYmxvY2tzOworCisJCWJyZWFrOworCWRlZmF1bHQ6
CisJCW9mZnNldCA9IChzcmMtPngxID4+IDE2KSAqIGZiLT5mb3JtYXQtPmNwcFtwbGFuZV0gLyBo
X2RpdjsKKwkJb2Zmc2V0ICs9IChzcmMtPnkxID4+IDE2KSAqIGZiLT5waXRjaGVzW3BsYW5lXSAv
IHZfZGl2OworCisJCWJyZWFrOworCX0KKworCXJldHVybiBvZmZzZXQ7Cit9CisKIHN0YXRpYyBl
bnVtIHZvcF9kYXRhX2Zvcm1hdCB2b3BfY29udmVydF9mb3JtYXQodWludDMyX3QgZm9ybWF0KQog
ewogCXN3aXRjaCAoZm9ybWF0KSB7CkBAIC04MzIsOCArODgyLDcgQEAgc3RhdGljIHZvaWQgdm9w
X3BsYW5lX2F0b21pY191cGRhdGUoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCiAJZHNwX3N0eSA9
IGRlc3QtPnkxICsgY3J0Yy0+bW9kZS52dG90YWwgLSBjcnRjLT5tb2RlLnZzeW5jX3N0YXJ0Owog
CWRzcF9zdCA9IGRzcF9zdHkgPDwgMTYgfCAoZHNwX3N0eCAmIDB4ZmZmZik7CiAKLQlvZmZzZXQg
PSAoc3JjLT54MSA+PiAxNikgKiBmYi0+Zm9ybWF0LT5jcHBbMF07Ci0Jb2Zmc2V0ICs9IChzcmMt
PnkxID4+IDE2KSAqIGZiLT5waXRjaGVzWzBdOworCW9mZnNldCA9IHJvY2tjaGlwX3ZvcF9nZXRf
b2Zmc2V0KHN0YXRlLCAwKTsKIAlkbWFfYWRkciA9IHJrX29iai0+ZG1hX2FkZHIgKyBvZmZzZXQg
KyBmYi0+b2Zmc2V0c1swXTsKIAogCS8qCkBAIC04NTcsMTYgKzkwNiwxMCBAQCBzdGF0aWMgdm9p
ZCB2b3BfcGxhbmVfYXRvbWljX3VwZGF0ZShzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwKIAkJICAg
IChzdGF0ZS0+cm90YXRpb24gJiBEUk1fTU9ERV9SRUZMRUNUX1gpID8gMSA6IDApOwogCiAJaWYg
KGlzX3l1dikgewotCQlpbnQgaHN1YiA9IGZiLT5mb3JtYXQtPmhzdWI7Ci0JCWludCB2c3ViID0g
ZmItPmZvcm1hdC0+dnN1YjsKLQkJaW50IGJwcCA9IGZiLT5mb3JtYXQtPmNwcFsxXTsKLQogCQl1
dl9vYmogPSBmYi0+b2JqWzFdOwogCQlya191dl9vYmogPSB0b19yb2NrY2hpcF9vYmoodXZfb2Jq
KTsKIAotCQlvZmZzZXQgPSAoc3JjLT54MSA+PiAxNikgKiBicHAgLyBoc3ViOwotCQlvZmZzZXQg
Kz0gKHNyYy0+eTEgPj4gMTYpICogZmItPnBpdGNoZXNbMV0gLyB2c3ViOwotCisJCW9mZnNldCA9
IHJvY2tjaGlwX3ZvcF9nZXRfb2Zmc2V0KHN0YXRlLCAxKTsKIAkJZG1hX2FkZHIgPSBya191dl9v
YmotPmRtYV9hZGRyICsgb2Zmc2V0ICsgZmItPm9mZnNldHNbMV07CiAJCVZPUF9XSU5fU0VUKHZv
cCwgd2luLCB1dl92aXIsIERJVl9ST1VORF9VUChmYi0+cGl0Y2hlc1sxXSwgNCkpOwogCQlWT1Bf
V0lOX1NFVCh2b3AsIHdpbiwgdXZfbXN0LCBkbWFfYWRkcik7Ci0tIAoyLjcuNAoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
