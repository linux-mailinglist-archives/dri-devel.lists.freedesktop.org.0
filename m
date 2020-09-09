Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D16AE263653
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 20:58:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D9A56ECA8;
	Wed,  9 Sep 2020 18:58:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B02D6ECA2
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 18:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599677900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CazTvBrlRJQ8zfa4RcIvyWhiLyNZLfwdpoVOC/dALOc=;
 b=BXDUwAzwXy0baErvElGTmC6nDm/Si+l/ur+a9cRDT9UyLrSNp93nW/kxQroDw/NPgAvmqu
 avtK70/wHwui1X+zdqCtNseaAZhco3w0WNHkSAn8Dxc6qeB13LgPBk7/JNldh1/1C2sBdi
 8r9xI+XsxkaADQcKyCibMHEsjWUOHXI=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-ztVzqJEWOWOqZl9Zm6WrbQ-1; Wed, 09 Sep 2020 14:58:15 -0400
X-MC-Unique: ztVzqJEWOWOqZl9Zm6WrbQ-1
Received: by mail-qt1-f198.google.com with SMTP id s33so2487624qth.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Sep 2020 11:58:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=CazTvBrlRJQ8zfa4RcIvyWhiLyNZLfwdpoVOC/dALOc=;
 b=HevXyD0G4bogsm32S5M81oWuZNSSH39SPb6OzzF3WxsmEVXMCixYiNpJxhri+ClYDo
 gfK5mY6+btPM//BrDRfFIwOesrIMUlc0O0bk+LExfcts34PoovbKuSFU7okomHWdNH2j
 XyFtDFxZn5OGOEbL81Cfi9ncv8KoRurDmT6ztcEWeJshKzHPhgh8wSEgCS5Bajt/EZ45
 AS3GrMNPk50Myt+ZkaHTEIosypSEXb+Tgoh+eLd8fFZQMGC9YsF9X32/uJjHPpZlzLr5
 s2W6PR5c1NzJug3POvYDHCEkzDKy38WmdQ/RcuK8UtXUsQiLh572ypVCuxCVcbS35RZe
 zroA==
X-Gm-Message-State: AOAM532Y8m4Mzkd9v6yH9N51JaIVic6XBgx545lA1VNlBMhGoNkRSCaW
 yiaj8M8VPpEVu6hUHDfTJPGhorjzizi2tQ0HBUKkzXvmneyUkk6j1ceaYY0tdk0kfymzPzOOwsp
 FpSQk90DphqM6ba1kJnxxSIHDXZ3I
X-Received: by 2002:ac8:12c1:: with SMTP id b1mr4825627qtj.148.1599677894678; 
 Wed, 09 Sep 2020 11:58:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMrfJHUr1BuZ8QHwSbIINRJrStEdMAiEEDw4kOnseUMVwZfUyFpay3iO3YT70h465ee+wZ7w==
X-Received: by 2002:ac8:12c1:: with SMTP id b1mr4825605qtj.148.1599677894379; 
 Wed, 09 Sep 2020 11:58:14 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id i62sm3470781qkf.36.2020.09.09.11.58.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 11:58:13 -0700 (PDT)
Message-ID: <a2aa760dd795d8798efc5f07d80cec8dd3147dcc.camel@redhat.com>
Subject: Re: [PATCH] drm/dp: For MST hub, Get max_link_rate&max_lane from
 extended rx capability field if EXTENDED_RECEIVER_CAPABILITY_FILED_PRESENT
 is set.
From: Lyude Paul <lyude@redhat.com>
To: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Date: Wed, 09 Sep 2020 14:58:12 -0400
In-Reply-To: <20200909183627.GP6112@intel.com>
References: <20200827053053.11271-1-koba.ko@canonical.com>
 <CAJB-X+WPiUR8N5sLMS2UC-rPHj=TGJy2ezeBPjjeUXzbN5bfcg@mail.gmail.com>
 <b1dcaf433b7ebe2d0284693724f0e7d8a7fa4825.camel@redhat.com>
 <20200909182010.GO6112@intel.com>
 <aaf36e7a1be596f831ca2665375632aae9c8e350.camel@redhat.com>
 <20200909183627.GP6112@intel.com>
