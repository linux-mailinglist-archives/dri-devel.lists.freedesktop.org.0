Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 959134339A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:30:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD4D7894DC;
	Thu, 13 Jun 2019 07:28:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E7E289496
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 11:03:23 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id r7so3573990pfl.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 04:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U+WRAXF2ARmkxSGAjp/c6etYCd0hTSbOs0DZi8MzR6Q=;
 b=pDW2fri0JTHbRPtOtZ4MRuYCym7RgRdmjCnFYRdztle5AD0+wjSEkpr03kld0zL9mU
 sNTfjkOdEgxwHWZSauLSX8Wa0zXj3rGd5N7D/N9zCgtgzy+8m3nrhN1EGmbZEl/Bq7zc
 w7ewYZAHYsqbWMWpbwo3rUkjUEYFYYh6X5UR5h/ewEs7wNzu2TRK9ZOvU+jxpyvJIXmL
 pP9H06KZ6HDxVDPFx6hefhdAeDU0uPSbC/mSdRnFPz9j5GQ0aFqXJQcTVmMwsN+dImyf
 GHi36isJ+8VdzBvdIa+2eKpu82kh7bg2iOigwI4w/WoDG8b4fcbTzCHSVsXtyCI9ZQQV
 rK8g==
X-Gm-Message-State: APjAAAWaABRPWyaEjA9RoctVcI1Tj2jXDd3gpu0wS8JYKXVgGvFXwyn9
 3bTHE0cVFlq3d3V2lWyEC+57rejCLL5cI+m+DW79dQ==
X-Google-Smtp-Source: APXvYqzWmxUbLyuGmwxZVdNOTNeaNzhhuMrhwfH+eyIre2cUwA02gvKzU0bgN3Cy01oTn1PiBJVwgb5PwMcG3EUFGXg=
X-Received: by 2002:a65:64d9:: with SMTP id t25mr24706277pgv.130.1560337402181; 
 Wed, 12 Jun 2019 04:03:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559580831.git.andreyknvl@google.com>
 <4327b260fb17c4776a1e3c844f388e4948cfb747.1559580831.git.andreyknvl@google.com>
 <20190610175326.GC25803@arrakis.emea.arm.com>
 <20190611145720.GA63588@arrakis.emea.arm.com>
 <CAAeHK+z5nSOOaGfehETzznNcMq5E5U+Eb1rZE16UVsT8FWT0Vg@mail.gmail.com>
 <20190611173903.4icrfmoyfvms35cy@mbp>
In-Reply-To: <20190611173903.4icrfmoyfvms35cy@mbp>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Wed, 12 Jun 2019 13:03:10 +0200
Message-ID: <CAAeHK+ysoiCSiCNrrvXqffK53WwBMHbc3bk69uU0vY0+R4_JvQ@mail.gmail.com>
Subject: Re: [PATCH v16 02/16] arm64: untag user pointers in access_ok and
 __uaccess_mask_ptr
