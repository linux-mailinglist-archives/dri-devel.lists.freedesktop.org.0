Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B436A052
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 03:36:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 375306E064;
	Tue, 16 Jul 2019 01:36:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EEDA896BF;
 Mon, 15 Jul 2019 11:43:47 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id w24so8174205plp.2;
 Mon, 15 Jul 2019 04:43:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=C0fjdopnLQ/4XRxvrGWgg1WnG5V3U1P1HH2GQHIbWCw=;
 b=Vmsqro2+xiTV0z5M3C55Z+KRve5+JiY935Z/vn3SMkWAUSWpDEhqYUUjUQ0/feSnjk
 LjifMt2hdyPlvwC4vy6GkMkrSbcHp3nXB4xJ6dQQCp2laMQjjCKaSZSPgN4ftyK5ULdF
 30aDeqsdXI4z489mFVfMDHHbsfzqHZCaFr/JTzp//DlOejmystqghsImbFm9HjpjI6MO
 yZAK69LbwoF4X8efVPgepQJvGMwollUzEcPzSAgkBPg+0qGG3pg9SdRmhrIbjHwrzU6W
 ItcCNPMRJvnKafr+xhX1EMvJ/SSGT/plpImXwigxjYbH2TlVYUD73jM78TqpnmUZRcOG
 CgjQ==
X-Gm-Message-State: APjAAAWqlfhWgP39CAo6d3SVZj2ZBues7gRddBHUv3uRcqxt4BmtJnso
 Mlr8QRr2x49LVGYj6ItbEx4=
X-Google-Smtp-Source: APXvYqyuJna6D05VcCwk1rUi2rLdU30VgksXKoiFT/0HseqFHhm+JExT0uKnEZ444uE3xcPM4/aNJA==
X-Received: by 2002:a17:902:28c9:: with SMTP id
 f67mr28299180plb.19.1563191026650; 
 Mon, 15 Jul 2019 04:43:46 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.googlemail.com with ESMTPSA id u97sm16400840pjb.26.2019.07.15.04.43.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Jul 2019 04:43:46 -0700 (PDT)
From: Fuqian Huang <huangfq.daxian@gmail.com>
To: 
Subject: [PATCH] drm/amd/powerplay: remove redundant memset
Date: Mon, 15 Jul 2019 19:43:32 +0800
Message-Id: <20190715114332.24634-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
X-Mailman-Approved-At: Tue, 16 Jul 2019 01:36:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=C0fjdopnLQ/4XRxvrGWgg1WnG5V3U1P1HH2GQHIbWCw=;
 b=JNA2kjGCPtUcqzmfIYLCGAnyt6Fw8N62mZU6OHEB1L1Ctq8yKC42XkJ35VW6Z2hbUW
 mKPFd1dhG9VueCUY+YyH2C/7IX/zI2n9bY/kimX4zmAjbsTj/C7w42TwMbNyv+cMUyTb
 M6aQxhiUSyoagsGG9jHaD0KzNZJcFgS0pDbvuhBdXBLMsmj9YR//voSp7S4aDP/NTxOr
 vQlH5Qs4DZPFa9SDHVwFkAGjLU0/e3+BtCflurhKnH0RqeOu+FHlhA3gPfSW+62hf+y/
 I3aLm0JvPkwYd/EjM51PGhHiD/JrdDE/IQsrA/60RgYzeDaXM1mvTgJLshoFAFrukseM
 ivXg==
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Fuqian Huang <huangfq.daxian@gmail.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Evan Quan <evan.quan@amd.com>, Rex Zhu <rex.zhu@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

a3phbGxvYyBoYXMgYWxyZWFkeSB6ZXJvZWQgdGhlIG1lbW9yeS4KU28gdGhlIG1lbXNldCBpcyB1
bm5lZWRlZC4KClNpZ25lZC1vZmYtYnk6IEZ1cWlhbiBIdWFuZyA8aHVhbmdmcS5kYXhpYW5AZ21h
aWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYyB8
IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS92ZWdhMjBfcHB0LmMKaW5kZXggOGZhZmNiZGIxZGZkLi4wZmI2MDY2OTk3YjIg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMKQEAgLTEyOTUs
NyArMTI5NSw2IEBAIHN0YXRpYyBpbnQgdmVnYTIwX3NldF9kZWZhdWx0X29kOF9zZXR0dGluZ3Mo
c3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCiAJaWYgKCF0YWJsZV9jb250ZXh0LT5vZDhfc2V0dGlu
Z3MpCiAJCXJldHVybiAtRU5PTUVNOwogCi0JbWVtc2V0KHRhYmxlX2NvbnRleHQtPm9kOF9zZXR0
aW5ncywgMCwgc2l6ZW9mKHN0cnVjdCB2ZWdhMjBfb2Q4X3NldHRpbmdzKSk7CiAJb2Q4X3NldHRp
bmdzID0gKHN0cnVjdCB2ZWdhMjBfb2Q4X3NldHRpbmdzICopdGFibGVfY29udGV4dC0+b2Q4X3Nl
dHRpbmdzOwogCiAJaWYgKHNtdV9mZWF0dXJlX2lzX2VuYWJsZWQoc211LCBGRUFUVVJFX0RQTV9T
T0NDTEtfQklUKSkgewotLSAKMi4xMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
