Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F911CE9F
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 20:08:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C4B89216;
	Tue, 14 May 2019 18:08:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F4189216
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 18:08:17 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id w22so9009707pgi.6
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 11:08:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7yeeHOrqmC8a3wbdrT1dAENCvxmyZ37Vuhxj9vZ+GQw=;
 b=OE1eJRDzOZCNVBFzxdd7XZ9aWfgkCXHe8Yy5DMV5pgzPAQ+r8A9A84bajJx2Dp27RH
 PuRMAd6irq21uPPZdyez6Ygwa1JO4HmKAN/2l5GDfJKdL0j2DGcytME/uE88Qc+bHiX8
 vwWRiMs1Y5HIZW8rhmn8hVN1cby+bEHaMyT9Yahk/zApvbA1fbsc7vHUgXgnuIz4A2NL
 jwLVHxIgJ2f5Afw5bUNpep+bFUdyMVTxSzH/Q05WIFwYIs/U5aYv2FU+JOiNwiyARdS0
 9ZdWqmBiL2oNkGVmuAXdvWi/++3QXF9F9W9fzHDTENKUdkMSSThwiG4kKH0wYR5HiYEt
 azbA==
X-Gm-Message-State: APjAAAVMM7r+dccz08TOy3V9rAbs7db+5HNtsbTjQErFp6ro0QLaB4+V
 e8tudR8HwF5Q53xGvPkC2IH1ug==
X-Google-Smtp-Source: APXvYqwwVSNPE5KOIRDKGnKoGzgoMRg2kvhAd8LSW436lA1eY3lipqpVLe11sNrtmgGOqBltRdlWXQ==
X-Received: by 2002:a65:534b:: with SMTP id w11mr39586352pgr.210.1557857296635; 
 Tue, 14 May 2019 11:08:16 -0700 (PDT)
Received: from google.com ([2620:15c:2cd:2:d714:29b4:a56b:b23b])
 by smtp.gmail.com with ESMTPSA id h18sm1568524pgv.38.2019.05.14.11.08.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 14 May 2019 11:08:15 -0700 (PDT)
Date: Tue, 14 May 2019 11:08:10 -0700
From: Brendan Higgins <brendanhiggins@google.com>
To: Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v3 15/18] Documentation: kunit: add documentation for KUnit
Message-ID: <20190514180810.GA109557@google.com>
References: <20190514054251.186196-1-brendanhiggins@google.com>
 <20190514054251.186196-16-brendanhiggins@google.com>
 <20190514073422.4287267c@lwn.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190514073422.4287267c@lwn.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7yeeHOrqmC8a3wbdrT1dAENCvxmyZ37Vuhxj9vZ+GQw=;
 b=S0jZM4XE6V0spZEZFXmF3lzmN9RyUrDls3YW1YfceLrf1+atDdYu1cDy9C4umcia/3
 zscYDmEM5QFhJ0Lva8Sr/fBO7umd8310R/E4POlAM5wiB7jMzgSkP8SsOgHo4cuPtzqM
 j5f31ImygRcFRnpQwdS5IZIz9c6qvCbiaaZwXxiQnGCs4OmdaNEeAT0BXUQnQH/qgAa6
 HfIIFTZyV9zShckZnWJw1oElQyqVHLhJcgWa8zt0ufYs+8dsKUPv2sW1yVTo4jhRi601
 xWiCimgXoAgU8fIvE1m4CgoqiIh5RUVt2mEcjUAPFJsbkkmefrie+e0G224VchBEu3Gt
 Tibw==
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
 dri-devel@lists.freedesktop.org, Alexander.Levin@microsoft.com,
 yamada.masahiro@socionext.com, mpe@ellerman.id.au,
 linux-kselftest@vger.kernel.org, shuah@kernel.org, linux-nvdimm@lists.01.org,
 frowand.list@gmail.com, knut.omang@oracle.com, kieran.bingham@ideasonboard.com,
 Felix Guo <felixguoxiuping@gmail.com>, wfg@linux.intel.com, joel@jms.id.au,
 rientjes@google.com, jdike@addtoit.com, dan.carpenter@oracle.com,
 devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org, Tim.Bird@sony.com,
 linux-um@lists.infradead.org, rostedt@goodmis.org, julia.lawall@lip6.fr,
 dan.j.williams@intel.com, kunit-dev@googlegroups.com, tytso@mit.edu,
 richard@nod.at, sboyd@kernel.org, gregkh@linuxfoundation.org,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org, mcgrof@kernel.org,
 keescook@google.com, linux-fsdevel@vger.kernel.org, logang@deltatee.com,
 khilman@baylibre.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMDc6MzQ6MjJBTSAtMDYwMCwgSm9uYXRoYW4gQ29yYmV0
