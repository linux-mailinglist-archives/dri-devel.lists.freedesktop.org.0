Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4B12BA4B0
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 09:33:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD45A6E887;
	Fri, 20 Nov 2020 08:33:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A44C56E887
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 08:33:04 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id t9so8641971edq.8
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 00:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CSkCdCaqLBM0bWRHZ00ADxnd+NBE6b99YIUgGCXQ0N8=;
 b=b0w6ldKpDUpMxM+H9MUxFarymLOND8rU0+XNOChF0O2Py4IV00Gt47AXtaGeXw0t2r
 wHUIYai3iA2izngwjfCKMot50mClxBEGuQx4AYiM8qhD4pjCPBDtKuI2ns6damGBZZ29
 fteKSJKPs2hjKnRux2ro3BntaD5Y1UZDqK8Mo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CSkCdCaqLBM0bWRHZ00ADxnd+NBE6b99YIUgGCXQ0N8=;
 b=nhjnqdffyctGiJ3T4YqdLvukhAh8E7Yt2i1yZT+pE1NYL0sg6hocOmL6Ilp1DOQbh7
 koRDH6LbAxP5IrOQjgaWJsKXh7jpV0KSwLu0XZD15ugU2tuCCHW4nwLNFbNOS79X1HmX
 Y4BzpZGaLw3Z7KIk3Ru+jd1h+xd/DnSmaJofmK73rQ2TuDQbUlgutvvL996a3Vpdwpqo
 R8CvOD2yIw4qSoTd1pcCTg9BXu/k+Wc4OM+yi/dFOQJRONjrJ/SX06nytFaf2jE+Hne5
 gnHFE7lS7qC1gZVbZVCLXkGlcJlrbvrxSVr6FwKKqi0/VvUJEiefgrj6ONhnFUA/jlpJ
 1K6w==
X-Gm-Message-State: AOAM5305jJO/qcgxgKvLSG9hj2wtSeLHyFL105474qpo0JykmBmwL5CK
 i5CeguUoZ9ZoX92plc+FwBqkxaeacmPOMw==
X-Google-Smtp-Source: ABdhPJwVeZJyDHwWqeMJ9xR+33VtFO+1TwSXbAsk/J1UeKsWltooe+qgoS55iFg4fs8Z7FLdPjA7GA==
X-Received: by 2002:a50:fd06:: with SMTP id i6mr35665519eds.318.1605861182994; 
 Fri, 20 Nov 2020 00:33:02 -0800 (PST)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com.
 [209.85.221.41])
 by smtp.gmail.com with ESMTPSA id l20sm827527eja.40.2020.11.20.00.33.01
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 00:33:02 -0800 (PST)
Received: by mail-wr1-f41.google.com with SMTP id k2so9188012wrx.2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 00:33:01 -0800 (PST)
X-Received: by 2002:adf:fb90:: with SMTP id a16mr13977920wrr.192.1605861181149; 
 Fri, 20 Nov 2020 00:33:01 -0800 (PST)
MIME-Version: 1.0
References: <20201119144146.1045202-1-daniel.vetter@ffwll.ch>
 <20201119144146.1045202-10-daniel.vetter@ffwll.ch>
 <f1f3a1d8-d62a-6e93-afc1-87a8e51081e9@xs4all.nl>
 <e1f7d30b-2012-0249-66c7-cf9d7d6246ad@xs4all.nl>
In-Reply-To: <e1f7d30b-2012-0249-66c7-cf9d7d6246ad@xs4all.nl>
From: Tomasz Figa <tfiga@chromium.org>
Date: Fri, 20 Nov 2020 17:32:49 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BWUp6XbYN84bYGL62_bT553Y5G+ynPA3wjk6rFvGU=OQ@mail.gmail.com>
Message-ID: <CAAFQd5BWUp6XbYN84bYGL62_bT553Y5G+ynPA3wjk6rFvGU=OQ@mail.gmail.com>
Subject: Re: [PATCH v6 09/17] media/videbuf1|2: Mark follow_pfn usage as unsafe
To: Hans Verkuil <hverkuil@xs4all.nl>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Jan Kara <jack@suse.cz>, kvm <kvm@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>, Daniel Vetter <daniel.vetter@intel.com>,
 Michel Lespinasse <walken@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Pawel Osciak <pawel@osciak.com>,
 John Hubbard <jhubbard@nvidia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Laurent Dufour <ldufour@linux.ibm.com>, Vlastimil Babka <vbabka@suse.cz>,
 LKML <linux-kernel@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjAsIDIwMjAgYXQgNToyOCBQTSBIYW5zIFZlcmt1aWwgPGh2ZXJrdWlsQHhz
