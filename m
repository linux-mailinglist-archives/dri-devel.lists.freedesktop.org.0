Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B829BA69
	for <lists+dri-devel@lfdr.de>; Sat, 24 Aug 2019 03:35:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A69906ED9A;
	Sat, 24 Aug 2019 01:35:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com
 [IPv6:2607:f8b0:4864:20::649])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 622A86ED93
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Aug 2019 01:35:28 +0000 (UTC)
Received: by mail-pl1-x649.google.com with SMTP id y22so6838617plr.20
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 18:35:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=RZYwg2AKNWWbK5AlePl3YpD83HqbQqaQ/S9W/auEYuc=;
 b=JoCNXiFI7mXatqQt5Y/Vq0Bg59BRhzLoSOGQjTLP/CAOYGVlzTXhCw3jlgG7uBv9fE
 ElrcwYxhnh9h48C8Gs5oKsDigoVJ6cpRP1F/ZNQ7OWMJt+e0DF15VpIqUDaFw4mzeSx9
 vRnqqtVXpVvbpHJEjOb/FBT6/85E398sp5Y9qexMhJ3ORvX13Jpz4V68w2SNVACMogFf
 +P1HoOMmZHxv8ln9FJxHxT4XW7mLyW/9HtvNtAz1CWxnIBpgwt7fjfw3a5q0zp4qbey1
 7B0kF81j5Bse8zXmqIFqy/Ek5fErooXKT0F69EKcXub4FgYd7/VUg+N/QPEwIFIetjaJ
 d6cA==
X-Gm-Message-State: APjAAAXzl/Rm5AI9WwPHnN0lCsRWNQhiVPCbuum9EnOjtz5KWDagCGeh
 anmuWP0WJwQPD+VlSC2hVKkEez5m89g89XYRmmYUOA==
X-Google-Smtp-Source: APXvYqxeho9rBF0ZZ6VsD/UiYLMznIviw0ZlKZiyS4hv5yytF5NdlNUif2Pu10B+ZY4kXv3ubxh1pUBcBlFmg94D169gig==
X-Received: by 2002:a63:c03:: with SMTP id b3mr6561436pgl.23.1566610527139;
 Fri, 23 Aug 2019 18:35:27 -0700 (PDT)
Date: Fri, 23 Aug 2019 18:34:25 -0700
In-Reply-To: <20190824013425.175645-1-brendanhiggins@google.com>
Message-Id: <20190824013425.175645-19-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190824013425.175645-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
Subject: [PATCH v15 18/18] MAINTAINERS: add proc sysctl KUnit test to PROC
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
 bh=RZYwg2AKNWWbK5AlePl3YpD83HqbQqaQ/S9W/auEYuc=;
 b=sXlKKJhgEU1wa6b+t1Kfk3Us9JBNqB6qgFrYAorUjpNahnQtVB62F129r9jqW7As2D
 TECRv23j+orFXVoF1btyTlgKbGavDLv/mRXRpxUvewJTVsSyWUiwJR/MDWHL2k4m7043
 cnxd+RK+ZXWwaD0m4kGAzCv3TPvws/OkUrPxVWvZj7C8gOUsEIbG1ulzMU+UBC5ulBWq
 dWbj8dEXXE7CGrs/FCxd7vyonAjP9xvohhPSk8O9Rj98/htG5iBLR1KI8Hh4Pbg0s00U
 4YCNUKyFTqpEwz4Jf4CPs5qIZGCq3zkZi2UB5XVr4PO3/OBx5gUJAlDS2TXKFE4g9qqr
 g5EQ==
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
UwppbmRleCBmMGJkNzdlOGE4YTIuLjBjYWM3ODgwNzEzNyAxMDA2NDQKLS0tIGEvTUFJTlRBSU5F
UlMKKysrIGIvTUFJTlRBSU5FUlMKQEAgLTEyOTY1LDEyICsxMjk2NSwxNCBAQCBGOglEb2N1bWVu
dGF0aW9uL2ZpbGVzeXN0ZW1zL3Byb2MudHh0CiBQUk9DIFNZU0NUTAogTToJTHVpcyBDaGFtYmVy
bGFpbiA8bWNncm9mQGtlcm5lbC5vcmc+CiBNOglLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVt
Lm9yZz4KK006CUl1cmlpIFphaWtpbiA8eXphaWtpbkBnb29nbGUuY29tPgogTDoJbGludXgta2Vy
bmVsQHZnZXIua2VybmVsLm9yZwogTDoJbGludXgtZnNkZXZlbEB2Z2VyLmtlcm5lbC5vcmcKIFM6
CU1haW50YWluZWQKIEY6CWZzL3Byb2MvcHJvY19zeXNjdGwuYwogRjoJaW5jbHVkZS9saW51eC9z
eXNjdGwuaAogRjoJa2VybmVsL3N5c2N0bC5jCitGOglrZXJuZWwvc3lzY3RsLXRlc3QuYwogRjoJ
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvc3lzY3RsLwogCiBQUzMgTkVUV09SSyBTVVBQT1JUCi0t
IAoyLjIzLjAuMTg3LmcxN2Y1Yjc1NTZjLWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
