Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C156935E0A8
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 15:53:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECB2589E2A;
	Tue, 13 Apr 2021 13:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C9389CA8
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 13:52:52 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id z1so19502582edb.8
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 06:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=USNwhqgqd8crlryd9IPpYDbZ9nxqvlWxuF/AQMpZP34=;
 b=d38k6fJBPVtEVyyOlEdsJEQTgJRuDEeM+MMKjYCQg3n4kPKx+bf7rFyW6D7+s1aJQh
 jj0+jdaUlQcNhyoYD4TcQkS33cH5uzszXEtSXUYNYtXbTt+9d42SNevNw7XkUXO9hval
 H6AhAlEuenkDmcEn1O6171rHGoD/JMa6PGt1eLc86VpPR3hKyJDvZhjTldYm0T0Ljpju
 y1/egJRHDNNLt+HcB86I1HmYU9+i+nXIwFIFdZZzzj7Gj8Q/C0IapcSaEwQ9OB7d/LM/
 eGLhzqY7zOIBpYV02tzAI0grSqEpM52K+56/QfgiFOVHpb/sqQEBA66m+SDT3iaDHwKu
 0ntQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=USNwhqgqd8crlryd9IPpYDbZ9nxqvlWxuF/AQMpZP34=;
 b=oazlSFC4qAYrkkcOm9ldA8waQa9uxdO07vrIotwnsbBaLofhBED9PJdGQJJ5R9QDWE
 WT5Kxh8XYYGqaQ7EA6oaHWihssa7/RQQR6m7eVqavwJIhnUqfRYPvXJL4kNHP4h6IP8f
 4bLnqvryncJin79KutH/LMRT8i6TWRXGPYbzDoSOeDwPI2xq2SLxkBV6OBU22x/rB/Ee
 /JhtXnpM4h00S3kbM/DPrcGTwa2L+FxinjixQ0vOPDnZllQ0Y2ohGsayDC0DQcQQ3mwO
 0hYrikTyTymzzquXUqgQGYzPhA6YLbALmuw/I78nI8rK9xPbDi2KZoEr5KEfBeaA796t
 J44w==
X-Gm-Message-State: AOAM531tgavRxrfnkHTLpthFhGEQQaiwuOLpLaRLyjbRpN7B4Ts4zah4
 ixMwzVXKhfaaCBkRg51DttEa3FOWCSM=
X-Google-Smtp-Source: ABdhPJxdfrrixbEEFFU83XAqyx54qQifoVGAbOQWeYfuoCcnAGV4C+7K24HlAySOND6gibwirSFiVQ==
X-Received: by 2002:a05:6402:2786:: with SMTP id
 b6mr35210174ede.310.1618321971297; 
 Tue, 13 Apr 2021 06:52:51 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:a061:9101:8418:4794])
 by smtp.gmail.com with ESMTPSA id m10sm491465ejc.32.2021.04.13.06.52.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 06:52:50 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/7] drm/ttm: minor range manager coding style clean ups
