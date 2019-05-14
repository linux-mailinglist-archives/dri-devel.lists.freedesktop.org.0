Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0291E489
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 00:18:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 455EB89356;
	Tue, 14 May 2019 22:18:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x24a.google.com (mail-oi1-x24a.google.com
 [IPv6:2607:f8b0:4864:20::24a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F1E89356
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 22:18:47 +0000 (UTC)
Received: by mail-oi1-x24a.google.com with SMTP id r84so261897oia.9
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 15:18:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=6hh/O85dR1gwknNQHXWXeYuPNs8/qiARAkO8t2jh/6Y=;
 b=dDyU6EiVKTY9+M9HRa/B07xtTEk2COtk5CU7tn5M/yCndkWBdUdBdO6y/A1r0/cRoe
 jtDUWSkiNcifSDdenowVKOXcU/1utyKD0l+FtvOGFYTl2ST/2mnuqLhHlFKcpcBGmJSe
 b+rlGKdBqjglrfa+iRyP6euUkP5gG6gSXJ6u3SFi32gf6BdYUXVQIA+Uwe1fD4yTYE1q
 hGAmFgm7WA8qZogC07aUBsWdnURLqCrLhU8SG3AubZnO9aMPuWgRM0vggzBknAI5GKyo
 CS2oMFK5Wa9hgFRZbJWufNrjI02BOXGvEU4M3s+4LuA1sYqCsmTfJgvInYjHo4tmEvI/
 kNVg==
X-Gm-Message-State: APjAAAW9Y4o1biTkaG8/x54QDO8hkjfhcaneSj5jxlETmyanLgl4Jl20
 m9F5wwSmX7z366ICb1OOCnEqlmOr8NdSu/m8Md3IdQ==
X-Google-Smtp-Source: APXvYqwM3IIpnD+1gT/FoKuuZ38KlKypDLYmem1eGy8VXLyPhIPBqWZAB3GDuzAEJQCCRqZLoC5ufBjoXToe9b3uGCSmBw==
X-Received: by 2002:aca:49d8:: with SMTP id w207mr4531843oia.19.1557872326590; 
 Tue, 14 May 2019 15:18:46 -0700 (PDT)
Date: Tue, 14 May 2019 15:16:59 -0700
In-Reply-To: <20190514221711.248228-1-brendanhiggins@google.com>
Message-Id: <20190514221711.248228-7-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190514221711.248228-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
Subject: [PATCH v4 06/18] kbuild: enable building KUnit
From: Brendan Higgins <brendanhiggins@google.com>
To: frowand.list@gmail.com, gregkh@linuxfoundation.org, jpoimboe@redhat.com, 
 keescook@google.com, kieran.bingham@ideasonboard.com, mcgrof@kernel.org, 
 peterz@infradead.org, robh@kernel.org, sboyd@kernel.org, shuah@kernel.org, 
 tytso@mit.edu, yamada.masahiro@socionext.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=6hh/O85dR1gwknNQHXWXeYuPNs8/qiARAkO8t2jh/6Y=;
 b=pktwE2H0lkcFv7/9jqXmIsyveGdsCVelMrwl3cqH3txcAlfCnUeZ37dhZxF8UH+mJj
 Snw5Jm8u4RQjcqSq7yPzBmSgLMf/1eHtUlumh+NpwywZFZDIN1anDe6OB6AlKTg141kA
 5mI1+qqW99DY990j90tKYxM+9soRcSIaIhwSETrcMPC5Fw2Hvjbtp+qRQT1t5L4gJ/zU
 jXLH/gHr2MsYOB5YVs8dlqDoP6gWf7kgzgteMmFFQlTaNoF/V4ckEVaF34U+xTEonucY
 iQ1EkqEBHKa0Jt4fbn5sxK9Ov2Oy8pgv7eTNHj+PLXPxFNqmry8DRB3TebSutP/GbjtC
 C76A==
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
ZmlsZSBiL01ha2VmaWxlCmluZGV4IDI2YzkyZjg5MmQyNGIuLjJlYTg3YThmZTc3MGQgMTAwNjQ0
Ci0tLSBhL01ha2VmaWxlCisrKyBiL01ha2VmaWxlCkBAIC05NjksNyArOTY5LDcgQEAgZW5kaWYK
IFBIT05ZICs9IHByZXBhcmUwCiAKIGlmZXEgKCQoS0JVSUxEX0VYVE1PRCksKQotY29yZS15CQkr
PSBrZXJuZWwvIGNlcnRzLyBtbS8gZnMvIGlwYy8gc2VjdXJpdHkvIGNyeXB0by8gYmxvY2svCitj
b3JlLXkJCSs9IGtlcm5lbC8gY2VydHMvIG1tLyBmcy8gaXBjLyBzZWN1cml0eS8gY3J5cHRvLyBi
bG9jay8ga3VuaXQvCiAKIHZtbGludXgtZGlycwk6PSAkKHBhdHN1YnN0ICUvLCUsJChmaWx0ZXIg
JS8sICQoaW5pdC15KSAkKGluaXQtbSkgXAogCQkgICAgICQoY29yZS15KSAkKGNvcmUtbSkgJChk
cml2ZXJzLXkpICQoZHJpdmVycy1tKSBcCi0tIAoyLjIxLjAuMTAyMC5nZjI4MjBjZjAxYS1nb29n
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
