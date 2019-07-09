Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D338630AA
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 08:34:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0723989D5B;
	Tue,  9 Jul 2019 06:34:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x94a.google.com (mail-ua1-x94a.google.com
 [IPv6:2607:f8b0:4864:20::94a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C182989D5B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 06:34:04 +0000 (UTC)
Received: by mail-ua1-x94a.google.com with SMTP id m8so1483794uad.14
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2019 23:34:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=xqyprLFtmsoy8kXd9YLO/VFwieDqS65MPOOJ9C+cs/4=;
 b=Oe1b16SUVMPqHLBJnlfd5T0Q9oFdoaC4q0Rpg8hqHRme2paJxptj6p2+3n4aMcW/T/
 kOrISjzACEqJYXKyjsUkzW5RB4JduIOixOUFO1oxkWaMG6Vc6x9LLvMSDhvQTJJ+s34j
 4T02IO430WXg9pEUqs33xCQQuaWLdJ7nE9qRuNDDEfWd0nLL6Tku2wHGbCkpwtwcksPZ
 tk5g4/YEAQ8OhbG5WWiyNjaMBWpIVuRPv0UANegB1V7CVgYxIl3Ou9dk+vC8+pPuT943
 MI3Za7vftw1yJCJ5jFtL9oMR600UVMgz1Kb+TZRWlTKc6lOeL8jsQWxFydkazWWquURC
 SWJw==
X-Gm-Message-State: APjAAAWnRMr/nYjS2nt/lWvGaWiYgnogbdkohUTj+TvHPpJ9VfYpvrLz
 OBTftbOXbKSwkSTifNtLar4iwjKgKkBn5w0VH5tu3w==
X-Google-Smtp-Source: APXvYqwNJiHBkRfCSkqsV5H5ZuEZsj6nanDgGNZ3VAmzTo0fg8lJCoDeNDmY/ozNQHmnZsAUL9Mc41SFcAh6mWnqjC3NSQ==
X-Received: by 2002:ab0:20d8:: with SMTP id z24mr4416164ual.1.1562654043545;
 Mon, 08 Jul 2019 23:34:03 -0700 (PDT)
Date: Mon,  8 Jul 2019 23:30:11 -0700
In-Reply-To: <20190709063023.251446-1-brendanhiggins@google.com>
Message-Id: <20190709063023.251446-7-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190709063023.251446-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v7 06/18] kbuild: enable building KUnit
From: Brendan Higgins <brendanhiggins@google.com>
To: frowand.list@gmail.com, gregkh@linuxfoundation.org, jpoimboe@redhat.com, 
 keescook@google.com, kieran.bingham@ideasonboard.com, mcgrof@kernel.org, 
 peterz@infradead.org, robh@kernel.org, sboyd@kernel.org, shuah@kernel.org, 
 tytso@mit.edu, yamada.masahiro@socionext.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=xqyprLFtmsoy8kXd9YLO/VFwieDqS65MPOOJ9C+cs/4=;
 b=BV0dE8SvbznNengE0ZbiFjAkJDhECZRlV6y0anjBwPZPZ1QJAxXC1g/NWLJmkwh2dQ
 ymUxDZfk5Xo5TuLgPcbXMU1zelBpG5lRvdeCkasNl4X/Vnt9x4r1W8pPWC4/g+lUwaKi
 8JU4Z1wA6vTfOZEjHhdR9Mlf+yIQ7pF/76uNwAV9V52L6+GkfjA6GEFVHibZRCvNE6a8
 Fu4VfyO8IzEKX7M6CI/FgWBxODziZFM48h2BxhCVoZ3/hlGN10lCqjL51sWnlSnDcy2T
 mBdvBHfYXaqHr68JZPdHCE3Q2egJ+2F4FMM5YKC+b5EV9OgFhj4bqtOQ/+4RJplYTmiD
 NT7Q==
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
Z2dpbnNAZ29vZ2xlLmNvbT4KQ2M6IE1hc2FoaXJvIFlhbWFkYSA8eWFtYWRhLm1hc2FoaXJvQHNv
Y2lvbmV4dC5jb20+CkNjOiBNaWNoYWwgTWFyZWsgPG1pY2hhbC5sa21sQG1hcmtvdmkubmV0PgpS
ZXZpZXdlZC1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9y
Zz4KUmV2aWV3ZWQtYnk6IExvZ2FuIEd1bnRob3JwZSA8bG9nYW5nQGRlbHRhdGVlLmNvbT4KLS0t
CiBLY29uZmlnICB8IDIgKysKIE1ha2VmaWxlIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9LY29uZmlnIGIvS2NvbmZp
ZwppbmRleCA0OGE4MGJlYWI2ODUzLi4xMDQyODUwMWVkYjc4IDEwMDY0NAotLS0gYS9LY29uZmln
CisrKyBiL0tjb25maWcKQEAgLTMwLDMgKzMwLDUgQEAgc291cmNlICJjcnlwdG8vS2NvbmZpZyIK
IHNvdXJjZSAibGliL0tjb25maWciCiAKIHNvdXJjZSAibGliL0tjb25maWcuZGVidWciCisKK3Nv
dXJjZSAia3VuaXQvS2NvbmZpZyIKZGlmZiAtLWdpdCBhL01ha2VmaWxlIGIvTWFrZWZpbGUKaW5k
ZXggM2U0ODY4YTY0OThiMi4uNjBjZjRmMDgxM2UwZCAxMDA2NDQKLS0tIGEvTWFrZWZpbGUKKysr
IGIvTWFrZWZpbGUKQEAgLTk5MSw3ICs5OTEsNyBAQCBlbmRpZgogUEhPTlkgKz0gcHJlcGFyZTAK
IAogaWZlcSAoJChLQlVJTERfRVhUTU9EKSwpCi1jb3JlLXkJCSs9IGtlcm5lbC8gY2VydHMvIG1t
LyBmcy8gaXBjLyBzZWN1cml0eS8gY3J5cHRvLyBibG9jay8KK2NvcmUteQkJKz0ga2VybmVsLyBj
ZXJ0cy8gbW0vIGZzLyBpcGMvIHNlY3VyaXR5LyBjcnlwdG8vIGJsb2NrLyBrdW5pdC8KIAogdm1s
aW51eC1kaXJzCTo9ICQocGF0c3Vic3QgJS8sJSwkKGZpbHRlciAlLywgJChpbml0LXkpICQoaW5p
dC1tKSBcCiAJCSAgICAgJChjb3JlLXkpICQoY29yZS1tKSAkKGRyaXZlcnMteSkgJChkcml2ZXJz
LW0pIFwKLS0gCjIuMjIuMC40MTAuZ2Q4ZmRiZTIxYjUtZ29vZwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
