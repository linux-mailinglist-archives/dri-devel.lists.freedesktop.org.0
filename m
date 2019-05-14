Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E7A1C264
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 07:46:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C018C89295;
	Tue, 14 May 2019 05:46:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com
 [IPv6:2607:f8b0:4864:20::44a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A2A889293
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 05:46:33 +0000 (UTC)
Received: by mail-pf1-x44a.google.com with SMTP id k22so11180582pfg.18
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 22:46:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=HjiBfvhYdSI4+vO6yGbKNMYX/91rl9h+rC/QUu27sIU=;
 b=fJ2wV1vmapYZFfBmbhJ2CC4dozPRg1EZTBy3TNbLCfkZF9ctTuUG2Gc3ArKkxleh8W
 x1H6LkYu/urzpbZaPMm/aT1vnjt5k7plWHCNRDmDlow8ttKu8dcsThnzWUiI601BNXsL
 uujR67PYn1rw2xfLjXs9kmi5FDQjw5K30ydB+PJelgIW3dGnv3k0YTK3F166B7t5ZF6M
 6g0RhS+IEK/7w91XzCHE07UW6OLq9xyZpY/OTWBNDTt41G57R4re7t4j1ZuLxbhs3/qf
 wJM1f1hPtbgsR8PeLnBW9KBfWOxqHr+sP7t41a8mav7ang5g1QkaRHN5461s6n/c1JM8
 7msw==
X-Gm-Message-State: APjAAAUVMpusjv6mWa4GooSlyn10uj1rfQLQ1XVSTSTd1ghiDSc1WOWp
 AnVvzWtpZed7Z8dZStdAhDXHwQVh6EdKPcXu6//axg==
X-Google-Smtp-Source: APXvYqyR/hpN79mq7mgSPZUvnCj5MN9msH/qzh6HWF+yjkWYNICdwiwYjZa5jNJGIkB3vivRUbS6veSuwKm0wCCRYqFrOg==
X-Received: by 2002:a63:1d05:: with SMTP id d5mr35695236pgd.157.1557812792681; 
 Mon, 13 May 2019 22:46:32 -0700 (PDT)
Date: Mon, 13 May 2019 22:42:50 -0700
In-Reply-To: <20190514054251.186196-1-brendanhiggins@google.com>
Message-Id: <20190514054251.186196-17-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190514054251.186196-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
Subject: [PATCH v3 16/18] MAINTAINERS: add entry for KUnit the unit testing
 framework
From: Brendan Higgins <brendanhiggins@google.com>
To: frowand.list@gmail.com, gregkh@linuxfoundation.org, keescook@google.com, 
 kieran.bingham@ideasonboard.com, mcgrof@kernel.org, robh@kernel.org, 
 sboyd@kernel.org, shuah@kernel.org, tytso@mit.edu, 
 yamada.masahiro@socionext.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=HjiBfvhYdSI4+vO6yGbKNMYX/91rl9h+rC/QUu27sIU=;
 b=kUh3DaXusTGq00ECIt2FdVjSR5hTcVAgEW/f3abE9OTIV3vedKUjIsJP82BwSYuDMp
 ajh9BeuTVkFUCZSkbYD6zCtkB/ijjnbHI8zdSNJtT+CGF336L03RwCHwki6ix8qSCFiK
 ovu0lH+k4NwqnQswnPFVtub3BVfheE7LTIAahgDrQedjMUuf0hujcw+ed7PNw6Ul/h8w
 d2FhT4ak9bBnCmLQUjkFagPtJQzt6PGiCogFLRGv5dDOKZgrc55jgA1xcucKesoTlu/e
 In6JMpz5OdCUOJ1fwUU7uzzVONZYnZOz5G5brU0LJD69SwnIrsbkgSd0nCYkainva/SZ
 6pew==
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

QWRkIG15c2VsZiBhcyBtYWludGFpbmVyIG9mIEtVbml0LCB0aGUgTGludXgga2VybmVsJ3MgdW5p
dCB0ZXN0aW5nCmZyYW1ld29yay4KClNpZ25lZC1vZmYtYnk6IEJyZW5kYW4gSGlnZ2lucyA8YnJl
bmRhbmhpZ2dpbnNAZ29vZ2xlLmNvbT4KUmV2aWV3ZWQtYnk6IEdyZWcgS3JvYWgtSGFydG1hbiA8
Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+ClJldmlld2VkLWJ5OiBMb2dhbiBHdW50aG9ycGUg
PGxvZ2FuZ0BkZWx0YXRlZS5jb20+Ci0tLQpDaGFuZ2VzIFNpbmNlIExhc3QgUmV2aXNpb246CiAt
IEFkZGVkIGxpbnV4LWtzZWxmdGVzdEAgYXMgYSBtYWlsaW5nIGxpc3QgZW50cnkgZm9yIEtVbml0
IGFzIHJlcXVlc3RlZAogICBieSBTaHVhaC4KLS0tCiBNQUlOVEFJTkVSUyB8IDExICsrKysrKysr
KysrCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL01BSU5U
QUlORVJTIGIvTUFJTlRBSU5FUlMKaW5kZXggMmMyZmNlNzJlNjk0Zi4uOGE5MTg4N2M4ZDU0MSAx
MDA2NDQKLS0tIGEvTUFJTlRBSU5FUlMKKysrIGIvTUFJTlRBSU5FUlMKQEAgLTg0NDgsNiArODQ0
OCwxNyBAQCBTOglNYWludGFpbmVkCiBGOgl0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy8KIEY6CURv
Y3VtZW50YXRpb24vZGV2LXRvb2xzL2tzZWxmdGVzdCoKIAorS0VSTkVMIFVOSVQgVEVTVElORyBG
UkFNRVdPUksgKEtVbml0KQorTToJQnJlbmRhbiBIaWdnaW5zIDxicmVuZGFuaGlnZ2luc0Bnb29n
bGUuY29tPgorTDoJbGludXgta3NlbGZ0ZXN0QHZnZXIua2VybmVsLm9yZworTDoJa3VuaXQtZGV2
QGdvb2dsZWdyb3Vwcy5jb20KK1c6CWh0dHBzOi8vZ29vZ2xlLmdpdGh1Yi5pby9rdW5pdC1kb2Nz
L3RoaXJkX3BhcnR5L2tlcm5lbC9kb2NzLworUzoJTWFpbnRhaW5lZAorRjoJRG9jdW1lbnRhdGlv
bi9rdW5pdC8KK0Y6CWluY2x1ZGUva3VuaXQvCitGOglrdW5pdC8KK0Y6CXRvb2xzL3Rlc3Rpbmcv
a3VuaXQvCisKIEtFUk5FTCBVU0VSTU9ERSBIRUxQRVIKIE06CUx1aXMgQ2hhbWJlcmxhaW4gPG1j
Z3JvZkBrZXJuZWwub3JnPgogTDoJbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwotLSAKMi4y
MS4wLjEwMjAuZ2YyODIwY2YwMWEtZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
