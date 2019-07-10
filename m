Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55061641FC
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 09:16:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4760189A75;
	Wed, 10 Jul 2019 07:16:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com
 [IPv6:2607:f8b0:4864:20::54a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F2D889A75
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 07:16:13 +0000 (UTC)
Received: by mail-pg1-x54a.google.com with SMTP id d3so917164pgc.9
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 00:16:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=iuxOaaMz6/nuHb4KDKomfiTWkThnS6wenM774buKrcs=;
 b=oBm22aHWIcLx7vaNWt9K0IHHKpaa67UhQqd8KIMlh9WwUisLGmfUwOvQKZjfE1i6bR
 W0MSFb056OB5nBt+0BNpnuezFhU+ptMsl1kUYEuZ3KhEliMABXtpdA4b+T+cshfFF1zE
 kj2cWOPqbwZbQpKV2yia5VTUp+FXqD8JxjeAtdWyDZZXLNPHY+tz0iJ1iyFDwwlIMn1j
 kl9OWsslo7RHJF/ladCbCchh1RVI+rRV2vvCfHVcUqqNzHem4ep/rPY7ciDYiW1tWWY3
 i0Os99Y9C/yS4pOQKVHSGPCSDBJnwV/XcRYleZzHlngYzQZ5qPxg4pHf7VU6dXRqfwBF
 y8Wg==
X-Gm-Message-State: APjAAAV3jYGkLj/cvVdr+VMdkVrNzNCk0/0027kFzA5ueN+byLGRKHVM
 m6SqrFyNp045jeU4ciTUFAOv2IflveQMt3/t2hD+Ag==
X-Google-Smtp-Source: APXvYqwvKVOfsz0NTC0mYXChGLM55lyRHym2AQRa0cKt8qzoul87EQvweiisK/9Kb7Yw/xDtn57GMjoaeQBD5oomo5boFg==
X-Received: by 2002:a63:c442:: with SMTP id m2mr22869503pgg.286.1562742972197; 
 Wed, 10 Jul 2019 00:16:12 -0700 (PDT)
Date: Wed, 10 Jul 2019 00:14:56 -0700
In-Reply-To: <20190710071508.173491-1-brendanhiggins@google.com>
Message-Id: <20190710071508.173491-7-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190710071508.173491-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v8 06/18] kbuild: enable building KUnit
From: Brendan Higgins <brendanhiggins@google.com>
To: frowand.list@gmail.com, gregkh@linuxfoundation.org, jpoimboe@redhat.com, 
 keescook@google.com, kieran.bingham@ideasonboard.com, mcgrof@kernel.org, 
 peterz@infradead.org, robh@kernel.org, sboyd@kernel.org, shuah@kernel.org, 
 tytso@mit.edu, yamada.masahiro@socionext.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=iuxOaaMz6/nuHb4KDKomfiTWkThnS6wenM774buKrcs=;
 b=swqomuh58V+Sg//U5cqY4Rh1tAi5bpvhwwunna8PvZbQacehjqw+jiBLjywU0PbaV9
 EpODX3G17IiD5mmqty6Ua7/wUUbyRya6LeMviTjJAwbg/+76UIMSyvVrzPVSUJ2WEY6n
 7lKwDj5zpEYSoIULXjTR+oBBCZfl1dvR7J33Y2miUOUDO2Sy18EJCy+VItMzFFxQAIdY
 /T4mQvRlNaRhUjVLmQuSsEc2qgj1X526Ie3m5Fj/WHcsnej2NpsOOSsTm8U1rai+iQqu
 RmvsSm+44+WEG138VYE5wa2mwKza4bSKWLX0erx0LKL6ndVzLZQYCX9qJk+XOClYHS4x
 pMCA==
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
Z2dpbnNAZ29vZ2xlLmNvbT4KQ2M6IE1hc2FoaXJvIFlhbWFkYSA8eWFtYWRhLm1hc2FoaXJvQHNv
Y2lvbmV4dC5jb20+CkNjOiBNaWNoYWwgTWFyZWsgPG1pY2hhbC5sa21sQG1hcmtvdmkubmV0PgpS
ZXZpZXdlZC1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9y
Zz4KUmV2aWV3ZWQtYnk6IExvZ2FuIEd1bnRob3JwZSA8bG9nYW5nQGRlbHRhdGVlLmNvbT4KLS0t
CiBLY29uZmlnICB8IDIgKysKIE1ha2VmaWxlIHwgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9LY29uZmlnIGIvS2NvbmZpZwppbmRleCA0OGE4MGJl
YWI2ODUzLi4xMDQyODUwMWVkYjc4IDEwMDY0NAotLS0gYS9LY29uZmlnCisrKyBiL0tjb25maWcK
QEAgLTMwLDMgKzMwLDUgQEAgc291cmNlICJjcnlwdG8vS2NvbmZpZyIKIHNvdXJjZSAibGliL0tj
b25maWciCiAKIHNvdXJjZSAibGliL0tjb25maWcuZGVidWciCisKK3NvdXJjZSAia3VuaXQvS2Nv
bmZpZyIKZGlmZiAtLWdpdCBhL01ha2VmaWxlIGIvTWFrZWZpbGUKaW5kZXggM2U0ODY4YTY0OThi
Mi4uMGNlMWE4YTJiNmZlYyAxMDA2NDQKLS0tIGEvTWFrZWZpbGUKKysrIGIvTWFrZWZpbGUKQEAg
LTk5Myw2ICs5OTMsOCBAQCBQSE9OWSArPSBwcmVwYXJlMAogaWZlcSAoJChLQlVJTERfRVhUTU9E
KSwpCiBjb3JlLXkJCSs9IGtlcm5lbC8gY2VydHMvIG1tLyBmcy8gaXBjLyBzZWN1cml0eS8gY3J5
cHRvLyBibG9jay8KIAorY29yZS0kKENPTkZJR19LVU5JVCkgKz0ga3VuaXQvCisKIHZtbGludXgt
ZGlycwk6PSAkKHBhdHN1YnN0ICUvLCUsJChmaWx0ZXIgJS8sICQoaW5pdC15KSAkKGluaXQtbSkg
XAogCQkgICAgICQoY29yZS15KSAkKGNvcmUtbSkgJChkcml2ZXJzLXkpICQoZHJpdmVycy1tKSBc
CiAJCSAgICAgJChuZXQteSkgJChuZXQtbSkgJChsaWJzLXkpICQobGlicy1tKSAkKHZpcnQteSkp
KQotLSAKMi4yMi4wLjQxMC5nZDhmZGJlMjFiNS1nb29nCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
