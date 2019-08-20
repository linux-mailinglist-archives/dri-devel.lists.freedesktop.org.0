Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B59E96D54
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 01:21:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BC836E8CD;
	Tue, 20 Aug 2019 23:21:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe4a.google.com (mail-vs1-xe4a.google.com
 [IPv6:2607:f8b0:4864:20::e4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C6626E8E4
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 23:21:40 +0000 (UTC)
Received: by mail-vs1-xe4a.google.com with SMTP id w2so142597vso.19
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 16:21:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=T94Ldr45BAcQvYAvJ8Y+rDntZ4kBO4X+NPr7Ifz4Qao=;
 b=dRlXDBzkEcN8BIEfshBdJxInbTZdrQxask0BWG5xWgeNqfpeGsUYD1W6Jgqr5EqOq1
 eLD+BIKktAilWTcqIJY9UoGC0ocC6MhkmgQ6jBNLRxuh963UxFrEslqqPxXf3v6ZWREs
 Y4rRzNpj9AoUByUSwbtM9RrI+cQOGHpKEDSBGACb+sicOMYF3GuPK0/sBCc6L+WoBw61
 VJxjNjnfWVhB/1xlZyx0A0GxQYSMvLMmtkQ39fRCUvnQPuGuGbvwIjuz/gHyTLk/de8q
 Oqax0aDF0s2d9SesoifGJThNRIiEO/j4fi+Gl056GJ3DH5bTdB/XWjRUX/Htn55e0Cpw
 GcNQ==
X-Gm-Message-State: APjAAAXJzj8hCZcAdaTW6I1YUuY848rj4/XSAEMLqnH71xUprBVwyVVH
 GjH2T2WoSxEeqrWLP2wF3tObYXtcORwKxrw/8dtZjg==
X-Google-Smtp-Source: APXvYqxh2r8/Dyslnkrm5yAR1V7pXj5oYYDJiDInjvKNVIOiEnzifza+DlpH9bEyO+XPLxxYg+bgGDgljzWHWJgD5OjvrA==
X-Received: by 2002:ab0:5ad1:: with SMTP id x17mr748825uae.52.1566343298916;
 Tue, 20 Aug 2019 16:21:38 -0700 (PDT)
Date: Tue, 20 Aug 2019 16:20:44 -0700
In-Reply-To: <20190820232046.50175-1-brendanhiggins@google.com>
Message-Id: <20190820232046.50175-17-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190820232046.50175-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v14 16/18] MAINTAINERS: add entry for KUnit the unit testing
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
 bh=T94Ldr45BAcQvYAvJ8Y+rDntZ4kBO4X+NPr7Ifz4Qao=;
 b=EFyVTG07Exi4UaiWRBWcrqjeK3OigGHFopAe2CffL0d9XPm3H7ECo7PJmaYrh2vVMN
 Ied1Uh53sjFh8MiXULxEEWKt522KBiD8/qCyc8ionMtskrEQY7AqJbtuXdeIRpVfR6J3
 NUsaVEI1vhxCxPBbmusd2UlYmQ0HRh0pDPbSdlJ0EkPvwPHcRfFofWtl5psF+Ikb+C9K
 292A+bKTq6YKyswmWOE/7TWI00ErLohvyzIi69m+MDfqGzeQzw5X8+B6e2SdUL9F/KwC
 jTNNYJlhHSc41CLuQBbGC/bYqdnIwGNTR8qH7sFYld8Yd4Ekrs8JKToVb0VvbYD8qhpQ
 o+bw==
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
 richard@nod.at, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 mpe@ellerman.id.au, linux-fsdevel@vger.kernel.org, logang@deltatee.com
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
RVJTCmluZGV4IGEyYzM0M2VlM2IyY2EuLmYwYmQ3N2U4YThhMmYgMTAwNjQ0Ci0tLSBhL01BSU5U
QUlORVJTCisrKyBiL01BSU5UQUlORVJTCkBAIC04Nzk5LDYgKzg3OTksMTcgQEAgUzoJTWFpbnRh
aW5lZAogRjoJdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvCiBGOglEb2N1bWVudGF0aW9uL2Rldi10
b29scy9rc2VsZnRlc3QqCiAKK0tFUk5FTCBVTklUIFRFU1RJTkcgRlJBTUVXT1JLIChLVW5pdCkK
K006CUJyZW5kYW4gSGlnZ2lucyA8YnJlbmRhbmhpZ2dpbnNAZ29vZ2xlLmNvbT4KK0w6CWxpbnV4
LWtzZWxmdGVzdEB2Z2VyLmtlcm5lbC5vcmcKK0w6CWt1bml0LWRldkBnb29nbGVncm91cHMuY29t
CitXOglodHRwczovL2dvb2dsZS5naXRodWIuaW8va3VuaXQtZG9jcy90aGlyZF9wYXJ0eS9rZXJu
ZWwvZG9jcy8KK1M6CU1haW50YWluZWQKK0Y6CURvY3VtZW50YXRpb24vZGV2LXRvb2xzL2t1bml0
LworRjoJaW5jbHVkZS9rdW5pdC8KK0Y6CWt1bml0LworRjoJdG9vbHMvdGVzdGluZy9rdW5pdC8K
KwogS0VSTkVMIFVTRVJNT0RFIEhFTFBFUgogTToJTHVpcyBDaGFtYmVybGFpbiA8bWNncm9mQGtl
cm5lbC5vcmc+CiBMOglsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCi0tIAoyLjIzLjAucmMx
LjE1My5nZGVlZDgwMzMwZi1nb29nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
