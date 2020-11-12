Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FE22B0D15
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 20:00:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A065A6E314;
	Thu, 12 Nov 2020 19:00:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D32596E32A
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 19:00:47 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id b6so7165153wrt.4
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 11:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GyM5JNiQS/TCpKPZ3DWBp4SZS9wc27h4cJ1y7RFnvhI=;
 b=lIeJaH1sJ0c1LM26yrpDKAxEDYUbG4Qz2oeYJNpP6jReLdw9bluHNlUYAurtH3+wsq
 NNLobHm0u3kMZifdyt7HVxNMh8ClFEpk7lZdlMqhV4NsDXQp+aMYGZvvAUCv88iApJRZ
 zPXG2q0tNCfjV65gUknv9dKZnvakZ8LZ1wZkIPd9xKW7yER+zLd4QsQXkjuBzEZhAxxJ
 Wd2LU2rsnVOericwQUFs5I8hMGbi4uT29ojkij6DG1ECBTuIC7g8iP5+sZfK2hN7iYoU
 F3VaOJhuXUHVIIIBlpBi3UdK0haK9+clEPTrM/j6F7oR2Nk9A81IgWvpeUXtJSoE+Sjc
 V0Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GyM5JNiQS/TCpKPZ3DWBp4SZS9wc27h4cJ1y7RFnvhI=;
 b=tb8DFm01U7Kl11td/C7n4IvUZQFAm9+PcPwEMXfRmAeRzk9u35LzDke1VTcYq4JJfk
 9UC2MKiT7gwfWLqTlThoU0pA83jqOw7Epp8A3Q/E8SAtF5Iqxr+1u9gDRMb+kkAWNBNU
 JCBxFC1s3GA4mod50285kX+cmC3rMB4ldvBrZQTIMoJ8BZ5AJsWrQDEPl3dDaIdFfrsm
 nV4ain6ZlxPBZ/bHABsPTET5ztuquWj4+Lb+4BjLjRgxg7X27Y27Aan3oArVIvziNQ2N
 IIahWX4RDWVb5/lSXO+LzXDt0DAdOy2Z0ZC+v7mRaTsPxn+4O5BDRnPIB99NY8EoMnXH
 u9TQ==
X-Gm-Message-State: AOAM533L5QbOjkVZLuqwv5VBMLtvb6fAQ/odFzFuFKcfVvNE2T8bxsx8
 mOg1pey9WRHIZ6Y/xPGlYnqZ0xJWULzpNk5k
X-Google-Smtp-Source: ABdhPJwSRZIkH2Y83W1FBYnIo2XNuRGD8z4oivnX35wQOzKxv1BtQkwajygZFWf5i4ucEUmssSFqgg==
X-Received: by 2002:a5d:6550:: with SMTP id z16mr1117972wrv.266.1605207646576; 
 Thu, 12 Nov 2020 11:00:46 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id p4sm8105214wrm.51.2020.11.12.11.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 11:00:45 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 02/30] include: drm: drm_atomic: Artificially use 'crtc' to
 avoid 'not used' warning
Date: Thu, 12 Nov 2020 19:00:11 +0000
Message-Id: <20201112190039.2785914-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112190039.2785914-1-lee.jones@linaro.org>
References: <20201112190039.2785914-1-lee.jones@linaro.org>
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
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHByZWNlZGVudCBoYXMgYWxyZWFkeSBiZWVuIHNldCBieSBvdGhlciBtYWNyb3MgaW4gdGhl
IHNhbWUgZmlsZS4KCkZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5n
KHMpOgoKIGRyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfZHJ2LmM6NTU6MTk6IHdhcm5pbmc6IHZh
cmlhYmxlIOKAmGNydGPigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJp
YWJsZV0KIDU1IHwgc3RydWN0IGRybV9jcnRjICpjcnRjOwogfCBefn5+CgpDYzogTWFhcnRlbiBM
YW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KQ2M6IE1heGltZSBS
aXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4KQ2M6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVy
bWFubkBzdXNlLmRlPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFu
aWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21h
aWwuY29tPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5
OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGluY2x1ZGUvZHJtL2RybV9h
dG9taWMuaCB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9kcm0vZHJtX2F0b21pYy5oIGIvaW5jbHVkZS9kcm0vZHJtX2F0b21pYy5oCmlu
ZGV4IDQxM2ZkMGNhNTZhOGYuLmRjNWUwZmJlY2MwNGUgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJt
L2RybV9hdG9taWMuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fYXRvbWljLmgKQEAgLTgwMiw2ICs4
MDIsNyBAQCB2b2lkIGRybV9zdGF0ZV9kdW1wKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVj
dCBkcm1fcHJpbnRlciAqcCk7CiAJICAgICAoX19pKSsrKQkJCQkJCQlcCiAJCWZvcl9lYWNoX2lm
ICgoX19zdGF0ZSktPmNydGNzW19faV0ucHRyICYmCQlcCiAJCQkgICAgICgoY3J0YykgPSAoX19z
dGF0ZSktPmNydGNzW19faV0ucHRyLAlcCisJCQkgICAgICh2b2lkKShjcnRjKSAvKiBPbmx5IHRv
IGF2b2lkIHVudXNlZC1idXQtc2V0LXZhcmlhYmxlIHdhcm5pbmcgKi8sIFwKIAkJCSAgICAgKG9s
ZF9jcnRjX3N0YXRlKSA9IChfX3N0YXRlKS0+Y3J0Y3NbX19pXS5vbGRfc3RhdGUsIDEpKQogCiAv
KioKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
