Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 127C12ADF6A
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 20:31:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39AA189C03;
	Tue, 10 Nov 2020 19:31:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C422C89BF1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 19:31:27 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id d142so4344831wmd.4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 11:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WSjLdlLWJSq+5kS7GDyIv4rvxAPSqu/8nkKg/bHUTUY=;
 b=wZeGjKIorbPA0c0PrlnhLlnJk1itC4n0nTzOcbguHLU7XW0VZKuUzrj6ysHsa+HgNf
 w80Z4ZeECtO1M3dSL3w3Km0+DR8inGbS+ShcfNMffu1CCsTlpt6i1jnIPaOWiagzdSsF
 KB/Qkz60IzImuWaMW9jQO2moRwFqPcXUHZALrSO8+nwWhPW4OLj9h32zxfuCObMGF9Y9
 BSaHqq6YxNO/GPXJY9vH4OokQ4Tsg4I5CXONrwyGmojixpVvyZaWI1FfECBoomawAlB3
 ERQO8NE4MsR79/f7r0YqSxeqgu1rnXeqaWlkb7gxWwisrbJppmH2hD7OItJ6C9wbbQk0
 QpiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WSjLdlLWJSq+5kS7GDyIv4rvxAPSqu/8nkKg/bHUTUY=;
 b=tnu+BJ+z+IHgmLt3odfn1nZmucCFodvZIt7YGi6FDj0U6RH/obHEzfJewC1M+psgLC
 5IUHmaiNfi2QLSDS9WFliGB9dXMPn0hftMSM0HN8F6W/T1qgshTVnMzXFErjSx96fWZ6
 6psZByX+7Pyxl9PxHylR0iz0V7BIr5HB91aoZVUSkiChi3DUpHlwxuU3R+Z6HjwxDO23
 TjhyTSslYzioVJb91tREqxncV3NInK5ArFKrJZygLwN+zY691GeuMoyguwMx3vqgryi2
 H4Zns74QMsB7JcgYuQzI/6Tin575liTuERZUiv9tJ1Eh7VGY2+bHrE2FKWcfryZ5YhCF
 KLig==
X-Gm-Message-State: AOAM532nDC7QmuMFQI/ieOIOA36fPl7Ii+wGNA8KcmG1Z/yPu6Djkb8v
 PuxHT6oH4oqqH5+8NOy2Pg1rYw==
X-Google-Smtp-Source: ABdhPJy8WfbcOgUKu6Mr5z7B464nWgTV0uVrAjvMbugVW8Im4qbasXQpfUC+3jFMjGemwfCn1sfFyw==
X-Received: by 2002:a1c:448:: with SMTP id 69mr736733wme.12.1605036686390;
 Tue, 10 Nov 2020 11:31:26 -0800 (PST)
Received: from dell.default ([91.110.221.139])
 by smtp.gmail.com with ESMTPSA id 30sm17635335wrs.84.2020.11.10.11.31.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 11:31:25 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 08/30] drm/radeon/ci_dpm: Remove set but unused variable
 'dpm_event_src'
