Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1282AC505
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 20:33:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A2A8920D;
	Mon,  9 Nov 2020 19:33:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4406C8920D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 19:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604950399;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cp1sLqcPnHvx8voy0UI3JLO2wJ3RzttsJAjkyMxuFgM=;
 b=iPMUEeNkBJY/gUJwyJntt6zQQHcMJlDiDmC+kCYmuF1fihpT7/+38csdWa9EtibI0ipt/l
 gxdq42gwXWfsek8iHu/GiO2xmviRgFMW9z/9yEAYtKdtxdWgVXR/ADL8cWoeO7rkZKPJhh
 3tETUk702nXJX4gOyiuob0/ioRdc6z0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-wXzlWdZEMgCmhjvufCNAxw-1; Mon, 09 Nov 2020 14:33:17 -0500
X-MC-Unique: wXzlWdZEMgCmhjvufCNAxw-1
Received: by mail-qk1-f200.google.com with SMTP id w4so6457011qki.20
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 11:33:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=Cp1sLqcPnHvx8voy0UI3JLO2wJ3RzttsJAjkyMxuFgM=;
 b=jJZXZoMfGZeVcszAExenAfewt2+d6DWomUs8iCoBqgktbHHuZDxBEt2vitaBVgbDCd
 0UBOsmzT1IhkepbcIML2VkGAQ0RzMknkgM4ErlNDy+QgmkEEKHVLtkRaTVtghcJUv/fh
 NDNi5z+2CM9Fv2y7uVkD5ZhbMoYA2cWyQM8CMYv265gWNhK3Hi0Y6UZ7g1TWdV27EDOD
 hnWOh7mjeMvvrsmBBpp7qd6kYARdKRzB803oxrqP3y5uB0Egn7wukgsxvtzWXv1l0cX2
 Ww1iaku7CE5fd9z9cUkoNKqCDARA3P9S0RCOWRcnl8+P0Aa/4OMwAha6VoxmMsMT+LIy
 hO1w==
X-Gm-Message-State: AOAM531CmtItRg2UBL4to5M26UbIsEKaGf0H0mu92wl0HL8ooWiHCv3X
 GqqOol5u1lYCiRb0NGsXo2nUnyvdSbIDgcJeuxmGI4LStwM+64kQ4YRl55ud5tHyDiMgbjCLtkd
 ldTos5c9Qtv13VZQlAIKVHIwuNiNv
X-Received: by 2002:a05:622a:4e:: with SMTP id
 y14mr6931402qtw.392.1604950397084; 
 Mon, 09 Nov 2020 11:33:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxBzoLN71OPYWBC2+sK+xP8k2BFPCToq9OBiIJUih1rKRmf1rkLW6cptsiMJnhXPMeBVyMSrg==
X-Received: by 2002:a05:622a:4e:: with SMTP id
 y14mr6931371qtw.392.1604950396799; 
 Mon, 09 Nov 2020 11:33:16 -0800 (PST)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id f128sm6901967qkj.48.2020.11.09.11.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 11:33:16 -0800 (PST)
Message-ID: <1c5618fa18445a3951bd86f915f3d93aec81b354.camel@redhat.com>
Subject: Re: [git pull] drm next pull for 5.10-rc1
From: Lyude Paul <lyude@redhat.com>
To: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Date: Mon, 09 Nov 2020 14:33:14 -0500
In-Reply-To: <20201109190808.GN6112@intel.com>
References: <CAPM=9txyMmW1DWhS--SuYQu4qDK1GPzgHJwxbAfhHT=hUsPODA@mail.gmail.com>
 <20201103222013.hypmzlq7uuqufe76@box>
 <71dc852e52bfeafc8c03a6fa3cd5f3cdd4eb6609.camel@redhat.com>
 <20201109115209.rwhoe4zttaxirx6c@box>
 <ea2450953182320516f8e8bf857625c58a18f584.camel@redhat.com>
 <20201109190808.GN6112@intel.com>
