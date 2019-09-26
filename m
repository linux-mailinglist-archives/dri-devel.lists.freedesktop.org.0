Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8852EC0024
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 09:41:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B80F16EE7F;
	Fri, 27 Sep 2019 07:40:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from conssluserg-03.nifty.com (conssluserg-03.nifty.com
 [210.131.2.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ED3B6ECDC
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 11:53:00 +0000 (UTC)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
 [209.85.217.53]) (authenticated)
 by conssluserg-03.nifty.com with ESMTP id x8QBqf8j007478
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 20:52:41 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com x8QBqf8j007478
X-Nifty-SrcIP: [209.85.217.53]
Received: by mail-vs1-f53.google.com with SMTP id p13so1391106vsr.4
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 04:52:41 -0700 (PDT)
X-Gm-Message-State: APjAAAXN4MK96EG2kNcdL7NkeuFSpW1yul3UC82gkrVaZ/kPwoSCU7zM
 srV3XhVq4n+dCN5d3lHxRfwsOuehNN8UAzhBDK0=
X-Google-Smtp-Source: APXvYqzl4Bl4cH3IQmKL+GgyuH5KFHMny1Q8PPwuMn/uW2v5G/87/SwlwldHycNcU6DS/BrJ+KjFTt6W/O79v4O1284=
X-Received: by 2002:a67:ec09:: with SMTP id d9mr1431105vso.215.1569498760483; 
 Thu, 26 Sep 2019 04:52:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190926101312.32218-1-geert@linux-m68k.org>
 <CAK7LNATN5QyC+-_VRZm_ZysYd8Z8aWU0Ys0cTpU2GUdEdrXvPg@mail.gmail.com>
 <CAMuHMdU3T83z1iZ7O2-5eRkawdGm50Auw5o0K9+J5Q7+oev62g@mail.gmail.com>
In-Reply-To: <CAMuHMdU3T83z1iZ7O2-5eRkawdGm50Auw5o0K9+J5Q7+oev62g@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 26 Sep 2019 20:52:04 +0900
X-Gmail-Original-Message-ID: <CAK7LNAShZJw4K4kDURPyJ1_NGQt50cBA-aB2HZCzK7LOdNSaKA@mail.gmail.com>
Message-ID: <CAK7LNAShZJw4K4kDURPyJ1_NGQt50cBA-aB2HZCzK7LOdNSaKA@mail.gmail.com>
Subject: Re: [PATCH -next] fbdev: c2p: Fix link failure on non-inlining
To: Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailman-Approved-At: Fri, 27 Sep 2019 07:40:57 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nifty.com; s=dec2015msa; t=1569498761;
 bh=+62D9236cTgE1YamYRIBdf579l4q6GlpGs0F5mD3z3A=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CVVnmH2ekqehtPTH5WerY9sn641gjot1ZBfUSerSSUp0GcDA/RROjmByeakAxQyxg
 GjGUvZbeV0RFPZ1HvPgtkYn1Kv6woncVqS0qDWXLn4Pz/LGnQs9GwVxZg08RczscQB
 iRtkt+s599+seIGI9pcLjWQ55vuzuI7rYr/bEpwDTLa/KY1ipa03S8zdoAp4ODav/A
 pAvKHADXiGF79f+B6wbBRrnzQE9hawCAapjC95vFwXhvyHXkBZXjJNKLvLfpKXRsEk
 2IAw+zybjNMPXGw2rMtu0S1BqSRFpE5M7GGBQ8FVEpWz4NvWnMsIyySmmvU2lQqco3
 8m5x1JUZzhfpg==
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR2VlcnQsCgpPbiBUaHUsIFNlcCAyNiwgMjAxOSBhdCA4OjQzIFBNIEdlZXJ0IFV5dHRlcmhv
ZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+IHdyb3RlOgoKPgo+IEJUVywgZG9lcyByYW5kY29u
ZmlnIHJhbmRvbWl6ZSBjaG9pY2VzIHRoZXNlIGRheXM/Cj4gSSByZW1lbWJlciBpdCBkaWRuJ3Qg
dXNlIHRvIGRvIHRoYXQuCgpyYW5kY29uZmlnIGRvZXMgcmFuZG9taXplIGNob2ljZXMuCgoKbWFz
YWhpcm9AcHVnOn4vcmVmL2xpbnV4JCBtYWtlIC1zIHJhbmRjb25maWcgOyBncmVwIE9QVElNSVpF
X0ZPUiAuY29uZmlnCktDT05GSUdfU0VFRD0weDc1RjFGNkM4CkNPTkZJR19DQ19PUFRJTUlaRV9G
T1JfUEVSRk9STUFOQ0U9eQojIENPTkZJR19DQ19PUFRJTUlaRV9GT1JfU0laRSBpcyBub3Qgc2V0
Cm1hc2FoaXJvQHB1Zzp+L3JlZi9saW51eCQgbWFrZSAtcyByYW5kY29uZmlnIDsgZ3JlcCBPUFRJ
TUlaRV9GT1IgLmNvbmZpZwpLQ09ORklHX1NFRUQ9MHg4RkRGQzdGQwojIENPTkZJR19DQ19PUFRJ
TUlaRV9GT1JfUEVSRk9STUFOQ0UgaXMgbm90IHNldApDT05GSUdfQ0NfT1BUSU1JWkVfRk9SX1NJ
WkU9eQoKCmFsbHt5ZXMsbW9kfWNvbmZpZyBhbHdheXMgdGFrZXMgdGhlIGRlZmF1bHQgaW4gdGhl
IGNob2ljZS4KU28sIHlvdSBjYW5ub3QgZW5hYmxlIENPTkZJR19DQ19PUFRJTUlaRV9GT1JfU0la
RSBieSBhbGx7eWVzLG1vZH1jb25maWcuCgoKCgoKPiBUaGUgQW1pZ2EgYW5kIEF0YXJpIGZyYW1l
IGJ1ZmZlciBkcml2ZXJzIG5lZWQgPGFzbS97YW1pZ2EsYXRhcml9aHcuaD4sCj4gYW5kIHRoZSBB
dGFyaSBkcml2ZXIgY29udGFpbnMgaW5saW5lIGFzbS4KPgo+IFRoZSBDMlAgY29kZSBjb3VsZCBi
ZSBwdXQgYmVoaW5kIGl0cyBvd24gS2NvbmZpZyBzeW1ib2wsIEkgZ3Vlc3MuCgpPSywgdGhlbi4K
CgpUaGFua3MuCgoKCgotLSAKQmVzdCBSZWdhcmRzCk1hc2FoaXJvIFlhbWFkYQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
