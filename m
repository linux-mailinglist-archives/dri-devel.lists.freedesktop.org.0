Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEC664231
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 09:17:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B4C89B61;
	Wed, 10 Jul 2019 07:17:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com
 [IPv6:2607:f8b0:4864:20::449])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5127789A88
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 07:16:59 +0000 (UTC)
Received: by mail-pf1-x449.google.com with SMTP id e20so848296pfd.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 00:16:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=/VeT4LMsGiTV0pNK4XYxpXDHYp6raL7HPeQMcvopP9E=;
 b=XJ6L40FrEVD67V5/FZoHcXjnkemz3/2GrJygjpmojRunnmQYbFwjy7wSqMyJXvPc3l
 s2/VJdpnT8RzUfr50DbxiK2ImLZ4fcSPZl5oUPqTeDuEm2EemMJOeoiR5MkaBaEMEQaz
 XdgNifs4bmY73euZnTpCUizaPmFlRwnYHcBJgyYn4Vor6+p8tV64uegaTZ9693PMyB2F
 5PfdKTVHwVJbJVQqDkedxbmoU5D/ifB0S3fTfoxGJD/OW6MzdCIH3nIv66G19al5BAiO
 efHTTjeUwOpSffkBlru601NLGDH5smEDtPCpxFBNCuhE01UnknROok1rM1vpwoPFKkDh
 k5Vw==
X-Gm-Message-State: APjAAAUoHVlRC4IlEKq2e8/UBh7pRAnZzoukEmcA0g1LSKTD4LcTXo2Q
 +fsWHL42E4NH8voDbkBHbx8fkd13KGseWSh98cGXVA==
X-Google-Smtp-Source: APXvYqy3gEnvLtzenDeoBpvruwM86/d4R4MSA4rfrSkFPoe3MSdS+t35zDjs7EFvAtglaLFEtGooue6BA3jgPd6GRUh5Fg==
X-Received: by 2002:a63:d0:: with SMTP id 199mr35409907pga.85.1562743018345;
 Wed, 10 Jul 2019 00:16:58 -0700 (PDT)
Date: Wed, 10 Jul 2019 00:15:06 -0700
In-Reply-To: <20190710071508.173491-1-brendanhiggins@google.com>
Message-Id: <20190710071508.173491-17-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190710071508.173491-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v8 16/18] MAINTAINERS: add entry for KUnit the unit testing
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
 bh=/VeT4LMsGiTV0pNK4XYxpXDHYp6raL7HPeQMcvopP9E=;
 b=BlZBqRR1qRdimox75W2P/i8C72pSin2IGTFtfmWWoBCvv+dsuvBdZ3/5aEpQ89PXk2
 HuskMyBFp2JqOQVUUEK0hsAQ0kjZkM8S/FywQuU6p0ypQLPCs+6NoLDj1kq51PvEuYF5
 qrdgV1mMDoflgBNJCXAcSwSGNYJkMOXfQvDOfH0JYLVQXGZ1i6UKi+51vZvxngVYRCqi
 zUJQpdHTuvjJ6rn5moXv9JrV9XiIipdlgDqKiR4V1XRaP/xyAV9wQ3bDfUgimZ4sWrJO
 BOrrvDOkdcB9a2+X4Dl7x+F0dFrJO/wdly+nhX3UZItJ2/G7J+HtrefxGaobvJsGaO8S
 dzoQ==
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
UyBiL01BSU5UQUlORVJTCmluZGV4IDY3N2VmNDFjYjAxMmMuLjQ4ZDA0ZDE4MGE5ODggMTAwNjQ0
Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJTCkBAIC04NTk5LDYgKzg1OTksMTcg
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
