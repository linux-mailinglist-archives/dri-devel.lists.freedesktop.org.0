Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 958456B3A9
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 03:56:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 733BC6E204;
	Wed, 17 Jul 2019 01:56:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com
 [IPv6:2607:f8b0:4864:20::449])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2A6D6E204
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 01:56:10 +0000 (UTC)
Received: by mail-pf1-x449.google.com with SMTP id i2so13505446pfe.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 18:56:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=ZxnEgoL+cAyfHeVT/PTT350Q+1yvdmLsRRNYnQGVvxQ=;
 b=J0grVDlOjNrUK4RZZD/U5EAmWtyh8MLFS865/xQs5AwQrrlL0nOXgIShMgWET+zM7f
 xhCBN88QKZXpdKYfDJvisF+6p3liIRWjIfDaCO2YZ/hRc6feL1wv56IT9Z6rR7fQd33B
 M7lkPITLsQNTGPmI89YeMOtBU+ST8SCa3Nri4TelCwezF9f1AOkiMPQ+iNTGWEwOjYIC
 LclITLWLa3/2fRwMv6RAmnkb7KRm9B7m4cztdaMubL/kDx07cSpJ4GnckFgBiyDYTIy+
 gK3GcS+95nafe8ZET2KXWs9fhEnB3NVFIXWgc5ZKZ+oYirGMNfv0xY8mdTHU0i6q8Jdq
 JfJg==
X-Gm-Message-State: APjAAAX+LGY6o1eqzgN4ZiWKTHcu5chv/xBk0LLMV/vw2bUMJ4U98z1p
 ErAArIkyulkg0p1OZMZcY0ZZqYcgwP/iPGZIbIvy3Q==
X-Google-Smtp-Source: APXvYqzdOd/pnZZFL/pS6/iieMJ7feNcywGmwm2i67xQ+rYX0bj48kl8BcSe4yfiKEhFGYAbbZpECxiAzIcb05C1kfs0DA==
X-Received: by 2002:a63:fc52:: with SMTP id r18mr37450939pgk.378.1563328569459; 
 Tue, 16 Jul 2019 18:56:09 -0700 (PDT)
Date: Tue, 16 Jul 2019 18:55:31 -0700
In-Reply-To: <20190717015543.152251-1-brendanhiggins@google.com>
Message-Id: <20190717015543.152251-7-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190717015543.152251-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
Subject: [PATCH v11 06/18] kbuild: enable building KUnit
From: Brendan Higgins <brendanhiggins@google.com>
To: frowand.list@gmail.com, gregkh@linuxfoundation.org, jpoimboe@redhat.com, 
 keescook@google.com, kieran.bingham@ideasonboard.com, mcgrof@kernel.org, 
 peterz@infradead.org, robh@kernel.org, sboyd@kernel.org, shuah@kernel.org, 
 tytso@mit.edu, yamada.masahiro@socionext.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=ZxnEgoL+cAyfHeVT/PTT350Q+1yvdmLsRRNYnQGVvxQ=;
 b=anmcre763jqYfgk0jWG0amSJjr9xJDchU7aCLTMoA7GWTjnXP43elmKF15Bo6z8jT/
 uSdYJORRrIzHzGZUbqnAbFwRKeFJDrWfiw0+1PMnDT6HXctOw3e70AmsBr86zxdtYfSF
 9QjexNnudSykx+gILjsNgF/Izk1Qd8cYoWCnqxAFQZkhT4rceTgpbKV8nPdU7wapAdRi
 hbcyVdfr+6dA554hVrDR7CH/dYVdpdsHvTXr12IEodevpJMzgKPwR62HOJtcZbsFshbz
 4nNBdIsyoQPIZCFxFyp3Hb3/XaXqHo2KdfXbEpGJ/wTbzl09x42ZZcaPUlA1B0bBeqvO
 Hw0g==
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
bnMoKykKCmRpZmYgLS1naXQgYS9LY29uZmlnIGIvS2NvbmZpZwppbmRleCA0OGE4MGJlYWI2ODUz
Li4xMDQyODUwMWVkYjc4IDEwMDY0NAotLS0gYS9LY29uZmlnCisrKyBiL0tjb25maWcKQEAgLTMw
LDMgKzMwLDUgQEAgc291cmNlICJjcnlwdG8vS2NvbmZpZyIKIHNvdXJjZSAibGliL0tjb25maWci
CiAKIHNvdXJjZSAibGliL0tjb25maWcuZGVidWciCisKK3NvdXJjZSAia3VuaXQvS2NvbmZpZyIK
ZGlmZiAtLWdpdCBhL01ha2VmaWxlIGIvTWFrZWZpbGUKaW5kZXggM2U0ODY4YTY0OThiMi4uMGNl
MWE4YTJiNmZlYyAxMDA2NDQKLS0tIGEvTWFrZWZpbGUKKysrIGIvTWFrZWZpbGUKQEAgLTk5Myw2
ICs5OTMsOCBAQCBQSE9OWSArPSBwcmVwYXJlMAogaWZlcSAoJChLQlVJTERfRVhUTU9EKSwpCiBj
b3JlLXkJCSs9IGtlcm5lbC8gY2VydHMvIG1tLyBmcy8gaXBjLyBzZWN1cml0eS8gY3J5cHRvLyBi
bG9jay8KIAorY29yZS0kKENPTkZJR19LVU5JVCkgKz0ga3VuaXQvCisKIHZtbGludXgtZGlycwk6
PSAkKHBhdHN1YnN0ICUvLCUsJChmaWx0ZXIgJS8sICQoaW5pdC15KSAkKGluaXQtbSkgXAogCQkg
ICAgICQoY29yZS15KSAkKGNvcmUtbSkgJChkcml2ZXJzLXkpICQoZHJpdmVycy1tKSBcCiAJCSAg
ICAgJChuZXQteSkgJChuZXQtbSkgJChsaWJzLXkpICQobGlicy1tKSAkKHZpcnQteSkpKQotLSAK
Mi4yMi4wLjUxMC5nMjY0ZjJjODE3YS1nb29nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
