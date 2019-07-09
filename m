Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 434ED63100
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 08:35:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF5A89FAD;
	Tue,  9 Jul 2019 06:35:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa4a.google.com (mail-vk1-xa4a.google.com
 [IPv6:2607:f8b0:4864:20::a4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95AA889FD4
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 06:35:38 +0000 (UTC)
Received: by mail-vk1-xa4a.google.com with SMTP id n185so3905006vkf.14
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2019 23:35:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=LDQmGV1sXKMjUeOhPKTnD5bP1+GpH11oHwNBh3L4XLs=;
 b=hD0UFuCum8gUnh8J56nnerEVLA9BRATxZe4Kq2k+b66vSrQIdtEdRMq/0bLvG7ffhS
 HyUCNyPe2F6N4YncXglS0rZ/L3b/vbdxry6xt3cAtmEM7Y7FE7eVDOTmxWmWVMKl2urz
 3+gFEaCSc1TT94JlQ8A+aB+zvLIYO+9pYq9MOdJBIJUMtAcYiHjJM26MH1Lf8K9Hd2jI
 I1SjllHL+TqizMbH2SZznvjbHsuntz/p6tFl8IsRvtZ/zb5MAFyMDnP9upbgxmHKcBwF
 8zOOafWGbxVhRYh8y4up10LeYXWCXQK0Ao+5cTtdyPcRnBKaJhKfF7PXw3AeGhybHydg
 Nytg==
X-Gm-Message-State: APjAAAVQkilF8m1/wIyaUZol0BI74CTscn8By7znL7drBrYoSSgg11x+
 qy4TtWqBy0o71TjGqsVaiIf6SwNG3R34TAzdcYQ9dg==
X-Google-Smtp-Source: APXvYqyW1g9KdJQPX3pyGwybskRq1kFabR+QXx1JMZJMEoqi+vbrQt4/L8S6b2Fnm4tYbGfikHj5lP0KQVa29yIOSMpklA==
X-Received: by 2002:a1f:6045:: with SMTP id u66mr3906864vkb.54.1562654137349; 
 Mon, 08 Jul 2019 23:35:37 -0700 (PDT)
Date: Mon,  8 Jul 2019 23:30:23 -0700
In-Reply-To: <20190709063023.251446-1-brendanhiggins@google.com>
Message-Id: <20190709063023.251446-19-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190709063023.251446-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v7 18/18] MAINTAINERS: add proc sysctl KUnit test to PROC
 SYSCTL section
From: Brendan Higgins <brendanhiggins@google.com>
To: frowand.list@gmail.com, gregkh@linuxfoundation.org, jpoimboe@redhat.com, 
 keescook@google.com, kieran.bingham@ideasonboard.com, mcgrof@kernel.org, 
 peterz@infradead.org, robh@kernel.org, sboyd@kernel.org, shuah@kernel.org, 
 tytso@mit.edu, yamada.masahiro@socionext.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=LDQmGV1sXKMjUeOhPKTnD5bP1+GpH11oHwNBh3L4XLs=;
 b=mtI4pp7LQ+cFZTh7ol2m1CVrFBewx1Tr/aWCfVl2aenkSg1IeUTYlk6HdJcDVl9V3V
 qVnZm5/t/x2Gb6ReZi2m8DZTmZwO2iCuHQhftas4io72KmTBubu7P5AHRRuPzTtzbHUk
 vDhVlpDpGXMhYDhnt//uJxs2dzo45RkBUi1IjbK6/9WPuyRnq7YWsBQp/82+MaG5On/B
 bp2850T8S0Sa0vYFLBGRkb7fOdx7Rw8cRDFhVg0SOdCTFhey727SPz2DbRtsbn4Alddl
 22XhrfmGEwv1NUR9lNPXJPkGMxadaTLFT1pkHIKy2X+DGjvjaEp4IaeI0b46n7FB7Z0j
 kXrA==
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
 wfg@linux.intel.com, joel@jms.id.au, rientjes@google.com,
 Iurii Zaikin <yzaikin@google.com>, jdike@addtoit.com, dan.carpenter@oracle.com,
 devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org, Tim.Bird@sony.com,
 linux-um@lists.infradead.org, rostedt@goodmis.org, julia.lawall@lip6.fr,
 kunit-dev@googlegroups.com, richard@nod.at, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, mpe@ellerman.id.au,
 linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGVudHJ5IGZvciB0aGUgbmV3IHByb2Mgc3lzY3RsIEtVbml0IHRlc3QgdG8gdGhlIFBST0Mg
U1lTQ1RMIHNlY3Rpb24sCmFuZCBhZGQgSXVyaWkgYXMgYSBtYWludGFpbmVyLgoKU2lnbmVkLW9m
Zi1ieTogQnJlbmRhbiBIaWdnaW5zIDxicmVuZGFuaGlnZ2luc0Bnb29nbGUuY29tPgpDYzogSXVy
aWkgWmFpa2luIDx5emFpa2luQGdvb2dsZS5jb20+ClJldmlld2VkLWJ5OiBHcmVnIEtyb2FoLUhh
cnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgpSZXZpZXdlZC1ieTogTG9nYW4gR3Vu
dGhvcnBlIDxsb2dhbmdAZGVsdGF0ZWUuY29tPgpBY2tlZC1ieTogTHVpcyBDaGFtYmVybGFpbiA8
bWNncm9mQGtlcm5lbC5vcmc+Ci0tLQogTUFJTlRBSU5FUlMgfCAyICsrCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVS
UwppbmRleCA0OGQwNGQxODBhOTg4Li5mODIwNGM3NTExNGRhIDEwMDY0NAotLS0gYS9NQUlOVEFJ
TkVSUworKysgYi9NQUlOVEFJTkVSUwpAQCAtMTI3MjEsMTIgKzEyNzIxLDE0IEBAIEY6CURvY3Vt
ZW50YXRpb24vZmlsZXN5c3RlbXMvcHJvYy50eHQKIFBST0MgU1lTQ1RMCiBNOglMdWlzIENoYW1i
ZXJsYWluIDxtY2dyb2ZAa2VybmVsLm9yZz4KIE06CUtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21p
dW0ub3JnPgorTToJSXVyaWkgWmFpa2luIDx5emFpa2luQGdvb2dsZS5jb20+CiBMOglsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnCiBMOglsaW51eC1mc2RldmVsQHZnZXIua2VybmVsLm9yZwog
UzoJTWFpbnRhaW5lZAogRjoJZnMvcHJvYy9wcm9jX3N5c2N0bC5jCiBGOglpbmNsdWRlL2xpbnV4
L3N5c2N0bC5oCiBGOglrZXJuZWwvc3lzY3RsLmMKK0Y6CWtlcm5lbC9zeXNjdGwtdGVzdC5jCiBG
Ogl0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9zeXNjdGwvCiAKIFBTMyBORVRXT1JLIFNVUFBPUlQK
LS0gCjIuMjIuMC40MTAuZ2Q4ZmRiZTIxYjUtZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
