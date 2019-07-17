Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C1D6B3EE
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 03:56:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA926E21F;
	Wed, 17 Jul 2019 01:56:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com
 [IPv6:2607:f8b0:4864:20::54a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F3B66E21E
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 01:56:44 +0000 (UTC)
Received: by mail-pg1-x54a.google.com with SMTP id 30so13716003pgk.16
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 18:56:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=z+RsQ5cMJRNJEspG7oJoFcFROmHPEJhG9JB06H11s3Q=;
 b=Y04Eewrde9DI3TJMOB4JXwOw/WB3iDRb0bhBJW22z2H5GtPj/0/wJbgOtU0rha2nSi
 k52/K37NaG5x/Le8/SPs2zX4DGxhXUTr8uVTbn5TVZxM8onl9CZwz1UhqDAclqtxS8Db
 PYqLpmDel5EhxttLjzEhPf+dNeGMyPkCV/58LXUklmVAl6srl7wOzAuQA8cJErdqe6dz
 lp+4fX/YZW9h2HHFOy0NCJoxr9fIsi57B7H36PpXEFRQdnNZwX2hVjxnXBnX/QZOMhYE
 ZxnXjhHHoHmzDIPUDA253w5eVdapmZbJ1oLZL0uwJCZ8ItjYB6DTKb0cB0HFDZYpu8n9
 z3aQ==
X-Gm-Message-State: APjAAAVxtooai7kyPcT/r75GkbZj13RLSYCd39ei+Y7J2ubF3aIYrVec
 WT362qqMttXghL1b+ghVgtTExTVt1mrVHr/5x3KIpw==
X-Google-Smtp-Source: APXvYqwCZQKnuVk17fjP8A6U6bIZkWGFvrucA1ktqKosKL/38OKDiYQRbphN4EY4EbgHhiCugGJd7KJEeLMjHEFzWtBqZg==
X-Received: by 2002:a65:4505:: with SMTP id n5mr34106191pgq.301.1563328603229; 
 Tue, 16 Jul 2019 18:56:43 -0700 (PDT)
Date: Tue, 16 Jul 2019 18:55:43 -0700
In-Reply-To: <20190717015543.152251-1-brendanhiggins@google.com>
Message-Id: <20190717015543.152251-19-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190717015543.152251-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
Subject: [PATCH v11 18/18] MAINTAINERS: add proc sysctl KUnit test to PROC
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
 bh=z+RsQ5cMJRNJEspG7oJoFcFROmHPEJhG9JB06H11s3Q=;
 b=arQQpTGJERz+HpGPXFp2jlPN5FrwHz2WQgWAk2OJzhGjTvteOU1VI4pyg3Gluszw+4
 vjWiOIXlN3LE6Wmx+vW8ya52UlgsM6wNwD7n+F3tTlm0oU8wIAFq/wdLYE/uqwXxmQlX
 XH8Q+EuWSZgjc3pc2sIgMXZRv15qqL94qa0UO9XEjvbkfa9x4jqUS6XSlv6anCR5d/Qu
 TojpzGJ8KJngr73CNti9m0kYQQzcoyj/lkheRLPJEVpXYgERpvNTv8Z1n1LTd7t4E729
 ECeSIi3rVf+NrWYm31K34bfHpNTeBSIN8kh5bzP8sJs2A90bieFh3IVp2mMrPJo+7TpA
 I/fQ==
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
LS0gCjIuMjIuMC41MTAuZzI2NGYyYzgxN2EtZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