Date: Tue, 10 Nov 2020 19:30:50 +0000
Message-Id: <20201110193112.988999-9-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201110193112.988999-1-lee.jones@linaro.org>
References: <20201110193112.988999-1-lee.jones@linaro.org>
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
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW5kIHRoZSBwaWVjZSBvZiBjb2RlIHRoYXQgaGFzIG5ldmVyIGJlZW4gZXhlY3V0ZWQuCgpGaXhl
cyB0aGUgZm9sbG93aW5nIFc9MSBrZXJuZWwgYnVpbGQgd2FybmluZyhzKToKCiBkcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL2NpX2RwbS5jOiBJbiBmdW5jdGlvbiDigJhjaV9zZXRfZHBtX2V2ZW50X3Nv
dXJjZXPigJk6CiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2NpX2RwbS5jOjEzNjk6Mjg6IHdhcm5p
bmc6IHZhcmlhYmxlIOKAmGRwbV9ldmVudF9zcmPigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVz
ZWQtYnV0LXNldC12YXJpYWJsZV0KCkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIg
PGRhbmllbEBmZndsbC5jaD4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8
bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jaV9kcG0u
YyB8IDEyIC0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEyIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lfZHBtLmMgYi9kcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL2NpX2RwbS5jCmluZGV4IDg4NmU5OTU5NDk2ZmUuLjgzMjRhY2E1ZmQwMDYgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lfZHBtLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL3JhZGVvbi9jaV9kcG0uYwpAQCAtMTM2Niw3ICsxMzY2LDYgQEAgc3RhdGljIHZvaWQg
Y2lfc2V0X2RwbV9ldmVudF9zb3VyY2VzKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LCB1MzIg
c291cmNlcykKIHsKIAlzdHJ1Y3QgY2lfcG93ZXJfaW5mbyAqcGkgPSBjaV9nZXRfcGkocmRldik7
CiAJYm9vbCB3YW50X3RoZXJtYWxfcHJvdGVjdGlvbjsKLQllbnVtIHJhZGVvbl9kcG1fZXZlbnRf
c3JjIGRwbV9ldmVudF9zcmM7CiAJdTMyIHRtcDsKIAogCXN3aXRjaCAoc291cmNlcykgewpAQCAt
MTM3NiwyOCArMTM3NSwxNyBAQCBzdGF0aWMgdm9pZCBjaV9zZXRfZHBtX2V2ZW50X3NvdXJjZXMo
c3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsIHUzMiBzb3VyY2VzKQogCQlicmVhazsKIAljYXNl
ICgxIDw8IFJBREVPTl9EUE1fQVVUT19USFJPVFRMRV9TUkNfVEhFUk1BTCk6CiAJCXdhbnRfdGhl
cm1hbF9wcm90ZWN0aW9uID0gdHJ1ZTsKLQkJZHBtX2V2ZW50X3NyYyA9IFJBREVPTl9EUE1fRVZF
TlRfU1JDX0RJR0lUQUw7CiAJCWJyZWFrOwogCWNhc2UgKDEgPDwgUkFERU9OX0RQTV9BVVRPX1RI
Uk9UVExFX1NSQ19FWFRFUk5BTCk6CiAJCXdhbnRfdGhlcm1hbF9wcm90ZWN0aW9uID0gdHJ1ZTsK
LQkJZHBtX2V2ZW50X3NyYyA9IFJBREVPTl9EUE1fRVZFTlRfU1JDX0VYVEVSTkFMOwogCQlicmVh
azsKIAljYXNlICgoMSA8PCBSQURFT05fRFBNX0FVVE9fVEhST1RUTEVfU1JDX0VYVEVSTkFMKSB8
CiAJICAgICAgKDEgPDwgUkFERU9OX0RQTV9BVVRPX1RIUk9UVExFX1NSQ19USEVSTUFMKSk6CiAJ
CXdhbnRfdGhlcm1hbF9wcm90ZWN0aW9uID0gdHJ1ZTsKLQkJZHBtX2V2ZW50X3NyYyA9IFJBREVP
Tl9EUE1fRVZFTlRfU1JDX0RJR0lBTF9PUl9FWFRFUk5BTDsKIAkJYnJlYWs7CiAJfQogCiAJaWYg
KHdhbnRfdGhlcm1hbF9wcm90ZWN0aW9uKSB7Ci0jaWYgMAotCQkvKiBYWFg6IG5lZWQgdG8gZmln
dXJlIG91dCBob3cgdG8gaGFuZGxlIHRoaXMgcHJvcGVybHkgKi8KLQkJdG1wID0gUlJFRzMyX1NN
QyhDR19USEVSTUFMX0NUUkwpOwotCQl0bXAgJj0gRFBNX0VWRU5UX1NSQ19NQVNLOwotCQl0bXAg
fD0gRFBNX0VWRU5UX1NSQyhkcG1fZXZlbnRfc3JjKTsKLQkJV1JFRzMyX1NNQyhDR19USEVSTUFM
X0NUUkwsIHRtcCk7Ci0jZW5kaWYKLQogCQl0bXAgPSBSUkVHMzJfU01DKEdFTkVSQUxfUFdSTUdU
KTsKIAkJaWYgKHBpLT50aGVybWFsX3Byb3RlY3Rpb24pCiAJCQl0bXAgJj0gflRIRVJNQUxfUFJP
VEVDVElPTl9ESVM7Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
