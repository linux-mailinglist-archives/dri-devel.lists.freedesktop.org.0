Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD86684B0
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 09:57:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 522FB89760;
	Mon, 15 Jul 2019 07:57:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95FB489826
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 03:20:23 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id w10so6998670pgj.7
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jul 2019 20:20:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=KmjmTx0cDkAe4BsoggF2c5USLaF9+w472czn75Hcufo=;
 b=qqsK6TopjfIgMPQb5iL95JSOj7+qVIW2LorsIUlicVzmkgSrEPyygZbEKENQ6ZcUkE
 ZSM1mZK7oBoJpFG+rqvbDq1xN2YwXSvwH8Sd5UiI3SrCLRgE/6JlBCS6eiPGAoiBy3dx
 1tEKbsjCITQwe3U9SUUfFDz7BArmfMcjf0zc9mk/h6bF/qAJgCXAd7DAC5bKYtp4YHyr
 udzhOpW2AgSjln/zVdQalWyFSOPm5smzsEG2ojRxvr77p0gYZXrnViR2SEutyLRdnmmH
 Rb0oolLqo0DBgR3sfGmvR9ok/287fvGt7frWLeMQxfbouwxUQ/T49q01DCtbeOtlyp+F
 mZHg==
X-Gm-Message-State: APjAAAXPANItpmDfkKcmcYw8z38w0mEVfnhqCgMRJP6A8S4JTQsIrJVl
 XKJccfKlxqFmav2417u/hoQ=
X-Google-Smtp-Source: APXvYqxHjzkaC+srO/ESTpNfjkimIX2OQWbqnxpKFEiSNS/7wssDV6FtTvwkIFT9kcz81LQd/+4Uhw==
X-Received: by 2002:a17:90b:8d8:: with SMTP id
 ds24mr26449164pjb.135.1563160823209; 
 Sun, 14 Jul 2019 20:20:23 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.googlemail.com with ESMTPSA id x1sm14037462pjo.4.2019.07.14.20.20.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 14 Jul 2019 20:20:22 -0700 (PDT)
From: Fuqian Huang <huangfq.daxian@gmail.com>
To: 
Subject: [PATCH v3 24/24] video: fbdev-MMP: Remove call to memset after
 dma_alloc_coherent
Date: Mon, 15 Jul 2019 11:20:17 +0800
Message-Id: <20190715032017.7311-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
X-Mailman-Approved-At: Mon, 15 Jul 2019 07:57:42 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=KmjmTx0cDkAe4BsoggF2c5USLaF9+w472czn75Hcufo=;
 b=GqJNyAPxH0Ml0g59SFjtNPvfI/nMwwEmQBiMDuIUmbJNxGEbQuUvp4UuHCxkb4848N
 mc8GAIRsEBzwiVFxp9+2z7sHhc2s6zCZY6p+z8V0oyeg5YjWZml7szMhxsuWYg5Kg8eJ
 7npQPI4AQEPuRJFUOjSIlLO+/pp32+xG+DZcylLjOlwElP60UxNrf8UGavSWXMtW4Maq
 /DBhmtm6BqdCNXAUc0g9J7267V2BPQ7BDPwOFG/EYl6r8K/sszLtpIroCvoh6ld1FuFP
 eFsVynfcUM/U9ebG1AZlUJ+GaLXNlfBCCD0Q0NY3xzeLdZOenyGS9aF/bGerjin5toUG
 fPiQ==
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
Cc: Fuqian Huang <huangfq.daxian@gmail.com>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gY29tbWl0IDUxOGEyZjE5MjVjMwooImRtYS1tYXBwaW5nOiB6ZXJvIG1lbW9yeSByZXR1cm5l
ZCBmcm9tIGRtYV9hbGxvY18qIiksCmRtYV9hbGxvY19jb2hlcmVudCBoYXMgYWxyZWFkeSB6ZXJv
ZWQgdGhlIG1lbW9yeS4KU28gbWVtc2V0IGlzIG5vdCBuZWVkZWQuCgpTaWduZWQtb2ZmLWJ5OiBG
dXFpYW4gSHVhbmcgPGh1YW5nZnEuZGF4aWFuQGdtYWlsLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjM6
CiAgLSBVc2UgYWN0dWFsIGNvbW1pdCByYXRoZXIgdGhhbiB0aGUgbWVyZ2UgY29tbWl0IGluIHRo
ZSBjb21taXQgbWVzc2FnZQoKIGRyaXZlcnMvdmlkZW8vZmJkZXYvbW1wL2ZiL21tcGZiLmMgfCAx
IC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92
aWRlby9mYmRldi9tbXAvZmIvbW1wZmIuYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvbW1wL2ZiL21t
cGZiLmMKaW5kZXggZTViNTZmMjE5OWRmLi40N2JjN2M1OWJiZDggMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvdmlkZW8vZmJkZXYvbW1wL2ZiL21tcGZiLmMKKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9t
bXAvZmIvbW1wZmIuYwpAQCAtNjEyLDcgKzYxMiw2IEBAIHN0YXRpYyBpbnQgbW1wZmJfcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkJcmV0ID0gLUVOT01FTTsKIAkJZ290byBm
YWlsZWRfZGVzdHJveV9tdXRleDsKIAl9Ci0JbWVtc2V0KGZiaS0+ZmJfc3RhcnQsIDAsIGZiaS0+
ZmJfc2l6ZSk7CiAJZGV2X2luZm8oZmJpLT5kZXYsICJmYiAlZGsgYWxsb2NhdGVkXG4iLCBmYmkt
PmZiX3NpemUvMTAyNCk7CiAKIAkvKiBmYiBwb3dlciBvbiAqLwotLSAKMi4xMS4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
