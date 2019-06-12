Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C03142055
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 11:13:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 786EB89330;
	Wed, 12 Jun 2019 09:13:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A9E89330
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 09:13:00 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id c26so24627165edt.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 02:13:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ozuYLkzuE5EKiRdXRtonyVrqpSQymWsQ+YHRXJTwCgs=;
 b=jtUdyPGuAk4WFhinfoYVqqRSaq4wwnK2/kttpE6AoyvGo3aZnzDc/HpDVsHLbDw0+/
 bOtLi9KYgJdRZrWz5kvPmdQ4umMaDocdxoXR9XXhh+wsHtFCjnzhgd8fa911YmEO03wt
 F7frx/KQW7z//7sWBme2hx3NWTJDXCtXtw16kVdsxh+1xKhbSnuRV3pc357Y9kx9Htuh
 PIbDt42KZl3JvdCgTqi44g/QthNGCBgm89IGdI/xG3DylFjvc3lObnurydSyEK4AlEFO
 dRZ7CaBMNHjOdEpQ0Ku7EXsnse+jamxiRmGrYFJphNosIvbtVBZdw05O81oaIPZz1Iuw
 3a6A==
X-Gm-Message-State: APjAAAWIUIn4C9IZrA+jzVrvHbT3z2XR55L92LgXOcR5y7+UIfKa0J+W
 +niG4hokDX4N9+fysROZFMseHH7OWJ0=
X-Google-Smtp-Source: APXvYqwM+DrGT6BpKC8QePP43Oh4wDjezHFV6MAu1nP4Qu+F32fNhAfxZnSU0+zF1vh0nmPt9ek+Lg==
X-Received: by 2002:a17:906:6a89:: with SMTP id
 p9mr50404960ejr.44.1560330779136; 
 Wed, 12 Jun 2019 02:12:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id 93sm4441477edk.84.2019.06.12.02.12.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 12 Jun 2019 02:12:58 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/omapdrm: drop fb_debug_enter/leave
Date: Wed, 12 Jun 2019 11:12:52 +0200
Message-Id: <20190612091253.26413-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ozuYLkzuE5EKiRdXRtonyVrqpSQymWsQ+YHRXJTwCgs=;
 b=EM/QlG+5Xc7bGqb4HSpsmqHh+9D0A3UoKVEm0y7lAIxPNerEWvyXkh/hChDg+l7Ulo
 k6eJn3kMYmKSO53ua6kOS79ta1DUGHrvmT2o8+oBG8lJAt1rynr1AiN4ttT8Nh2LPcT/
 w73myxF0QFOncySHhPneJBEX7UIbKuW40CGgA=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBpcyBhIG5vLW9wIG9uIGF0b21pYyBkcml2ZXJzIGJlY2F1c2Ugd2l0aCBhdG9taWMgaXQn
cyBzaW1wbHkgdG9vCmNvbXBsaWNhdGVkIHRvIGdldCBhbGwgdGhlIGxvY2tpbmcgYW5kIHdvcmtl
cnMgYW5kIG5vbmJsb2NraW5nCnN5bmNocm9uaXphdGlvbiBjb3JyZWN0LCBmcm9tIGVzc2VudGlh
bGx5IGFuIE5NSSBjb250ZXh0LiBXZWxsLCB0b28KY29tcGxpY2F0ZWQgPSBpbXBvc3NpYmxlLiBB
bHNvLCBvbWFwZHJtIG5ldmVyIGltcGxlbWVudGVkIHRoZQptb2RlX3NldF9iYXNlX2F0b21pYyBo
b29rLCBzbyBJIGtpbmRhIHdvbmRlciB3aHkgdGhpcyB3YXMgZXZlciBhZGRlZC4KCkRyb3AgdGhl
IGhvb2tzLgoKU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRl
bC5jb20+CkNjOiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZmJkZXYuYyB8IDIgLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29t
YXBfZmJkZXYuYyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZmJkZXYuYwppbmRleCA1
MGFhYmQ4NTRmNGQuLjBkYWQ0MmU4MTliYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL29t
YXBkcm0vb21hcF9mYmRldi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZmJk
ZXYuYwpAQCAtODcsOCArODcsNiBAQCBzdGF0aWMgc3RydWN0IGZiX29wcyBvbWFwX2ZiX29wcyA9
IHsKIAkuZmJfc2V0Y21hcAk9IGRybV9mYl9oZWxwZXJfc2V0Y21hcCwKIAkuZmJfYmxhbmsJPSBk
cm1fZmJfaGVscGVyX2JsYW5rLAogCS5mYl9wYW5fZGlzcGxheSA9IG9tYXBfZmJkZXZfcGFuX2Rp
c3BsYXksCi0JLmZiX2RlYnVnX2VudGVyID0gZHJtX2ZiX2hlbHBlcl9kZWJ1Z19lbnRlciwKLQku
ZmJfZGVidWdfbGVhdmUgPSBkcm1fZmJfaGVscGVyX2RlYnVnX2xlYXZlLAogCS5mYl9pb2N0bAk9
IGRybV9mYl9oZWxwZXJfaW9jdGwsCiAKIAkuZmJfcmVhZCA9IGRybV9mYl9oZWxwZXJfc3lzX3Jl
YWQsCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
