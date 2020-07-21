Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F3A228C2B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 00:46:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEB666E132;
	Tue, 21 Jul 2020 22:46:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4434B6E132;
 Tue, 21 Jul 2020 22:46:06 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id y10so183008eje.1;
 Tue, 21 Jul 2020 15:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9xr1v2W2JnKVVLyTRtwOt/n6iJhD2D3A0fwqKMz4hPs=;
 b=rEZAPXIor3Dz4RHCbGWSYP7bPSEIjpr4PFXwS2Im8j4mhj6ape6iAKrEuKt9/16wJb
 lZpHG0XlEaVhnsqWhDvwzZnhbH2qGMHiCuDZM7WS0KrrZjv8jJcsCna7l+z6N03RSryI
 U8/GUuaiXjjM2Legmhg4UW/y2nxUfiL9rhNEEIH/m+ikMiguNIXPzWp5FcJ8lZyev8PT
 WLWiiHIj1Ebcit0XN21uV4r+cIGcJsECcR3QBWCPN5odx48VmqH3GUnoXIOIUIHYK2TF
 yOJJ06VoDsthqoqZ7vPs3+DXb1cqJV++ZhwSCJu2JFkx6/PDQzDmpkrcwLU4TMBFOJQB
 RSSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9xr1v2W2JnKVVLyTRtwOt/n6iJhD2D3A0fwqKMz4hPs=;
 b=eVHoKeRZld9upd59QxrMJFo/sXoGOT7VbKgHYPdQl6wkGKta9CV1ZcfRkBbyJMQKPM
 glhydCu2jhwEPJXS0fKcKyUQwWIhLEQJQ1EGgHDnv6836Wn8QY8fi9nsTa9FN548IQCT
 lLJlg6kF/WxfXz1uxI182ES1I+Zn/M0/1F6137yPg8aj1ei4EtrFAg0vnsC+ayHbUi9y
 9OxNSKoaTGqMEQmUSnWdCy3J9wGY5257sTedpGierpdv5yQj1zZWayaAoLXK5p4dQC6A
 2zmLO++7NcFMTaPAerueI/fti3jX02Ypdx0YEveb676de0ZfuTfGM5vgqMsFcekaBaXW
 CzRA==
X-Gm-Message-State: AOAM530wAnNQ/x10hZ+TqDmstIOaLSLlQ09h6SLyV9aPxiKo1SsznEWs
 ryc0qxDBT0dUSN/y6YzRgwr9he+jhJyozJc9das=
X-Google-Smtp-Source: ABdhPJwZ3Ot7QKWc1rFSm9ERPUfpZAjcJpv8FnDDuXOOnkUxeoTuK9PsCTyGH0MloHa+IJHrTWbjlRTbPgJrqaOl/nY=
X-Received: by 2002:a17:906:4086:: with SMTP id u6mr3259703ejj.9.1595371564794; 
 Tue, 21 Jul 2020 15:46:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200707201229.472834-4-daniel.vetter@ffwll.ch>
 <20200709123339.547390-1-daniel.vetter@ffwll.ch>
 <93b673b7-bb48-96eb-dc2c-bd4f9304000e@shipmail.org>
 <20200721074157.GB3278063@phenom.ffwll.local>
 <3603bb71-318b-eb53-0532-9daab62dce86@amd.com>
 <57a5eb9d-b74f-8ce4-7199-94e911d9b68b@shipmail.org>
In-Reply-To: <57a5eb9d-b74f-8ce4-7199-94e911d9b68b@shipmail.org>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 22 Jul 2020 08:45:53 +1000
Message-ID: <CAPM=9twUWeenf-26GEvkuKo3wHgS3BCyrva=sNaWo6+=A5qdoQ@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] dma-buf.rst: Document why indefinite
 fences are a bad idea
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28Intel=29?= <thomas_os@shipmail.org>
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
Cc: Felix Kuehling <Felix.Kuehling@amd.com>,
 Daniel Stone <daniels@collabora.com>, linux-rdma <linux-rdma@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Steve Pronovost <spronovo@microsoft.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Jesse Natalie <jenatali@microsoft.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jason Ekstrand <jason@jlekstrand.net>, Mika Kuoppala <mika.kuoppala@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMSBKdWwgMjAyMCBhdCAxODo0NywgVGhvbWFzIEhlbGxzdHLDtm0gKEludGVsKQo8
