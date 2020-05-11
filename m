Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E73F1CE63E
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 23:02:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC7D06E58E;
	Mon, 11 May 2020 21:02:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A72FF6E58E;
 Mon, 11 May 2020 21:02:17 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id b6so3960140uak.6;
 Mon, 11 May 2020 14:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=z3JlndbJIncW08qmOfGBaq3R0FENbnKFJehfSnITyNw=;
 b=SUHL7qp1pbk7JM4pChdgjwjMNuA8qsecmUvlG3hT48L5yjZ31BBtqKrJTBL2PgSHmg
 S+KD3oBAs/g59ErtVu55q3eVcCPymZoo2Tu/f0NAhrakr9k0NPfDYUyS32l+LRB4bAQv
 bZD/ZBwOrOzmWPlPL9yXzrxMkqtBCeU8CYk+6NWts7xAIQ+SYMNT+sTwXzd4OymZtew6
 2E9F5B1PNlSIbC1SBb9deRHmaNLPSyJ9Zayhfe9smMH+Y5Z+ASiWY8TygyQWvgI+FHFZ
 OZwYpQdMNSqO1whRO72KzylH2+E4fbYbCqE98txuHwI1bqG4hjwyW6Di47stBayaaGNs
 1rGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=z3JlndbJIncW08qmOfGBaq3R0FENbnKFJehfSnITyNw=;
 b=H8TcQNIgI/TPPonf/1Ldh6xRTfny5ca4i6wR14DYBTw9iEylbbXFeJHdKMdGmoRB5f
 L+ZDcF310KFVES+/LDs/+7eWWfj+MfyjtwFaTdbN8UA6QrYQOtpsDT3sPFMCMZu2Go/v
 rgEqFDP+5o7ZVLAO/ctMGfM4T73cZTprgKMqa2GXmm6fKu2VtSYaPtuVMJv6gSkk1PNa
 +BLOL2CCT7sXwe9+8SozE17xnF2jdnPJHy/MqqAmwOoanarsjjnR7USQ2/etBjRxqqit
 Beu5MqJZTSxJ/ne7B4e+ug0zmoFx7JRbAC5vNMfJg/ppqv8s6taAdpb/ZH6hPvsjeCR8
 89jA==
X-Gm-Message-State: AGi0PuZyftrboS8bFVe52YDImffNtQV6aBlEKR+LyjMgWIhOoZDqLZz7
 JUToiFUckVeODzI+OCRDfiYCjejFMB4SfUufBWgWMw==
X-Google-Smtp-Source: APiQypKfjvtdLvMKynxJTrybjpR6RRbbiVJJED8LWaVxrKVy7TEzcgcHBBN8FfkRJrafFMae+hIbDYIODo9vaYO584k=
X-Received: by 2002:ab0:770b:: with SMTP id z11mr13168553uaq.64.1589230936657; 
 Mon, 11 May 2020 14:02:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200511171722.96576-1-christian.koenig@amd.com>
 <1815605280.20200511161440@sympatico.ca>
 <CADnq5_MYPcAoWzCcBkJAkd858gCVbJpCJobiwH_BBbwgEdx5rA@mail.gmail.com>
 <CAPM=9tysbcgQ-KR8+icQ=3e6+SECxkwHdVpP8=w0Pmh9ML_+Lw@mail.gmail.com>
