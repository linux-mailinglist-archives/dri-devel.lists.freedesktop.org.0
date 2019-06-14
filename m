Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E20D46A60
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 22:37:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90C8D894EB;
	Fri, 14 Jun 2019 20:36:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1617E894A7
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 20:36:42 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id s49so5286987edb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:36:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dNf7hqRf79fGHBF7HWsLnjY/cEQxEp+rMCY4HFkVzJ0=;
 b=g9hlnMVIZ5DOQ/59BwmivQ1MQ7hOHjCo4jrymQvAVm1FySkP4L7ur6b2ct5Yn9MNvl
 NBeLLswbSlUyE1v+gqoRmDtSrAMJTbUkvirnbTPz2rUCO8bCdjMcdDOoRatSy6jT+Ey9
 GPe6Yy2KzzOOMFFfPG9PfMIEIpFKa3M3W0NKjmyVdZbh68qSgz8vneP0o0jeUvE3JyRx
 Xh4ONwrconf2TTVDq0YUC4KyQZe3GtrYdqwlx27hWc8X1KBaiRkFHDfIQvMasVvAjdB3
 4NSePP1gc4aNKS0UTF7pvAU7SfNgvYRE86JgSeZw7nCEMelzOz4rr9J53e/4pWnSi1tU
 iHvQ==
X-Gm-Message-State: APjAAAWtSM+Wh61h4eWHnrILwRLHFakuuV76QRWFxkKeSbWyy9WdUnV0
 +saF+yiYx4NuHjzTzdVaO2hffOYZaZA=
X-Google-Smtp-Source: APXvYqyOM1KkfIxzGb5uc15jBD+LKjPRTOLUD0IMJtVqvnZlVfjHXJ6drveJvT0PY6gcRM2nmoTuqQ==
X-Received: by 2002:a50:8be8:: with SMTP id n37mr82214861edn.216.1560544600256; 
 Fri, 14 Jun 2019 13:36:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.36.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:36:39 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 15/59] drm/fsl-dcu: Drop drm_gem_prime_export/import
Date: Fri, 14 Jun 2019 22:35:31 +0200
Message-Id: <20190614203615.12639-16-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dNf7hqRf79fGHBF7HWsLnjY/cEQxEp+rMCY4HFkVzJ0=;
 b=P83MT3X4uIc7lFilC0bv9HIqPqS7uhbSWZFtthxuE7LGekzYMmi2e+5gc1Rle1QZul
 /6pmVn5DkTuHY9dZr3EASOJ7yRyIsh5HFfm8JUGE40GtIppx4q0pMI5ShaMIBC6bLVVa
 qgE68o4m1CHxjzd7Y1GBBNohIJXHqADDfWXQI=
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Alison Wang <alison.wang@nxp.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhleSdyZSB0aGUgZGVmYXVsdC4KCkFzaWRlOiBXb3VsZCBiZSByZWFsbHkgbmljZSB0byBzd2l0
Y2ggdGhlIG90aGVycyBvdmVyIHRvCmRybV9nZW1fb2JqZWN0X2Z1bmNzLgoKU2lnbmVkLW9mZi1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBTdGVmYW4gQWdu
ZXIgPHN0ZWZhbkBhZ25lci5jaD4KQ2M6IEFsaXNvbiBXYW5nIDxhbGlzb24ud2FuZ0BueHAuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9mc2wtZGN1L2ZzbF9kY3VfZHJtX2Rydi5jIHwgMiAtLQog
MSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2ZzbC1kY3UvZnNsX2RjdV9kcm1fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vZnNsLWRjdS9m
c2xfZGN1X2RybV9kcnYuYwppbmRleCBkMThmZjcyOWQ3ZjYuLjY2MTcyNWQ4ZjdkYyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2ZzbC1kY3UvZnNsX2RjdV9kcm1fZHJ2LmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2ZzbC1kY3UvZnNsX2RjdV9kcm1fZHJ2LmMKQEAgLTE0Myw4ICsxNDMsNiBA
QCBzdGF0aWMgc3RydWN0IGRybV9kcml2ZXIgZnNsX2RjdV9kcm1fZHJpdmVyID0gewogCS5nZW1f
dm1fb3BzCQk9ICZkcm1fZ2VtX2NtYV92bV9vcHMsCiAJLnByaW1lX2hhbmRsZV90b19mZAk9IGRy
bV9nZW1fcHJpbWVfaGFuZGxlX3RvX2ZkLAogCS5wcmltZV9mZF90b19oYW5kbGUJPSBkcm1fZ2Vt
X3ByaW1lX2ZkX3RvX2hhbmRsZSwKLQkuZ2VtX3ByaW1lX2ltcG9ydAk9IGRybV9nZW1fcHJpbWVf
aW1wb3J0LAotCS5nZW1fcHJpbWVfZXhwb3J0CT0gZHJtX2dlbV9wcmltZV9leHBvcnQsCiAJLmdl
bV9wcmltZV9nZXRfc2dfdGFibGUJPSBkcm1fZ2VtX2NtYV9wcmltZV9nZXRfc2dfdGFibGUsCiAJ
LmdlbV9wcmltZV9pbXBvcnRfc2dfdGFibGUgPSBkcm1fZ2VtX2NtYV9wcmltZV9pbXBvcnRfc2df
dGFibGUsCiAJLmdlbV9wcmltZV92bWFwCQk9IGRybV9nZW1fY21hX3ByaW1lX3ZtYXAsCi0tIAoy
LjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
