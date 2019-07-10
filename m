Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A24576423D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 09:17:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1100B89B9E;
	Wed, 10 Jul 2019 07:17:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com
 [IPv6:2607:f8b0:4864:20::549])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F8C1899E7
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 07:17:04 +0000 (UTC)
Received: by mail-pg1-x549.google.com with SMTP id o16so908730pgk.18
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 00:17:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=LDQmGV1sXKMjUeOhPKTnD5bP1+GpH11oHwNBh3L4XLs=;
 b=LydXWAkcplmBdXS/gLueraS7bv4McmW8q7VuhmkFNTrktkZTv58INIiA+6gy6wSxfb
 hcA4aUdO6stc3JC1POVox0wd2Cg3sImWg3phi0mVEZk8P5OdGxlKUevMG/uj05h5z2MM
 m1sCPKCQuJ4SWmYkpd7fvd41n7/fBLfxXoGjyEqTwVb2Tu0cceEd0cyKMBTmPvm5I7Bt
 LcVgC/S+6L+TCsmRE3ZTTv4AHOeHotrL10RVwrAHa1bQyKkhnY90BFyTM5xomXIvEUvt
 eRMmqYDsuR8I0PUs2tG4ZnBKHDZV6HZCKFyY9Req7F+lR2r3EaVzooSmbGzYg6YwE7qA
 sZBw==
X-Gm-Message-State: APjAAAVhzrb0lR5ryOEdtHOJ/+h7GnVnJ9lBxVlUnZIRZkDJKskXPHEM
 GiEDTJD6Vf0UYTtP2sEzzXQUHInpX4GxpmX2kD23TA==
X-Google-Smtp-Source: APXvYqwlEXuLFBHdrrK58SUL+5pvcKzBeJ5OszOrbsQfgRsSasvNDQkhx5yemg7ePksEVTpnjPnL52tUKDt89i4lgsAB3w==
X-Received: by 2002:a63:ad07:: with SMTP id g7mr33234528pgf.405.1562743023620; 
 Wed, 10 Jul 2019 00:17:03 -0700 (PDT)
Date: Wed, 10 Jul 2019 00:15:08 -0700
In-Reply-To: <20190710071508.173491-1-brendanhiggins@google.com>
Message-Id: <20190710071508.173491-19-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190710071508.173491-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v8 18/18] MAINTAINERS: add proc sysctl KUnit test to PROC
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
 b=SWzxZhZeLl9B3ZN7KUpRnolnKVc0OJkXJr8qwulUb9s67eZjf6r3kc2Ogx/J6NFBmy
 uqmVFD7ak9Qf8Uo8aXEIMGv7YGtgPRuHX+xSuxQCpHpu8vO6QWhPhnFk65OLmSU98Mo+
 abndx4F4lNunK2LAN8X5bdTYvCw0G/l5uts0dKuU3ZLpu8KxF7vnPevzWZqEjMu7PyE6
 VfeMLPMw4Y1TpnuCapjefj7vkaiOpHNz5UIbiIVdL+S7PfmVCxTs5cgeeOlAwMRo0y8X
 qh0rs5Mg9wZHPZxBzOCF9AroydvmP+xOktJ7l+4j5selLe+O3LHZFGlyYirSiQEquBlu
 n+qQ==
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
