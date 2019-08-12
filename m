Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 254708A607
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 20:25:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA33B6E5C0;
	Mon, 12 Aug 2019 18:25:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 168246E5C0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 18:25:30 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id a2so66912109ybb.14
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 11:25:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=wKRiEgRg+/DU2DEnW3JXAo2ALm03Zt5EFSXAgxYeqSQ=;
 b=VUX7akJ0zCqbCLWAzxXePrw6u4nE9A1DnxykMaDeVQka3HPvS27ygUCRrpnRwzboce
 KQILw9pUkaMJCRkprZI1A89cV92JnSnglooK4FZpJos+cFFb0ny1PfPLAQH0jbZsDYnd
 nWniM/d079JlFme7E3F1O7HufmysrqsCiORR+7Pc9VGg478GETv/qXnD+pqk8mtOQKXE
 YKjWrwDRALceW5xi86gEnTzDbaHTsE9hcuhsBpJiXX7LX6dR9Lu9KkNMXOqVKn1/oXjY
 orT+m+lUGSRAt9uemkNcJqnhy1BGOmsUUw2inN/RJACNmw5vuylJlL6ihi/bFDkeXKlu
 wglg==
X-Gm-Message-State: APjAAAXpOrcUMV8AIcwyxEqQ7/LLXfVgdl/eGTQHp7LH+1nPURJco04W
 hclGLtiat0vEI+Yqz7dF4mfLkITBZ1C/hFaR9AL0FQ==
X-Google-Smtp-Source: APXvYqxpxYTLOV5V1kn9LOQBhsmrb/fq8obCcCZvetERJ23Gxs2qvszs3YbcjsnmIpYv/bSBR6DeRIUcOWhVdcSb2iYi7g==
X-Received: by 2002:a0d:ea06:: with SMTP id t6mr22043435ywe.186.1565634328967; 
 Mon, 12 Aug 2019 11:25:28 -0700 (PDT)
Date: Mon, 12 Aug 2019 11:24:21 -0700
In-Reply-To: <20190812182421.141150-1-brendanhiggins@google.com>
Message-Id: <20190812182421.141150-19-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190812182421.141150-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v12 18/18] MAINTAINERS: add proc sysctl KUnit test to PROC
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
 bh=wKRiEgRg+/DU2DEnW3JXAo2ALm03Zt5EFSXAgxYeqSQ=;
 b=nZnW3WMQCz05l6ICEKDk76hmQbTheMtNmdq6JZ/QeZtYLtrZAiLqFFk1eMlHLSI2Od
 tokkC6/x0TWcLVC526+YvItwTB3ptDoHYp4j+cKEDqvfWUkOE8rrgMYMDQMcytdEnpVK
 Javjy9SQgBLtDD2dU2xplDFS+oxT0Ga2sX3Ril4r8MutRMQa14VuakHxFBNsWNrIAS4h
 DIRtjGVGWR9OjKG7snnTFLDSjqbzGtpfYXGEzsQCXJHzRILzFeuxO2G2H0dY4nW8xd59
 l8IM2CEN0WEFxIOai8A1vQcyPfIG9qh+YILDCG39P1E9EDx0psdbHXaGAxoXDAVQ1+6l
 UrzQ==
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
UwppbmRleCBmMGJkNzdlOGE4YTJmLi4wY2FjNzg4MDcxMzdiIDEwMDY0NAotLS0gYS9NQUlOVEFJ
TkVSUworKysgYi9NQUlOVEFJTkVSUwpAQCAtMTI5NjUsMTIgKzEyOTY1LDE0IEBAIEY6CURvY3Vt
ZW50YXRpb24vZmlsZXN5c3RlbXMvcHJvYy50eHQKIFBST0MgU1lTQ1RMCiBNOglMdWlzIENoYW1i
ZXJsYWluIDxtY2dyb2ZAa2VybmVsLm9yZz4KIE06CUtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21p
dW0ub3JnPgorTToJSXVyaWkgWmFpa2luIDx5emFpa2luQGdvb2dsZS5jb20+CiBMOglsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnCiBMOglsaW51eC1mc2RldmVsQHZnZXIua2VybmVsLm9yZwog
UzoJTWFpbnRhaW5lZAogRjoJZnMvcHJvYy9wcm9jX3N5c2N0bC5jCiBGOglpbmNsdWRlL2xpbnV4
L3N5c2N0bC5oCiBGOglrZXJuZWwvc3lzY3RsLmMKK0Y6CWtlcm5lbC9zeXNjdGwtdGVzdC5jCiBG
Ogl0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9zeXNjdGwvCiAKIFBTMyBORVRXT1JLIFNVUFBPUlQK
LS0gCjIuMjMuMC5yYzEuMTUzLmdkZWVkODAzMzBmLWdvb2cKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