In-Reply-To: <CAPM=9tysbcgQ-KR8+icQ=3e6+SECxkwHdVpP8=w0Pmh9ML_+Lw@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 11 May 2020 21:59:38 +0100
Message-ID: <CACvgo50j-AC9LpR9oN065g4EmBVF3EYLNRe2sxfD99JFCE2Nxw@mail.gmail.com>
Subject: Re: [RFC] Remove AGP support from Radeon/Nouveau/TTM
To: Dave Airlie <airlied@gmail.com>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAxMSBNYXkgMjAyMCBhdCAyMTo0MywgRGF2ZSBBaXJsaWUgPGFpcmxpZWRAZ21haWwu
Y29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgMTIgTWF5IDIwMjAgYXQgMDY6MjgsIEFsZXggRGV1Y2hl
ciA8YWxleGRldWNoZXJAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBNb24sIE1heSAxMSwg
MjAyMCBhdCA0OjIyIFBNIEFsIER1bnNtdWlyIDxhbC5kdW5zbXVpckBzeW1wYXRpY28uY2E+IHdy
b3RlOgo+ID4gPgo+ID4gPiBPbiBNb25kYXksIE1heSAxMSwgMjAyMCwgMToxNzoxOSBQTSwgIkNo
cmlzdGlhbiBLw7ZuaWciIHdyb3RlOgo+ID4gPiA+IEhpIGd1eXMsCj4gPiA+Cj4gPiA+ID4gV2Vs
bCBsZXQncyBmYWNlIGl0IEFHUCBpcyBhIHRvdGFsIGhlYWRhY2hlIHRvIG1haW50YWluIGFuZCBk
ZWFkIGZvciBhdCBsZWFzdCAxMCsgeWVhcnMuCj4gPiA+Cj4gPiA+ID4gV2UgaGF2ZSBhIGxvdCBv
ZiB4ODYgc3BlY2lmaWMgc3R1ZmYgaW4gdGhlIGFyY2hpdGVjdHVyZSBpbmRlcGVuZGVudAo+ID4g
PiA+IGdyYXBoaWNzIG1lbW9yeSBtYW5hZ2VtZW50IHRvIGdldCB0aGUgY2FjaGluZyByaWdodCwg
YWJ1c2luZyB0aGUgRE1BCj4gPiA+ID4gQVBJIG9uIG11bHRpcGxlIG9jY2FzaW9ucywgbmVlZCB0
byBkaXN0aW5jdCBiZXR3ZWVuIEFHUCBhbmQgZHJpdmVyIHNwZWNpZmljIHBhZ2UgdGFibGVzIGV0
YyBldGMuLi4KPiA+ID4KPiA+ID4gPiBTbyB0aGUgaWRlYSBoZXJlIGlzIHRvIGp1c3QgZ28gYWhl
YWQgYW5kIHJlbW92ZSB0aGUgc3VwcG9ydCBmcm9tCj4gPiA+ID4gUmFkZW9uIGFuZCBOb3V2ZWF1
IGFuZCB0aGVuIGRyb3AgdGhlIG5lY2Vzc2FyeSBjb2RlIGZyb20gVFRNLgo+ID4gPgo+ID4gPiA+
IEZvciBSYWRlb24gdGhpcyBtZWFucyB0aGF0IHdlIGp1c3Qgc3dpdGNoIG92ZXIgdG8gdGhlIGRy
aXZlcgo+ID4gPiA+IHNwZWNpZmljIHBhZ2UgdGFibGVzIGFuZCBldmVyeXRoaW5nIHNob3VsZCBt
b3JlIG9yIGxlc3MgY29udGludWUgdG8gd29yay4KPiA+ID4KPiA+ID4gPiBGb3IgTm91dmVhdSBJ
J20gbm90IDEwMCUgc3VyZSwgYnV0IGZyb20gdGhlIGNvZGUgaXQgb2YgaGFuZCBsb29rcwo+ID4g
PiA+IGxpa2Ugd2UgY2FuIGRvIGl0IHNpbWlsYXIgdG8gUmFkZW9uLgo+ID4gPgo+ID4gPiA+IFBs
ZWFzZSBjb21tZW50IHdoYXQgeW91IHRoaW5rIGFib3V0IHRoaXMuCj4gPiA+Cj4gPiA+ID4gUmVn
YXJkcywKPiA+ID4gPiBDaHJpc3RpYW4uCj4gPiA+Cj4gPiA+IENocmlzdGlhbiwKPiA+ID4KPiA+
ID4gSSB3b3VsZCByZXNwZWN0ZnVsbHkgYXNrIHRoYXQgdGhpcyBjaGFuZ2UgYmUgcmVqZWN0ZWQu
Cj4gPiA+Cj4gPiA+IEknbSAgY3VycmVudGx5ICBhbiAgZW5kIHVzZXIgb24gYm90aCBJbnRlbCAo
MzItYml0IGFuZCA2NC1iaXQpIGFuZCBQUEMKPiA+ID4gKE1hY3MsIElCTSBQb3dlciAtIEJFIGFu
ZCBMRSkuCj4gPiA+Cj4gPiA+IExpbnV4IGlzIG5vdCBqdXN0IHVzZWQgZm9yIG1vZGVybiBoYXJk
d2FyZS4gVGhlcmUgaXMgYWxzbyBhIHN1YnNldCBvZgo+ID4gPiB0aGUgdXNlciBiYXNlIHRoYXQg
dXNlcyBpdCBmb3Igd2hhdCBpcyBvZnRlbiB0ZXJtZWQgcmV0cm8tY29tcHV0aW5nLgo+ID4gPiBO
byBpdCdzIG5vdCBjb21tZXJjaWFsIHVzYWdlLCBidXQgbm8gb25lIGNhbiBzZXJpb3VzbHkgY2xh
aW0gdGhhdCB0aGF0Cj4gPiA+IExpbnV4IGlzIGZvciBidXNpbmVzcyBvbmx5Lgo+ID4gPgo+ID4g
PiBPZnRlbiB0aGUgb2xkIGhhcmR3YXJlIGlzIGJ1aWx0IGZhciBiYXR0ZXIgdGhhbiB0aGUgbW9k
ZXJuIGp1bmssIGFuZAo+ID4gPiB3aWxsIGNvbnRpbnVlIHRvIHJ1biBmb3IgeWVhcnMgdG8gY29t
ZS4gVGhpcyBncm91cCBvZiBmb2xrcyBlaXRoZXIgaGFzCj4gPiA+IGV4aXN0aW5nIGhhcmR3YXJl
IHRoZXkgd2lzaCB0byBjb250aW51ZSB0byB1c2UsIG9yIGFyZSBhY3F1aXJpbmcgdGhlCj4gPiA+
IHNhbWUgYmVjYXVzZSB0aGV5IGFyZSB0aXJlZCBvZiBnZW5lcmljIGxvY2tlZC1kb3duIGhhcmR3
YXJlLgo+ID4gPgo+ID4gPiBBIHNpZ25pZmljYW50IHBlcmNlbnRhZ2Ugb2YgdGhlIHZpZGVvIGhh
cmR3YXJlIHRoYXQgZmFsbHMgaW4gdGhlIHJldHJvCj4gPiA+IGNhdGVnb3J5IHVzZXMgdGhlIEFH
UCB2aWRlbyBidXMuIFJlbW92aW5nIHRoYXQgc3VwcG9ydCBmb3IgdGhvc2UgY2FzZXMKPiA+ID4g
d2hlcmUgaXQgd29ya3Mgd291bGQgc2V2ZXJlbHkgbGltaXQgcGVyZm9ybWFuY2UgYW5kIGluIHNv
bWUgY2FzZXMKPiA+ID4gZnVuY3Rpb25hbGl0eS4gVGhpcyBjYW4gbWVhbiB0aGUgZGlmZmVyZW5j
ZSBiZXR3ZWVuIGJlaW5nIGFibGUgdG8gcnVuCj4gPiA+IGFuIGFwcGxpY2F0aW9uLCBvciBoYXZp
bmcgaXQgZmFpbC4KPiA+ID4KPiA+Cj4gPiBOb3RlIHRoZXJlIGlzIG5vIGxvc3Mgb2YgZnVuY3Rp
b25hbGl0eSBoZXJlLCBhdCBsZWFzdCBvbiByYWRlb24KPiA+IGhhcmR3YXJlLiAgSXQganVzdCBj
b21lcyBkb3duIHRvIHdoaWNoIE1NVSBnZXRzIHVzZWQgZm9yIGFjY2VzcyB0bwo+ID4gc3lzdGVt
IG1lbW9yeSwgdGhlIEFHUCBNTVUgb24gdGhlIGNoaXBzZXQgb3IgdGhlIE1NVSBidWlsdCBpbnRv
IHRoZQo+ID4gR1BVLiAgT24gcG93ZXJwYyBoYXJkd2FyZSwgQUdQIGhhcyBiZWVuIHBhcnRpY3Vs
YXJseSB1bnN0YWJsZSwgYW5kIEFHUAo+ID4gaGFzIGJlZW4gZGlzYWJsZWQgYnkgZGVmYXVsdCBv
biByYWRlb24gb24gcG93ZXJwYyBmb3IgeWVhcnMgbm93LiAgSW4KPiA+IGZhY3QsIHRoaXMgd2ls
bCBwcm9iYWJseSBtYWtlIG9sZGVyIGhhcmR3YXJlIG1vcmUgcmVsaWFibGUgYXMgaXQgdGFrZXMK
PiA+IEFHUCBvdXQgb2YgdGhlIGVxdWF0aW9uLgo+ID4KPgo+IEZyb20gbWVtb3J5IHRoZXJlIGlz
IHF1aXRlIGEgbG9zcyBpbiBzcGVlZCB0aG91Z2gsIGxpa2UgcHJldHR5IHNldmVyZS4KPgo+IFRo
ZSByYWRlb24gUENJIEdBUlQgaGFzIGEgc2luZ2xlIHNsb3QgVExCLCBpZiBtZW1vcnkgc2VydmVz
Lgo+Cj4gSSB0aGluayB0aGlzIGlzIGdvaW5nIHRvIGJlIGEgaGFyZCBzZWxsIGF0IHRoaXMgc3Rh
Z2UsIEknbSBndWVzc2luZwo+IHVzZXJzIHdpbGwgY3Jhd2wgb3V0IG9mIHRoZSB3b29kd29yaywg
SSdtIHN1cmUgd2l0aCAyIGhvdXJzIGFmdGVyIEknbQo+IGFibGUgdG8gYWNjZXNzIHRoZSBvZmZp
Y2UsIEkgY2FuIGJvb3QgdGhlIDg2NSBBR1AgYm94IHdpdGggYW4gcnYzNTAgaW4KPiBpdCBvbiBh
IG1vZGVybiBkaXN0cm8uCj4KSSBoYXZlIGEgc3lzdGVtIHdpdGggbmZvcmNlMiBtb3RoZXJib2Fy
ZCBhbmQgTnZpZGlhIGZ4NTUwMCBHUFUuIEkKY291bGQgZHVzdCBpdCBvZmYgYW5kIHNvbWUgcXVp
Y2sgcGVyZm9ybWFuY2UgdGVzdHMgb3ZlciB0aGUgd2Vla2VuZC4KClVubGVzcyBzb21lb25lIGJl
YXRzIG1lIHRvIGl0LCBvZiBjb3Vyc2UgOi0pCgotRW1pbApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
