Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE7295889
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 09:31:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEFF66E615;
	Tue, 20 Aug 2019 07:31:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1238E89C94
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 15:45:09 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id e11so1442265pga.5
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 08:45:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zMGg7ZRNK7NfpqI/Qet9Dxr9rbclh2xtbR4hUTFM6IY=;
 b=LVU2YUshaM/9l21O9buHM0Hggmy3ZVKIdQrgwsRFug7wLP2C5/DqGqqVZ2dUhH5qZL
 fa+wsmYb0c+i79m11nsKiE3I99NUJtnXijmz+y4a060VTZO/YHqjGQehopuYgvoSvCMQ
 pB8g9q+vu2BEBj0FAiNsHvnoXnuqe3WwqOc/yOHmTMGkIX8Nvm1WLcFrbePNt1XITPjv
 m6qQuUmpvuHpG+c7Qe+LTWm/ZpL2QboENVNgnAbdQyA0eC5ZXqb8rJ0sffjqz8aJryEn
 M6hPzbjB5WVcAEJM2FjWaSKQxPe/UXqdBfBf8/4O9kXU7Ewu3Mcs9oaMjIgvb9Bq+Axn
 Zg/g==
X-Gm-Message-State: APjAAAVDbsMI+7UPje46lhLSUGgg1MNimRc2WH412I/Fepuz5lgRuScO
 VDx8Si5hSIlYxM6qaq7t7v7WTpTE9d/PhJPOm3uNIQ==
X-Google-Smtp-Source: APXvYqyflWC4oeyk4cX94v5k6CQJ/8FEDGgMF+Kmp2ZaCbPDE8MBxb9njXOAWHJ8AnGwbz7Ioq7XIseAIciXEoaHYEw=
X-Received: by 2002:a63:3006:: with SMTP id w6mr20727946pgw.440.1566229508161; 
 Mon, 19 Aug 2019 08:45:08 -0700 (PDT)
MIME-Version: 1.0
References: <00eb8ba84205c59cac01b1b47615116a461c302c.1566220355.git.andreyknvl@google.com>
 <20190819150342.sxk3zzxvrxhkpp6j@willie-the-truck>
 <CAAeHK+xP6HnLJt_RKW67x8nbJLJp5A=av57BfwiFrA88eFn60w@mail.gmail.com>
 <20190819153856.odtneqxfxva2wjgu@willie-the-truck>
In-Reply-To: <20190819153856.odtneqxfxva2wjgu@willie-the-truck>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Mon, 19 Aug 2019 17:44:56 +0200
Message-ID: <CAAeHK+zf_VKOttBVfZUdp-ra=uNTx_faCmJkrM81BzgEaOZjSQ@mail.gmail.com>
Subject: Re: [PATCH ARM] selftests,
 arm64: fix uninitialized symbol in tags_test.c
To: Will Deacon <will@kernel.org>
X-Mailman-Approved-At: Tue, 20 Aug 2019 07:30:56 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=zMGg7ZRNK7NfpqI/Qet9Dxr9rbclh2xtbR4hUTFM6IY=;
 b=GJoHV9QE4xGJAUCqD7zOGEihP3UiAZjpj3bmVElnV3mGgDu9+IBupxqZo5crTOTBSn
 9E4KUL6HMvh/OBYUcO8Tpulqz8WiyGQenGKjsASlkTFv2dXi8Y/niM3/Z+P7vnlKNIaZ
 MtFd0UdR9JYH1Lcgtiq3NMGR7NeTcmBx3BytYCkuY0+Mh6In/PjXGCT7JB+YD1Ki2rnw
 M/YU/3ABnIwEbCJlH3DAt0qAYIkuPOryLlR92BarOXnc/HJERVegrVcC8hFgAU/vJ7Go
 FvSFH9zA3QmxP0Me+8WMdbNNwakaShO+N+03UzcmCf/+VKatv8Kx3ZtIc9UnmtYKv3wf
 5kAg==
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
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>, Yishai Hadas <yishaih@mellanox.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMTksIDIwMTkgYXQgNTozOSBQTSBXaWxsIERlYWNvbiA8d2lsbEBrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgQXVnIDE5LCAyMDE5IGF0IDA1OjE2OjM3UE0gKzAyMDAs
IEFuZHJleSBLb25vdmFsb3Ygd3JvdGU6Cj4gPiBPbiBNb24sIEF1ZyAxOSwgMjAxOSBhdCA1OjAz
IFBNIFdpbGwgRGVhY29uIDx3aWxsQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBN
b24sIEF1ZyAxOSwgMjAxOSBhdCAwMzoxNDo0MlBNICswMjAwLCBBbmRyZXkgS29ub3ZhbG92IHdy
b3RlOgo+ID4gPiA+IEZpeCB0YWdnZWRfcHRyIG5vdCBiZWluZyBpbml0aWFsaXplZCB3aGVuIFRC
SSBpcyBub3QgZW5hYmxlZC4KPiA+ID4gPgo+ID4gPiA+IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJw
ZW50ZXJAb3JhY2xlLmNvbT4KPiA+ID4KPiA+ID4gR3Vlc3NpbmcgdGhpcyB3YXMgUmVwb3J0ZWQt
YnksIG9yIGhhcyBEYW4gaW50cm9kdWNlZCBoaXMgb3duIHRhZyBub3c/IDspCj4gPgo+ID4gT29w
cywgeWVzLCBSZXBvcnRlZC1ieSA6KQo+ID4KPiA+ID4KPiA+ID4gR290IGEgbGluayB0byB0aGUg
cmVwb3J0Pwo+ID4KPiA+IGh0dHBzOi8vd3d3LnNwaW5pY3MubmV0L2xpc3RzL2xpbnV4LWtzZWxm
dGVzdC9tc2cwOTQ0Ni5odG1sCj4KPiBUaGFua3MsIEknbGwgZml4IHVwIHRoZSBjb21taXQgbWVz
c2FnZSBhbmQgcHVzaCB0aGlzIG91dCBsYXRlciBvbi4gSWYgeW91Cj4gZ2V0IGEgY2hhbmNlLCB3
b3VsZCB5b3UgYmUgYWJsZSB0byBsb29rIGF0IHRoZSBwZW5kaW5nIGNoYW5nZXMgZnJvbQo+IENh
dGFsaW5bMV0sIHBsZWFzZT8KPgo+IFdpbGwKPgo+IFsxXSBodHRwczovL2xrbWwua2VybmVsLm9y
Zy9yLzIwMTkwODE1MTU0NDAzLjE2NDczLTEtY2F0YWxpbi5tYXJpbmFzQGFybS5jb20KClN1cmUh
IEkgZGlkbid0IHJlYWxpemUgc29tZSBhY3Rpb25lZCBpcyByZXF1aXJlZCBmcm9tIG1lIG9uIHRo
b3NlLgpJJ2xsIGFkZCBteSBBY2tlZC1ieSdzLiBUaGFua3MhCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
