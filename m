Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D10BA250
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2019 14:06:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90CE76E0F0;
	Sun, 22 Sep 2019 12:04:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd49.google.com (mail-io1-xd49.google.com
 [IPv6:2607:f8b0:4864:20::d49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E806B6E04A
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2019 07:37:10 +0000 (UTC)
Received: by mail-io1-xd49.google.com with SMTP id r5so14457706iop.2
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2019 00:37:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=GL8bIr8dLG5/Kc/Y8WKLabBIaZO7WJH2uwuCEH7n76U=;
 b=mh1rGoHAdbh0W5Dy4QpgvgS7SSX900eCImT4eiFrW5YaB9SLB0uro1gGt+rMkua93b
 aQvV6jPBPlFD8rUGR+TpttozGE71XSAVzssF+mt4bYewcnMaitSz3cLKcll9iaObrO/+
 0wbRPsYWDVT8LaLtXqs1PENIkgEA/IZ3AXF2zL/KMvB8s6byFTctmG0wQbBxM3gtoK4r
 aoBh5cxtYY6+WLHEOxNouwmtPFMU1ViOs0Yh1jSviyrkv3FAz9TXlvFWZo1FIPeFTX6c
 Dg+1KniTpsbiEtAbLDeGuWFyKFfHNmNiSvXVQdQ2jpiO/3Wola63ICC3pvQbqJlfOjc9
 j5eQ==
X-Gm-Message-State: APjAAAVTY2nnRXke6mFArlpab+33jiQ+0B1OUdjiUMH+/7rpXgy/A9ER
 fu2PB8l5l22arNbVXfRBu89xYsD6T/WRhTowHBw3SQ==
X-Google-Smtp-Source: APXvYqzXl1Z5WO9dWeLbpxv4VzPzrj0gpja77fNZj2M2QIzsJxEJrlfVmtKghEGLDfEqjyLta/fW30aIAzXg7GqHAbqviQ==
X-Received: by 2002:a63:b954:: with SMTP id v20mr17995160pgo.140.1569025194919; 
 Fri, 20 Sep 2019 17:19:54 -0700 (PDT)
Date: Fri, 20 Sep 2019 17:18:54 -0700
In-Reply-To: <20190921001855.200947-1-brendanhiggins@google.com>
Message-Id: <20190921001855.200947-19-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190921001855.200947-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.23.0.351.gc4317032e6-goog
Subject: [PATCH v17 18/19] MAINTAINERS: add proc sysctl KUnit test to PROC
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
 bh=GL8bIr8dLG5/Kc/Y8WKLabBIaZO7WJH2uwuCEH7n76U=;
 b=JOe+XfR60TVQqjAO/rFGpvwAcA/DeU0SVyM/HI2Zhgf+PtyQB0/LAoxlOspG28eTUB
 KN9jxB3mTzgH/VAIVLmulJHeZb79W2QD+ooJERsLdgQedeMWn7VcN7Es1aYnH0Gkhhwi
 IWLHePrpOKcGs0YbMH6P+d7N9pQmEfolkxrEGwDrz/ATDZir+fRfFHmN/SDktuIu5Rh2
 YIeerHsfSRWFqIBf6DnJxi13eT3crcKMRNm5YJ3SiPsnPe1bj3g68f8sQWHI3XdZy9LM
 zpm7N5ugYQFlZqq0A7vg+AC3kwfWXBikM38GfptB+DWaOMSZABTa2cAcFPjPTvyX4Vkh
 9gwg==
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
 kunit-dev@googlegroups.com, richard@nod.at, torvalds@linux-foundation.org,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org, mpe@ellerman.id.au,
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
UwppbmRleCBlM2QwZDE4NGFlNGUuLjY2NjNkNGFjY2QzNiAxMDA2NDQKLS0tIGEvTUFJTlRBSU5F
UlMKKysrIGIvTUFJTlRBSU5FUlMKQEAgLTEyOTgzLDEyICsxMjk4MywxNCBAQCBGOglEb2N1bWVu
dGF0aW9uL2ZpbGVzeXN0ZW1zL3Byb2MudHh0CiBQUk9DIFNZU0NUTAogTToJTHVpcyBDaGFtYmVy
bGFpbiA8bWNncm9mQGtlcm5lbC5vcmc+CiBNOglLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVt
Lm9yZz4KK006CUl1cmlpIFphaWtpbiA8eXphaWtpbkBnb29nbGUuY29tPgogTDoJbGludXgta2Vy
bmVsQHZnZXIua2VybmVsLm9yZwogTDoJbGludXgtZnNkZXZlbEB2Z2VyLmtlcm5lbC5vcmcKIFM6
CU1haW50YWluZWQKIEY6CWZzL3Byb2MvcHJvY19zeXNjdGwuYwogRjoJaW5jbHVkZS9saW51eC9z
eXNjdGwuaAogRjoJa2VybmVsL3N5c2N0bC5jCitGOglrZXJuZWwvc3lzY3RsLXRlc3QuYwogRjoJ
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvc3lzY3RsLwogCiBQUzMgTkVUV09SSyBTVVBQT1JUCi0t
IAoyLjIzLjAuMzUxLmdjNDMxNzAzMmU2LWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
