Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B15985BEE
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 09:47:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B7C6E7BC;
	Thu,  8 Aug 2019 07:47:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD6986E73B
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 16:16:05 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id o101so106536041ota.8
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2019 09:16:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7ytzJIv3QNGK2vpGK5MfHZjc0QgFgcXjo88HR7/oqMA=;
 b=C99Elv2yDf9fii1F8GuUnAi8X/Eml2ruhhrkGjNtdJvTL9T4wj9pRQV1hfyCuQyzxN
 lOAl2lMqNOAn2nriEO6UZYQXLVmV7RvZ8wUcgLFPrH0s3/vd3DCcKhdnnW1yE/A5EVlO
 KJ8qsIdn4Jfud1yKRBwVY0+mI61LnYwOBAvCIE2fJFA2/YY5rPozysL/H91JetixDmjD
 UUNwAvrJjukJ9w4rmDWl0jBm4P+JvHIDpKhsRxghMWMXHOhRreV+s3Vz8ILlGc5K1jQk
 FcyY+lnp05EwTypcMZWgmdioWS7urs5eZjWldg06WHUTDra0iQdL5yezbFlZNC9WacaR
 2S3g==
X-Gm-Message-State: APjAAAW9KgghmvlS3Mj0YOJZFQbeOMR4o85aE7fWBhCKmceQrXXnVSV+
 G8tPDUM/Su2wxQUANZl5K5CUHvX8YOgbWJSLitBiJA==
X-Google-Smtp-Source: APXvYqxocs9JKmL6vxc8Hn2JrzxAo0kZaTAWxbkrPZVvQvVn85LVpyyqD/xT20Row4n7opcNt7YmbVv05FfX1D6hKFA=
X-Received: by 2002:a5e:924d:: with SMTP id z13mr9363595iop.247.1565194565095; 
 Wed, 07 Aug 2019 09:16:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190805211451.20176-1-robdclark@gmail.com>
 <20190806084821.GA17129@lst.de>
 <CAJs_Fx6eh1w7c=crMoD5XyEOMzP6orLhqUewErE51cPGYmObBQ@mail.gmail.com>
 <20190806143457.GF475@lakrids.cambridge.arm.com>
 <CAJs_Fx4h6SWGmDTLBnV4nmWUFAs_Ge1inxd-dW9aDKgKqmc1eQ@mail.gmail.com>
 <20190807123807.GD54191@lakrids.cambridge.arm.com>
