Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FAC28733D
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 13:23:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73AE96E334;
	Thu,  8 Oct 2020 11:23:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA3E66E30D
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Oct 2020 11:23:46 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id g4so5474183edk.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Oct 2020 04:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=JsjjPHzjofiTjxIZU4zLpu7KElZkR0RdFNQVI4MgOuI=;
 b=Cf1RVSf2Wd5WKqBEQe/s36QG8XPfHBaG2UWWLmc7AROqUPPPQzryQaYWEUL3oqek8t
 bJAWEG3kKcAlgth9M38k2B/Nt+MG9IFqUTNhiYyms9eyVbvr8NcfwpPUj/XllhPiA0lR
 CEOK7HNJLYHG2ro7ZcBAavoxQL+en5L6fLiIqlSMlj8iywTFoAQE8nxzlrsyLbgjMxpi
 aofcNv/eTwnrxMk1doVKqyCl2Lzj63kYoISdf1LGyZfeO4qxt1PCfDKoVBAEDuVy+NFE
 Aa5I9mDCi/xhlOeDfBYRqyWBA93TrkNz+9HNhzXjHl+Z5vLOKICpcpqiYFyy5VDMaDh4
 4ZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JsjjPHzjofiTjxIZU4zLpu7KElZkR0RdFNQVI4MgOuI=;
 b=JKf1ntOM8ex1qJbWHaIEAlOsCto5OxVRT34k12nw3nJFqMpz9L8mgyqmqVbLFrlULX
 pJ9ZhwCfd3POZOhYFRF4cnrssLLjA6fsUc0rGox31NhjIItIw/keeh9PXLE8iebkFBX/
 EzdJJ//psGzwzlaU6uGYeeYG+tQjXjMksF+pM+wEYG9ID6eoS+qq7tPxVnuhNBMzz2uM
 1EalO78BRmD6EHIRw3X24EGofd8syKwm9yqRnYKa800xjDdKY2/agFds7pyoZQEuR/XY
 NW4gj9kxjqmp+dTKa5Pppn2ozGkK/ngnuenHzhAsWl3bd7XBDgVR+8NxTXAMJ28IDkgk
 obAA==
X-Gm-Message-State: AOAM530eB9vTbmJ7UY7uG9Ev1jSNJRvb+co8zeWFgrfRQorIfRfTu4D9
 8y1VXsUVdtJyJbJ+gXFyezo=
X-Google-Smtp-Source: ABdhPJwDRyJHE6THipTubGPFIEhicDT26J0ZkLEqMYptkgqx4YSyy8HXoku93odOoEECNMopX74sdQ==
X-Received: by 2002:aa7:c7c2:: with SMTP id o2mr8673537eds.366.1602156225590; 
 Thu, 08 Oct 2020 04:23:45 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:4c64:a9a0:5e0:905a])
 by smtp.gmail.com with ESMTPSA id i20sm3529030edv.96.2020.10.08.04.23.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2020 04:23:45 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, chris@chris-wilson.co.uk, airlied@redhat.com,
 akpm@linux-foundation.org, daniel@ffwll.ch, sumit.semwal@linaro.org
Subject: [PATCH 2/4] drm/prime: document that use the page array is deprecated
Date: Thu,  8 Oct 2020 13:23:40 +0200
Message-Id: <20201008112342.9394-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201008112342.9394-1-christian.koenig@amd.com>
References: <20201008112342.9394-1-christian.koenig@amd.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgaGF2ZSByZW9jY3VycmluZyByZXF1ZXN0cyBvbiB0aGlzIHNvIGJldHRlciBkb2N1bWVudCB0
aGF0CnRoaXMgYXBwcm9hY2ggZG9lc24ndCB3b3JrIGFuZCBkbWFfYnVmX21tYXAoKSBuZWVkcyB0
byBiZSB1c2VkIGluc3RlYWQuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jIHwg
NyArKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9wcmltZS5jCmluZGV4IDQ5MTBjNDQ2ZGI4My4uMTZmYTJiZmMyNzFlIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9wcmltZS5jCkBAIC05NTYsNyArOTU2LDcgQEAgRVhQT1JUX1NZTUJPTChkcm1fZ2VtX3ByaW1l
X2ltcG9ydCk7CiAvKioKICAqIGRybV9wcmltZV9zZ190b19wYWdlX2FkZHJfYXJyYXlzIC0gY29u
dmVydCBhbiBzZyB0YWJsZSBpbnRvIGEgcGFnZSBhcnJheQogICogQHNndDogc2NhdHRlci1nYXRo
ZXIgdGFibGUgdG8gY29udmVydAotICogQHBhZ2VzOiBvcHRpb25hbCBhcnJheSBvZiBwYWdlIHBv
aW50ZXJzIHRvIHN0b3JlIHRoZSBwYWdlIGFycmF5IGluCisgKiBAcGFnZXM6IGRlcHJlY2F0ZWQg
YXJyYXkgb2YgcGFnZSBwb2ludGVycyB0byBzdG9yZSB0aGUgcGFnZSBhcnJheSBpbgogICogQGFk
ZHJzOiBvcHRpb25hbCBhcnJheSB0byBzdG9yZSB0aGUgZG1hIGJ1cyBhZGRyZXNzIG9mIGVhY2gg
cGFnZQogICogQG1heF9lbnRyaWVzOiBzaXplIG9mIGJvdGggdGhlIHBhc3NlZC1pbiBhcnJheXMK
ICAqCkBAIC05NjUsNiArOTY1LDExIEBAIEVYUE9SVF9TWU1CT0woZHJtX2dlbV9wcmltZV9pbXBv
cnQpOwogICoKICAqIERyaXZlcnMgY2FuIHVzZSB0aGlzIGluIHRoZWlyICZkcm1fZHJpdmVyLmdl
bV9wcmltZV9pbXBvcnRfc2dfdGFibGUKICAqIGltcGxlbWVudGF0aW9uLgorICoKKyAqIFNwZWNp
ZnlpbmcgdGhlIHBhZ2VzIGFycmF5IGlzIGRlcHJlY2F0ZWQgYW5kIHN0cm9uZ2x5IGRpc2NvdXJh
Z2VkIGZvciBuZXcKKyAqIGRyaXZlcnMuIFRoZSBwYWdlcyBhcnJheSBpcyBvbmx5IHVzZWZ1bCBm
b3IgcGFnZSBmYXVsdHMgYW5kIHRob3NlIGNhbgorICogY29ycnVwdCBmaWVsZHMgaW4gdGhlIHN0
cnVjdCBwYWdlIGlmIHRoZXkgYXJlIG5vdCBoYW5kbGVkIGJ5IHRoZSBleHBvcnRpbmcKKyAqIGRy
aXZlci4KICAqLwogaW50IGRybV9wcmltZV9zZ190b19wYWdlX2FkZHJfYXJyYXlzKHN0cnVjdCBz
Z190YWJsZSAqc2d0LCBzdHJ1Y3QgcGFnZSAqKnBhZ2VzLAogCQkJCSAgICAgZG1hX2FkZHJfdCAq
YWRkcnMsIGludCBtYXhfZW50cmllcykKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
