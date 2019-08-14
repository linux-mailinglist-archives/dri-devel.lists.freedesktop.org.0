Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B408CAD8
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 07:52:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42E486E250;
	Wed, 14 Aug 2019 05:52:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com
 [IPv6:2607:f8b0:4864:20::54a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB526E24D
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 05:52:26 +0000 (UTC)
Received: by mail-pg1-x54a.google.com with SMTP id u1so67848076pgr.13
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 22:52:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=XDtrvkw0RFhKlN+LitTFqDIh4jTE9hk9LUw2Z5/BXjo=;
 b=SGzgBP1vilB+ykHzXbkMkFr/aD8N0VMwmTztCYsUpwMcv+0yKELqq9y1N7nPWTU42v
 dLGSD/7rFyTpOHq449mqfIJdmb41kVUra09xAmzZT2L7a5xGeEfsWCvI5xtBftL/r1+x
 bNteORuzfe2cTGHgXT5eNInVrmE1/wHsz+krMSQvYrB+6/Pyt+8SxUdSZ4ZTTG5KcTa7
 uwDh3M/sTxstDWQnVe0xITWfvnS7Ifm2CXQCmF1JUDWncS5aVKAai7UcSLsdHrMOTRsd
 Rsj2Xb5x/iBX8lPaLW+DNdjjQVRYZBdmj/YnPB6L3AzlfxFq23zKh4/QrlvpMM+iIWTB
 gtiA==
X-Gm-Message-State: APjAAAXXwoSg6bKKveGlh8wY/qHXkmOqbMK+GkTT2GCWN4Ywe+9ddUHp
 S4sTqVg3G11rAzcqXvcRc7dTlgMt46KsTF0m5ByDzw==
X-Google-Smtp-Source: APXvYqxq+MfuyP3ARB3iygZvo6an8R1jW4rcA6hARFKN0G3haGYTLv0vmNCZJf3xUuojmYFx4j73XZnnj6yHGBpI3p9WKw==
X-Received: by 2002:a63:20d:: with SMTP id 13mr38240136pgc.253.1565761945419; 
 Tue, 13 Aug 2019 22:52:25 -0700 (PDT)
Date: Tue, 13 Aug 2019 22:50:56 -0700
In-Reply-To: <20190814055108.214253-1-brendanhiggins@google.com>
Message-Id: <20190814055108.214253-7-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190814055108.214253-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v13 06/18] kbuild: enable building KUnit
From: Brendan Higgins <brendanhiggins@google.com>
To: frowand.list@gmail.com, gregkh@linuxfoundation.org, jpoimboe@redhat.com, 
 keescook@google.com, kieran.bingham@ideasonboard.com, mcgrof@kernel.org, 
 peterz@infradead.org, robh@kernel.org, sboyd@kernel.org, shuah@kernel.org, 
 tytso@mit.edu, yamada.masahiro@socionext.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=XDtrvkw0RFhKlN+LitTFqDIh4jTE9hk9LUw2Z5/BXjo=;
 b=saMDrOVjRKeQK/IyXLrIKKTej8JXwPZqG6sJSJzspUY0/Vy/4vjD74Uq6KaBZ8giTu
 aSQrymPIDBA9u9jdF3UZfEByMnMYgwVHxSq5bNSS9FqFYgj/2734mVL036n654EEM4y2
 KsOJEv05fKjKF+rDrbrxLIH47c6QNWJ48o49aql1AaRW/k1kZGisLqEOJZlAaRRp6rVg
 D6c1qhf78cJqdqIPoca7OfM8r1ij/g/0ge15DecTBlsydvLvgIJ+a8pgr/skhfIWUuWo
 ybz5j7sxBznT2cBuwPB6kXDuf1QIJXyYIdbPekKokrc/eMjbmBJuvdnHu5Ythn3lh2gz
 czYg==
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
bnMoKykKCmRpZmYgLS1naXQgYS9LY29uZmlnIGIvS2NvbmZpZwppbmRleCBlMTBiM2VlMDg0ZDRk
Li40Nzg4NmRiZDZjMmE2IDEwMDY0NAotLS0gYS9LY29uZmlnCisrKyBiL0tjb25maWcKQEAgLTMy
LDMgKzMyLDUgQEAgc291cmNlICJsaWIvS2NvbmZpZyIKIHNvdXJjZSAibGliL0tjb25maWcuZGVi
dWciCiAKIHNvdXJjZSAiRG9jdW1lbnRhdGlvbi9LY29uZmlnIgorCitzb3VyY2UgImt1bml0L0tj
b25maWciCmRpZmYgLS1naXQgYS9NYWtlZmlsZSBiL01ha2VmaWxlCmluZGV4IDIzY2RmMWY0MTM2
NDYuLjM3OTVkMGE1ZDAzNzYgMTAwNjQ0Ci0tLSBhL01ha2VmaWxlCisrKyBiL01ha2VmaWxlCkBA
IC0xMDA1LDYgKzEwMDUsOCBAQCBQSE9OWSArPSBwcmVwYXJlMAogaWZlcSAoJChLQlVJTERfRVhU
TU9EKSwpCiBjb3JlLXkJCSs9IGtlcm5lbC8gY2VydHMvIG1tLyBmcy8gaXBjLyBzZWN1cml0eS8g
Y3J5cHRvLyBibG9jay8KIAorY29yZS0kKENPTkZJR19LVU5JVCkgKz0ga3VuaXQvCisKIHZtbGlu
dXgtZGlycwk6PSAkKHBhdHN1YnN0ICUvLCUsJChmaWx0ZXIgJS8sICQoaW5pdC15KSAkKGluaXQt
bSkgXAogCQkgICAgICQoY29yZS15KSAkKGNvcmUtbSkgJChkcml2ZXJzLXkpICQoZHJpdmVycy1t
KSBcCiAJCSAgICAgJChuZXQteSkgJChuZXQtbSkgJChsaWJzLXkpICQobGlicy1tKSAkKHZpcnQt
eSkpKQotLSAKMi4yMy4wLnJjMS4xNTMuZ2RlZWQ4MDMzMGYtZ29vZwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
