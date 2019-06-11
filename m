Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B52D441CE2
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 08:55:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDCE1892F6;
	Wed, 12 Jun 2019 06:54:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D4A89196
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 14:38:36 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id g21so5234954plq.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 07:38:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+Bb9evtnnpvJpDG7+k/xfmfwlxE7BAZZaECd7yQ/bgY=;
 b=qicd1Q8ikZAzPV+yr9+bQuDVRXn6q7jRcEoWRlQKzSSCfpKPPWuX3cJTZWTRa45gWl
 UQFz07i0gYrPNZYxNFnt7BJ0MXe5PWYLArVQZ0vyNUv0umEFzhHYDLy2I9SNziWzuxrs
 qFj7op/jYIM8HYE6QgtXPNWm1jfuD6pWavw+S0m4fAsmKIOfhiYtu3qdZZ7neZOD/pjI
 52jNqYiU3s1dw3wVW4WI7rEHSg+wHeRIqBhDFBpenDZ7uhPV8/NGaq/rw9sFeimVuKiH
 HW51WR/qRJqVf5YiHB7kf2nw/Hc8OwB0hdqTY3Sr5UwOCRB099NpKw2dByg3+IrvS/P8
 WzWA==
X-Gm-Message-State: APjAAAUvpik/9HCW/LXmbv2LscY58N1ho2TdOvANKOMRMwlr+X4BDGMB
 PMx5d9/Z1UCqXOCHYmzzzfGXidMgBiB3Amt4JnRbpA==
X-Google-Smtp-Source: APXvYqyIzOH5zo/01pYiY/WLl0OLwpsCvaKKuk+vDciT43wSxP3iXzYy6GsWF4y5D8CeYcDREH0+OmLOdYtg4cNrux0=
X-Received: by 2002:a17:902:1566:: with SMTP id
 b35mr78131643plh.147.1560263915764; 
 Tue, 11 Jun 2019 07:38:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559580831.git.andreyknvl@google.com>
 <51f44a12c4e81c9edea8dcd268f820f5d1fad87c.1559580831.git.andreyknvl@google.com>
 <201906072101.58C919E@keescook>
In-Reply-To: <201906072101.58C919E@keescook>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Tue, 11 Jun 2019 16:38:24 +0200
Message-ID: <CAAeHK+y8CH4P3vheUDCEnPAuO-2L6mc-sz6wMA_hT=wC1Cy3KQ@mail.gmail.com>
Subject: Re: [PATCH v16 08/16] fs,
 arm64: untag user pointers in copy_mount_options
To: Kees Cook <keescook@chromium.org>
X-Mailman-Approved-At: Wed, 12 Jun 2019 06:53:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=+Bb9evtnnpvJpDG7+k/xfmfwlxE7BAZZaECd7yQ/bgY=;
 b=vFVLFZFyIF01TbjN+xeeME15qV8KkCRDccJHkbwPJnzYqntxAPPejl4UucLg68kkqb
 BaObH7iQP83sFpaN8IH2/Yu4t4nwUDbwn3rb15fIHqVU7geywA3LRxp1p4GflSM3qTjJ
 iWM19kJHA7FmF25W9uFiY1kMJbcO4WOESGJU61YywCA+i6Ylfs/3WF6YNj5xaMoYJ89L
 XqlvBDrbDKlYUJNKkeiCJcKNhxFQvdK51GyYrA4cNM42eSbHTJc/2qrnnTIYWyQugg14
 drUy2FSlkxzvJpoh5mj5M9w5F5osUe6J99CThZKFzYA/JvReekTQOE0mCFzBedDfUO6l
 PqJQ==
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
 dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 Khalid Aziz <khalid.aziz@oracle.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, LKML <linux-kernel@vger.kernel.org>,
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

