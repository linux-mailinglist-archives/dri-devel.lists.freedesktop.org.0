Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BBA84E91
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 16:21:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3CBF6E708;
	Wed,  7 Aug 2019 14:21:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc44.google.com (mail-yw1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 537F66E70F
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 14:21:04 +0000 (UTC)
Received: by mail-yw1-xc44.google.com with SMTP id z63so32433435ywz.9
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2019 07:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=03Ta84AxtVLjMVZpYbEZ9y1gYcY+2PmLdAVx9qZMrwM=;
 b=AWPWmh1wdVAwHgrrxpUWwjbY6HlSjNMYJr9LIDgviJYXIFOqvIV/hmuimK+IxdCXZu
 ROsyx3tLbFmrSvG+1x5xS301Ae2mHhephcP1IMtPqPEquAuJXrctMMZqLitgGUPmWwMv
 ++QDzTEh8X15oilB9tLatW/5OWxgH5G7PK/AD4gKDSVxUwzOJr1u2sR0QlDhGzrLiVgt
 GKMVBs8OdiPtzHVu6yAOEwfL3WX7wwgb/yon4THY8Fm/3VBDJTlDEDsIumJAx9Lxc8bR
 hh10KyjsLWqn4bnDnCWhz99lXvpFfmutURoXvJEZC8NW500gRUvkA4+7VUfFgpvEFvoO
 tKaA==
X-Gm-Message-State: APjAAAXAohquLYhpPQQ3DJ815Vk3quAJQ3rHbOqZckft9zCYvHVtWPFM
 aHupQX12vavj6W0C27vjkZqwOPXQOYQ=
X-Google-Smtp-Source: APXvYqykCK9U7lX7nvkX4KyYQJLc/+9tkW0UB6roXRkWFDN3rIxZNsGSPOdlvnl/AMp6CweYvwIaiw==
X-Received: by 2002:a0d:c345:: with SMTP id f66mr5994613ywd.10.1565187663254; 
 Wed, 07 Aug 2019 07:21:03 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id d204sm20419451ywe.33.2019.08.07.07.21.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 07 Aug 2019 07:21:02 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@gmail.com,
 mripard@kernel.org, robh@kernel.org, emil.velikov@collabora.com
Subject: [PATCH 0/5] drm-misc-next: Revert patches missing reviews
Date: Wed,  7 Aug 2019 10:20:53 -0400
Message-Id: <20190807142101.251400-1-sean@poorly.run>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=03Ta84AxtVLjMVZpYbEZ9y1gYcY+2PmLdAVx9qZMrwM=;
 b=WYSgo3SQNUX55QY276LJ1RL2cfgRDxqK9bYs1GV92zzPsKiTQ6KbmoctT20faOS7Mm
 WJV86Ei6Gvm0e+eVoJY9RakXreMRwsaRgmBEaphdNURMyoPu8ZW12OgJ+2yzfuhZWDBH
 mfoRbj2IjxwOPUt5inwwP08VgFFSXSenUq80xTtE0teyIREmKQmk06+Yed75gWz7weFb
 nu4MJxvxLG1zJU1ANYLmqzdw13cCmMDlHrk4E9YNYAXlmCE38yTnDdx96O57vOEKaIpv
 k2qK9wabHys4+Q31QM9gw+nSJcMxoRtzStlJn9g+E3oH9MnMWSHo1zpvUmAfiEtjGOAb
 dR+w==
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
Cc: Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpIZWxsb29vLApUaGlzIGhh
cyBiZWVuIGNvdmVyZWQgYWQgbmF1c2VhbSBvbiB0aGUgbS1sIGFuZCBpcmMsIGJ1dCBmb3IgdGhl
IHJlY29yZDoKClJldmlld3MgYXJlIGEgbWFuZGF0b3J5IHJlcXVpcmVtZW50IGZvciBwYXRjaGVz
IGluIGRybS1taXNjLW5leHQsIGl0J3MKd2hhdCBrZWVwcyB1cyBhbGwgaG9uZXN0IGluIHRoZSBj
b21taXR0ZXIgbW9kZWwuIFRoZSBtb3N0IHJlY2VudApkcm0tbWlzYy1uZXh0IHB1bGwgaW5jbHVk
ZWQgYSBoYW5kZnVsIG9mIHBhdGNoZXMgdGhhdCB3ZXJlIG1pc3NpbmcKcmV2aWV3cy4gVGhlcmUg
d2FzIGFic29sdXRlbHkgemVybyBuZWZhcmlvdXMgaW50ZW50LCBidXQgcnVsZXMgYXJlCnJ1bGVz
LCBzbyB3ZSdyZSByZXZlcnRpbmcgdGhlbS4KCkkgZmVlbCBjb25maWRlbnQgcmUtYXBwbHlpbmcg
YWxsIG9mIHRoZXNlIHdpdGggbXkgU29CLCBzbyBJIHBsYW4gb24KZG9pbmcgdGhhdCBpbiB0aGUg
c2FtZSBwdXNoLgoKVGhhbmtzIHRvIGV2ZXJ5b25lIGZvciBoYW5kbGluZyB0aGlzIHNvIHdlbGws
IHNlcmlvdXNseSBhd2Vzb21lIHRoYXQKd2UgY2FuIHN0YXkgY29uc3RydWN0aXZlIGFzIGEgY29t
bXVuaXR5IFxvLy4KCkxhc3RseSwgdGhpcyB3aWxsIGJlIGNhdWdodCBieSBvdXIgdG9vbGluZyBp
biB0aGUgZnV0dXJlIHNvIHRoaXMgc2hvdWxkCmJlIHRoZSBsYXN0IHRpbWUgdGhpcyBoYXBwZW5z
IChvbiBhY2NpZGVudCkuCgpTZWFuCgpTZWFuIFBhdWwgKDUpOgogIFJldmVydCAiUmV2ZXJ0ICJk
cm0vZ2VtOiBSZW5hbWUgZHJtX2dlbV9kdW1iX21hcF9vZmZzZXQoKSB0bwogICAgZHJtX2dlbV9t
YXBfb2Zmc2V0KCkiIgogIFJldmVydCAiUmV2ZXJ0ICJkcm0vcGFuZnJvc3Q6IFVzZSBkcm1fZ2Vt
X21hcF9vZmZzZXQoKSIiCiAgUmV2ZXJ0ICJkcm0vdmdlbTogZHJvcCBEUk1fQVVUSCB1c2FnZSBm
cm9tIHRoZSBkcml2ZXIiCiAgUmV2ZXJ0ICJkcm0vbXNtOiBkcm9wIERSTV9BVVRIIHVzYWdlIGZy
b20gdGhlIGRyaXZlciIKICBSZXZlcnQgImRybS9ub3V2ZWF1OiByZW1vdmUgb3Blbi1jb2RlZCBk
cm1faW52YWxpZF9vcCgpIgoKIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHVtYl9idWZmZXJzLmMgICAg
ICB8ICA0ICsrLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMgICAgICAgICAgICAgICB8IDEw
ICsrKysrKystLS0KIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9nZW0uYyB8ICAz
ICstLQogZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2LmMgICAgICAgICAgIHwgMjIgKysrKysr
KysrKystLS0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9hYmkxNi5j
IHwgIDYgKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2FiaTE2LmggfCAg
MSArCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RybS5jICAgfCAgMiArLQogZHJp
dmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jIHwgMTYgKystLS0tLS0tLS0tLS0t
LQogZHJpdmVycy9ncHUvZHJtL3ZnZW0vdmdlbV9kcnYuYyAgICAgICAgIHwgIDQgKystLQogaW5j
bHVkZS9kcm0vZHJtX2dlbS5oICAgICAgICAgICAgICAgICAgIHwgIDQgKystLQogMTAgZmlsZXMg
Y2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKSwgMzcgZGVsZXRpb25zKC0pCgotLSAKU2VhbiBQYXVs
LCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
