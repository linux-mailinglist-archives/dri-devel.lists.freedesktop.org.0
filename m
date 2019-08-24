Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 955489BA37
	for <lists+dri-devel@lfdr.de>; Sat, 24 Aug 2019 03:35:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B05756ED85;
	Sat, 24 Aug 2019 01:35:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa4a.google.com (mail-vk1-xa4a.google.com
 [IPv6:2607:f8b0:4864:20::a4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FECB6ED85
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Aug 2019 01:34:54 +0000 (UTC)
Received: by mail-vk1-xa4a.google.com with SMTP id f188so1030471vkh.6
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 18:34:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=oSIzNOWvDyzzTQYSf3JN3pjXcKbBe8KEci8pOjVJ0rM=;
 b=UqSQbL62OfC+Hrd22IiwMKC4noKeU337gqdaPIJ8Tp8RT/O37xieNNPbcpo1hqxH7e
 DgR9J3tW4VWf37viidmr2bzXOXACJwOShdziC9UVRc57L2KY8qZAomtgHASoPCQYt1RS
 ZQm6YsYpaX4JxHaz8jNMvCY6ywnTzuf7J01iLIR3N18CUpUdH/hXFpCIUVEiB4N85w9B
 7Imv3f3i7fSzETIqCHGZ1obDj+4UcePom735cL4LpfHDZgMysW5wgXYLd/QinOTh0Y8Q
 vQfj1/f29yUaBa5aWROYbyLKArgDjlU4tHDc9kLSsxUZyqvZiakoiMVTtAq4nuRKQIzG
 khfg==
X-Gm-Message-State: APjAAAXdKH+vBqCsAHcYCtpoUiYmodcE82DC0mKB3rsuSBDYziZTWWh9
 pPCQ13L8CW0JG1pTFH5CQFPjhrYeS3w+TQ7jRv3Iiw==
X-Google-Smtp-Source: APXvYqxmiJDAEh/zAWwF62TCvIYIDIZRIkbCAatUA+zDm/ooJsxNG6fj5NyV/30vHftZKCTGXzwU0uEqfd5BNafZzZSuxw==
X-Received: by 2002:ac5:c4cc:: with SMTP id a12mr3950071vkl.28.1566610492442; 
 Fri, 23 Aug 2019 18:34:52 -0700 (PDT)
Date: Fri, 23 Aug 2019 18:34:13 -0700
In-Reply-To: <20190824013425.175645-1-brendanhiggins@google.com>
Message-Id: <20190824013425.175645-7-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190824013425.175645-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
Subject: [PATCH v15 06/18] kbuild: enable building KUnit
From: Brendan Higgins <brendanhiggins@google.com>
To: frowand.list@gmail.com, gregkh@linuxfoundation.org, jpoimboe@redhat.com, 
 keescook@google.com, kieran.bingham@ideasonboard.com, mcgrof@kernel.org, 
 peterz@infradead.org, robh@kernel.org, sboyd@kernel.org, shuah@kernel.org, 
 tytso@mit.edu, yamada.masahiro@socionext.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=oSIzNOWvDyzzTQYSf3JN3pjXcKbBe8KEci8pOjVJ0rM=;
 b=nEHLmeCRlNn0vOScVKEBkHT9QuVr1Oityp0ad1fJrBgKxBJq59NmT/ZxcqBl0ysYGY
 yBt6jDjJXfbChkboOUvoU1g4lMi5JhoLzLoPtSz0B7Gl3KjaQndZoMGWZM1pwP5FqO2L
 ClAyL8t2tO6QQLf/Rdl73Zm9P1Bxdp0ClvJv9LduvM5M9mb/TnDoBVSclkO9Oi3eEhfY
 8NnIwRm6UnqLKN4t1Om7vxtkwx92uAnNdr+iweCdUyRT1FCa7j7mICsbGiVBKfN2mKGc
 xbxZey/OA2ersCb91kmL3JKIZJS7NkWS14E+JHvZ4oQi8xyQ+btxx8VHVRXqILcsnZkg
 eYPg==
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
 Michal Marek <michal.lkml@markovi.net>, richard@nod.at, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, mpe@ellerman.id.au,
 linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

S1VuaXQgaXMgYSBuZXcgdW5pdCB0ZXN0aW5nIGZyYW1ld29yayBmb3IgdGhlIGtlcm5lbCBhbmQg
d2hlbiB1c2VkIGlzCmJ1aWx0IGludG8gdGhlIGtlcm5lbCBhcyBhIHBhcnQgb2YgaXQuIEFkZCBL
VW5pdCB0byB0aGUgcm9vdCBLY29uZmlnIGFuZApNYWtlZmlsZSB0byBhbGxvdyBpdCB0byBiZSBh
Y3R1YWxseSBidWlsdC4KClNpZ25lZC1vZmYtYnk6IEJyZW5kYW4gSGlnZ2lucyA8YnJlbmRhbmhp
Z2dpbnNAZ29vZ2xlLmNvbT4KQWNrZWQtYnk6IE1hc2FoaXJvIFlhbWFkYSA8eWFtYWRhLm1hc2Fo
aXJvQHNvY2lvbmV4dC5jb20+CkNjOiBNaWNoYWwgTWFyZWsgPG1pY2hhbC5sa21sQG1hcmtvdmku
bmV0PgpSZXZpZXdlZC1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0
aW9uLm9yZz4KUmV2aWV3ZWQtYnk6IExvZ2FuIEd1bnRob3JwZSA8bG9nYW5nQGRlbHRhdGVlLmNv
bT4KUmV2aWV3ZWQtYnk6IFN0ZXBoZW4gQm95ZCA8c2JveWRAa2VybmVsLm9yZz4KLS0tCiBLY29u
ZmlnICB8IDIgKysKIE1ha2VmaWxlIHwgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9LY29uZmlnIGIvS2NvbmZpZwppbmRleCBlMTBiM2VlMDg0ZDQu
LjQ3ODg2ZGJkNmMyYSAxMDA2NDQKLS0tIGEvS2NvbmZpZworKysgYi9LY29uZmlnCkBAIC0zMiwz
ICszMiw1IEBAIHNvdXJjZSAibGliL0tjb25maWciCiBzb3VyY2UgImxpYi9LY29uZmlnLmRlYnVn
IgogCiBzb3VyY2UgIkRvY3VtZW50YXRpb24vS2NvbmZpZyIKKworc291cmNlICJrdW5pdC9LY29u
ZmlnIgpkaWZmIC0tZ2l0IGEvTWFrZWZpbGUgYi9NYWtlZmlsZQppbmRleCAyM2NkZjFmNDEzNjQu
LjM3OTVkMGE1ZDAzNyAxMDA2NDQKLS0tIGEvTWFrZWZpbGUKKysrIGIvTWFrZWZpbGUKQEAgLTEw
MDUsNiArMTAwNSw4IEBAIFBIT05ZICs9IHByZXBhcmUwCiBpZmVxICgkKEtCVUlMRF9FWFRNT0Qp
LCkKIGNvcmUteQkJKz0ga2VybmVsLyBjZXJ0cy8gbW0vIGZzLyBpcGMvIHNlY3VyaXR5LyBjcnlw
dG8vIGJsb2NrLwogCitjb3JlLSQoQ09ORklHX0tVTklUKSArPSBrdW5pdC8KKwogdm1saW51eC1k
aXJzCTo9ICQocGF0c3Vic3QgJS8sJSwkKGZpbHRlciAlLywgJChpbml0LXkpICQoaW5pdC1tKSBc
CiAJCSAgICAgJChjb3JlLXkpICQoY29yZS1tKSAkKGRyaXZlcnMteSkgJChkcml2ZXJzLW0pIFwK
IAkJICAgICAkKG5ldC15KSAkKG5ldC1tKSAkKGxpYnMteSkgJChsaWJzLW0pICQodmlydC15KSkp
Ci0tIAoyLjIzLjAuMTg3LmcxN2Y1Yjc1NTZjLWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