IHdyb3RlOgo+IE9uIE1vbiwgMTMgTWF5IDIwMTkgMjI6NDI6NDkgLTA3MDAKPiBCcmVuZGFuIEhp
Z2dpbnMgPGJyZW5kYW5oaWdnaW5zQGdvb2dsZS5jb20+IHdyb3RlOgo+IAo+ID4gQWRkIGRvY3Vt
ZW50YXRpb24gZm9yIEtVbml0LCB0aGUgTGludXgga2VybmVsIHVuaXQgdGVzdGluZyBmcmFtZXdv
cmsuCj4gPiAtIEFkZCBpbnRybyBhbmQgdXNhZ2UgZ3VpZGUgZm9yIEtVbml0Cj4gPiAtIEFkZCBB
UEkgcmVmZXJlbmNlCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEZlbGl4IEd1byA8ZmVsaXhndW94
aXVwaW5nQGdtYWlsLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IEJyZW5kYW4gSGlnZ2lucyA8YnJl
bmRhbmhpZ2dpbnNAZ29vZ2xlLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBHcmVnIEtyb2FoLUhhcnRt
YW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo+ID4gUmV2aWV3ZWQtYnk6IExvZ2FuIEd1
bnRob3JwZSA8bG9nYW5nQGRlbHRhdGVlLmNvbT4KPiA+IC0tLQo+ID4gQ2hhbmdlcyBTaW5jZSBM
YXN0IFJldmlzaW9uOgo+ID4gIC0gQWRkcmVzc2VkIHJlZmVyZW5jZSB0byBpbmNvcnJlY3QgbnVt
YmVyIG9mIHNlY3Rpb25zLCBhcyBwZXIgUmFuZHkncwo+ID4gICAgY29tbWVudC4KPiA+ICAtIE1h
a2Ugc2VjdGlvbiB1bmRlcmxpbmVzIHNhbWUgbGVuZ3RoIGFzIHRoZSBzZWN0aW9uIHRpdGxlLCBh
cyBwZXIKPiA+ICAgIFJhbmR5J3MgY29tbWVudHMuCj4gPiAtLS0KPiA+ICBEb2N1bWVudGF0aW9u
L2luZGV4LnJzdCAgICAgICAgICAgfCAgIDEgKwo+ID4gIERvY3VtZW50YXRpb24va3VuaXQvYXBp
L2luZGV4LnJzdCB8ICAxNiArCj4gPiAgRG9jdW1lbnRhdGlvbi9rdW5pdC9hcGkvdGVzdC5yc3Qg
IHwgIDE0ICsKPiA+ICBEb2N1bWVudGF0aW9uL2t1bml0L2ZhcS5yc3QgICAgICAgfCAgNjIgKysr
Kwo+ID4gIERvY3VtZW50YXRpb24va3VuaXQvaW5kZXgucnN0ICAgICB8ICA3OSArKysrCj4gPiAg
RG9jdW1lbnRhdGlvbi9rdW5pdC9zdGFydC5yc3QgICAgIHwgMTgwICsrKysrKysrKysKPiA+ICBE
b2N1bWVudGF0aW9uL2t1bml0L3VzYWdlLnJzdCAgICAgfCA1NzUgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrCj4gCj4gQ2VydGFpbmx5IGl0J3MgZ3JlYXQgdG8gc2VlIGFsbCB0aGlzIGRv
Y3VtZW50YXRpb24gY29taW5nIHdpdGggdGhpcwo+IGZlYXR1cmUhCj4gCj4gTmF0dXJhbGx5LCB0
aG91Z2gsIEkgaGF2ZSBvbmUgcmVxdWVzdDogSSdkIHJhdGhlciBub3Qgc2VlIHRoaXMgYXQgdGhl
IHRvcAo+IGxldmVsLCB3aGljaCBpcyBtb3JlIHRoYW4gY3Jvd2RlZCBlbm91Z2ggYXMgaXQgaXMu
ICBDYW4gdGhpcyBtYXRlcmlhbAo+IHBsZWFzZSBnbyBpbnRvIHRoZSBkZXZlbG9wbWVudCB0b29s
cyBib29rLCBhbG9uZ3NpZGUgdGhlIGtzZWxmdGVzdAo+IGRvY3VtZW50YXRpb24/CgpPaCB5ZWFo
LCB0aGF0IHNlZW1zIGxpa2UgdGhlIG9idmlvdXMgaG9tZSBmb3IgdGhpcyBpbiBoaW5kc2lnaHQu
IFNvcnJ5CmFib3V0IHRoYXQuIFdpbGwgZml4IGluIG5leHQgcmV2aXNpb24hCgpUaGFua3MhCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
