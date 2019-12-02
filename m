Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7E610EE30
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 18:29:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A47B66E287;
	Mon,  2 Dec 2019 17:29:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A606E290
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 17:29:51 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id w15so139933wru.4
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2019 09:29:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q6xOsIVEpmTEM/MXwaq1zb46mExyiH314du/gb6pfek=;
 b=EDCuRFeb3w5ruIrzlBxyivHjlJAiDHE8qKgdl7REEVN1pvP6WZbuwH/WnrA4Li0QKG
 K+R5U9z1ptogTfC8xxvBy+qlzG9t6h5FuSAOmLYQMA7BPfSsyT3neWE/zJkPhJ8XCWyb
 Vf0I29FAkJ1GB2nN7tjXSYKhgzy6PRLHgB12YI2A6dgxz7cvr9Q+Oj/hHuDbq3gAlHY5
 Xp1LPTssAMbiHqmOk2LA7E7w2s2c7lW8K8kTXEuBjTkVdVOZ1bHWwJMj0VmmdmHzV50d
 Xu8z5Pa19udGhsjUVsdJfdJ8nRRVJUWIbqaw8M4fwEg+7Wwce6V8NFMbPRB7HGPF2wx/
 KM2Q==
X-Gm-Message-State: APjAAAV+UcUfvwoLnD5jd5MZmHimPatOG0W4kfDWFVgY5x7iVJ/HNuKO
 SwNCERIiC3Q8ipaP2VvDXAf5vUav
X-Google-Smtp-Source: APXvYqxlE2kvb1fbewJM4/J8bUUsnVZCt4DWJM9fYUSVQYJ4GNec2MJudDeYYg8gp/yyQ1CrwwS/og==
X-Received: by 2002:adf:fc08:: with SMTP id i8mr34196wrr.82.1575307790205;
 Mon, 02 Dec 2019 09:29:50 -0800 (PST)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id r63sm438800wma.2.2019.12.02.09.29.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 09:29:49 -0800 (PST)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: remove no longer used .master_{create, destroy} callbacks
