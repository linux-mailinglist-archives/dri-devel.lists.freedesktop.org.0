Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD17D499FD
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 09:12:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E92536E0EA;
	Tue, 18 Jun 2019 07:12:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1C3CD88FD4;
 Mon, 17 Jun 2019 13:56:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCD2D28;
 Mon, 17 Jun 2019 06:56:44 -0700 (PDT)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.196.78])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 1625E3F246; Mon, 17 Jun 2019 06:56:39 -0700 (PDT)
Date: Mon, 17 Jun 2019 14:56:37 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v17 03/15] arm64: Introduce prctl() options to control
 the tagged user addresses ABI
Message-ID: <20190617135636.GC1367@arrakis.emea.arm.com>
References: <cover.1560339705.git.andreyknvl@google.com>
 <a7a2933bea5fe57e504891b7eec7e9432e5e1c1a.1560339705.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a7a2933bea5fe57e504891b7eec7e9432e5e1c1a.1560339705.git.andreyknvl@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 18 Jun 2019 07:12:01 +0000
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
 Mauro Carvalho Chehab <mchehab@kernel.org>,
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
YXJpbmFzQGFybS5jb20+CgpBIHF1ZXN0aW9uIGZvciB0aGUgdXNlci1zcGFjZSBmb2xrOiBpZiBh
biBhcHBsaWNhdGlvbiBvcHRzIGluIHRvIHRoaXMKQUJJLCB3b3VsZCB5b3Ugd2FudCB0aGUgc2ln
Y29udGV4dC5mYXVsdF9hZGRyZXNzIGFuZC9vciBzaWdpbmZvLnNpX2FkZHIKdG8gY29udGFpbiB0
aGUgdGFnPyBXZSBjdXJyZW50bHkgY2xlYXIgaXQgZWFybHkgaW4gdGhlIGFybTY0IGVudHJ5LlMg
YnV0CndlIGNvdWxkIGZpbmQgYSB3YXkgdG8gcGFzcyBpdCBkb3duIGlmIG5lZWRlZC4KCi0tIApD
YXRhbGluCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