T24gU2F0LCBKdW4gOCwgMjAxOSBhdCA2OjAyIEFNIEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21p
dW0ub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgSnVuIDAzLCAyMDE5IGF0IDA2OjU1OjEwUE0gKzAy
MDAsIEFuZHJleSBLb25vdmFsb3Ygd3JvdGU6Cj4gPiBUaGlzIHBhdGNoIGlzIGEgcGFydCBvZiBh
IHNlcmllcyB0aGF0IGV4dGVuZHMgYXJtNjQga2VybmVsIEFCSSB0byBhbGxvdyB0bwo+ID4gcGFz
cyB0YWdnZWQgdXNlciBwb2ludGVycyAod2l0aCB0aGUgdG9wIGJ5dGUgc2V0IHRvIHNvbWV0aGlu
ZyBlbHNlIG90aGVyCj4gPiB0aGFuIDB4MDApIGFzIHN5c2NhbGwgYXJndW1lbnRzLgo+ID4KPiA+
IEluIGNvcHlfbW91bnRfb3B0aW9ucyBhIHVzZXIgYWRkcmVzcyBpcyBiZWluZyBzdWJ0cmFjdGVk
IGZyb20gVEFTS19TSVpFLgo+ID4gSWYgdGhlIGFkZHJlc3MgaXMgbG93ZXIgdGhhbiBUQVNLX1NJ
WkUsIHRoZSBzaXplIGlzIGNhbGN1bGF0ZWQgdG8gbm90Cj4gPiBhbGxvdyB0aGUgZXhhY3RfY29w
eV9mcm9tX3VzZXIoKSBjYWxsIHRvIGNyb3NzIFRBU0tfU0laRSBib3VuZGFyeS4KPiA+IEhvd2V2
ZXIgaWYgdGhlIGFkZHJlc3MgaXMgdGFnZ2VkLCB0aGVuIHRoZSBzaXplIHdpbGwgYmUgY2FsY3Vs
YXRlZAo+ID4gaW5jb3JyZWN0bHkuCj4gPgo+ID4gVW50YWcgdGhlIGFkZHJlc3MgYmVmb3JlIHN1
YnRyYWN0aW5nLgo+ID4KPiA+IFJldmlld2VkLWJ5OiBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4u
bWFyaW5hc0Bhcm0uY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IEtvbm92YWxvdiA8YW5k
cmV5a252bEBnb29nbGUuY29tPgo+Cj4gT25lIHRoaW5nIEkganVzdCBub3RpY2VkIGluIHRoZSBj
b21taXQgdGl0bGVzLi4uICJhcm02NCIgaXMgaW4gdGhlCj4gcHJlZml4LCBidXQgdGhlc2UgYXJl
IGFyY2gtaW5kZXAgYXJlYXMuIFNob3VsZCB0aGUgIiwgYXJtNjQiIGJlIGxlZnQKPiBvdXQ/Cj4K
PiBJIHdvdWxkIGV4cGVjdCwgaW5zdGVhZDoKPgo+ICAgICAgICAgZnMvbmFtZXNwYWNlOiB1bnRh
ZyB1c2VyIHBvaW50ZXJzIGluIGNvcHlfbW91bnRfb3B0aW9ucwoKSG0sIEkndmUgYWRkZWQgdGhl
IGFybTY0IHRhZyBpbiBhbGwgb2YgdGhlIHBhdGNoZXMgYmVjYXVzZSB0aGV5IGFyZQpyZWxhdGVk
IHRvIGNoYW5nZXMgaW4gYXJtNjQga2VybmVsIEFCSS4gSSBjYW4gcmVtb3ZlIGl0IGZyb20gYWxs
IHRoZQpwYXRjaGVzIHRoYXQgb25seSB0b3VjaCBjb21tb24gY29kZSBpZiB5b3UgdGhpbmsgdGhh
dCBpdCBtYWtlcyBzZW5zZS4KClRoYW5rcyEKCj4KPiBSZXZpZXdlZC1ieTogS2VlcyBDb29rIDxr
ZWVzY29va0BjaHJvbWl1bS5vcmc+Cj4KPiAtS2Vlcwo+Cj4gPiAtLS0KPiA+ICBmcy9uYW1lc3Bh
Y2UuYyB8IDIgKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZnMvbmFtZXNwYWNlLmMgYi9mcy9uYW1lc3BhY2Uu
Ywo+ID4gaW5kZXggYjI2Nzc4YmRjMjM2Li4yZTg1NzEyYTE5ZWQgMTAwNjQ0Cj4gPiAtLS0gYS9m
cy9uYW1lc3BhY2UuYwo+ID4gKysrIGIvZnMvbmFtZXNwYWNlLmMKPiA+IEBAIC0yOTkzLDcgKzI5
OTMsNyBAQCB2b2lkICpjb3B5X21vdW50X29wdGlvbnMoY29uc3Qgdm9pZCBfX3VzZXIgKiBkYXRh
KQo+ID4gICAgICAgICogdGhlIHJlbWFpbmRlciBvZiB0aGUgcGFnZS4KPiA+ICAgICAgICAqLwo+
ID4gICAgICAgLyogY29weV9mcm9tX3VzZXIgY2Fubm90IGNyb3NzIFRBU0tfU0laRSAhICovCj4g
PiAtICAgICBzaXplID0gVEFTS19TSVpFIC0gKHVuc2lnbmVkIGxvbmcpZGF0YTsKPiA+ICsgICAg
IHNpemUgPSBUQVNLX1NJWkUgLSAodW5zaWduZWQgbG9uZyl1bnRhZ2dlZF9hZGRyKGRhdGEpOwo+
ID4gICAgICAgaWYgKHNpemUgPiBQQUdFX1NJWkUpCj4gPiAgICAgICAgICAgICAgIHNpemUgPSBQ
QUdFX1NJWkU7Cj4gPgo+ID4gLS0KPiA+IDIuMjIuMC5yYzEuMzExLmc1ZDc1NzNhMTUxLWdvb2cK
PiA+Cj4KPiAtLQo+IEtlZXMgQ29vawpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
