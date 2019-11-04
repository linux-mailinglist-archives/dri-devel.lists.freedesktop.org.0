Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF84EE478
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 17:14:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9FD26E5E7;
	Mon,  4 Nov 2019 16:14:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5F56E5E7
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 16:14:33 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id r22so14659666qtt.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2019 08:14:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YuYmhVgbA+Fo02o2Xskyfo4EJXaoEt0MjkOscYAQ/Uo=;
 b=ba7dh/KSteESz0Uup4l4Ml6mylcMXEVtexmFGpWHwkHOuXNDvYNwFicZAY6fzBK/Sk
 NhzSXExaf6yaxzaotf859UfrST1cLPMPOzhs1+/o+XiNYJjB3b6FWRIsZ+v/gpYJg1oZ
 tdPqKLJ4KpLK/NsETYzNPeeyHTPBMlpy7WsToaxNqr3djdsM5l9DN4SgkqYuj8IUN/Nc
 OPM8anF3wIktWqSdWnYQvOm8ynY4DVL7szihNliND4cXqHnagG/TfkCKXkUTgr6KVa5r
 bT087V5dDz6wi+eWYaG72zjeCEiY9xL0dwldTiZVy4uURdlXvOlYQ4+4/zovXFH7qmZY
 JzmA==
X-Gm-Message-State: APjAAAXTO6vlXJptf/f37xlWFfHOQhTRc8ROO+3rf3R8mNsACNEO0mu5
 3NozamD/ex0i1lyqLpsbOUM=
X-Google-Smtp-Source: APXvYqyC4InZzB7PWnIa0uKyq5kaRUwDOfqSGs+aND0mj4RP874zaM9/bIQsy+BQ6rn7DzPAtWXh7Q==
X-Received: by 2002:ac8:d6:: with SMTP id d22mr13033168qtg.290.1572884072383; 
 Mon, 04 Nov 2019 08:14:32 -0800 (PST)
Received: from localhost.localdomain ([187.106.44.83])
 by smtp.gmail.com with ESMTPSA id d76sm8515020qkb.57.2019.11.04.08.14.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2019 08:14:31 -0800 (PST)
From: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
To: outreachy-kernel@googlegroups.com, manasi.d.navare@intel.com,
 rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com, daniel@ffwll.ch,
 airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lkcamp@lists.libreplanetbr.org
Subject: [PATCH VKMS v3] drm/vkms: Fix typo and preposion in function
 documentation