In-Reply-To: <20190807123807.GD54191@lakrids.cambridge.arm.com>
From: Rob Clark <robdclark@chromium.org>
Date: Wed, 7 Aug 2019 09:15:54 -0700
Message-ID: <CAJs_Fx5xU2-dn3iOVqWTzAjpTaQ8BBNP_Gn_iMc-eJpOX+iXoQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: add cache support for arm64
To: Mark Rutland <mark.rutland@arm.com>
X-Mailman-Approved-At: Thu, 08 Aug 2019 07:46:20 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=7ytzJIv3QNGK2vpGK5MfHZjc0QgFgcXjo88HR7/oqMA=;
 b=ZuWolzEzTTi6r9XQJ8T7T/obgl1vrSjpszk+SirQmYSfaiKAOopCaOL3uj2/ZeYDN3
 q1/SrxJ/WT7l8LX8St0gjRaKvz6kTJ/9FOa2sacVOtxH5/Lzdb9osA9oLZ3F8b0/9m/g
 4HGJjtU9zw8oCOcwegO9gIZy0dWA7GpPTHNa0=
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
Cc: Sean Paul <sean@poorly.run>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Catalin Marinas <catalin.marinas@arm.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgNywgMjAxOSBhdCA1OjM4IEFNIE1hcmsgUnV0bGFuZCA8bWFyay5ydXRsYW5k
QGFybS5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMDk6MzE6NTVBTSAt
MDcwMCwgUm9iIENsYXJrIHdyb3RlOgo+ID4gT24gVHVlLCBBdWcgNiwgMjAxOSBhdCA3OjM1IEFN
IE1hcmsgUnV0bGFuZCA8bWFyay5ydXRsYW5kQGFybS5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBP
biBUdWUsIEF1ZyAwNiwgMjAxOSBhdCAwNzoxMTo0MUFNIC0wNzAwLCBSb2IgQ2xhcmsgd3JvdGU6
Cj4gPiA+ID4gT24gVHVlLCBBdWcgNiwgMjAxOSBhdCAxOjQ4IEFNIENocmlzdG9waCBIZWxsd2ln
IDxoY2hAbHN0LmRlPiB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4gPiBUaGlzIGdvZXMgaW4gdGhl
IHdyb25nIGRpcmVjdGlvbi4gIGRybV9jZmx1c2hfKiBhcmUgYSBiYWQgQVBJIHdlIG5lZWQgdG8K
PiA+ID4gPiA+IGdldCByaWQgb2YsIG5vdCBhZGQgdXNlIG9mIGl0LiAgVGhlIHJlYXNvbiBmb3Ig
dGhhdCBpcyB0d28tZm9sZDoKPiA+ID4gPiA+Cj4gPiA+ID4gPiAgYSkgaXQgZG9lc24ndCBhZGRy
ZXNzIGhvdyBjYWNoZSBtYWludGFpbmNlIGFjdHVhbGx5IHdvcmtzIGluIG1vc3QKPiA+ID4gPiA+
ICAgICBwbGF0Zm9ybXMuICBXaGVuIHRhbGtpbmcgYWJvdXQgYSBjYWNoZSB3ZSB0aHJlZSBmdW5k
YW1lbnRhbCBvcGVyYXRpb25zOgo+ID4gPiA+ID4KPiA+ID4gPiA+ICAgICAgICAgMSkgd3JpdGUg
YmFjayAtIHRoaXMgd3JpdGVzIHRoZSBjb250ZW50IG9mIHRoZSBjYWNoZSBiYWNrIHRvIHRoZQo+
ID4gPiA+ID4gICAgICAgICAgICBiYWNraW5nIG1lbW9yeQo+ID4gPiA+ID4gICAgICAgICAyKSBp
bnZhbGlkYXRlIC0gdGhpcyByZW1vdmUgdGhlIGNvbnRlbnQgb2YgdGhlIGNhY2hlCj4gPiA+ID4g
PiAgICAgICAgIDMpIHdyaXRlIGJhY2sgKyBpbnZhbGlkYXRlIC0gZG8gYm90aCBvZiB0aGUgYWJv
dmUKPiA+ID4gPgo+ID4gPiA+IEFncmVlZCB0aGF0IGRybV9jZmx1c2hfKiBpc24ndCBhIGdyZWF0
IEFQSS4gIEluIHRoaXMgcGFydGljdWxhciBjYXNlCj4gPiA+ID4gKElJVUMpLCBJIG5lZWQgd2Ir
aW52IHNvIHRoYXQgdGhlcmUgYXJlbid0IGRpcnR5IGNhY2hlIGxpbmVzIHRoYXQgZHJvcAo+ID4g
PiA+IG91dCB0byBtZW1vcnkgbGF0ZXIsIGFuZCBzbyB0aGF0IEkgZG9uJ3QgZ2V0IGEgY2FjaGUg
aGl0IG9uCj4gPiA+ID4gdW5jYWNoZWQvd2MgbW1hcCdpbmcuCj4gPiA+Cj4gPiA+IElzIHRoZXJl
IGEgY2FjaGVhYmxlIGFsaWFzIGx5aW5nIGFyb3VuZCAoZS5nLiB0aGUgbGluZWFyIG1hcCksIG9y
IGFyZQo+ID4gPiB0aGVzZSBhZGRyZXNzZXMgb25seSBtYXBwZWQgdW5jYWNoZWQvd2M/Cj4gPiA+
Cj4gPiA+IElmIHRoZXJlJ3MgYSBjYWNoZWFibGUgYWxpYXMsIHBlcmZvcm1pbmcgYW4gaW52YWxp
ZGF0ZSBpc24ndCBzdWZmaWNpZW50LAo+ID4gPiBzaW5jZSBhIENQVSBjYW4gYWxsb2NhdGUgYSBu
ZXcgKGNsZWFuKSBlbnRyeSBhdCBhbnkgcG9pbnQgaW4gdGltZSAoZS5nLgo+ID4gPiBhcyBhIHJl
c3VsdCBvZiBwcmVmZXRjaGluZyBvciBhcmJpdHJhcnkgc3BlY3VsYXRpb24pLgo+ID4KPiA+IEkg
KmJlbGlldmUqIHRoYXQgdGhlcmUgYXJlIG5vdCBhbGlhcyBtYXBwaW5ncyAodGhhdCBJIGRvbid0
IGNvbnRyb2wKPiA+IG15c2VsZikgZm9yIHBhZ2VzIGNvbWluZyBmcm9tCj4gPiBzaG1lbV9maWxl
X3NldHVwKCkvc2htZW1fcmVhZF9tYXBwaW5nX3BhZ2UoKS4uCj4KPiBBRkFJQ1QsIHRoYXQncyBy
ZWd1bGFyIGFub255bW91cyBtZW1vcnksIHNvIHRoZXJlIHdpbGwgYmUgYSBjYWNoZWFibGUKPiBh
bGlhcyBpbiB0aGUgbGluZWFyL2RpcmVjdCBtYXAuCgp0YmgsIEknbSBub3QgMTAwJSBzdXJlIHdo
ZXRoZXIgdGhlcmUgaXMgYSBjYWNoZWFibGUgYWxpYXMsIG9yIHdoZXRoZXIKYW55IHBvdGVudGlh
bCBsaW5lYXIgbWFwIGlzIHRvcm4gZG93bi4gIE15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCBhCmNh
Y2hlYWJsZSBhbGlhcyBpcyAib2siLCB3aXRoIHNvbWUgY2F2ZWF0cy4uIGllLiB0aGF0IHRoZSBj
YWNoZWFibGUKYWxpYXMgaXMgbm90IGFjY2Vzc2VkLiAgSSdtIG5vdCBlbnRpcmVseSBzdXJlIGFi
b3V0IHByZS1mZXRjaCBmcm9tCmFjY2VzcyB0byBhZGphY2VudCBwYWdlcy4gIFdlIGhhdmUgYmVl
biB1c2luZyBzaG1lbSBhcyBhIHNvdXJjZSBmb3IKcGFnZXMgc2luY2UgdGhlIGJlZ2lubmluZywg
YW5kIEkgaGF2ZW4ndCBzZWVuIGl0IGNhdXNlIGFueSBwcm9ibGVtcyBpbgp0aGUgbGFzdCA2IHll
YXJzLiAgKFRoaXMgaXMgbGltaXRlZCB0byBhcm12NyBhbmQgYXJtdjgsIEknbSBub3QgcmVhbGx5
CnN1cmUgd2hhdCB3b3VsZCBoYXBwZW4gb24gYXJtdjYsIGJ1dCB0aGF0IGlzIGEgY29tYm8gSSBk
b24ndCBoYXZlIHRvCmNhcmUgYWJvdXQuKQoKQlIsCi1SCgo+ID4gZGlnZ2luZyBhcm91bmQgYXQg
d2hhdCBkbWFfc3luY19zZ18qIGRvZXMgdW5kZXIgdGhlIGhvb2QsIGl0IGxvb2tzCj4gPiBsaWtl
IGl0IGlzIGp1c3QgYXJjaF9zeW5jX2RtYV9mb3JfY3B1L2RldmljZSgpLCBzbyBJIGd1ZXNzIHRo
YXQgc2hvdWxkCj4gPiBiZSBzdWZmaWNpZW50IGZvciB3aGF0IEkgbmVlZC4KPgo+IEkgZG9uJ3Qg
dGhpbmsgdGhhdCdzIHRoZSBjYXNlLCBwZXIgdGhlIGV4YW1wbGUgSSBnYXZlIGFib3ZlLgo+Cj4g
VGhhbmtzLAo+IE1hcmsuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
