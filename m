Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7591D57052
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 20:10:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D4FA6E4B6;
	Wed, 26 Jun 2019 18:10:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA21F6E4B6;
 Wed, 26 Jun 2019 18:10:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 49C2D309264F;
 Wed, 26 Jun 2019 18:10:45 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-11.bss.redhat.com
 [10.20.1.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 132C25C1B4;
 Wed, 26 Jun 2019 18:10:40 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH] drm/nouveau: Enable i2c pads & busses during preinit
Date: Wed, 26 Jun 2019 14:10:27 -0400
Message-Id: <20190626181029.4168-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Wed, 26 Jun 2019 18:10:45 +0000 (UTC)
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
 dri-devel@lists.freedesktop.org, Marc Meledandri <m.meledandri@gmail.com>,
 Ben Skeggs <bskeggs@redhat.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQgdHVybnMgb3V0IHRoYXQgd2hpbGUgZGlzYWJsaW5nIGkyYyBidXMgYWNjZXNzIGZyb20gc29m
dHdhcmUgd2hlbiB0aGUKR1BVIGlzIHN1c3BlbmRlZCB3YXMgYSBzdGVwIGluIHRoZSByaWdodCBk
aXJlY3Rpb24gd2l0aDoKCmNvbW1pdCAzNDI0MDZlNGZiYmEgKCJkcm0vbm91dmVhdS9pMmM6IERp
c2FibGUgaTJjIGJ1cyBhY2Nlc3MgYWZ0ZXIKLT5maW5pKCkiKQoKV2UgYWxzbyBlbmRlZCB1cCBh
Y2NpZGVudGFsbHkgYnJlYWtpbmcgdGhlIHZiaW9zIGluaXQgc2NyaXB0cyBvbiBzb21lCm9sZGVy
IFRlc2xhIEdQVXMsIGFzIGFwcGFyZW50bHkgc2FpZCBzY3JpcHRzIGNhbiBhY3R1YWxseSB1c2Ug
dGhlIGkyYwpidXMuIFNpbmNlIHRoZXNlIHNjcmlwdHMgYXJlIGV4ZWN1dGVkIGJlZm9yZSBpbml0
aWFsaXppbmcgYW55CnN1YmRldmljZXMsIHdlIGVuZCB1cCBmYWlsaW5nIHRvIGFjcXVpcmUgYWNj
ZXNzIHRvIHRoZSBpMmMgYnVzIHdoaWNoIGhhcwpsZWZ0IGEgbnVtYmVyIG9mIGNhcmRzIHdpdGgg
dGhlaXIgZmFuIGNvbnRyb2xsZXJzIHVuaW5pdGlhbGl6ZWQuIEx1Y2tpbHkKdGhpcyBkb2Vzbid0
IGJyZWFrIGhhcmR3YXJlIC0gaXQganVzdCBtZWFucyB0aGUgZmFuIGdldHMgc3R1Y2sgYXQgMTAw
JS4KClRoaXMgYWxzbyBtZWFucyB0aGF0IHdlJ3ZlIGFsd2F5cyBiZWVuIHVzaW5nIG91ciBpMmMg
YnVzc2VzIGJlZm9yZQppbml0aWFsaXppbmcgdGhlbSBkdXJpbmcgdGhlIGluaXQgc2NyaXB0cyBm
b3Igb2xkZXIgR1BVcywgd2UganVzdCBkaWRuJ3QKbm90aWNlIGl0IHVudGlsIHdlIHN0YXJ0ZWQg
cHJldmVudGluZyB0aGVtIGZyb20gYmVpbmcgdXNlZCB1bnRpbCBpbml0LgpJdCdzIHByZXR0eSBp
bXByZXNzaXZlIHRoaXMgbmV2ZXIgY2F1c2VkIHVzIGFueSBpc3N1ZXMgYmVmb3JlIQoKU28sIGZp
eCB0aGlzIGJ5IGluaXRpYWxpemluZyBvdXIgaTJjIHBhZCBhbmQgYnVzc2VzIGR1cmluZyBzdWJk
ZXYKcHJlLWluaXQuIFdlIHNraXAgaW5pdGlhbGl6aW5nIGF1eCBidXNzZXMgZHVyaW5nIHByZS1p
bml0LCBhcyB0aG9zZSBhcmUKZ3VhcmFudGVlZCB0byBvbmx5IGV2ZXIgYmUgdXNlZCBieSBub3V2
ZWF1IGZvciBEUCBhdXggdHJhbnNhY3Rpb25zLgoKU2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1bCA8
bHl1ZGVAcmVkaGF0LmNvbT4KVGVzdGVkLWJ5OiBNYXJjIE1lbGVkYW5kcmkgPG0ubWVsZWRhbmRy
aUBnbWFpbC5jb20+CkZpeGVzOiAzNDI0MDZlNGZiYmEgKCJkcm0vbm91dmVhdS9pMmM6IERpc2Fi
bGUgaTJjIGJ1cyBhY2Nlc3MgYWZ0ZXIgLT5maW5pKCkiKQpDYzogc3RhYmxlQHZnZXIua2VybmVs
Lm9yZwotLS0KIC4uLi9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvaTJjL2Jhc2UuYyAgICB8
IDIwICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvaTJjL2Jh
c2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2kyYy9iYXNlLmMKaW5k
ZXggZWNhY2IyMjgzNGQ3Li43MTkzNDUwNzQ3MTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L252a20vc3ViZGV2L2kyYy9iYXNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbnZrbS9zdWJkZXYvaTJjL2Jhc2UuYwpAQCAtMTg0LDYgKzE4NCwyNSBAQCBudmttX2ky
Y19maW5pKHN0cnVjdCBudmttX3N1YmRldiAqc3ViZGV2LCBib29sIHN1c3BlbmQpCiAJcmV0dXJu
IDA7CiB9CiAKK3N0YXRpYyBpbnQKK252a21faTJjX3ByZWluaXQoc3RydWN0IG52a21fc3ViZGV2
ICpzdWJkZXYpCit7CisJc3RydWN0IG52a21faTJjICppMmMgPSBudmttX2kyYyhzdWJkZXYpOwor
CXN0cnVjdCBudmttX2kyY19idXMgKmJ1czsKKwlzdHJ1Y3QgbnZrbV9pMmNfcGFkICpwYWQ7CisK
KwkvKgorCSAqIFdlIGluaXQgb3VyIGkyYyBidXNzZXMgYXMgZWFybHkgYXMgcG9zc2libGUsIHNp
bmNlIHRoZXkgbWF5IGJlCisJICogbmVlZGVkIGJ5IHRoZSB2YmlvcyBpbml0IHNjcmlwdHMgb24g
c29tZSBjYXJkcworCSAqLworCWxpc3RfZm9yX2VhY2hfZW50cnkocGFkLCAmaTJjLT5wYWQsIGhl
YWQpCisJCW52a21faTJjX3BhZF9pbml0KHBhZCk7CisJbGlzdF9mb3JfZWFjaF9lbnRyeShidXMs
ICZpMmMtPmJ1cywgaGVhZCkKKwkJbnZrbV9pMmNfYnVzX2luaXQoYnVzKTsKKworCXJldHVybiAw
OworfQorCiBzdGF0aWMgaW50CiBudmttX2kyY19pbml0KHN0cnVjdCBudmttX3N1YmRldiAqc3Vi
ZGV2KQogewpAQCAtMjM4LDYgKzI1Nyw3IEBAIG52a21faTJjX2R0b3Ioc3RydWN0IG52a21fc3Vi
ZGV2ICpzdWJkZXYpCiBzdGF0aWMgY29uc3Qgc3RydWN0IG52a21fc3ViZGV2X2Z1bmMKIG52a21f
aTJjID0gewogCS5kdG9yID0gbnZrbV9pMmNfZHRvciwKKwkucHJlaW5pdCA9IG52a21faTJjX3By
ZWluaXQsCiAJLmluaXQgPSBudmttX2kyY19pbml0LAogCS5maW5pID0gbnZrbV9pMmNfZmluaSwK
IAkuaW50ciA9IG52a21faTJjX2ludHIsCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
