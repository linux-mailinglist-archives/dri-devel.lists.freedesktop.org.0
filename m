Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB619739A
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 09:34:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B21D6E92A;
	Wed, 21 Aug 2019 07:34:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from conssluserg-02.nifty.com (conssluserg-02.nifty.com
 [210.131.2.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E782896FA
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 04:06:37 +0000 (UTC)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com
 [209.85.217.50]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id x7L46Mi7017841
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 13:06:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x7L46Mi7017841
X-Nifty-SrcIP: [209.85.217.50]
Received: by mail-vs1-f50.google.com with SMTP id b20so495218vso.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 21:06:22 -0700 (PDT)
X-Gm-Message-State: APjAAAUrafM3nnuEyEXFfcaZ86tE8EJYJ+9DSYa+xlqEN5RcO+zZ6FFH
 4KOnt5UAW7NCIfweuE45sDMCQ1lWgSnMZN7Djmc=
X-Google-Smtp-Source: APXvYqylf5YzGmVfQP1Y/aLizQEgiqcXur6luFADCkGp19zMapciICFm2B+UioaZMTg4uUM9pqSaSmGNw+RRsCvvZ4k=
X-Received: by 2002:a67:fe12:: with SMTP id l18mr4861186vsr.54.1566360381493; 
 Tue, 20 Aug 2019 21:06:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190821035517.21671-1-yamada.masahiro@socionext.com>
 <20190821035517.21671-3-yamada.masahiro@socionext.com>
In-Reply-To: <20190821035517.21671-3-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 21 Aug 2019 13:05:45 +0900
X-Gmail-Original-Message-ID: <CAK7LNAROtaGR4fqrCcocmv8eO1GcAS4FKCLiS_wQqrjEjMMBBg@mail.gmail.com>
Message-ID: <CAK7LNAROtaGR4fqrCcocmv8eO1GcAS4FKCLiS_wQqrjEjMMBBg@mail.gmail.com>
Subject: Re: [PATCH 2/4] video/logo: fix unneeded generation of font C files
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-fbdev@vger.kernel.org
X-Mailman-Approved-At: Wed, 21 Aug 2019 07:33:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nifty.com; s=dec2015msa; t=1566360383;
 bh=muuXnYLKetb5cxC3kfdv57DMCKDIXml15bwOXhq/nJs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mIVjIYDxZc9Lbo+4Rn79AO8sNgIFjPug562CXh6JT/1+QQoJrDq0RZqPqa5OyYTxB
 IQzNZdOH6Eo4H7Q2o9vMv9+M6AUh3QtB3n09xY3D3oln30lNJY+fzYn9tS7f1MVE74
 wDCGQ+SuiSiaZH5rqEpXzH+27/fwcIP5I6aUvrlKr5H6PC7o/EUx6EmpGaRXCi0jpD
 XNlC3xqnW1gNpH63f12U1BtwfCQiwfjDFaIj3xmKK1wVN1p+Y3SanSgEMrgM+cU1HP
 7GQZBmBtn8l2CM24dqlNC+knxlXE5bzNrOl4AIYIwJYB7yEXLtBOGOvFQC6HSW/p/j
 yTkUu7oxybCdg==
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMjEsIDIwMTkgYXQgMTI6NTYgUE0gTWFzYWhpcm8gWWFtYWRhCjx5YW1hZGEu
bWFzYWhpcm9Ac29jaW9uZXh0LmNvbT4gd3JvdGU6CgpJIHdpbGwgcmVwbGFjZSAnZm9udCcgLT4g
J2xvZ28nLgooTXkgYnJhaW4gd2FzIGNvcnJ1cHRlZC4pCgoKCj4gQ3VycmVudGx5LCBhbGwgdGhl
IGZvbnQgQyBmaWxlcyBhcmUgZ2VuZXJhdGVkIGlycmVzcGVjdGl2ZSBvZiBDT05GSUcKPiBvcHRp
b25zLiBBZGRpbmcgdGhlbSB0byBleHRyYS15IGlzIHdyb25nLiBXaGF0IHdlIG5lZWQgdG8gZG8g
aGVyZSBpcwo+IHRvIGFkZCB0aGVtIHRvICd0YXJnZXRzJyBzbyB0aGF0IGlmX2NoYW5nZWQgd29y
a3MgcHJvcGVybHkuCj4KPiBBbGwgZmlsZXMgbGlzdGVkIGluICd0YXJnZXRzJyBhcmUgY2xlYW5l
ZCwgc28gY2xlYW4tZmlsZXMgaXMgdW5uZWVkZWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBNYXNhaGly
byBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQuY29tPgo+IC0tLQo+Cj4gIGRyaXZl
cnMvdmlkZW8vbG9nby9NYWtlZmlsZSB8IDIxICsrLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3ZpZGVvL2xvZ28vTWFrZWZpbGUgYi9kcml2ZXJzL3ZpZGVvL2xvZ28vTWFr
ZWZpbGUKPiBpbmRleCAxMGI3NWNlM2NlMDkuLjE2ZjYwYzFlMTc2NiAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL3ZpZGVvL2xvZ28vTWFrZWZpbGUKPiArKysgYi9kcml2ZXJzL3ZpZGVvL2xvZ28vTWFr
ZWZpbGUKPiBAQCAtMTgsMjMgKzE4LDYgQEAgb2JqLSQoQ09ORklHX1NQVV9CQVNFKSAgICAgICAg
ICAgICAgICAgICAgICAgKz0gbG9nb19zcGVfY2x1dDIyNC5vCj4KPiAgIyBIb3cgdG8gZ2VuZXJh
dGUgbG9nbydzCj4KPiAtIyBVc2UgbG9nby1jZmlsZXMgdG8gcmV0cmlldmUgbGlzdCBvZiAuYyBm
aWxlcyB0byBiZSBidWlsdAo+IC1sb2dvLWNmaWxlcyA9ICQobm90ZGlyICQocGF0c3Vic3QgJS4k
KDIpLCAlLmMsIFwKPiAtICAgICAgICAgICAgICAkKHdpbGRjYXJkICQoc3JjdHJlZSkvJChzcmMp
LyokKDEpLiQoMikpKSkKPiAtCj4gLQo+IC0jIE1vbm8gbG9nb3MKPiAtZXh0cmEteSArPSAkKGNh
bGwgbG9nby1jZmlsZXMsX21vbm8scGJtKQo+IC0KPiAtIyBWR0ExNiBsb2dvcwo+IC1leHRyYS15
ICs9ICQoY2FsbCBsb2dvLWNmaWxlcyxfdmdhMTYscHBtKQo+IC0KPiAtIyAyMjQgTG9nb3MKPiAt
ZXh0cmEteSArPSAkKGNhbGwgbG9nby1jZmlsZXMsX2NsdXQyMjQscHBtKQo+IC0KPiAtIyBHcmF5
IDI1Ngo+IC1leHRyYS15ICs9ICQoY2FsbCBsb2dvLWNmaWxlcyxfZ3JheTI1NixwZ20pCj4gLQo+
ICBwbm10b2xvZ28gOj0gc2NyaXB0cy9wbm10b2xvZ28KPgo+ICAjIENyZWF0ZSBjb21tYW5kcyBs
aWtlICJwbm10b2xvZ28gLXQgbW9ubyAtbiBsb2dvX21hY19tb25vIC1vIC4uLiIKPiBAQCAtNTUs
NSArMzgsNSBAQCAkKG9iaikvJV9jbHV0MjI0LmM6ICQoc3JjKS8lX2NsdXQyMjQucHBtICQocG5t
dG9sb2dvKSBGT1JDRQo+ICAkKG9iaikvJV9ncmF5MjU2LmM6ICQoc3JjKS8lX2dyYXkyNTYucGdt
ICQocG5tdG9sb2dvKSBGT1JDRQo+ICAgICAgICAgJChjYWxsIGlmX2NoYW5nZWQsbG9nbykKPgo+
IC0jIEZpbGVzIGdlbmVyYXRlZCB0aGF0IHNoYWxsIGJlIHJlbW92ZWQgdXBvbiBtYWtlIGNsZWFu
Cj4gLWNsZWFuLWZpbGVzIDo9ICpfbW9uby5jICpfdmdhMTYuYyAqX2NsdXQyMjQuYyAqX2dyYXky
NTYuYwo+ICsjIGdlbmVyYXRlZCBDIGZpbGVzCj4gK3RhcmdldHMgKz0gKl9tb25vLmMgKl92Z2Ex
Ni5jICpfY2x1dDIyNC5jICpfZ3JheTI1Ni5jCj4gLS0KPiAyLjE3LjEKPgoKCi0tIApCZXN0IFJl
Z2FyZHMKTWFzYWhpcm8gWWFtYWRhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
