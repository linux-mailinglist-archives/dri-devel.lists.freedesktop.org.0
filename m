Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB0A9BA6D
	for <lists+dri-devel@lfdr.de>; Sat, 24 Aug 2019 03:35:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE666ED7E;
	Sat, 24 Aug 2019 01:35:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com
 [IPv6:2607:f8b0:4864:20::44a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4529A6ED93
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Aug 2019 01:35:22 +0000 (UTC)
Received: by mail-pf1-x44a.google.com with SMTP id g185so7714358pfb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 18:35:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=Q7v6rEQoCsNNbU95UVuiGKqKwX05H1mjzimMiwgdjks=;
 b=B3kTFyVAjUEYmLbKqGdcnfGfhP5j2L47WS2kuitiP+3NVMBFklbGLUh7Y1lQbs9XKt
 xCmoPvisziyTfdfW09+g5JjZtVvMfNdVgBjjykJCoYkl1Bquu3XY539oj/Nidlzgi59K
 Axw14OVq4BRHLYY7KwanRBr5uUVlTRZOcwKH8/uwPD6DrWFBQdZdtTJ3vJ4visnPi0ue
 r9zZlTyn89L6L3dvylRUkMgIQT9pjx2FJ4F8MVCiMj2ynGTBt3Yp9/zwXkOQSe9sQgad
 bfu9rtKyBNGoTrPTmZAQVS1QXdl9vBEWWxCYbf01yjFLQJF8cDKkdK+wLocIDC8QKOPf
 Qqhw==
X-Gm-Message-State: APjAAAUoSm1N7m6hiSkKuSZO2nybGTFFuImTdoNmJ06psb9fyp2P9TJR
 hZQTfs8DRAfDMt8Plnc9ESxh5yRU/tkIoFMPJWaUWg==
X-Google-Smtp-Source: APXvYqzJyyLtfmAOBIQlbX+eop2/oig96oKMIaKGeExSCTI7BXDWjOnL13u84fw7hBXw+uulsexqobHzTGtoBwBytj+Rlg==
X-Received: by 2002:a65:4b8b:: with SMTP id t11mr6412047pgq.130.1566610521287; 
 Fri, 23 Aug 2019 18:35:21 -0700 (PDT)
Date: Fri, 23 Aug 2019 18:34:23 -0700
In-Reply-To: <20190824013425.175645-1-brendanhiggins@google.com>
Message-Id: <20190824013425.175645-17-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190824013425.175645-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
Subject: [PATCH v15 16/18] MAINTAINERS: add entry for KUnit the unit testing
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
 bh=Q7v6rEQoCsNNbU95UVuiGKqKwX05H1mjzimMiwgdjks=;
 b=kTDliowP7o3AiRgwqQlGdSorwzrpE74OzrYLBSyQym+RMD9BcY3HKgRqyUg56Jh5m2
 I0kSBhwhcQDEAp90nh3ZujDoa38kQhvTP1Jc+/wt8WWFrQiFg8l/9HyGs9d14T1TjS1K
 Iw0FVBL+/zSCAfzOAcwGjAtR42R3mpopg+GAsodk20VK3Hx90/Z6GucUnjkTQWGo6oql
 bMw16WK1ZxXYYN0eEFBOFKGaezq1RdQqMO8lXVb1eJIA70O3pkzZs/U8eRTUz/d/bNJT
 yjpEiEVsNfRUxPdw7uiUvTOiKewWG+vAZPNE1VIsegRpZQeLlLR0Qo6aFDH1RA0oJYKp
 WGCw==
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
RVJTCmluZGV4IGEyYzM0M2VlM2IyYy4uZjBiZDc3ZThhOGEyIDEwMDY0NAotLS0gYS9NQUlOVEFJ
TkVSUworKysgYi9NQUlOVEFJTkVSUwpAQCAtODc5OSw2ICs4Nzk5LDE3IEBAIFM6CU1haW50YWlu
ZWQKIEY6CXRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzLwogRjoJRG9jdW1lbnRhdGlvbi9kZXYtdG9v
bHMva3NlbGZ0ZXN0KgogCitLRVJORUwgVU5JVCBURVNUSU5HIEZSQU1FV09SSyAoS1VuaXQpCitN
OglCcmVuZGFuIEhpZ2dpbnMgPGJyZW5kYW5oaWdnaW5zQGdvb2dsZS5jb20+CitMOglsaW51eC1r
c2VsZnRlc3RAdmdlci5rZXJuZWwub3JnCitMOglrdW5pdC1kZXZAZ29vZ2xlZ3JvdXBzLmNvbQor
VzoJaHR0cHM6Ly9nb29nbGUuZ2l0aHViLmlvL2t1bml0LWRvY3MvdGhpcmRfcGFydHkva2VybmVs
L2RvY3MvCitTOglNYWludGFpbmVkCitGOglEb2N1bWVudGF0aW9uL2Rldi10b29scy9rdW5pdC8K
K0Y6CWluY2x1ZGUva3VuaXQvCitGOglrdW5pdC8KK0Y6CXRvb2xzL3Rlc3Rpbmcva3VuaXQvCisK
IEtFUk5FTCBVU0VSTU9ERSBIRUxQRVIKIE06CUx1aXMgQ2hhbWJlcmxhaW4gPG1jZ3JvZkBrZXJu
ZWwub3JnPgogTDoJbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwotLSAKMi4yMy4wLjE4Ny5n
MTdmNWI3NTU2Yy1nb29nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
