Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E9C104717
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 00:51:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 997EE6E415;
	Wed, 20 Nov 2019 23:51:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAA386E415;
 Wed, 20 Nov 2019 23:51:46 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id q70so1462128qke.12;
 Wed, 20 Nov 2019 15:51:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PJb7Cu+KfZiPVYEWDRTLYv/VMyv/vAnFZroDmzDf0g0=;
 b=m/sqEOtUYchQGPuJEDtU/kSRjEAFyI52lGtD30T7OhuvX3Y8XZ7NPkpSuFH1ZMTUih
 NyInQ5u8jRHfhf46yueq4ypZuaoqNcepzjhgfbLJYrQzYpPTQQrTOWQjCDUY7/APxr6e
 kuWeAS3lyCuOpAtcgykIwaXbyENmc7xxTTGTtpeBey0pK3aSswHeMjJwvdg2yXg66WSZ
 tujfZwUzj7Med9D8pxjVGedUwOdeKkoaFqx0WznddyrZPDG9/j9RR7RYfbdLzKVrFCVu
 Bx7nI6HVIS0kxo7DkKuO/KtrdIQUWexsKHj68nAt2k9aTzj02acvgZiH0L0a7rNlJwdh
 Jhlg==
X-Gm-Message-State: APjAAAV7kIVam8GI0qvc8O+Do0rNy0xibTzEA5b5wEwwLlt2Lguof860
 DiM965dqG2R2IySmTObRwBUQluob
X-Google-Smtp-Source: APXvYqywjmhr5I8H36S4kpUB2EAGk44yKegCjCc8nwfemQAhTWqkNM8g58iWeKQ7JaAMeQO0t/QLWw==
X-Received: by 2002:a37:9843:: with SMTP id a64mr5193756qke.47.1574293905486; 
 Wed, 20 Nov 2019 15:51:45 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id a3sm451534qkf.76.2019.11.20.15.51.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2019 15:51:44 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-fixes-5.4
Date: Wed, 20 Nov 2019 18:51:30 -0500
Message-Id: <20191120235130.23755-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PJb7Cu+KfZiPVYEWDRTLYv/VMyv/vAnFZroDmzDf0g0=;
 b=Z4HgTJaJLtcbJNvAj03T/6UZFc6L6p3UNWmn1Cff3bNEEU7W3lUGtcU6ZIYpNi7VTX
 k0ipD42rtGsBjoO9EDaxEpf/eqnZ35Ogmh5hoZ5jcV5hluBwmhrcbpzwCBrt+f4DzMWK
 kdDxJPmdFuqBS/IqMyiIQaoWvJwpcvOZw0Rp2sPuBGoJx76KrTqkCLqf4ckkNhjvMoPx
 xOhF40lQm7NpA92+w56pRxAYypoODYHCcOub/PyQz3TMsDduuYSbVwZ/eoyzwV1Z/7By
 eSp5bZxvAvSrV9tGhPhp2BpGGXYqiJPoPrKWBQo4xDsR/YdO4Ds1XNCWIL4o3OW5cr6g
 1doQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSwgRGFuaWVsLAoKQSBmZXcgZml4ZXMgZm9yIDUuNC4gIFN0YWJpbGl0eSBhbmQgcmVn
cmVzc2lvbiBmaXhlcy4gTW9zdCBDQ2VkIHRvIHN0YWJsZS4KClRoZSBmb2xsb3dpbmcgY2hhbmdl
cyBzaW5jZSBjb21taXQgYWY0MmQzNDY2YmRjOGYzOTgwNmIyNmY1OTM2MDRmZGM1NDE0MGJjYjoK
CiAgTGludXggNS40LXJjOCAoMjAxOS0xMS0xNyAxNDo0NzozMCAtMDgwMCkKCmFyZSBhdmFpbGFi
bGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6Ly9wZW9wbGUuZnJlZWRlc2t0b3Au
b3JnL35hZ2Q1Zi9saW51eCB0YWdzL2RybS1maXhlcy01LjQtMjAxOS0xMS0yMAoKZm9yIHlvdSB0
byBmZXRjaCBjaGFuZ2VzIHVwIHRvIGEwMTg0ZDcxMTYzYWFiMjU4ZDczMTQxYTg4Mzk2NzVkNmNi
ZGNmNDA6CgogIFJldmVydCAiZHJtL2FtZC9kaXNwbGF5OiBlbmFibGUgUy9HIGZvciBSQVZFTiBj
aGlwIiAoMjAxOS0xMS0yMCAxODo0MDoyMSAtMDUwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KZHJtLWZpeGVzLTUuNC0y
MDE5LTExLTIwOgoKYW1kZ3B1OgotIFJlbW92ZSBleHBlcmltZW50YWwgZmxhZyBmb3IgbmF2aTE0
Ci0gRml4IGNvbmZ1c2luZyBwb3dlciBtZXNzYWdlIGZhaWx1cmVzIG9uIG9sZGVyIFZJIHBhcnRz
Ci0gSGFuZyBmaXggZm9yIGdmeG9mZiB3aGVuIHVzaW5nIHRoZSByZWFkIHJlZ2lzdGVyIGludGVy
ZmFjZQotIFR3byBzdGFiaWxpdHkgcmVncmVzc2lvbiBmaXhlcyBmb3IgUmF2ZW4KCi0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
QWxleCBEZXVjaGVyICg0KToKICAgICAgZHJtL2FtZGdwdTogcmVtb3ZlIGV4cGVyaW1lbnRhbCBm
bGFnIGZvciBOYXZpMTQKICAgICAgZHJtL2FtZGdwdTogZGlzYWJsZSBnZnhvZmYgd2hlbiB1c2lu
ZyByZWdpc3RlciByZWFkIGludGVyZmFjZQogICAgICBkcm0vYW1kZ3B1OiBkaXNhYmxlIGdmeG9m
ZiBvbiBvcmlnaW5hbCByYXZlbgogICAgICBSZXZlcnQgImRybS9hbWQvZGlzcGxheTogZW5hYmxl
IFMvRyBmb3IgUkFWRU4gY2hpcCIKCkV2YW4gUXVhbiAoMik6CiAgICAgIGRybS9hbWQvcG93ZXJw
bGF5OiBpc3N1ZSBubyBQUFNNQ19NU0dfR2V0Q3VyclBrZ1B3ciBvbiB1bnN1cHBvcnRlZCBBU0lD
cwogICAgICBkcm0vYW1kL3Bvd2VycGxheTogY29ycmVjdCBmaW5lIGdyYWluZWQgZHBtIGZvcmNl
IGxldmVsIHNldHRpbmcKCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzcGxh
eS5jICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYu
YyAgICAgICAgICAgfCAgOCArKysrLS0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2ttcy5jICAgICAgICAgICB8ICA2ICsrKysrLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ2Z4X3Y5XzAuYyAgICAgICAgICAgICB8ICA5ICsrKysrKystLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8ICAyICstCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9od21nci9zbXU3X2h3bWdyLmMgIHwgMjMgKysrKysrKysrKysrKysr
KysrLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYyAgICAg
ICAgfCAgNiArKysrKysKIDcgZmlsZXMgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKSwgMTQgZGVs
ZXRpb25zKC0pCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