Organization: Red Hat
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Anthony Wong <anthony.wong@canonical.com>, Koba Ko <koba.ko@canonical.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIwLTA5LTA5IGF0IDIxOjM2ICswMzAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
Cj4gT24gV2VkLCBTZXAgMDksIDIwMjAgYXQgMDI6MjY6MTFQTSAtMDQwMCwgTHl1ZGUgUGF1bCB3
cm90ZToKPiA+IE9uIFdlZCwgMjAyMC0wOS0wOSBhdCAyMToyMCArMDMwMCwgVmlsbGUgU3lyasOD
xpLDgsKkbMODxpLDgsKkIHdyb3RlOgo+ID4gPiBPbiBXZWQsIFNlcCAwOSwgMjAyMCBhdCAxMjoz
MzowOVBNIC0wNDAwLCBMeXVkZSBQYXVsIHdyb3RlOgo+ID4gPiA+IFdlIGp1c3QgYWRkZWQgYSBu
ZXcgaGVscGVyIGZvciBEUENEIHJldHJpZXZhbCB0byBkcm1fZHBfaGVscGVyLmMKPiA+ID4gPiAo
d2hpY2gKPiA+ID4gPiBhbHNvCj4gPiA+ID4gaGFuZGxlcyBncmFiYmluZyB0aGUgZXh0ZW5kZWQg
cmVjZWl2ZXIgY2FwcyksIHdlIHNob3VsZCBwcm9iYWJseSBtYWtlCj4gPiA+ID4gdXNlCj4gPiA+
ID4gb2YKPiA+ID4gPiBpdCBoZXJlIAo+ID4gPiAKPiA+ID4gU29tZW9uZSBzaG91bGQgcmVhbGx5
IHJld29yayB0aGlzIHdob2xlIHRoaW5nIHNvIHRoYXQgdGhlIGRyaXZlciBjYW4KPiA+ID4gcGFz
cyBpbiB0aGUgbGluayByYXRlK2xhbmUgY291bnQgd2hlbiBzZXR0aW5nIHVwIHRoZSBsaW5rLiBU
aGVyZSdzIG5vCj4gPiA+IHJlYXNvbiB0byBhc3N1bWUgdGhhdCB0aGUgc291cmNlIGRldmljZSBj
YXBhYmlsaXRpZXMgbWF0Y2ggb3IgZXhjZWVkCj4gPiA+IHRoZSBNU1QgZGV2aWNlIGNhcHMuIEl0
IHdvdWxkIGFsc28gYWxsb3cgdGhlIGRyaXZlciB0aGUgZHluYW1pY2FsbHkKPiA+ID4gYWRqdXN0
IHRoZXNlIGluIHJlc3BvbnNlIHRvIGxpbmsgZmFpbHVyZXMuCj4gPiAKPiA+IEknbSBhIGJpdCBj
b25mdXNlZCwgSSBhbHNvIHRoaW5rIHdlIHNob3VsZCBwYXNzIHRoZSBsaW5rIHJhdGUrbGFuZSBj
b3VudAo+ID4gaW4KPiA+IChlc3BlY2lhbGx5IHNpbmNlIGl0J2xsIGJlIHZlcnkgaGVscGZ1bCBm
b3Igd2hlbiB3ZSBzdGFydCBvcHRpbWl6aW5nIFBCTgo+ID4gaGFuZGxpbmcgaW4gcmVnYXJkcyB0
byBidyBjb25zdHJhaW50cyksIGJ1dCBJJ20gbm90IHN1cmUgd2hhdCB5b3UgbWVhbiBieQo+ID4g
IlRoZXJlJ3Mgbm8gcmVhc29uIHRvIGFzc3VtZSB0aGF0IHRoZSBzb3VyY2UgZGV2aWNlIGNhcGFi
aWxpdGllcyBtYXRjaCBvcgo+ID4gZXhjZWVkIHRoZSBNU1QgZGV2aWNlIGNhcHMiLCBhcmVuJ3Qg
d2UgZG9pbmcgdGhlIG9wcG9zaXRlIGhlcmUgYnkgY2hlY2tpbmcKPiA+IHRoZQo+ID4gTVNUIGRl
dmljZSBjYXBzPwo+IAo+IFdlIGFzc3VtZSBvbmx5IHRoZSBNU1QgZGV2aWNlIGNhcHMgbWF0dGVy
LiBXaGljaCBpcyBmaW5lIGlmIHRoZSBzb3VyY2UKPiBkZXZpY2UgY2FwcyBhcmUgZXF1YWwgb3Ig
aGlnaGVyLiBCdXQgaWYgdGhlIHNvdXJjZSBkZXZpY2UgaXNuJ3QgYXMKPiBjYXBhYmxlIHRoZW4g
d2UncmUgZ29pbmcgdG8gY2FsY3VsYXRlIHRoZSBNU1QgdGhpbmdzIGJhc2VkIG9uIGxpbmsgYncK
PiB3ZSBjYW4gbm90IGFjdHVhbGx5IGFjaGlldmUuIEVuZCByZXN1bHQgaXMgdGhhdCB3ZSBwb3Rl
bnRpYWxseSB0cnkgdG8KPiBwdXNoIHRvbyBtdWNoIGRhdGEgb3ZlciB0aGUgbGluay4KPiAKPiBJ
J20gbm90IHJlYWxseSBzdXJlIHdoYXQgYWN0dWFsbHkgaGFwcGVucyBpZiB3ZSBqdXN0IG1pc2Nv
bXB1dGUgdGhlc2UKPiB0aGluZ3MgYnV0IGRvbid0IGFjdHVhbGx5IG92ZXJzdWJzY3JpYmUgdGhl
IGxpbmsuIE1heWJlIHRoZSByZW1vdGUKPiBlbmQgZ2V0cyBjb25mdXNlZCB3aGVuIHdlIHRlbGwg
aXQgc29tZSBib2d1cyBWQyBwYXJhbWV0ZXJzPyBNYXliZSBpdAo+IGRvZXNuJ3QgY2FyZT8gRHVu
bm8uCgpBaC1JIHVuZGVyc3RhbmQgd2hhdCB5b3UgbWVhbi4gRnJvbSBteSB1bmRlcnN0YW5kaW5n
IEkgdGhpbmsgTVNUIGRldmljZXMgcGFyc2UKc29tZSBvZiB0aGUgYmFuZHdpZHRoIGluZm9ybWF0
aW9uIChzaW5jZSBhIGxvdCBvZiBodWJzIHNlZW0gdG8gaGF2ZSBhCmRpZmZlcmVudCBmdWxsX3Bi
biBiYXNlZCBvbiB0aGUgc291cmNlIGNhcHMgZnJvbSB3aGF0IEkndmUgc2VlbikuIEJ1dCB5ZXMt
d2UKcHJvYmFibHkgc2hvdWxkIGFsc28gc3RhcnQgcHJvY2Vzc2luZyBhbGwgb2YgdGhlIHJlbGV2
YW50IERQQ0QgY2FwcyBvbiB0aGUKc291cmNlIGRldmljZSdzIHNpZGUgaW5zdGVhZCBvZiBqdXN0
IHRydXN0aW5nIE1TVC4gSSdsbCBhZGQgdGhpcyB0byBteSB0b2RvCmxpc3QKCj4gCj4gPiA+ID4g
T24gV2VkLCAyMDIwLTA5LTA5IGF0IDE0OjMxICswODAwLCBLb2JhIEtvIHdyb3RlOgo+ID4gPiA+
ID4gT24gVGh1LCBBdWcgMjcsIDIwMjAgYXQgMTozMCBQTSBLb2JhIEtvIDxrb2JhLmtvQGNhbm9u
aWNhbC5jb20+Cj4gPiA+ID4gPiB3cm90ZToKPiA+ID4gPiA+ID4gQ3VycmVudGx5LCBEUk0gZ2V0
IHRoZSBjYXBhYmlsaXR5IG9mIHRoZSBtc3QgaHViIG9ubHkgZnJvbQo+ID4gPiA+ID4gPiBEUF9E
UENEX1JFVgo+ID4gPiA+ID4gPiBhbmQKPiA+ID4gPiA+ID4gZ2V0IHRoZSBzbG93ZXIgc3BlZWQg
ZXZlbiB0aGUgbXN0IGh1YiBjYW4gcnVuIGluIHRoZSBmYXN0ZXIgc3BlZWQuCj4gPiA+ID4gPiA+
IAo+ID4gPiA+ID4gPiBBcyBwZXIgRFAtMS4zLCBGaXJzdCBjaGVjayBEUF9FWFRFTkRFRF9SRUNF
SVZFUl9DQVBfRklFTERfUFJFU0VOVC4KPiA+ID4gPiA+ID4gSWYgRFBfRVhURU5ERURfUkVDRUlW
RVJfQ0FQX0ZJRUxEX1BSRVNFTlQgaXMgMSwgcmVhZCB0aGUKPiA+ID4gPiA+ID4gRFBfRFAxM19E
UENEX1JFVgo+ID4gPiA+ID4gPiB0bwo+ID4gPiA+ID4gPiBnZXQgdGhlIGZhc3RlciBjYXBhYmls
aXR5Lgo+ID4gPiA+ID4gPiBJZiBEUF9FWFRFTkRFRF9SRUNFSVZFUl9DQVBfRklFTERfUFJFU0VO
VCBpcyAwLCByZWFkIERQX0RQQ0RfUkVWLgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gU2lnbmVk
LW9mZi1ieTogS29iYSBLbyA8a29iYS5rb0BjYW5vbmljYWwuY29tPgo+ID4gPiA+ID4gPiAtLS0K
PiA+ID4gPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgfCAxMCAr
KysrKysrKystCj4gPiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+ID4gPiA+ID4gPiBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiA+ID4gPiA+ID4gaW5kZXggNjdkZDcyZWEyMDBl
Li4zYjg0YzY4MDEyODEgMTAwNjQ0Cj4gPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZHBfbXN0X3RvcG9sb2d5LmMKPiA+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9kcF9tc3RfdG9wb2xvZ3kuYwo+ID4gPiA+ID4gPiBAQCAtMzQ5Nyw2ICszNDk3LDggQEAgc3Rh
dGljIGludCBkcm1fZHBfZ2V0X3ZjX3BheWxvYWRfYncodTgKPiA+ID4gPiA+ID4gZHBfbGlua19i
dywKPiA+ID4gPiA+ID4gdTggIGRwX2xpbmtfY291bnQpCj4gPiA+ID4gPiA+ICBpbnQgZHJtX2Rw
X21zdF90b3BvbG9neV9tZ3Jfc2V0X21zdChzdHJ1Y3QKPiA+ID4gPiA+ID4gZHJtX2RwX21zdF90
b3BvbG9neV9tZ3IKPiA+ID4gPiA+ID4gKm1nciwKPiA+ID4gPiA+ID4gYm9vbCBtc3Rfc3RhdGUp
Cj4gPiA+ID4gPiA+ICB7Cj4gPiA+ID4gPiA+ICAgICAgICAgaW50IHJldCA9IDA7Cj4gPiA+ID4g
PiA+ICsgICAgICAgdTggZHBjZF9leHQgPSAwOwo+ID4gPiA+ID4gPiArICAgICAgIHVuc2lnbmVk
IGludCBkcGNkX29mZnNldCA9IDA7Cj4gPiA+ID4gPiA+ICAgICAgICAgc3RydWN0IGRybV9kcF9t
c3RfYnJhbmNoICptc3RiID0gTlVMTDsKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ICAgICAgICAg
bXV0ZXhfbG9jaygmbWdyLT5wYXlsb2FkX2xvY2spOwo+ID4gPiA+ID4gPiBAQCAtMzUxMCw5ICsz
NTEyLDE1IEBAIGludCBkcm1fZHBfbXN0X3RvcG9sb2d5X21ncl9zZXRfbXN0KHN0cnVjdAo+ID4g
PiA+ID4gPiBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyLCBib29sIG1zCj4gPiA+ID4gPiA+
ICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHJtX2RwX3BheWxvYWQgcmVzZXRfcGF5Owo+ID4gPiA+
ID4gPiAKPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgIFdBUk5fT04obWdyLT5tc3RfcHJpbWFy
eSk7Cj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBkcm1fZHBfZHBjZF9yZWFkKG1nci0+YXV4
LAo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBEUF9UUkFJTklO
R19BVVhfUkRfSU5URVJWQUwsCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICZkcGNkX2V4dCwgc2l6ZW9mKGRwY2RfZXh0KSk7Cj4gPiA+ID4gPiA+ICsKPiA+ID4g
PiA+ID4gKyAgICAgICAgICAgICAgIGRwY2Rfb2Zmc2V0ID0KPiA+ID4gPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgKChkcGNkX2V4dCAmCj4gPiA+ID4gPiA+IERQX0VYVEVOREVEX1JFQ0VJ
VkVSX0NBUF9GSUVMRF9QUkVTRU5UKSA/ICBEUF9EUDEzX0RQQ0RfUkVWIDoKPiA+ID4gPiA+ID4g
RFBfRFBDRF9SRVYpOwo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgIC8q
IGdldCBkcGNkIGluZm8gKi8KPiA+ID4gPiA+ID4gLSAgICAgICAgICAgICAgIHJldCA9IGRybV9k
cF9kcGNkX3JlYWQobWdyLT5hdXgsIERQX0RQQ0RfUkVWLCBtZ3ItCj4gPiA+ID4gPiA+ID4gZHBj
ZCwKPiA+ID4gPiA+ID4gRFBfUkVDRUlWRVJfQ0FQX1NJWkUpOwo+ID4gPiA+ID4gPiArICAgICAg
ICAgICAgICAgcmV0ID0gZHJtX2RwX2RwY2RfcmVhZChtZ3ItPmF1eCwgZHBjZF9vZmZzZXQsIG1n
ci0KPiA+ID4gPiA+ID4gPiBkcGNkLAo+ID4gPiA+ID4gPiBEUF9SRUNFSVZFUl9DQVBfU0laRSk7
Cj4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICBpZiAocmV0ICE9IERQX1JFQ0VJVkVSX0NBUF9T
SVpFKSB7Cj4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIERSTV9ERUJVR19LTVMo
ImZhaWxlZCB0byByZWFkIERQQ0RcbiIpOwo+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICBnb3RvIG91dF91bmxvY2s7Cj4gPiA+ID4gPiA+IC0tCj4gPiA+ID4gPiA+IDIuMjUuMQo+
ID4gPiA+ID4gPiAKPiA+ID4gPiA+IEFkZCBMeXVkZSBQYXVsCj4gPiA+ID4gPiAKPiA+ID4gPiAt
LSAKPiA+ID4gPiBDaGVlcnMsCj4gPiA+ID4gCUx5dWRlIFBhdWwgKHNoZS9oZXIpCj4gPiA+ID4g
CVNvZnR3YXJlIEVuZ2luZWVyIGF0IFJlZCBIYXQKPiA+ID4gPiAKPiA+ID4gPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gPiA+IGRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKPiA+ID4gPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiA+
ID4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwKPiA+IC0tIAo+ID4gQ2hlZXJzLAo+ID4gCUx5dWRlIFBhdWwgKHNoZS9oZXIpCj4gPiAJU29m
dHdhcmUgRW5naW5lZXIgYXQgUmVkIEhhdAotLSAKQ2hlZXJzLAoJTHl1ZGUgUGF1bCAoc2hlL2hl
cikKCVNvZnR3YXJlIEVuZ2luZWVyIGF0IFJlZCBIYXQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