Date: Mon,  4 Nov 2019 13:14:24 -0300
Message-Id: <20191104161424.18105-1-gabrielabittencourt00@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YuYmhVgbA+Fo02o2Xskyfo4EJXaoEt0MjkOscYAQ/Uo=;
 b=lk3pSZUeGzM6eLoD0AFnbQccwwlgtIKUkLeSdLj3GhQupKaxo6Id4ox0PyEy3wCDLr
 4ByyYWvGBZnwKdeIC5Kw+orC0Nd/kvDnlGA88gdx89Jpzf5NNdmS6Q9f+6QiYkCbkA36
 J5pOGly8HGnGdiproFp6tMWg8flyHzkDsTU2alek36m+MrplTzYfebhQOIYPQUa40IoG
 RcPWOoWKKGeoN5NlpybTy8lQ5aKt48pzS/APUf59A2uYApLauBAbLH6PzCa8uHnfNWTf
 mRvPBwxJGXOnwCTg/CT15c19mz94l00yu3DGS6MH9KlaM/FNJ4W5r5BS9cGAnKgcCJzt
 i9Xw==
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
Cc: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4IHR5cG8gaW4gd29yZCAnYmxlbmQnIGFuZCBpbiB0aGUgd29yZCAnZGVzdGluYXRpb24nIGFu
ZCBjaGFuZ2UKcHJlcG9zaXRpb24gJ2F0JyB0byAnb2YnIGluIGZ1bmN0aW9uICdibGVuZCcgZG9j
dW1lbnRhdGlvbi4KQW5kIGNoYW5nZSB0aGUgdGFzayBpbnRyb2R1Y3Rpb24gd29yZCAnVG9kbycg
Zm9yIHRoZSB3b3JkIGFsbCBpbiB1cHBlcmNhc2UKLSAnVE9ETycuIFdpdGggdGhlIFRPRE8gd29y
ZCBhbGwgaW4gdXBwZXJjYXNlIChhcyBpdCdzIHRoZSBzdGFuZGFyZCkgaXQncwplYXNpZXIgdG8g
ZmluZCB0aGUgdGFza3MgdGhhdCBoYXZlIHRvIGJlIGRvbmUgdGhyb3VnaG91dCB0aGUgY29kZS4K
CkNoYW5nZXMgc2luY2UgVjM6CiBSb2RyaWdvOgogLSBNZXJnZSB0aGUgcGF0Y2ggc2VyaWVzIGlu
dG8gYSBzaW5nbGUgcGF0Y2ggc2luY2UgaXQgY29udGFpbnMgb25lIHNpbmdsZQogbG9naWNhbCBj
aGFuZ2UKCkNoYW5nZXMgc2luY2UgVjI6CiAtIEFkZCBmaXggdHlwbyBpbiAgd29yZCAnZGVzdGlu
YXRpb24nCiAtIEFkZCBjaGFuZ2Ugb2YgdGhlIHByZXBvc2l0aW9uCiAtIEZpeCB0aGUgbmFtZSBv
ZiB0aGUgZnVuY3Rpb24gaW4gbG9nIG1lc3NhZ2UKIC0gQWRkIHRoZSBjaGFuZ2UgaW4gd29yZCAn
VG9kbycKClNpZ25lZC1vZmYtYnk6IEdhYnJpZWxhIEJpdHRlbmNvdXJ0IDxnYWJyaWVsYWJpdHRl
bmNvdXJ0MDBAZ21haWwuY29tPgoKLS0tCgpJJ3ZlIHRlc3RlZCB0aGUgcGF0Y2ggdXNpbmcga2Vy
bmVsLWRvYwotLS0KIGRyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfY29tcG9zZXIuYyB8IDggKysr
Ky0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19jb21wb3Nlci5jIGIvZHJpdmVy
cy9ncHUvZHJtL3ZrbXMvdmttc19jb21wb3Nlci5jCmluZGV4IGQ1NTg1Njk1YzY0ZC4uNGFmMmYx
OTQ4MGY0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2NvbXBvc2VyLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19jb21wb3Nlci5jCkBAIC00MywxOCArNDMs
MTggQEAgc3RhdGljIHVpbnQzMl90IGNvbXB1dGVfY3JjKHZvaWQgKnZhZGRyX291dCwgc3RydWN0
IHZrbXNfY29tcG9zZXIgKmNvbXBvc2VyKQogfQogCiAvKioKLSAqIGJsZW5kIC0gYmVsbmQgdmFs
dWUgYXQgdmFkZHJfc3JjIHdpdGggdmFsdWUgYXQgdmFkZHJfZHN0CisgKiBibGVuZCAtIGJsZW5k
IHZhbHVlIGF0IHZhZGRyX3NyYyB3aXRoIHZhbHVlIGF0IHZhZGRyX2RzdAogICogQHZhZGRyX2Rz
dDogZGVzdGluYXRpb24gYWRkcmVzcwogICogQHZhZGRyX3NyYzogc291cmNlIGFkZHJlc3MKICAq
IEBkZXN0X2NvbXBvc2VyOiBkZXN0aW5hdGlvbiBmcmFtZWJ1ZmZlcidzIG1ldGFkYXRhCiAgKiBA
c3JjX2NvbXBvc2VyOiBzb3VyY2UgZnJhbWVidWZmZXIncyBtZXRhZGF0YQogICoKICAqIEJsZW5k
IHZhbHVlIGF0IHZhZGRyX3NyYyB3aXRoIHZhbHVlIGF0IHZhZGRyX2RzdC4KLSAqIEN1cnJlbnRs
eSwgdGhpcyBmdW5jdGlvbiB3cml0ZSB2YWx1ZSBhdCB2YWRkcl9zcmMgb24gdmFsdWUKKyAqIEN1
cnJlbnRseSwgdGhpcyBmdW5jdGlvbiB3cml0ZSB2YWx1ZSBvZiB2YWRkcl9zcmMgb24gdmFsdWUK
ICAqIGF0IHZhZGRyX2RzdCB1c2luZyBidWZmZXIncyBtZXRhZGF0YSB0byBsb2NhdGUgdGhlIG5l
dyB2YWx1ZXMKLSAqIGZyb20gdmFkZHJfc3JjIGFuZCB0aGVpciBkaXN0ZW5hdGlvbiBhdCB2YWRk
cl9kc3QuCisgKiBmcm9tIHZhZGRyX3NyYyBhbmQgdGhlaXIgZGVzdGluYXRpb24gYXQgdmFkZHJf
ZHN0LgogICoKLSAqIFRvZG86IFVzZSB0aGUgYWxwaGEgdmFsdWUgdG8gYmxlbmQgdmFkZHJfc3Jj
IHdpdGggdmFkZHJfZHN0CisgKiBUT0RPOiBVc2UgdGhlIGFscGhhIHZhbHVlIHRvIGJsZW5kIHZh
ZGRyX3NyYyB3aXRoIHZhZGRyX2RzdAogICoJIGluc3RlYWQgb2Ygb3ZlcndyaXRpbmcgaXQuCiAg
Ki8KIHN0YXRpYyB2b2lkIGJsZW5kKHZvaWQgKnZhZGRyX2RzdCwgdm9pZCAqdmFkZHJfc3JjLAot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
