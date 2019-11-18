Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D292F101AF3
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:05:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7BBB6EBC5;
	Tue, 19 Nov 2019 08:04:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E69D6E48F
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 11:41:59 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id e6so1551745pgi.11
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 03:41:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GUSVLZmMqCMWMeD0FT4xlPzHbtQaXySLAxO0s7N20fw=;
 b=o5K+/cyeXV4VBB0L8WQv6qlIJbdPhuUeqGGSo2NBUXW0Xq2p05kUEypt0xjIXcMezw
 FHKp+TDDDktU6UQVp7u0dbZkNplP9fvkDgAtsTpLQKMRn2SuTNtWPsJc5q1HteSL289S
 j0UBdnFgeSTtXv0mCevJxMrmu7M+Q/X6/1HeGeAnWCyJveA6bdscbuHTctKDYN4J1bmF
 Bm5Iba2/RJZLsM76xTSKdieytrJuHsonCH8K304nBWHNSFVkHUv3YNh6GPwBNV3Ad85w
 RukJbtlrH7w2xNsNF7C4tf3yNiDf0S1S0VmFKR1yL21EbcwFAvZUXAl8ndsJszU6jhG6
 Wuxw==
X-Gm-Message-State: APjAAAUMZy0tcex9Z4ojizOr937kUCjBnlb5T6TtccSzyN8kC5Ox7T0Z
 6kBCQ6uDnk9lszRa4LHchkc=
X-Google-Smtp-Source: APXvYqwlZhctfGUcf61eKwA95+64A55BOSGDXtVe6j8GQMt1TABUbYCgPWwT7eZpn3YAxZAoBaB9dw==
X-Received: by 2002:aa7:80d2:: with SMTP id a18mr15473101pfn.29.1574077319270; 
 Mon, 18 Nov 2019 03:41:59 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.gmail.com with ESMTPSA id m19sm19455324pgh.31.2019.11.18.03.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 03:41:58 -0800 (PST)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH] video: ssd1307fb: add the missed regulator_disable
Date: Mon, 18 Nov 2019 19:41:50 +0800
Message-Id: <20191118114150.25724-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 19 Nov 2019 08:04:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GUSVLZmMqCMWMeD0FT4xlPzHbtQaXySLAxO0s7N20fw=;
 b=OyaN94NXMpCVElZ8Jw1WSv1yyO+jM2NeUo+yFOKhRx4WUNFccidxt6IWuwEiFy84z+
 tNQg5QGqeNbQPOTBhrRHcHxbWgMkT157Ebb4Dz1jWP/askkCcH8pofzUjkl8IDLGkhC0
 Wr9nznlGpUgn+s3PUWzUS0mwNmyJPLvXaYhWsRrOuZixx63Bn7APNEKGoqcr7pV9LImk
 QU++7ig0TwtFloemfAXCPH9Pu8q1dVP8nAillJt4c6ATNHv54emIlGz6FX0EuTXP2xWJ
 ZXUK9J8VmhbowEhKNbgtceawRPuCkvQXlDFiRTo6I7mm+WemE1CBJ8P4uboM+bPfoO1f
 Ln8A==
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

VGhlIGRyaXZlciBmb3JnZXRzIHRvIGRpc2FibGUgdGhlIHJlZ3VsYXRvciBpbiByZW1vdmUgbGlr
ZSB3aGF0IGlzIGRvbmUKaW4gcHJvYmUgZmFpbHVyZS4KQWRkIHRoZSBtaXNzZWQgY2FsbCB0byBm
aXggaXQuCgpTaWduZWQtb2ZmLWJ5OiBDaHVob25nIFl1YW4gPGhzbGVzdGVyOTZAZ21haWwuY29t
PgotLS0KIGRyaXZlcnMvdmlkZW8vZmJkZXYvc3NkMTMwN2ZiLmMgfCAyICsrCiAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9z
c2QxMzA3ZmIuYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvc3NkMTMwN2ZiLmMKaW5kZXggNzhjYTdm
ZmM0MGMyLi44MTlmYmVlMThkZGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvc3Nk
MTMwN2ZiLmMKKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9zc2QxMzA3ZmIuYwpAQCAtNzkxLDYg
Kzc5MSw4IEBAIHN0YXRpYyBpbnQgc3NkMTMwN2ZiX3JlbW92ZShzdHJ1Y3QgaTJjX2NsaWVudCAq
Y2xpZW50KQogCQlwd21fZGlzYWJsZShwYXItPnB3bSk7CiAJCXB3bV9wdXQocGFyLT5wd20pOwog
CX0KKwlpZiAocGFyLT52YmF0X3JlZykKKwkJcmVndWxhdG9yX2Rpc2FibGUocGFyLT52YmF0X3Jl
Zyk7CiAJZmJfZGVmZXJyZWRfaW9fY2xlYW51cChpbmZvKTsKIAlfX2ZyZWVfcGFnZXMoX192YShp
bmZvLT5maXguc21lbV9zdGFydCksIGdldF9vcmRlcihpbmZvLT5maXguc21lbV9sZW4pKTsKIAlm
cmFtZWJ1ZmZlcl9yZWxlYXNlKGluZm8pOwotLSAKMi4yNC4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
