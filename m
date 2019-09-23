Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBA1BB097
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 11:04:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C8FD6E293;
	Mon, 23 Sep 2019 09:03:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com
 [IPv6:2607:f8b0:4864:20::649])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50E256E277
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 09:03:46 +0000 (UTC)
Received: by mail-pl1-x649.google.com with SMTP id x7so8212853plr.17
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 02:03:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=GL8bIr8dLG5/Kc/Y8WKLabBIaZO7WJH2uwuCEH7n76U=;
 b=UfVBtvYVJuu4rgX2YocPJBt3d+RqfUBMV07OCnQOPCpf8zzGQQR3ksGrBcjvX3vXYc
 bcjMGKBDPUnsGV/aFWYvrG2oBV6hD1S33o0uQPCceFraDkZJ+XdJItjSul4CDJVK/lxI
 5qYFeRI2lXprb47Ko7b7unFpUo53r6v9oSgmWOO/0hPnX+TEhDj61u59vWyZfPeAGvTD
 M51+qSsEFZyt8hxJLxoyygU2EZMcq2Z9HZFbqEF0nv3KiAnaU+1h/NEKK1hhk+9GnKPf
 hl9efyyiiNV0otOpDiVoDDBvZ2lyYsrLv0z5CjnIuYuhvYEAbUeGvY6QY0OmQojAdDah
 btpw==
X-Gm-Message-State: APjAAAUce4nPbgsqYZitF1o+WkrUAR32+07iOAKbphUf4K09b8d67h0K
 nSyhUrOk79qfm652V2Svh5Ax5MhH4OlpsfAy/QnmKA==
X-Google-Smtp-Source: APXvYqxHEgGNTtObJUfhRvTo0FGBMpt3QEn24wQykdFVcS3XLsFIcn8xjDZXfPIdHz3/ajFW+XsHHvIjGJVlc4qOgSQ11Q==
X-Received: by 2002:a63:1a5a:: with SMTP id a26mr28561962pgm.178.1569229424351; 
 Mon, 23 Sep 2019 02:03:44 -0700 (PDT)
Date: Mon, 23 Sep 2019 02:02:48 -0700
In-Reply-To: <20190923090249.127984-1-brendanhiggins@google.com>
Message-Id: <20190923090249.127984-19-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190923090249.127984-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.23.0.351.gc4317032e6-goog
Subject: [PATCH v18 18/19] MAINTAINERS: add proc sysctl KUnit test to PROC
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
 b=IK3lUhPXkzXhSvQIu+QuD9wg5OjRhXIx6R/1B72oWK2uJ0Nc49oBemxVDpO6gZkWRz
 r5Q+L670bXmCW3zMVAf3oMGaNtrGBuzg9HJNjTzgL1sBfwbcKO118nwQm0rJpddQednM
 KpNWZzKb0DUsUERs4XdcPVCF/89zqyiQ+dnDkgvo5ltfnBmV+HvyblX09P4dgdQPw2u0
 17yNFekR+X0MNh7fo92DkFObENGEJcH0ryjhE0Bm0qQeRMUt17q/Uq7kMA2sQZjESqQ1
 RQ+yW4hX3SAZxma4mXg0sDXgS2AFiXtg1oGzOgnvsob1BdP2nTD+FIzUrQah22RLTY5F
 9YNQ==
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
