Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B5510FB3
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2019 01:03:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00CF6892B9;
	Wed,  1 May 2019 23:03:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc4a.google.com (mail-yw1-xc4a.google.com
 [IPv6:2607:f8b0:4864:20::c4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF110892B9
 for <dri-devel@lists.freedesktop.org>; Wed,  1 May 2019 23:03:51 +0000 (UTC)
Received: by mail-yw1-xc4a.google.com with SMTP id e7so1102900ywa.15
 for <dri-devel@lists.freedesktop.org>; Wed, 01 May 2019 16:03:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=D2ed1P31yZM+QgJhlTzUd+8uEk27FFwdOzf2d998Bjo=;
 b=UXyuzPPsMbhGgbPK4nncjBLQjMcl4oLY1qJjzCZp5tTEniBRDbZ44OCpbUFa8pekDA
 lOkSfGZrMWfOlmFjY+/SHBdqXsv3//VC9TcnvymyY2uyOFwHGAYzs0g1JEXDuD2bsV8c
 cfRQ0Anp8eTwE+KQQFcBfYfK2z1Rlcpy+E4hxuTBp1lsvpS/DCXO5f1DmjO0ZBhUqL3l
 zRK+esiRe4e73pX8aAuOK4JJsg4d2X+5+SnzojthKEwamGWodQDja3QQ5UP0rouTsvlZ
 FsHOhSxxgVWIduOTc40YxbSFTYJ09gsunX5kAnCsJUbG6Wtr/uJaMWgu4JDENWA9Let2
 RtQQ==
X-Gm-Message-State: APjAAAXYi1oroqXaZ9LNOK2EQzr+NFxZMTIlynCWTe7evRk5wMS9TPyt
 BvlM2YfXTLInS++wltl0nqc0Gm1kTmTDs+AbCjPOLw==
X-Google-Smtp-Source: APXvYqyFMKmsofIlGtyIYxY2auw/Yjye1Kqb5EY69r+kXArsnv/jL7sTkqGRu0OAeuaZKfIN87CHtxO88oGy68C0yADwLw==
X-Received: by 2002:a25:6649:: with SMTP id z9mr362486ybm.25.1556751830941;
 Wed, 01 May 2019 16:03:50 -0700 (PDT)
Date: Wed,  1 May 2019 16:01:15 -0700
In-Reply-To: <20190501230126.229218-1-brendanhiggins@google.com>
Message-Id: <20190501230126.229218-7-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190501230126.229218-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
Subject: [PATCH v2 06/17] kbuild: enable building KUnit
From: Brendan Higgins <brendanhiggins@google.com>
To: frowand.list@gmail.com, gregkh@linuxfoundation.org, keescook@google.com, 
 kieran.bingham@ideasonboard.com, mcgrof@kernel.org, robh@kernel.org, 
 sboyd@kernel.org, shuah@kernel.org, 
 Masahiro Yamada <yamada.masahiro@socionext.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=D2ed1P31yZM+QgJhlTzUd+8uEk27FFwdOzf2d998Bjo=;
 b=m4vpSF6hFQAvyyKEfmi7ffOWm5Cf8YCWIkxIT3+iDVpIWfsS1ULEGwFu6Ost8hat7u
 rnhVAV5Vv9xJT6lOo63I/DHxpQiJpkpLAZN5u2XWO0V9OZ52Ydehqa5w7vEuBON6+gXZ
 3STK4kvqQOndMzEtqqLGS2SsTTQyPWssIWHMj8ElJqdMrQ0MviI+sSHecTz/rzS/tJ10
 CF6G0RJyeUDcEjoGw8kICUMbi8yNT0pIJerdnIVD9Od+WW+ixwtgrJBY3UFTTqTO2Fw3
 Zh8c7NNZ6oqBIahVmM/STUzcD/MOIBXoqKt5JLGq4l8hekE/mIoIfmXWjCZu/3iEiU9+
 WUKg==
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
Cc: pmladek@suse.com, linux-doc@vger.kernel.org, amir73il@gmail.com,
 Brendan Higgins <brendanhiggins@google.com>, dri-devel@lists.freedesktop.org,
 Alexander.Levin@microsoft.com, linux-kselftest@vger.kernel.org,
 linux-nvdimm@lists.01.org, khilman@baylibre.com, knut.omang@oracle.com,
 wfg@linux.intel.com, joel@jms.id.au, rientjes@google.com, jdike@addtoit.com,
 dan.carpenter@oracle.com, devicetree@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Tim.Bird@sony.com, linux-um@lists.infradead.org,
 rostedt@goodmis.org, julia.lawall@lip6.fr, dan.j.williams@intel.com,
 kunit-dev@googlegroups.com, richard@nod.at, linux-kernel@vger.kernel.org,
 mpe@ellerman.id.au, linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIEtVbml0IHRvIHJvb3QgS2NvbmZpZyBhbmQgTWFrZWZpbGUgYWxsb3dpbmcgaXQgdG8gYWN0
dWFsbHkgYmUgYnVpbHQuCgpTaWduZWQtb2ZmLWJ5OiBCcmVuZGFuIEhpZ2dpbnMgPGJyZW5kYW5o
aWdnaW5zQGdvb2dsZS5jb20+Ci0tLQogS2NvbmZpZyAgfCAyICsrCiBNYWtlZmlsZSB8IDIgKy0K
IDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvS2NvbmZpZyBiL0tjb25maWcKaW5kZXggNDhhODBiZWFiNjg1My4uMTA0Mjg1MDFlZGI3
OCAxMDA2NDQKLS0tIGEvS2NvbmZpZworKysgYi9LY29uZmlnCkBAIC0zMCwzICszMCw1IEBAIHNv
dXJjZSAiY3J5cHRvL0tjb25maWciCiBzb3VyY2UgImxpYi9LY29uZmlnIgogCiBzb3VyY2UgImxp
Yi9LY29uZmlnLmRlYnVnIgorCitzb3VyY2UgImt1bml0L0tjb25maWciCmRpZmYgLS1naXQgYS9N
YWtlZmlsZSBiL01ha2VmaWxlCmluZGV4IDJiOTk2NzkxNDhkYzcuLjc3MzY4ZjQ5OGQ4NGMgMTAw
NjQ0Ci0tLSBhL01ha2VmaWxlCisrKyBiL01ha2VmaWxlCkBAIC05NjksNyArOTY5LDcgQEAgZW5k
aWYKIFBIT05ZICs9IHByZXBhcmUwCiAKIGlmZXEgKCQoS0JVSUxEX0VYVE1PRCksKQotY29yZS15
CQkrPSBrZXJuZWwvIGNlcnRzLyBtbS8gZnMvIGlwYy8gc2VjdXJpdHkvIGNyeXB0by8gYmxvY2sv
Citjb3JlLXkJCSs9IGtlcm5lbC8gY2VydHMvIG1tLyBmcy8gaXBjLyBzZWN1cml0eS8gY3J5cHRv
LyBibG9jay8ga3VuaXQvCiAKIHZtbGludXgtZGlycwk6PSAkKHBhdHN1YnN0ICUvLCUsJChmaWx0
ZXIgJS8sICQoaW5pdC15KSAkKGluaXQtbSkgXAogCQkgICAgICQoY29yZS15KSAkKGNvcmUtbSkg
JChkcml2ZXJzLXkpICQoZHJpdmVycy1tKSBcCi0tIAoyLjIxLjAuNTkzLmc1MTFlYzM0NWUxOC1n
b29nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
