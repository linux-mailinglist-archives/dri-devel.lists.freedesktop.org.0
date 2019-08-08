Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9A8862B6
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 15:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A0126E82F;
	Thu,  8 Aug 2019 13:14:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE21D6E82F;
 Thu,  8 Aug 2019 13:14:48 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id p74so2378438wme.4;
 Thu, 08 Aug 2019 06:14:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QXg8/50/m0qICIMMrj9BArF0ioly+QuNwMno0BPcCis=;
 b=NJFf/66ySRN3oYJr+C8e651eEkV3NlRpvHXUPOyvkGWU+FfIOeUM2XM0zlErtOE91h
 PAU1LBcjUrqS9pXU0OyKb/aeIROx2gMfh5HAVi1t3Ilwr7t1PXhLZ2RkGEJx60inTgZX
 +AaUDngyxwpk8cEQ5EI5LllCVtXBCP04drsPBJThhu/9bfTgEnMN9W3ztRIrJ2fU5oHD
 LbVkfdtwoUwI1TJI87oYSiLl6AeOnE8Zq4fh17BY8GJVGTZ+q8+LqSgbi17j7eOB6m78
 Ux5RtvOSTQ6gsWu4E1jiEDZWqfoUck8WhbRdXIQzNrr/sQVvrvZTN6u6Tm1IEQI9w7q0
 S5nw==
X-Gm-Message-State: APjAAAXHU+JnHCCmkD7J2MN0hu5hKDe5nxWmMyjcde2VEPf+2xI+rjq3
 olFCgsmQIc8kq4GAGaoHyi63l4rv
X-Google-Smtp-Source: APXvYqz4v7jvW8SeZLxgBZRe+Mur+zKiJsaWpJ/cyemYxpSuefyIwH4qfitJX9wD39m7n7u7ebgGZg==
X-Received: by 2002:a7b:cb51:: with SMTP id v17mr4379575wmj.20.1565270087414; 
 Thu, 08 Aug 2019 06:14:47 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:9969:2269:d9b7:abda])
 by smtp.gmail.com with ESMTPSA id b8sm82907518wrr.43.2019.08.08.06.14.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Aug 2019 06:14:46 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH] dma-buf: make dma_fence structure a bit smaller
Date: Thu,  8 Aug 2019 15:14:45 +0200
Message-Id: <20190808131445.23372-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QXg8/50/m0qICIMMrj9BArF0ioly+QuNwMno0BPcCis=;
 b=JrWkH/08LpKFenKS3BB1Sz3LBMpRUEPtE8Ed+vh8Hfr9aNkmBUr5YF5qeszncMqAf0
 uPl6zBe3MnSar3DNKshkqFTb9i5rwg/yD8GCTnG56QfdFQGGP/lNEfTFwaYFdajyJzKq
 bPKtW4CXlYqkMdQwOBn36oTbriRxeF98OMRRNcrxi2FLo0lhFP34ccZ6kEjD38qkR+eI
 Rt/5XlxpWq2TPQCvXFzHdYn7BkjKDCesQX7iT9o1O7sWAGgoG2tL1QwFP86AsvDMvS65
 WDXoay5LuumrIkeLdopMdBaT+AOYGYX5rD5nPwcHWPnnKKW30BLGPsQrv7Od1b67NdNv
 FcvQ==
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
Y3R1cmUgMTYlIHNtYWxsZXIuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+ClJldmlld2VkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNo
cmlzLXdpbHNvbi5jby51az4KLS0tCiBpbmNsdWRlL2xpbnV4L2RtYS1mZW5jZS5oIHwgNiArKysr
LS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9saW51eC9kbWEtZmVuY2UuaCBiL2luY2x1ZGUvbGludXgvZG1hLWZl
bmNlLmgKaW5kZXggMDVkMjlkYmM3ZTYyLi4zOTg1YzcyY2QwYzIgMTAwNjQ0Ci0tLSBhL2luY2x1
ZGUvbGludXgvZG1hLWZlbmNlLmgKKysrIGIvaW5jbHVkZS9saW51eC9kbWEtZmVuY2UuaApAQCAt
NjUsOCArNjUsMTAgQEAgc3RydWN0IGRtYV9mZW5jZV9jYjsKIHN0cnVjdCBkbWFfZmVuY2Ugewog
CXN0cnVjdCBrcmVmIHJlZmNvdW50OwogCWNvbnN0IHN0cnVjdCBkbWFfZmVuY2Vfb3BzICpvcHM7
Ci0Jc3RydWN0IHJjdV9oZWFkIHJjdTsKLQlzdHJ1Y3QgbGlzdF9oZWFkIGNiX2xpc3Q7CisJdW5p
b24geworCQlzdHJ1Y3QgcmN1X2hlYWQgcmN1OworCQlzdHJ1Y3QgbGlzdF9oZWFkIGNiX2xpc3Q7
CisJfTsKIAlzcGlubG9ja190ICpsb2NrOwogCXU2NCBjb250ZXh0OwogCXU2NCBzZXFubzsKLS0g
CjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
