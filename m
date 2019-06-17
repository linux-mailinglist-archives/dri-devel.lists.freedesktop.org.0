Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E946247CB7
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 10:28:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76175891AF;
	Mon, 17 Jun 2019 08:28:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com
 [IPv6:2607:f8b0:4864:20::84a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E94891AD
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 08:28:02 +0000 (UTC)
Received: by mail-qt1-x84a.google.com with SMTP id e39so8588021qte.8
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 01:28:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=bPJF89cE4tB1wXKocb/qXW7wfYtIegjLntcYJJ0aEtU=;
 b=XVTJm9M8gfX71ObpQ3xAAANcUmCqlLfe1MUe4tf0sta+Wncr6FnB5zmG2SmqVAUyDW
 z3WkGeHsOZFzKfJBMv1noenWdWvMFG/B101wqmEkHv0rHeTJbW5boQsCSKwS1WrVuqqZ
 vRnuiw9IJ0oOjrQ1/QD1KEAF4XiqRcbXr4VGTe2ggJplYjPg01+2QkyncnzpeNZB2Bf1
 +umCYOelpFCqhDiwk7ew3nYbqbcIiBzF4e67aZM3gkHU+TXBw09cSmNuiAJ45vEF2Q1s
 kkFiCyHSCkuhDo7Er5J2ocsFlfM36+GtJ3uIsLjcoMWa8D/b1DCewcQRp2RLK0ElxN6w
 LkoA==
X-Gm-Message-State: APjAAAX2YvTHNLJhmJNNkbkZfReAYKuPQJU88j/JpPwyPhl+1AOKt75d
 1ZWDkNK6QVGQp5Xg0zB55+qM7Ig+cy5eoVv9K2hPqA==
X-Google-Smtp-Source: APXvYqyTbtjCAcLDWOBf80YN420uGxHfWPtOCpnCXNoMdm2lw18nK8fM3CaU+vc/SrSDk5njDqLK9j/e5783XfBqOv3IRQ==
X-Received: by 2002:ac8:2ac5:: with SMTP id c5mr86955007qta.332.1560760081475; 
 Mon, 17 Jun 2019 01:28:01 -0700 (PDT)
Date: Mon, 17 Jun 2019 01:26:11 -0700
In-Reply-To: <20190617082613.109131-1-brendanhiggins@google.com>
Message-Id: <20190617082613.109131-17-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190617082613.109131-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v5 16/18] MAINTAINERS: add entry for KUnit the unit testing
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
 bh=bPJF89cE4tB1wXKocb/qXW7wfYtIegjLntcYJJ0aEtU=;
 b=o3ogFQ5rdp7cs19G6mteH4rVDUn7teQlurDS0jWzA1kqGwAdqcTxbcDaERqO0pAcK0
 Eh/sClefw5IpL+NRbzQmr6gm3oBb2p8bAzIgg9VsGdKoZ8PJcp2xIjTn/DeBFhMeb7uR
 dNswLweSgYBoYpma1nvfuatrGqhK85GbkGMdIeoO4zRE00IECRglOhzr+/nawhYV39ee
 bQDQC5r2qfCqDqtCzLuaxcLPUb91JojIyYu9tnH2DTcRG9G6JLjrnwscNnQBm+FLS7Tv
 KGYroA3avaB1RnLa65qQXoiFVl6APqQtkplsbvke9XY0m46ewZR6DehJ3wQkF6J665bz
 WPSg==
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
PGxvZ2FuZ0BkZWx0YXRlZS5jb20+Ci0tLQogTUFJTlRBSU5FUlMgfCAxMSArKysrKysrKysrKwog
MSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9NQUlOVEFJTkVS
UyBiL01BSU5UQUlORVJTCmluZGV4IDU3ZjQ5NmNmZjk5OTcuLmYzZmIzZmMzMDg1M2UgMTAwNjQ0
Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJTCkBAIC04NTkwLDYgKzg1OTAsMTcg
QEAgUzoJTWFpbnRhaW5lZAogRjoJdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvCiBGOglEb2N1bWVu
dGF0aW9uL2Rldi10b29scy9rc2VsZnRlc3QqCiAKK0tFUk5FTCBVTklUIFRFU1RJTkcgRlJBTUVX
T1JLIChLVW5pdCkKK006CUJyZW5kYW4gSGlnZ2lucyA8YnJlbmRhbmhpZ2dpbnNAZ29vZ2xlLmNv
bT4KK0w6CWxpbnV4LWtzZWxmdGVzdEB2Z2VyLmtlcm5lbC5vcmcKK0w6CWt1bml0LWRldkBnb29n
bGVncm91cHMuY29tCitXOglodHRwczovL2dvb2dsZS5naXRodWIuaW8va3VuaXQtZG9jcy90aGly
ZF9wYXJ0eS9rZXJuZWwvZG9jcy8KK1M6CU1haW50YWluZWQKK0Y6CURvY3VtZW50YXRpb24vZGV2
LXRvb2xzL2t1bml0LworRjoJaW5jbHVkZS9rdW5pdC8KK0Y6CWt1bml0LworRjoJdG9vbHMvdGVz
dGluZy9rdW5pdC8KKwogS0VSTkVMIFVTRVJNT0RFIEhFTFBFUgogTToJTHVpcyBDaGFtYmVybGFp
biA8bWNncm9mQGtlcm5lbC5vcmc+CiBMOglsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCi0t
IAoyLjIyLjAuNDEwLmdkOGZkYmUyMWI1LWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
