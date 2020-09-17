Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B5E26E117
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 18:48:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C3B6EC54;
	Thu, 17 Sep 2020 16:48:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 844226E2D1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 16:48:16 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id k18so2734032wmj.5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 09:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8sbMTOaMATyn14awGdQHUWAOW0oBaCyluLgNfVI+6SA=;
 b=L3j8IF2JI2D11662I96wa6q0LH+QQuYv1H/JmCXQw4LoWh1cXt0nB6r+QxV6tjy+hI
 EDviRFhddpNmiGbXpTyQ/xa+LkGcxgrP2hMK4cRi59X12FPsbtBNpdvH0XUXy+yQ7va2
 3o2SIolHcp/SKnjfsmou7XDT0eh9maQ7aRBt8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8sbMTOaMATyn14awGdQHUWAOW0oBaCyluLgNfVI+6SA=;
 b=Y0EGLkurAb/jAQIvLCZ2/bVkMfI4WiABkR1Lz4f01cebQswnqxIEkp+lw1tlUfN5Ez
 8Z7GJSZ0UvPYNeueIiVpQz4Bb5AfOGOH9HJuLCM4CvmZ/7CFOusm5++uhAr2ilqwDZ7X
 ddemYq2kS8T4i75H60OQE71Vz3SxZAKNG44E9Ax0dxCp0Cy12buHWsmhBz35hqDXsFQG
 urEPX/MCAdHOJtl528S3PAPNg7WYAbIWOEv2gOgNPzSUoaDKEPjA+NVqJhVTNUE3wahQ
 aFyCmJMsASlf8wbbGpar1NnBQPWJ0qQY2oldPh/vUlA+IfY9wjIAC5anSwYCPd72+QU4
 iA1A==
X-Gm-Message-State: AOAM533S0FsNIIV1qzY55IHJzMlvuMQUjNeGx/a3rjm5eugSJKDtuchU
 UDhKYn6xrt3n3j/K9I4s1cWEv8TskzKgp0RX
X-Google-Smtp-Source: ABdhPJyTN98EXTPje6QoOzY63mPF/e1wMby+jLGZm11hGV/nD92BEo8hJ6MWPw8MhMexinD9BWp4XA==
X-Received: by 2002:a1c:39c4:: with SMTP id
 g187mr10619785wma.126.1600361294917; 
 Thu, 17 Sep 2020 09:48:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h1sm209193wrx.33.2020.09.17.09.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 09:48:14 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/doc: Document that modifiers are always required for fb
