Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEE75F04A
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 02:37:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D026E229;
	Thu,  4 Jul 2019 00:37:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com
 [IPv6:2607:f8b0:4864:20::549])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A086E22A
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 00:37:47 +0000 (UTC)
Received: by mail-pg1-x549.google.com with SMTP id u1so1612029pgr.13
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2019 17:37:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=XlrqH678HDR84yo41rM73BaaQaGuXs9XZZneq4FOZeY=;
 b=EYGBsQO6w3zwWkD1BMmDFZADfVA9XaCYm4szHLj98cyCbokxNYsRlZPv6KsPw1qp0c
 kBBw5zTgNPVM1S/3VsdgraXsNCgi7G/gknLpU4YwtxlX9zjn4rwXiTaa7axHezr7+lWZ
 PqYFWAVq83sZR5PQZjUzvsm9S5WxwCTWefoxFT2dMNrXB5ddrsAOY3eU6ElqiZgQqmmu
 t0r1SV5VJeWiizmoVBcBrHgsbw0xPQOuWQVUSroFJqFsKTk7g/d+D8xlMH+vgodXWXlr
 gf58C0YYf5RpgF1hug0b8LMoj3kyyOUn1opU4c9xUyXCTxcQvAYKeSxwPj/t78EEn7e7
 1TYg==
X-Gm-Message-State: APjAAAUGtgk4M7cpfMsnZO4VUYxgd8oPvvUgoyveICGs7IGEmy2DChpQ
 cPXoNncI9o9Wl2fft3IAz0heZqzMbIoXdQcdDqwJTQ==
X-Google-Smtp-Source: APXvYqzEyrStQtoN+0MmqxKcoxkpwGwMdPWPCVJ2v+rt7FevA703DgZaVQugKeZ2rVGA0cnHCH+IEhNvyiDaQ8b6b05Cdg==
X-Received: by 2002:a63:1b07:: with SMTP id b7mr39423299pgb.133.1562200665901; 
 Wed, 03 Jul 2019 17:37:45 -0700 (PDT)
Date: Wed,  3 Jul 2019 17:36:03 -0700
In-Reply-To: <20190704003615.204860-1-brendanhiggins@google.com>
Message-Id: <20190704003615.204860-7-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190704003615.204860-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v6 06/18] kbuild: enable building KUnit
From: Brendan Higgins <brendanhiggins@google.com>
To: frowand.list@gmail.com, gregkh@linuxfoundation.org, jpoimboe@redhat.com, 
 keescook@google.com, kieran.bingham@ideasonboard.com, mcgrof@kernel.org, 
 peterz@infradead.org, robh@kernel.org, sboyd@kernel.org, shuah@kernel.org, 
 tytso@mit.edu, yamada.masahiro@socionext.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=XlrqH678HDR84yo41rM73BaaQaGuXs9XZZneq4FOZeY=;
 b=ffmju7yr7gRfaJbHZ/EKKmVncl8VlWULQaThQY06zll3+6WpQG6lpGZ4OPQmMivptS
 8hDYradWvLpP2Ynet+Ye7uV0kLczbf6RFD8mFVTANX2yg7wM9YbXidQ/FQZgq07MWegb
 OGw9om8WRHzmMMnObSBGoIx3ybtRj+V2h+ffEXd5lxF3Nc0UTcEdl8L3/UVHObrq7Hpr
 pb1JvhsO78qMQnHwg/Ed80IloOa6WYSoqzkmmaIisIDaOlJlxgcTtQcFCed7VfZAR09f
 b9pzfPkA2sw/PBcf5XMV0Aycvwei2GOmUX9h6Qyralx5M52IFq4n3EvX8Bsm6682vUXZ
 cuVQ==
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

S1VuaXQgaXMgYSBuZXcgdW5pdCB0ZXN0aW5nIGZyYW1ld29yayBmb3IgdGhlIGtlcm5lbCBhbmQg
d2hlbiB1c2VkIGlzCmJ1aWx0IGludG8gdGhlIGtlcm5lbCBhcyBhIHBhcnQgb2YgaXQuIEFkZCBL
VW5pdCB0byB0aGUgcm9vdCBLY29uZmlnIGFuZApNYWtlZmlsZSB0byBhbGxvdyBpdCB0byBiZSBh
Y3R1YWxseSBidWlsdC4KClNpZ25lZC1vZmYtYnk6IEJyZW5kYW4gSGlnZ2lucyA8YnJlbmRhbmhp
Z2dpbnNAZ29vZ2xlLmNvbT4KUmV2aWV3ZWQtYnk6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2to
QGxpbnV4Zm91bmRhdGlvbi5vcmc+ClJldmlld2VkLWJ5OiBMb2dhbiBHdW50aG9ycGUgPGxvZ2Fu
Z0BkZWx0YXRlZS5jb20+Ci0tLQogS2NvbmZpZyAgfCAyICsrCiBNYWtlZmlsZSB8IDIgKy0KIDIg
ZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvS2NvbmZpZyBiL0tjb25maWcKaW5kZXggNDhhODBiZWFiNjg1My4uMTA0Mjg1MDFlZGI3OCAx
MDA2NDQKLS0tIGEvS2NvbmZpZworKysgYi9LY29uZmlnCkBAIC0zMCwzICszMCw1IEBAIHNvdXJj
ZSAiY3J5cHRvL0tjb25maWciCiBzb3VyY2UgImxpYi9LY29uZmlnIgogCiBzb3VyY2UgImxpYi9L
Y29uZmlnLmRlYnVnIgorCitzb3VyY2UgImt1bml0L0tjb25maWciCmRpZmYgLS1naXQgYS9NYWtl
ZmlsZSBiL01ha2VmaWxlCmluZGV4IGZhYmMxMjdkMTI3ZjkuLjQ0ZTBkNzMwZGQ1YjYgMTAwNjQ0
Ci0tLSBhL01ha2VmaWxlCisrKyBiL01ha2VmaWxlCkBAIC05OTEsNyArOTkxLDcgQEAgZW5kaWYK
IFBIT05ZICs9IHByZXBhcmUwCiAKIGlmZXEgKCQoS0JVSUxEX0VYVE1PRCksKQotY29yZS15CQkr
PSBrZXJuZWwvIGNlcnRzLyBtbS8gZnMvIGlwYy8gc2VjdXJpdHkvIGNyeXB0by8gYmxvY2svCitj
b3JlLXkJCSs9IGtlcm5lbC8gY2VydHMvIG1tLyBmcy8gaXBjLyBzZWN1cml0eS8gY3J5cHRvLyBi
bG9jay8ga3VuaXQvCiAKIHZtbGludXgtZGlycwk6PSAkKHBhdHN1YnN0ICUvLCUsJChmaWx0ZXIg
JS8sICQoaW5pdC15KSAkKGluaXQtbSkgXAogCQkgICAgICQoY29yZS15KSAkKGNvcmUtbSkgJChk
cml2ZXJzLXkpICQoZHJpdmVycy1tKSBcCi0tIAoyLjIyLjAuNDEwLmdkOGZkYmUyMWI1LWdvb2cK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
