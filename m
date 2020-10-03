Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0C42820C1
	for <lists+dri-devel@lfdr.de>; Sat,  3 Oct 2020 05:22:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C77E36EA23;
	Sat,  3 Oct 2020 03:22:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F21D66EA23
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Oct 2020 03:22:43 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 30A0D20719
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Oct 2020 03:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601695363;
 bh=vshNU8D+9cfgnyb4qi/vgpJ80rl6DobvFOc+lNmiq4A=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hFlAjzq6mVuQfPmTTpOyDSjt2poAiniCQC7B4VG6VvKy/a9HVw1KOanp3JnlMwGcz
 OsYAzWC62+LsskUIxEsw5P2ZhQLt09I23uMxY35DuZEk8tPOtZ0iY7dUwa69pddMV+
 SVeJ1Gt2OgHRnTkYSAr6RLFodXInMeh/iwBwen+A=
Received: by mail-ej1-f51.google.com with SMTP id nw23so4432176ejb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Oct 2020 20:22:43 -0700 (PDT)
X-Gm-Message-State: AOAM533hbOxuuAPMILbQ/dSZTU6IIOJS8ovUzxmaG/zRExVJIg6h5Yi6
 XTX39m/wQKmJ+kHsbidm8D9VDnPlOY/hcHniDQ==
X-Google-Smtp-Source: ABdhPJwfK6hFOAL1k6cStLol7QwYclHeuIdUmnRprFtlrITDDNE5+T91NUK9YTbudQEGp0c8nEIdFwMRV6jYoHi1EXo=
X-Received: by 2002:a17:906:158f:: with SMTP id
 k15mr180684ejd.310.1601695361687; 
 Fri, 02 Oct 2020 20:22:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200927230422.11610-1-chunkuang.hu@kernel.org>
 <CABb+yY1zq0+sqXuSzkkX9+dTaTZgg5HJyQLC3N-yZx35QLLvDQ@mail.gmail.com>
In-Reply-To: <CABb+yY1zq0+sqXuSzkkX9+dTaTZgg5HJyQLC3N-yZx35QLLvDQ@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 3 Oct 2020 11:22:30 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9bgYK2MDySstc4F2jN0M+Zpmcq2R3G_PdWz2sgt9wp7A@mail.gmail.com>
Message-ID: <CAAOTY_9bgYK2MDySstc4F2jN0M+Zpmcq2R3G_PdWz2sgt9wp7A@mail.gmail.com>
Subject: Re: [PATCH 0/4] Mediatek DRM driver detect CMDQ execution timeout by
 vblank IRQ
