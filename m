Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97438BA233
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2019 14:05:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E5436E125;
	Sun, 22 Sep 2019 12:04:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa4a.google.com (mail-vk1-xa4a.google.com
 [IPv6:2607:f8b0:4864:20::a4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2A566E04A
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2019 07:26:36 +0000 (UTC)
Received: by mail-vk1-xa4a.google.com with SMTP id d64so3776985vke.6
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2019 00:26:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=MYcfIKSKU50yEk2GBsBM2m5RiXljhL+2ZE7FFRNNMnA=;
 b=GAi3Rbx/yYskv/REZGMSD7qU6hYAv8j67rbdx0wUAjW/w/7FLAxdAKw/EZ4+aS/pTe
 cJazJ4WiJqqvj04nsTcIcaypdRIxc25GkDdLRi9vd2lkIx/UTzn0nbYlHUN9xSO37s2L
 c5wTuIJcT5l/jinnhAn6VMEKb7/NwioCmSvDoHU1Yaz33H4auyV5vJp96Nm79ffDeGX3
 fpmMHmbUxYDt4SQeV/jDGOPm1WW8yw8gA4ayway+sX+6xbfsp/p1ZxMh5ptqaMjpArSQ
 n+KNA8IDaw01PKFNy1LaUcW/jyQ1HVRIz1CV//EzXHTZ9T1XLUgDhEJ+86fC0MNYY4Ui
 +nog==
X-Gm-Message-State: APjAAAUypKI9l/2gSL7sY/UFhsF81djhj0Cvn6hOuz2cNSHcVCfU5IUV
 D3EMEPnUq7h3dWcWRXirwGBm9/EhzH5AmrmTJZ3PlA==
X-Google-Smtp-Source: APXvYqzOx0clHQC670a6muPylspP6OHx1qxZmcK2LkXePQZnafFqCeM6G2+UolARC9Ywjom62MOYO4JFPeltIEhIgU6qyA==
X-Received: by 2002:ab0:2811:: with SMTP id w17mr3530779uap.111.1569025189180; 
 Fri, 20 Sep 2019 17:19:49 -0700 (PDT)
Date: Fri, 20 Sep 2019 17:18:52 -0700
In-Reply-To: <20190921001855.200947-1-brendanhiggins@google.com>
Message-Id: <20190921001855.200947-17-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190921001855.200947-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.23.0.351.gc4317032e6-goog
Subject: [PATCH v17 16/19] MAINTAINERS: add entry for KUnit the unit testing
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
 b=rYwL1vV9cAt6aW7K9UQ1TVv7Nis579iXiupkGlrJI5z1hBl5vWUe1ss1znAKVnTbtB
 SMKvA8N5qnF3S+ncfW7/2zlZrGFafD5oVhBy9vsu8P3mLLCWEjcjgc6EQJJEfD2JwVaP
 w7BO8yfXBiij6pLZQsbZTdY0iOqvQv5jzGk6XRZ+c8Lqf/6gYPE66QZjvcKApVeDqc0L
 ww9Sp4aoovE3lpLwl/WQ1l3THJquaMgBLszzK6JcU55vPYwK4rlvpxxUUtGGtCBaU4a8
 /DZg7vF11+JkeqazuvE5Qg3co4fNsX454Qm3YhNh7olmtf/8c974/6FV8CDzvwsuLetM
 6oxg==
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
