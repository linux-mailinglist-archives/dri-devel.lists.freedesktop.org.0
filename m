Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CCD455AE
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:22:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E10E894E7;
	Fri, 14 Jun 2019 07:21:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1DC7689B3B;
 Thu, 13 Jun 2019 15:35:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF6F23EF;
 Thu, 13 Jun 2019 08:35:29 -0700 (PDT)
Received: from C02TF0J2HF1T.local (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE4553F718;
 Thu, 13 Jun 2019 08:35:11 -0700 (PDT)
Date: Thu, 13 Jun 2019 16:35:07 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Dave Martin <Dave.Martin@arm.com>
Subject: Re: [PATCH v17 03/15] arm64: Introduce prctl() options to control
 the tagged user addresses ABI
Message-ID: <20190613153505.GU28951@C02TF0J2HF1T.local>
References: <cover.1560339705.git.andreyknvl@google.com>
 <a7a2933bea5fe57e504891b7eec7e9432e5e1c1a.1560339705.git.andreyknvl@google.com>
 <20190613111659.GX28398@e103592.cambridge.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613111659.GX28398@e103592.cambridge.arm.com>
User-Agent: Mutt/1.11.2 (2019-01-07)
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
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
 Christian Koenig <Christian.Koenig@amd.com>,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, Kostya Serebryany <kcc@google.com>,
 Khalid Aziz <khalid.aziz@oracle.com>, Lee Smith <Lee.Smith@arm.com>,
 linux-kselftest@vger.kernel.org, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dmitry Vyukov <dvyukov@google.com>, Evgeniy Stepanov <eugenis@google.com>,
 linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>, Yishai Hadas <yishaih@mellanox.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMTI6MTY6NTlQTSArMDEwMCwgRGF2ZSBQIE1hcnRpbiB3
cm90ZToKPiBPbiBXZWQsIEp1biAxMiwgMjAxOSBhdCAwMTo0MzoyMFBNICswMjAwLCBBbmRyZXkg
S29ub3ZhbG92IHdyb3RlOgo+ID4gRnJvbTogQ2F0YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1hcmlu
YXNAYXJtLmNvbT4KPiA+IAo+ID4gSXQgaXMgbm90IGRlc2lyYWJsZSB0byByZWxheCB0aGUgQUJJ
IHRvIGFsbG93IHRhZ2dlZCB1c2VyIGFkZHJlc3NlcyBpbnRvCj4gPiB0aGUga2VybmVsIGluZGlz
Y3JpbWluYXRlbHkuIFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBhIHByY3RsKCkgaW50ZXJmYWNlCj4g
PiBmb3IgZW5hYmxpbmcgb3IgZGlzYWJsaW5nIHRoZSB0YWdnZWQgQUJJIHdpdGggYSBnbG9iYWwg
c3lzY3RsIGNvbnRyb2wKPiA+IGZvciBwcmV2ZW50aW5nIGFwcGxpY2F0aW9ucyBmcm9tIGVuYWJs
aW5nIHRoZSByZWxheGVkIEFCSSAobWVhbnQgZm9yCj4gPiB0ZXN0aW5nIHVzZXItc3BhY2UgcHJj
dGwoKSByZXR1cm4gZXJyb3IgY2hlY2tpbmcgd2l0aG91dCByZWNvbmZpZ3VyaW5nCj4gPiB0aGUg
a2VybmVsKS4gVGhlIEFCSSBwcm9wZXJ0aWVzIGFyZSBpbmhlcml0ZWQgYnkgdGhyZWFkcyBvZiB0
aGUgc2FtZQo+ID4gYXBwbGljYXRpb24gYW5kIGZvcmsoKSdlZCBjaGlsZHJlbiBidXQgY2xlYXJl
ZCBvbiBleGVjdmUoKS4KPiA+IAo+ID4gVGhlIFBSX1NFVF9UQUdHRURfQUREUl9DVFJMIHdpbGwg
YmUgZXhwYW5kZWQgaW4gdGhlIGZ1dHVyZSB0byBoYW5kbGUKPiA+IE1URS1zcGVjaWZpYyBzZXR0
aW5ncyBsaWtlIGltcHJlY2lzZSB2cyBwcmVjaXNlIGV4Y2VwdGlvbnMuCj4gPiAKPiA+IFNpZ25l
ZC1vZmYtYnk6IENhdGFsaW4gTWFyaW5hcyA8Y2F0YWxpbi5tYXJpbmFzQGFybS5jb20+Cj4gPiAt
LS0KPiA+ICBhcmNoL2FybTY0L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oICAgfCAgNiArKysKPiA+
ICBhcmNoL2FybTY0L2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmggfCAgMSArCj4gPiAgYXJjaC9h
cm02NC9pbmNsdWRlL2FzbS91YWNjZXNzLmggICAgIHwgIDMgKy0KPiA+ICBhcmNoL2FybTY0L2tl
cm5lbC9wcm9jZXNzLmMgICAgICAgICAgfCA2NyArKysrKysrKysrKysrKysrKysrKysrKysrKysr
Cj4gPiAgaW5jbHVkZS91YXBpL2xpbnV4L3ByY3RsLmggICAgICAgICAgIHwgIDUgKysrCj4gPiAg
a2VybmVsL3N5cy5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTYgKysrKysrKwo+ID4gIDYg
ZmlsZXMgY2hhbmdlZCwgOTcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4gCj4gPiBk
aWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaCBiL2FyY2gvYXJt
NjQvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmgKPiA+IGluZGV4IGZjZDBlNjkxYjFlYS4uZmVlNDU3
NDU2YWE4IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9wcm9jZXNzb3Iu
aAo+ID4gKysrIGIvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaAo+ID4gQEAgLTMw
Nyw2ICszMDcsMTIgQEAgZXh0ZXJuIHZvaWQgX19pbml0IG1pbnNpZ3N0a3N6X3NldHVwKHZvaWQp
Owo+ID4gIC8qIFBSX1BBQ19SRVNFVF9LRVlTIHByY3RsICovCj4gPiAgI2RlZmluZSBQQUNfUkVT
RVRfS0VZUyh0c2ssIGFyZykJcHRyYXV0aF9wcmN0bF9yZXNldF9rZXlzKHRzaywgYXJnKQo+ID4g
IAo+ID4gKy8qIFBSX1RBR0dFRF9BRERSIHByY3RsICovCj4gCj4gKEEgY291cGxlIG9mIGNvbW1l
bnRzIEkgbWlzc2VkIGluIG15IGxhc3QgcmVwbHk6KQo+IAo+IE5hbWUgbWlzbWF0Y2g/CgpZZWFo
LCBpdCB3ZW50IHRocm91Z2ggc2V2ZXJhbCBuYW1lcyBidXQgaXQgc2VlbXMgdGhhdCBJIGRpZG4n
dCB1cGRhdGUKYWxsIHBsYWNlcy4KCj4gPiArbG9uZyBzZXRfdGFnZ2VkX2FkZHJfY3RybCh1bnNp
Z25lZCBsb25nIGFyZyk7Cj4gPiArbG9uZyBnZXRfdGFnZ2VkX2FkZHJfY3RybCh2b2lkKTsKPiA+
ICsjZGVmaW5lIFNFVF9UQUdHRURfQUREUl9DVFJMKGFyZykJc2V0X3RhZ2dlZF9hZGRyX2N0cmwo
YXJnKQo+ID4gKyNkZWZpbmUgR0VUX1RBR0dFRF9BRERSX0NUUkwoKQkJZ2V0X3RhZ2dlZF9hZGRy
X2N0cmwoKQo+ID4gKwo+IAo+IFsuLi5dCj4gCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9r
ZXJuZWwvcHJvY2Vzcy5jIGIvYXJjaC9hcm02NC9rZXJuZWwvcHJvY2Vzcy5jCj4gPiBpbmRleCAz
NzY3ZmIyMWE1YjguLjY5ZDBiZTFmYzcwOCAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvYXJtNjQva2Vy
bmVsL3Byb2Nlc3MuYwo+ID4gKysrIGIvYXJjaC9hcm02NC9rZXJuZWwvcHJvY2Vzcy5jCj4gPiBA
QCAtMzAsNiArMzAsNyBAQAo+ID4gICNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KPiA+ICAjaW5j
bHVkZSA8bGludXgvbW0uaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvc3RkZGVmLmg+Cj4gPiArI2lu
Y2x1ZGUgPGxpbnV4L3N5c2N0bC5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC91bmlzdGQuaD4KPiA+
ICAjaW5jbHVkZSA8bGludXgvdXNlci5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC9kZWxheS5oPgo+
ID4gQEAgLTMyMyw2ICszMjQsNyBAQCB2b2lkIGZsdXNoX3RocmVhZCh2b2lkKQo+ID4gIAlmcHNp
bWRfZmx1c2hfdGhyZWFkKCk7Cj4gPiAgCXRsc190aHJlYWRfZmx1c2goKTsKPiA+ICAJZmx1c2hf
cHRyYWNlX2h3X2JyZWFrcG9pbnQoY3VycmVudCk7Cj4gPiArCWNsZWFyX3RocmVhZF9mbGFnKFRJ
Rl9UQUdHRURfQUREUik7Cj4gPiAgfQo+ID4gIAo+ID4gIHZvaWQgcmVsZWFzZV90aHJlYWQoc3Ry
dWN0IHRhc2tfc3RydWN0ICpkZWFkX3Rhc2spCj4gPiBAQCAtNTUyLDMgKzU1NCw2OCBAQCB2b2lk
IGFyY2hfc2V0dXBfbmV3X2V4ZWModm9pZCkKPiA+ICAKPiA+ICAJcHRyYXV0aF90aHJlYWRfaW5p
dF91c2VyKGN1cnJlbnQpOwo+ID4gIH0KPiA+ICsKPiA+ICsvKgo+ID4gKyAqIENvbnRyb2wgdGhl
IHJlbGF4ZWQgQUJJIGFsbG93aW5nIHRhZ2dlZCB1c2VyIGFkZHJlc3NlcyBpbnRvIHRoZSBrZXJu
ZWwuCj4gPiArICovCj4gPiArc3RhdGljIHVuc2lnbmVkIGludCB0YWdnZWRfYWRkcl9wcmN0bF9h
bGxvd2VkID0gMTsKPiA+ICsKPiA+ICtsb25nIHNldF90YWdnZWRfYWRkcl9jdHJsKHVuc2lnbmVk
IGxvbmcgYXJnKQo+ID4gK3sKPiA+ICsJaWYgKCF0YWdnZWRfYWRkcl9wcmN0bF9hbGxvd2VkKQo+
ID4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4gCj4gU28sIHRhZ2dpbmcgY2FuIGFjdHVhbGx5IGJlIGxv
Y2tlZCBvbiBieSBoYXZpbmcgYSBwcm9jZXNzIGVuYWJsZSBpdCBhbmQKPiB0aGVuIHNvbWUgcG9z
c2libHkgdW5yZWxhdGVkIHByb2Nlc3MgY2xlYXJpbmcgdGFnZ2VkX2FkZHJfcHJjdGxfYWxsb3dl
ZC4KPiBUaGF0IGZlZWxzIGEgYml0IHdlaXJkLgoKVGhlIHByb2JsZW0gaXMgdGhhdCBpZiB5b3Ug
ZGlzYWJsZSB0aGUgQUJJIGdsb2JhbGx5LCBsb3RzIG9mCmFwcGxpY2F0aW9ucyB3b3VsZCBjcmFz
aC4gVGhpcyBzeXNjdGwgaXMgbWVhbnQgYXMgYSB3YXkgdG8gZGlzYWJsZSB0aGUKb3B0LWluIHRv
IHRoZSBUQkkgQUJJLiBBbm90aGVyIG9wdGlvbiB3b3VsZCBiZSBhIGtlcm5lbCBjb21tYW5kIGxp
bmUKb3B0aW9uIChJJ20gbm90IGtlZW4gb24gYSBLY29uZmlnIG9wdGlvbikuCgo+IERvIHdlIHdh
bnQgdG8gYWxsb3cgYSBwcm9jZXNzIHRoYXQgaGFzIHRhZ2dpbmcgb24gdG8gYmUgYWJsZSB0byB0
dXJuCj4gaXQgb2ZmIGF0IGFsbD8gIFBvc3NpYmx5IHRoaW5ncyBsaWtlIENSSVUgbWlnaHQgd2Fu
dCB0byBkbyB0aGF0LgoKSSBsZWZ0IGl0IGluIGZvciBzeW1tZXRyeSBidXQgSSBkb24ndCBleHBl
Y3QgaXQgdG8gYmUgdXNlZC4gQSBwb3RlbnRpYWwKdXNlLWNhc2UgaXMgZG9pbmcgaXQgcGVyIHN1
YnNlcXVlbnQgdGhyZWFkcyBpbiBhbiBhcHBsaWNhdGlvbi4KCj4gPiArCWlmIChpc19jb21wYXRf
dGFzaygpKQo+ID4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4gPiArCWlmIChhcmcgJiB+UFJfVEFHR0VE
X0FERFJfRU5BQkxFKQo+ID4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4gCj4gSG93IGRvIHdlIGV4cGVj
dCB0aGlzIGFyZ3VtZW50IHRvIGJlIGV4dGVuZGVkIGluIHRoZSBmdXR1cmU/CgpZZXMsIGZvciBN
VEUuIFRoYXQncyB3aHkgSSB3b3VsZG4ndCBhbGxvdyByYW5kb20gYml0cyBoZXJlLgoKPiBJJ20g
d29uZGVyaW5nIHdoZXRoZXIgdGhpcyBpcyByZWFsbHkgYSBiaXRtYXNrIG9yIGFuIGVudW0sIG9y
IGEgbWl4dHVyZQo+IG9mIHRoZSB0d28uICBNYXliZSBpdCBkb2Vzbid0IG1hdHRlci4KClVzZXIg
bWF5IHdhbnQgdG8gc2V0IFBSX1RBR0dFRF9BRERSX0VOQUJMRSB8IFBSX01URV9QUkVDSVNFIGlu
IGEgc2luZ2xlCmNhbGwuCgo+ID4gKwlpZiAoYXJnICYgUFJfVEFHR0VEX0FERFJfRU5BQkxFKQo+
ID4gKwkJc2V0X3RocmVhZF9mbGFnKFRJRl9UQUdHRURfQUREUik7Cj4gPiArCWVsc2UKPiA+ICsJ
CWNsZWFyX3RocmVhZF9mbGFnKFRJRl9UQUdHRURfQUREUik7Cj4gCj4gSSB0aGluayB1cGRhdGVf
dGhyZWFkX2ZsYWcoKSBjb3VsZCBiZSB1c2VkIGhlcmUuCgpZZXMuIEkgZm9yZ290IHlvdSBhZGRl
ZCB0aGlzLgoKLS0gCkNhdGFsaW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
