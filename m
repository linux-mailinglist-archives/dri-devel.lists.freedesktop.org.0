Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 516702C30E5
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 20:44:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD216E54C;
	Tue, 24 Nov 2020 19:44:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2FD76E54C
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 19:44:27 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id m6so23530500wrg.7
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 11:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GB6kY4upxQFv24rJ06X4HvdfBkp1xJnyjNfSH8+ifmU=;
 b=gYSO/nVmFciixTFJ8ZqVydxt3ETrnljhtml21uB6O8PC1QhgpWZ06dgSyH4KjrinuJ
 iDlUGLl+ysxrcvtrKWR8gHxcgxhwk792cp/ZUjMKxj88lWvnMA9mpfqh7e21oCtZnhsI
 xziWQg/ze7wmJg8oj2FustOlfqEuy3LxlDUk75pZx2jz7IgRDlQwfa/pUUtvkVOkK5Ei
 hUnmDpvxI8xt4AD4521/sTVwp3Ar2j9aOGeR/LQRrVO6PCcHejb5SGXlzyY4PuKDsJXQ
 YY/2k1rlA6BCsIialIdRJf1Ocac398uulw8nhlphGmB5WId/BPHtX0XafqS8z2W92uVY
 kCEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GB6kY4upxQFv24rJ06X4HvdfBkp1xJnyjNfSH8+ifmU=;
 b=TShugV1r6BXpyv20NAN4MWhNaETd3dWmeezHxcN4HgHhXcwDuSXBX36buARBfVDH81
 kayplgaL1snbeKwb3JhAYTyiTnBV2Qc01+yZJLXI2co8Ez3yh8+lCp5hRZn5AriT5/dd
 aqunVjKemTeN2UAgyzmdS5QypNB7UU0+4eBAryUQUnbS+fhsggq3dj2he1pJU2zorgQp
 kVIwZqYMD382HyxZ+F6U3OxG9TblZtFHMljK4/X+PPB4P0myMaRawgJRpwaFtg56MAGw
 gcq11hb+DeiDoYHHn4nUFA3TTIiEjnBz9S2xaEs1znQNBhXyU46S2u1drQDEOCiHAfea
 X7+Q==
X-Gm-Message-State: AOAM533edD0tnclptzU2UnuscBU3eG0KFWNpoV1cqxevNoSPk6YdkA2L
 EbquY4FIBlOo474mdmhDW4v+bQ==
X-Google-Smtp-Source: ABdhPJwiHOsXolfK7RoFeBDciBoIZeZ34wXHdP5DHmDy6yg7Zg4BiP+i4fA7AqCywCu48B/vP+y7JQ==
X-Received: by 2002:adf:f143:: with SMTP id y3mr112155wro.138.1606247066571;
 Tue, 24 Nov 2020 11:44:26 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id d134sm200511wmd.8.2020.11.24.11.44.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 11:44:25 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 22/40] drm/amd/amdgpu/amdgpu_uvd: Fix some function
 documentation headers
