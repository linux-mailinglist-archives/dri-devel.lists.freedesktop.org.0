Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C982C58FB5
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 03:26:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26F346E871;
	Fri, 28 Jun 2019 01:26:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A6A6E358
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 17:41:18 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id i2so1683142plt.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 10:41:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=2vqCu+MS+Img9r2z6/QFX/3aEGn5jsBEl1RMM1fPhso=;
 b=UJbYQMEtZNrvxIhwGTb/krtT/pD6dYIyiaqU2LZUZJBdjDVHyibAK+oWtXvau32kpz
 RKxuYQwXSMLeFUtmimQ+i6zI0BENT0ehTAbqsNnW4LRehYDA6DiiVTO1LGwFXkCUyItV
 gazue6gqhbYRnSRlw+7346LsroPeIv3+b7T39Kkp+2Q0TmqybHCKtzvwYN0kX8/fooLq
 f6n/nmZImCVa8g1crFHPIPpSbTkc/PqDk0EGlZRJBjuobcBr3RLwjvsxHE3MxU+AH8Qx
 QVLTus38AIlU8is1GYFbvvsl9I7dW3jJ+L+F4wJrQzU6LLpN3ndEWCU3+IE9WaFJ2tve
 qudQ==
X-Gm-Message-State: APjAAAUm5jz8sord1qIAPskoHUVlttWkwUOm7WqGvDoOZTf2+bqplxP/
 5ImC8Vo+ABrF6HlhmUKI+XQ=
X-Google-Smtp-Source: APXvYqzgLCO90CGyAwGqPwTMFiEbXZce1PzG6M5RXLVuf6Fyllzefu3WCmJL+Xt1cxzzZq5XfM4oYQ==
X-Received: by 2002:a17:902:2862:: with SMTP id
 e89mr6076022plb.258.1561657278472; 
 Thu, 27 Jun 2019 10:41:18 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.googlemail.com with ESMTPSA id y17sm3052099pfe.148.2019.06.27.10.41.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Jun 2019 10:41:18 -0700 (PDT)
From: Fuqian Huang <huangfq.daxian@gmail.com>
To: 
Subject: [PATCH 45/87] fbdev: mmp: remove memset after dma_alloc_coherent in
 mmpfb.c
Date: Fri, 28 Jun 2019 01:41:09 +0800
Message-Id: <20190627174110.4345-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
X-Mailman-Approved-At: Fri, 28 Jun 2019 01:25:51 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=2vqCu+MS+Img9r2z6/QFX/3aEGn5jsBEl1RMM1fPhso=;
 b=sBPEu6SKdGSe3KC2j9VKeyQAWYZFWhUaBNyBzY50g1OX35jQJxTbR1eIVKhJ3wYYlg
 8TZ3auYUbbo76pqTOESCWFq4s+l7qWu54nsy1UmsNN0MQrwPy2bEcKXplRK1ALMgDBdn
 Lo0Sv7JieRzOtAKtg0uvcuOIVVf/m+L9hlgzna2q40pDU536YVS70rhWUpXg59jINrii
 aIR69ZEUmRWqLKpZODOA93V2ehqAwgJt6+YCzA9K9645HfSUXdfjmeus6hJEQb3DEXAR
 VRKEMUKYya9WK+kUgqpf6Ill88GLTde84hbbCZgsi+0ADWTGa+AgvSD6yhK2AY70va4u
 GERA==
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>, linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jilayne Lovejoy <opensource@jilayne.com>,
 Fuqian Huang <huangfq.daxian@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gY29tbWl0IGFmN2RkZDhhNjI3YwooIk1lcmdlIHRhZyAnZG1hLW1hcHBpbmctNC4yMScgb2Yg
Z2l0Oi8vZ2l0LmluZnJhZGVhZC5vcmcvdXNlcnMvaGNoL2RtYS1tYXBwaW5nIiksCmRtYV9hbGxv
Y19jb2hlcmVudCBoYXMgYWxyZWFkeSB6ZXJvZWQgdGhlIG1lbW9yeS4KU28gbWVtc2V0IGlzIG5v
dCBuZWVkZWQuCgpTaWduZWQtb2ZmLWJ5OiBGdXFpYW4gSHVhbmcgPGh1YW5nZnEuZGF4aWFuQGdt
YWlsLmNvbT4KLS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L21tcC9mYi9tbXBmYi5jIHwgMSAtCiAx
IGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8v
ZmJkZXYvbW1wL2ZiL21tcGZiLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L21tcC9mYi9tbXBmYi5j
CmluZGV4IGU1YjU2ZjIxOTlkZi4uNDdiYzdjNTliYmQ4IDEwMDY0NAotLS0gYS9kcml2ZXJzL3Zp
ZGVvL2ZiZGV2L21tcC9mYi9tbXBmYi5jCisrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvbW1wL2Zi
L21tcGZiLmMKQEAgLTYxMiw3ICs2MTIsNiBAQCBzdGF0aWMgaW50IG1tcGZiX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJCXJldCA9IC1FTk9NRU07CiAJCWdvdG8gZmFpbGVk
X2Rlc3Ryb3lfbXV0ZXg7CiAJfQotCW1lbXNldChmYmktPmZiX3N0YXJ0LCAwLCBmYmktPmZiX3Np
emUpOwogCWRldl9pbmZvKGZiaS0+ZGV2LCAiZmIgJWRrIGFsbG9jYXRlZFxuIiwgZmJpLT5mYl9z
aXplLzEwMjQpOwogCiAJLyogZmIgcG93ZXIgb24gKi8KLS0gCjIuMTEuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
