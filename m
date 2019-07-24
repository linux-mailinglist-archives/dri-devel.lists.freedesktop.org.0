Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4490B728A1
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 08:54:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB9686E45F;
	Wed, 24 Jul 2019 06:54:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C6766E426
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 02:57:02 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id k8so86426673iot.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 19:57:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=9LuYZGeTTRh9jWydJ51h+aLs5iCAt31ogMM0zlo+joQ=;
 b=V3dJTzixqzGAU6t9MX0x6QyuZHjTxVGPbasfL3ruDiGUbn9hMlEwMuLsXaoItA6fF2
 9IlxxyHjJh1DTNnt1AUsrXSWyvs+gcEPAeI/OXPOhUp/wsv61G0BjNcs7vQRDUyEDsLA
 n47HByvWaF+hZMWxtiwnCGeMuCdgRieT/Mt9sRqbeAYgNlbMQ5pa/5jSIiaNM01J45zQ
 tWTX/qcvzzgUg6S7UmF6pAzGsjyqjMi2s8Zrrl0+X8YcX3Al/cfyakLuSfY/Ao6Rp6Pc
 +v5dDnQWxqeVRwQiWnNdevAe9hZwULveX/1xEjRt/cMfKhPuCthaR+FpqFHqxb4JVoRs
 SaJQ==
X-Gm-Message-State: APjAAAUDzzN/1C6WI2UJUtYKVk4wkm1JFsOKG/TpEyk8rrLUZvYfjHnd
 cGpDGbYhRr1HkqBUsdeb4WCboDSt0xI=
X-Google-Smtp-Source: APXvYqxeOFjGHKvmnyj7si7F3C+wNy21FAYf7FWnUifFXE3BDOY54y6bzL7+qggxsL0/SbVhzf8hHg==
X-Received: by 2002:a05:6638:201:: with SMTP id
 e1mr3127273jaq.45.1563937021448; 
 Tue, 23 Jul 2019 19:57:01 -0700 (PDT)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [128.101.35.54])
 by smtp.googlemail.com with ESMTPSA id 20sm49019979iog.62.2019.07.23.19.56.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 23 Jul 2019 19:57:00 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: emamd001@umn.edu
Subject: [PATCH] rpi_touchscreen_probe: check for failure case
Date: Tue, 23 Jul 2019 21:56:43 -0500
Message-Id: <20190724025644.17163-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Wed, 24 Jul 2019 06:54:25 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=9LuYZGeTTRh9jWydJ51h+aLs5iCAt31ogMM0zlo+joQ=;
 b=k5ugUzpElphl/a1Ru+wxJ/t788bj7DWn4ZtCOF7bjTxCVc2E912sOW11VOsK20Px+n
 CRtHDYholNFHeKhZbkBvXxT1j14Nz4YVXf5bog2+l4e60PhFeLd4D965SaRyuk04mIJ7
 UXFKYjp8yx4OBEUsbAq5NyjhYRM6QZV6RWEdTNkZFAsxDY20FNDgQKJmoDu09kMuB9y9
 LcgDyn3/AJhiQrq32/frrZiVUt3Kkpmv+i5cfwdKd84/U4/4Wpsgx25iyko5HcsNJ+In
 Tp5t1BSIU0Xa6FjWIx7F6vtVu5pWgIlEUSCoigYQRr3bLGAKScXZNs/ayCpywo5PSZ3H
 3L1w==
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
Cc: David Airlie <airlied@linux.ie>, kjlu@umn.edu, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 smccaman@umn.edu, Sam Ravnborg <sam@ravnborg.org>,
 Navid Emamdoost <navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

b2ZfZ3JhcGhfZ2V0X25leHRfZW5kcG9pbnQgbWF5IHJldHVybiBOVUxMLCBzbyBudWxsIGNoZWNr
IGlzIG5lZWRlZC4KClNpZ25lZC1vZmYtYnk6IE5hdmlkIEVtYW1kb29zdCA8bmF2aWQuZW1hbWRv
b3N0QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtcmFzcGJlcnJ5
cGktdG91Y2hzY3JlZW4uYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtcmFzcGJlcnJ5cGktdG91
Y2hzY3JlZW4uYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yYXNwYmVycnlwaS10b3Vj
aHNjcmVlbi5jCmluZGV4IDI4YzA2MjBkZmUwZi4uMmUwOTc3ZTI2ZmFiIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtcmFzcGJlcnJ5cGktdG91Y2hzY3JlZW4uYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtcmFzcGJlcnJ5cGktdG91Y2hzY3JlZW4uYwpA
QCAtMzk5LDYgKzM5OSw4IEBAIHN0YXRpYyBpbnQgcnBpX3RvdWNoc2NyZWVuX3Byb2JlKHN0cnVj
dCBpMmNfY2xpZW50ICppMmMsCiAKIAkvKiBMb29rIHVwIHRoZSBEU0kgaG9zdC4gIEl0IG5lZWRz
IHRvIHByb2JlIGJlZm9yZSB3ZSBkby4gKi8KIAllbmRwb2ludCA9IG9mX2dyYXBoX2dldF9uZXh0
X2VuZHBvaW50KGRldi0+b2Zfbm9kZSwgTlVMTCk7CisJaWYgKCFlbmRwb2ludCkKKwkJcmV0dXJu
IC1FTk9ERVY7CiAJZHNpX2hvc3Rfbm9kZSA9IG9mX2dyYXBoX2dldF9yZW1vdGVfcG9ydF9wYXJl
bnQoZW5kcG9pbnQpOwogCWhvc3QgPSBvZl9maW5kX21pcGlfZHNpX2hvc3RfYnlfbm9kZShkc2lf
aG9zdF9ub2RlKTsKIAlvZl9ub2RlX3B1dChkc2lfaG9zdF9ub2RlKTsKLS0gCjIuMTcuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
