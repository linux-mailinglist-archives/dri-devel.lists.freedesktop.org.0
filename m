Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 172FB82CA8
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 09:25:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C385E89ECD;
	Tue,  6 Aug 2019 07:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54A4789CB5;
 Mon,  5 Aug 2019 17:33:05 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id g2so39998280pfq.0;
 Mon, 05 Aug 2019 10:33:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=GegYP27ap/p3G8SBviHV6N7Vu1ERd/zMPfU/qhoNIeM=;
 b=fCKNDFgcB/0G40dKJBE0vCr2XNjGc4HoiudeR9+uetCCyvxmU+kwOJO6y6HN94atqK
 WWH7QNBzzeyw5DE+ceja1S2ec+o0Cg7KIDWQloHaQ1X2w9bHd9pQcGxf4Kr6BNBExhO3
 KkOUiHXYTsLIJuGBoktWDuFSku+Ibae0OZWvpiXuAutMQwk6ZIVmUoBzkWU5pky/Ggex
 TKeFUHeaNKgiR/ShjuQjQ2Y73//Q02gA0rVJN3Ce6VqUguWc6Z2Ptv3DwfbWoH+9lTDO
 Z4GZcgNR6DXkjf9dVUdQCsaWBraMEjKgEQRdXwsVWezDQ5EW2cF5A1ir/o0BESwE3Efq
 gCqA==
X-Gm-Message-State: APjAAAWV7JgkffrtcRdmMFvDOoWbd2vHMur2DIkL/B1PMxAjt7eE+Ub7
 lRugA/qCNC9ZBEt5LellNUI=
X-Google-Smtp-Source: APXvYqxqvm7FgDQ1x++fGRcjQMdeFmTM30hDs1BBABrx91EDQH/aSmG9K1fXdGnpuyOOGnebdinUuA==
X-Received: by 2002:a63:fb14:: with SMTP id
 o20mr124551233pgh.136.1565026384871; 
 Mon, 05 Aug 2019 10:33:04 -0700 (PDT)
Received: from hari-Inspiron-1545 ([183.83.86.126])
 by smtp.gmail.com with ESMTPSA id m4sm97624308pgs.71.2019.08.05.10.33.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Aug 2019 10:33:04 -0700 (PDT)
Date: Mon, 5 Aug 2019 23:02:57 +0530
From: Hariprasad Kelam <hariprasad.kelam@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Nikola Cornij <nikola.cornij@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Colin Ian King <colin.king@canonical.com>,
 Hariprasad Kelam <hariprasad.kelam@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] gpu: drm: amd: display: dc: dcn20: Remove redudant condition
Message-ID: <20190805173257.GA4917@hari-Inspiron-1545>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Tue, 06 Aug 2019 07:24:35 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=GegYP27ap/p3G8SBviHV6N7Vu1ERd/zMPfU/qhoNIeM=;
 b=Mkc2Y5wggfORlrTPCazdsbmper2mckVyD1fzbvQlbTLOBW/BQq8jfRuuM5veDF4vGS
 89CNGVXCiXDw5+f4gfZsrLGDurVw0votGH54MQ4P+vkBuSqsBh2oXQai2/EYd8j5kjP7
 zm/DfXKRnnz5ztFVAG16Sjfubr93w6/VvijekvPdKxn/TX2aXaHMcYJgujdS2CycGPMP
 Co58bTxjW3+jbRVvnnildIPPTXXQwOhuihD2I9R/DW+iOGRBVE1+wkaKl71p/JvAy01d
 arZ0H/pjzvRrIomAvJXcbLpRuXrNgn/azP3WHQB2Ac0Um4bmNbJetzCRBw7Otm8ol54p
 7foA==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVtb3ZlIHJlZHVkYW50IGNvZGl0aW9uICJkc2NfY2ZnLT5kY19kc2NfY2ZnLm51bV9zbGljZXNf
diIuCgpmaXhlcyBjb3Zlcml0eSBkZWZlY3QgMTQ1MTg1MwoKU2lnbmVkLW9mZi1ieTogSGFyaXBy
YXNhZCBLZWxhbSA8aGFyaXByYXNhZC5rZWxhbUBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2RzYy5jIHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2RzYy5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2RzYy5jCmluZGV4IGU4NzBjYWEuLjQyMTMzYmQg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9k
c2MuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfZHNj
LmMKQEAgLTMwMiw3ICszMDIsNyBAQCBzdGF0aWMgYm9vbCBkc2NfcHJlcGFyZV9jb25maWcoc3Ry
dWN0IGRpc3BsYXlfc3RyZWFtX2NvbXByZXNzb3IgKmRzYywgY29uc3Qgc3RydQogCQkgICAgZHNj
X2NmZy0+ZGNfZHNjX2NmZy5saW5lYnVmX2RlcHRoID09IDApKSk7CiAJQVNTRVJUKDk2IDw9IGRz
Y19jZmctPmRjX2RzY19jZmcuYml0c19wZXJfcGl4ZWwgJiYgZHNjX2NmZy0+ZGNfZHNjX2NmZy5i
aXRzX3Blcl9waXhlbCA8PSAweDNmZik7IC8vIDYuMCA8PSBiaXRzX3Blcl9waXhlbCA8PSA2My45
Mzc1CiAKLQlpZiAoIWRzY19jZmctPmRjX2RzY19jZmcubnVtX3NsaWNlc192IHx8ICFkc2NfY2Zn
LT5kY19kc2NfY2ZnLm51bV9zbGljZXNfdiB8fAorCWlmICghZHNjX2NmZy0+ZGNfZHNjX2NmZy5u
dW1fc2xpY2VzX3YgfHwKIAkJIShkc2NfY2ZnLT5kY19kc2NfY2ZnLnZlcnNpb25fbWlub3IgPT0g
MSB8fCBkc2NfY2ZnLT5kY19kc2NfY2ZnLnZlcnNpb25fbWlub3IgPT0gMikgfHwKIAkJIWRzY19j
ZmctPnBpY193aWR0aCB8fCAhZHNjX2NmZy0+cGljX2hlaWdodCB8fAogCQkhKChkc2NfY2ZnLT5k
Y19kc2NfY2ZnLnZlcnNpb25fbWlub3IgPT0gMSAmJiAvLyB2MS4xIGxpbmUgYnVmZmVyIGRlcHRo
IHJhbmdlOgotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
