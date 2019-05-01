Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA8010FEE
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2019 01:05:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B63892BF;
	Wed,  1 May 2019 23:05:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com
 [IPv6:2607:f8b0:4864:20::749])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53E68892F0
 for <dri-devel@lists.freedesktop.org>; Wed,  1 May 2019 23:05:03 +0000 (UTC)
Received: by mail-qk1-x749.google.com with SMTP id i124so667808qkf.14
 for <dri-devel@lists.freedesktop.org>; Wed, 01 May 2019 16:05:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=afBg8MXFYLPd4ElKfFZ/trSYMLXMP5LFZoVsy/mQzmY=;
 b=BSuVCgnWoe61AbpzCCOfQvoFhah38pN7zA5OhaObeCtmZM9AgZ0+lR0uix78rkre7H
 qftAzid/9CWrJY2ldogPdxgBXPaU/GUlnqhbceTUPm0424PaZxORPAoh91G34I9cAaOV
 GRUvac9Td7K6NtxCeVrI/xA/i0EHP/FliJ5qpxWzuddnQkTq3U+BxYQrZxCFXQbXugfT
 EJ4lfHKlSRIiXrDo5uCA4JjLUx450slbWAIvldpn4tEws0HS38F8NgnnrSTCf19FS0LN
 GTPwcIq4yo0pX78J6foNInbJlnYr1+XSbglJKXNUdTEcRXXfmxmwaXEnuNy+r4GZ1o+k
 QFFg==
X-Gm-Message-State: APjAAAXesYWO1dOWT/y9hx3JrZmmKMPPEDsmNPpQww/BAQ5uWE1DYG3e
 HIvbyV241ZEtVBUHO16wqIDSbEpOS6hGr7R/zPZUvw==
X-Google-Smtp-Source: APXvYqyrbTtQWB061i/IuTmGR1fZJktprQX+nOIOp8d1N9azYCgnL4QkQ8IwHRr2AUs5hUUYn4R+op23q7+ENLYHRpSNog==
X-Received: by 2002:ad4:5365:: with SMTP id e5mr604591qvv.197.1556751902442;
 Wed, 01 May 2019 16:05:02 -0700 (PDT)
Date: Wed,  1 May 2019 16:01:24 -0700
In-Reply-To: <20190501230126.229218-1-brendanhiggins@google.com>
Message-Id: <20190501230126.229218-16-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190501230126.229218-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
Subject: [PATCH v2 15/17] MAINTAINERS: add entry for KUnit the unit testing
 framework
From: Brendan Higgins <brendanhiggins@google.com>
To: frowand.list@gmail.com, gregkh@linuxfoundation.org, keescook@google.com, 
 kieran.bingham@ideasonboard.com, mcgrof@kernel.org, robh@kernel.org, 
 sboyd@kernel.org, shuah@kernel.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=afBg8MXFYLPd4ElKfFZ/trSYMLXMP5LFZoVsy/mQzmY=;
 b=PS4XqgmjxFmmLNG4a7+Yce39oWOBnGeJYietXRtGGHG0s3tkKrTLVv7t3JuVJrcTc1
 KutFoAYJImIE74KhH7bcdjYmLxEqwrGbPqelhF2X00dTLnac17nc5IPrwiXTTicbz2f9
 yHnW72a+93CtmfTKR5QnGRSzt8et/Ly4ZcAVMfSHn+SCxSXzw1zkw1nB3vFldf3GmDRW
 V4jWuf1z1oJKJ/mTHNywIeCyEt6ToYpE7TZ6xlVusdVzZZyPSGv5HNpNNowdGSJw2egz
 dfdafxGTQxLWVkGcavQ+2Y+ar4k87+QhgoKGq5GA6P9r8ZHVHqdJk/unxr+39pqN5T9x
 Di2w==
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
 kunit-dev@googlegroups.com, richard@nod.at, linux-kernel@vger.kernel.org,
 mpe@ellerman.id.au, linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIG15c2VsZiBhcyBtYWludGFpbmVyIG9mIEtVbml0LCB0aGUgTGludXgga2VybmVsJ3MgdW5p
dCB0ZXN0aW5nCmZyYW1ld29yay4KClNpZ25lZC1vZmYtYnk6IEJyZW5kYW4gSGlnZ2lucyA8YnJl
bmRhbmhpZ2dpbnNAZ29vZ2xlLmNvbT4KLS0tCiBNQUlOVEFJTkVSUyB8IDEwICsrKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5F
UlMgYi9NQUlOVEFJTkVSUwppbmRleCA1YzM4ZjIxYWVlNzg3Li5jNzhhZTk1YzU2YjgwIDEwMDY0
NAotLS0gYS9NQUlOVEFJTkVSUworKysgYi9NQUlOVEFJTkVSUwpAQCAtODQ0OCw2ICs4NDQ4LDE2
IEBAIFM6CU1haW50YWluZWQKIEY6CXRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzLwogRjoJRG9jdW1l
bnRhdGlvbi9kZXYtdG9vbHMva3NlbGZ0ZXN0KgogCitLRVJORUwgVU5JVCBURVNUSU5HIEZSQU1F
V09SSyAoS1VuaXQpCitNOglCcmVuZGFuIEhpZ2dpbnMgPGJyZW5kYW5oaWdnaW5zQGdvb2dsZS5j
b20+CitMOglrdW5pdC1kZXZAZ29vZ2xlZ3JvdXBzLmNvbQorVzoJaHR0cHM6Ly9nb29nbGUuZ2l0
aHViLmlvL2t1bml0LWRvY3MvdGhpcmRfcGFydHkva2VybmVsL2RvY3MvCitTOglNYWludGFpbmVk
CitGOglEb2N1bWVudGF0aW9uL2t1bml0LworRjoJaW5jbHVkZS9rdW5pdC8KK0Y6CWt1bml0Lwor
RjoJdG9vbHMvdGVzdGluZy9rdW5pdC8KKwogS0VSTkVMIFVTRVJNT0RFIEhFTFBFUgogTToJTHVp
cyBDaGFtYmVybGFpbiA8bWNncm9mQGtlcm5lbC5vcmc+CiBMOglsaW51eC1rZXJuZWxAdmdlci5r
ZXJuZWwub3JnCi0tIAoyLjIxLjAuNTkzLmc1MTFlYzM0NWUxOC1nb29nCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
