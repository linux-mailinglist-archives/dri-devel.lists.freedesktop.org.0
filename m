Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE2174839
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 09:30:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F8246E67B;
	Thu, 25 Jul 2019 07:30:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 886FF89B03;
 Thu, 25 Jul 2019 03:36:56 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id i18so22258290pgl.11;
 Wed, 24 Jul 2019 20:36:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=y5mWEC7ogDY2PSdGXYMgqGEgddaBMGRrx0o4VSfwM/o=;
 b=Dpc2/Gn1x9LWmKdCvXKu2r4WNI7Bh24fXIt9av0YSEvr9+KUEWGzk0Rkg2qvoC1K34
 Xpg0rF5H9mzGiR2LqpZ16lRHcPPjzzpSEUf68+kfvj3vHKLm2vdAQSfumkeKHekx1xcw
 mQsVB4ZQs79RPtgG/jrOR4M0OzphA9NUw81tTSGufJlwVj527hDuoCwskMLdlL7q6b7q
 4pKjA2Q+ArcJ/iYeL0azhlxUmnjniurkerwmtT9qfKzsNaEVF4/uK3gr9foEVsEuTuuC
 Kmr0+/iiAeaoJTzSQRzjbuuEbieEVu4vdIn6S3oIA+jfq4349Z4ut1fTIi4QJ5Tb9IIU
 XPzw==
X-Gm-Message-State: APjAAAXgKpKik+UQAe0Umck/wZFS3MTKzVmh6IwBg+T3vYuw8MExMTNY
 6sddk9pIaC1ExiPqO9d2p+G88b9O
X-Google-Smtp-Source: APXvYqwXGIrEshHJ/620ZjKabG/Vz5HjLWHyUhFB8umegovRT8FYTgXZAD3421HaW/F6oWwFLORuZQ==
X-Received: by 2002:a63:520f:: with SMTP id g15mr80162152pgb.28.1564025816100; 
 Wed, 24 Jul 2019 20:36:56 -0700 (PDT)
Received: from huyue2.ccdomain.com ([218.189.10.173])
 by smtp.gmail.com with ESMTPSA id a1sm2056528pgh.61.2019.07.24.20.36.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Jul 2019 20:36:55 -0700 (PDT)
From: Yue Hu <zbestahu@gmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, robdclark@gmail.com, sean@poorly.run,
 robh@kernel.org, tomeu.vizoso@collabora.com
Subject: [PATCH] drm: Switch to use DEVFREQ_GOV_SIMPLE_ONDEMAND constant
Date: Thu, 25 Jul 2019 11:36:15 +0800
Message-Id: <20190725033615.11388-1-zbestahu@gmail.com>
X-Mailer: git-send-email 2.17.1.windows.2
X-Mailman-Approved-At: Thu, 25 Jul 2019 07:29:33 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=y5mWEC7ogDY2PSdGXYMgqGEgddaBMGRrx0o4VSfwM/o=;
 b=RcA73rrAO55/gHOoxqi1LmtF8yacHdzQxlT+GcVs1ZywSerBvoobvmtsYWDMQHbJg1
 Skf0DzxVYolaM3PcWKODtiF2pShPT38EAc0cbTX/n/Xi/r3ChwvPW/RYHO4/I36MuuWJ
 F7KJEG8l/9Sn+2txeQX6frkSvWrX/kRnqW9BdGJN0M0tRDW2CVW+KxcBzO8O69NIepCb
 aRw4QlDfGH3z7kjFOuuNQaQVwAPyORRPJ+Pp49zt7qvIscVkTSapPOE9wL1jjXkuWSdI
 Js48Fx9ID+B8NYSy90cPWyoUyJvkAeba+FhJZI1Zy0M3yL5/2IuINFVuYn3R56eSbtPx
 YbfA==
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
Cc: linux-arm-msm@vger.kernel.org, huyue2@yulong.com,
 freedreno@lists.freedesktop.org, zhangwen@yulong.com,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWXVlIEh1IDxodXl1ZTJAeXVsb25nLmNvbT4KClNpbmNlIGdvdmVybm9yIG5hbWUgaXMg