Date: Tue, 24 Nov 2020 19:38:06 +0000
Message-Id: <20201124193824.1118741-23-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201124193824.1118741-1-lee.jones@linaro.org>
References: <20201124193824.1118741-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3V2ZC5jOjk1OiB3YXJuaW5nOiBjYW5ub3QgdW5k
ZXJzdGFuZCBmdW5jdGlvbiBwcm90b3R5cGU6ICdzdHJ1Y3QgYW1kZ3B1X3V2ZF9jc19jdHggJwog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3V2ZC5jOjU1NTogd2FybmluZzogRnVu
Y3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnYWRldicgbm90IGRlc2NyaWJlZCBpbiAnYW1kZ3B1
X3V2ZF9jc19tc2dfZGVjb2RlJwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3V2
ZC5jOjEwMTI6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2liX2lkeCcg
bm90IGRlc2NyaWJlZCBpbiAnYW1kZ3B1X3V2ZF9yaW5nX3BhcnNlX2NzJwogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3V2ZC5jOjEyODY6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFt
ZXRlciBvciBtZW1iZXIgJ3RpbWVvdXQnIG5vdCBkZXNjcmliZWQgaW4gJ2FtZGdwdV91dmRfcmlu
Z190ZXN0X2liJwoKQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4K
Q2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2
aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZm
d2xsLmNoPgpDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KQ2M6IGFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbmFyby1tbS1zaWdA
bGlzdHMubGluYXJvLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91dmQuYyB8IDYg
KysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91dmQuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91dmQuYwppbmRleCBmOGJlYmYxOGVlMzYy
Li5mOGYwMzg0YThkOWFkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdXZkLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3V2ZC5j
CkBAIC04Nyw3ICs4Nyw3IEBACiAjZGVmaW5lIFVWRF9OT19PUAkJCQkweDAzZmYKICNkZWZpbmUg
VVZEX0JBU0VfU0kJCQkJMHgzODAwCiAKLS8qKgorLyoKICAqIGFtZGdwdV91dmRfY3NfY3R4IC0g
Q29tbWFuZCBzdWJtaXNzaW9uIHBhcnNlciBjb250ZXh0CiAgKgogICogVXNlZCBmb3IgZW11bGF0
aW5nIHZpcnR1YWwgbWVtb3J5IHN1cHBvcnQgb24gVVZEIDQuMi4KQEAgLTU0NSw4ICs1NDUsOCBA
QCBzdGF0aWMgaW50IGFtZGdwdV91dmRfY3NfcGFzczEoc3RydWN0IGFtZGdwdV91dmRfY3NfY3R4
ICpjdHgpCiAvKioKICAqIGFtZGdwdV91dmRfY3NfbXNnX2RlY29kZSAtIGhhbmRsZSBVVkQgZGVj
b2RlIG1lc3NhZ2UKICAqCisgKiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyCiAgKiBAbXNn
OiBwb2ludGVyIHRvIG1lc3NhZ2Ugc3RydWN0dXJlCi0gKiBAYnVmX3NpemVzOiByZXR1cm5lZCBi
dWZmZXIgc2l6ZXMKICAqCiAgKiBQZWVrIGludG8gdGhlIGRlY29kZSBtZXNzYWdlIGFuZCBjYWxj
dWxhdGUgdGhlIG5lY2Vzc2FyeSBidWZmZXIgc2l6ZXMuCiAgKi8KQEAgLTEwMDUsNiArMTAwNSw3
IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3V2ZF9jc19wYWNrZXRzKHN0cnVjdCBhbWRncHVfdXZkX2Nz
X2N0eCAqY3R4LAogICogYW1kZ3B1X3V2ZF9yaW5nX3BhcnNlX2NzIC0gVVZEIGNvbW1hbmQgc3Vi
bWlzc2lvbiBwYXJzZXIKICAqCiAgKiBAcGFyc2VyOiBDb21tYW5kIHN1Ym1pc3Npb24gcGFyc2Vy
IGNvbnRleHQKKyAqIEBpYl9pZHg6IFdoaWNoIGluZGlyZWN0IGJ1ZmZlciB0byB1c2UKICAqCiAg
KiBQYXJzZSB0aGUgY29tbWFuZCBzdHJlYW0sIHBhdGNoIGluIGFkZHJlc3NlcyBhcyBuZWNlc3Nh
cnkuCiAgKi8KQEAgLTEyNzksNiArMTI4MCw3IEBAIHZvaWQgYW1kZ3B1X3V2ZF9yaW5nX2VuZF91
c2Uoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nKQogICogYW1kZ3B1X3V2ZF9yaW5nX3Rlc3RfaWIg
LSB0ZXN0IGliIGV4ZWN1dGlvbgogICoKICAqIEByaW5nOiBhbWRncHVfcmluZyBwb2ludGVyCisg
KiBAdGltZW91dDogdGltZW91dCB2YWx1ZSBpbiBqaWZmaWVzLCBvciBNQVhfU0NIRURVTEVfVElN
RU9VVAogICoKICAqIFRlc3QgaWYgd2UgY2FuIHN1Y2Nlc3NmdWxseSBleGVjdXRlIGFuIElCCiAg
Ki8KLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
