Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F31B1D0B93
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 11:10:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 848616E9CD;
	Wed, 13 May 2020 09:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE376E84F
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 07:33:35 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id y24so22112504wma.4
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 00:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jqkgqmkJOKoKq9LVMSsdUKqLeUylhGstfJdiNW1m0pU=;
 b=sMw5Ou1DxQ0gDVShwnb+r0jVY9OgvPxlTdxCYMUjeHxnjkdnMZEHlB/ETLFPEyrQTV
 f3UPUtvn02e8incuNsrA11dODEo8ERiZctXWIS9t+3PUT1b2uMacgCg3/Ld5pqCI6iSS
 jHNB9PxINIhrl5lkZjVJuurycwFhX7NfNY5F1P7ObmQLDN6gOj+iBSUkifaxIlHcgIaV
 R3TvhWGCzwiwQ8CDEHA0GKqkXovGyr1DhUAs93B7lppeobuG6EQ+WncjtZN1nOtfxt01
 F1pfYC+jfYvXSiySnTpWSwVxAj0mPGkNxduwk6Jgf4NEyPx2ePn7ttz4TKL+dz5uhjQq
 pAzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jqkgqmkJOKoKq9LVMSsdUKqLeUylhGstfJdiNW1m0pU=;
 b=ZEZnAT8W/9DJB34QcHp/lKytqpoDZwf4GHAYs/l+gR/a04SPaBOMwA2MBEXSZhbnMZ
 U0Cq7SnZmucblHgj+FjmjtzL9rNkOYk8dtV2Tfd2k9U3B1b6zCkYLs+zTIN32u6R9WSK
 Q9aY5NO80Dyi2ErerGDq0uTt6GcZSZBZQfD/h2pTnTq45BottdahJaj9NlvioKoNToxC
 xahQCpcZKTvYnvT3i0God52bPf5CtAyG6QbEcWXYb4dPEHjiAk/XXDVsNgki2Ynar3Yb
 x2ynTd0pN/ROVwu1mAdl6NCinw28AONJK3aU/p4+quIpglhGkWGMDBv+QC14frM1yIYE
 NJ3Q==
X-Gm-Message-State: AGi0PuYwqX4KEEzcqK/9GoAeB8ckj4VhgTa1Q3F3u3SNosF65ARSnnQF
 CrEMSHAX0UBBnw4cpTS9+yo=
X-Google-Smtp-Source: APiQypLLSffxSVovV7tqZUrpdXOgAzbPqHBnVWM76vtOVvD70huOXD6rxYEtuZXYxJgRz4MPLxVK8w==
X-Received: by 2002:a7b:c74d:: with SMTP id w13mr34531649wmk.36.1589268814233; 
 Tue, 12 May 2020 00:33:34 -0700 (PDT)
Received: from skynet.lan (198.red-83-49-57.dynamicip.rima-tde.net.
 [83.49.57.198])
 by smtp.gmail.com with ESMTPSA id d9sm5961197wmd.10.2020.05.12.00.33.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 00:33:33 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v2 1/5] mtd: rawnand: brcmnand: rename v4 registers
Date: Tue, 12 May 2020 09:33:25 +0200
Message-Id: <20200512073329.742893-2-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512073329.742893-1-noltari@gmail.com>
References: <20200510151406.2527856-1-noltari@gmail.com>
 <20200512073329.742893-1-noltari@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 13 May 2020 09:09:29 +0000
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

VGhlc2UgcmVnaXN0ZXJzIGFyZSBhbHNvIHVzZWQgb24gdjMuMy4KClNpZ25lZC1vZmYtYnk6IMOB
bHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9sdGFyaUBnbWFpbC5jb20+ClJldmlld2VkLWJ5OiBN
aXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgotLS0KIHYyOiBmaXggY29t
bWl0IHRpdGxlLgoKIGRyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMgfCA4
ICsrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMg
Yi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCmluZGV4IGU0ZTNjZWVh
YzM4Zi4uNmEwOGRkMDdiMDU4IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNt
bmFuZC9icmNtbmFuZC5jCisrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21u
YW5kLmMKQEAgLTMzOCw4ICszMzgsOCBAQCBlbnVtIGJyY21uYW5kX3JlZyB7CiAJQlJDTU5BTkRf
RkNfQkFTRSwKIH07CiAKLS8qIEJSQ01OQU5EIHY0LjAgKi8KLXN0YXRpYyBjb25zdCB1MTYgYnJj
bW5hbmRfcmVnc192NDBbXSA9IHsKKy8qIEJSQ01OQU5EIHYzLjMtdjQuMCAqLworc3RhdGljIGNv
bnN0IHUxNiBicmNtbmFuZF9yZWdzX3YzM1tdID0gewogCVtCUkNNTkFORF9DTURfU1RBUlRdCQk9
ICAweDA0LAogCVtCUkNNTkFORF9DTURfRVhUX0FERFJFU1NdCT0gIDB4MDgsCiAJW0JSQ01OQU5E
X0NNRF9BRERSRVNTXQkJPSAgMHgwYywKQEAgLTU5MSw4ICs1OTEsOCBAQCBzdGF0aWMgaW50IGJy
Y21uYW5kX3JldmlzaW9uX2luaXQoc3RydWN0IGJyY21uYW5kX2NvbnRyb2xsZXIgKmN0cmwpCiAJ
CWN0cmwtPnJlZ19vZmZzZXRzID0gYnJjbW5hbmRfcmVnc192NjA7CiAJZWxzZSBpZiAoY3RybC0+
bmFuZF92ZXJzaW9uID49IDB4MDUwMCkKIAkJY3RybC0+cmVnX29mZnNldHMgPSBicmNtbmFuZF9y
ZWdzX3Y1MDsKLQllbHNlIGlmIChjdHJsLT5uYW5kX3ZlcnNpb24gPj0gMHgwNDAwKQotCQljdHJs
LT5yZWdfb2Zmc2V0cyA9IGJyY21uYW5kX3JlZ3NfdjQwOworCWVsc2UgaWYgKGN0cmwtPm5hbmRf
dmVyc2lvbiA+PSAweDAzMDMpCisJCWN0cmwtPnJlZ19vZmZzZXRzID0gYnJjbW5hbmRfcmVnc192
MzM7CiAKIAkvKiBDaGlwLXNlbGVjdCBzdHJpZGUgKi8KIAlpZiAoY3RybC0+bmFuZF92ZXJzaW9u
ID49IDB4MDcwMSkKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
