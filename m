Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B09E2668B1
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 10:18:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5618A6E318;
	Fri, 12 Jul 2019 08:18:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com
 [IPv6:2607:f8b0:4864:20::74a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59F386E31A
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 08:18:43 +0000 (UTC)
Received: by mail-qk1-x74a.google.com with SMTP id e18so6211164qkl.17
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 01:18:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=LDQmGV1sXKMjUeOhPKTnD5bP1+GpH11oHwNBh3L4XLs=;
 b=W5SjvkjPkXUwwQ8FVsw6q7aSzEWs/j1mLqk8ASjxNrJKzJt4wPpQn5q+Ywid3yKz9x
 hcSst13QwTCXvLIhKmCofZryvsuyiDIvejoXWEUmy7bIhHFzv5WNkB65ka0zhmzUDBdB
 MYcMDi/W4O/TyAHVO+Mcyel8G87Dps3SVGLh/otkLOcqKmVVzNy1nFUMbwEbREq64E5u
 aM0FZo7BtJn5GClBf8YUCl0anJa4ExZyhMf+NdZHfLp7g47X21DeaIwFLCGNny04uaJu
 deaT5K83/DKxUEqPi/fdLugp6FkQuOFp/NkCAKA9svobIjtBacNYR4lf0PXVDXVCScwZ
 07SA==
X-Gm-Message-State: APjAAAWohsIuMv/V1hOWISzWBCvFRAdZacao7ZsECSbOLgqbeFjWMddw
 xQixA0KO/6RACeTYdVsDoOLVUzs2ZnE+WfrEuBogSg==
X-Google-Smtp-Source: APXvYqzC+SZLS5J+4fhjs10zmFF3ZVskrEEqUdAP/3LUu2LLwXYMIIoYM0ZhbtGFlpH7G417ya7cYZF2uvns6Cyv43rpDw==
X-Received: by 2002:a37:9a8b:: with SMTP id c133mr4814616qke.261.1562919522167; 
 Fri, 12 Jul 2019 01:18:42 -0700 (PDT)
Date: Fri, 12 Jul 2019 01:17:44 -0700
In-Reply-To: <20190712081744.87097-1-brendanhiggins@google.com>
Message-Id: <20190712081744.87097-19-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190712081744.87097-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v9 18/18] MAINTAINERS: add proc sysctl KUnit test to PROC
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
 b=ajMvr06ssanFu9RH2ulwsIFgwcP3l/5lqWEJ4esAE7iplXyXRdoSrlII6lIzkciV9c
 8fS3nAoGa/HEi4KQyyTUBP5BR7yF3M+y9W97hSaSVNMs7BQDT5O+1ViXKXfznttmHdA4
 kZj77gRl1AQhpyhVrBktIROAMxvXbx6avdgvMOr4xBoGYGhyUIqfYD/dLpvgaPFXSOWO
 xbcNYLSdxlgrhAxlcEUApm2APOEsny1ZyIbfB8sr4BAZx09pOkCoMJnlgMX+1V3SASYs
 BSMIHfLGoKRYl/0WYsLgnjKM0J6KWHxKs/rp+Dqs7J9PUiYp83sE3bi0Q56vLyTXyarh
 dgxg==
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
