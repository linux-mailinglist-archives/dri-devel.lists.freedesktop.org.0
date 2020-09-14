Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2D1268C33
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 15:29:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 669FD89A88;
	Mon, 14 Sep 2020 13:29:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6388889709
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 13:29:31 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id a12so17566309eds.13
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 06:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ShM3ina3e3/hH7dOyVac4CL9sFVc4RQd6mh3jLnIlg0=;
 b=pUG+6EgLO2UPiBn6Yk4D2WmMQ/2yB7GdzCr1j99p7omOVBGUkd7OME2Fcch33BqK1h
 kRoISKMKO5KS64Eoe/fHBFeNwV6nFMzIKjBkMfXBmA4CS+3/ttEr8EbhVHNz9ZsbSKC+
 tYgEBRJJqVRXOcxWBasjfP0giKeqzan4zln/A47HPqfQB6JFTqJfBGpbRUO/fyQwbUal
 UdqQUeN+a9jSnmr+R3MdQ6PbF9DaVnJ+dE5LVNIofNGl83vr4fPPxwNAhIod4K+nZZ4S
 S/jizlrTm17N+FilPGRnJONY9iEJiG9iXj+/8ipwpTSCARh5J35nyMCPQkiynXVYWbZ+
 uZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ShM3ina3e3/hH7dOyVac4CL9sFVc4RQd6mh3jLnIlg0=;
 b=KpzIh9wykjIJyuF0l9wKx4mVA3js6UwTreby/eb8nYVtSasGDkCltA5GdiNdoGSom9
 lRvm/GQ89Ehb9zJYjF/rnUjZOpCXzjSa3ccwuGoEILT+zyd7UbJuPso8aUQy123NUUPO
 gSXf3L7ZtV9lpN5MNFzVDEWqOo2QTfD1f9PJr+RprjqIjXoc3UfOLVVBzBLY81ce019J
 eCq9/y97ks+b53hxhbZSy59aeRqxHJFpqDNLFL0Bh61ufXuDjqa5mO6s3Za96zekvSPL
 Ryk1yRcLC5p/AGhyoYj1PqBQqpvKBezLBGGnQE4vUK3rJLaD+Wzqi8NAjPZMyYljQ/uE
 N6NQ==
X-Gm-Message-State: AOAM530lyjdp7XB/vH6Se9W+GLFPn81rJeIj4eEz6w9REURZILgFCIna
 B6RHkwCuNt1ROQi0MCfvgHmF8C92npo=
X-Google-Smtp-Source: ABdhPJxDNWaaOe6mtDbVu9uBxPuALA0/yZsLGV/qaVVWO83ofnwCuhSwypEKZj15QfAv8gcowcwWvA==
X-Received: by 2002:a05:6402:17b9:: with SMTP id
 j25mr17411290edy.203.1600090170135; 
 Mon, 14 Sep 2020 06:29:30 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:6179:d701:8021:da3d])
 by smtp.gmail.com with ESMTPSA id d6sm9575625edm.31.2020.09.14.06.29.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 06:29:29 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: akpm@linux-foundation.org
Subject: [PATCH 1/2] drm/shmem-helpers: revert "Redirect mmap for imported
 dma-buf"
Date: Mon, 14 Sep 2020 15:29:19 +0200
Message-Id: <20200914132920.59183-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200914132920.59183-1-christian.koenig@amd.com>
References: <20200914132920.59183-1-christian.koenig@amd.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyByZXZlcnRzIGNvbW1pdCAyNmQzYWMzY2IwNGQxNzFhODYxOTUyZTg5MzI0ZTM0NzU5OGEz
NDdmLgoKV2UgbmVlZCB0byBmaWd1cmUgb3V0IGlmIGRtYV9idWZfbW1hcCgpIGlzIHZhbGlkIG9y
IG5vdCBmaXJzdC4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIu
YyB8IDMgLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZ2VtX3NobWVtX2hlbHBlci5jCmluZGV4IDBhOTUyZjI3YzE4NC4uY2Q3MjczNDNmNzJiIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYwpAQCAtNTk0LDkgKzU5NCw2IEBA
IGludCBkcm1fZ2VtX3NobWVtX21tYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIHN0cnVj
dCB2bV9hcmVhX3N0cnVjdCAqdm1hKQogCS8qIFJlbW92ZSB0aGUgZmFrZSBvZmZzZXQgKi8KIAl2
bWEtPnZtX3Bnb2ZmIC09IGRybV92bWFfbm9kZV9zdGFydCgmb2JqLT52bWFfbm9kZSk7CiAKLQlp
ZiAob2JqLT5pbXBvcnRfYXR0YWNoKQotCQlyZXR1cm4gZG1hX2J1Zl9tbWFwKG9iai0+ZG1hX2J1
Ziwgdm1hLCAwKTsKLQogCXNobWVtID0gdG9fZHJtX2dlbV9zaG1lbV9vYmoob2JqKTsKIAogCXJl
dCA9IGRybV9nZW1fc2htZW1fZ2V0X3BhZ2VzKHNobWVtKTsKLS0gCjIuMTcuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