Date: Tue, 13 Apr 2021 15:52:44 +0200
Message-Id: <20210413135248.1266-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210413135248.1266-1-christian.koenig@amd.com>
References: <20210413135248.1266-1-christian.koenig@amd.com>
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
Cc: daniel.vetter@ffwll.ch, thomas.hellstrom@linux.intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2VzLCBqdXN0IHJlbW92aW5nIHRoZSBsZWZ0b3ZlcnMgZnJvbSB0
aGUgcmVkZXNpZ24uCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4u
a29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcmFuZ2VfbWFuYWdl
ci5jIHwgMzUgKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE3IGlu
c2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX3JhbmdlX21hbmFnZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3Jhbmdl
X21hbmFnZXIuYwppbmRleCA3MDdlNWMxNTI4OTYuLmIxZTNmMzBmN2UyZCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcmFuZ2VfbWFuYWdlci5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS90dG0vdHRtX3JhbmdlX21hbmFnZXIuYwpAQCAtNDgsNyArNDgsOCBAQCBzdHJ1Y3QgdHRt
X3JhbmdlX21hbmFnZXIgewogCXNwaW5sb2NrX3QgbG9jazsKIH07CiAKLXN0YXRpYyBpbmxpbmUg
c3RydWN0IHR0bV9yYW5nZV9tYW5hZ2VyICp0b19yYW5nZV9tYW5hZ2VyKHN0cnVjdCB0dG1fcmVz
b3VyY2VfbWFuYWdlciAqbWFuKQorc3RhdGljIGlubGluZSBzdHJ1Y3QgdHRtX3JhbmdlX21hbmFn
ZXIgKgordG9fcmFuZ2VfbWFuYWdlcihzdHJ1Y3QgdHRtX3Jlc291cmNlX21hbmFnZXIgKm1hbikK
IHsKIAlyZXR1cm4gY29udGFpbmVyX29mKG1hbiwgc3RydWN0IHR0bV9yYW5nZV9tYW5hZ2VyLCBt
YW5hZ2VyKTsKIH0KQEAgLTEwOSw3ICsxMTAsMjEgQEAgc3RhdGljIHZvaWQgdHRtX3JhbmdlX21h
bl9mcmVlKHN0cnVjdCB0dG1fcmVzb3VyY2VfbWFuYWdlciAqbWFuLAogCX0KIH0KIAotc3RhdGlj
IGNvbnN0IHN0cnVjdCB0dG1fcmVzb3VyY2VfbWFuYWdlcl9mdW5jIHR0bV9yYW5nZV9tYW5hZ2Vy
X2Z1bmM7CitzdGF0aWMgdm9pZCB0dG1fcmFuZ2VfbWFuX2RlYnVnKHN0cnVjdCB0dG1fcmVzb3Vy
Y2VfbWFuYWdlciAqbWFuLAorCQkJCXN0cnVjdCBkcm1fcHJpbnRlciAqcHJpbnRlcikKK3sKKwlz
dHJ1Y3QgdHRtX3JhbmdlX21hbmFnZXIgKnJtYW4gPSB0b19yYW5nZV9tYW5hZ2VyKG1hbik7CisK
KwlzcGluX2xvY2soJnJtYW4tPmxvY2spOworCWRybV9tbV9wcmludCgmcm1hbi0+bW0sIHByaW50
ZXIpOworCXNwaW5fdW5sb2NrKCZybWFuLT5sb2NrKTsKK30KKworc3RhdGljIGNvbnN0IHN0cnVj
dCB0dG1fcmVzb3VyY2VfbWFuYWdlcl9mdW5jIHR0bV9yYW5nZV9tYW5hZ2VyX2Z1bmMgPSB7CisJ
LmFsbG9jID0gdHRtX3JhbmdlX21hbl9hbGxvYywKKwkuZnJlZSA9IHR0bV9yYW5nZV9tYW5fZnJl
ZSwKKwkuZGVidWcgPSB0dG1fcmFuZ2VfbWFuX2RlYnVnCit9OwogCiBpbnQgdHRtX3JhbmdlX21h
bl9pbml0KHN0cnVjdCB0dG1fZGV2aWNlICpiZGV2LAogCQkgICAgICAgdW5zaWduZWQgdHlwZSwg
Ym9vbCB1c2VfdHQsCkBAIC0xNjMsMTkgKzE3OCwzIEBAIGludCB0dG1fcmFuZ2VfbWFuX2Zpbmko
c3RydWN0IHR0bV9kZXZpY2UgKmJkZXYsCiAJcmV0dXJuIDA7CiB9CiBFWFBPUlRfU1lNQk9MKHR0
bV9yYW5nZV9tYW5fZmluaSk7Ci0KLXN0YXRpYyB2b2lkIHR0bV9yYW5nZV9tYW5fZGVidWcoc3Ry
dWN0IHR0bV9yZXNvdXJjZV9tYW5hZ2VyICptYW4sCi0JCQkJc3RydWN0IGRybV9wcmludGVyICpw
cmludGVyKQotewotCXN0cnVjdCB0dG1fcmFuZ2VfbWFuYWdlciAqcm1hbiA9IHRvX3JhbmdlX21h
bmFnZXIobWFuKTsKLQotCXNwaW5fbG9jaygmcm1hbi0+bG9jayk7Ci0JZHJtX21tX3ByaW50KCZy
bWFuLT5tbSwgcHJpbnRlcik7Ci0Jc3Bpbl91bmxvY2soJnJtYW4tPmxvY2spOwotfQotCi1zdGF0
aWMgY29uc3Qgc3RydWN0IHR0bV9yZXNvdXJjZV9tYW5hZ2VyX2Z1bmMgdHRtX3JhbmdlX21hbmFn
ZXJfZnVuYyA9IHsKLQkuYWxsb2MgPSB0dG1fcmFuZ2VfbWFuX2FsbG9jLAotCS5mcmVlID0gdHRt
X3JhbmdlX21hbl9mcmVlLAotCS5kZWJ1ZyA9IHR0bV9yYW5nZV9tYW5fZGVidWcKLX07Ci0tIAoy
LjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
