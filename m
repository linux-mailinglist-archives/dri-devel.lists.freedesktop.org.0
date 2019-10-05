Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB26CC725
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2019 03:18:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DABD56E31E;
	Sat,  5 Oct 2019 01:18:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DCEA6E31E
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Oct 2019 01:18:17 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id e5so3913070pls.9
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Oct 2019 18:18:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q2oP8A+66Rac3wNrpkR8MWsLUwrIym5JWD2OWoQLn2I=;
 b=gpqcZ4pi12aLn4vdndJndDNt/W8S02cehI3vXsFR2sPT6CeTt3N17rpgCIzy2Gc/JQ
 aveubKp1btMgRvA9h7dCLaaC0YOLjMNSs+YgIZVA+tPmomDIx7/oH9fq5meQtLsWek6O
 WFqRLQllOv6ioMJwAqBFzc8LOTIfzgKJ+cE+LYSo7plJj/b2D4VHncvDIdgcO2CTYVyb
 HlBX5T4mCIJYNsmkNomsV9KD1TgbWTtu9hmxI01D9T0nmolQc1IVGgSevLJ8mAz7yhbU
 3iU7Qxu/0XqzgeGL4jdWNjw/craMkcn1UzmfWXavzYRYZRsNH6Af3gO/YzZCaO2hRTgS
 /LEQ==
X-Gm-Message-State: APjAAAWPDDUCJQpAiJwD5WsCbGQO285vWsWoaAf+0Q0BjzS8VjGsFIH6
 L3jw3m7uHp6JGOcCU1yQi6Aqd39A1+/EoehFVKDW/A==
X-Google-Smtp-Source: APXvYqxXIgL1V9Pz63bm5hrH1w7OGcZMj9O7xWX+0gLh6oom7FtSqHJPBvTviBg5NgEsO3lWv0/RgnZ1WUmPfaPcH/I=
X-Received: by 2002:a17:902:8f88:: with SMTP id
 z8mr18539665plo.232.1570238296215; 
 Fri, 04 Oct 2019 18:18:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190923090249.127984-1-brendanhiggins@google.com>
 <20191004213812.GA24644@mit.edu>
 <CAHk-=whX-JbpM2Sc85epng_GAgGGzxRAJ2SSKkMf9N1Lsqe+OA@mail.gmail.com>
 <56e2e1a7-f8fe-765b-8452-1710b41895bf@kernel.org>
 <20191004222714.GA107737@google.com>
 <ad800337-1ae2-49d2-e715-aa1974e28a10@kernel.org>
 <20191004232955.GC12012@mit.edu>
 <CAFd5g456rBSp177EkYAwsF+KZ0rxJa90mzUpW2M3R7tWbMAh9Q@mail.gmail.com>
 <63e59b0b-b51e-01f4-6359-a134a1f903fd@kernel.org>
 <CAFd5g47wji3T9RFmqBwt+jPY0tb83y46oj_ttOq=rTX_N1Ggyg@mail.gmail.com>
 <544bdfcb-fb35-5008-ec94-8d404a08fd14@kernel.org>
In-Reply-To: <544bdfcb-fb35-5008-ec94-8d404a08fd14@kernel.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Fri, 4 Oct 2019 18:18:04 -0700
Message-ID: <CAFd5g467PkfELixpU0JbaepEAAD_ugAA340-uORngC-eXsQQ-g@mail.gmail.com>
Subject: Re: [PATCH v18 00/19] kunit: introduce KUnit, the Linux kernel unit
 testing framework
