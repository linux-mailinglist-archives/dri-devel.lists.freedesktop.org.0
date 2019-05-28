Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2B72CBDA
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 18:26:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFAB26E249;
	Tue, 28 May 2019 16:26:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A50E6E22E;
 Tue, 28 May 2019 16:26:07 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id w13so12566695wru.11;
 Tue, 28 May 2019 09:26:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YJzhai3PQwFiCbDiZqWZesjGuFiQnFuaURwSa6r13aE=;
 b=sE2916QOnb1XRxV1FVSBaGcuOlLHQGRNlygDVypKKNit6o7n0ty957l2qKQ1YD36e7
 fzM+s7pSgzhE8KRu/jfrH9Vi7q6NisG8g09mfWTzDqFshK5r2MSao665Vt1DLBt3pC4p
 2Wo9/sSa961qOwSqTprVnpCbUNfP8eOKteGrrkvCCh42vuvLfBgC++dpDogM8nNZndSy
 41UO6LtOdl+1a1Mrm1G7FW+rW0fnqwWrzyxlxh5f+JwckV5CBFCmCN9JegSg/yvO70QF
 3PWhGBDNQpRuVozUBYcR3DpkPhrsD/JjBLfYB/FrQc9AOjublYvqqmzNF5NdSbho6APx
 PDQg==
X-Gm-Message-State: APjAAAWjo5ay19iP6fe8HlX3ogDo/wzWd5jFbZC0a8DISnRmzEU1Gv2P
 1V8ZD+JM6anduGcFvvq2vz0Xtva2
X-Google-Smtp-Source: APXvYqw5u9OOw5eCd2HQZ8rCbZ2SfXxcBkWxr6w+HBExm8Vts4P3GnnIxrqFkPTJrlMkgImB1ctiyQ==
X-Received: by 2002:adf:f70f:: with SMTP id r15mr2218423wrp.325.1559060766163; 
 Tue, 28 May 2019 09:26:06 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:3163:ab92:73d9:6693])
 by smtp.gmail.com with ESMTPSA id f10sm28835470wrg.24.2019.05.28.09.26.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 May 2019 09:26:05 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: David1.Zhou@amd.com, Marek.Olsak@amd.com, Prike.Liang@amd.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 08/10] drm/amdgpu: drop some validation failure messages
Date: Tue, 28 May 2019 18:25:55 +0200
Message-Id: <20190528162557.1280-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190528162557.1280-1-christian.koenig@amd.com>
References: <20190528162557.1280-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=YJzhai3PQwFiCbDiZqWZesjGuFiQnFuaURwSa6r13aE=;
 b=sMWmESUJVm+LhnKQT7+72aDQaOkPJS5UKoUeouU7kI9HEV3TI40WyXp8KPmUuz3zk6
 MU/kbS0h4YNxfTdb3OkBh8gtkykanDBxMvOMHWGHmQIhsNsGJFJWP8EEGG6OaNt4ToMp
 ynph3gvW5wU0WxtOp/qGGeOZwq1HTVq+DpxT/vAeM91jLs3etvcxG8Am8VmGR32lbrxJ
 eAPlhYkwAej1q8i4lb4TAIgRi8NgM7xzHKxCmy4YmQXJr2cwGIeh1djDcilr52auuKYE
 Vy7XTANkLOHBMHo9hl2un/GiQdzTsm1UVsP1eG/zDLIeExQgBAgGcCugBrx5h9vque8g
 7enA==
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
