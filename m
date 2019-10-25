Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73544E4551
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 10:12:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E71EB6E8F0;
	Fri, 25 Oct 2019 08:12:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 947986E8A2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 06:27:46 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id 3so868426pfb.10
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 23:27:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=QZ3cCvFs042gdndVaVEK94Jp8V2bjgQeW38pwjT4hfk=;
 b=bBqUkFSGm5Z0V2vehow88exGXqxQ9Iyyiqun/EPVMTaA92EFLZbM5ox4LIRquM2091
 XC4SyEhMhVvKB03OGO3kM9I3+xMWqN5nYGeK4OKCcyenhnOY4HJ2i0+jw6znB4gG69Iv
 ZgLw76tiHF0eO60vtMUMQuCAvzFT5c+wVPmfpvBovgPARZka1fBopmPFGJH+YO98eEaC
 8oJigUjU1+pJ0pWM/SbhcrkXbMi3vQpH4YBZGtBFcEWXN81DAdkLx/BaQ48GNLn976QQ
 VYZKteAynfOq180sMMsS6RGn/Re28meGmo6Rdj5jGxm6XiMLOG66PZbir8cWcKac8zSN
 BOEA==
X-Gm-Message-State: APjAAAUyGcAI+6TElXOq+Yp2Lq8xyfmk7aY/THq6BD1FZF1Eg6Aw97n6
 egqTGh9iszHXvtwa6l4ftD6dVMXa
X-Google-Smtp-Source: APXvYqzc04mQfLAHw2EJjLYi5n51Jy32cmq0A0pkaJnWqhSujWJfBnd17/OZ2aC7H28r5wELFJersA==
X-Received: by 2002:a63:ab43:: with SMTP id k3mr2285678pgp.170.1571984865780; 
 Thu, 24 Oct 2019 23:27:45 -0700 (PDT)
Received: from bhanu-VirtualBox.danlawtech.com ([183.82.102.247])
 by smtp.gmail.com with ESMTPSA id 82sm1492028pfa.115.2019.10.24.23.27.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 24 Oct 2019 23:27:45 -0700 (PDT)
From: Bhanusree <bhanusreemahesh@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/gpu: Fix Memory barrier without comment Issue
Date: Fri, 25 Oct 2019 11:57:38 +0530
Message-Id: <1571984858-4644-1-git-send-email-bhanusreemahesh@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Fri, 25 Oct 2019 08:11:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=QZ3cCvFs042gdndVaVEK94Jp8V2bjgQeW38pwjT4hfk=;
 b=IROrFxQ3UivrgpH4cvJJ3Oy04Pfh+WROzKvAyaUv6cJtCID5auC4z3y46jvkVNPUdM
 1Pohz7Qsl47FT3XxzsgsRccotuWckksOWJTJ2RehiDxWTNVaDmTQRvQt2ielCZ2oNUfs
 F6AtDR6cZaLNzeHfNXIwfb0RQ3dAZMbCRF37BEkaR6Bkoe+uhJgRAoeYc4bNgVmCw9lj
 K1SVH57IDacpnIkZKK/ni8ImmR15r0FWJbmQvE8k8WPH0HQ022AGKWLYcvOudskgbY8E
 vTxzCsBR32e+HuYmXKo3/3Rvdx4tsu3f0dnYikPDNVOTBE2AnzlUEN4vtFXQX1ZHLjrW
 6nCg==
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
Cc: airlied@linux.ie, Bhanusree <bhanusreemahesh@gmail.com>, sean@poorly.run
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

LUlzc3VlIGZvdW5kIHVzaW5nIGNoZWNrcGF0Y2gucGwKLUluc2VydCBjb21tZW50cyBmb3IgbWVt
b3J5IGJhcnJpZXIgdXNhZ2UKClNpZ25lZC1vZmYtYnk6IEJoYW51c3JlZSA8YmhhbnVzcmVlbWFo
ZXNoQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2NhY2hlLmMgfCA4ICsrKyst
LS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2FjaGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fY2FjaGUuYwppbmRleCAxMmY4ZDFiLi4wM2UwMWIwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2NhY2hlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jYWNoZS5jCkBAIC0x
MjYsMTAgKzEyNiwxMCBAQCBkcm1fY2xmbHVzaF9zZyhzdHJ1Y3Qgc2dfdGFibGUgKnN0KQogCWlm
IChzdGF0aWNfY3B1X2hhcyhYODZfRkVBVFVSRV9DTEZMVVNIKSkgewogCQlzdHJ1Y3Qgc2dfcGFn
ZV9pdGVyIHNnX2l0ZXI7CiAKLQkJbWIoKTsKKwkJbWIoKTsgLypDTEZMVVNIIGlzIG9yZGVyZWQg
b25seSBieSB1c2luZyBtZW1vcnkgYmFycmllcnMqLwogCQlmb3JfZWFjaF9zZ19wYWdlKHN0LT5z
Z2wsICZzZ19pdGVyLCBzdC0+bmVudHMsIDApCiAJCQlkcm1fY2xmbHVzaF9wYWdlKHNnX3BhZ2Vf
aXRlcl9wYWdlKCZzZ19pdGVyKSk7Ci0JCW1iKCk7CisJCW1iKCk7IC8qTWFrZSBzdXJlIHRoYXQg
YWxsIGNhY2hlIGxpbmUgZW50cnkgaXMgZmx1c2hlZCovCiAKIAkJcmV0dXJuOwogCX0KQEAgLTE2
MCwxMSArMTYwLDExIEBAIGRybV9jbGZsdXNoX3ZpcnRfcmFuZ2Uodm9pZCAqYWRkciwgdW5zaWdu
ZWQgbG9uZyBsZW5ndGgpCiAJCXZvaWQgKmVuZCA9IGFkZHIgKyBsZW5ndGg7CiAKIAkJYWRkciA9
ICh2b2lkICopKCgodW5zaWduZWQgbG9uZylhZGRyKSAmIC1zaXplKTsKLQkJbWIoKTsKKwkJbWIo
KTsgLypDTEZMVVNIIGlzIG9ubHkgb3JkZXJlZCB3aXRoIGEgZnVsbCBtZW1vcnkgYmFycmllciov
CiAJCWZvciAoOyBhZGRyIDwgZW5kOyBhZGRyICs9IHNpemUpCiAJCQljbGZsdXNob3B0KGFkZHIp
OwogCQljbGZsdXNob3B0KGVuZCAtIDEpOyAvKiBmb3JjZSBzZXJpYWxpc2F0aW9uICovCi0JCW1i
KCk7CisJCW1iKCk7IC8qRW5zdXJlIHRoYXQgZXZyeSBkYXRhIGNhY2hlIGxpbmUgZW50cnkgaXMg
Zmx1c2hlZCovCiAJCXJldHVybjsKIAl9CiAKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
