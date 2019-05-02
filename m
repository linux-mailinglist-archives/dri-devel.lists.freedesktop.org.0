Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 654EE12299
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2019 21:32:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B3AA897E9;
	Thu,  2 May 2019 19:32:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7A12897E9
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 19:32:02 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id r18so3261917ioh.2
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2019 12:32:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ILaqFKrZSUHgd2yT3DIINx7+NJ9LGW1Bcu1j0Oy8loM=;
 b=e40RrMc0DkIfu8u+T+Q5iIDpg7ep58u2xB2UW68qfE9tEDCA+0zixEAz9xOr0w/HK4
 VXIIERLTlYmqNu8nrM/Vw5Wgo8O3xjIF/4TnOGLQmJ1C8x/g593JkE71iRGiWs3DEMcQ
 WfHzbxQQGAtZi/shVaPrufqqn7acwvGjB5n0SZKjuPHPO4yHTjykR4lZ302QmxK3NiQ2
 QWNfihbDwtdlxyUCAjfpux8pMV9pet2H6G7n2zEgCaCeIzQP1x8tCdw9P1g1G/y67nkT
 Gnk9ngwcfXsip2ucfqDhqDo9F1dJvEY5U54nS28S48jYgPvV7/y0g9EgkQYjL+1AOBWD
 Xhdg==
X-Gm-Message-State: APjAAAUfuRxHc/2kNpHlgKMDQj0eW0K2Lmdcw/q7VxAKT2eyCDiu4os4
 g6Wst1VyR5HADNzQNxKOLjti19XIaAd8FA==
X-Google-Smtp-Source: APXvYqxH/q4OhSSO3Yloqy/WwoxP53tc0R6aI8Li1dSaK/woTmSEJ/aEPD+Wq8nUA5Zw5BIK40G/2A==
X-Received: by 2002:a6b:c0c6:: with SMTP id q189mr4134713iof.283.1556825521784; 
 Thu, 02 May 2019 12:32:01 -0700 (PDT)
Received: from andres-vr.valvesoftware.com (135-23-65-40.cpe.pppoe.ca.
 [135.23.65.40])
 by smtp.gmail.com with ESMTPSA id 3sm5213173itk.1.2019.05.02.12.32.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 May 2019 12:32:00 -0700 (PDT)
From: Andres Rodriguez <andresx7@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: add non-desktop quirk for Valve HMDs
Date: Thu,  2 May 2019 15:31:57 -0400
Message-Id: <20190502193157.15692-1-andresx7@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ILaqFKrZSUHgd2yT3DIINx7+NJ9LGW1Bcu1j0Oy8loM=;
 b=NooMGiY6dOHwgaGzVC+9/2lW4jTTv+l9FQR9IrNttzNsnlFuN8f6y87boRxlxYDjOA
 chxKT8uBV7cb1tE48yc40YypKyvj/hANeeHNsndDrazWWzHKiUxbm0ChVdEORnAX9Ybm
 EcfJ1iRizYjT8/xObgZ/9dnrtgRwSCyJLPy8v3Q42JDqAaaZelfHWyOyQELorhKzPueR
 XvJhKffedxgKqyHUchYius6KuvvbuDcV8CAJvgioWN1nJipxXz5UVv7WNrtDjTZUw4xu
 UY2lCSxbimhYM6YywmUhUjXzc5EK7p+ptwgqA1fteAfwZeAxn9O2nWQvCnmxv88mVn87
 HU0A==
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
Cc: Dave Airlie <airlied@redhat.com>, Andres Rodriguez <andresx7@gmail.com>,
 stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHZlbmRvci9wcm9kdWN0IHBhaXJzIGZvciB0aGUgVmFsdmUgSW5kZXggSE1Ecy4KClNpZ25l
ZC1vZmYtYnk6IEFuZHJlcyBSb2RyaWd1ZXogPGFuZHJlc3g3QGdtYWlsLmNvbT4KQ2M6IERhdmUg
QWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+CkNjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4g
IyB2NC4xNQotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jIHwgMTkgKysrKysrKysrKysr
KysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCmlu
ZGV4IDJjMjJlYTQ0NjA3NS4uNjQ5Y2ZkOGI0MjAwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2VkaWQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwpAQCAtMTYyLDYg
KzE2MiwyNSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGVkaWRfcXVpcmsgewogCS8qIFJvdGVsIFJT
WC0xMDU4IGZvcndhcmRzIHNpbmsncyBFRElEIGJ1dCBvbmx5IGRvZXMgSERNSSAxLjEqLwogCXsg
IkVUUiIsIDEzODk2LCBFRElEX1FVSVJLX0ZPUkNFXzhCUEMgfSwKIAorCS8qIFZhbHZlIEluZGV4
IEhlYWRzZXQgKi8KKwl7ICJWTFYiLCAweDkxYTgsIEVESURfUVVJUktfTk9OX0RFU0tUT1AgfSwK
Kwl7ICJWTFYiLCAweDkxYjAsIEVESURfUVVJUktfTk9OX0RFU0tUT1AgfSwKKwl7ICJWTFYiLCAw
eDkxYjEsIEVESURfUVVJUktfTk9OX0RFU0tUT1AgfSwKKwl7ICJWTFYiLCAweDkxYjIsIEVESURf
UVVJUktfTk9OX0RFU0tUT1AgfSwKKwl7ICJWTFYiLCAweDkxYjMsIEVESURfUVVJUktfTk9OX0RF
U0tUT1AgfSwKKwl7ICJWTFYiLCAweDkxYjQsIEVESURfUVVJUktfTk9OX0RFU0tUT1AgfSwKKwl7
ICJWTFYiLCAweDkxYjUsIEVESURfUVVJUktfTk9OX0RFU0tUT1AgfSwKKwl7ICJWTFYiLCAweDkx
YjYsIEVESURfUVVJUktfTk9OX0RFU0tUT1AgfSwKKwl7ICJWTFYiLCAweDkxYjcsIEVESURfUVVJ
UktfTk9OX0RFU0tUT1AgfSwKKwl7ICJWTFYiLCAweDkxYjgsIEVESURfUVVJUktfTk9OX0RFU0tU
T1AgfSwKKwl7ICJWTFYiLCAweDkxYjksIEVESURfUVVJUktfTk9OX0RFU0tUT1AgfSwKKwl7ICJW
TFYiLCAweDkxYmEsIEVESURfUVVJUktfTk9OX0RFU0tUT1AgfSwKKwl7ICJWTFYiLCAweDkxYmIs
IEVESURfUVVJUktfTk9OX0RFU0tUT1AgfSwKKwl7ICJWTFYiLCAweDkxYmMsIEVESURfUVVJUktf
Tk9OX0RFU0tUT1AgfSwKKwl7ICJWTFYiLCAweDkxYmQsIEVESURfUVVJUktfTk9OX0RFU0tUT1Ag
fSwKKwl7ICJWTFYiLCAweDkxYmUsIEVESURfUVVJUktfTk9OX0RFU0tUT1AgfSwKKwl7ICJWTFYi
LCAweDkxYmYsIEVESURfUVVJUktfTk9OX0RFU0tUT1AgfSwKKwogCS8qIEhUQyBWaXZlIGFuZCBW
aXZlIFBybyBWUiBIZWFkc2V0cyAqLwogCXsgIkhWUiIsIDB4YWEwMSwgRURJRF9RVUlSS19OT05f
REVTS1RPUCB9LAogCXsgIkhWUiIsIDB4YWEwMiwgRURJRF9RVUlSS19OT05fREVTS1RPUCB9LAot
LSAKMi4xOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
