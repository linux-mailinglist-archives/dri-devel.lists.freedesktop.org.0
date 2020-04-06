Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5548F19F912
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 17:43:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A668D6E424;
	Mon,  6 Apr 2020 15:43:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1031F6E42F
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 15:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586187784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2oMrM2mDIQhAJG19GAm5tBSf0P9gXDshIKsrEuaQRh0=;
 b=OP3X7pBzJn7CrCyz1bK1V++1CZBSuUcYjfBWzHV0QoVHho7gAMDxhSmhn33vNHfAq26b6U
 6H5/ANJEdOB3vK+rW0eMtbWUqpIZVjP4tE7sf0vNupUHHP0UZ5zTjCsckFPX7S+QZA3W04
 DGcsHQsp9xDQbb7Q/MEM2rL+d7XYP4c=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14--iP5o4ivPPuC0ztZ0Js62g-1; Mon, 06 Apr 2020 11:42:57 -0400
X-MC-Unique: -iP5o4ivPPuC0ztZ0Js62g-1
Received: by mail-qk1-f197.google.com with SMTP id f124so172098qke.9
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Apr 2020 08:42:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=mTQ6SwoE2yqMXLBx7O92dtojONPG9oy9eYg6hBnMWSo=;
 b=hsAh0hKa7OknwWMSUE8Pne81NIzsgiltIfrLeq8cu/bGY9jXjQA3bN6gNmaQRo9gHu
 aRsBsTCQjM0RyXZ+52KBbHJRTJ5LxSdvprXXV6wuuFf+a/UNW8DAmtH4MbIwdhK6VALn
 KKoHRslSwkwntgZGFUFvDwvFkBexjCg4KkMo+nGXXRm3i5CRPhzyY/vVd2AEYM0qMV8A
 6cQ6umaa3CVJ2U/e2VYJrCLE/1JWmZKdkUrKPruY3mVF7GkbJPyjldTmN0UtZcyYSPww
 LuzBLIzXGne2wdKrS9SJTDlaOq/OxrZ8rkZ337SGx/9CfdPzjwu3z2CfmM3oSWHTIIvD
 5smQ==
X-Gm-Message-State: AGi0PuY6NgufiCyLeV+LJkmKKnTpXzwRpyktPo3nS3Oouuf1HKFEL+mG
 ITW7Keuruwr79GnlsWevsKKVyB+jOW7dqmxMLkzR2vvhJmdM96GxRKQZWPNCCXi6yG/S8vBD1je
 NhEQ6eKCQIjCPm4387ql0NxTKJmVy
X-Received: by 2002:ae9:dd83:: with SMTP id
 r125mr22560641qkf.105.1586187777120; 
 Mon, 06 Apr 2020 08:42:57 -0700 (PDT)
X-Google-Smtp-Source: APiQypIEO6+HnV6CFGNQSI2NC/499K8UEKT2zxcX+nyu1TLx6uyjv4PjMIjCN8mPbiPqNeTMeT6gdw==
X-Received: by 2002:ae9:dd83:: with SMTP id
 r125mr22560614qkf.105.1586187776797; 
 Mon, 06 Apr 2020 08:42:56 -0700 (PDT)
Received: from desoxy (c-24-61-245-152.hsd1.ma.comcast.net. [24.61.245.152])
 by smtp.gmail.com with ESMTPSA id h10sm8207966qtp.93.2020.04.06.08.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 08:42:56 -0700 (PDT)
Message-ID: <f4d856925111b77012cabb255d6a880ae5637b41.camel@redhat.com>
Subject: Re: [Mesa-dev] [Intel-gfx] gitlab.fd.o financial situation and
 impact on services
From: Adam Jackson <ajax@redhat.com>
To: Rob Clark <robdclark@gmail.com>, Michel =?ISO-8859-1?Q?D=E4nzer?=
 <michel@daenzer.net>
Date: Mon, 06 Apr 2020 11:42:54 -0400
In-Reply-To: <CAF6AEGuNTtHfNm_nRhPFX5wPRmKkjnFEKqTdTSBDjpLkaiN8Fw@mail.gmail.com>
References: <CAKMK7uHHK2SsCfpmZwEUyTJJHsoccKoadoko3cEBOoYDFkmeAw@mail.gmail.com>
 <CAPM=9txcGPvFdSzMtYZXyqLKnWyacSMuHdoXdV63M53fLFVFpw@mail.gmail.com>
 <b398161ff7d0268454413058dc6c194cf93f5990.camel@collabora.com>
 <ece8ebe3-40ec-2457-02da-4fef19cbe8f6@intel.com>
 <6d2ec570f957b4504fb70e0b1f0632712a99dc0c.camel@collabora.com>
 <CAPj87rO7BuKQj2Kei3T7RdkFq5=TiuShBvtrPU2sn0iqMfXSTg@mail.gmail.com>
 <59f4ea1f13a9a9d37f7801b93061b4ae7dd595e2.camel@gmail.com>
 <d0ef47e45c83b342494e6781b808b4831a008836.camel@ndufresne.ca>
 <d9dca12759fd6a549dc4cd71b5f210a4dced01cd.camel@gmail.com>
 <CAOFGe96WqRTagf=Lhp6j9aMnB6hxwog7t93t=4r6QE_4f+HpeQ@mail.gmail.com>
 <5551426acf99f73d3ce8234c14c176c1c7a1fe44.camel@ndufresne.ca>
 <CAAxE2A5zSy7Rh6xyPW8NCqj3q0_8F7yw8tAXx=_z8+mJ-u2uWw@mail.gmail.com>
 <3cddf1aa-5072-af7c-c51e-c16039176f6c@daenzer.net>
 <CAF6AEGuNTtHfNm_nRhPFX5wPRmKkjnFEKqTdTSBDjpLkaiN8Fw@mail.gmail.com>