Date: Thu, 17 Sep 2020 18:47:22 +0200
Message-Id: <20200917164721.2038541-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Daniel Stone <daniels@collabora.com>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <maraeo@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Juston Li <juston.li@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RXZlbiBmb3IgbGVnYWN5IHVzZXJzcGFjZSwgc2luY2Ugb3RoZXJ3aXNlIEdFVEZCMiBpcyBicm9r
ZW4gYW5kIGlmIHlvdQpzd2l0Y2ggYmV0d2VlbiBtb2RpZmllci1sZXNzIGFuZCBtb2RpZmllci1h
d2FyZSBjb21wb3NpdG9ycywgc21vb3RoCnRyYW5zaXRpb25zIGJyZWFrLgoKQWxzbyBpdCdzIGp1
c3QgYmVzdCBwcmFjdGljZSB0byBtYWtlIHN1cmUgbW9kaWZpZXJzIGFyZSBpbnZhcmlhbnQgZm9y
CmEgZ2l2ZW4gZHJtX2ZiLCBhbmQgdGhhdCBhIG1vZGlmaWVyLWF3YXJlIGttcyBkcml2ZXJzIG9u
bHkgaGFzIG9uZQpwbGFjZSB0byBzdG9yZSB0aGVtLCBpZ25vcmluZyBhbnkgb2xkIGltcGxpY2l0
IGJvIGZsYWdzIG9yIHdoYXRldmVyCmVsc2UgbWlnaHQgZmxvYXQgYXJvdW5kLgoKTW90aXZhdGVk
IGJ5IHNvbWUgaXJjIGRpc2N1c3Npb24gd2l0aCBCYXMgYWJvdXQgYW1kZ3B1IG1vZGlmaWVyCnN1
cHBvcnQuCgpBY2tlZC1ieTogU2ltb24gU2VyIDxjb250YWN0QGVtZXJzaW9uLmZyPgpBY2tlZC1i
eTogRGFuaWVsIFN0b25lIDxkYW5pZWxzQGNvbGxhYm9yYS5jb20+CkFja2VkLWJ5OiBQZWtrYSBQ
YWFsYW5lbiA8cGVra2EucGFhbGFuZW5AY29sbGFib3JhLmNvbT4KRml4ZXM6IDQ1NWUwMGYxNDEy
ZiAoImRybTogQWRkIGdldGZiMiBpb2N0bCIpCkNjOiBEYW5pZWwgU3RvbmUgPGRhbmllbHNAY29s
bGFib3JhLmNvbT4KQ2M6IEp1c3RvbiBMaSA8anVzdG9uLmxpQGludGVsLmNvbT4KQ2M6IERhbmll
bCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+CkNjOiBWaWxsZSBTeXJqw6Rsw6QgPHZp
bGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgpDYzogQmFzIE5pZXV3ZW5odWl6ZW4gPGJhc0Bi
YXNuaWV1d2VuaHVpemVuLm5sPgpDYzogTWFyZWsgT2zFocOhayA8bWFyYWVvQGdtYWlsLmNvbT4K
Q2M6ICJXZW50bGFuZCwgSGFycnkiIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgpTaWduZWQtb2Zm
LWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KLS0tClNlbmRpbmcg
dGhpcyBvdXQgYWdhaW4gdG8gZG91YmxlLWNoZWNrIHRoZXJlJ3Mgbm8gb2JqZWN0aW9ucyBvciBj
b25jZXJucy4KRnJvbSB3aGF0IEkgdW5kZXJzdGFuZCBsb29raW5nIGF0IHRoZSBjb2RlIHRoZSBs
YXRlc3QgbW9kaWZpZXIgcGF0Y2hlcyBmb3IKYW1kZ3B1IGZvbGxvdyB0aGlzIG5vdy4KCkNoZWVy
cywgRGFuaWVsCi0tLQogaW5jbHVkZS9kcm0vZHJtX21vZGVfY29uZmlnLmggfCAxMyArKysrKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvZHJtL2RybV9tb2RlX2NvbmZpZy5oIGIvaW5jbHVkZS9kcm0vZHJtX21vZGVfY29uZmln
LmgKaW5kZXggYTE4ZjczZWIzY2Y2Li41ZmZiYjRlZDViMzUgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUv
ZHJtL2RybV9tb2RlX2NvbmZpZy5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9tb2RlX2NvbmZpZy5o
CkBAIC01OCw2ICs1OCwxMiBAQCBzdHJ1Y3QgZHJtX21vZGVfY29uZmlnX2Z1bmNzIHsKIAkgKiBh
Y3R1YWwgbW9kaWZpZXIgdXNlZCBpZiB0aGUgcmVxdWVzdCBkb2Vzbid0IGhhdmUgaXQgc3BlY2lm
aWVkLAogCSAqIGllLiB3aGVuIChAbW9kZV9jbWQtPmZsYWdzICYgRFJNX01PREVfRkJfTU9ESUZJ
RVJTKSA9PSAwLgogCSAqCisJICogSU1QT1JUQU5UOiBUaGVzZSBpbXBsaWVkIG1vZGlmaWVycyBm
b3IgbGVnYWN5IHVzZXJzcGFjZSBtdXN0IGJlCisJICogc3RvcmVkIGluIHN0cnVjdCAmZHJtX2Zy
YW1lYnVmZmVyLCBpbmNsdWRpbmcgYWxsIHJlbGV2YW50IG1ldGFkYXRhCisJICogbGlrZSAmZHJt
X2ZyYW1lYnVmZmVyLnBpdGNoZXMgYW5kICZkcm1fZnJhbWVidWZmZXIub2Zmc2V0cyBpZiB0aGUK
KwkgKiBtb2RpZmllciBlbmFibGVzIGFkZGl0aW9uYWwgcGxhbmVzIGJleW9uZCB0aGUgZm91cmNj
IHBpeGVsIGZvcm1hdAorCSAqIGNvZGUuIFRoaXMgaXMgcmVxdWlyZWQgYnkgdGhlIEdFVEZCMiBp
b2N0bC4KKwkgKgogCSAqIElmIHRoZSBwYXJhbWV0ZXJzIGFyZSBkZWVtZWQgdmFsaWQgYW5kIHRo
ZSBiYWNraW5nIHN0b3JhZ2Ugb2JqZWN0cyBpbgogCSAqIHRoZSB1bmRlcmx5aW5nIG1lbW9yeSBt
YW5hZ2VyIGFsbCBleGlzdCwgdGhlbiB0aGUgZHJpdmVyIGFsbG9jYXRlcwogCSAqIGEgbmV3ICZk
cm1fZnJhbWVidWZmZXIgc3RydWN0dXJlLCBzdWJjbGFzc2VkIHRvIGNvbnRhaW4KQEAgLTkxNSw2
ICs5MjEsMTMgQEAgc3RydWN0IGRybV9tb2RlX2NvbmZpZyB7CiAJICogQGFsbG93X2ZiX21vZGlm
aWVyczoKIAkgKgogCSAqIFdoZXRoZXIgdGhlIGRyaXZlciBzdXBwb3J0cyBmYiBtb2RpZmllcnMg
aW4gdGhlIEFEREZCMi4xIGlvY3RsIGNhbGwuCisJICoKKwkgKiBJTVBPUlRBTlQ6CisJICoKKwkg
KiBJZiB0aGlzIGlzIHNldCB0aGUgZHJpdmVyIG11c3QgZmlsbCBvdXQgdGhlIGZ1bGwgaW1wbGlj
aXQgbW9kaWZpZXIKKwkgKiBpbmZvcm1hdGlvbiBpbiB0aGVpciAmZHJtX21vZGVfY29uZmlnX2Z1
bmNzLmZiX2NyZWF0ZSBob29rIGZvciBsZWdhY3kKKwkgKiB1c2Vyc3BhY2Ugd2hpY2ggZG9lcyBu
b3Qgc2V0IG1vZGlmaWVycy4gT3RoZXJ3aXNlIHRoZSBHRVRGQjIgaW9jdGwgaXMKKwkgKiBicm9r
ZW4gZm9yIG1vZGlmaWVyIGF3YXJlIHVzZXJzcGFjZS4KIAkgKi8KIAlib29sIGFsbG93X2ZiX21v
ZGlmaWVyczsKIAotLSAKMi4yOC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