Organization: Red Hat
User-Agent: Evolution 3.38.1 (3.38.1-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
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
Reply-To: lyude@redhat.com
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

d2hvb3BzLCB5b3UgY2FuIGlnbm9yZSB0aGlzIGFjdHVhbGx5IC0gSSBnb3QgdGhpcyBtaXhlZCB1
cCB3aXRoIGFuIEludGVsIGlzc3VlIEkKd2FzIGxvb2tpbmcgYXQsIHRoaXMgaXMgYWN0dWFsbHkg
YSBub3V2ZWF1IGlzc3VlIGFuZCB5b3UgZ3V5cyBkb24ndCBuZWVkIHRvIGxvb2sKYXQgdGhpcyA6
KQoKS2lyaWxsLUknbGwgZ2V0IHRvIHRoaXMgYXNhcCwgYnV0IEkndmUgZ290IHNvbWUgb3RoZXIg
c3R1ZmYgb24gbXkgcGxhdGUgdG8gZ28KdGhyb3VnaCBmaXJzdC4gQ291bGQgeW91IG9wZW4gdXAg
YSBidWcgb24gZ2l0bGFiIGluIHRoZSBtZWFuIHRpbWU/CgpPbiBNb24sIDIwMjAtMTEtMDkgYXQg
MjE6MDggKzAyMDAsIFZpbGxlIFN5cmrDpGzDpCB3cm90ZToKPiBPbiBNb24sIE5vdiAwOSwgMjAy
MCBhdCAxMjo1MDo0OFBNIC0wNTAwLCBMeXVkZSBQYXVsIHdyb3RlOgo+ID4gTG9va2luZyBhdCB0
aGUgcGF0Y2hlcyB5b3Ugc2VudCBpcyBvbiBteSBUT0RPIGxpc3QgZm9yIHRoaXMgd2VlayBhdCBs
ZWFzdCBhcwo+ID4gYQo+ID4gcHJpb3JpdHksIGFsdGhvdWdoIEkgcmVhbGx5IHdvdWxkIGhhdmUg
aG9wZWQgdGhhdCBzb21lb25lIGZyb20gSW50ZWwgd291bGQKPiA+IGhhdmUgbG9va2VkIGJ5IG5v
dyBzaW5jZSBpdCdzIGEgcmVncmVzc2lvbiBvbiB0aGVpciBlbmQuCj4gCj4gV2hhdCByZWdyZXNz
aW9uIGFyZSB5b3UgdGFsa2luZyBhYm91dD8KPiAKPiA+IAo+ID4gR2VudGxlIHBpbmcgdG8gVnN5
cmphbGEgYW5kIEltcmUKPiA+IAo+ID4gT24gTW9uLCAyMDIwLTExLTA5IGF0IDE0OjUyICswMzAw
LCBLaXJpbGwgQS4gU2h1dGVtb3Ygd3JvdGU6Cj4gPiA+IE9uIFdlZCwgTm92IDA0LCAyMDIwIGF0
IDA0OjU4OjE0UE0gLTA1MDAsIEx5dWRlIFBhdWwgd3JvdGU6Cj4gPiA+ID4gQUNLLCBJIHdpbGwg
c2VuZCBvdXQgYSBwYXRjaCBmb3IgdGhpcyBhc2FwCj4gPiA+IAo+ID4gPiBBbnkgdXBkYXRlLiBB
RkFJQ1MsIHY1LjEwLXJjMyBpcyBzdGlsbCBidWdneS4KPiA+ID4gCj4gPiAKPiA+IC0tIAo+ID4g
Q2hlZXJzLAo+ID4gwqBMeXVkZSBQYXVsIChzaGUvaGVyKQo+ID4gwqBTb2Z0d2FyZSBFbmdpbmVl
ciBhdCBSZWQgSGF0Cj4gCgotLSAKU2luY2VyZWx5LAogICBMeXVkZSBQYXVsIChzaGUvaGVyKQog
ICBTb2Z0d2FyZSBFbmdpbmVlciBhdCBSZWQgSGF0CiAgIApOb3RlOiBJIGRlYWwgd2l0aCBhIGxv
dCBvZiBlbWFpbHMgYW5kIGhhdmUgYSBsb3Qgb2YgYnVncyBvbiBteSBwbGF0ZS4gSWYgeW91J3Zl
CmFza2VkIG1lIGEgcXVlc3Rpb24sIGFyZSB3YWl0aW5nIGZvciBhIHJldmlldy9tZXJnZSBvbiBh
IHBhdGNoLCBldGMuIGFuZCBJCmhhdmVuJ3QgcmVzcG9uZGVkIGluIGEgd2hpbGUsIHBsZWFzZSBm
ZWVsIGZyZWUgdG8gc2VuZCBtZSBhbm90aGVyIGVtYWlsIHRvIGNoZWNrCm9uIG15IHN0YXR1cy4g
SSBkb24ndCBiaXRlIQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
