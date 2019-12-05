Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 571C4114D6C
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 09:18:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F244D6F972;
	Fri,  6 Dec 2019 08:17:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F036F8A4
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 16:07:21 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id x185so1821150pfc.5
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2019 08:07:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nk1cXD8ocqFBtC4Ixaba4spST22wd8UaYJyDzazVJTU=;
 b=KRfIa4xCUbPge3RbdQJCPPc6mFfCBXMSBGVQkEa+M6gSmYoa00SSEFFEgykuQUKlKI
 /oxO9PtdbBwr81nRVuqTCxNzxGcqkO+AJ3l694reH/s4NI910php0X6Kxy8uEHFqpr0o
 COSrxIy2AaA1aC6F2ctGPleGK8oaD3Mtp642CTZzib/cui28TirIwOAebp9bG5gr5YsA
 8LaWszEOvXtsLiczW6MKMWZ9nrgTmHIqSAeKtCVQ7xJ+iFv4ARTNtgTEsRNGkxB3zgjd
 cBhhawDnLGy5ijkRX9FBMHYRiR7mXEK4Uq3GVYcBXCmYAdCqK742mFlFzYkRVHAuy+jX
 gR8A==
X-Gm-Message-State: APjAAAV6L5WdFYUAuf+fzaJwsaRflL2IGKB6L4+wyRJlMdoER96eJwfD
 TM1peUTcDa1Z8bY0PVkFhAQ=
X-Google-Smtp-Source: APXvYqy9oKB9Ozl8hrB3SUfpSveBM41X9hsvRCH6URNhs4FJAED+cuPGdd9arO5yZ4Zj26NEgNPDFQ==
X-Received: by 2002:a63:3104:: with SMTP id x4mr9948531pgx.369.1575562040738; 
 Thu, 05 Dec 2019 08:07:20 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.gmail.com with ESMTPSA id m15sm11956980pgi.91.2019.12.05.08.07.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2019 08:07:20 -0800 (PST)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH v2] video: fbdev: vesafb: add missed release_region
Date: Fri,  6 Dec 2019 00:07:12 +0800
Message-Id: <20191205160712.32245-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 06 Dec 2019 08:17:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nk1cXD8ocqFBtC4Ixaba4spST22wd8UaYJyDzazVJTU=;
 b=Spso+1VBGEYjX599HKgBZ7LMPvTnErQh8OrWYDokzKb3zBSSaEgZ4u+I7C5EwKrVeR
 lUG3UW/5r65Fp75N8CBIUjv0os9y+d8jDXNVYICft9E6k/2uxzV9eTJm5v5FvsNpZo9o
 vf8MzxGjzeWRfcVXaeWb2sQNaDqMSv+/hIJ+IRH3BPxs3B1ykEPlsdshzdpXT6Xuwzcj
 EgGzERz2cVpnYAaW3kqMFAtCJQswy/cTqOwhu4EHNjgqlzgRKhF2SSB4NFAcFCCyDxfn
 UbFZIr3T0i9xpQA3xoaqCda2BYeVA5gwQcFMZGSDjcbHaEj8cfWg1pu9yAIv4xdZTwIg
 k00A==
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
Cc: linux-fbdev@vger.kernel.org, Chuhong Yuan <hslester96@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRyaXZlciBmb3JnZXRzIHRvIGZyZWUgdGhlIHJlcXVlc3RlZCBpcnEgaW4gcmVtb3ZlIGFu
ZCBwcm9iZQpmYWlsdXJlLgpBZGQgdGhlIG1pc3NlZCBjYWxscyB0byBmaXggaXQuCgpTaWduZWQt
b2ZmLWJ5OiBDaHVob25nIFl1YW4gPGhzbGVzdGVyOTZAZ21haWwuY29tPgotLS0KQ2hhbmdlcyBp
biB2MjoKICAtIE1vZGlmeSBjb21taXQgbWVzc2FnZS4KCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3Zl
c2FmYi5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvdmVzYWZiLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3Zl
c2FmYi5jCmluZGV4IGQ5YzA4ZjZjMjE1NS4uZmJiMTk2YThiYmY2IDEwMDY0NAotLS0gYS9kcml2
ZXJzL3ZpZGVvL2ZiZGV2L3Zlc2FmYi5jCisrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvdmVzYWZi
LmMKQEAgLTQ2OCw2ICs0NjgsNyBAQCBzdGF0aWMgaW50IHZlc2FmYl9wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpkZXYpCiAJZmJfaW5mbyhpbmZvLCAiJXMgZnJhbWUgYnVmZmVyIGRldmlj
ZVxuIiwgaW5mby0+Zml4LmlkKTsKIAlyZXR1cm4gMDsKIGVycjoKKwlyZWxlYXNlX3JlZ2lvbigw
eDNjMCwgMzIpOwogCWFyY2hfcGh5c193Y19kZWwocGFyLT53Y19jb29raWUpOwogCWlmIChpbmZv
LT5zY3JlZW5fYmFzZSkKIAkJaW91bm1hcChpbmZvLT5zY3JlZW5fYmFzZSk7CkBAIC00ODAsNiAr
NDgxLDcgQEAgc3RhdGljIGludCB2ZXNhZmJfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpCiB7CiAJc3RydWN0IGZiX2luZm8gKmluZm8gPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShw
ZGV2KTsKIAorCXJlbGVhc2VfcmVnaW9uKDB4M2MwLCAzMik7CiAJdW5yZWdpc3Rlcl9mcmFtZWJ1
ZmZlcihpbmZvKTsKIAlmcmFtZWJ1ZmZlcl9yZWxlYXNlKGluZm8pOwogCi0tIAoyLjI0LjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
