Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C42524BF
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:30:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A013E6E09C;
	Tue, 25 Jun 2019 07:28:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 70D0489D9A;
 Mon, 24 Jun 2019 17:51:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25DB8360;
 Mon, 24 Jun 2019 10:51:28 -0700 (PDT)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.196.78])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 606C33F718; Mon, 24 Jun 2019 10:51:23 -0700 (PDT)
Date: Mon, 24 Jun 2019 18:51:21 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v18 08/15] userfaultfd: untag user pointers
Message-ID: <20190624175120.GN29120@arrakis.emea.arm.com>
References: <cover.1561386715.git.andreyknvl@google.com>
 <d8e3b9a819e98d6527e506027b173b128a148d3c.1561386715.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d8e3b9a819e98d6527e506027b173b128a148d3c.1561386715.git.andreyknvl@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 25 Jun 2019 07:27:07 +0000
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
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, linux-kernel@vger.kernel.org,
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

T24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgMDQ6MzI6NTNQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBUaGlzIHBhdGNoIGlzIGEgcGFydCBvZiBhIHNlcmllcyB0aGF0IGV4dGVuZHMg
a2VybmVsIEFCSSB0byBhbGxvdyB0byBwYXNzCj4gdGFnZ2VkIHVzZXIgcG9pbnRlcnMgKHdpdGgg
dGhlIHRvcCBieXRlIHNldCB0byBzb21ldGhpbmcgZWxzZSBvdGhlciB0aGFuCj4gMHgwMCkgYXMg
c3lzY2FsbCBhcmd1bWVudHMuCj4gCj4gdXNlcmZhdWx0ZmQgY29kZSB1c2UgcHJvdmlkZWQgdXNl
ciBwb2ludGVycyBmb3Igdm1hIGxvb2t1cHMsIHdoaWNoIGNhbgo+IG9ubHkgYnkgZG9uZSB3aXRo
IHVudGFnZ2VkIHBvaW50ZXJzLgo+IAo+IFVudGFnIHVzZXIgcG9pbnRlcnMgaW4gdmFsaWRhdGVf
cmFuZ2UoKS4KPiAKPiBSZXZpZXdlZC1ieTogVmluY2Vuem8gRnJhc2Npbm8gPHZpbmNlbnpvLmZy
YXNjaW5vQGFybS5jb20+Cj4gUmV2aWV3ZWQtYnk6IENhdGFsaW4gTWFyaW5hcyA8Y2F0YWxpbi5t
YXJpbmFzQGFybS5jb20+Cj4gUmV2aWV3ZWQtYnk6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21p
dW0ub3JnPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBLb25vdmFsb3YgPGFuZHJleWtudmxAZ29v
Z2xlLmNvbT4KPiAtLS0KPiAgZnMvdXNlcmZhdWx0ZmQuYyB8IDIyICsrKysrKysrKysrKy0tLS0t
LS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygt
KQoKU2FtZSBoZXJlLCBpdCBuZWVkcyBhbiBhY2sgZnJvbSBBbCBWaXJvLgoKPiBkaWZmIC0tZ2l0
IGEvZnMvdXNlcmZhdWx0ZmQuYyBiL2ZzL3VzZXJmYXVsdGZkLmMKPiBpbmRleCBhZTBiOGI1ZjY5
ZTYuLmMyYmUzNmExNjhjYSAxMDA2NDQKPiAtLS0gYS9mcy91c2VyZmF1bHRmZC5jCj4gKysrIGIv
ZnMvdXNlcmZhdWx0ZmQuYwo+IEBAIC0xMjYxLDIxICsxMjYxLDIzIEBAIHN0YXRpYyBfX2Fsd2F5
c19pbmxpbmUgdm9pZCB3YWtlX3VzZXJmYXVsdChzdHJ1Y3QgdXNlcmZhdWx0ZmRfY3R4ICpjdHgs
Cj4gIH0KPiAgCj4gIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgaW50IHZhbGlkYXRlX3JhbmdlKHN0
cnVjdCBtbV9zdHJ1Y3QgKm1tLAo+IC0JCQkJCSAgX191NjQgc3RhcnQsIF9fdTY0IGxlbikKPiAr
CQkJCQkgIF9fdTY0ICpzdGFydCwgX191NjQgbGVuKQo+ICB7Cj4gIAlfX3U2NCB0YXNrX3NpemUg
PSBtbS0+dGFza19zaXplOwo+ICAKPiAtCWlmIChzdGFydCAmIH5QQUdFX01BU0spCj4gKwkqc3Rh
cnQgPSB1bnRhZ2dlZF9hZGRyKCpzdGFydCk7Cj4gKwo+ICsJaWYgKCpzdGFydCAmIH5QQUdFX01B
U0spCj4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4gIAlpZiAobGVuICYgflBBR0VfTUFTSykKPiAgCQly
ZXR1cm4gLUVJTlZBTDsKPiAgCWlmICghbGVuKQo+ICAJCXJldHVybiAtRUlOVkFMOwo+IC0JaWYg
KHN0YXJ0IDwgbW1hcF9taW5fYWRkcikKPiArCWlmICgqc3RhcnQgPCBtbWFwX21pbl9hZGRyKQo+
ICAJCXJldHVybiAtRUlOVkFMOwo+IC0JaWYgKHN0YXJ0ID49IHRhc2tfc2l6ZSkKPiArCWlmICgq
c3RhcnQgPj0gdGFza19zaXplKQo+ICAJCXJldHVybiAtRUlOVkFMOwo+IC0JaWYgKGxlbiA+IHRh
c2tfc2l6ZSAtIHN0YXJ0KQo+ICsJaWYgKGxlbiA+IHRhc2tfc2l6ZSAtICpzdGFydCkKPiAgCQly
ZXR1cm4gLUVJTlZBTDsKPiAgCXJldHVybiAwOwo+ICB9Cj4gQEAgLTEzMjUsNyArMTMyNyw3IEBA
IHN0YXRpYyBpbnQgdXNlcmZhdWx0ZmRfcmVnaXN0ZXIoc3RydWN0IHVzZXJmYXVsdGZkX2N0eCAq
Y3R4LAo+ICAJCWdvdG8gb3V0Owo+ICAJfQo+ICAKPiAtCXJldCA9IHZhbGlkYXRlX3JhbmdlKG1t
LCB1ZmZkaW9fcmVnaXN0ZXIucmFuZ2Uuc3RhcnQsCj4gKwlyZXQgPSB2YWxpZGF0ZV9yYW5nZSht
bSwgJnVmZmRpb19yZWdpc3Rlci5yYW5nZS5zdGFydCwKPiAgCQkJICAgICB1ZmZkaW9fcmVnaXN0
ZXIucmFuZ2UubGVuKTsKPiAgCWlmIChyZXQpCj4gIAkJZ290byBvdXQ7Cj4gQEAgLTE1MTQsNyAr
MTUxNiw3IEBAIHN0YXRpYyBpbnQgdXNlcmZhdWx0ZmRfdW5yZWdpc3RlcihzdHJ1Y3QgdXNlcmZh
dWx0ZmRfY3R4ICpjdHgsCj4gIAlpZiAoY29weV9mcm9tX3VzZXIoJnVmZmRpb191bnJlZ2lzdGVy
LCBidWYsIHNpemVvZih1ZmZkaW9fdW5yZWdpc3RlcikpKQo+ICAJCWdvdG8gb3V0Owo+ICAKPiAt
CXJldCA9IHZhbGlkYXRlX3JhbmdlKG1tLCB1ZmZkaW9fdW5yZWdpc3Rlci5zdGFydCwKPiArCXJl
dCA9IHZhbGlkYXRlX3JhbmdlKG1tLCAmdWZmZGlvX3VucmVnaXN0ZXIuc3RhcnQsCj4gIAkJCSAg
ICAgdWZmZGlvX3VucmVnaXN0ZXIubGVuKTsKPiAgCWlmIChyZXQpCj4gIAkJZ290byBvdXQ7Cj4g
QEAgLTE2NjUsNyArMTY2Nyw3IEBAIHN0YXRpYyBpbnQgdXNlcmZhdWx0ZmRfd2FrZShzdHJ1Y3Qg
dXNlcmZhdWx0ZmRfY3R4ICpjdHgsCj4gIAlpZiAoY29weV9mcm9tX3VzZXIoJnVmZmRpb193YWtl
LCBidWYsIHNpemVvZih1ZmZkaW9fd2FrZSkpKQo+ICAJCWdvdG8gb3V0Owo+ICAKPiAtCXJldCA9
IHZhbGlkYXRlX3JhbmdlKGN0eC0+bW0sIHVmZmRpb193YWtlLnN0YXJ0LCB1ZmZkaW9fd2FrZS5s
ZW4pOwo+ICsJcmV0ID0gdmFsaWRhdGVfcmFuZ2UoY3R4LT5tbSwgJnVmZmRpb193YWtlLnN0YXJ0
LCB1ZmZkaW9fd2FrZS5sZW4pOwo+ICAJaWYgKHJldCkKPiAgCQlnb3RvIG91dDsKPiAgCj4gQEAg
LTE3MDUsNyArMTcwNyw3IEBAIHN0YXRpYyBpbnQgdXNlcmZhdWx0ZmRfY29weShzdHJ1Y3QgdXNl
cmZhdWx0ZmRfY3R4ICpjdHgsCj4gIAkJCSAgIHNpemVvZih1ZmZkaW9fY29weSktc2l6ZW9mKF9f
czY0KSkpCj4gIAkJZ290byBvdXQ7Cj4gIAo+IC0JcmV0ID0gdmFsaWRhdGVfcmFuZ2UoY3R4LT5t
bSwgdWZmZGlvX2NvcHkuZHN0LCB1ZmZkaW9fY29weS5sZW4pOwo+ICsJcmV0ID0gdmFsaWRhdGVf
cmFuZ2UoY3R4LT5tbSwgJnVmZmRpb19jb3B5LmRzdCwgdWZmZGlvX2NvcHkubGVuKTsKPiAgCWlm
IChyZXQpCj4gIAkJZ290byBvdXQ7Cj4gIAkvKgo+IEBAIC0xNzYxLDcgKzE3NjMsNyBAQCBzdGF0
aWMgaW50IHVzZXJmYXVsdGZkX3plcm9wYWdlKHN0cnVjdCB1c2VyZmF1bHRmZF9jdHggKmN0eCwK
PiAgCQkJICAgc2l6ZW9mKHVmZmRpb196ZXJvcGFnZSktc2l6ZW9mKF9fczY0KSkpCj4gIAkJZ290
byBvdXQ7Cj4gIAo+IC0JcmV0ID0gdmFsaWRhdGVfcmFuZ2UoY3R4LT5tbSwgdWZmZGlvX3plcm9w
YWdlLnJhbmdlLnN0YXJ0LAo+ICsJcmV0ID0gdmFsaWRhdGVfcmFuZ2UoY3R4LT5tbSwgJnVmZmRp
b196ZXJvcGFnZS5yYW5nZS5zdGFydCwKPiAgCQkJICAgICB1ZmZkaW9femVyb3BhZ2UucmFuZ2Uu
bGVuKTsKPiAgCWlmIChyZXQpCj4gIAkJZ290byBvdXQ7Cj4gLS0gCj4gMi4yMi4wLjQxMC5nZDhm
ZGJlMjFiNS1nb29nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