User-Agent: Evolution 3.34.0 (3.34.0-1.fc31)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 "X.Org development" <xorg-devel@lists.x.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 "X.Org Foundation Board" <board@foundation.x.org>,
 Xorg Members List <members@x.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Mesa Dev <mesa-dev@lists.freedesktop.org>,
 Discussion of the development of and with GStreamer
 <gstreamer-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAyMDIwLTA0LTA0IGF0IDA4OjExIC0wNzAwLCBSb2IgQ2xhcmsgd3JvdGU6Cj4gT24g
RnJpLCBBcHIgMywgMjAyMCBhdCA3OjEyIEFNIE1pY2hlbCBEw6RuemVyIDxtaWNoZWxAZGFlbnpl
ci5uZXQ+IHdyb3RlOgo+ID4gT24gMjAyMC0wMy0wMSA2OjQ2IGEubS4sIE1hcmVrIE9sxaHDoWsg
d3JvdGU6Cj4gPiA+IEZvciBNZXNhLCB3ZSBjb3VsZCBydW4gQ0kgb25seSB3aGVuIE1hcmdlIHB1
c2hlcywgc28gdGhhdCBpdCdzIGEgc3RyaWN0bHkKPiA+ID4gcHJlLW1lcmdlIENJLgo+ID4gCj4g
PiBUaGFua3MgZm9yIHRoZSBzdWdnZXN0aW9uISBJIGltcGxlbWVudGVkIHNvbWV0aGluZyBsaWtl
IHRoaXMgZm9yIE1lc2E6Cj4gPiAKPiA+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9t
ZXNhL21lc2EvLS9tZXJnZV9yZXF1ZXN0cy80NDMyCj4gCj4gSSB3b3VsZG4ndCBtaW5kIG1hbnVh
bGx5IHRyaWdnZXJpbmcgcGlwZWxpbmVzLCBidXQgdW5sZXNzIHRoZXJlIGlzCj4gc29tZSB0cmlj
ayBJJ20gbm90IHJlYWxpemluZywgaXQgaXMgc3VwZXIgY3VtYmVyc29tZS4gIEllLiB5b3UgaGF2
ZSB0bwo+IGNsaWNrIGZpcnN0IHRoZSBjb250YWluZXIgam9icy4uIHRoZW4gd2FpdC4uIHRoZW4g
dGhlIGJ1aWxkIGpvYnMuLgo+IHRoZW4gd2FpdCBzb21lIG1vcmUuLiBhbmQgdGhlbiBmaW5hbGx5
IHRoZSBhY3R1YWwgcnVubmVycy4gIFRoYXQgd291bGQKPiBiZSBhIHJlYWwgc3RlcCBiYWNrIGlu
IHRlcm1zIG9mIHVzZWZ1bG5lc3Mgb2YgQ0kuLiBvbmUgbWlnaHQgY2FsbCBpdCBhCj4gcmVncmVz
c2lvbiA6LSgKCkkgdGhpbmsgdGhhdCdzIG1vc3RseSBhIGNvbXBsYWludCBhYm91dCB0aGUgY29u
ZGl0aW9uYWxzIHdlJ3ZlIHdyaXR0ZW4Kc28gZmFyLCB0YmguIEFzIEkgY29tbWVudGVkIG9uIHRo
ZSBidWcsIHdoZW4gSSBjbGlja2VkIHRoZSBjb250YWluZXIKam9iICh3aGljaCB0aGUgcnVsZXMg
aGFwcGVuIHRvIGhhdmUgZXZhbHVhdGVkIHRvIGJlaW5nICJtYW51YWwiKSwgZXZlcnkKam9iIChy
ZWN1cnNpdmVseSkgZG93bnN0cmVhbSBvZiBpdCBnb3QgZW5xdWV1ZWQsIHdoaWNoIGlzbid0IHdo
YXQKeW91J3JlIGRlc2NyaWJpbmcuIFNvIEkgdGhpbmsgaWYgeW91IGNhbiBkZXNjcmliZSB0aGUg
VVggeW91J2QgbGlrZSB3ZQpjYW4gd3JpdGUgcnVsZXMgdG8gbWFrZSB0aGF0IHJlYWxpdHkuCgpC
dXQgSSBkb24ndCByZWFsbHkga25vdyB3aGljaCBqb2JzIGFyZSBtb3N0IGV4cGVuc2l2ZSBpbiB0
ZXJtcyBvZgpiYW5kd2lkdGgsIG9yIHN0b3JhZ2UsIG9yIENQVXMsIGFuZCBldmVuIGlmIEkga25l
dyB0aG9zZSBJIGRvbid0IGtub3cKaG93IHRvIG1hcCB0aG9zZSB0byBjdXJyZW5jeS4gU28gSSdt
IG5vdCBzdXJlIGlmIHRoZSBVSSB3ZSdkIGxpa2Ugd291bGQKbWluaW1pemUgdGhlIGNvc3QgdGhl
IHdheSB3ZSdkIGxpa2UuCgotIGFqYXgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
