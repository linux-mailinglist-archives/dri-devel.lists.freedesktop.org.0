Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2048314C73E
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2020 09:10:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 175536F47E;
	Wed, 29 Jan 2020 08:10:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B948F6F47E
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 08:10:22 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id t14so5298054wmi.5
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 00:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T3yYWFQgLZ8zja+P7hn9aOCYU3JxyWYtUmKXUyz25h4=;
 b=BDM/0ryTqQbq4r+p1tESfiNuF5Ul23IWHDRIVC0/lL6uKxXqScqMsAzPUvS85tnwf9
 bPVPyXE4fJqKBllsHyhvHu4ZXJ+9CKNRrPRliTQNK8wQsEymnXFAD8mzJ3VhGigz3Fdw
 BvwgVHVqBo2aSY1/7u86XK3E/E0ItwEn8Nc5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T3yYWFQgLZ8zja+P7hn9aOCYU3JxyWYtUmKXUyz25h4=;
 b=uUSxN0LRQjFWEI2C2K6L+aKZwRaqmdy/mudQhRgFjat4z4SlJBd2mP2LGYnKBHSVs0
 38If6erSl1eGr6YPqch+KER1AlIEGov/LaNFUD60sns315lkEE1WNrw8zUN7X4RE9pkV
 IcTd6IeqhmuAkcia6QiCj3swqb2HDBs5CbyYYqk072eR8j/izROqeNueHdflBd1LTzVd
 R39LFmmBtwl3HuuSaAY6vyM1kbjLNIzRL+QnPksD+FOG0Fy4xroxw/AyYFW5oK+oBDH7
 xdIgFPeIosd+saOxAdyyVdgNxfsJQcJUFeLt1RWbBm78Pakndz0PC15EL/1s6+vg7MU/
 W0Ug==
X-Gm-Message-State: APjAAAXykSpm/T4arKOCfHPvfy8zgPyccIOtwSN6Dqv5jal2nNmjI/oy
 uiNQopOVcDKRhqHi4YI6z8ZeCsjg6ytonQ==
X-Google-Smtp-Source: APXvYqzlSLlKy6w5rtyH6Q3vXq8arGTeKcI7HpbmcHdOPRPV+Ibg8lOUimVMGJ4xnXg9NO4bahVpOg==
X-Received: by 2002:a05:600c:214f:: with SMTP id
 v15mr10184100wml.110.1580285421098; 
 Wed, 29 Jan 2020 00:10:21 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e16sm1817552wrs.73.2020.01.29.00.10.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2020 00:10:20 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] radeon: completely remove lut leftovers
Date: Wed, 29 Jan 2020 09:09:05 +0100
Message-Id: <20200129080904.1637634-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@amd.com>,
 Peter Rosin <peda@axentia.se>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBpcyBhbiBvdmVyc2lnaHQgZnJvbQoKY29tbWl0IDQyNTg1Mzk1ZWJjMTAzNGE5ODkzNzcw