NGFsbC5ubD4gd3JvdGU6Cj4KPiBPbiAyMC8xMS8yMDIwIDA5OjA2LCBIYW5zIFZlcmt1aWwgd3Jv
dGU6Cj4gPiBPbiAxOS8xMS8yMDIwIDE1OjQxLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4+IFRo
ZSBtZWRpYSBtb2RlbCBhc3N1bWVzIHRoYXQgYnVmZmVycyBhcmUgYWxsIHByZWFsbG9jYXRlZCwg
c28gdGhhdAo+ID4+IHdoZW4gYSBtZWRpYSBwaXBlbGluZSBpcyBydW5uaW5nIHdlIG5ldmVyIG1p
c3MgYSBkZWFkbGluZSBiZWNhdXNlIHRoZQo+ID4+IGJ1ZmZlcnMgYXJlbid0IGFsbG9jYXRlZCBv
ciBhdmFpbGFibGUuCj4gPj4KPiA+PiBUaGlzIG1lYW5zIHdlIGNhbm5vdCBmaXggdGhlIHY0bCBm
b2xsb3dfcGZuIHVzYWdlIHRocm91Z2gKPiA+PiBtbXVfbm90aWZpZXIsIHdpdGhvdXQgYnJlYWtp
bmcgaG93IHRoaXMgYWxsIHdvcmtzLiBUaGUgb25seSByZWFsIGZpeAo+ID4+IGlzIHRvIGRlcHJl
Y2F0ZSB1c2VycHRyIHN1cHBvcnQgZm9yIFZNX0lPIHwgVk1fUEZOTUFQIG1hcHBpbmdzIGFuZAo+
ID4+IHRlbGwgZXZlcnlvbmUgdG8gY3V0IG92ZXIgdG8gZG1hLWJ1ZiBtZW1vcnkgc2hhcmluZyBm
b3IgemVyb2NvcHkuCj4gPj4KPiA+PiB1c2VycHRyIGZvciBub3JtYWwgbWVtb3J5IHdpbGwga2Vl
cCB3b3JraW5nIGFzLWlzLCB0aGlzIG9ubHkgYWZmZWN0cwo+ID4+IHRoZSB6ZXJvY29weSB1c2Vy
cHRyIHVzYWdlIGVuYWJsZWQgaW4gNTBhYzk1MmQyMjYzICgiW21lZGlhXQo+ID4+IHZpZGVvYnVm
Mi1kbWEtc2c6IFN1cHBvcnQgaW8gdXNlcnB0ciBvcGVyYXRpb25zIG9uIGlvIG1lbW9yeSIpLgo+
ID4+Cj4gPj4gQWNrZWQtYnk6IFRvbWFzeiBGaWdhIDx0ZmlnYUBjaHJvbWl1bS5vcmc+Cj4gPgo+
ID4gQWNrZWQtYnk6IEhhbnMgVmVya3VpbCA8aHZlcmt1aWwtY2lzY29AeHM0YWxsLm5sPgo+Cj4g
QWN0dWFsbHksIGNhbmNlbCB0aGlzIEFja2VkLWJ5Lgo+Cj4gU28gbGV0IG1lIHNlZSBpZiBJIHVu
ZGVyc3RhbmQgdGhpcyByaWdodDogVk1fSU8gfCBWTV9QRk5NQVAgbWFwcGluZ3MgY2FuCj4gbW92
ZSBhcm91bmQuIFRoZXJlIGlzIGEgbW11X25vdGlmaWVyIHRoYXQgY2FuIGJlIHVzZWQgdG8gYmUg
bm90aWZpZWQgd2hlbgo+IHRoYXQgaGFwcGVucywgYnV0IHRoYXQgY2FuJ3QgYmUgdXNlZCB3aXRo
IG1lZGlhIGJ1ZmZlcnMgc2luY2UgdGhvc2UgYnVmZmVycwo+IG11c3QgYWx3YXlzIGJlIGF2YWls
YWJsZSBhbmQgaW4gdGhlIHNhbWUgcGxhY2UuCj4KPiBTbyBmb2xsb3dfcGZuIGlzIHJlcGxhY2Vk
IGJ5IHVuc2FmZV9mb2xsb3dfcGZuIHRvIHNpZ25hbCB0aGF0IHdoYXQgaXMgYXR0ZW1wdGVkCj4g
aXMgdW5zYWZlIGFuZCB1bnJlbGlhYmxlLgo+Cj4gSWYgQ09ORklHX1NUUklDVF9GT0xMT1dfUEZO
IGlzIHNldCwgdGhlbiB1bnNhZmVfZm9sbG93X3BmbiB3aWxsIGZhaWwsIGlmIGl0Cj4gaXMgdW5z
ZXQsIHRoZW4gaXQgd3JpdGVzIGEgd2FybmluZyB0byB0aGUga2VybmVsIGxvZyBidXQganVzdCBj
b250aW51ZXMgd2hpbGUKPiBzdGlsbCB1bnNhZmUuCj4KPiBJIGFtIHZlcnkgbXVjaCBpbmNsaW5l
ZCB0byBqdXN0IGRyb3AgVk1fSU8gfCBWTV9QRk5NQVAgc3VwcG9ydCBpbiB0aGUgbWVkaWEKPiBz
dWJzeXN0ZW0uIEZvciB2YjIgdGhlcmUgaXMgYSB3b3JraW5nIGFsdGVybmF0aXZlIGluIHRoZSBm
b3JtIG9mIGRtYWJ1ZiwgYW5kCj4gZnJhbmtseSBmb3IgdmIxIEkgZG9uJ3QgY2FyZS4gSWYgc29t
ZW9uZSByZWFsbHkgbmVlZHMgdGhpcyBmb3IgYSB2YjEgZHJpdmVyLAo+IHRoZW4gdGhleSBjYW4g
ZG8gdGhlIHdvcmsgdG8gY29udmVydCB0aGF0IGRyaXZlciB0byB2YjIuCj4KPiBJJ3ZlIGFkZGVk
IE1hdXJvIHRvIHRoZSBDQyBsaXN0IGFuZCBJJ2xsIHBpbmcgYSBmZXcgbW9yZSBwZW9wbGUgdG8g
c2VlIHdoYXQKPiB0aGV5IHRoaW5rLCBidXQgaW4gbXkgb3BpbmlvbiBzdXBwb3J0IGZvciBVU0VS
UFRSICsgVk1fSU8gfCBWTV9QRk5NQVAKPiBzaG91bGQganVzdCBiZSBraWxsZWQgb2ZmLgo+Cj4g
SWYgb3RoZXJzIHdvdWxkIGxpa2UgdG8ga2VlcCBpdCwgdGhlbiBmcmFtZV92ZWN0b3IuYyBuZWVk
cyBhIGNvbW1lbnQgYmVmb3JlCj4gdGhlICd3aGlsZScgZXhwbGFpbmluZyB3aHkgdGhlIHVuc2Fm
ZV9mb2xsb3dfcGZuIGlzIHRoZXJlIGFuZCB0aGF0IHVzaW5nCj4gZG1hYnVmIGlzIHRoZSBwcm9w
ZXIgYWx0ZXJuYXRpdmUgdG8gdXNlLiBUaGF0IHdpbGwgbWFrZSBpdCBlYXNpZXIgZm9yCj4gZGV2
ZWxvcGVycyB0byBmaWd1cmUgb3V0IHdoeSB0aGV5IHNlZSBhIGtlcm5lbCB3YXJuaW5nIGFuZCB3
aGF0IHRvIGRvIHRvCj4gZml4IGl0LCByYXRoZXIgdGhhbiBoYXZpbmcgdG8gZGlnIHRocm91Z2gg
dGhlIGdpdCBoaXN0b3J5IGZvciB0aGUgcmVhc29uLgoKSSdtIGFsbCBmb3IgZHJvcHBpbmcgdGhh
dCBjb2RlLgoKQmVzdCByZWdhcmRzLApUb21hc3oKCj4KPiBSZWdhcmRzLAo+Cj4gICAgICAgICBI
YW5zCj4KPiA+Cj4gPiBUaGFua3MhCj4gPgo+ID4gICAgICAgSGFucwo+ID4KPiA+PiBTaWduZWQt
b2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiA+PiBDYzog
SmFzb24gR3VudGhvcnBlIDxqZ2dAemllcGUuY2E+Cj4gPj4gQ2M6IEtlZXMgQ29vayA8a2Vlc2Nv
b2tAY2hyb21pdW0ub3JnPgo+ID4+IENjOiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGlu
dGVsLmNvbT4KPiA+PiBDYzogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9y
Zz4KPiA+PiBDYzogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgo+ID4+IENjOiBK
w6lyw7RtZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4KPiA+PiBDYzogSmFuIEthcmEgPGph
Y2tAc3VzZS5jej4KPiA+PiBDYzogRGFuIFdpbGxpYW1zIDxkYW4uai53aWxsaWFtc0BpbnRlbC5j
b20+Cj4gPj4gQ2M6IGxpbnV4LW1tQGt2YWNrLm9yZwo+ID4+IENjOiBsaW51eC1hcm0ta2VybmVs
QGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+PiBDYzogbGludXgtc2Ftc3VuZy1zb2NAdmdlci5rZXJu
ZWwub3JnCj4gPj4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwo+ID4+IENjOiBQYXdl
bCBPc2NpYWsgPHBhd2VsQG9zY2lhay5jb20+Cj4gPj4gQ2M6IE1hcmVrIFN6eXByb3dza2kgPG0u
c3p5cHJvd3NraUBzYW1zdW5nLmNvbT4KPiA+PiBDYzogS3l1bmdtaW4gUGFyayA8a3l1bmdtaW4u
cGFya0BzYW1zdW5nLmNvbT4KPiA+PiBDYzogVG9tYXN6IEZpZ2EgPHRmaWdhQGNocm9taXVtLm9y
Zz4KPiA+PiBDYzogTGF1cmVudCBEdWZvdXIgPGxkdWZvdXJAbGludXguaWJtLmNvbT4KPiA+PiBD
YzogVmxhc3RpbWlsIEJhYmthIDx2YmFia2FAc3VzZS5jej4KPiA+PiBDYzogRGFuaWVsIEpvcmRh
biA8ZGFuaWVsLm0uam9yZGFuQG9yYWNsZS5jb20+Cj4gPj4gQ2M6IE1pY2hlbCBMZXNwaW5hc3Nl
IDx3YWxrZW5AZ29vZ2xlLmNvbT4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+ID4+IC0tCj4gPj4gdjM6Cj4gPj4gLSBSZWZlcmVuY2Ug
dGhlIGNvbW1pdCB0aGF0IGVuYWJsZWQgdGhlIHplcm9jb3B5IHVzZXJwdHIgdXNlIGNhc2UgdG8K
PiA+PiAgIG1ha2UgaXQgYWJ1bmRhbmR0bHkgY2xlYXIgdGhhdCB0aGlzIHBhdGNoIG9ubHkgYWZm
ZWN0cyB0aGF0LCBhbmQgbm90Cj4gPj4gICBub3JtYWwgbWVtb3J5IHVzZXJwdHIuIFRoZSBvbGQg
Y29tbWl0IG1lc3NhZ2UgYWxyZWFkeSBleHBsYWluZWQgdGhhdAo+ID4+ICAgbm9ybWFsIG1lbW9y
eSB1c2VycHRyIGlzIHVuYWZmZWN0ZWQsIGJ1dCBJIGd1ZXNzIHRoYXQgd2FzIG5vdCBjbGVhcgo+
ID4+ICAgZW5vdWdoLgo+ID4+IC0tLQo+ID4+ICBkcml2ZXJzL21lZGlhL2NvbW1vbi92aWRlb2J1
ZjIvZnJhbWVfdmVjdG9yLmMgfCAyICstCj4gPj4gIGRyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3Zp
ZGVvYnVmLWRtYS1jb250aWcuYyB8IDIgKy0KPiA+PiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
ZWRpYS9jb21tb24vdmlkZW9idWYyL2ZyYW1lX3ZlY3Rvci5jIGIvZHJpdmVycy9tZWRpYS9jb21t
b24vdmlkZW9idWYyL2ZyYW1lX3ZlY3Rvci5jCj4gPj4gaW5kZXggYTBlNjU0ODFhMjAxLi4xYTgy
ZWMxM2VhMDAgMTAwNjQ0Cj4gPj4gLS0tIGEvZHJpdmVycy9tZWRpYS9jb21tb24vdmlkZW9idWYy
L2ZyYW1lX3ZlY3Rvci5jCj4gPj4gKysrIGIvZHJpdmVycy9tZWRpYS9jb21tb24vdmlkZW9idWYy
L2ZyYW1lX3ZlY3Rvci5jCj4gPj4gQEAgLTcwLDcgKzcwLDcgQEAgaW50IGdldF92YWRkcl9mcmFt
ZXModW5zaWduZWQgbG9uZyBzdGFydCwgdW5zaWduZWQgaW50IG5yX2ZyYW1lcywKPiA+PiAgICAg
ICAgICAgICAgICAgICAgICBicmVhazsKPiA+Pgo+ID4+ICAgICAgICAgICAgICB3aGlsZSAocmV0
IDwgbnJfZnJhbWVzICYmIHN0YXJ0ICsgUEFHRV9TSVpFIDw9IHZtYS0+dm1fZW5kKSB7Cj4gPj4g
LSAgICAgICAgICAgICAgICAgICAgZXJyID0gZm9sbG93X3Bmbih2bWEsIHN0YXJ0LCAmbnVtc1ty
ZXRdKTsKPiA+PiArICAgICAgICAgICAgICAgICAgICBlcnIgPSB1bnNhZmVfZm9sbG93X3Bmbih2
bWEsIHN0YXJ0LCAmbnVtc1tyZXRdKTsKPiA+PiAgICAgICAgICAgICAgICAgICAgICBpZiAoZXJy
KSB7Cj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAocmV0ID09IDApCj4gPj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IGVycjsKPiA+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdmlkZW9idWYtZG1hLWNvbnRpZy5jIGIv
ZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdmlkZW9idWYtZG1hLWNvbnRpZy5jCj4gPj4gaW5kZXgg
NTIzMTJjZTJiYTA1Li44MjFjNGE3NmFiOTYgMTAwNjQ0Cj4gPj4gLS0tIGEvZHJpdmVycy9tZWRp
YS92NGwyLWNvcmUvdmlkZW9idWYtZG1hLWNvbnRpZy5jCj4gPj4gKysrIGIvZHJpdmVycy9tZWRp
YS92NGwyLWNvcmUvdmlkZW9idWYtZG1hLWNvbnRpZy5jCj4gPj4gQEAgLTE4Myw3ICsxODMsNyBA
QCBzdGF0aWMgaW50IHZpZGVvYnVmX2RtYV9jb250aWdfdXNlcl9nZXQoc3RydWN0IHZpZGVvYnVm
X2RtYV9jb250aWdfbWVtb3J5ICptZW0sCj4gPj4gICAgICB1c2VyX2FkZHJlc3MgPSB1bnRhZ2dl
ZF9iYWRkcjsKPiA+Pgo+ID4+ICAgICAgd2hpbGUgKHBhZ2VzX2RvbmUgPCAobWVtLT5zaXplID4+
IFBBR0VfU0hJRlQpKSB7Cj4gPj4gLSAgICAgICAgICAgIHJldCA9IGZvbGxvd19wZm4odm1hLCB1
c2VyX2FkZHJlc3MsICZ0aGlzX3Bmbik7Cj4gPj4gKyAgICAgICAgICAgIHJldCA9IHVuc2FmZV9m
b2xsb3dfcGZuKHZtYSwgdXNlcl9hZGRyZXNzLCAmdGhpc19wZm4pOwo+ID4+ICAgICAgICAgICAg
ICBpZiAocmV0KQo+ID4+ICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4+Cj4gPj4KPiA+
Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
