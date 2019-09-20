Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7302B9A4E
	for <lists+dri-devel@lfdr.de>; Sat, 21 Sep 2019 01:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 532376FE33;
	Fri, 20 Sep 2019 23:20:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com
 [IPv6:2607:f8b0:4864:20::84a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B33546FE2F
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 23:20:24 +0000 (UTC)
Received: by mail-qt1-x84a.google.com with SMTP id d1so10044704qtq.3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 16:20:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=MYcfIKSKU50yEk2GBsBM2m5RiXljhL+2ZE7FFRNNMnA=;
 b=RozczSNE0IWzkm9GE7YPRcQJJRo8RRlcNdV8fEi/7SzHeGu1Ry27K2mJKPimUtip3z
 vVZpTjPDZfqMqEdmvSzh+iPXbMtzWJjDKcKZWu57treBMWOKr9a1NKu3xeK40BQVjIE9
 lch+M+cz6Yb1H811Iyvd6vZGvgevHLtF6dFqss2KjX/0UJnVBd4kKPVCADqkbm/3K31n
 4Og63KkQX/tlQlyPFRkkxCJWdyppvujBuUQcFMVuH4sv/ptWo7sSHAQlYPisFdb09H4A
 e0QTHoNkDQJiieu2UOulFTNkH5Jwsm9HsWkJgz6J3LB2uHDRzvXfVwUrZaVcc3PIFi+e
 gz4w==
X-Gm-Message-State: APjAAAXQlvLrCbSz7Sd+QoADU34WnTaXmGhPv2g2j/p01QM7UgRnLY6e
 qxy6fUNey81IaB/H+hf0av6nOIGzbQdwFNQFUMPQ+Q==
X-Google-Smtp-Source: APXvYqwe7HUQbxjHZ88C3/yd7hKPs7v0fuapQiwWc6yF6cIi7fKh2+NHXnkd9elywqPPfmZXvk//qq7AcofxgzfIeJsK2w==
X-Received: by 2002:ac8:7502:: with SMTP id u2mr5779140qtq.216.1569021623093; 
 Fri, 20 Sep 2019 16:20:23 -0700 (PDT)
Date: Fri, 20 Sep 2019 16:19:20 -0700
In-Reply-To: <20190920231923.141900-1-brendanhiggins@google.com>
Message-Id: <20190920231923.141900-17-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190920231923.141900-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.23.0.351.gc4317032e6-goog
Subject: [PATCH v16 16/19] MAINTAINERS: add entry for KUnit the unit testing
 framework
From: Brendan Higgins <brendanhiggins@google.com>
To: frowand.list@gmail.com, gregkh@linuxfoundation.org, jpoimboe@redhat.com, 
 keescook@google.com, kieran.bingham@ideasonboard.com, mcgrof@kernel.org, 
 peterz@infradead.org, robh@kernel.org, sboyd@kernel.org, shuah@kernel.org, 
 tytso@mit.edu, yamada.masahiro@socionext.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=MYcfIKSKU50yEk2GBsBM2m5RiXljhL+2ZE7FFRNNMnA=;
 b=Alfuq4xKcjyE/lvI9+hnlObqPY31tSqFtCXmQsJDgKBbZcMDdLd/Xe7IG+dh2opFqi
 NkyEiOKdCjZbdWPC1fBNLUcaNtEJgBGm/C9KYrpwSGMN9kJJghCA0tF/hzhbo3QAqnOy
 G1qrxWya38IKA9aT9DrUpNHS8ofpmZs1hUked/PR+nRiVaU1VfXljtUe111C/R7on8zn
 6GrH2up+ee3CPMMeu4c4xDYF5+vRDtfCDix7aXc4nXc5AUTjcX3VMvg69w2RWR9+CCLb
 ZYb5QuoRRzIn5CjL5tKk6cztEmTrCtopo7An4Qopbv5QmyKSNuCyNb6EPWl43WB8ctZa
 XW0w==
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
 rostedt@goodmis.org, julia.lawall@lip6.fr, kunit-dev@googlegroups.com,
 richard@nod.at, torvalds@linux-foundation.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, mpe@ellerman.id.au,
 linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIG15c2VsZiBhcyBtYWludGFpbmVyIG9mIEtVbml0LCB0aGUgTGludXgga2VybmVsJ3MgdW5p
dCB0ZXN0aW5nCmZyYW1ld29yay4KClNpZ25lZC1vZmYtYnk6IEJyZW5kYW4gSGlnZ2lucyA8YnJl
bmRhbmhpZ2dpbnNAZ29vZ2xlLmNvbT4KUmV2aWV3ZWQtYnk6IEdyZWcgS3JvYWgtSGFydG1hbiA8
Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+ClJldmlld2VkLWJ5OiBMb2dhbiBHdW50aG9ycGUg
PGxvZ2FuZ0BkZWx0YXRlZS5jb20+ClJldmlld2VkLWJ5OiBTdGVwaGVuIEJveWQgPHNib3lkQGtl
cm5lbC5vcmc+Ci0tLQogTUFJTlRBSU5FUlMgfCAxMSArKysrKysrKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDExIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlO
RVJTCmluZGV4IGE1MGU5N2E2M2JjOC4uZTNkMGQxODRhZTRlIDEwMDY0NAotLS0gYS9NQUlOVEFJ
TkVSUworKysgYi9NQUlOVEFJTkVSUwpAQCAtODgwMiw2ICs4ODAyLDE3IEBAIFM6CU1haW50YWlu
ZWQKIEY6CXRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzLwogRjoJRG9jdW1lbnRhdGlvbi9kZXYtdG9v
bHMva3NlbGZ0ZXN0KgogCitLRVJORUwgVU5JVCBURVNUSU5HIEZSQU1FV09SSyAoS1VuaXQpCitN
OglCcmVuZGFuIEhpZ2dpbnMgPGJyZW5kYW5oaWdnaW5zQGdvb2dsZS5jb20+CitMOglsaW51eC1r
c2VsZnRlc3RAdmdlci5rZXJuZWwub3JnCitMOglrdW5pdC1kZXZAZ29vZ2xlZ3JvdXBzLmNvbQor
VzoJaHR0cHM6Ly9nb29nbGUuZ2l0aHViLmlvL2t1bml0LWRvY3MvdGhpcmRfcGFydHkva2VybmVs
L2RvY3MvCitTOglNYWludGFpbmVkCitGOglEb2N1bWVudGF0aW9uL2Rldi10b29scy9rdW5pdC8K
K0Y6CWluY2x1ZGUva3VuaXQvCitGOglsaWIva3VuaXQvCitGOgl0b29scy90ZXN0aW5nL2t1bml0
LworCiBLRVJORUwgVVNFUk1PREUgSEVMUEVSCiBNOglMdWlzIENoYW1iZXJsYWluIDxtY2dyb2ZA
a2VybmVsLm9yZz4KIEw6CWxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKLS0gCjIuMjMuMC4z
NTEuZ2M0MzE3MDMyZTYtZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
