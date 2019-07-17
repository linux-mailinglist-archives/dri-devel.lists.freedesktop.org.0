Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 090C66B3E1
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 03:56:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 852F56E21C;
	Wed, 17 Jul 2019 01:56:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com
 [IPv6:2607:f8b0:4864:20::74a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A02466E21C
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 01:56:39 +0000 (UTC)
Received: by mail-qk1-x74a.google.com with SMTP id s25so18664472qkj.18
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 18:56:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=jufAXaUURqTtvupks8boLXlDljriz0DHAMYuxhv6lic=;
 b=IEeIi0OauzJkqOSNHXItqktPmKVAGHRD2/N9Kf6SZXsi7hXszT4BiPnviIqWJv4JML
 05drr6zVItaw0Vt1qhwrDTxkE4z9GGLZH/ZF0WXuMRsUpvKatvawOc4Vx/PyLZlJtjUV
 flc4od+B8O92qYiMd9I6UR4w84k6SllhBOB/FcRcvkDKIiIJ7YTeK+k6dkxlXW59jeXF
 f52DDxkrDxXnXXREDFe1o+sKjK3ePWYTYKhTHuogP1YV6HeAxtLyV/oz54irX2Ruy3HH
 9ZYvfGYrtnbmf8XG4mMmcUMkEwpD59ZP10eh3FYPxMQDRTJOYZsNKnbyYOoFH/GEJc76
 fyGA==
X-Gm-Message-State: APjAAAWv8k8mAy9q+GT4Oes0T8SCK3+yu6kKmsLaXsScq6dm5QF6yECl
 ddRw9mHkpYuq0ecV2P/CAJcO9lSktLALgqoat/N7NQ==
X-Google-Smtp-Source: APXvYqzMYSoKc7xy2zJctW+VOk0X97W340OJGhZY9UWnWNDnmNnsODShc63XRgstRbuwVOYMn4U5hlDDzHSxHNwbM/EuvA==
X-Received: by 2002:a0c:983b:: with SMTP id c56mr27362503qvd.131.1563328597854; 
 Tue, 16 Jul 2019 18:56:37 -0700 (PDT)
Date: Tue, 16 Jul 2019 18:55:41 -0700
In-Reply-To: <20190717015543.152251-1-brendanhiggins@google.com>
Message-Id: <20190717015543.152251-17-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190717015543.152251-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
Subject: [PATCH v11 16/18] MAINTAINERS: add entry for KUnit the unit testing
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
 bh=jufAXaUURqTtvupks8boLXlDljriz0DHAMYuxhv6lic=;
 b=SGk0SE+L0ONJ56JV62STa9/73PYbsMRLW7f3+sjS9iJ06qvWnhKAtPAg9l1uLlJK2P
 j23MvuN/hdx6eNk0Sw24qNfxCfn572jDv0EOSpRkZDWR4kEOHhl0BL3CXfcXHolgVP8Y
 I0QBEb0fa7yqs7iHaQAuKiMhKWpMSPX7ku0rjDABrRO+wUSLFRjLLBuadRCtcHjn/fVS
 d9POs/tsM8//KlPtDm+hJmS0QJviJ86TTfbAqAmhuexuVugvnGbdgFAgkMG18GzeyJBi
 nhytU3u4UnQO1Bs6YNcSJksIEIqe1P7GjbzOxMsGI9bmzOUJlJ+8zoepM3HtUlGyoVoG
 e9Wg==
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
IAoyLjIyLjAuNTEwLmcyNjRmMmM4MTdhLWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