To: Catalin Marinas <catalin.marinas@arm.com>
X-Mailman-Approved-At: Thu, 13 Jun 2019 07:27:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=U+WRAXF2ARmkxSGAjp/c6etYCd0hTSbOs0DZi8MzR6Q=;
 b=Au7VJqK1ojAhcfG23jRBnNIRm8KjejR34yLBYxx+tHyOH3UOEnqAeA+8NqPGB0xERC
 iEkWFkgDGC2bVn5/OIaA4Iaj0a8vwuQDB61IL+0H9Fwkx9OFXo7fvyXQ9pDMhbYVG+Nt
 NAfcfgs6HTAivxcJGzmU1GQcMJKjdgGsV4PVoEwVpmDo71FYYp7iRopdo3JqiipS6Pbm
 g0FK+P1R3xn5BU9DYN7tw7p2D7DXBRHK9wtsmdaKDKErjouHvoT1Xsa2liBK45bWDlUw
 nn9WdHLDyGhILUMAD8+oKvlF/Link+W8NA8UTm3/U+VTclr5XHE7a99we7HZ74tOwnVu
 i1TQ==
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
 dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 Khalid Aziz <khalid.aziz@oracle.com>, Lee Smith <Lee.Smith@arm.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Dave Martin <Dave.Martin@arm.com>, Evgeniy Stepanov <eugenis@google.com>,
 linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, LKML <linux-kernel@vger.kernel.org>,
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

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgNzozOSBQTSBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4u
bWFyaW5hc0Bhcm0uY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgSnVuIDExLCAyMDE5IGF0IDA3OjA5
OjQ2UE0gKzAyMDAsIEFuZHJleSBLb25vdmFsb3Ygd3JvdGU6Cj4gPiBPbiBUdWUsIEp1biAxMSwg
MjAxOSBhdCA0OjU3IFBNIENhdGFsaW4gTWFyaW5hcyA8Y2F0YWxpbi5tYXJpbmFzQGFybS5jb20+
IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBNb24sIEp1biAxMCwgMjAxOSBhdCAwNjo1MzoyN1BNICsw
MTAwLCBDYXRhbGluIE1hcmluYXMgd3JvdGU6Cj4gPiA+ID4gT24gTW9uLCBKdW4gMDMsIDIwMTkg
YXQgMDY6NTU6MDRQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxvdiB3cm90ZToKPiA+ID4gPiA+IGRp
ZmYgLS1naXQgYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCBiL2FyY2gvYXJtNjQv
aW5jbHVkZS9hc20vdWFjY2Vzcy5oCj4gPiA+ID4gPiBpbmRleCBlNWQ1ZjMxYzZkMzYuLjkxNjRl
Y2I1ZmVjYSAxMDA2NDQKPiA+ID4gPiA+IC0tLSBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vdWFj
Y2Vzcy5oCj4gPiA+ID4gPiArKysgYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaAo+
ID4gPiA+ID4gQEAgLTk0LDcgKzk0LDcgQEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIF9f
cmFuZ2Vfb2soY29uc3Qgdm9pZCBfX3VzZXIgKmFkZHIsIHVuc2lnbmVkIGxvbmcgc2kKPiA+ID4g
PiA+ICAgICByZXR1cm4gcmV0Owo+ID4gPiA+ID4gIH0KPiA+ID4gPiA+Cj4gPiA+ID4gPiAtI2Rl
ZmluZSBhY2Nlc3Nfb2soYWRkciwgc2l6ZSkgICAgICBfX3JhbmdlX29rKGFkZHIsIHNpemUpCj4g
PiA+ID4gPiArI2RlZmluZSBhY2Nlc3Nfb2soYWRkciwgc2l6ZSkgICAgICBfX3JhbmdlX29rKHVu
dGFnZ2VkX2FkZHIoYWRkciksIHNpemUpCj4gPiA+ID4KPiA+ID4gPiBJJ20gZ29pbmcgdG8gcHJv
cG9zZSBhbiBvcHQtaW4gbWV0aG9kIGhlcmUgKFJGQyBmb3Igbm93KS4gV2UgY2FuJ3QgaGF2ZQo+
ID4gPiA+IGEgY2hlY2sgaW4gdW50YWdnZWRfYWRkcigpIHNpbmNlIHRoaXMgaXMgYWxyZWFkeSB1
c2VkIHRocm91Z2hvdXQgdGhlCj4gPiA+ID4ga2VybmVsIGZvciBib3RoIHVzZXIgYW5kIGtlcm5l
bCBhZGRyZXNzZXMgKGtod2FzYW4pIGJ1dCB3ZSBjYW4gYWRkIG9uZQo+ID4gPiA+IGluIF9fcmFu
Z2Vfb2soKS4gVGhlIHNhbWUgcHJjdGwoKSBvcHRpb24gd2lsbCBiZSB1c2VkIGZvciBjb250cm9s
bGluZwo+ID4gPiA+IHRoZSBwcmVjaXNlL2ltcHJlY2lzZSBtb2RlIG9mIE1URSBsYXRlciBvbi4g
V2UgY2FuIHVzZSBhIFRJRl8gZmxhZyBoZXJlCj4gPiA+ID4gYXNzdW1pbmcgdGhhdCB0aGlzIHdp
bGwgYmUgY2FsbGVkIGVhcmx5IG9uIGFuZCBhbnkgY2xvbmVkIHRocmVhZCB3aWxsCj4gPiA+ID4g
aW5oZXJpdCB0aGlzLgo+ID4gPgo+ID4gPiBVcGRhdGVkIHBhdGNoLCBpbmxpbmluZyBpdCBiZWxv
dy4gT25jZSB3ZSBhZ3JlZWQgb24gdGhlIGFwcHJvYWNoLCBJCj4gPiA+IHRoaW5rIEFuZHJleSBj
YW4gaW5zZXJ0IGluIGluIHRoaXMgc2VyaWVzLCBwcm9iYWJseSBhZnRlciBwYXRjaCAyLiBUaGUK
PiA+ID4gZGlmZmVyZW5jZXMgZnJvbSB0aGUgb25lIEkgcG9zdGVkIHllc3RlcmRheToKPiA+ID4K
PiA+ID4gLSByZW5hbWVkIFBSXyogbWFjcm9zIHRvZ2V0aGVyIHdpdGggZ2V0L3NldCB2YXJpYW50
cyBhbmQgdGhlIHBvc3NpYmlsaXR5Cj4gPiA+ICAgdG8gZGlzYWJsZSB0aGUgcmVsYXhlZCBBQkkK
PiA+ID4KPiA+ID4gLSBzeXNjdGwgb3B0aW9uIC0gL3Byb2Mvc3lzL2FiaS90YWdnZWRfYWRkciB0
byBkaXNhYmxlIHRoZSBBQkkgZ2xvYmFsbHkKPiA+ID4gICAoanVzdCB0aGUgcHJjdGwoKSBvcHQt
aW4sIHRhc2tzIGFscmVhZHkgdXNpbmcgaXQgd29uJ3QgYmUgYWZmZWN0ZWQpCj4gPiA+Cj4gPiA+
IEFuZCwgb2YgY291cnNlLCBpdCBuZWVkcyBtb3JlIHRlc3RpbmcuCj4gPgo+ID4gU3VyZSwgSSds
bCBhZGQgaXQgdG8gdGhlIHNlcmllcy4KPiA+Cj4gPiBTaG91bGQgSSBkcm9wIGFjY2Vzc19vaygp
IGNoYW5nZSBmcm9tIG15IHBhdGNoLCBzaW5jZSB5b3VycyBqdXN0IHJldmVydHMgaXQ/Cj4KPiBO
b3QgbmVjZXNzYXJ5LCB5b3VyIHBhdGNoIGp1c3QgcmVsYXhlcyB0aGUgQUJJIGZvciBhbGwgYXBw
cywgbWluZQo+IHRpZ2h0ZW5zIGl0LiBZb3UgY291bGQgaW5zdGVhZCBtb3ZlIHRoZSB1bnRhZ2dp
bmcgdG8gX19yYW5nZV9vaygpIGFuZAo+IHJlYmFzZSBteSBwYXRjaCBhY2NvcmRpbmdseS4KCk9L
LCB3aWxsIGRvLiBJJ2xsIGFsc28gYWRkIGEgY29tbWVudCBuZXh0IHRvIFRJRl9UQUdHRURfQURE
UiBhcyBWaW5jZW56byBhc2tlZC4KCj4KPiAtLQo+IENhdGFsaW4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