To: shuah <shuah@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=q2oP8A+66Rac3wNrpkR8MWsLUwrIym5JWD2OWoQLn2I=;
 b=GPhhjUv+KkS/VzHR5+UKHbUpig67OUz+p2ab8gzDSHD3qWPn5BM1Y5BuX7lxM7j2sb
 kfHr9wmq/ZxD9CMSuGBeBnRcFNxBoNrc0jkNUB4Rgmx5E/OBumH+nRsrohMgMe+j/Rvr
 t8LXEhaVzelX3CPRpPkB2Y5G0/ztqK3oeYNRWvHYetjEo1eOHmWOT3CD6xhMJchs6eDb
 OxHBa5qEKGeZBHYqpxi4evGAx/VhufwkpQPNLZaEp4DWShmC9T8N6LCor4kERCu29UaE
 O+Yo2QExYcBHz7N8yqMIajJuvzJZ49QCOIBtYIj8yxzgyIBkwnbnqn5CemWWy9ROQDur
 OLdw==
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
Cc: Petr Mladek <pmladek@suse.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Amir Goldstein <amir73il@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sasha Levin <Alexander.Levin@microsoft.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 linux-nvdimm <linux-nvdimm@lists.01.org>, Kevin Hilman <khilman@baylibre.com>,
 Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Josh Poimboeuf <jpoimboe@redhat.com>, kunit-dev@googlegroups.com,
 Logan Gunthorpe <logang@deltatee.com>, "Theodore Y. Ts'o" <tytso@mit.edu>,
 Richard Weinberger <richard@nod.at>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgNCwgMjAxOSBhdCA1OjQ5IFBNIHNodWFoIDxzaHVhaEBrZXJuZWwub3JnPiB3
