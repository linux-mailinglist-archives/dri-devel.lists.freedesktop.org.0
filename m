Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 367504B2C2
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 09:11:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D19F66E2AC;
	Wed, 19 Jun 2019 07:11:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4EBC289FA0;
 Tue, 18 Jun 2019 09:18:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D19DC344;
 Tue, 18 Jun 2019 02:18:18 -0700 (PDT)
Received: from e103592.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2BBBB3F246;
 Tue, 18 Jun 2019 02:18:14 -0700 (PDT)
Date: Tue, 18 Jun 2019 10:18:12 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v17 03/15] arm64: Introduce prctl() options to control
 the tagged user addresses ABI
Message-ID: <20190618091811.GC2790@e103592.cambridge.arm.com>
References: <cover.1560339705.git.andreyknvl@google.com>
 <a7a2933bea5fe57e504891b7eec7e9432e5e1c1a.1560339705.git.andreyknvl@google.com>
 <20190613110235.GW28398@e103592.cambridge.arm.com>
 <20190613152632.GT28951@C02TF0J2HF1T.local>
 <201906132209.FC65A3C771@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <201906132209.FC65A3C771@keescook>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Mailman-Approved-At: Wed, 19 Jun 2019 07:10:14 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, Kostya Serebryany <kcc@google.com>,
 Khalid Aziz <khalid.aziz@oracle.com>, linux-kselftest@vger.kernel.org,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-arm-kernel@lists.infradead.org,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Yishai Hadas <yishaih@mellanox.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMTA6MTM6NTRQTSAtMDcwMCwgS2VlcyBDb29rIHdyb3Rl
Ogo+IE9uIFRodSwgSnVuIDEzLCAyMDE5IGF0IDA0OjI2OjMyUE0gKzAxMDAsIENhdGFsaW4gTWFy
aW5hcyB3cm90ZToKPiA+IE9uIFRodSwgSnVuIDEzLCAyMDE5IGF0IDEyOjAyOjM1UE0gKzAxMDAs
IERhdmUgUCBNYXJ0aW4gd3JvdGU6Cj4gPiA+IE9uIFdlZCwgSnVuIDEyLCAyMDE5IGF0IDAxOjQz
OjIwUE0gKzAyMDAsIEFuZHJleSBLb25vdmFsb3Ygd3JvdGU6Cj4gPiA+ID4gK3N0YXRpYyBpbnQg
emVybzsKPiA+ID4gPiArc3RhdGljIGludCBvbmUgPSAxOwo+ID4gPiAKPiA+ID4gISEhCj4gPiA+
IAo+ID4gPiBBbmQgdGhlc2UgY2FuJ3QgZXZlbiBiZSBjb25zdCB3aXRob3V0IGEgY2FzdC4gIFl1
ay4KPiA+ID4gCj4gPiA+IChOb3QgeW91ciBmYXVsdCB0aG91Z2gsIGJ1dCBpdCB3b3VsZCBiZSBu
aWNlIHRvIGhhdmUgYSBwcm9jX2RvYm9vbCgpIHRvCj4gPiA+IGF2b2lkIHRoaXMuKQo+ID4gCj4g
PiBJIGhhZCB0aGUgc2FtZSByZWFjdGlvbi4gTWF5YmUgZm9yIGFub3RoZXIgcGF0Y2ggc2FuaXRp
c2luZyB0aGlzIHBhdHRlcm4KPiA+IGFjcm9zcyB0aGUga2VybmVsLgo+IAo+IFRoYXQncyBhY3R1
YWxseSBhbHJlYWR5IGhhcHBlbmluZyAodmlhIC1tbSB0cmVlIGxhc3QgSSBsb29rZWQpLiB0bDtk
cjoKPiBpdCBlbmRzIHVwIHVzaW5nIGEgY2FzdCBoaWRkZW4gaW4gYSBtYWNyby4gSXQncyBpbiBs
aW51eC1uZXh0IGFscmVhZHkKPiBhbG9uZyB3aXRoIGEgY2hlY2twYXRjaC5wbCBhZGRpdGlvbiB0
byB5ZWxsIGFib3V0IGRvaW5nIHdoYXQncyBiZWluZwo+IGRvbmUgaGVyZS4gOykKPiAKPiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMTkwNDMwMTgwMTExLjEwNjg4LTEtbWNyb2NlQHJl
ZGhhdC5jb20vI3IKCkhtbW0sIHRoYXQgaXMgbWFyZ2luYWxseSBsZXNzIGJhZC4KCklkZWFsbHkg
d2UnZCBoYXZlIGEgdW5pb24gaW4gdGhlcmUsIG5vdCBqdXN0IGEgYnVuY2ggb2Ygdm9pZCAqLiAg
SSBtYXkKbG9vayBhdCB0aGF0IHNvbWVkYXkuLi4KCkNoZWVycwotLS1EYXZlCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
