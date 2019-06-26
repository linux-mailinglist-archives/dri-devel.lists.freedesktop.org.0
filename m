Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 081B257CDF
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 09:12:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 940B96E7D8;
	Thu, 27 Jun 2019 07:11:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A98056E4A6;
 Wed, 26 Jun 2019 17:18:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3BC85360;
 Wed, 26 Jun 2019 10:18:26 -0700 (PDT)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.196.78])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 876353F718; Wed, 26 Jun 2019 10:18:21 -0700 (PDT)
Date: Wed, 26 Jun 2019 18:18:19 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v18 00/15] arm64: untag user pointers passed to the kernel
Message-ID: <20190626171819.GG29672@arrakis.emea.arm.com>
References: <cover.1561386715.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1561386715.git.andreyknvl@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Thu, 27 Jun 2019 07:11:26 +0000
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
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Khalid Aziz <khalid.aziz@oracle.com>, linux-kselftest@vger.kernel.org,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kevin Brodsky <kevin.brodsky@arm.com>, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, linux-kernel@vger.kernel.org,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQW5kcmV3LAoKT24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgMDQ6MzI6NDVQTSArMDIwMCwgQW5k
cmV5IEtvbm92YWxvdiB3cm90ZToKPiBBbmRyZXkgS29ub3ZhbG92ICgxNCk6Cj4gICBhcm02NDog
dW50YWcgdXNlciBwb2ludGVycyBpbiBhY2Nlc3Nfb2sgYW5kIF9fdWFjY2Vzc19tYXNrX3B0cgo+
ICAgbGliOiB1bnRhZyB1c2VyIHBvaW50ZXJzIGluIHN0cm4qX3VzZXIKPiAgIG1tOiB1bnRhZyB1
c2VyIHBvaW50ZXJzIHBhc3NlZCB0byBtZW1vcnkgc3lzY2FsbHMKPiAgIG1tOiB1bnRhZyB1c2Vy
IHBvaW50ZXJzIGluIG1tL2d1cC5jCj4gICBtbTogdW50YWcgdXNlciBwb2ludGVycyBpbiBnZXRf
dmFkZHJfZnJhbWVzCj4gICBmcy9uYW1lc3BhY2U6IHVudGFnIHVzZXIgcG9pbnRlcnMgaW4gY29w
eV9tb3VudF9vcHRpb25zCj4gICB1c2VyZmF1bHRmZDogdW50YWcgdXNlciBwb2ludGVycwo+ICAg
ZHJtL2FtZGdwdTogdW50YWcgdXNlciBwb2ludGVycwo+ICAgZHJtL3JhZGVvbjogdW50YWcgdXNl
ciBwb2ludGVycyBpbiByYWRlb25fZ2VtX3VzZXJwdHJfaW9jdGwKPiAgIElCL21seDQ6IHVudGFn
IHVzZXIgcG9pbnRlcnMgaW4gbWx4NF9nZXRfdW1lbV9tcgo+ICAgbWVkaWEvdjRsMi1jb3JlOiB1
bnRhZyB1c2VyIHBvaW50ZXJzIGluIHZpZGVvYnVmX2RtYV9jb250aWdfdXNlcl9nZXQKPiAgIHRl
ZS9zaG06IHVudGFnIHVzZXIgcG9pbnRlcnMgaW4gdGVlX3NobV9yZWdpc3Rlcgo+ICAgdmZpby90
eXBlMTogdW50YWcgdXNlciBwb2ludGVycyBpbiB2YWRkcl9nZXRfcGZuCj4gICBzZWxmdGVzdHMs
IGFybTY0OiBhZGQgYSBzZWxmdGVzdCBmb3IgcGFzc2luZyB0YWdnZWQgcG9pbnRlcnMgdG8ga2Vy
bmVsCj4gCj4gQ2F0YWxpbiBNYXJpbmFzICgxKToKPiAgIGFybTY0OiBJbnRyb2R1Y2UgcHJjdGwo
KSBvcHRpb25zIHRvIGNvbnRyb2wgdGhlIHRhZ2dlZCB1c2VyIGFkZHJlc3Nlcwo+ICAgICBBQkkK
PiAKPiAgYXJjaC9hcm02NC9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDkg
KysrCj4gIGFyY2gvYXJtNjQvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmggICAgICAgICAgICB8ICA4
ICsrKwo+ICBhcmNoL2FybTY0L2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmggICAgICAgICAgfCAg
MSArCj4gIGFyY2gvYXJtNjQvaW5jbHVkZS9hc20vdWFjY2Vzcy5oICAgICAgICAgICAgICB8IDEy
ICsrKy0KPiAgYXJjaC9hcm02NC9rZXJuZWwvcHJvY2Vzcy5jICAgICAgICAgICAgICAgICAgIHwg
NzIgKysrKysrKysrKysrKysrKysrKwo+ICAuLi4vZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9h
bWRrZmRfZ3B1dm0uYyAgfCAgMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZ2VtLmMgICAgICAgfCAgMiArCj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2dl
bS5jICAgICAgICAgICB8ICAyICsKPiAgZHJpdmVycy9pbmZpbmliYW5kL2h3L21seDQvbXIuYyAg
ICAgICAgICAgICAgIHwgIDcgKy0KPiAgZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdmlkZW9idWYt
ZG1hLWNvbnRpZy5jIHwgIDkgKy0tCj4gIGRyaXZlcnMvdGVlL3RlZV9zaG0uYyAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAxICsKPiAgZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVfdHlwZTEuYyAg
ICAgICAgICAgICAgIHwgIDIgKwo+ICBmcy9uYW1lc3BhY2UuYyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgMiArLQo+ICBmcy91c2VyZmF1bHRmZC5jICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAyMiArKystLS0KPiAgaW5jbHVkZS91YXBpL2xpbnV4L3ByY3RsLmggICAg
ICAgICAgICAgICAgICAgIHwgIDUgKysKPiAga2VybmVsL3N5cy5jICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgMTIgKysrKwo+ICBsaWIvc3RybmNweV9mcm9tX3VzZXIuYyAgICAg
ICAgICAgICAgICAgICAgICAgfCAgMyArLQo+ICBsaWIvc3Rybmxlbl91c2VyLmMgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgMyArLQo+ICBtbS9mcmFtZV92ZWN0b3IuYyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgMiArCj4gIG1tL2d1cC5jICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICA0ICsrCj4gIG1tL21hZHZpc2UuYyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAyICsKPiAgbW0vbWVtcG9saWN5LmMgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDMgKwo+ICBtbS9taWdyYXRlLmMgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgMiArLQo+ICBtbS9taW5jb3JlLmMgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgMiArCj4gIG1tL21sb2NrLmMgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICA0ICsrCj4gIG1tL21wcm90ZWN0LmMgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAyICsKPiAgbW0vbXJlbWFwLmMgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDcgKysKPiAgbW0vbXN5bmMuYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDIgKwo+ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02NC8uZ2l0
aWdub3JlICAgICAgfCAgMSArCj4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2FybTY0L01ha2Vm
aWxlICAgICAgICB8IDExICsrKwo+ICAuLi4vdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvcnVuX3Rh
Z3NfdGVzdC5zaCAgfCAxMiArKysrCj4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2FybTY0L3Rh
Z3NfdGVzdC5jICAgICB8IDI5ICsrKysrKysrCj4gIDMyIGZpbGVzIGNoYW5nZWQsIDIzMiBpbnNl
cnRpb25zKCspLCAyNSBkZWxldGlvbnMoLSkKCkl0IGxvb2tzIGxpa2Ugd2UgZ290IHRvIGFuIGFn
cmVlbWVudCBvbiBob3cgdG8gZGVhbCB3aXRoIHRhZ2dlZCB1c2VyCmFkZHJlc3NlcyBiZXR3ZWVu
IFNQQVJDIEFESSBhbmQgQVJNIE1lbW9yeSBUYWdnaW5nLiBJZiB0aGVyZSBhcmUgbm8Kb3RoZXIg
b2JqZWN0aW9ucywgd2hhdCdzIHlvdXIgcHJlZmVycmVkIHdheSBvZiBnZXR0aW5nIHRoaXMgc2Vy
aWVzIGludG8KLW5leHQgZmlyc3QgYW5kIHRoZW4gbWFpbmxpbmU/IEFyZSB5b3Ugb2sgdG8gbWVy
Z2UgdGhlbSBpbnRvIHRoZSBtbQp0cmVlPwoKVGhhbmtzLgoKLS0gCkNhdGFsaW4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
