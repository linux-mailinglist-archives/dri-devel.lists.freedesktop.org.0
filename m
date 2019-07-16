Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7436A526
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 11:43:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88AA46E0FA;
	Tue, 16 Jul 2019 09:43:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com
 [IPv6:2607:f8b0:4864:20::84a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F376E0FC
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 09:43:27 +0000 (UTC)
Received: by mail-qt1-x84a.google.com with SMTP id s9so17508097qtn.14
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 02:43:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=ZxnEgoL+cAyfHeVT/PTT350Q+1yvdmLsRRNYnQGVvxQ=;
 b=H8mqgLgatHH26arygFP36dfr1U5Qm/uABdCfU+jK7NR4ZnczEHIzPdQ9KlbJfw6Yek
 mm6O9j32d3gmeQFDGUJyHAZf8brqVW3wArfYqkxI59ZmevGaUERWve2FynL0SnzT3GW1
 heGekCGAxE82kq429A9Ka7KDUULXHlATwvT4GH981dahdJJGyoLdaXPe7xgyeQzG4lD/
 uPs4VJSxUv/NyQCZoiOhAJEF1pwZjwdIcIZRm7LiGMxzp9f/FT75XCxCOi+jJEIXPCzS
 u7/OgzCfMOtxPRP7iAzw691yNwtiAvjPN7sbbuJIvjkYGFPRsQZZ1yNkOKlUf3IZG7fN
 +LfA==
X-Gm-Message-State: APjAAAWSJLbBY84FD+WIKOUbJRb6OTPGruu1Llp2ICddMOQiLFcTgHoI
 DkJZUUdyKIgSh0KkflNZ/3UNLesU2fwGhrSeY8XBkA==
X-Google-Smtp-Source: APXvYqzMr4UyHcoIfs203SmG1cldh3k+yn6h1nFlHx/9asdbVsmVxWorXsh8GDjT9ds0pMy9e7bEiUsj6ezLI7PPblj01Q==
X-Received: by 2002:a37:4b46:: with SMTP id y67mr20389260qka.66.1563270205950; 
 Tue, 16 Jul 2019 02:43:25 -0700 (PDT)
Date: Tue, 16 Jul 2019 02:42:50 -0700
In-Reply-To: <20190716094302.180360-1-brendanhiggins@google.com>
Message-Id: <20190716094302.180360-7-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190716094302.180360-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
Subject: [PATCH v10 06/18] kbuild: enable building KUnit
From: Brendan Higgins <brendanhiggins@google.com>
To: frowand.list@gmail.com, gregkh@linuxfoundation.org, jpoimboe@redhat.com, 
 keescook@google.com, kieran.bingham@ideasonboard.com, mcgrof@kernel.org, 
 peterz@infradead.org, robh@kernel.org, sboyd@kernel.org, shuah@kernel.org, 
 tytso@mit.edu, yamada.masahiro@socionext.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=ZxnEgoL+cAyfHeVT/PTT350Q+1yvdmLsRRNYnQGVvxQ=;
 b=agf+GEiYnsYgxKD+eX5Zr5iEIqArx1Ez38XIbM2zUwF+jCw6OW0eiE0IgwfAqlYXox
 CAlVrX0S8SSRU55Z1c2rRDq12LD77C9G+XVjbkBrq+fkTqHfsXI0imV9hRWG2ZvAS90m
 2c2uu0Q5uOb5hjdGFavlWbaLRn7upGPzUKOzK02UL9T78K8BX3ChJODaDGUQANK3tPoP
 aanOhJtLspMRoBYoEfxxmcWUNqIwsdubLyUHNMtGnlY+Dn7tSIfvpJ5APdl+8eBRmxio
 MMVAlOANOtJkxj5KLwb8vlKV1dJwolhgVqeUMfvFcmaoCLbrxapgKv6CSKy5nEgrqNu4
 rBUg==
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
 Michal Marek <michal.lkml@markovi.net>, richard@nod.at, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, mpe@ellerman.id.au,
 linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

S1VuaXQgaXMgYSBuZXcgdW5pdCB0ZXN0aW5nIGZyYW1ld29yayBmb3IgdGhlIGtlcm5lbCBhbmQg
d2hlbiB1c2VkIGlzCmJ1aWx0IGludG8gdGhlIGtlcm5lbCBhcyBhIHBhcnQgb2YgaXQuIEFkZCBL
VW5pdCB0byB0aGUgcm9vdCBLY29uZmlnIGFuZApNYWtlZmlsZSB0byBhbGxvdyBpdCB0byBiZSBh
Y3R1YWxseSBidWlsdC4KClNpZ25lZC1vZmYtYnk6IEJyZW5kYW4gSGlnZ2lucyA8YnJlbmRhbmhp
Z2dpbnNAZ29vZ2xlLmNvbT4KQWNrZWQtYnk6IE1hc2FoaXJvIFlhbWFkYSA8eWFtYWRhLm1hc2Fo
aXJvQHNvY2lvbmV4dC5jb20+CkNjOiBNaWNoYWwgTWFyZWsgPG1pY2hhbC5sa21sQG1hcmtvdmku
bmV0PgpSZXZpZXdlZC1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0
aW9uLm9yZz4KUmV2aWV3ZWQtYnk6IExvZ2FuIEd1bnRob3JwZSA8bG9nYW5nQGRlbHRhdGVlLmNv
bT4KUmV2aWV3ZWQtYnk6IFN0ZXBoZW4gQm95ZCA8c2JveWRAa2VybmVsLm9yZz4KLS0tCiBLY29u
ZmlnICB8IDIgKysKIE1ha2VmaWxlIHwgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9LY29uZmlnIGIvS2NvbmZpZwppbmRleCA0OGE4MGJlYWI2ODUz
Li4xMDQyODUwMWVkYjc4IDEwMDY0NAotLS0gYS9LY29uZmlnCisrKyBiL0tjb25maWcKQEAgLTMw
LDMgKzMwLDUgQEAgc291cmNlICJjcnlwdG8vS2NvbmZpZyIKIHNvdXJjZSAibGliL0tjb25maWci
CiAKIHNvdXJjZSAibGliL0tjb25maWcuZGVidWciCisKK3NvdXJjZSAia3VuaXQvS2NvbmZpZyIK
ZGlmZiAtLWdpdCBhL01ha2VmaWxlIGIvTWFrZWZpbGUKaW5kZXggM2U0ODY4YTY0OThiMi4uMGNl
MWE4YTJiNmZlYyAxMDA2NDQKLS0tIGEvTWFrZWZpbGUKKysrIGIvTWFrZWZpbGUKQEAgLTk5Myw2
ICs5OTMsOCBAQCBQSE9OWSArPSBwcmVwYXJlMAogaWZlcSAoJChLQlVJTERfRVhUTU9EKSwpCiBj
b3JlLXkJCSs9IGtlcm5lbC8gY2VydHMvIG1tLyBmcy8gaXBjLyBzZWN1cml0eS8gY3J5cHRvLyBi
bG9jay8KIAorY29yZS0kKENPTkZJR19LVU5JVCkgKz0ga3VuaXQvCisKIHZtbGludXgtZGlycwk6
PSAkKHBhdHN1YnN0ICUvLCUsJChmaWx0ZXIgJS8sICQoaW5pdC15KSAkKGluaXQtbSkgXAogCQkg
ICAgICQoY29yZS15KSAkKGNvcmUtbSkgJChkcml2ZXJzLXkpICQoZHJpdmVycy1tKSBcCiAJCSAg
ICAgJChuZXQteSkgJChuZXQtbSkgJChsaWJzLXkpICQobGlicy1tKSAkKHZpcnQteSkpKQotLSAK
Mi4yMi4wLjUxMC5nMjY0ZjJjODE3YS1nb29nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
