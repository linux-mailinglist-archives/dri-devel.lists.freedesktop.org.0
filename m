Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FBC45618
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:25:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB7789973;
	Fri, 14 Jun 2019 07:22:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C13D189919;
 Thu, 13 Jun 2019 11:17:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68C33367;
 Thu, 13 Jun 2019 04:17:06 -0700 (PDT)
Received: from e103592.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 11EDF3F694;
 Thu, 13 Jun 2019 04:18:44 -0700 (PDT)
Date: Thu, 13 Jun 2019 12:16:59 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v17 03/15] arm64: Introduce prctl() options to control
 the tagged user addresses ABI
Message-ID: <20190613111659.GX28398@e103592.cambridge.arm.com>
References: <cover.1560339705.git.andreyknvl@google.com>
 <a7a2933bea5fe57e504891b7eec7e9432e5e1c1a.1560339705.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a7a2933bea5fe57e504891b7eec7e9432e5e1c1a.1560339705.git.andreyknvl@google.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, Kostya Serebryany <kcc@google.com>,
 Khalid Aziz <khalid.aziz@oracle.com>, Lee Smith <Lee.Smith@arm.com>,
 linux-kselftest@vger.kernel.org, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dmitry Vyukov <dvyukov@google.com>, Evgeniy Stepanov <eugenis@google.com>,
 linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
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

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMDE6NDM6MjBQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBGcm9tOiBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4ubWFyaW5hc0Bhcm0uY29t
Pgo+IAo+IEl0IGlzIG5vdCBkZXNpcmFibGUgdG8gcmVsYXggdGhlIEFCSSB0byBhbGxvdyB0YWdn
ZWQgdXNlciBhZGRyZXNzZXMgaW50bwo+IHRoZSBrZXJuZWwgaW5kaXNjcmltaW5hdGVseS4gVGhp
cyBwYXRjaCBpbnRyb2R1Y2VzIGEgcHJjdGwoKSBpbnRlcmZhY2UKPiBmb3IgZW5hYmxpbmcgb3Ig
ZGlzYWJsaW5nIHRoZSB0YWdnZWQgQUJJIHdpdGggYSBnbG9iYWwgc3lzY3RsIGNvbnRyb2wKPiBm
b3IgcHJldmVudGluZyBhcHBsaWNhdGlvbnMgZnJvbSBlbmFibGluZyB0aGUgcmVsYXhlZCBBQkkg
KG1lYW50IGZvcgo+IHRlc3RpbmcgdXNlci1zcGFjZSBwcmN0bCgpIHJldHVybiBlcnJvciBjaGVj
a2luZyB3aXRob3V0IHJlY29uZmlndXJpbmcKPiB0aGUga2VybmVsKS4gVGhlIEFCSSBwcm9wZXJ0
aWVzIGFyZSBpbmhlcml0ZWQgYnkgdGhyZWFkcyBvZiB0aGUgc2FtZQo+IGFwcGxpY2F0aW9uIGFu
ZCBmb3JrKCknZWQgY2hpbGRyZW4gYnV0IGNsZWFyZWQgb24gZXhlY3ZlKCkuCj4gCj4gVGhlIFBS
X1NFVF9UQUdHRURfQUREUl9DVFJMIHdpbGwgYmUgZXhwYW5kZWQgaW4gdGhlIGZ1dHVyZSB0byBo
YW5kbGUKPiBNVEUtc3BlY2lmaWMgc2V0dGluZ3MgbGlrZSBpbXByZWNpc2UgdnMgcHJlY2lzZSBl
eGNlcHRpb25zLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENhdGFsaW4gTWFyaW5hcyA8Y2F0YWxpbi5t
YXJpbmFzQGFybS5jb20+Cj4gLS0tCj4gIGFyY2gvYXJtNjQvaW5jbHVkZS9hc20vcHJvY2Vzc29y
LmggICB8ICA2ICsrKwo+ICBhcmNoL2FybTY0L2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmggfCAg
MSArCj4gIGFyY2gvYXJtNjQvaW5jbHVkZS9hc20vdWFjY2Vzcy5oICAgICB8ICAzICstCj4gIGFy
Y2gvYXJtNjQva2VybmVsL3Byb2Nlc3MuYyAgICAgICAgICB8IDY3ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysKPiAgaW5jbHVkZS91YXBpL2xpbnV4L3ByY3RsLmggICAgICAgICAgIHwgIDUg
KysrCj4gIGtlcm5lbC9zeXMuYyAgICAgICAgICAgICAgICAgICAgICAgICB8IDE2ICsrKysrKysK
PiAgNiBmaWxlcyBjaGFuZ2VkLCA5NyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmggYi9hcmNoL2Fy
bTY0L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oCj4gaW5kZXggZmNkMGU2OTFiMWVhLi5mZWU0NTc0
NTZhYTggMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaAo+
ICsrKyBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmgKPiBAQCAtMzA3LDYgKzMw
NywxMiBAQCBleHRlcm4gdm9pZCBfX2luaXQgbWluc2lnc3Rrc3pfc2V0dXAodm9pZCk7Cj4gIC8q
IFBSX1BBQ19SRVNFVF9LRVlTIHByY3RsICovCj4gICNkZWZpbmUgUEFDX1JFU0VUX0tFWVModHNr
LCBhcmcpCXB0cmF1dGhfcHJjdGxfcmVzZXRfa2V5cyh0c2ssIGFyZykKPiAgCj4gKy8qIFBSX1RB
R0dFRF9BRERSIHByY3RsICovCgooQSBjb3VwbGUgb2YgY29tbWVudHMgSSBtaXNzZWQgaW4gbXkg
bGFzdCByZXBseTopCgpOYW1lIG1pc21hdGNoPwoKPiArbG9uZyBzZXRfdGFnZ2VkX2FkZHJfY3Ry
bCh1bnNpZ25lZCBsb25nIGFyZyk7Cj4gK2xvbmcgZ2V0X3RhZ2dlZF9hZGRyX2N0cmwodm9pZCk7
Cj4gKyNkZWZpbmUgU0VUX1RBR0dFRF9BRERSX0NUUkwoYXJnKQlzZXRfdGFnZ2VkX2FkZHJfY3Ry
bChhcmcpCj4gKyNkZWZpbmUgR0VUX1RBR0dFRF9BRERSX0NUUkwoKQkJZ2V0X3RhZ2dlZF9hZGRy
X2N0cmwoKQo+ICsKClsuLi5dCgo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2tlcm5lbC9wcm9j
ZXNzLmMgYi9hcmNoL2FybTY0L2tlcm5lbC9wcm9jZXNzLmMKPiBpbmRleCAzNzY3ZmIyMWE1Yjgu
LjY5ZDBiZTFmYzcwOCAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0L2tlcm5lbC9wcm9jZXNzLmMK
PiArKysgYi9hcmNoL2FybTY0L2tlcm5lbC9wcm9jZXNzLmMKPiBAQCAtMzAsNiArMzAsNyBAQAo+
ICAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9tbS5oPgo+ICAj
aW5jbHVkZSA8bGludXgvc3RkZGVmLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9zeXNjdGwuaD4KPiAg
I2luY2x1ZGUgPGxpbnV4L3VuaXN0ZC5oPgo+ICAjaW5jbHVkZSA8bGludXgvdXNlci5oPgo+ICAj
aW5jbHVkZSA8bGludXgvZGVsYXkuaD4KPiBAQCAtMzIzLDYgKzMyNCw3IEBAIHZvaWQgZmx1c2hf
dGhyZWFkKHZvaWQpCj4gIAlmcHNpbWRfZmx1c2hfdGhyZWFkKCk7Cj4gIAl0bHNfdGhyZWFkX2Zs
dXNoKCk7Cj4gIAlmbHVzaF9wdHJhY2VfaHdfYnJlYWtwb2ludChjdXJyZW50KTsKPiArCWNsZWFy
X3RocmVhZF9mbGFnKFRJRl9UQUdHRURfQUREUik7Cj4gIH0KPiAgCj4gIHZvaWQgcmVsZWFzZV90
aHJlYWQoc3RydWN0IHRhc2tfc3RydWN0ICpkZWFkX3Rhc2spCj4gQEAgLTU1MiwzICs1NTQsNjgg
QEAgdm9pZCBhcmNoX3NldHVwX25ld19leGVjKHZvaWQpCj4gIAo+ICAJcHRyYXV0aF90aHJlYWRf
aW5pdF91c2VyKGN1cnJlbnQpOwo+ICB9Cj4gKwo+ICsvKgo+ICsgKiBDb250cm9sIHRoZSByZWxh
eGVkIEFCSSBhbGxvd2luZyB0YWdnZWQgdXNlciBhZGRyZXNzZXMgaW50byB0aGUga2VybmVsLgo+
ICsgKi8KPiArc3RhdGljIHVuc2lnbmVkIGludCB0YWdnZWRfYWRkcl9wcmN0bF9hbGxvd2VkID0g
MTsKPiArCj4gK2xvbmcgc2V0X3RhZ2dlZF9hZGRyX2N0cmwodW5zaWduZWQgbG9uZyBhcmcpCj4g
K3sKPiArCWlmICghdGFnZ2VkX2FkZHJfcHJjdGxfYWxsb3dlZCkKPiArCQlyZXR1cm4gLUVJTlZB
TDsKClNvLCB0YWdnaW5nIGNhbiBhY3R1YWxseSBiZSBsb2NrZWQgb24gYnkgaGF2aW5nIGEgcHJv
Y2VzcyBlbmFibGUgaXQgYW5kCnRoZW4gc29tZSBwb3NzaWJseSB1bnJlbGF0ZWQgcHJvY2VzcyBj
bGVhcmluZyB0YWdnZWRfYWRkcl9wcmN0bF9hbGxvd2VkLgpUaGF0IGZlZWxzIGEgYml0IHdlaXJk
LgoKRG8gd2Ugd2FudCB0byBhbGxvdyBhIHByb2Nlc3MgdGhhdCBoYXMgdGFnZ2luZyBvbiB0byBi
ZSBhYmxlIHRvIHR1cm4KaXQgb2ZmIGF0IGFsbD8gIFBvc3NpYmx5IHRoaW5ncyBsaWtlIENSSVUg
bWlnaHQgd2FudCB0byBkbyB0aGF0LgoKPiArCWlmIChpc19jb21wYXRfdGFzaygpKQo+ICsJCXJl
dHVybiAtRUlOVkFMOwo+ICsJaWYgKGFyZyAmIH5QUl9UQUdHRURfQUREUl9FTkFCTEUpCj4gKwkJ
cmV0dXJuIC1FSU5WQUw7CgpIb3cgZG8gd2UgZXhwZWN0IHRoaXMgYXJndW1lbnQgdG8gYmUgZXh0
ZW5kZWQgaW4gdGhlIGZ1dHVyZT8KCkknbSB3b25kZXJpbmcgd2hldGhlciB0aGlzIGlzIHJlYWxs
eSBhIGJpdG1hc2sgb3IgYW4gZW51bSwgb3IgYSBtaXh0dXJlCm9mIHRoZSB0d28uICBNYXliZSBp
dCBkb2Vzbid0IG1hdHRlci4KCj4gKwo+ICsJaWYgKGFyZyAmIFBSX1RBR0dFRF9BRERSX0VOQUJM
RSkKPiArCQlzZXRfdGhyZWFkX2ZsYWcoVElGX1RBR0dFRF9BRERSKTsKPiArCWVsc2UKPiArCQlj
bGVhcl90aHJlYWRfZmxhZyhUSUZfVEFHR0VEX0FERFIpOwoKSSB0aGluayB1cGRhdGVfdGhyZWFk
X2ZsYWcoKSBjb3VsZCBiZSB1c2VkIGhlcmUuCgpbLi4uXQoKQ2hlZXJzCi0tLURhdmUKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