Date: Mon,  2 Dec 2019 17:28:53 +0000
Message-Id: <20191202172853.19569-1-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q6xOsIVEpmTEM/MXwaq1zb46mExyiH314du/gb6pfek=;
 b=FEHDqWzTPCbk3OqStoWev/OQw6Qh7gm5/wP0r/2MwdI2VaaA9UB1nBGdxmzd99c1ll
 6H3C3stmG0ZrwcskbetfGySFsROrRr9RSNqJUoop4CwgvT7PTmy8LsYKnJDEAfutW1QK
 9JGv2h5o0my895LcyCa9Xzfty/kgeLv0l9MBaJ14s9/x8uk+uNSfo3I9pGyBCJ5T/EYa
 R477afg4C9aAAB8ZQ/TDCeEjqMQ8cPPawEmdKsRnpDZGzUzvBeKGWKwjDKcijK/LSms3
 7uYW3rwb8k6AXL+CCY/b18W9sjEiGbMVFFDcRkHuK233NRjd+cWyuPjFS7KhwY9nxwET
 2TiQ==
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Hellstrom <thellstrom@vmware.com>, emil.l.velikov@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KClVwLXRvIHJl
Y2VudGx5IHRoZSBvbmx5IGRyaXZlciB3aGljaCByZXF1aXJlZCB0aGVzZSB3YXMgdm13Z2Z4LgoK
V2l0aCBjb21taXQgOWM4NGFlYmE2N2NjICgiZHJtL3Ztd2dmeDogS2lsbCB1bm5lZWRlZCBsZWdh
Y3kgc2VjdXJpdHkKZmVhdHVyZXMiKSB0aGUgZHJpdmVyIG5vIGxvbmdlciBzZXRzIHRoZW0sIHNv
IHdlIGNhbiBkcm9wIHRoZSB1bnVzZWQKaW5mcmEuCgpDYzogVGhvbWFzIEhlbGxzdHJvbSA8dGhl
bGxzdHJvbUB2bXdhcmUuY29tPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZnds
bC5jaD4KU2lnbmVkLW9mZi1ieTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3Jh
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2F1dGguYyB8ICA4IC0tLS0tLS0tCiBpbmNs
dWRlL2RybS9kcm1fZHJ2LmggICAgICB8IDE0IC0tLS0tLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5n
ZWQsIDIyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXV0
aC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9hdXRoLmMKaW5kZXggY2M5YWNkOTg2YzY4Li41MzFi
ODc2ZDBlZDggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXV0aC5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fYXV0aC5jCkBAIC0xNTMsMTEgKzE1Myw2IEBAIHN0YXRpYyBpbnQg
ZHJtX25ld19zZXRfbWFzdGVyKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1fZmls
ZSAqZnByaXYpCiAJCXJldHVybiAtRU5PTUVNOwogCX0KIAotCWlmIChkZXYtPmRyaXZlci0+bWFz
dGVyX2NyZWF0ZSkgewotCQlyZXQgPSBkZXYtPmRyaXZlci0+bWFzdGVyX2NyZWF0ZShkZXYsIGZw
cml2LT5tYXN0ZXIpOwotCQlpZiAocmV0KQotCQkJZ290byBvdXRfZXJyOwotCX0KIAlmcHJpdi0+
aXNfbWFzdGVyID0gMTsKIAlmcHJpdi0+YXV0aGVudGljYXRlZCA9IDE7CiAKQEAgLTMzMiw5ICsz
MjcsNiBAQCBzdGF0aWMgdm9pZCBkcm1fbWFzdGVyX2Rlc3Ryb3koc3RydWN0IGtyZWYgKmtyZWYp
CiAJaWYgKGRybV9jb3JlX2NoZWNrX2ZlYXR1cmUoZGV2LCBEUklWRVJfTU9ERVNFVCkpCiAJCWRy
bV9sZWFzZV9kZXN0cm95KG1hc3Rlcik7CiAKLQlpZiAoZGV2LT5kcml2ZXItPm1hc3Rlcl9kZXN0
cm95KQotCQlkZXYtPmRyaXZlci0+bWFzdGVyX2Rlc3Ryb3koZGV2LCBtYXN0ZXIpOwotCiAJZHJt
X2xlZ2FjeV9tYXN0ZXJfcm1tYXBzKGRldiwgbWFzdGVyKTsKIAogCWlkcl9kZXN0cm95KCZtYXN0
ZXItPm1hZ2ljX21hcCk7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZHJ2LmggYi9pbmNs
dWRlL2RybS9kcm1fZHJ2LmgKaW5kZXggY2YxMzQ3MDgxMGE1Li40MzAwZTg1ZGI0NTcgMTAwNjQ0
Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9kcnYuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fZHJ2LmgK
QEAgLTQ1NywyMCArNDU3LDYgQEAgc3RydWN0IGRybV9kcml2ZXIgewogCSAqLwogCXZvaWQgKCpp
cnFfdW5pbnN0YWxsKSAoc3RydWN0IGRybV9kZXZpY2UgKmRldik7CiAKLQkvKioKLQkgKiBAbWFz
dGVyX2NyZWF0ZToKLQkgKgotCSAqIENhbGxlZCB3aGVuZXZlciBhIG5ldyBtYXN0ZXIgaXMgY3Jl
YXRlZC4gT25seSB1c2VkIGJ5IHZtd2dmeC4KLQkgKi8KLQlpbnQgKCptYXN0ZXJfY3JlYXRlKShz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QgZHJtX21hc3RlciAqbWFzdGVyKTsKLQotCS8q
KgotCSAqIEBtYXN0ZXJfZGVzdHJveToKLQkgKgotCSAqIENhbGxlZCB3aGVuZXZlciBhIG1hc3Rl
ciBpcyBkZXN0cm95ZWQuIE9ubHkgdXNlZCBieSB2bXdnZnguCi0JICovCi0Jdm9pZCAoKm1hc3Rl
cl9kZXN0cm95KShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QgZHJtX21hc3RlciAqbWFz
dGVyKTsKLQogCS8qKgogCSAqIEBtYXN0ZXJfc2V0OgogCSAqCi0tIAoyLjIzLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
