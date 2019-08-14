Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5D08E05C
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 00:10:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF8B06E865;
	Wed, 14 Aug 2019 22:10:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 294286E865
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 22:10:05 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id d85so199061pfd.2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 15:10:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EgMxpqnDCUKKSviaeDfqej3uE+25ke/kBD5EQ8QhSvk=;
 b=AWhovuAirMkw7m9RWx79xyjAXxkUqTJbN6VVDp/W0brztCLpz/mP9VqY2CcpuP2VTY
 SAX3yU4Cf71T2yr7ZvX1XzjA5jf5QtQroQNWciu6cdbnuE+vmRL3uyHTBLL7pcnkkQJj
 DCW+kVfwv87ULzccTHW57pQxnDTTDUbS2DxQT7XkbyAUI2sVvDLwkZEvERSPOgqbXJxf
 lllZ2ORcVJspjl5ovvK2giiPFnKPx4fmb+PekvEWkOPKyW744PjILU1qjTzlVEtMTChR
 qHy9ly9sx6suqlsC/5YrX5K1tph6mmqWZ8y/MOLAe4+oyh+mw047iNmTGMapj7N05XQp
 20wQ==
X-Gm-Message-State: APjAAAWfHKXJl/aa2prXuoVltYHQgXgwboJpKxZnxP6V/NKvDSVld1Ho
 TPG7xnLU4ANPQBf4O4bZ6R0/bXb4CdZmLg==
X-Google-Smtp-Source: APXvYqxT0bYRzWmURPra22SeQuhBS+23yZe3pSx10q32MZ/PWreU7JH+YXqDftobAJdodjbhda6e0Q==
X-Received: by 2002:a63:de4c:: with SMTP id y12mr1125128pgi.264.1565820604373; 
 Wed, 14 Aug 2019 15:10:04 -0700 (PDT)
Received: from localhost ([100.118.89.196])
 by smtp.gmail.com with ESMTPSA id a189sm929015pfa.60.2019.08.14.15.10.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 15:10:03 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/6] powerpc: export arch_sync_dma_for_*()
Date: Wed, 14 Aug 2019 14:59:58 -0700
Message-Id: <20190814220011.26934-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190814220011.26934-1-robdclark@gmail.com>
References: <20190814220011.26934-1-robdclark@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EgMxpqnDCUKKSviaeDfqej3uE+25ke/kBD5EQ8QhSvk=;
 b=BTIl/9TkKL1+c9ssk34W7XBCbm+8s/A7Aw49hrbdu/fvCvAhPq7IzZM6LQxNWC2QoE
 43Fy8M+wBoAaew0rOCWEYQwW7hi4OWCZw6V6ljV8i60R6zk3xV1oqtX+5OAjikb7TOo1
 euYSXyToMva4nrJeLoOG98FDCZPQBFYfVuK757KSMnKyMdqqDJ7hJn9O82GWwbVWL9Va
 YaafGnFOnoXjFAO3qaf7hnVlz6fUzZ9nRvXAT9cifyZdFjtDpGNfVhryES6wHppUEFRl
 N8nXSFKxcF2k8iMc+4q6OzgcKiepinofnK8FF77cgrT+mIe6oir15Gjrwq/AEM4yw+XV
 l75g==
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
Cc: Rob Clark <robdclark@chromium.org>,
 Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Thomas Gleixner <tglx@linutronix.de>,
 Enrico Weigelt <info@metux.net>, Christoph Hellwig <hch@lst.de>,
 Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKU2lnbmVkLW9mZi1ieTog
Um9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgotLS0KIGFyY2gvcG93ZXJwYy9tbS9k
bWEtbm9uY29oZXJlbnQuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvbW0vZG1hLW5vbmNvaGVyZW50LmMgYi9hcmNoL3Bv
d2VycGMvbW0vZG1hLW5vbmNvaGVyZW50LmMKaW5kZXggYzYxNzI4MmQ1YjJhLi44MGQ1M2I5NTA4
MjEgMTAwNjQ0Ci0tLSBhL2FyY2gvcG93ZXJwYy9tbS9kbWEtbm9uY29oZXJlbnQuYworKysgYi9h
cmNoL3Bvd2VycGMvbW0vZG1hLW5vbmNvaGVyZW50LmMKQEAgLTQwMSwxMiArNDAxLDE0IEBAIHZv
aWQgYXJjaF9zeW5jX2RtYV9mb3JfZGV2aWNlKHN0cnVjdCBkZXZpY2UgKmRldiwgcGh5c19hZGRy
X3QgcGFkZHIsCiB7CiAJX19kbWFfc3luY19wYWdlKHBhZGRyLCBzaXplLCBkaXIpOwogfQorRVhQ
T1JUX1NZTUJPTF9HUEwoYXJjaF9zeW5jX2RtYV9mb3JfZGV2aWNlKTsKIAogdm9pZCBhcmNoX3N5
bmNfZG1hX2Zvcl9jcHUoc3RydWN0IGRldmljZSAqZGV2LCBwaHlzX2FkZHJfdCBwYWRkciwKIAkJ
c2l6ZV90IHNpemUsIGVudW0gZG1hX2RhdGFfZGlyZWN0aW9uIGRpcikKIHsKIAlfX2RtYV9zeW5j
X3BhZ2UocGFkZHIsIHNpemUsIGRpcik7CiB9CitFWFBPUlRfU1lNQk9MX0dQTChhcmNoX3N5bmNf
ZG1hX2Zvcl9jcHUpOwogCiAvKgogICogUmV0dXJuIHRoZSBQRk4gZm9yIGEgZ2l2ZW4gY3B1IHZp
cnR1YWwgYWRkcmVzcyByZXR1cm5lZCBieSBhcmNoX2RtYV9hbGxvYy4KLS0gCjIuMjEuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
