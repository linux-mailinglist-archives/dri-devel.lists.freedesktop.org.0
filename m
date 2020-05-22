Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DA01DF669
	for <lists+dri-devel@lfdr.de>; Sat, 23 May 2020 11:35:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F00F56EA54;
	Sat, 23 May 2020 09:35:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C38626E14D
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 12:15:31 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id w7so9908993wre.13
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 05:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MqKlTlI+jL2VDjBfx2LR4RfYSJ6TxxTjbq+FxFCrZBE=;
 b=UMGkWtsZqgwvlZC8HG1M+DvirXa6xQd1eAxEg7YK3NYlauJmJK+nm+klyoAJ5fm4ql
 xINQoOWssX8s+UfhANdgsxdaGfszyvCNK3z+E4jHxLPC4oj/C6HbzFIinjMARd+ZPUFk
 9i8cSOuwC1LKvCsanROriaFsrX1ZH6kIIM0ykPInG8BbET+OiVPxQbMevV86G6l5D4vD
 72+/xkwbokkzeVb+ezhlTkFPBD1A8HntrcZZTtQraWhp7w1L2f7PLddanqQBUx7HSios
 QcKEedvc8ln2Er7z/DFPdTnOEcnxGUstl5GSTgzCkZq9+Rg5PexDzH9tihNuOQGfB6qy
 FeBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MqKlTlI+jL2VDjBfx2LR4RfYSJ6TxxTjbq+FxFCrZBE=;
 b=RSsp/UIQsSxgaB25w16tcSnKwW43D03Ge2wQMW0JijoQfrQUSaWxtjuDBDD0JxpcCv
 HUEbexdXFLGdjB58tIrDHik8Ukh5xJBkxwszZy38iOZmE4vCqMiW77bSq/XpF+TCKmCe
 pVHebSVRSjUdoZd5bxjoSJQeuL8E03WaHq44qhJ3fOsaM/cltB+gOr7feTKCpyhXVRYy
 GfOYFsl8/gmgphDJlZDqxZXjJB3KySePLUQD/XBTrtXlSyQJ7HvuRkc05d8mafNzNAS7
 7lp1bf7iC21ukGrJXfK3E1GWwslg+EFIjbkLdv91le8XVdLfqYOpgkxvpbmrqcAUAz9B
 VsHQ==
X-Gm-Message-State: AOAM532OV9limqqq+b0rU2BXzUUK+r5jmRzLvt9aG+sP7E9V5CMfcjn4
 p4+OSVrf85tK/tSqj3EAvhW71IEqxNA=
X-Google-Smtp-Source: ABdhPJzUXxfCKPsXkJ8dSLSrdTqxwZ40W15WTWItLVa5Qyf2iMlurFSmuCNwEiT0H0cYs9Coc+eUCg==
X-Received: by 2002:adf:ec87:: with SMTP id z7mr3538653wrn.149.1590149730368; 
 Fri, 22 May 2020 05:15:30 -0700 (PDT)
Received: from skynet.lan (159.red-83-44-12.dynamicip.rima-tde.net.
 [83.44.12.159])
 by smtp.gmail.com with ESMTPSA id g6sm9293784wrp.75.2020.05.22.05.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 05:15:29 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v4 3/5] mtd: rawnand: brcmnand: rename page sizes
Date: Fri, 22 May 2020 14:15:22 +0200
Message-Id: <20200522121524.4161539-4-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200522121524.4161539-1-noltari@gmail.com>
References: <20200522072525.3919332-1-noltari@gmail.com>
 <20200522121524.4161539-1-noltari@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 23 May 2020 09:33:36 +0000
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
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q3VycmVudCBwYWdlcyBzaXplcyBhcHBseSB0byBjb250cm9sbGVycyBhZnRlciB2My40CgpTaWdu
ZWQtb2ZmLWJ5OiDDgWx2YXJvIEZlcm7DoW5kZXogUm9qYXMgPG5vbHRhcmlAZ21haWwuY29tPgot
LS0KIHY0OiBubyBjaGFuZ2VzLgogdjM6IG5vIGNoYW5nZXMuCiB2MjogYWRkIG5ldyBwYXRjaC4K
CiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jIHwgNCArKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMgYi9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCmluZGV4IDcyYjI2OGQ4ZTNhNC4uZWY2MGRiYmVh
YzJiIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5j
CisrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKQEAgLTU3MSw3
ICs1NzEsNyBAQCBzdGF0aWMgaW50IGJyY21uYW5kX3JldmlzaW9uX2luaXQoc3RydWN0IGJyY21u
YW5kX2NvbnRyb2xsZXIgKmN0cmwpCiB7CiAJc3RhdGljIGNvbnN0IHVuc2lnbmVkIGludCBibG9j
a19zaXplc192NltdID0geyA4LCAxNiwgMTI4LCAyNTYsIDUxMiwgMTAyNCwgMjA0OCwgMCB9Owog
CXN0YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQgYmxvY2tfc2l6ZXNfdjRbXSA9IHsgMTYsIDEyOCwg
OCwgNTEyLCAyNTYsIDEwMjQsIDIwNDgsIDAgfTsKLQlzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50
IHBhZ2Vfc2l6ZXNbXSA9IHsgNTEyLCAyMDQ4LCA0MDk2LCA4MTkyLCAwIH07CisJc3RhdGljIGNv
bnN0IHVuc2lnbmVkIGludCBwYWdlX3NpemVzX3YzXzRbXSA9IHsgNTEyLCAyMDQ4LCA0MDk2LCA4
MTkyLCAwIH07CiAKIAljdHJsLT5uYW5kX3ZlcnNpb24gPSBuYW5kX3JlYWRyZWcoY3RybCwgMCkg
JiAweGZmZmY7CiAKQEAgLTYxOCw3ICs2MTgsNyBAQCBzdGF0aWMgaW50IGJyY21uYW5kX3Jldmlz
aW9uX2luaXQoc3RydWN0IGJyY21uYW5kX2NvbnRyb2xsZXIgKmN0cmwpCiAJCWN0cmwtPm1heF9w
YWdlX3NpemUgPSAxNiAqIDEwMjQ7CiAJCWN0cmwtPm1heF9ibG9ja19zaXplID0gMiAqIDEwMjQg
KiAxMDI0OwogCX0gZWxzZSB7Ci0JCWN0cmwtPnBhZ2Vfc2l6ZXMgPSBwYWdlX3NpemVzOworCQlj
dHJsLT5wYWdlX3NpemVzID0gcGFnZV9zaXplc192M180OwogCQlpZiAoY3RybC0+bmFuZF92ZXJz
aW9uID49IDB4MDYwMCkKIAkJCWN0cmwtPmJsb2NrX3NpemVzID0gYmxvY2tfc2l6ZXNfdjY7CiAJ
CWVsc2UKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
