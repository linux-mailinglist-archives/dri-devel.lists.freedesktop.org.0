Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBC21C26A
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 07:46:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D317892A1;
	Tue, 14 May 2019 05:46:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc49.google.com (mail-yw1-xc49.google.com
 [IPv6:2607:f8b0:4864:20::c49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C22F48929F
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 05:46:38 +0000 (UTC)
Received: by mail-yw1-xc49.google.com with SMTP id v127so29116227ywb.20
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 22:46:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=NNCnVCTAATMxlDMarLLJ67yqDDVFt+vwrBh9wh5mNVQ=;
 b=qSgMpE8/bP6Zbud59rIjvXBqNlhJknrnXwTRplNsQfZCxClK4P3AzuJQnoMKHW/0kI
 Q8O8vPELSIQqnvGKw+i8XyVMzqH0V54M1hvg7z0D4Zr9AF/cPySpwfbsQBPwZr0aWDTo
 0u5H9/fvpKpRyFrjGkLegogka41CwZCZxmgImEzgya5qbIIvt8Qu6A0mCxP2yWt+JiQT
 3e5CIODWI4c5IkeUqcefN7gjpaHubCAcjuRJc6yafnwareycXZBHBVFRpnUIOg3BXWWZ
 JjD/ntehoda0cw8Px5uqoLZXqWChFYSpzgOn8C/F9+a0VLxAgfXz5Rfx/dVboaZjjB0i
 ZMdg==
X-Gm-Message-State: APjAAAWWZh+QSRgNnc7lzpuZ3zyxB51iYV89bG0TiCNnxr83dgXv518v
 WhVXNPFczvaOfJQ0mT2y6i1Pdt/LYWgUOAOrWT6eRw==
X-Google-Smtp-Source: APXvYqzDnMJ4szPxIA4N77qJLw1e3aRJqDLenWVgRY3sM/QbVOHbh8x+6bBUoK7BNggbwfl2r5XHp/gCvYGW7uZKqd8+nw==
X-Received: by 2002:a81:9b17:: with SMTP id s23mr15952402ywg.503.1557812797962; 
 Mon, 13 May 2019 22:46:37 -0700 (PDT)
Date: Mon, 13 May 2019 22:42:52 -0700
In-Reply-To: <20190514054251.186196-1-brendanhiggins@google.com>
Message-Id: <20190514054251.186196-19-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190514054251.186196-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
Subject: [PATCH v3 18/18] MAINTAINERS: add proc sysctl KUnit test to PROC
 SYSCTL section
From: Brendan Higgins <brendanhiggins@google.com>
To: frowand.list@gmail.com, gregkh@linuxfoundation.org, keescook@google.com, 
 kieran.bingham@ideasonboard.com, mcgrof@kernel.org, robh@kernel.org, 
 sboyd@kernel.org, shuah@kernel.org, tytso@mit.edu, 
 yamada.masahiro@socionext.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=NNCnVCTAATMxlDMarLLJ67yqDDVFt+vwrBh9wh5mNVQ=;
 b=ogDQD8ZjbQ6rQB/cWAayl+9VthgdTRB4N9+9GyMbHO4DiRsdRDrdV4hPILgY7Dd+L0
 I2RHu02OyvKeDL+lm6hCGMoAmOxcXp1iclHCDygBWy5BFLe5GT+edQ82hOKLR/JJ9KdQ
 11b1p3QAxEdg7lXAO1lNroEn+qdvSJWt3iw3DL5AYhMjgqkE31tSGZQfrWeGG6OKTYPS
 afsxa8QMIeJn+iGaVG/JH2h1LJjJKyL47IF09+kVKczWp9X/zQGgRpH1Zc1iYBbEn+oS
 scXx1DItvS3mhp2+j2MbNl8vNbIJweBsYUaOnaq+FaUIBk4qrqEB0Zys9RYKfXBLRZW1
 bh9g==
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
 rostedt@goodmis.org, julia.lawall@lip6.fr, dan.j.williams@intel.com,
 kunit-dev@googlegroups.com, richard@nod.at, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, mpe@ellerman.id.au,
 linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGVudHJ5IGZvciB0aGUgbmV3IHByb2Mgc3lzY3RsIEtVbml0IHRlc3QgdG8gdGhlIFBST0Mg
U1lTQ1RMIHNlY3Rpb24uCgpTaWduZWQtb2ZmLWJ5OiBCcmVuZGFuIEhpZ2dpbnMgPGJyZW5kYW5o
aWdnaW5zQGdvb2dsZS5jb20+ClJldmlld2VkLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdr
aEBsaW51eGZvdW5kYXRpb24ub3JnPgpSZXZpZXdlZC1ieTogTG9nYW4gR3VudGhvcnBlIDxsb2dh
bmdAZGVsdGF0ZWUuY29tPgotLS0KIE1BSU5UQUlORVJTIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCmlu
ZGV4IDhhOTE4ODdjOGQ1NDEuLjJlNTM5NjQ3NTg5ZmQgMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJT
CisrKyBiL01BSU5UQUlORVJTCkBAIC0xMjUyNiw2ICsxMjUyNiw3IEBAIFM6CU1haW50YWluZWQK
IEY6CWZzL3Byb2MvcHJvY19zeXNjdGwuYwogRjoJaW5jbHVkZS9saW51eC9zeXNjdGwuaAogRjoJ
a2VybmVsL3N5c2N0bC5jCitGOglrZXJuZWwvc3lzY3RsLXRlc3QuYwogRjoJdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMvc3lzY3RsLwogCiBQUzMgTkVUV09SSyBTVVBQT1JUCi0tIAoyLjIxLjAuMTAy
MC5nZjI4MjBjZjAxYS1nb29nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
