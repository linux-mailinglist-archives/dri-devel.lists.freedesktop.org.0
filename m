Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0E62642F
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 15:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ECB189A44;
	Wed, 22 May 2019 13:00:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9234899B7;
 Wed, 22 May 2019 12:59:56 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 7so2122041wmo.2;
 Wed, 22 May 2019 05:59:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YJzhai3PQwFiCbDiZqWZesjGuFiQnFuaURwSa6r13aE=;
 b=Pl34Dd0K9/9EdfoxuZOnnChLKflzuQOo2rrQ6yWCKjH/qK3Sgeb5OJMaFZJyJqMoMq
 S1grizOYDpL/8gc+wiLqan+iJcEwZHRNBG5Q6Jf5wRmDdL41bO3Zn2PTkSnBJ9+dya5q
 GN4xtuE83AIh4ggyjrttazKQehjyYRMG/luKvcKKleY2OPEU3lVK/obMUUxpdfpw0t+A
 oLq2ePLo20fcSX3IgzCjtQbgbqaLoAAGK1RbfzXFAOEeRiKYNJSZkLKOI8L3dHjnMp/t
 02MKWcbNBho8M8IJ1hqxF+Pn8Rm0fqAfrC3i76WepdFMW6gJiAnci7oTs+vbOKGXmr4J
 pMag==
X-Gm-Message-State: APjAAAVfqCnJokqgVXG6XcoImbH+1tbeVfoYtTlNm0LSA/eVoKs0aBvA
 oku0jamHCVgxGC1oebSY6im4p4lD
X-Google-Smtp-Source: APXvYqxeII5K/jVIYa6AME9kfcBjEQ9ZE45Jt9/RimvYO1dxNLDhI9FZy7gO8q6vKYFcAHn54mcJzA==
X-Received: by 2002:a1c:e718:: with SMTP id e24mr7527443wmh.27.1558529995543; 
 Wed, 22 May 2019 05:59:55 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:b94a:dfe1:fb43:c858])
 by smtp.gmail.com with ESMTPSA id 197sm9723523wma.36.2019.05.22.05.59.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 May 2019 05:59:55 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Marek.Olsak@amd.com, David1.Zhou@amd.com, Prike.Liang@amd.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 08/10] drm/amdgpu: drop some validation failure messages
Date: Wed, 22 May 2019 14:59:45 +0200
Message-Id: <20190522125947.4592-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190522125947.4592-1-christian.koenig@amd.com>
References: <20190522125947.4592-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=YJzhai3PQwFiCbDiZqWZesjGuFiQnFuaURwSa6r13aE=;
 b=e7lcwP0pKDeQ608Q3wXJoEmtCFBi0c/ZKnUur72VQo/Ja8u2/EfH3pphNuxsIf0emv
 pV518x5LaCWlbf8B/tXM77vkl/exykRiIOR5C1oCfSCl5ESIlENV4I7Ls01S1kHnMwVe
 2nOLrujNzsqGlbvSiYvQSQIgUPbylh2enfLnhiD7V7B5N9QT6k5sou8tyIMLAOLL1M5r
 bsstIyZU3niWO6wxJQaEX1K55YmbXfmanq6ghRm2yIigXgXlknJBg0VpYYUkMfKhXwin
 jKOFODcaUB650U3Th2rQT4ucnV782Mkxw1ZivFi8p0QhTNoYg/rT3iINyCqhpr7s6Qvj
 p4nw==
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

VGhlIG1lc3NhZ2VzIGFib3V0IGFtZGdwdV9jc19saXN0X3ZhbGlkYXRlIGFyZSBkdXBsaWNhdGVk
IGJlY2F1c2UgdGhlCmNhbGxlciB3aWxsIGNvbXBsYWluIGludG8gdGhlIGxvZ3MgYXMgd2VsbCBh
bmQgd2UgY2FuIGFsc28gZ2V0CmludGVycnVwdGVkIGJ5IGEgc2lnbmFsIGhlcmUuCgpBbHNvIGZp
eCB0aGUgdGhlIGNhbGxlciB0byBub3QgcmVwb3J0IC1FQUdBSU4gZnJvbSB2YWxpZGF0aW9uLgoK
U2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jIHwgMTAgKysrLS0t
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jCmluZGV4IGZmZjU1OGNmMzg1Yi4uMjBm
Mjk1NWQyYTU1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
Y3MuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYwpAQCAtNjcx
LDE2ICs2NzEsMTIgQEAgc3RhdGljIGludCBhbWRncHVfY3NfcGFyc2VyX2JvcyhzdHJ1Y3QgYW1k
Z3B1X2NzX3BhcnNlciAqcCwKIAl9CiAKIAlyID0gYW1kZ3B1X2NzX2xpc3RfdmFsaWRhdGUocCwg
JmR1cGxpY2F0ZXMpOwotCWlmIChyKSB7Ci0JCURSTV9FUlJPUigiYW1kZ3B1X2NzX2xpc3RfdmFs
aWRhdGUoZHVwbGljYXRlcykgZmFpbGVkLlxuIik7CisJaWYgKHIpCiAJCWdvdG8gZXJyb3JfdmFs
aWRhdGU7Ci0JfQogCiAJciA9IGFtZGdwdV9jc19saXN0X3ZhbGlkYXRlKHAsICZwLT52YWxpZGF0
ZWQpOwotCWlmIChyKSB7Ci0JCURSTV9FUlJPUigiYW1kZ3B1X2NzX2xpc3RfdmFsaWRhdGUodmFs
aWRhdGVkKSBmYWlsZWQuXG4iKTsKKwlpZiAocikKIAkJZ290byBlcnJvcl92YWxpZGF0ZTsKLQl9
CiAKIAlhbWRncHVfY3NfcmVwb3J0X21vdmVkX2J5dGVzKHAtPmFkZXYsIHAtPmJ5dGVzX21vdmVk
LAogCQkJCSAgICAgcC0+Ynl0ZXNfbW92ZWRfdmlzKTsKQEAgLTEzODMsNyArMTM3OSw3IEBAIGlu
dCBhbWRncHVfY3NfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwgc3Ry
dWN0IGRybV9maWxlICpmaWxwKQogCWlmIChyKSB7CiAJCWlmIChyID09IC1FTk9NRU0pCiAJCQlE
Uk1fRVJST1IoIk5vdCBlbm91Z2ggbWVtb3J5IGZvciBjb21tYW5kIHN1Ym1pc3Npb24hXG4iKTsK
LQkJZWxzZSBpZiAociAhPSAtRVJFU1RBUlRTWVMpCisJCWVsc2UgaWYgKHIgIT0gLUVSRVNUQVJU
U1lTICYmIHIgIT0gLUVBR0FJTikKIAkJCURSTV9FUlJPUigiRmFpbGVkIHRvIHByb2Nlc3MgdGhl
IGJ1ZmZlciBsaXN0ICVkIVxuIiwgcik7CiAJCWdvdG8gb3V0OwogCX0KLS0gCjIuMTcuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