cm90ZToKPgo+IE9uIDEwLzQvMTkgNjozMyBQTSwgQnJlbmRhbiBIaWdnaW5zIHdyb3RlOgo+ID4g
T24gRnJpLCBPY3QgNCwgMjAxOSBhdCA0OjU3IFBNIHNodWFoIDxzaHVhaEBrZXJuZWwub3JnPiB3
cm90ZToKPiA+Pgo+ID4+IE9uIDEwLzQvMTkgNTo1MiBQTSwgQnJlbmRhbiBIaWdnaW5zIHdyb3Rl
Ogo+ID4+PiBPbiBGcmksIE9jdCA0LCAyMDE5IGF0IDQ6MzAgUE0gVGhlb2RvcmUgWS4gVHMnbyA8
dHl0c29AbWl0LmVkdT4gd3JvdGU6Cj4gPj4+Pgo+ID4+Pj4gT24gRnJpLCBPY3QgMDQsIDIwMTkg
YXQgMDQ6NDc6MDlQTSAtMDYwMCwgc2h1YWggd3JvdGU6Cj4gPj4+Pj4+IEhvd2V2ZXIsIGlmIEkg
ZW5jb3VyYWdlIGFyYml0cmFyeSB0ZXN0cy9pbXByb3ZlbWVudHMgaW50byBteSBLVW5pdAo+ID4+
Pj4+PiBicmFuY2gsIGl0IGZ1cnRoZXIgZGl2ZXJnZXMgYXdheSBmcm9tIHRvcnZhbGRzL21hc3Rl
ciwgYW5kIGlzIG1vcmUKPiA+Pj4+Pj4gbGlrZWx5IHRoYXQgdGhlcmUgd2lsbCBiZSBhIG1lcmdl
IGNvbmZsaWN0IG9yIGlzc3VlIHRoYXQgaXMgbm90IHJlbGF0ZWQKPiA+Pj4+Pj4gdG8gdGhlIGNv
cmUgS1VuaXQgY2hhbmdlcyB0aGF0IHdpbGwgY2F1c2UgdGhlIHdob2xlIHRoaW5nIHRvIGJlCj4g
Pj4+Pj4+IHJlamVjdGVkIGFnYWluIGluIHY1LjUuCj4gPj4+Pj4KPiA+Pj4+PiBUaGUgaWRlYSBp
cyB0aGF0IHRoZSBuZXcgZGV2ZWxvcG1lbnQgd2lsbCBoYXBwZW4gYmFzZWQgb24ga3VuaXQgaW4K
PiA+Pj4+PiBsaW51eC1rc2VsZnRlc3QgbmV4dC4gSXQgd2lsbCB3b3JrIGp1c3QgZmluZS4gQXMg
d2UgYWNjZXB0cyBwYXRjaGVzLAo+ID4+Pj4+IHRoZXkgd2lsbCBnbyBvbiB0b3Agb2Yga3VuaXQg
dGhhdCBpcyBpbiBsaW51eC1uZXh0IG5vdy4KPiA+Pj4+Cj4gPj4+PiBJIGRvbid0IHNlZSBob3cg
dGhpcyB3b3VsZCB3b3JrLiAgSWYgSSBhZGQgdW5pdCB0ZXN0cyB0byBleHQ0LCB0aGV5Cj4gPj4+
PiB3b3VsZCBiZSBpbiBmcy9leHQ0LiAgQW5kIHRvIHRoZSBleHRlbnQgdGhhdCBJIG5lZWQgdG8g
YWRkIHRlc3QgbW9ja3MKPiA+Pj4+IHRvIGFsbG93IHRoZSB1bml0IHRlc3RzIHRvIHdvcmssIHRo
ZXkgd2lsbCBpbnZvbHZlIGNoYW5nZXMgdG8gZXhpc3RpbmcKPiA+Pj4+IGZpbGVzIGluIGZzL2V4
dDQuICBJIGNhbid0IHB1dCB0aGVtIGluIHRoZSBleHQ0LmdpdCB0cmVlIHdpdGhvdXQKPiA+Pj4+
IHB1bGxpbmcgaW4gdGhlIGt1bml0IGNoYW5nZXMgaW50byB0aGUgZXh0NCBnaXQgdHJlZS4gIEFu
ZCBpZiB0aGV5IGV4dDQKPiA+Pj4+IHVuaXQgdGVzdHMgbGFuZCBpbiB0aGUga3VuaXQgdHJlZSwg
aXQgd291bGQgYmUgYSByZWNlaXBlIGZvciBsYXJnZQo+ID4+Pj4gbnVtYmVycyBvZiBtZXJnZSBj
b25mbGljdHMuCj4gPj4+Cj4gPj4+IFRoYXQncyB3aGVyZSBJIHdhcyBvcmlnaW5hbGx5IGNvbWlu
ZyBmcm9tLgo+ID4+Pgo+ID4+PiBTbyBoZXJlJ3MgYSBkdW1iIGlkZWE6IHdoYXQgaWYgd2UgbWVy
Z2VkIEtVbml0IHRocm91Z2ggdGhlIGV4dDQgdHJlZT8KPiA+Pj4gSSBpbWFnaW5lIHRoYXQgY291
bGQgcG90ZW50aWFsbHkgZ2V0IHZlcnkgY29uZnVzaW5nIHdoZW4gd2UgZ28gYmFjayB0bwo+ID4+
PiBzZW5kaW5nIGNoYW5nZXMgaW4gdGhyb3VnaCB0aGUga3NlbGZ0ZXN0IHRyZWUsIGJ1dCBhdCBs
ZWFzdCBpdCBtZWFucwo+ID4+PiB0aGF0IGV4dDQgY2FuIHVzZSBpdCBpbiB0aGUgbWVhbnRpbWUs
IHdoaWNoIG1lYW5zIHRoYXQgaXQgYXQgbGVhc3QKPiA+Pj4gZ2V0cyB0byBiZSB1c2VmdWwgdG8g
b25lIGdyb3VwIG9mIHBlb3BsZS4gQWxzbywgc2luY2UgVGVkIHNlZW1zIHByZXR0eQo+ID4+PiBr
ZWVuIG9uIHVzaW5nIHRoaXMsIEkgaW1hZ2luZSBpdCBpcyBtdWNoIG1vcmUgbGlrZWx5IHRvIHBy
b2R1Y2UgcmVhbAo+ID4+PiB3b3JsZCwgaW1tZWRpYXRlbHkgdXNlZnVsIHRlc3RzIG5vdCB3cml0
dGVuIGJ5IG1lIChJJ20gbm90IGJlaW5nIGxhenksCj4gPj4+IEkganVzdCB0aGluayBpdCBpcyBi
ZXR0ZXIgdG8gZ2V0IG90aGVyIHBlb3BsZSdzIGV4cGVyaWVuY2VzIG90aGVyIHRoYW4KPiA+Pj4g
bXkgb3duKS4KPiA+Pj4KPiA+Pgo+ID4+IFRoYXQgZG9lc24ndCBtYWtlIHNlbnNlIGRvZXMgaXQ/
IFRoZSB0ZXN0cyBtaWdodCBub3QgYmUgbGltaXRlZCB0bwo+ID4+IGZzL2V4dDQuIFdlIG1pZ2h0
IGhhdmUgb3RoZXIgc3ViLXN5c3RlbXMgdGhhdCBhZGQgdGVzdHMuCj4gPgo+ID4gV2VsbCwgSSBo
YXZlIHNvbWUgc21hbGwgaXNvbGF0ZWQgZXhhbXBsZXMgdGhhdCBJIHRoaW5rIHdvdWxkIHByb2Jh
Ymx5Cj4gPiB3b3JrIG5vIG1hdHRlciB3aGF0LCBzbyB3ZSBjYW4gZ2V0IHNvbWUgdXNhZ2Ugb3V0
c2lkZSBvZiBleHQ0LiBBbHNvLAo+ID4gaWYgd2Ugd2FudCB0byBsaW1pdCB0aGUgbnVtYmVyIG9m
IHRlc3RzLCB0aGVuIHdlIGRvbid0IGV4cGVjdCB0byBnZXQKPiA+IG11Y2ggdXNhZ2Ugb3V0c2lk
ZSBvZiBleHQ0IGJlZm9yZSB2NS41IGFueXdheS4gSSBqdXN0IGZpZ3VyZSwgaXQncwo+ID4gYmV0
dGVyIHRvIG1ha2UgaXQgd29yayBmb3Igb25lIHBlcnNvbiB0aGFuIG5vIG9uZSwgcmlnaHQ/Cj4g
Pgo+ID4gSW4gYW55IGNhc2UsIEkgYWRtaXQgaXQgaXMgbm90IGEgZ3JlYXQgaWRlYS4gSSBqdXN0
IHRob3VnaHQgaXQgaGFkCj4gPiBzb21lIGludGVyZXN0aW5nIGFkdmFudGFnZXMgb3ZlciBnb2lu
ZyBpbiB0aHJvdWdoIGxpbnV4LWtzZWxmdGVzdCB0aGF0Cj4gPiB3ZXJlIHdvcnRoIGV4cGxvcmlu
Zy4KPiA+Cj4gPj4gU28sIHdlIHdpbGwgaGF2ZSB0byB3b3JrIHRvIG1ha2UgbGludXgtbmV4dCBh
cyB0aGUgYmFzZSBmb3IgbmV3Cj4gPj4gZGV2ZWxvcG1lbnQgYW5kIGxpbWl0IHRoZSBudW1iZXIg
b2YgdGVzdHMgdG8gd2hlcmUgaXQgd2lsbCBiZQo+ID4+IGVhc2llciB3b3JrIGluIHRoaXMgbW9k
ZSBmb3IgNS41LiBXZSBjYW4gc3RhZ2UgdGhlIHB1bGwgcmVxdWVzdHMKPiA+PiBzbyB0aGF0IGt1
bml0IGxhbmRzIGZpcnN0IGZvbGxvd2VkIGJ5IHRlc3RzLgo+ID4KPiA+IFNvIHdlIGFyZSBnb2lu
ZyB0byBlbmNvdXJhZ2UgbWFpbnRhaW5lcnMgdG8gYWxsb3cgdGVzdHMgaW4gdGhlaXIgdHJlZQo+
ID4gYmFzZWQgb24gS1VuaXQgb24gdGhlIGFzc3VtcHRpb24gdGhhdCBLVW5pdCB3aWxsIGdldCBt
ZXJnZWQgYmVmb3JlCj4gPiB0aGVyZSBjaGFuZ2VzPyBUaGF0IHNvdW5kcyBsaWtlIGEgaHVnZSBi
dXJkZW4sIG5vdCBqdXN0IG9uIHVzLCBidXQgb24KPiA+IG90aGVyIG1haW50YWluZXJzIGFuZCB1
c2Vycy4KPiA+Cj4gPiBJIHRoaW5rIGlmIHdlIGFyZSBnb2luZyB0byBhbGxvdyB0ZXN0cyBiZWZv
cmUgS1VuaXQgaXMgbWVyZ2VkLCB3ZQo+ID4gc2hvdWxkIGhhdmUgdGhlIHRlc3RzIGNvbWUgaW4g
dGhyb3VnaCB0aGUgc2FtZSB0cmVlIGFzIEtVbml0Lgo+ID4KPiA+PiBXZSBoYXZlIGEgc2ltaWxh
ciBzaXR1YXRpb24gd2l0aCBrc2VsZnRlc3QgYXMgd2VsbC4gU3ViLXN5c3RlbXMKPiA+PiBzZW5k
IHRlc3RzIHRoYXQgZGVwZW5kIG9uIHRoZWlyIHRyZXNzIHNlcGFyYXRlbHkuCj4gPgo+ID4gV2Vs
bCBpdCBpcyBkaWZmZXJlbnQgaWYgdGhlIG1haW50YWluZXIgd2FudHMgdG8gc2VuZCB0aGUgdGVz
dCBpbgo+ID4gdGhyb3VnaCB0aGVpciB0cmVlLCByaWdodD8gT3RoZXJ3aXNlLCBpdCB3b24ndCBt
YXR0ZXIgd2hhdCB0aGUgc3RhdGUKPiA+IG9mIGxpbnV4LW5leHQgaXMgYW5kIGl0IHdvbid0IG1h
dHRlciB3aGVuIGxpbnV4LWtzZWxmdGVzdCBnZXRzIG1lcmdlZC4KPiA+IE9yIGFtIEkgbm90IHVu
ZGVyc3RhbmRpbmcgeW91Pwo+ID4KPgo+IExldCdzIHRhbGsgYWJvdXQgY3VycmVudCBzdGF0ZS4g
UmlnaHQgbm93IGt1bml0IGlzIGluIGxpbnV4LW5leHQgYW5kCj4gd2Ugd2FudCB0byBhZGQgYSBm
ZXcgbW9yZSB0ZXN0cy4gV2Ugd2lsbCBoYXZlIHRvIGNvb3JkaW5hdGUgdGhlIGVmZm9ydC4KPiBP
bmNlIGt1bml0IGdldCBpbnRvIG1haW5saW5lLCB0aGVuIHRoZSBuZWVkIGZvciB0aGlzIGNvb3Jk
aW5hdGlvbiBnb2VzCj4gZG93bi4KClN1cmUsIEkgd2FzIGp1c3QgdGhpbmtpbmcgdGhhdCBnZXR0
aW5nIG90aGVyIHBlb3BsZSB0byB3cml0ZSB0aGUgdGVzdHMKd291bGQgYmUgYmV0dGVyLiBTaW5j
ZSBub3Qgb25seSBpcyBpdCB0aGVuIHVzZWZ1bCB0byBzb21lb25lIGVsc2UsIGl0CnByb3ZpZGVz
IHRoZSBiZXN0IHBvc3NpYmxlIGV4ZXJjaXNlIG9mIEtVbml0LgoKTmV2ZXJ0aGVsZXNzLCBpdCB3
b3VsZCBwcm9iYWJseSBqdXN0IGJlIGVhc2llciB0byBnZXQgYSBoYW5kZnVsIG9mCmV4YW1wbGUg
dGVzdHMsIGFuZCBpdCBpcyBsZXNzIGxpa2VseSB0byByZXN1bHQgaW4gYW55IGlzc3VlcyBmb3Ig
djUuNSwKc28gdGhhdCdzIHByb2JhYmx5IGJldHRlci4gKEkgdGhpbmsgdGhhdCBpcyB3aGF0IHlv
dSBhcmUgaGludGluZyBhdApoZXJlLiA7LSkgKQoKSGV5IFRlZCwgZG8geW91IGtub3cgaWYgdGhh
dCBleHQ0IHRpbWVzdGFtcCB0ZXN0IGNhbiBnbyBpbiB0aHJvdWdoCmxpbnV4LWtzZWxmdGVzdD8g
SXQgc2VlbWVkIGZhaXJseSBzZWxmLWNvbnRhaW5lZC4gT3IgaXMgdGhhdCB3aGF0IHlvdQp3ZXJl
IHNheWluZyB3b3VsZG4ndCB3b3JrIGZvciB5b3U/Cgo+IExldCdzIGZvY3VzIG9uIHRoZSBuZXh0
IGZldyB3ZWVrcyBmaXJzdCBzbyB3ZSBjYW4gZ2V0IHRoaXMgaW50byBtYWlubGluZQo+IGluIDUu
NS4KCkkgYWdyZWUuIFRoYXQgaXMgdGhlIG1vc3QgaW1wb3J0YW50IHRoaW5nLgoKPiBUaGUgdHdv
IG9mIHVzIGNhbiBjaGF0IG5leHQgd2VlayBhbmQgY29tZSB1cCB3aXRoIGEgcGxhbi4KClN1cmUu
CgpDaGVlcnMhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