Mjg0OTY2OWYxN2VhZGIzNWYKQXV0aG9yOiBQZXRlciBSb3NpbiA8cGVkYUBheGVudGlhLnNlPgpE
YXRlOiAgIFRodSBKdWwgMTMgMTg6MjU6MzYgMjAxNyArMDIwMAoKICAgIGRybTogcmFkZW9uOiBy
ZW1vdmUgZGVhZCBjb2RlIGFuZCBwb2ludGxlc3MgbG9jYWwgbHV0IHN0b3JhZ2UKCnYyOiBBbHNv
IHJlbW92ZSBsZWZ0b3ZlciBsb2NhbCB2YXJpYWJsZS4KCkNjOiBQZXRlciBSb3NpbiA8cGVkYUBh
eGVudGlhLnNlPgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpD
YzogTWljaGVsIETDpG56ZXIgPG1pY2hlbC5kYWVuemVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6
IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgotLS0KRnVtYmxlZCB0aGUg
cHJldmlvdXMgcGF0Y2ggZm9yIHRoZSByZWdyZXNzaW9uIGZpeCAoaG0ganVzdCByZWFsaXplZCBt
YXliZQp0aGF0IG9uZSBzaG91bGQgaGF2ZSBhIGNjOiBzdGFibGUgdG8gbWFrZSBhIGZldyBtb3Jl
IHBlb3BsZSBoYXBweSksIHdhbnRlZAp0byBpbmNsdWRlIHRoaXMgY2xlYW51cCBoZXJlLgotRGFu
aWVsCgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rpc3BsYXkuYyB8IDcgLS0t
LS0tLQogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fbW9kZS5oICAgIHwgMSAtCiAyIGZp
bGVzIGNoYW5nZWQsIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9yYWRlb25fZGlzcGxheS5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25f
ZGlzcGxheS5jCmluZGV4IDg1NjUyNmNiMmNhZi4uMzU0NzU2ZTAwZmUxIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kaXNwbGF5LmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9yYWRlb25fZGlzcGxheS5jCkBAIC02NzIsNyArNjcyLDYgQEAgc3RhdGljIHZv
aWQgcmFkZW9uX2NydGNfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBpbnQgaW5kZXgpCiB7
CiAJc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYgPSBkZXYtPmRldl9wcml2YXRlOwogCXN0cnVj
dCByYWRlb25fY3J0YyAqcmFkZW9uX2NydGM7Ci0JaW50IGk7CiAKIAlyYWRlb25fY3J0YyA9IGt6
YWxsb2Moc2l6ZW9mKHN0cnVjdCByYWRlb25fY3J0YykgKyAoUkFERU9ORkJfQ09OTl9MSU1JVCAq
IHNpemVvZihzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqKSksIEdGUF9LRVJORUwpOwogCWlmIChyYWRl
b25fY3J0YyA9PSBOVUxMKQpAQCAtNzAxLDEyICs3MDAsNiBAQCBzdGF0aWMgdm9pZCByYWRlb25f
Y3J0Y19pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIGludCBpbmRleCkKIAlyYWRlb25fY3J0
Yy0+bW9kZV9zZXQubnVtX2Nvbm5lY3RvcnMgPSAwOwogI2VuZGlmCiAKLQlmb3IgKGkgPSAwOyBp
IDwgMjU2OyBpKyspIHsKLQkJcmFkZW9uX2NydGMtPmx1dF9yW2ldID0gaSA8PCAyOwotCQlyYWRl
b25fY3J0Yy0+bHV0X2dbaV0gPSBpIDw8IDI7Ci0JCXJhZGVvbl9jcnRjLT5sdXRfYltpXSA9IGkg
PDwgMjsKLQl9Ci0KIAlpZiAocmRldi0+aXNfYXRvbV9iaW9zICYmIChBU0lDX0lTX0FWSVZPKHJk
ZXYpIHx8IHJhZGVvbl9yNHh4X2F0b20pKQogCQlyYWRlb25fYXRvbWJpb3NfaW5pdF9jcnRjKGRl
diwgcmFkZW9uX2NydGMpOwogCWVsc2UKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRl
b24vcmFkZW9uX21vZGUuaCBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX21vZGUuaApp
bmRleCBmZDQ3MGQ2YmYzZjQuLjk2NTY1MTcxZDEzZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9yYWRlb25fbW9kZS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFk
ZW9uX21vZGUuaApAQCAtMzI3LDcgKzMyNyw2IEBAIGVudW0gcmFkZW9uX2ZsaXBfc3RhdHVzIHsK
IHN0cnVjdCByYWRlb25fY3J0YyB7CiAJc3RydWN0IGRybV9jcnRjIGJhc2U7CiAJaW50IGNydGNf
aWQ7Ci0JdTE2IGx1dF9yWzI1Nl0sIGx1dF9nWzI1Nl0sIGx1dF9iWzI1Nl07CiAJYm9vbCBlbmFi
bGVkOwogCWJvb2wgY2FuX3RpbGU7CiAJYm9vbCBjdXJzb3Jfb3V0X29mX2JvdW5kczsKLS0gCjIu
MjQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
