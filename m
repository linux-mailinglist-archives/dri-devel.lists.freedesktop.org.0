Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9D0103551
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 08:41:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651E56E15A;
	Wed, 20 Nov 2019 07:41:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60A316E43C
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 00:09:59 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id l7so26015642wrp.6
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 16:09:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EH7rOnQ7g6xPGxYOwqh1Gb8uspMXNY2i4VwFx06HJEE=;
 b=ILM39gqS2eU79Gx9gCQKjaTsSfzc+BTkkDEh8jfUfSoQ/cMiUeAMQ8zqLMaNV7fpN6
 Ke3f0+cpfQ/RInLmS6gTpxr/bb0cgsgR6zRxyel8SidDexKk2foMGgS6Px1OJaUc+Gf6
 2QUTo4k8d58qggECdFsRTcBdsSOPzBO5EqIneOh7WyLuEUzFIQ0PHf07hNHY+jx1OI21
 OwGQGH6d+JW8N+iTGDKWhvH+VLy6gt/ZiZLyqq0mwZLmP9og3t9t2zox0j3ZK0LMAbZo
 5d4zUQOqkhvwIoNBAplPNm+UWTH9yVqQS3Q8qYxm5KWCiOyIAmob3oBaSsrcGujmCqh7
 wIsg==
X-Gm-Message-State: APjAAAWs8meRDaB/jszC+1nvUQZrMAOozVykvBcNgk/nZRuqnZH82MZN
 NmJpscqf9FunlqDzyr5wymU=
X-Google-Smtp-Source: APXvYqx12mAfe3E0Nz/Y65wRQjUhBvnRjTAULFvi/WFX6XDC722MHUUyEcNbvSf+N7QNC50xlpmWBQ==
X-Received: by 2002:adf:ef51:: with SMTP id c17mr134122wrp.266.1574208598025; 
 Tue, 19 Nov 2019 16:09:58 -0800 (PST)
Received: from localhost.localdomain
 ([2a02:a03f:40e1:9900:5dce:1599:e3b5:7d61])
 by smtp.gmail.com with ESMTPSA id n23sm4907947wmc.18.2019.11.19.16.09.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 16:09:57 -0800 (PST)
From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/crc-debugfs: fix crtc_crc_poll()'s return type
Date: Wed, 20 Nov 2019 01:07:54 +0100
Message-Id: <20191120000754.30710-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 20 Nov 2019 07:41:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EH7rOnQ7g6xPGxYOwqh1Gb8uspMXNY2i4VwFx06HJEE=;
 b=dj73GC1F5Fh5Tf3zQbbpg8WiBBNCBI3GCwlAk7sbVtz/KGpA3Bl/qOtb4j1jlrwe6f
 WX/qK5P9zKIAHUOmL/24N9pEaD5Lu7JyQtUETJnPgfHYjuctotFxIS4pSJ1F4Fpr6pbL
 /xbaIUIKf5yul2X/njsqyr9urCeIa+OzqvcJs0F/wiXd54jGeB2IsjJ8OL2A7EDkwaKG
 Eoh9qYopGQbz6f6g6HgG5Df+9vGNlfxP0ruoOCjh3i46OYkw/YxTk8KJWq8RjMQO8Abk
 nVra8/gxx1XwTpeRXkdkmTnhu7Jhx8pmPBma7I5mXkYXn9XcGYq5HTvR9OMqTFxF7cQ1
 23KQ==
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Y3J0Y19jcmNfcG9sbCgpIGlzIGRlZmluZWQgYXMgcmV0dXJuaW5nICd1bnNpZ25lZCBpbnQnIGJ1
dCB0aGUKLnBvbGwgbWV0aG9kIGlzIGRlY2xhcmVkIGFzIHJldHVybmluZyAnX19wb2xsX3QnLCBh
IGJpdHdpc2UgdHlwZS4KCkZpeCB0aGlzIGJ5IHVzaW5nIHRoZSBwcm9wZXIgcmV0dXJuIHR5cGUg
YW5kIHVzaW5nIHRoZSBFUE9MTApjb25zdGFudHMgaW5zdGVhZCBvZiB0aGUgUE9MTCBvbmVzLCBh
cyByZXF1aXJlZCBmb3IgX19wb2xsX3QuCgpDQzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4u
bGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KQ0M6IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2Vy
bmVsLm9yZz4KQ0M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgpDQzogRGF2aWQgQWlybGll
IDxhaXJsaWVkQGxpbnV4LmllPgpDQzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpD
QzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMdWMgVmFu
IE9vc3RlbnJ5Y2sgPGx1Yy52YW5vb3N0ZW5yeWNrQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMgfCA2ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RlYnVnZnNfY3JjLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMKaW5k
ZXggYmUxYjdiYTkyZmZlLi4wYmIwYWEwZWJiY2EgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZGVidWdmc19jcmMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3Jj
LmMKQEAgLTMzNCwxNyArMzM0LDE3IEBAIHN0YXRpYyBzc2l6ZV90IGNydGNfY3JjX3JlYWQoc3Ry
dWN0IGZpbGUgKmZpbGVwLCBjaGFyIF9fdXNlciAqdXNlcl9idWYsCiAJcmV0dXJuIExJTkVfTEVO
KGNyYy0+dmFsdWVzX2NudCk7CiB9CiAKLXN0YXRpYyB1bnNpZ25lZCBpbnQgY3J0Y19jcmNfcG9s
bChzdHJ1Y3QgZmlsZSAqZmlsZSwgcG9sbF90YWJsZSAqd2FpdCkKK3N0YXRpYyBfX3BvbGxfdCBj
cnRjX2NyY19wb2xsKHN0cnVjdCBmaWxlICpmaWxlLCBwb2xsX3RhYmxlICp3YWl0KQogewogCXN0
cnVjdCBkcm1fY3J0YyAqY3J0YyA9IGZpbGUtPmZfaW5vZGUtPmlfcHJpdmF0ZTsKIAlzdHJ1Y3Qg
ZHJtX2NydGNfY3JjICpjcmMgPSAmY3J0Yy0+Y3JjOwotCXVuc2lnbmVkIHJldDsKKwlfX3BvbGxf
dCByZXQ7CiAKIAlwb2xsX3dhaXQoZmlsZSwgJmNyYy0+d3EsIHdhaXQpOwogCiAJc3Bpbl9sb2Nr
X2lycSgmY3JjLT5sb2NrKTsKIAlpZiAoY3JjLT5zb3VyY2UgJiYgY3J0Y19jcmNfZGF0YV9jb3Vu
dChjcmMpKQotCQlyZXQgPSBQT0xMSU4gfCBQT0xMUkROT1JNOworCQlyZXQgPSBFUE9MTElOIHwg
RVBPTExSRE5PUk07CiAJZWxzZQogCQlyZXQgPSAwOwogCXNwaW5fdW5sb2NrX2lycSgmY3JjLT5s
b2NrKTsKLS0gCjIuMjQuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
