Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C8C8AB5F
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 01:46:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F1AF6E02B;
	Mon, 12 Aug 2019 23:46:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A70A16E02B
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 23:46:45 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E054D20679;
 Mon, 12 Aug 2019 23:46:44 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20190812182421.141150-5-brendanhiggins@google.com>
References: <20190812182421.141150-1-brendanhiggins@google.com>
 <20190812182421.141150-5-brendanhiggins@google.com>
Subject: Re: [PATCH v12 04/18] kunit: test: add assertion printing library
From: Stephen Boyd <sboyd@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>, frowand.list@gmail.com,
 gregkh@linuxfoundation.org, jpoimboe@redhat.com, keescook@google.com,
 kieran.bingham@ideasonboard.com, mcgrof@kernel.org, peterz@infradead.org,
 robh@kernel.org, shuah@kernel.org, tytso@mit.edu,
 yamada.masahiro@socionext.com
User-Agent: alot/0.8.1
Date: Mon, 12 Aug 2019 16:46:44 -0700
Message-Id: <20190812234644.E054D20679@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565653605;
 bh=B5M35uPs7D5CLgV2WuA3jEwtQw8IijPFRqyXw/4bWMU=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=AGOwiTgbdj+2ifl0a7Xbp5/lsMWfdJc7+aAllnZ0hjKfSs/gNRN2411MBEaSKQzNW
 jmCAe62dNE3Eo33h9i7ShysYfWASja+7gi/ROqRCoY/PPSVzU5+gcDFa0QwS9wu2/G
 09nGYZB8GjciLbmMfntmYaBwKJxcaqwUc60bVJjM=
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
 richard@nod.at, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 mpe@ellerman.id.au, linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDgtMTIgMTE6MjQ6MDcpCj4gQWRkIGBzdHJ1
Y3Qga3VuaXRfYXNzZXJ0YCBhbmQgZnJpZW5kcyB3aGljaCBwcm92aWRlIGEgc3RydWN0dXJlZCB3
YXkgdG8KPiBjYXB0dXJlIGRhdGEgZnJvbSBhbiBleHBlY3RhdGlvbiBvciBhbiBhc3NlcnRpb24g
KGludHJvZHVjZWQgbGF0ZXIgaW4KPiB0aGUgc2VyaWVzKSBzbyB0aGF0IGl0IG1heSBiZSBwcmlu
dGVkIG91dCBpbiB0aGUgZXZlbnQgb2YgYSBmYWlsdXJlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJy
ZW5kYW4gSGlnZ2lucyA8YnJlbmRhbmhpZ2dpbnNAZ29vZ2xlLmNvbT4KPiAtLS0KClJldmlld2Vk
LWJ5OiBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+CgpKdXN0IHNvbWUgbWlub3Igbml0
cyBiZWxvdwoKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9rdW5pdC9hc3NlcnQuaCBiL2luY2x1ZGUv
a3VuaXQvYXNzZXJ0LmgKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAw
MDAuLjU1ZjFiODhiMGNiNGQKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvaW5jbHVkZS9rdW5pdC9h
c3NlcnQuaAo+IEBAIC0wLDAgKzEsMTgzIEBAClsuLi5dCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHN0cnVjdCBzdHJpbmdfc3RyZWFtICpzdHJlYW0pOwo+ICsKPiArc3RydWN0IGt1bml0
X2ZhaWxfYXNzZXJ0IHsKPiArICAgICAgIHN0cnVjdCBrdW5pdF9hc3NlcnQgYXNzZXJ0Owo+ICt9
Owo+ICsKPiArdm9pZCBrdW5pdF9mYWlsX2Fzc2VydF9mb3JtYXQoY29uc3Qgc3RydWN0IGt1bml0
X2Fzc2VydCAqYXNzZXJ0LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBz
dHJpbmdfc3RyZWFtICpzdHJlYW0pOwo+ICsKPiArI2RlZmluZSBLVU5JVF9JTklUX0ZBSUxfQVNT
RVJUX1NUUlVDVCh0ZXN0LCB0eXBlKSB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsg
ICAgICAgICAgICAgICAuYXNzZXJ0ID0gS1VOSVRfSU5JVF9BU1NFUlRfU1RSVUNUKHRlc3QsICAg
ICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdHlwZSwgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBrdW5pdF9mYWlsX2Fz
c2VydF9mb3JtYXQpICAgXAoKVGhpcyBvbmUgZ290IGluZGVudGVkIG9uZSB0b28gbWFueSB0aW1l
cz8KCj4gK30KPiArCj4gK3N0cnVjdCBrdW5pdF91bmFyeV9hc3NlcnQgewo+ICsgICAgICAgc3Ry
dWN0IGt1bml0X2Fzc2VydCBhc3NlcnQ7Cj4gKyAgICAgICBjb25zdCBjaGFyICpjb25kaXRpb247
Cj4gKyAgICAgICBib29sIGV4cGVjdGVkX3RydWU7Cj4gK307Cj4gKwo+ICt2b2lkIGt1bml0X3Vu
YXJ5X2Fzc2VydF9mb3JtYXQoY29uc3Qgc3RydWN0IGt1bml0X2Fzc2VydCAqYXNzZXJ0LAo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgc3RyaW5nX3N0cmVhbSAqc3RyZWFt
KTsKPiArClsuLi5dCj4gKyNkZWZpbmUgS1VOSVRfSU5JVF9CSU5BUllfU1RSX0FTU0VSVF9TVFJV
Q1QodGVzdCwgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHR5cGUsICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgb3Bf
c3RyLCAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBsZWZ0X3N0ciwgICAgICAgICAgICAgICAgICAgICAgICAg
IFwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxlZnRfdmFs
LCAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcmlnaHRfc3RyLCAgICAgICAgICAgICAgICAgICAgICAgICBcCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByaWdodF92YWwpIHsg
ICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgIC5hc3NlcnQgPSBLVU5JVF9JTklUX0FT
U0VSVF9TVFJVQ1QodGVzdCwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0eXBlLCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGt1bml0X2JpbmFyeV9zdHJfYXNzZXJ0X2Zvcm1hdCksICAgIFwKPiArICAgICAgIC5v
cGVyYXRpb24gPSBvcF9zdHIsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXAo+ICsgICAgICAgLmxlZnRfdGV4dCA9IGxlZnRfc3RyLCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICAubGVmdF92
YWx1ZSA9IGxlZnRfdmFsLCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFwKPiArICAgICAgIC5yaWdodF90ZXh0ID0gcmlnaHRfc3RyLCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgLnJpZ2h0X3ZhbHVl
ID0gcmlnaHRfdmFsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcCj4gK30KCkl0IHdvdWxkIGJlIG5pY2UgdG8gaGF2ZSBrZXJuZWwgZG9jIG9uIHRoZXNlIG1h
Y3JvcyBzbyB3ZSBrbm93IGhvdyB0bwp1c2UgdGhlbS4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
