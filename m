Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2735186301
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 15:22:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 148A36E833;
	Thu,  8 Aug 2019 13:22:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B9266E833;
 Thu,  8 Aug 2019 13:22:46 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id p13so20334426wru.10;
 Thu, 08 Aug 2019 06:22:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sVwVfjzRRycoraZYR1eOD8IrhXOmA6ZHD0oG9OO+JDo=;
 b=IoeF5wSmxtc9nfISUjjcNJ1k2TY8mTJc2PQQiHWS2G9Ax8A0TYJtEFFaUfkXOZLyHq
 aDNhxc8AFqjUbD/LVDwbQ8RzDBDCZfKqzthdp8U/kM0c+kqf+xFKA96ldlerhgIotOV4
 qnm1x5ptdaLrPLHswRHnvZcYyAyo44sMe4Z659FUdaGiB3zKntKmSzESrk4aVNnsqqiN
 2Z+5OjqWp57jAAZgLpezvcCT/Q760tolc88QooXZ2jIT5Gh5qqAB2CTQEoIz/wdFsdxB
 PgKpQMBCpRg0k1GK/t7/AKN/W82Mm0O2yAyFVgNtzpMNQN8C3C/meg7q4L2AYNJ1d4Au
 QmKA==
X-Gm-Message-State: APjAAAUIQdWIaMUJEtHUm7n4/sOA34/RI8uRI+JNL1EId9MtUDRy6NFg
 tLS7XC1jxiGSp2BQK5cJfuNrqw2N
X-Google-Smtp-Source: APXvYqxe5UDrur+I80kg75qILxnX6soEqoUOPUMrSNEMWBE9Kaoj1PbStABq6MzLB4ecBxkc3Lu9FA==
X-Received: by 2002:adf:fc81:: with SMTP id g1mr12942295wrr.78.1565270564778; 
 Thu, 08 Aug 2019 06:22:44 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:9969:2269:d9b7:abda])
 by smtp.gmail.com with ESMTPSA id o5sm3905225wrv.20.2019.08.08.06.22.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Aug 2019 06:22:44 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH] dma-buf: make dma_fence structure a bit smaller v2
Date: Thu,  8 Aug 2019 15:22:43 +0200
Message-Id: <20190808132243.23632-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sVwVfjzRRycoraZYR1eOD8IrhXOmA6ZHD0oG9OO+JDo=;
 b=hTG6jWrcTiROwe1qAItb2CQPPa/rhRAvKcpoLOqhcGOFq9QT7QbiEce7eDll2O6+X8
 iHwZygEru06vYdjoWdcMiu9QHSChc9JYMxb2Zoa35VRjjy7yTfpZBqnINlyw0ma45+mI
 sVEl9tcb2Pm7fzdLcu3ZB64xMSOkzd4LrImwIEtDFfmFttUQD6RAw58/9AAAF2BXSq7w
 JlG6FI1ttC2K/hK9aLY6hU1+XWPImks+OGr7i9Tm688xyxuqkAFjcP10Osd7SBSpNrVm
 8BJRXtvK1TuNtJGTWOP4wArMrKTW9L+G32fXALl+HIM4vGtW1m23GNkhuW7DeeqB9Sl8
 3ZYw==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgY2xlYXIgdGhlIGNhbGxiYWNrIGxpc3Qgb24ga3JlZl9wdXQgc28gdGhhdCBieSB0aGUgdGlt
ZSB3ZQpyZWxlYXNlIHRoZSBmZW5jZSBpdCBpcyB1bnVzZWQuIE5vIG9uZSBzaG91bGQgYmUgYWRk
aW5nIHRvIHRoZSBjYl9saXN0CnRoYXQgdGhleSBkb24ndCB0aGVtc2VsdmVzIGhvbGQgYSByZWZl
cmVuY2UgZm9yLgoKVGhpcyBzbWFsbCBjaGFuZ2UgaXMgYWN0dWFsbHkgbWFraW5nIHRoZSBzdHJ1
Y3R1cmUgMTYlIHNtYWxsZXIuCgp2MjogYWRkIHRoZSBjb21tZW50IHRvIHRoZSBjb2RlIGFzIHdl
bGwuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+ClJldmlld2VkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51
az4KLS0tCiBpbmNsdWRlL2xpbnV4L2RtYS1mZW5jZS5oIHwgMTAgKysrKysrKystLQogMSBmaWxl
IGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9p
bmNsdWRlL2xpbnV4L2RtYS1mZW5jZS5oIGIvaW5jbHVkZS9saW51eC9kbWEtZmVuY2UuaAppbmRl
eCAwNWQyOWRiYzdlNjIuLmJlYTFkMDVjZjUxZSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9k
bWEtZmVuY2UuaAorKysgYi9pbmNsdWRlL2xpbnV4L2RtYS1mZW5jZS5oCkBAIC02NSw4ICs2NSwx
NCBAQCBzdHJ1Y3QgZG1hX2ZlbmNlX2NiOwogc3RydWN0IGRtYV9mZW5jZSB7CiAJc3RydWN0IGty
ZWYgcmVmY291bnQ7CiAJY29uc3Qgc3RydWN0IGRtYV9mZW5jZV9vcHMgKm9wczsKLQlzdHJ1Y3Qg
cmN1X2hlYWQgcmN1OwotCXN0cnVjdCBsaXN0X2hlYWQgY2JfbGlzdDsKKwkvKiBXZSBjbGVhciB0
aGUgY2FsbGJhY2sgbGlzdCBvbiBrcmVmX3B1dCBzbyB0aGF0IGJ5IHRoZSB0aW1lIHdlCisJICog
cmVsZWFzZSB0aGUgZmVuY2UgaXQgaXMgdW51c2VkLiBObyBvbmUgc2hvdWxkIGJlIGFkZGluZyB0
byB0aGUgY2JfbGlzdAorCSAqIHRoYXQgdGhleSBkb24ndCB0aGVtc2VsdmVzIGhvbGQgYSByZWZl
cmVuY2UgZm9yLgorCSAqLworCXVuaW9uIHsKKwkJc3RydWN0IHJjdV9oZWFkIHJjdTsKKwkJc3Ry
dWN0IGxpc3RfaGVhZCBjYl9saXN0OworCX07CiAJc3BpbmxvY2tfdCAqbG9jazsKIAl1NjQgY29u
dGV4dDsKIAl1NjQgc2Vxbm87Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