ZGVmaW5lZCBieSBERVZGUkVRIGZyYW1ld29yayBpbnRlcm5hbGx5LCB1c2UgdGhlCm1hY3JvIGRl
ZmluaXRpb24gaW5zdGVhZCBvZiB1c2luZyB0aGUgbmFtZSBkaXJlY3RseS4KClNpZ25lZC1vZmYt
Ynk6IFl1ZSBIdSA8aHV5dWUyQHl1bG9uZy5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9t
c21fZ3B1LmMgICAgICAgICAgICAgICB8IDMgKystCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3Qv
cGFuZnJvc3RfZGV2ZnJlcS5jIHwgMyArKy0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNt
X2dwdS5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ3B1LmMKaW5kZXggNGVkYjg3NC4uZjcz
MDhkNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ3B1LmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL21zbS9tc21fZ3B1LmMKQEAgLTk1LDcgKzk1LDggQEAgc3RhdGljIHZvaWQg
bXNtX2RldmZyZXFfaW5pdChzdHJ1Y3QgbXNtX2dwdSAqZ3B1KQogCSAqLwogCiAJZ3B1LT5kZXZm
cmVxLmRldmZyZXEgPSBkZXZtX2RldmZyZXFfYWRkX2RldmljZSgmZ3B1LT5wZGV2LT5kZXYsCi0J
CQkmbXNtX2RldmZyZXFfcHJvZmlsZSwgInNpbXBsZV9vbmRlbWFuZCIsIE5VTEwpOworCQkJJm1z
bV9kZXZmcmVxX3Byb2ZpbGUsIERFVkZSRVFfR09WX1NJTVBMRV9PTkRFTUFORCwKKwkJCU5VTEwp
OwogCiAJaWYgKElTX0VSUihncHUtPmRldmZyZXEuZGV2ZnJlcSkpIHsKIAkJRFJNX0RFVl9FUlJP
UigmZ3B1LT5wZGV2LT5kZXYsICJDb3VsZG4ndCBpbml0aWFsaXplIEdQVSBkZXZmcmVxXG4iKTsK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jCmluZGV4IGRiNzk4
NTMuLmE3YzE4YmMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9z
dF9kZXZmcmVxLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZy
ZXEuYwpAQCAtMTU3LDcgKzE1Nyw4IEBAIGludCBwYW5mcm9zdF9kZXZmcmVxX2luaXQoc3RydWN0
IHBhbmZyb3N0X2RldmljZSAqcGZkZXYpCiAJZGV2X3BtX29wcF9wdXQob3BwKTsKIAogCXBmZGV2
LT5kZXZmcmVxLmRldmZyZXEgPSBkZXZtX2RldmZyZXFfYWRkX2RldmljZSgmcGZkZXYtPnBkZXYt
PmRldiwKLQkJCSZwYW5mcm9zdF9kZXZmcmVxX3Byb2ZpbGUsICJzaW1wbGVfb25kZW1hbmQiLCBO
VUxMKTsKKwkJCSZwYW5mcm9zdF9kZXZmcmVxX3Byb2ZpbGUsIERFVkZSRVFfR09WX1NJTVBMRV9P
TkRFTUFORCwKKwkJCU5VTEwpOwogCWlmIChJU19FUlIocGZkZXYtPmRldmZyZXEuZGV2ZnJlcSkp
IHsKIAkJRFJNX0RFVl9FUlJPUigmcGZkZXYtPnBkZXYtPmRldiwgIkNvdWxkbid0IGluaXRpYWxp
emUgR1BVIGRldmZyZXFcbiIpOwogCQlyZXQgPSBQVFJfRVJSKHBmZGV2LT5kZXZmcmVxLmRldmZy
ZXEpOwotLSAKMS45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
