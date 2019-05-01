Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A4F10FF4
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2019 01:05:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651318934F;
	Wed,  1 May 2019 23:05:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc4a.google.com (mail-yw1-xc4a.google.com
 [IPv6:2607:f8b0:4864:20::c4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 624C789343
 for <dri-devel@lists.freedesktop.org>; Wed,  1 May 2019 23:05:08 +0000 (UTC)
Received: by mail-yw1-xc4a.google.com with SMTP id 11so1125946ywt.12
 for <dri-devel@lists.freedesktop.org>; Wed, 01 May 2019 16:05:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=PRLXnvg3FnToIBJTwXVR7d2TK/MHZSW5pjHfdNwtr7Q=;
 b=sD6/HWq395kgNNYOfbE980b6Qe0VrKqFcBFo4SlESjMQ9uFC2BziIrV1zFHt4UfJ6q
 ckuru90bDG9jMWWe0Mg94EpCl7l3yRXxfxzmzEcDuRXrCONJMTLV3hTijlil6BkAtCrI
 CXY+RBDf4AMo9K55jpL8dN1XmPTex05KmkJ6JqZar4NBXZxmCy8HDFZ0MtiMmZHS4jVO
 EeTDUps6yQ5/Zq3wA5VX5l7FOZyKWldxuYE4CJasElqJ7ZLffCSt/umifUCszwFMnKQV
 KI/yBkyOyiHia84rfBGg7NZgh5Lz5eSqA/kOrb6DRYI3A0kk3YA+iiT/Jab2GWFSDR/7
 DWbA==
X-Gm-Message-State: APjAAAUND9rZbFNc3cW86I851d81MrPmWwPyF8P5HyQ2WogXXU1pSBY5
 mb461IvOarc6jDvsbztGlgi9V97FHtnHgnu4visqwA==
X-Google-Smtp-Source: APXvYqxSccXA/VUA/6JwG1W+T505ogTb6cCEY1XA3skvxQHV+dYiYJA75B70f0UwwhMZGG1vCcs3UYjo4MLfLh9fEqXVcw==
X-Received: by 2002:a25:aa87:: with SMTP id t7mr327533ybi.419.1556751907604;
 Wed, 01 May 2019 16:05:07 -0700 (PDT)
Date: Wed,  1 May 2019 16:01:26 -0700
In-Reply-To: <20190501230126.229218-1-brendanhiggins@google.com>
Message-Id: <20190501230126.229218-18-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190501230126.229218-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
Subject: [PATCH v2 17/17] MAINTAINERS: add proc sysctl KUnit test to PROC
 SYSCTL section
From: Brendan Higgins <brendanhiggins@google.com>
To: frowand.list@gmail.com, gregkh@linuxfoundation.org, keescook@google.com, 
 kieran.bingham@ideasonboard.com, mcgrof@kernel.org, robh@kernel.org, 
 sboyd@kernel.org, shuah@kernel.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=PRLXnvg3FnToIBJTwXVR7d2TK/MHZSW5pjHfdNwtr7Q=;
 b=K5TwnumODggM3WBroA2xjKir+Hf59I1szowVRTt0lzCy/25DKO4Auoy9KuasdBqFUu
 UWvBOKOTmtxVhAOl4er1T2140+nu1Bz+99TiGL9+yTK//z+jqboMkU5aijHYP0BbYsOh
 P/McaehM5toEAU772+pJGpQWNEZx5xhfrNPAJoKaW0IpWIVJaq0KjD8R8F3QXpB30i5m
 XrT04TmEJJAw/8yrNXA4XJeGyU/uVcdsIpKRYnl9kRb2X6reSvrGJiWqLpi2xAFDwIgz
 M+mClrFoRM5PxaczMRkZTVN0VXOBXS2l+ZY6dXc7xjKICM5LbtnpXVDT7unPYWdXqa7Y
 wpCA==
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

QWRkIGVudHJ5IGZvciB0aGUgbmV3IHByb2Mgc3lzY3RsIEtVbml0IHRlc3QgdG8gdGhlIFBST0Mg
U1lTQ1RMIHNlY3Rpb24uCgpTaWduZWQtb2ZmLWJ5OiBCcmVuZGFuIEhpZ2dpbnMgPGJyZW5kYW5o
aWdnaW5zQGdvb2dsZS5jb20+Ci0tLQogTUFJTlRBSU5FUlMgfCAxICsKIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMK
aW5kZXggYzc4YWU5NWM1NmI4MC4uMjNjYzk3MzMyYzNkNyAxMDA2NDQKLS0tIGEvTUFJTlRBSU5F
UlMKKysrIGIvTUFJTlRBSU5FUlMKQEAgLTEyNTI0LDYgKzEyNTI0LDcgQEAgUzoJTWFpbnRhaW5l
ZAogRjoJZnMvcHJvYy9wcm9jX3N5c2N0bC5jCiBGOglpbmNsdWRlL2xpbnV4L3N5c2N0bC5oCiBG
OglrZXJuZWwvc3lzY3RsLmMKK0Y6CWtlcm5lbC9zeXNjdGwtdGVzdC5jCiBGOgl0b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9zeXNjdGwvCiAKIFBTMyBORVRXT1JLIFNVUFBPUlQKLS0gCjIuMjEuMC41
OTMuZzUxMWVjMzQ1ZTE4LWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
