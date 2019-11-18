Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4D9100071
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 09:37:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D06996E059;
	Mon, 18 Nov 2019 08:36:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A186289286
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 08:09:24 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id r18so9228403pgu.13
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 00:09:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=96Jv+F63R6aum6CI5bKoo8dntfo3syH700hNBAldzf8=;
 b=Ng9YdCxzr9K2mxFyAb1O4PQebbKyshecVKlXa5kmlRT6gcfDm+BPL0Pv9l5AMRo470
 /Pn9ZoyAWHV1Z8A9bJIEVmKT6MA9whrTU7fcv3nmKPQ+dqAIcNFlg5tVDkno+QbF4qqR
 lomQJ43QWfRKzapeBk8qzX8Iwveo8BiEMwz7iA9B9xPaLWMj2O6r+p+ic4qe9pLyxpQG
 t209rvbtmC/lkK+2we5RplNeCawtd0M/Iy60YpQ8lJ6f4SxsKsPzqUrHexCxDwStHAIo
 iTo6YcTPGc80SkOZJXnOew2JjoizTtDGmoE25Np+9G0aqJj8lgzwjx9ptqjp4qQBxiB2
 iI/g==
X-Gm-Message-State: APjAAAXOIrDmLx0bqCbWcCXWKg2YD85m5aJ8fvE+1CFPl+97YRtC16g2
 DGWv9tgr/esClhPyifO/g7ttrZBoVPI=
X-Google-Smtp-Source: APXvYqzjFt0/x4mB7FohRQ9b9vlwzOtiZh/8bPuVRz3hqRm7Lt9yGKIuzG2iC5DYctLdX+LitE5B9w==
X-Received: by 2002:aa7:9ad0:: with SMTP id x16mr32892615pfp.51.1574064564418; 
 Mon, 18 Nov 2019 00:09:24 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.gmail.com with ESMTPSA id c184sm21006699pfc.159.2019.11.18.00.09.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 00:09:23 -0800 (PST)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH v2] gpu: ipu-v3: prg: add missed operations in remove
Date: Mon, 18 Nov 2019 16:09:14 +0800
Message-Id: <20191118080914.30691-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 18 Nov 2019 08:36:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=96Jv+F63R6aum6CI5bKoo8dntfo3syH700hNBAldzf8=;
 b=fk0Q7PQR6sggjT/MeuTdZYxZ6Ho5mFEHEsfpIFfbwrORvP5xp1sKbzGN0mqVIRxjUo
 Ylmn38Z8xUjdm6k+SHZMU8oGxbOezNxX1Rw5GgGfPybr2XxoklQ1ss8ikQUo8YIyX/Tz
 K7eOgI7fQB7f/VLgZ4R3UfCbiimRq2Vw9l3uJK7nesK6Kw9Ina461d/Q2wYMKcj24GXr
 wYOkJUoN/lnVXgtw7zJ4JADXtKPIVFxU4u0ofka17np5TXluHMajPWgYqymhOgaphNDW
 vgYRbGKlEPgeKQh+H5y8916JAZ15mqK6OzUdJyuJRauX9nRDe604D0Qyucq26NTGygyp
 fQ9A==
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
Cc: Chuhong Yuan <hslester96@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBkcml2ZXIgZm9yZ2V0cyB0byBjYWxsIHBtX3J1bnRpbWVfZGlzYWJsZSBhbmQgY2xrX2Rp
c2FibGVfdW5wcmVwYXJlCmluIHJlbW92ZS4KQWRkIHRoZSBjYWxscyB0byBmaXggaXQuCgpTaWdu
ZWQtb2ZmLWJ5OiBDaHVob25nIFl1YW4gPGhzbGVzdGVyOTZAZ21haWwuY29tPgotLS0KQ2hhbmdl
cyBpbiB2MjoKICAtIEFkZCB0aGUgbWlzc2VkIHBtX3J1bnRpbWVfZGlzYWJsZS4KCiBkcml2ZXJz
L2dwdS9pcHUtdjMvaXB1LXByZy5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9pcHUtdjMvaXB1LXByZy5jIGIvZHJpdmVy
cy9ncHUvaXB1LXYzL2lwdS1wcmcuYwppbmRleCAxOTY3OTdjMWI0YjMuLjg5N2RhNjA1ZGE1NSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvaXB1LXYzL2lwdS1wcmcuYworKysgYi9kcml2ZXJzL2dw
dS9pcHUtdjMvaXB1LXByZy5jCkBAIC00MzAsNiArNDMwLDkgQEAgc3RhdGljIGludCBpcHVfcHJn
X3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCWxpc3RfZGVsKCZwcmctPmxp
c3QpOwogCW11dGV4X3VubG9jaygmaXB1X3ByZ19saXN0X211dGV4KTsKIAorCXBtX3J1bnRpbWVf
ZGlzYWJsZSgmcGRldi0+ZGV2KTsKKwljbGtfZGlzYWJsZV91bnByZXBhcmUocHJnLT5jbGtfYXhp
KTsKKwljbGtfZGlzYWJsZV91bnByZXBhcmUocHJnLT5jbGtfaXBnKTsKIAlyZXR1cm4gMDsKIH0K
IAotLSAKMi4yNC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
