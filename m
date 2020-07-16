Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9593D222A2A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jul 2020 19:43:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9755D6ECB3;
	Thu, 16 Jul 2020 17:43:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F2376ECA9
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 17:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nfUXCwgJ3xLhzLLyn9n5x7zqk1f2w9l5Rutjwzm+PeY=; b=IbXNmHMeiHGlizyfko5nDt+fTM
 8PDL5FOsqLGCsEnO3kCInuz3XvH9uOM5/AMyCpqSRVnvoMefOPCHHjA6YcJXU4M8SjXhZeEgv2PiA
 3rtPNOUyb3f3Bw83K/ivB73pPxu7rDQBeu6B7Fr5aShujbHr6moxuloDLO7FZY+Y0XJyPVH6ZVS+C
 SRf48LFLWWgjQFh8xxYLQ1prmvB5CsO8Y4Ft+zAnvEZEVaPDi0Uaglxmw6ouMBjANOxJLaL5MD9iz
 QPBxOssXbUhkRwZGcW0mAOkOdaBtdXSBLcSAxTLZoiYV3kJji1n1UQMvz3R43tV1Xm5RT47kYWTkV
 rjt6y0PQ==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:50035
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1jw7v4-0000Wx-8D; Thu, 16 Jul 2020 19:43:42 +0200
Subject: Re: [PATCH v3 0/6] Generic USB Display driver
To: Peter Stuge <peter@stuge.se>
References: <20200529175643.46094-1-noralf@tronnes.org>
 <20200709163235.360054-1-lkundrak@v3.sk>
 <1280ec51-7528-b993-3110-f6c28e98832c@tronnes.org>
 <20200714174008.16272.qmail@stuge.se>
 <befd06f1-d0cc-ab26-3ec1-5da3f3ab3f37@tronnes.org>
 <20200714193841.18494.qmail@stuge.se>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <915b4e6b-2d54-800c-0bbf-099504c70c69@tronnes.org>
Date: Thu, 16 Jul 2020 19:43:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200714193841.18494.qmail@stuge.se>
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
Cc: Lubomir Rintel <lkundrak@v3.sk>, linux-usb@vger.kernel.org,
 sam@ravnborg.org, dri-devel@lists.freedesktop.org, balbi@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMTQuMDcuMjAyMCAyMS4zOCwgc2tyZXYgUGV0ZXIgU3R1Z2U6Cj4gTm9yYWxmIFRyw7hu
