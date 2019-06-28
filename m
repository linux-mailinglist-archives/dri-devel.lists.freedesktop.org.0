Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F33435961C
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 10:30:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1FA96E856;
	Fri, 28 Jun 2019 08:29:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE9D56E872
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 02:50:27 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id d126so2197916pfd.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 19:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=2vqCu+MS+Img9r2z6/QFX/3aEGn5jsBEl1RMM1fPhso=;
 b=izdda3pLv2BazIbHRTID/XO+1PegJfMwCqT6cBA3CzukMNjTgV79vNNDORTf3yNJ3q
 BpXkqd310gfARijabN0btJZPW0PF53nUaeqf/y454BsbCyaKKAjvvWvKV/CfLn+X5Kpi
 PTC1zRNsSe5xUxcl6LDTFxFlgBIHGXusRxBal5mlwXKIdW2fFArcoPyNEE4Gm2bM+9/P
 yhNjHLMSCITFSyfLfsML6kavt7vG44NBAuy8uAflgSkFibU/W77u4yMnSSrz6GyoQ7/6
 pNjRS1FyJi+QGcJ64n4pfyqK5+GSZAUztX4WMIsJrwuZ7zy+wZY/xtRx1fnXuNgVUi/T
 fwyQ==
X-Gm-Message-State: APjAAAWHMQOk32cQKTxqBKQJwUNEpHnI+P16TjtO5aEqHvQUW7Wvxpae
 9KPzXBTz1eEOuhQ8ZIhfGvo=
X-Google-Smtp-Source: APXvYqxOMn3XXjIavfVVVOqWwhv7qSskxdyUtP1LwXecHil9rj6KtvpibgLg5zqF2qKy3hz2y5R0Rw==
X-Received: by 2002:a17:90a:2768:: with SMTP id
 o95mr10104027pje.37.1561690227303; 
 Thu, 27 Jun 2019 19:50:27 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.googlemail.com with ESMTPSA id b37sm551587pjc.15.2019.06.27.19.50.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Jun 2019 19:50:26 -0700 (PDT)
From: Fuqian Huang <huangfq.daxian@gmail.com>
To: 
Subject: [PATCH v2 23/27] video: fbdev: remove unneeded memset after
 dma_alloc_coherent
Date: Fri, 28 Jun 2019 10:50:17 +0800
Message-Id: <20190628025019.16026-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
X-Mailman-Approved-At: Fri, 28 Jun 2019 08:29:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=2vqCu+MS+Img9r2z6/QFX/3aEGn5jsBEl1RMM1fPhso=;
 b=qeAMWzlrKSDx6Q/RRzQ4353QIEhM0VyBhhUnC1wyQkMGls5gBSuviEwbJazRlOBTMP
 jwC4bCg5bzKqWjBFjptrl6tQ9iA3S2OVKq9bsy9faiLXvEq8GzGjxXeZjB9Ny80MKKDN
 W8vOwnepdtxDJJ2rBZr8LsrUAqitVJRvvLFH9r8C1PLGYYelNJnQlEkTq1EdzQZMbr4H
 p4o1N2hPPhSX0v/QDs3dLY4oowijenSWg3AK/mE8AwoJ4runi7BvLowlsBYFcfSF2FmW
 tuSQok5Nuj+3gkv9ipd0BPVc0vG53orNw/I2GbCrOb//PPOBDRFNhQ0bP+kidjA6+esn
 cZnA==
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
Cc: linux-fbdev@vger.kernel.org,
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