dGhvbWFzX29zQHNoaXBtYWlsLm9yZz4gd3JvdGU6Cj4KPgo+IE9uIDcvMjEvMjAgOTo0NSBBTSwg
Q2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiA+IEFtIDIxLjA3LjIwIHVtIDA5OjQxIHNjaHJpZWIg
RGFuaWVsIFZldHRlcjoKPiA+PiBPbiBNb24sIEp1bCAyMCwgMjAyMCBhdCAwMToxNToxN1BNICsw
MjAwLCBUaG9tYXMgSGVsbHN0csO2bSAoSW50ZWwpCj4gPj4gd3JvdGU6Cj4gPj4+IEhpLAo+ID4+
Pgo+ID4+PiBPbiA3LzkvMjAgMjozMyBQTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+Pj4+IENv
bWVzIHVwIGV2ZXJ5IGZldyB5ZWFycywgZ2V0cyBzb21ld2hhdCB0ZWRpb3VzIHRvIGRpc2N1c3Ms
IGxldCdzCj4gPj4+PiB3cml0ZSB0aGlzIGRvd24gb25jZSBhbmQgZm9yIGFsbC4KPiA+Pj4+Cj4g
Pj4+PiBXaGF0IEknbSBub3Qgc3VyZSBhYm91dCBpcyB3aGV0aGVyIHRoZSB0ZXh0IHNob3VsZCBi
ZSBtb3JlIGV4cGxpY2l0IGluCj4gPj4+PiBmbGF0IG91dCBtYW5kYXRpbmcgdGhlIGFtZGtmZCBl
dmljdGlvbiBmZW5jZXMgZm9yIGxvbmcgcnVubmluZyBjb21wdXRlCj4gPj4+PiB3b3JrbG9hZHMg
b3Igd29ya2xvYWRzIHdoZXJlIHVzZXJzcGFjZSBmZW5jaW5nIGlzIGFsbG93ZWQuCj4gPj4+IEFs
dGhvdWdoIChpbiBteSBodW1ibGUgb3BpbmlvbikgaXQgbWlnaHQgYmUgcG9zc2libGUgdG8gY29t
cGxldGVseQo+ID4+PiB1bnRhbmdsZQo+ID4+PiBrZXJuZWwtaW50cm9kdWNlZCBmZW5jZXMgZm9y
IHJlc291cmNlIG1hbmFnZW1lbnQgYW5kIGRtYS1mZW5jZXMgdXNlZAo+ID4+PiBmb3IKPiA+Pj4g
Y29tcGxldGlvbi0gYW5kIGRlcGVuZGVuY3kgdHJhY2tpbmcgYW5kIGxpZnQgYSBsb3Qgb2YgcmVz
dHJpY3Rpb25zCj4gPj4+IGZvciB0aGUKPiA+Pj4gZG1hLWZlbmNlcywgaW5jbHVkaW5nIHByb2hp
Yml0aW5nIGluZmluaXRlIG9uZXMsIEkgdGhpbmsgdGhpcyBtYWtlcwo+ID4+PiBzZW5zZQo+ID4+
PiBkZXNjcmliaW5nIHRoZSBjdXJyZW50IHN0YXRlLgo+ID4+IFllYWggSSB0aGluayBhIGZ1dHVy
ZSBwYXRjaCBuZWVkcyB0byB0eXBlIHVwIGhvdyB3ZSB3YW50IHRvIG1ha2UgdGhhdAo+ID4+IGhh
cHBlbiAoZm9yIHNvbWUgY3Jvc3MgZHJpdmVyIGNvbnNpc3RlbmN5KSBhbmQgd2hhdCBuZWVkcyB0
byBiZQo+ID4+IGNvbnNpZGVyZWQuIFNvbWUgb2YgdGhlIG5lY2Vzc2FyeSBwYXJ0cyBhcmUgYWxy
ZWFkeSB0aGVyZSAod2l0aCBsaWtlIHRoZQo+ID4+IHByZWVtcHRpb24gZmVuY2VzIGFtZGtmZCBo
YXMgYXMgYW4gZXhhbXBsZSksIGJ1dCBJIHRoaW5rIHNvbWUgY2xlYXIgZG9jcwo+ID4+IG9uIHdo
YXQncyByZXF1aXJlZCBmcm9tIGJvdGggaHcsIGRyaXZlcnMgYW5kIHVzZXJzcGFjZSB3b3VsZCBi
ZSByZWFsbHkKPiA+PiBnb29kLgo+ID4KPiA+IEknbSBjdXJyZW50bHkgd3JpdGluZyB0aGF0IHVw
LCBidXQgcHJvYmFibHkgc3RpbGwgbmVlZCBhIGZldyBkYXlzIGZvcgo+ID4gdGhpcy4KPgo+IEdy
ZWF0ISBJIHB1dCBkb3duIHNvbWUgKHZlcnkpIGluaXRpYWwgdGhvdWdodHMgYSBjb3VwbGUgb2Yg
d2Vla3MgYWdvCj4gYnVpbGRpbmcgb24gZXZpY3Rpb24gZmVuY2VzIGZvciB2YXJpb3VzIGhhcmR3
YXJlIGNvbXBsZXhpdHkgbGV2ZWxzIGhlcmU6Cj4KPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3Rv
cC5vcmcvdGhvbWFzaC9kb2NzLy0vYmxvYi9tYXN0ZXIvVW50YW5nbGluZyUyMGRtYS1mZW5jZSUy
MGFuZCUyMG1lbW9yeSUyMGFsbG9jYXRpb24ub2R0CgpXZSBhcmUgc2VlaW5nIEhXIHRoYXQgaGFz
IHJlY292ZXJhYmxlIEdQVSBwYWdlIGZhdWx0cyBidXQgb25seSBmb3IKY29tcHV0ZSB0YXNrcywg
YW5kIHNjaGVkdWxlciB3aXRob3V0IHNlbWFwaG9yZXMgaHcgZm9yIGdyYXBoaWNzLgoKU28gYSBz
aW5nbGUgZHJpdmVyIG1heSBoYXZlIHRvIGV4cG9zZSBib3RoIG1vZGVscyB0byB1c2Vyc3BhY2Ug
YW5kCmFsc28gaW50cm9kdWNlcyB0aGUgcHJvYmxlbSBvZiBob3cgdG8gaW50ZXJvcGVyYXRlIGJl
dHdlZW4gdGhlIHR3bwptb2RlbHMgb24gb25lIGNhcmQuCgpEYXZlLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