To: Jassi Brar <jassisinghbrar@gmail.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEphc3NpOgoKSmFzc2kgQnJhciA8amFzc2lzaW5naGJyYXJAZ21haWwuY29tPiDmlrwgMjAy
MOW5tDEw5pyIM+aXpSDpgLHlha0g5LiK5Y2INDozMOWvq+mBk++8mgo+Cj4gT24gU3VuLCBTZXAg
MjcsIDIwMjAgYXQgNjowNCBQTSBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9y
Zz4gd3JvdGU6Cj4gPgo+ID4gQ01EUSBoZWxwZXIgcHJvdmlkZSB0aW1lciB0byBkZXRlY3QgZXhl
Y3V0aW9uIHRpbWVvdXQsIGJ1dCBEUk0gZHJpdmVyCj4gPiBjb3VsZCBoYXZlIGEgYmV0dGVyIHdh
eSB0byBkZXRlY3QgZXhlY3V0aW9uIHRpbWVvdXQgYnkgdmJsYW5rIElSUS4KPiA+IEZvciBEUk0s
IENNRFEgY29tbWFuZCBzaG91bGQgZXhlY3V0ZSBpbiB2YmxhbmssIHNvIGlmIGl0IGZhaWwgdG8K
PiA+IGV4ZWN1dGUgaW4gbmV4dCAyIHZibGFuaywgdGltZW91dCBoYXBwZW4uIEV2ZW4gdGhvdWdo
IHdlIGNvdWxkCj4gPiBjYWxjdWxhdGUgdGltZSBiZXR3ZWVuIDIgdmJsYW5rIGFuZCB1c2UgdGlt
ZXIgdG8gZGVsZWN0LCB0aGlzIHdvdWxkCj4gPiBtYWtlIHRoaW5ncyBtb3JlIGNvbXBsaWNhdGVk
Lgo+ID4KPiA+IFRoaXMgaW50cm9kdWNlIGEgc2VyaWVzIHJlZmluZW1lbnQgZm9yIENNRFEgbWFp
bGJveCBjb250cm9sbGVyIGFuZCBDTURRCj4gPiBoZWxwZXIuIFJlbW92ZSB0aW1lciBoYW5kbGVy
IGluIGhlbHBlciBmdW5jdGlvbiBiZWNhdXNlIGRpZmZlcmVudAo+ID4gY2xpZW50IGhhdmUgZGlm
ZmVyZW50IHdheSB0byBkZXRlY3QgdGltZW91dC4gVXNlIHN0YW5kYXJkIG1haWxib3gKPiA+IGNh
bGxiYWNrIGluc3RlYWQgb2YgcHJvcHJpZXRhcnkgb25lIHRvIGdldCB0aGUgbmVjZXNzYXJ5IGRh
dGEKPiA+IGluIGNhbGxiYWNrIGZ1bmN0aW9uLiBSZW1vdmUgc3RydWN0IGNtZHFfY2xpZW50IHRv
IGFjY2VzcyBjbGllbnQKPiA+IGluc3RhbmNlIGRhdGEgYnkgc3RydWN0IG1ib3hfY2xpZW50Lgo+
ID4KPiA+IENodW4tS3VhbmcgSHUgKDQpOgo+ID4gICBzb2MgLyBkcm06IG1lZGlhdGVrOiBjbWRx
OiBSZW1vdmUgdGltZW91dCBoYW5kbGVyIGluIGhlbHBlciBmdW5jdGlvbgo+ID4gICBtYWlsYm94
IC8gc29jIC8gZHJtOiBtZWRpYXRlazogVXNlIG1haWxib3ggcnhfY2FsbGJhY2sgaW5zdGVhZCBv
Zgo+ID4gICAgIGNtZHFfdGFza19jYgo+ID4gICBtYWlsYm94IC8gc29jIC8gZHJtOiBtZWRpYXRl
azogUmVtb3ZlIHN0cnVjdCBjbWRxX2NsaWVudAo+ID4gICBkcm0vbWVkaWF0ZWs6IERldGVjdCBD
TURRIGV4ZWN1dGlvbiB0aW1lb3V0Cj4gPgo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHJtX2NydGMuYyAgfCAgNTQgKysrKysrLS0tCj4gPiAgZHJpdmVycy9tYWlsYm94L210ay1j
bWRxLW1haWxib3guYyAgICAgICB8ICAyNCArKy0tCj4gPiAgZHJpdmVycy9zb2MvbWVkaWF0ZWsv
bXRrLWNtZHEtaGVscGVyLmMgICB8IDE0NiArKy0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gIGlu
Y2x1ZGUvbGludXgvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmggfCAgMjUgKy0tLQo+ID4gIGlu
Y2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1jbWRxLmggICAgfCAgNTQgKy0tLS0tLS0tCj4g
PiAgNSBmaWxlcyBjaGFuZ2VkLCA2NiBpbnNlcnRpb25zKCspLCAyMzcgZGVsZXRpb25zKC0pCj4g
Pgo+IFBsZWFzZSBicmVhayB0aGlzIGludG8gdHdvIHBhdGNoc2V0cyAtIG9uZSBmb3IgbWFpbGJv
eCBhbmQgb25lIGZvciBpdHMgdXNlcnMuCj4gQWxzbywgQ0Mgb3JpZ2luYWwgYXV0aG9yIGFuZCBy
ZWNlbnQgbWFqb3IgY29udHJpYnV0b3JzIHRvIG10ay1jbWRxLW1haWxib3guYwo+CgpBZ3JlZSB3
aXRoIHlvdS4gQnV0IGZvciBwYXRjaCBbMi80XSAoIlVzZSBtYWlsYm94IHJ4X2NhbGxiYWNrIGlu
c3RlYWQKb2YgY21kcV90YXNrX2NiIiksIEkgdGhpbmsgaXQgd291bGQgYmUgYSBsb25nIHRlcm0g
cHJvY2Vzcy4KSSB3b3VsZCBicmVhayBpdCBpbnRvOgoKMS4gbXRrLWNtZHEtbWFpbGJveC5jOiBh
ZGQgcnhfY2FsbGJhY2sgYW5kIGtlZXAgIGNtZHFfdGFza19jYiBiZWNhdXNlCmNsaWVudCBpcyB1
c2luZyBjbWRxX3Rhc2tfY2IuCjIuIGNsaWVudDogY2hhbmdlIGZyb20gY21kcV90YXNrX2NiIHRv
IHJ4X2NhbGxiYWNrLgozLiBtdGstY21kcS1tYWlsYm94LmM6IHJlbW92ZSBjbWRxX3Rhc2tfY2Iu
CgpUaGUgdGhyZWUgc3RlcCBoYXMgZGVwZW5kZW5jeSwgYnV0IHRoZSAybmQgc2hvdWxkIG1vdmUg
dG8gYW5vdGhlcgpzZXJpZXMsIHNvIEkgd291bGQgZ28gMXN0IHN0ZXAgZmlyc3QuCgpSZWdhcmRz
LApDaHVuLUt1YW5nLgoKPiBUaGFua3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
