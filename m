Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 960E2E3B47
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 20:47:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEFFC6E5EC;
	Thu, 24 Oct 2019 18:47:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD936E5EC;
 Thu, 24 Oct 2019 18:47:36 +0000 (UTC)
Received: from localhost (unknown [75.104.69.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4B01B20659;
 Thu, 24 Oct 2019 18:47:35 +0000 (UTC)
Date: Thu, 24 Oct 2019 14:47:28 -0400
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mark Salyzyn <salyzyn@android.com>
Subject: Re: [PATCH] Cleanup: replace prefered with preferred
Message-ID: <20191024184728.GC260560@kroah.com>
References: <20191022214208.211448-1-salyzyn@android.com>
 <20191023115637.GA23733@linux.intel.com>
 <fa12cb96-7a93-bf85-214d-a7bfaf8b8b0a@android.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fa12cb96-7a93-bf85-214d-a7bfaf8b8b0a@android.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1571942856;
 bh=P2j4bA86XgvOqRFtfCl5MtPYc2xM05N5w3nh3XKCbOU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JXFsM9yewwErnF5S3LK+7K6bicNse77w5ov+K8sMXE1WbXMnNUxJ53lRpClS1Y1CC
 11fXyyi93K6RL+XYzVbm018cMUVbdftXTSBMyZqzEhGJR0OX5ENyHkk/LV+cr97wvX
 JQuzhFZ9aaA31ctCt2wdqqskCAv9tdJU2DNgNRus=
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
Cc: Alexander Aring <alex.aring@gmail.com>, linux-efi@vger.kernel.org,
 Linus =?iso-8859-1?Q?L=FCssing?= <linus.luessing@c0d3.blue>,
 linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Feng Tang <feng.tang@intel.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Roman Li <Roman.Li@amd.com>,
 "David S. Miller" <davem@davemloft.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, netdev@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, Rafael Aquini <aquini@redhat.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, Jonathan Corbet <corbet@lwn.net>,
 Francesco Ruggeri <fruggeri@arista.com>,
 Matthew Garrett <matthewgarrett@google.com>, amd-gfx@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, linux-media@vger.kernel.org,
 Leo Li <sunpeng.li@amd.com>, "Steven Rostedt \(VMware\)" <rostedt@goodmis.org>,
 Hans de Goede <hdegoede@redhat.com>, hersen wu <hersenxs.wu@amd.com>,
 dri-devel@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>, linux-nfs@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, kernel-team@android.com,
 Maxim Martynov <maxim@arista.com>, linux-kernel@vger.kernel.org,
 Anna Schumaker <anna.schumaker@netapp.com>, linux-bluetooth@vger.kernel.org,
 David Ahern <dsahern@gmail.com>, Alex Deucher <alexander.deucher@amd.com>,
 Jukka Rissanen <jukka.rissanen@linux.intel.com>, linux-wpan@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMjMsIDIwMTkgYXQgMDg6NDA6NTlBTSAtMDcwMCwgTWFyayBTYWx5enluIHdy
b3RlOgo+IE9uIDEwLzIzLzE5IDQ6NTYgQU0sIEphcmtrbyBTYWtraW5lbiB3cm90ZToKPiA+IE9u
IFR1ZSwgT2N0IDIyLCAyMDE5IGF0IDAyOjQxOjQ1UE0gLTA3MDAsIE1hcmsgU2FseXp5biB3cm90
ZToKPiA+ID4gUmVwbGFjZSBhbGwgb2NjdXJyZW5jZXMgb2YgcHJlZmVyZWQgd2l0aCBwcmVmZXJy
ZWQgdG8gbWFrZSBmdXR1cmUKPiA+ID4gY2hlY2twYXRjaC5wbCdzIGhhcHB5LiAgQSBmZXcgcGxh
Y2VzIHRoZSBpbmNvcnJlY3Qgc3BlbGxpbmcgaXMKPiA+ID4gbWF0Y2hlZCB3aXRoIHRoZSBjb3Jy
ZWN0IHNwZWxsaW5nIHRvIHByZXNlcnZlIGV4aXN0aW5nIHVzZXIgc3BhY2UgQVBJLgo+ID4gPiAK
PiA+ID4gU2lnbmVkLW9mZi1ieTogTWFyayBTYWx5enluIDxzYWx5enluQGFuZHJvaWQuY29tPgo+
ID4gSSdkIGZpeCBzdWNoIHRoaW5ncyB3aGVuIHRoZSBjb2RlIGlzIG90aGVyd2lzZSBjaGFuZ2Ug
YW5kIHNjb3BlIHRoaXMKPiA+IHBhdGNoIG9ubHkgdG8gRG9jdW1lbnRhdGlvbi8uIFRoZXJlIGlz
IG5vIHByYWdtYXRpYyBiZW5lZml0IG9mIGRvaW5nCj4gPiB0aGlzIGZvciB0aGUgY29kZS4KPiA+
IAo+ID4gL0phcmtrbwo+IAo+IFRoZSBwcmFnbWF0aWMgYmVuZWZpdCBjb21lcyB3aXRoIHRoZSB1
c2Ugb2YgYW4gQUJJL0FQSSBjaGVja2VyICh3aGljaCBpcyBhCj4gJ2Rpc3RybycgdGhpbmcsIG5v
dCBhIHRvcCBvZiB0cmVlIGtlcm5lbCB0aGluZykgcHJvZHVjZXMgaXRzIG1hcCB3aGljaCBpcwo+
IHR5cGljYWxseSByZXF1aXJlZCB0byBiZSBjby1sb2NhdGVkIGluIHRoZSBzYW1lIHRyZWUgYXMg
dGhlIGtlcm5lbAo+IHJlcG9zaXRvcnkuIFF1aXRlIGEgZmV3IEFCSS9BUEkgdXBkYXRlIGNoZWNr
aW5zIHJlc3VsdCBpbiBhIGNoZWNrcGF0Y2gucGwKPiBjb21wbGFpbnQgYWJvdXQgdGhlIG1pc3Nw
ZWxsZWQgZWxlbWVudHMgYmVpbmcgKHJlLSlyZWNvcmRlZCBkdWUgdG8KPiBwcm94aW1pdHkuIFdl
IGhhdmUgYSBzZXBhcmF0ZSB0YXNrIHRvIGltcHJvdmUgaG93IGl0IGlzIHRyYWNrZWQgaW4gQW5k
cm9pZAo+IHRvIHJlZHVjZSBtaWxlcG9zdCBtYXJrZXIgY2hhbmdlcyB0aGF0IHJlc3VsdCBpbiBz
d2VlcGluZyBjaGFuZ2VzIHRvIHRoZQo+IGRhdGFiYXNlIHdoaWNoIHdvdWxkIHJlZHVjZSB0aGUg
b2NjdXJyZW5jZXMuCgpSZXF1aXJpbmcgY2hlY2twYXRjaCBzcGVsbGluZyB3YXJuaW5ncyB0byBi
ZSBjb3JyZWN0IGJhc2VkIG9uIGZ1bmN0aW9uCm5hbWVzIGlzIGNyYXp5LCB5b3Ugc2hvdWxkIGZp
eCB5b3VyIHRvb2xzIGlmIHlvdSBhcmUgcmVxdWlyaW5nIHNvbWV0aGluZwphcyBsb29uZXkgYXMg
dGhhdCA6KQoKPiBJIHdpbGwgc3BsaXQgdGhpcyBiZXR3ZWVuIHB1cmUgYW5kIGluZXJ0IGRvY3Vt
ZW50YXRpb24vY29tbWVudHMgZm9yIG5vdywKPiB3aXRoIGEgZm9sbG93dXAgbGF0ZXIgZm9yIHRo
ZSBjb2RlIHBvcnRpb24gd2hpY2ggdW5kZXJzdGFuZGFibHkgaXMgbW9yZQo+IGNvbnRyb3ZlcnNp
YWwuCgpQbGVhc2UgYnJlYWsgdXAgcGVyIHN1YnN5c3RlbSwgbGlrZSBhbGwgdHJpdmlhbCBwYXRj
aGVzLCBhcyB0aGlzCmlzbid0IGFueXRoaW5nIHNwZWNpYWwuCgp0aGFua3MsCgpncmVnIGstaApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