bmVzIHdyb3RlOgo+Pj4gSW4gYWxsIGNhc2VzLCB0aGUgZHJpdmVyIG9uIHRoZSBob3N0IGtub3dz
L2hhcyBhdmFpbGFibGUgaG93IG1hbnkgYnl0ZXMKPj4+IHdlcmUgc3VjY2Vzc2Z1bGx5IHRyYW5z
ZmVyZWQuCj4+Cj4+IEkgd2FzIHRoaW5raW5nIGFib3V0IHRoZSBkZXZpY2UsIHRoYXQgaXQgY291
bGQgZ2V0IG91dCBvZiBzeW5jLiBMZXQncwo+PiBzYXkgdGhlIGhvc3Qgc2VuZHMgYSAxayBmcmFt
ZWJ1ZmZlciBhbmQgaGFsZiBvZiBpdCBnZXRzIHRyYW5zZmVycmVkIGFuZAo+PiB0aGUgcmVzdCBm
YWlscyBmb3Igc29tZSByZWFzb24uIEx1Ym9taXIncyBNQ1UgaW1wbGVtZW50YXRpb24gaGFzIGFu
Cj4+IGVuZHBvaW50IG1heCBzaXplIG9mIDY0IGJ5dGVzIGFuZCBhIGNhbGxiYWNrIGlzIGNhbGxl
ZCBmb3IgZWFjaCBwYWNrZXQuCj4+IElmIHRoZSAxayB0cmFuc2ZlciBmYWlscyBhdCBzb21lIHBv
aW50LCB3aWxsIHRoZSBkZXZpY2UgYmUgYWJsZSB0bwo+PiBkZXRlY3QgdGhpcyBhbmQga25vdyB0
aGF0IHRoZSBuZXh0IHRpbWUgdGhlIHJ4IGNhbGxiYWNrIGlzIGNhbGxlZCB0aGF0Cj4+IHRoaXMg
aXMgdGhlIHN0YXJ0IG9mIGEgbmV3IGZyYW1lYnVmZmVyIHVwZGF0ZT8KPiAKPiBBaCEgTm8sIGEg
ZGV2aWNlIGNhbiBub3QgZGV0ZWN0IHRoYXQgdGhlIGhvc3QgaW50ZW5kZWQgdG8gc2VuZCBtb3Jl
IChidWxrKQo+IHBhY2tldHMgYnV0IGUuZy4gdGltZWQgb3V0Lgo+IAo+IEkgY2FuJ3QgaW1tZWRp
YXRlbHkgdGhpbmsgb2Ygb3RoZXIgcmVhc29ucyBmb3IgYSBsYXJnZXIgdHJhbnNmZXIgdG8gZmFp
bCwKPiB3aGljaCBzdGlsbCBhbGxvdyBjb21tdW5pY2F0aW9uIHRvIGNvbnRpbnVlLgo+IAo+IFdo
ZW4gdGhlIGhvc3QgcmVjb2duaXplcyBhIHRpbWVvdXQgd2l0aCBwYXJ0aWFsIGRhdGEgdHJhbnNm
ZXIgaXQgY291bGQKPiBzaW1wbHkgc2VuZCB0aGUgcmVtYWluaW5nIGRhdGEgaW4gYSBuZXcgdHJh
bnNmZXIuCj4gCj4gCj4gV2hpbGUgdGhlIGRldmljZSBjYW4gbm90IGRldGVjdCBob3N0IGludGVu
dCwgdGhlIHByb3RvY29sIGNvdWxkIGFsbG93Cj4gZGV2aWNlcyB0byBzcGVjaWZ5IHJlcXVpcmVt
ZW50cywgZS5nLiB0aGF0IHRoZSBob3N0IGFsd2F5cyBzZW5kcyBmdWxsIGZyYW1lcy4KPiAKPiBJ
biBhbnkgY2FzZSwgcGxlYXNlIGF2b2lkIG1ha2luZyBhIGNvbnRyb2wgcmVxdWVzdCBtYW5kYXRv
cnkgZm9yIGZyYW1lCj4gdHJhbnNmZXIuCj4gCj4gQmVjYXVzZSBjb250cm9sIHJlcXVlc3RzIGFy
ZSBzY2hlZHVsZWQgZGlmZmVyZW50bHkgb250byB0aGUgd2lyZSBhbmQKPiBiZWNhdXNlIHRoZXkg
Y29uc2lzdCBvZiBtb3JlIHBhY2tldHMgdGhhbiBidWxrIGRhdGEsIGEgY29udHJvbCByZXF1ZXN0
Cj4gd2lsbCBpbnRlcnJ1cHQgYSBidWxrIGRhdGEgc3RyZWFtIGFuZCBsaWtlbHkgaW50cm9kdWNl
IHVubmVjY2Vzc2FyeSBsYXRlbmN5Lgo+IAo+IElmIHN5bmNocm9uaXphdGlvbiBpcyBhbHdheXMg
cmVxdWlyZWQgdGhlbiBJJ2Qgc3VnZ2VzdCB0byBwbGFjZSBpdCBpbmxpbmUKPiB3aXRoIGZyYW1l
IGRhdGEsIGUuZy4gaW4gdGhlIGZpcnN0IHBhY2tldCBieXRlLgo+IAo+IElmIHN5bmNocm9uaXph
dGlvbiBpcyBvbmx5IHJlcXVpcmVkIGluIHJhcmUgY2FzZXMgdGhlbiBhIGNvbnRyb2wgdHJhbnNm
ZXIKPiBpcyBwcm9iYWJseSB0aGUgYmV0dGVyIGNob2ljZSwgdG8gbm90IHdhc3RlIGFueSBpbmxp
bmUgYnl0ZXMuCj4gCj4gQnV0IHRoZSBvcHRpbXVtIHdvdWxkIGJlIHRoYXQgdGhlIGRldmljZSBj
YW4gZGVzY3JpYmUgaXRzIG5lZWRzIHRvIHRoZSBob3N0Cj4gYW5kIHRoZSBob3N0IGRyaXZlciBl
bnN1cmVzIHRoYXQgdGhlIGRldmljZSBhbHdheXMgcmVjZWl2ZXMgdGhlIGRhdGEgaXQgbmVlZHMu
Cj4gCj4gRG8geW91IHRoaW5rIHRoaXMgaXMgcG9zc2libGU/Cj4gCgpMb29raW5nIGF0IHRoZSBo
b3N0IGRyaXZlciBJIHNlZSB0aGF0IEkgbmVlZCB0byBmaXggaXQgc28gdGhhdCBpdApyZXF1ZXVl
cyB0aGUgdXBkYXRlIGlmIGl0IGZhaWxzIChvbiBTRVRfQlVGRkVSIG9yIGJ1bGsgb3V0KS4gQ3Vy
cmVudGx5Cml0IGp1c3QgZ29lcyBiYWNrIHRvIHNsZWVwIHdhaXRpbmcgZm9yIHVzZXJzcGFjZSB0
byBhbm5vdW5jZSBhIG5ldyBjaGFuZ2UuCgpJIHdvdWxkIGxpa2UgdG8gYXZvaWQgaGF2aW5nIGEg
c3BlY2lhbCBjYXNlIGZvciByZXRyeWluZyB0aGUgZmFpbGluZwpwYXJ0IG9mIGEgYnVsayB0cmFu
c2ZlciBmb3IgZGV2aWNlcyB0aGF0IG9ubHkgd2FudCBmdWxsIHVwZGF0ZXMsIEkgd291bGQKcHJl
ZmVyIHRvIHVzZSB0aGUgY29tbW9uIGVycm9yIHBhdGggb2YgcmV0cnlpbmcgdGhlIHdob2xlIHVw
ZGF0ZS4KClRoaXMgaXMgbXkgc3VnZ2VzdGlvbiBmb3IgdGhlIG5ldyBmbGFnOgoKLyoKICogQWx3
YXlzIHNlbmQgdGhlIGVudGlyZSBmcmFtZWJ1ZmZlciB3aGVuIGZsdXNoaW5nIGNoYW5nZXMuCiAq
IFRoZSBHVURfRFJNX1VTQl9SRVFfU0VUX0JVRkZFUiByZXF1ZXN0IHdpbGwgbm90IGJlIHNlbnQg
YmVmb3JlIGVhY2gKYnVsayB0cmFuc2ZlciwKICogaXQgd2lsbCBvbmx5IGJlIHNlbnQgaWYgdGhl
IHByZXZpb3VzIGJ1bGsgdHJhbnNmZXIgaGFkIGZhaWxlZC4gVGhpcwppcyBkb25lIHRvCiAqIGlu
Zm9ybSB0aGUgZGV2aWNlIHRoYXQgdGhlIHByZXZpb3VzIHVwZGF0ZSBmYWlsZWQgYW5kIHRoYXQg
YSBuZXcgb25lCmlzIHN0YXJ0ZWQuCiAqCiAqIFRoaXMgZmxhZyBjYW4gbm90IGJlIHVzZWQgaW4g
Y29tYmluYXRpb24gd2l0aCBjb21wcmVzc2lvbi4KICovCiNkZWZpbmUgR1VEX0RSTV9ESVNQTEFZ
X0ZMQUdfRlVMTF9VUERBVEUJQklUKDEpCgoKTm9yYWxmLgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
