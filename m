Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B91FE8E686
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:35:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C136E8E7;
	Thu, 15 Aug 2019 08:34:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E688B6E05A
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 06:27:23 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id e11so146819pga.5
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 23:27:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ibx8hLmGfI0HFnEN8rgDtTXlnoeKgOQ33MgGH/Cf62I=;
 b=DzM9JJFJpD47VIdkbPY/C/i6u66M28up5/lG4QpSBlK8ZYa8syUKoyFanaPQiIXMV5
 iDFKA09gFBgQMHt51KjoDMA++p0dYeyraYLQqKtkh8Bp75KJ7Nz2kLRgTdY+sM1S/tqi
 2Ar6irFRcDLBVPsb2vX1PSqKH7CehgllN2vZqyV4J3uW9626QHLAKmbKK3eKRjPR4XD6
 MTbkhe2SAWFtASmGPvGSuIM1H+9j1hYwAMdGwwoMTftj5y0s3ABKU+OBS78SkopvnFiV
 AH+hMeszmQbaVuK4sfjonkidFGpShTrA7ZscVCEQOjfRxPOuSc4tcTv3jBw2ErTvLQUI
 HjTQ==
X-Gm-Message-State: APjAAAUG/vE5FRTM0WODSgTsVM7C4xH7oeaurZj7ePKEhoq3/j98gY+j
 zwbWJF7Fe8HixLcPx46RDQU=
X-Google-Smtp-Source: APXvYqxWKZdKuodrVWJAzbb9UMkztll3+RJHZbGwG7ibw+vZcY0oXPoxi0ofJEMVzTAm98Zer5Elmg==
X-Received: by 2002:a63:b20f:: with SMTP id x15mr34234519pge.453.1565677643586; 
 Mon, 12 Aug 2019 23:27:23 -0700 (PDT)
Received: from localhost.localdomain ([122.163.110.75])
 by smtp.gmail.com with ESMTPSA id f7sm104857165pfd.43.2019.08.12.23.27.20
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 23:27:23 -0700 (PDT)
From: Nishka Dasgupta <nishkadg.linux@gmail.com>
To: oleksandr_andrushchenko@epam.com, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org
Subject: [PATCH] drm/xen-front: Make structure fb_funcs constant
Date: Tue, 13 Aug 2019 11:57:11 +0530
Message-Id: <20190813062712.24993-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ibx8hLmGfI0HFnEN8rgDtTXlnoeKgOQ33MgGH/Cf62I=;
 b=IB3/UXaOwvdhrmNh27ty8Ii+onuD4FzDOyTyM8xWewA1ARXozSYH8FizkWFoHs3lz8
 1xWID5z3zlfc/InMLKBHSiUDesIxfimN2XwfHgkxRHhUJGDz49gGZR/5zQDCLyZmH+PR
 Hvj5h0P0U6tOWgFaVydWgXurfgnd5o/hOrDAN19NwJDHcW9PDrBxlIMq2ijTBNo9MxO9
 p/nl1M4CnO6LqHQYMtVjGH7p/51YYuhCiwiHreHj7NdgA8B0dvDbbWJz1FtsG936N1Ug
 Oaglbgo8IYsZSV+CkC7bnlXbf1VrX7XZ1Ufr+U+bAM0kvuBJ7/GeJD63JMjD2X+H/fg7
 Bu+Q==
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
Cc: Nishka Dasgupta <nishkadg.linux@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U3RhdGljIHN0cnVjdHVyZSBmYl9mdW5jcywgb2YgdHlwZSBkcm1fZnJhbWVidWZmZXJfZnVuY3Ms
IGlzIHVzZWQgb25seQp3aGVuIGl0IGlzIHBhc3NlZCB0byBkcm1fZ2VtX2ZiX2NyZWF0ZV93aXRo
X2Z1bmNzKCkgYXMgaXRzIGxhc3QKYXJndW1lbnQuIGRybV9nZW1fZmJfY3JlYXRlX3dpdGhfZnVu
Y3MgZG9lcyBub3QgbW9kaWZ5IGl0cyBsc3QgYXJndW1lbnQKKGZiX2Z1bmNzKSBhbmQgaGVuY2Ug
ZmJfZnVuY3MgaXMgbmV2ZXIgbW9kaWZpZWQuIFRoZXJlZm9yZSBtYWtlIGZiX2Z1bmNzCmNvbnN0
YW50IHRvIHByb3RlY3QgaXQgZnJvbSBmdXJ0aGVyIG1vZGlmaWNhdGlvbi4KSXNzdWUgZm91bmQg
d2l0aCBDb2NjaW5lbGxlLgoKU2lnbmVkLW9mZi1ieTogTmlzaGthIERhc2d1cHRhIDxuaXNoa2Fk
Zy5saW51eEBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250
X2ttcy5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250X2ttcy5j
IGIvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250X2ttcy5jCmluZGV4IGMyOTU1ZDM3
NTM5NC4uNGE5ODRmNDU1NTVlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9k
cm1fZnJvbnRfa21zLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250X2tt
cy5jCkBAIC00NSw3ICs0NSw3IEBAIHN0YXRpYyB2b2lkIGZiX2Rlc3Ryb3koc3RydWN0IGRybV9m
cmFtZWJ1ZmZlciAqZmIpCiAJZHJtX2dlbV9mYl9kZXN0cm95KGZiKTsKIH0KIAotc3RhdGljIHN0
cnVjdCBkcm1fZnJhbWVidWZmZXJfZnVuY3MgZmJfZnVuY3MgPSB7CitzdGF0aWMgY29uc3Qgc3Ry
dWN0IGRybV9mcmFtZWJ1ZmZlcl9mdW5jcyBmYl9mdW5jcyA9IHsKIAkuZGVzdHJveSA9IGZiX2Rl
c3Ryb3ksCiB9OwogCi0tIAoyLjE5LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
