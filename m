Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB192DCE7
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 14:27:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B55346E2F7;
	Wed, 29 May 2019 12:27:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56B826E2F0;
 Wed, 29 May 2019 12:27:11 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id v19so4213366wmh.0;
 Wed, 29 May 2019 05:27:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YJzhai3PQwFiCbDiZqWZesjGuFiQnFuaURwSa6r13aE=;
 b=EnOPh8bZlVSzbVQU2G99+RKdLXO6JRf64Dqogoyhi8+mxUH/dpIuImJqPBt66c+SKg
 ymauNsqGA6mMEzDRQTStzmXLwvYAfEwK+UAbEsRUYdDLXJDEvjzldw7Sq3rqprrqA2rn
 iKB1pYoUG8sq9pd0FL5kzWFBDC7rlFTIRBZnxWX4JPkBdkhqmSO0D0k1Y2S2pcdjhDGJ
 uKhnVCg6N8HWqce1t6HFCDJKjJZ6ruUDV7dfMqk02j4zdCweBgzur1wufSe0wJDJ36/3
 CcZXqUTwWfwzIBPALCDTbdwUN6UroUwMIVc51Q5aiEGzEXAD4S6kxPGQrt4acsrH60EM
 3mNA==
X-Gm-Message-State: APjAAAUA+QxQHK/C+p+btUuBxQav06bNViV2nVW32bl1fHsGL5McyFra
 LtHFaXxNmZlUT3p7g49fmW2rChG4
X-Google-Smtp-Source: APXvYqxK+/Dr3bSnKJgu4XAODNA/OOBjjGh/Y3N1JAaTHsZ8HINejxTvB5ixAd7GEF13ZL9qYVP9mg==
X-Received: by 2002:a7b:c20b:: with SMTP id x11mr1662921wmi.8.1559132829573;
 Wed, 29 May 2019 05:27:09 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:1ea:e785:ab1c:e514])
 by smtp.gmail.com with ESMTPSA id z25sm6211343wmi.5.2019.05.29.05.27.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 May 2019 05:27:08 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 08/10] drm/amdgpu: drop some validation failure messages
Date: Wed, 29 May 2019 14:27:00 +0200
Message-Id: <20190529122702.13035-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190529122702.13035-1-christian.koenig@amd.com>
References: <20190529122702.13035-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=YJzhai3PQwFiCbDiZqWZesjGuFiQnFuaURwSa6r13aE=;
 b=RyHYUuHJ8U4kFlgF7Z4cmR/cMtTW2M7qM5Fsams4EUH65h/AapVpn4qKDd/QbBmGrt
 BiuFLVJHrokIp/RxqGRpbvJHGu9FmvInzRukSaqVjieVwO/ZM2lWKPRk55OJutEQ+6o4
 YD9JRkXEsOmRs8jbjXpP29tcr2Owri1eBiSbuGYn6jr7a8u/GMqmjULlXLGugX9zkamX
 RnFaKwm8dvvjgzJk24vFXROvxd73Zw+L/RT77is9kknnq6QQKG8v3qfL4iikGzNbm2Vd
 gvdXJozIAG1zQD5QoAxbewuxL9FqsaWSIcETRP9DFLbahFPQii/2cDg62ewTnAPidbD9
 SWyQ==
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
