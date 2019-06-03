Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 135CA325D4
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 02:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6289D898A7;
	Mon,  3 Jun 2019 00:54:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB11B898A7
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 00:54:28 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id j19so3820808qtr.12
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jun 2019 17:54:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=zceYXTVJAPHzR+s4YHqDPm741YBgiQdDdwxeii1RN1M=;
 b=K7uRDAXaUvdXye5wZWkCCHcsQFyGOhloC5yf3MTXKF7oE4BWizx5qQozLNYkav8epz
 KSKhcTFjhdUpwN1WfrPUhWY5uz8oREcnwIlAoCoXbPHtRteeeUfj3QLX1mULvn/H7Owb
 4dfSl9e2fJkgxbcqHdtIauxJQORSfSWn1riDZPzrZ5z0QRLpCEzhwh2vDC/LMOD/VwLI
 khnwaPLkBFW+4ZSandax1jz9PEUoi0wVoIXG3C6gjCStCyTcZvduSIWea+1OVxVxPWqZ
 urOvmE1H1P1e/dcRgoR1PD/V2X14qTDcdikK6oVvXMn0lIzlx1Y2jItLXwlkAw/eaOCj
 HCZQ==
X-Gm-Message-State: APjAAAWgunDZtgVvL+QVmCxW4JhW3D2PTRla6DvliV7Rs3b/HHaOw9FH
 ryAY6o8Rk6aTobPgK2HC1sOzg/gLa3w=
X-Google-Smtp-Source: APXvYqzr/DcQWGSRIKV6xwYuUY8hUNtk/gfz/CeoexAx/BjK4kcQqueRf/f0ZDU4Q7wwqDDwecmfXg==
X-Received: by 2002:ac8:22db:: with SMTP id g27mr20921604qta.221.1559523267845; 
 Sun, 02 Jun 2019 17:54:27 -0700 (PDT)
Received: from athos.fios-router.home
 (pool-173-68-20-215.nycmny.fios.verizon.net. [173.68.20.215])
 by smtp.gmail.com with ESMTPSA id x2sm8307467qke.92.2019.06.02.17.54.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 02 Jun 2019 17:54:27 -0700 (PDT)
From: Ilia Mirkin <imirkin@alum.mit.edu>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm 10/10] modetest: add FP16 format support
Date: Sun,  2 Jun 2019 20:54:26 -0400
Message-Id: <20190603005426.7542-1-imirkin@alum.mit.edu>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zceYXTVJAPHzR+s4YHqDPm741YBgiQdDdwxeii1RN1M=;
 b=MoJX0Psca9nEb9K6a5ejIn2rSHOIgyzZZbQytkaZQwd+E3/ppNcN/a3VIMW/u6SGMs
 wFCCftAhpthUYkz8gR5CIbOwSxPpKAINF513NjVxhABAjkgTf0gXeYNv4D54Gu3WKStC
 ZtbUHCNSz42V1FTctsBBvAFH2BcuEKbRb0bYgZ/VE7CngXb61GfCzm5nrHF5sGQPjTlS
 AXAqiHLNflxRB8qzTTHt6cPIWd7agXgkMdJh67oGnDlXQq+vHHNX8lff4R49UFxyTUv3
 4qZpoy1/PJBfRBPjPQDoskgRCihFGH4e+WjcMWz8YOxlyRXi2JCFC1dOjqL6h+50e6ce
 BqvQ==
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

U2lnbmVkLW9mZi1ieTogSWxpYSBNaXJraW4gPGltaXJraW5AYWx1bS5taXQuZWR1PgotLS0KIHRl
c3RzL21vZGV0ZXN0L2J1ZmZlcnMuYyB8IDExICsrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwg
MTEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL21vZGV0ZXN0L2J1ZmZlcnMuYyBi
L3Rlc3RzL21vZGV0ZXN0L2J1ZmZlcnMuYwppbmRleCA1ZWM0ZWM4ZS4uOGE4ZDllMDEgMTAwNjQ0
Ci0tLSBhL3Rlc3RzL21vZGV0ZXN0L2J1ZmZlcnMuYworKysgYi90ZXN0cy9tb2RldGVzdC9idWZm
ZXJzLmMKQEAgLTE5NCw2ICsxOTQsMTMgQEAgYm9fY3JlYXRlKGludCBmZCwgdW5zaWduZWQgaW50
IGZvcm1hdCwKIAkJYnBwID0gMzI7CiAJCWJyZWFrOwogCisJY2FzZSBEUk1fRk9STUFUX1hSR0Ix
NjE2MTYxNkY6CisJY2FzZSBEUk1fRk9STUFUX1hCR1IxNjE2MTYxNkY6CisJY2FzZSBEUk1fRk9S
TUFUX0FSR0IxNjE2MTYxNkY6CisJY2FzZSBEUk1fRk9STUFUX0FCR1IxNjE2MTYxNkY6CisJCWJw
cCA9IDY0OworCQlicmVhazsKKwogCWRlZmF1bHQ6CiAJCWZwcmludGYoc3RkZXJyLCAidW5zdXBw
b3J0ZWQgZm9ybWF0IDB4JTA4eFxuIiwgIGZvcm1hdCk7CiAJCXJldHVybiBOVUxMOwpAQCAtMzEz
LDYgKzMyMCwxMCBAQCBib19jcmVhdGUoaW50IGZkLCB1bnNpZ25lZCBpbnQgZm9ybWF0LAogCWNh
c2UgRFJNX0ZPUk1BVF9SR0JYMTAxMDEwMjoKIAljYXNlIERSTV9GT1JNQVRfQkdSQTEwMTAxMDI6
CiAJY2FzZSBEUk1fRk9STUFUX0JHUlgxMDEwMTAyOgorCWNhc2UgRFJNX0ZPUk1BVF9YUkdCMTYx
NjE2MTZGOgorCWNhc2UgRFJNX0ZPUk1BVF9YQkdSMTYxNjE2MTZGOgorCWNhc2UgRFJNX0ZPUk1B
VF9BUkdCMTYxNjE2MTZGOgorCWNhc2UgRFJNX0ZPUk1BVF9BQkdSMTYxNjE2MTZGOgogCQlvZmZz
ZXRzWzBdID0gMDsKIAkJaGFuZGxlc1swXSA9IGJvLT5oYW5kbGU7CiAJCXBpdGNoZXNbMF0gPSBi
by0+cGl0Y2g7Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
