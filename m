Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D22E873A8
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 10:01:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406AC6ED0F;
	Fri,  9 Aug 2019 08:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ADEF6E8B9;
 Thu,  8 Aug 2019 20:22:05 +0000 (UTC)
Received: from p200300ddd71876597e7a91fffec98e25.dip0.t-ipconnect.de
 ([2003:dd:d718:7659:7e7a:91ff:fec9:8e25])
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1hvov8-0007ZB-GX; Thu, 08 Aug 2019 22:21:58 +0200
Date: Thu, 8 Aug 2019 22:21:52 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] drm/i915: Remove redundant user_access_end() from
 __copy_from_user() error path
In-Reply-To: <CAKwvOd=wa-XPCpoLQoQJH8Me7S=fXLfog0XsiKyFZKu8ojW_UQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.1908082221150.2882@nanos.tec.linutronix.de>
References: <51a4155c5bc2ca847a9cbe85c1c11918bb193141.1564086017.git.jpoimboe@redhat.com>
 <alpine.DEB.2.21.1907252355150.1791@nanos.tec.linutronix.de>
 <156416793450.30723.5556760526480191131@skylake-alporthouse-com>
 <alpine.DEB.2.21.1907262116530.1791@nanos.tec.linutronix.de>
 <156416944205.21451.12269136304831943624@skylake-alporthouse-com>
 <CA+icZUXwBFS-6e+Qp4e3PhnRzEHvwdzWtS6OfVsgy85R5YNGOg@mail.gmail.com>
 <CA+icZUWA6e0Zsio6sthRUC=Ehb2-mw_9U76UnvwGc_tOnOqt7w@mail.gmail.com>
 <20190806125931.oqeqateyzqikusku@treble>
 <CAKwvOd=wa-XPCpoLQoQJH8Me7S=fXLfog0XsiKyFZKu8ojW_UQ@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
X-Mailman-Approved-At: Fri, 09 Aug 2019 08:00:16 +0000
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
Cc: Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
 intel-gfx@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Sedat Dilek <sedat.dilek@gmail.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCA4IEF1ZyAyMDE5LCBOaWNrIERlc2F1bG5pZXJzIHdyb3RlOgo+IE9uIFR1ZSwgQXVn
IDYsIDIwMTkgYXQgNTo1OSBBTSBKb3NoIFBvaW1ib2V1ZiA8anBvaW1ib2VAcmVkaGF0LmNvbT4g
d3JvdGU6Cj4gPiA+IEdlbnRsZSBwaW5nLi4uCj4gPiA+IFRob21hcyBhbmQgQ2hyaXM6IFdpbGwg
c29tZW9uZSBvZiB5b3UgcGljayB0aGlzIHVwPwo+ID4gPiBBcyAib2JqdG9vbDogSW1wcm92ZSBV
QUNDRVNTIGNvdmVyYWdlIiBbMV0gd2VudCB0cm91Z2ggdGlwIHRyZWUgSQo+ID4gPiBoaWdobHkg
YXBwcmVjaWF0ZSB0byBkbyBzbyB3aXRoIHRoaXMgb25lLgo+ID4KPiA+IEkgdGhpbmsgVGhvbWFz
IGhhcyBnb25lIG9uIGhvbGlkYXksIHNvIGhvcGVmdWxseSBDaHJpcyBjYW4gcGljayBpdCB1cAo+
ID4gYWZ0ZXIgYWxsLgo+IAo+IHRnbHgganVzdCBwaWNrZWQgdXAgMiBvdGhlciBwYXRjaGVzIG9m
IG1pbmUsIGJ1bXBpbmcganVzdCBpbiBjYXNlIGhlJ3MKPiBub3QgcGlja2luZyB1cCBwYXRjaGVz
IHdoaWxlIG9uIHZhY2F0aW9uLiA7KQoKSSdtIG9ubHkgaGFsZiBvbiB2YWNhdGlvbiA6KQoKU28g
SSBjYW4gcGljayBpdCB1cC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
