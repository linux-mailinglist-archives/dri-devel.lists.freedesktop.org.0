Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C43B4EF55
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 21:21:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 097506E917;
	Fri, 21 Jun 2019 19:21:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8036A6E917
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 19:21:02 +0000 (UTC)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net
 [24.9.64.241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6B5A92083B;
 Fri, 21 Jun 2019 19:20:59 +0000 (UTC)
Subject: Re: [PATCH v5 00/18] kunit: introduce KUnit, the Linux kernel unit
 testing framework
To: Theodore Ts'o <tytso@mit.edu>, Frank Rowand <frowand.list@gmail.com>,
 Brendan Higgins <brendanhiggins@google.com>, gregkh@linuxfoundation.org,
 jpoimboe@redhat.com, keescook@google.com, kieran.bingham@ideasonboard.com,
 mcgrof@kernel.org, peterz@infradead.org, robh@kernel.org, sboyd@kernel.org,
 yamada.masahiro@socionext.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-um@lists.infradead.org, Alexander.Levin@microsoft.com,
 Tim.Bird@sony.com, amir73il@gmail.com, dan.carpenter@oracle.com,
 daniel@ffwll.ch, jdike@addtoit.com, joel@jms.id.au, julia.lawall@lip6.fr,
 khilman@baylibre.com, knut.omang@oracle.com, logang@deltatee.com,
 mpe@ellerman.id.au, pmladek@suse.com, rdunlap@infradead.org, richard@nod.at,
 rientjes@google.com, rostedt@goodmis.org, wfg@linux.intel.com,
 shuah <shuah@kernel.org>
References: <20190617082613.109131-1-brendanhiggins@google.com>
 <10feac3e-7621-65e5-fbf0-9c63fcbe09c9@gmail.com>
 <69809117-dcda-160a-ee0a-d1d3b4c5cd8a@kernel.org>
 <20190621181342.GA17166@mit.edu>
From: shuah <shuah@kernel.org>
Message-ID: <6f3f5184-d14e-1b46-17f1-391ee67e699c@kernel.org>
Date: Fri, 21 Jun 2019 13:20:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190621181342.GA17166@mit.edu>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1561144861;
 bh=iSLE8vYN1CVyQpDZAjB5wUepW90aWW8GZV7fiOhOYLI=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=rOFoGcMjhktMurUdgbCbMpH3CuYbo8f6qv7k7t5ZU+gIRgWY3jvHjiKlvUH/4gtGc
 tkaS0EnLDQaBH4l1BqZoXz0YVlaxT1A7Gl2P40Psq6fLWLtfADeY2VcXqK9sRP2COc
 9m3M+jF/ht6KFuEDIJyo7S5GsVZembQBcUNReF8I=
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNi8yMS8xOSAxMjoxMyBQTSwgVGhlb2RvcmUgVHMnbyB3cm90ZToKPiBPbiBGcmksIEp1biAy
MSwgMjAxOSBhdCAwODo1OTo0OEFNIC0wNjAwLCBzaHVhaCB3cm90ZToKPj4+PiAjIyMgQnV0IHdh
aXQhIERvZXNuJ3Qga3NlbGZ0ZXN0IHN1cHBvcnQgaW4ga2VybmVsIHRlc3Rpbmc/IQo+Pj4+Cj4+
Pj4gLi4uLgo+Pgo+PiBJIHRoaW5rIEkgY29tbWVudGVkIG9uIHRoaXMgYmVmb3JlLiBJIGFncmVl
IHdpdGggdGhlIHN0YXRlbWVudCB0aGF0Cj4+IHRoZXJlIGlzIG5vIG92ZXJsYXAgYmV0d2VlbiBL
c2VsZnRlc3QgYW5kIEtVbml0LiBJIHdvdWxkIGxpa2Ugc2VlIHRoaXMKPj4gcmVtb3ZlZC4gS3Nl
bGZ0ZXN0IG1vZHVsZSBzdXBwb3J0IHN1cHBvcnRzIHVzZS1jYXNlcyBLVW5pdCB3b24ndCBiZSBh
YmxlCj4+IHRvLiBJIGNhbiBidWlsZCBhbiBrZXJuZWwgd2l0aCBLc2VsZnRlc3QgdGVzdCBtb2R1
bGVzIGFuZCB1c2UgaXQgaW4gdGhlCj4+IGZpbGVkIHRvIGxvYWQgYW5kIHJ1biB0ZXN0cyBpZiBJ
IG5lZWQgdG8gZGVidWcgYSBwcm9ibGVtIGFuZCBnZXQgZGF0YQo+PiBmcm9tIGEgc3lzdGVtLiBJ
IGNhbid0IGRvIHRoYXQgd2l0aCBLVW5pdC4KPj4KPj4gSW4gbXkgbWluZCwgSSBhbSBub3Qgdmll
d2luZyB0aGlzIGFzIHdoaWNoIGlzIGJldHRlci4gS3NlbGZ0ZXN0IGFuZAo+PiBLVW5pdCBib3Ro
IGhhdmUgdGhlaXIgcGxhY2UgaW4gdGhlIGtlcm5lbCBkZXZlbG9wbWVudCBwcm9jZXNzLiBJdCBp
c24ndAo+PiBwcm9kdWN0aXZlIGFuZC9vciBuZWNlc3NhcnkgdG8gY29tcGFyaW5nIEtzZWxmdGVz
dCBhbmQgS1VuaXQgd2l0aG91dCBhCj4+IGdvb2QgdW5kZXJzdGFuZGluZyBvZiB0aGUgcHJvYmxl
bSBzcGFjZXMgZm9yIGVhY2ggb2YgdGhlc2UuCj4+Cj4+IEkgd291bGQgc3Ryb25nbHkgcmVjb21t
ZW5kIG5vdCBtYWtpbmcgcmVmZXJlbmNlIHRvIEtzZWxmdGVzdCBhbmQgdGFsawo+PiBhYm91dCB3
aGF0IEtVbml0IG9mZmVycy4KPiAKPiBTaHVhaCwKPiAKPiBKdXN0IHRvIHJlY2FsbCB0aGUgaGlz
dG9yeSwgdGhpcyBzZWN0aW9uIG9mIHRoZSBGQVEgd2FzIGFkZGVkIHRvIHJlYnV0Cj4gdGhlICoq
KnZlcnkqKiogc3Ryb25nIHN0YXRlbWVudHMgdGhhdCBGcmFuayBtYWRlIHRoYXQgdGhlcmUgd2Fz
Cj4gb3ZlcmxhcCBiZXR3ZWVuIEtzZWxmdGVzdCBhbmQgS3VuaXQsIGFuZCB0aGF0IGhhdmluZyB0
b28gbWFueSB3YXlzIGZvcgo+IGtlcm5lbCBkZXZlbG9wZXJzIHRvIGRvIHRoZSBpZGVudGljYWwg
dGhpbmcgd2FzIGhhcm1mdWwgKGhlIHNhaWQgaXQKPiB3YXMgdG9vIG11Y2ggb2YgYSBidXJkZW4g
b24gYSBrZXJuZWwgZGV2ZWxvcGVyKSAtLS0gYW5kIHRoaXMgd2FzIGFuCj4gYXJndW1lbnQgZm9y
IG5vdCBpbmNsdWRpbmcgS3VuaXQgaW4gdGhlIHVwc3RyZWFtIGtlcm5lbC4KPiAKPiBJZiB3ZSdy
ZSBwYXN0IHRoYXQgb2JqZWN0aW9uLCB0aGVuIHBlcmhhcHMgdGhpcyBzZWN0aW9uIGNhbiBiZQo+
IGRyb3BwZWQsIGJ1dCB0aGVyZSdzIGEgdmVyeSBnb29kIHJlYXNvbiB3aHkgaXQgd2FzIHRoZXJl
LiAgSSB3b3VsZG4ndAo+IEJyZW5kYW4gdG8gYmUgYWNjdXNlZCBvZiBpZ25vcmluZyBmZWVkYmFj
ayBmcm9tIHRob3NlIHdobyByZXZpZXdlZCBoaXMKPiBwYXRjaGVzLiAgIDotKQo+IAoKQWdyZWVk
LiBJIHVuZGVyc3RhbmQgdGhhdCB0aGlzIEZBUSBwcm9iYWJseSB3YXMgbmVlZGVkIGF0IG9uZSB0
aW1lIGFuZApCcmVuZGFuIGFkZGVkIGl0IHRvIGFkZHJlc3MgdGhlIGNvbmNlcm5zLgoKSSB0aGlu
ayBhdCBzb21lIHBvaW50IHdlIGRvIG5lZWQgdG8gaGF2ZSBhIGRvY3VtZW50IHRoYXQgb3V0bGlu
ZXMgd2hlbgp0byBLVW5pdCBhbmQgd2hlbiB0byB1c2UgS3NlbGZ0ZXN0IG1vZHVsZXMuIEkgdGhp
bmsgb25lIGNvbmNlcm4gcGVvcGxlCmhhdmUgaXMgdGhhdCBpZiBLVW5pdCBpcyBwZXJjZWl2ZWQg
YXMgYSAgcmVwbGFjZW1lbnQgZm9yIEtzZWZsdGVzdAptb2R1bGUsIEtzZWxmdGVzdCBtb2R1bGUg
d2lsbCBiZSBpZ25vcmVkIGxlYXZpbmcgdXNlcnMgd2l0aG91dCB0aGUKYWJpbGl0eSB0byBidWls
ZCBhbmQgcnVuIHdpdGggS3NlbGZ0ZXN0IG1vZHVsZXMgYW5kIGxvYWQgdGhlbSBvbiBhIG5lZWQK
YmFzaXMgdG8gZ2F0aGVyIGRhdGEgb24gYSBzeXN0ZW1zIHRoYXQgYXJlbid0IGRlZGljYXRlZCBz
dHJpY3RseSBmb3IKdGVzdGluZy4KCkkgYW0gdHJ5aW5nIHRvIG1vdmUgdGhlIGNvbnZlcnNhdGlv
biBmb3J3YXJkIGZyb20gS1VuaXQgdnMuIEtzZWxmdGVzdAptb2R1bGVzIGRpc2N1c3Npb24gdG8g
d2hpY2ggcHJvYmxlbSBhcmVhcyBlYWNoIG9uZSBhZGRyZXNzZXMga2VlcGluZwppbiBtaW5kIHRo
YXQgaXQgaXMgbm90IGFib3V0IHdoaWNoIGlzIGJldHRlci4gS3NlbGZ0ZXN0IGFuZCBLVW5pdCBi
b3RoCmhhdmUgdGhlaXIgcGxhY2UgaW4gdGhlIGtlcm5lbCBkZXZlbG9wbWVudCBwcm9jZXNzLiBX
ZSBqdXN0IGhhdmUgdG8gYmUKY2xlYXIgb24gdXNhZ2UgYXMgd2Ugd3JpdGUgdGVzdHMgZm9yIGVh
Y2guCgp0aGFua3MsCi0tIFNodWFoCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
