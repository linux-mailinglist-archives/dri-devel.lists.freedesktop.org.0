Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5040C73E4F
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 22:24:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77DC06E654;
	Wed, 24 Jul 2019 20:24:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C33E6E654
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 20:24:04 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 207so42953550wma.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 13:24:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QhT2aDY6DDwFo4u6pSSbFcjckneqY/fJmJSPh2en2QU=;
 b=EBrcVwqEcqhUUbh73hvTGfZ+o8JDGLzar+EJpVIDz9EZmyaZmvsqXAxlBlh04xkPbo
 Jx2ZgBMSDTBQnNnUFEtBuea2gqRVRdeC+j9u34kE4z9GZm/gzk2HKTgvZjgTuX4rNCt1
 WKzKrQ5BMFivMN9pN5UWB+MEwmANFxa76f489sVv8uuGra5FIwzs/QINAnjOs2/aq6m1
 RQIdW7M6KXddPrIOtuPc1P1BiToiwYYwMxp50qTdXNx9KvLvaJMeTNDZJyi81/xXAfZw
 ztJAAblVpae5aPR/MrTligUgqoiA+5lL72MVMamoW1ecVa3uZeFXp8ll8O5GHYxp31Ag
 KBhQ==
X-Gm-Message-State: APjAAAVjML6rZRCAST05qCwT6yToiQ1ZhxDRGyjb4n/E7Xz7tj7hachU
 aTUbLxZCJVIeU2UE41PFGsZgiO3m/CS4jW2s6fyxdw==
X-Google-Smtp-Source: APXvYqxenlGpviTUKajhjd5h70fbVtfBZYjpg7adyab446NPvnKr6jujmjoqrk0eooFifFaFDgKzniRhKNTV1qCOUmI=
X-Received: by 2002:a1c:dc07:: with SMTP id t7mr78697953wmg.164.1563999842462; 
 Wed, 24 Jul 2019 13:24:02 -0700 (PDT)
MIME-Version: 1.0
References: <3b922aa4-c6d4-e4a4-766d-f324ff77f7b5@linux.com>
 <40f8b7d8-fafa-ad99-34fb-9c63e34917e2@redhat.com>
 <CALAqxLU199ATrMFa2ARmHOZ3K6ZnOuDLSAqNrTfwOWJaYiW7Yg@mail.gmail.com>
In-Reply-To: <CALAqxLU199ATrMFa2ARmHOZ3K6ZnOuDLSAqNrTfwOWJaYiW7Yg@mail.gmail.com>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 24 Jul 2019 13:23:50 -0700
Message-ID: <CALAqxLU0VUp=PGx5=JuVp6c5gwLqpSZJxs7ieL631QhdzNQTyA@mail.gmail.com>
Subject: Re: Limits for ION Memory Allocator
To: Laura Abbott <labbott@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=QhT2aDY6DDwFo4u6pSSbFcjckneqY/fJmJSPh2en2QU=;
 b=exDKJ9fgAtICWDsB/RyvdCl1jI5YfgCIMwTNcxzkx1dyGll/JyL2AkvfnRrYbEirOB
 SEerS90nbZ0Y7uMtaafsNIrKrn2E8fDeOQgPH6N7PGG/abR8nOS6fvcaIr90v+MoUQKL
 Ya6XED0C/nS/Tu4DavDXSBDkL98MKY8aQ7cX7xm2OvAUaFe02AX21Q5ZVMnonR86zf17
 jiYfPhij00tvovhGp4mpN1FJt4aO8yIzLriVTZilkdXv0YgY3MVNNVFA64d7rNVzPt7/
 uDoAdw/I9wt7F4M+AoQ+DsbgfrLlirjsYmK30WF8s1pOpJ9mOGqbMiO76979hv3CBGmj
 6/GQ==
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>, Linux-MM <linux-mm@kvack.org>,
 Joel Fernandes <joel@joelfernandes.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 driverdevel <devel@driverdev.osuosl.org>,
 Christian Brauner <christian@brauner.io>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, alex.popov@linux.com,
 Alistair Delva <adelva@google.com>, Todd Kjos <tkjos@android.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Riley Andrews <riandrews@android.com>, syzkaller <syzkaller@googlegroups.com>,
 Martijn Coenen <maco@android.com>, Dmitry Vyukov <dvyukov@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 Mark Brown <broonie@kernel.org>, Hridya Valsaraju <hridya@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgMToxOCBQTSBKb2huIFN0dWx0eiA8am9obi5zdHVsdHpA
bGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIEp1bCAyNCwgMjAxOSBhdCAxMjozNiBQTSBM
YXVyYSBBYmJvdHQgPGxhYmJvdHRAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gNy8xNy8x
OSAxMjozMSBQTSwgQWxleGFuZGVyIFBvcG92IHdyb3RlOgo+ID4gPiBIZWxsbyEKPiA+ID4KPiA+
ID4gVGhlIHN5emthbGxlciBbMV0gaGFzIGEgdHJvdWJsZSB3aXRoIGZ1enppbmcgdGhlIExpbnV4
IGtlcm5lbCB3aXRoIElPTiBNZW1vcnkKPiA+ID4gQWxsb2NhdG9yLgo+ID4gPgo+ID4gPiBTeXpr
YWxsZXIgdXNlcyBzZXZlcmFsIG1ldGhvZHMgWzJdIHRvIGxpbWl0IG1lbW9yeSBjb25zdW1wdGlv
biBvZiB0aGUgdXNlcnNwYWNlCj4gPiA+IHByb2Nlc3NlcyBjYWxsaW5nIHRoZSBzeXNjYWxscyBm
b3IgdGVzdGluZyB0aGUga2VybmVsOgo+ID4gPiAgIC0gc2V0cmxpbWl0KCksCj4gPiA+ICAgLSBj
Z3JvdXBzLAo+ID4gPiAgIC0gdmFyaW91cyBzeXNjdGwuCj4gPiA+IEJ1dCB0aGVzZSBtZXRob2Rz
IGRvbid0IHdvcmsgZm9yIElPTiBNZW1vcnkgQWxsb2NhdG9yLCBzbyBhbnkgdXNlcnNwYWNlIHBy
b2Nlc3MKPiA+ID4gdGhhdCBoYXMgYWNjZXNzIHRvIC9kZXYvaW9uIGNhbiBicmluZyB0aGUgc3lz
dGVtIHRvIHRoZSBvdXQtb2YtbWVtb3J5IHN0YXRlLgo+ID4gPgo+ID4gPiBBbiBleGFtcGxlIG9m
IGEgcHJvZ3JhbSBkb2luZyB0aGF0Ogo+ID4gPgo+ID4gPgo+ID4gPiAjaW5jbHVkZSA8c3lzL3R5
cGVzLmg+Cj4gPiA+ICNpbmNsdWRlIDxzeXMvc3RhdC5oPgo+ID4gPiAjaW5jbHVkZSA8ZmNudGwu
aD4KPiA+ID4gI2luY2x1ZGUgPHN0ZGlvLmg+Cj4gPiA+ICNpbmNsdWRlIDxsaW51eC90eXBlcy5o
Pgo+ID4gPiAjaW5jbHVkZSA8c3lzL2lvY3RsLmg+Cj4gPiA+Cj4gPiA+ICNkZWZpbmUgSU9OX0lP
Q19NQUdJQyAgICAgICAgICdJJwo+ID4gPiAjZGVmaW5lIElPTl9JT0NfQUxMT0MgICAgICAgICBf
SU9XUihJT05fSU9DX01BR0lDLCAwLCBcCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHN0cnVjdCBpb25fYWxsb2NhdGlvbl9kYXRhKQo+ID4gPgo+ID4gPiBzdHJ1Y3Qg
aW9uX2FsbG9jYXRpb25fZGF0YSB7Cj4gPiA+ICAgICAgIF9fdTY0IGxlbjsKPiA+ID4gICAgICAg
X191MzIgaGVhcF9pZF9tYXNrOwo+ID4gPiAgICAgICBfX3UzMiBmbGFnczsKPiA+ID4gICAgICAg
X191MzIgZmQ7Cj4gPiA+ICAgICAgIF9fdTMyIHVudXNlZDsKPiA+ID4gfTsKPiA+ID4KPiA+ID4g
aW50IG1haW4odm9pZCkKPiA+ID4gewo+ID4gPiAgICAgICB1bnNpZ25lZCBsb25nIGkgPSAwOwo+
ID4gPiAgICAgICBpbnQgZmQgPSAtMTsKPiA+ID4gICAgICAgc3RydWN0IGlvbl9hbGxvY2F0aW9u
X2RhdGEgZGF0YSA9IHsKPiA+ID4gICAgICAgICAgICAgICAubGVuID0gMHgxM2Y2NWQ4YywKPiA+
ID4gICAgICAgICAgICAgICAuaGVhcF9pZF9tYXNrID0gMSwKPiA+ID4gICAgICAgICAgICAgICAu
ZmxhZ3MgPSAwLAo+ID4gPiAgICAgICAgICAgICAgIC5mZCA9IC0xLAo+ID4gPiAgICAgICAgICAg
ICAgIC51bnVzZWQgPSAwCj4gPiA+ICAgICAgIH07Cj4gPiA+Cj4gPiA+ICAgICAgIGZkID0gb3Bl
bigiL2Rldi9pb24iLCAwKTsKPiA+ID4gICAgICAgaWYgKGZkID09IC0xKSB7Cj4gPiA+ICAgICAg
ICAgICAgICAgcGVycm9yKCJbLV0gb3BlbiAvZGV2L2lvbiIpOwo+ID4gPiAgICAgICAgICAgICAg
IHJldHVybiAxOwo+ID4gPiAgICAgICB9Cj4gPiA+Cj4gPiA+ICAgICAgIHdoaWxlICgxKSB7Cj4g
PiA+ICAgICAgICAgICAgICAgcHJpbnRmKCJpdGVyICVsdVxuIiwgaSk7Cj4gPiA+ICAgICAgICAg
ICAgICAgaW9jdGwoZmQsIElPTl9JT0NfQUxMT0MsICZkYXRhKTsKPiA+ID4gICAgICAgICAgICAg
ICBpKys7Cj4gPiA+ICAgICAgIH0KPiA+ID4KPiA+ID4gICAgICAgcmV0dXJuIDA7Cj4gPiA+IH0K
PiA+ID4KPiA+ID4KPiA+ID4gSSBsb29rZWQgdGhyb3VnaCB0aGUgY29kZSBvZiBpb25fYWxsb2Mo
KSBhbmQgZGlkbid0IGZpbmQgYW55IGxpbWl0IGNoZWNrcy4KPiA+ID4gSXMgaXQgY3VycmVudGx5
IHBvc3NpYmxlIHRvIGxpbWl0IElPTiBrZXJuZWwgYWxsb2NhdGlvbnMgZm9yIHNvbWUgcHJvY2Vz
cz8KPiA+ID4KPiA+ID4gSWYgbm90LCBpcyBpdCBhIHJpZ2h0IGlkZWEgdG8gZG8gdGhhdD8KPiA+
ID4gVGhhbmtzIQo+ID4gPgo+ID4KPiA+IFllcywgSSBkbyB0aGluayB0aGF0J3MgdGhlIHJpZ2h0
IGFwcHJvYWNoLiBXZSdyZSB3b3JraW5nIG9uIG1vdmluZyBJb24KPiA+IG91dCBvZiBzdGFnaW5n
IGFuZCB0aGlzIGlzIHNvbWV0aGluZyBJIG1lbnRpb25lZCB0byBKb2huIFN0dWx0ei4gSSBkb24n
dAo+ID4gdGhpbmsgd2UndmUgdGhvdWdodCB0b28gaGFyZCBhYm91dCBob3cgdG8gZG8gdGhlIGFj
dHVhbCBsaW1pdGluZyBzbwo+ID4gc3VnZ2VzdGlvbnMgYXJlIHdlbGNvbWUuCj4KPiBJbiBwYXJ0
IHRoZSBkbWFidWYgaGVhcHMgYWxsb3cgZm9yIHNlcGFyYXRlIGhlYXAgZGV2aWNlcywgc28gd2Ug
Y2FuCj4gaGF2ZSBmaW5lciBncmFpbmVkIHBlcm1pc3Npb25zIHRvIHRoZSBzcGVjaWZpYyBoZWFw
cy4gIEJ1dCB0aGF0Cj4gZG9lc24ndCBwcm92aWRlIGFueSBjb250cm9scyBvbiBob3cgbXVjaCBt
ZW1vcnkgb25lIHByb2Nlc3MgY291bGQKPiBhbGxvY2F0ZSB1c2luZyB0aGUgZGV2aWNlIGlmIGl0
IGhhcyBwZXJtaXNzaW9uLgo+Cj4gSSBzdXNwZWN0IHRoZSBzYW1lIGlzc3VlIGlzIHByZXNlbnQg
d2l0aCBhbnkgb2YgdGhlIGRtYWJ1ZiBleHBvcnRlcnMKPiAoZ3B1L2Rpc3BsYXkgZHJpdmVycywg
ZXRjKSwgc28gdGhpcyBpcyBsZXNzIG9mIGFuIElPTi9kbWFidWYgaGVhcAo+IGlzc3VlIGFuZCBt
b3JlIG9mIGEgZG1hYnVmIGNvcmUgYWNjb3VudGluZyBpc3N1ZS4KPgoKQWxzbywgZG8gdW5tYXBw
ZWQgbWVtZmQgYnVmZmVycyBoYXZlIHNpbWlsYXIgYWNjb3VudGluZyBpc3N1ZXM/Cgp0aGFua3MK
LWpvaG4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
