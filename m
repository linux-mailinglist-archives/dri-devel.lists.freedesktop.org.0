Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 617739587E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 09:31:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D70AA6E613;
	Tue, 20 Aug 2019 07:31:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2599D8984D
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 13:06:09 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id 196so1143450pfz.8
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 06:06:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J0MJOA0ehnVcKagp2PPONz3jZfNumEahBA4DfOKGUOs=;
 b=sm8MPuWaw4+thZtqQdUJOEUulYsxuKNReo3dv/9+yfjU4/R7w4F6pO80ytBHBLWkue
 2JvWki57rtu4z3iFV+DVq1CTWZ/PqG0BAbjJtvljJtFwyTZWLvNinN0UgkGj39H/Qaks
 19c/zKGs14mDnzOV+H9FYP8Xi6t81gd2uP6/biB/LMVspt5JR3yiwvti2EC7WKyCg/G/
 Cao0UN+g9N9R/n3+DuvfGH1TFiwvHfiH852aeDuEd22DcR+16eg8F5rrSrzhsj1bmY7a
 4xaPPCoW7rSP3YVs1jgzOwaQDFPV5RKuGQ68eXzRudsYOeaQ9fxgZZBmUmAa5Z7hLSd5
 GfXQ==
X-Gm-Message-State: APjAAAXkX82+BdDUDHqjYbWjk6gkAP55LsjznzRCCT9AX2mkKPLuE5Fs
 +vh6fSHVpS6YFEgHZL6HTC2d+Z3nYBY=
X-Google-Smtp-Source: APXvYqxTxI+ckLrYqBmhfbTvY3cF/YLWqrHpd7wG8/FyPaDxRkxT1R+xVqL/TlEHzjaMApu6bUzpPw==
X-Received: by 2002:a17:90a:c68c:: with SMTP id
 n12mr21008549pjt.29.1566219968644; 
 Mon, 19 Aug 2019 06:06:08 -0700 (PDT)
Received: from masabert (150-66-86-135m5.mineo.jp. [150.66.86.135])
 by smtp.gmail.com with ESMTPSA id g36sm28225971pgb.78.2019.08.19.06.06.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 19 Aug 2019 06:06:08 -0700 (PDT)
Received: by masabert (Postfix, from userid 1000)
 id 62C1A201207; Mon, 19 Aug 2019 22:05:54 +0900 (JST)
From: Masanari Iida <standby24x7@gmail.com>
To: linux-kernel@vger.kernel.org, airlied@linux.ie, daniel@ffwll.ch,
 chris@chris-wilson.co.uk, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: selftests: Fix a typo in test-drm_mm.c
Date: Mon, 19 Aug 2019 22:05:52 +0900
Message-Id: <20190819130552.28354-1-standby24x7@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 20 Aug 2019 07:30:56 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J0MJOA0ehnVcKagp2PPONz3jZfNumEahBA4DfOKGUOs=;
 b=F6Y1FkWtVt0w8hmLD+i3lRG351Ap5XSaWn5lCIx4ojXVdCDO0P3tSjSfavGTUzZjzn
 IAjj250OLr5KC+RBj+/f5Vz3LBKK93G3q78OoH5mY9KGTXgDh6he/CADlyWX5DUbhF7L
 m+Sxb5NdlIdny2/F7ThgDQhU6LXloBRpXIECfEdAgfyNPaEBDK8zT1UjvEeIgWCsdXJU
 U3ZSKfVpENZQVGvED67qHIb7DPfuOhAJUma6z/N8i196NzdD26/nbGMFuaC+xsPFW5nE
 TRqHGk9qbKN9MlgIHob30DHqiFWU2c0YA+YoUnvpCunhTNtGbje+uSW3PqPYFHfjjpqa
 mFzg==
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
Cc: Masanari Iida <standby24x7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBmaXggYSBzcGVsbGluZyB0eXBvIGluIHRlc3QtZHJtX21tLmMKClNpZ25lZC1v
ZmYtYnk6IE1hc2FuYXJpIElpZGEgPHN0YW5kYnkyNHg3QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vc2VsZnRlc3RzL3Rlc3QtZHJtX21tLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vc2VsZnRlc3RzL3Rlc3QtZHJtX21tLmMgYi9kcml2ZXJzL2dwdS9kcm0vc2VsZnRlc3RzL3Rl
c3QtZHJtX21tLmMKaW5kZXggMzg4Zjk4NDRmNGJhLi5iYjI5ZTBiNjdiOTUgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9zZWxmdGVzdHMvdGVzdC1kcm1fbW0uYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vc2VsZnRlc3RzL3Rlc3QtZHJtX21tLmMKQEAgLTIzNTksNyArMjM1OSw3IEBAIHN0YXRp
YyBpbnQgX19pbml0IHRlc3RfZHJtX21tX2luaXQodm9pZCkKIAl3aGlsZSAoIXJhbmRvbV9zZWVk
KQogCQlyYW5kb21fc2VlZCA9IGdldF9yYW5kb21faW50KCk7CiAKLQlwcl9pbmZvKCJUZXN0aW5n
IERSTSByYW5nZSBtYW5nZXIgKHN0cnVjdCBkcm1fbW0pLCB3aXRoIHJhbmRvbV9zZWVkPTB4JXgg
bWF4X2l0ZXJhdGlvbnM9JXUgbWF4X3ByaW1lPSV1XG4iLAorCXByX2luZm8oIlRlc3RpbmcgRFJN
IHJhbmdlIG1hbmFnZXIgKHN0cnVjdCBkcm1fbW0pLCB3aXRoIHJhbmRvbV9zZWVkPTB4JXggbWF4
X2l0ZXJhdGlvbnM9JXUgbWF4X3ByaW1lPSV1XG4iLAogCQlyYW5kb21fc2VlZCwgbWF4X2l0ZXJh
dGlvbnMsIG1heF9wcmltZSk7CiAJZXJyID0gcnVuX3NlbGZ0ZXN0cyhzZWxmdGVzdHMsIEFSUkFZ
X1NJWkUoc2VsZnRlc3RzKSwgTlVMTCk7CiAKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
