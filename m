Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E66EC864
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 19:21:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0243F6E2C4;
	Fri,  1 Nov 2019 18:21:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23AFC6E2C4
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 18:21:21 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id u184so11553638qkd.4
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Nov 2019 11:21:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xfChniPxmFbZU2S4qrE7c3GqiFqrYlUdrzoxXGWQIRg=;
 b=uEz5ECi5fJTZ4N+wDGgL8C0mLYEaGm+wjrvCTHzsdUppqeH6HDxmTsdRomc5GX64s6
 yRrSwqr6B6VhPPsQJhAlarm8Fsk90TH6tHK1S1VkRSP4hiUbvHcHC4rSyrR9T9d0ynlY
 x0rbP2B4Zvn/npVp3LAQ3C3qRb5cWnUJw5DFVTl16pgF6+4/+BmyeGojlgYbPXnMDhSr
 OGUiRzI6+oHhskTTSuw+aJGfbuK581OPSL4IOQaVas5mEVvvSkYlmHleGnl3lI3Xxe/q
 HE6NINlZZtCXGarhCiuEOxoP/y4oSs17wUO9gq8JUIXgfP346q8HMKeef6AJBPYvjvIm
 lfkA==
X-Gm-Message-State: APjAAAUS7c6AUpWU8OZ3FwBG1xCtXo3iAWjLpt5X8IjURpPptFFGs9Pe
 YS9QeF6dli/o3SKCdAB+bzk=
X-Google-Smtp-Source: APXvYqxZY/z0KLt1SybUGNSm28l8yCtxJuvO7dV3LGq7qbkBb//5NCQ5JlrS/35+dRQm18m56FMylg==
X-Received: by 2002:a37:b046:: with SMTP id z67mr1749300qke.343.1572632480189; 
 Fri, 01 Nov 2019 11:21:20 -0700 (PDT)
Received: from GBdebian.ic.unicamp.br (wifi-177-220-84-14.wifi.ic.unicamp.br.
 [177.220.84.14])
 by smtp.gmail.com with ESMTPSA id x38sm5106688qtc.64.2019.11.01.11.21.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2019 11:21:19 -0700 (PDT)
From: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
To: outreachy-kernel@googlegroups.com, manasi.d.navare@intel.com,
 rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com, daniel@ffwll.ch,
 airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lkcamp@lists.libreplanetbr.org,
 trivial@kernel.org
Subject: [PATCH] drm/vkms: Fix typo in function documentation
Date: Fri,  1 Nov 2019 15:21:02 -0300
Message-Id: <20191101182102.30358-1-gabrielabittencourt00@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xfChniPxmFbZU2S4qrE7c3GqiFqrYlUdrzoxXGWQIRg=;
 b=I3SMuVHnefRGev7pKBa/p/vIdpNEst8AexAfUrQVntypTFJVSOseXJZcgDIgmsGXAu
 cmQ89JtTQy3tV7nJmJSSSCu2kN5AbiWclNGyInwZ+03vGsEw1Fht3wC53e4eokh/j8Zb
 JrI0B+PU7qmLMAlxCXiYY3BNoX9XEZZkHyvUEErAI8XoNu4k12MUMDK81fyYkVKRsDf/
 v3GW+n4KTacJVvKZKAnnUsAmfx8KxoCBiCZBCxf0XGxn/EWOVRDtHsGFN7hwzQXWjAht
 TJiML7FmEkeePOp6uv6E7gPfPfdrLtkU23vwXgdnNWyy9n5D9Q8/CG/+76SzYZV8eLCL
 F23Q==
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
Cc: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4IHR5cG8gaW4gd29yZCAnYmxlbmQnIGluIGZ1bmN0aW9uICdjb21wdXRlX2NyYycgZG9jdW1l
bnRhdGlvbi4KClNpZ25lZC1vZmYtYnk6IEdhYnJpZWxhIEJpdHRlbmNvdXJ0IDxnYWJyaWVsYWJp
dHRlbmNvdXJ0MDBAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfY29t
cG9zZXIuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfY29tcG9zZXIuYyBi
L2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfY29tcG9zZXIuYwppbmRleCBkNTU4NTY5NWM2NGQu
LjE1ZWZjY2RjY2UxYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19jb21w
b3Nlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfY29tcG9zZXIuYwpAQCAtNDMs
NyArNDMsNyBAQCBzdGF0aWMgdWludDMyX3QgY29tcHV0ZV9jcmModm9pZCAqdmFkZHJfb3V0LCBz
dHJ1Y3Qgdmttc19jb21wb3NlciAqY29tcG9zZXIpCiB9CiAKIC8qKgotICogYmxlbmQgLSBiZWxu
ZCB2YWx1ZSBhdCB2YWRkcl9zcmMgd2l0aCB2YWx1ZSBhdCB2YWRkcl9kc3QKKyAqIGJsZW5kIC0g
YmxlbmQgdmFsdWUgYXQgdmFkZHJfc3JjIHdpdGggdmFsdWUgYXQgdmFkZHJfZHN0CiAgKiBAdmFk
ZHJfZHN0OiBkZXN0aW5hdGlvbiBhZGRyZXNzCiAgKiBAdmFkZHJfc3JjOiBzb3VyY2UgYWRkcmVz
cwogICogQGRlc3RfY29tcG9zZXI6IGRlc3RpbmF0aW9uIGZyYW1lYnVmZmVyJ3MgbWV0YWRhdGEK
LS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
