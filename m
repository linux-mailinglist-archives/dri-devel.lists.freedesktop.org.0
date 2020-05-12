Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A85B1D0B83
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 11:09:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FAB56E1ED;
	Wed, 13 May 2020 09:09:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mupuf.org (mupuf.org [167.71.42.210])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5853B6E983
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 20:52:36 +0000 (UTC)
Received: from [131.111.247.158] (unknown [131.111.247.158])
 by Neelix.spliet.org (Postfix) with ESMTPSA id 7C83F60069;
 Tue, 12 May 2020 21:52:31 +0100 (BST)
DKIM-Filter: OpenDKIM Filter v2.11.0 Neelix.spliet.org 7C83F60069
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spliet.org;
 s=default; t=1589316751;
 bh=QxNAjllyL411XRfFd2j9T+M8m0gpBrdynhZPokKmeHY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Zmme1FWN0cie1MA/vRRVLTcqHe1aviavUYAe15XMVeWiCTzBCXtCuylC+WVO6jeXt
 4Jya15RrVF5WumOI+DidkGJ0CqvbyDdUr5xuOBkZpnIqHxvqpqI38VSt1258D9cPAc
 3Smu3hH4uQoKNnReCpSeULt8YzEr7s/XolAfJtxE=
Subject: Re: [Nouveau] [PATCH 1/3] drm/radeon: remove AGP support
To: Alex Deucher <alexdeucher@gmail.com>, =?UTF-8?Q?Michel_D=c3=a4nzer?=
 <michel@daenzer.net>
References: <20200511171722.96576-1-christian.koenig@amd.com>
 <20200511171722.96576-2-christian.koenig@amd.com>
 <CADnq5_MyO_L+1w69qDLzhg34W6Qer-uSRR2tb7-2uXLC_6PXSg@mail.gmail.com>
 <ba0b1ab7-3078-a6f2-41cd-326ca21ee99f@daenzer.net>
 <CADnq5_MdbJUXs7wbG=HCOKj4Vp_NmLkcJng=EXynSXPe9gsyOQ@mail.gmail.com>
From: Roy Spliet <nouveau@spliet.org>
Message-ID: <777c08d1-3ac3-16ca-0222-e2d62c281e50@spliet.org>
Date: Tue, 12 May 2020 21:52:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CADnq5_MdbJUXs7wbG=HCOKj4Vp_NmLkcJng=EXynSXPe9gsyOQ@mail.gmail.com>
Content-Language: en-GB
X-Spam-Status: No, score=-3.1 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,URIBL_BLOCKED
 autolearn=ham autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on Neelix
X-Virus-Scanned: clamav-milter 0.102.2 at Neelix
X-Virus-Status: Clean
X-Mailman-Approved-At: Wed, 13 May 2020 09:09:29 +0000
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T3AgMTItMDUtMjAyMCBvbSAxNDozNiBzY2hyZWVmIEFsZXggRGV1Y2hlcjoKPiBPbiBUdWUsIE1h
eSAxMiwgMjAyMCBhdCA0OjE2IEFNIE1pY2hlbCBEw6RuemVyIDxtaWNoZWxAZGFlbnplci5uZXQ+
IHdyb3RlOgo+Pgo+PiBPbiAyMDIwLTA1LTExIDEwOjEyIHAubS4sIEFsZXggRGV1Y2hlciB3cm90
ZToKPj4+IE9uIE1vbiwgTWF5IDExLCAyMDIwIGF0IDE6MTcgUE0gQ2hyaXN0aWFuIEvDtm5pZwo+
Pj4gPGNrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29tPiB3cm90ZToKPj4+Pgo+Pj4+IEFH
UCBpcyBkZXByZWNhdGVkIGZvciAxMCsgeWVhcnMgbm93IGFuZCBub3QgdXNlZCBhbnkgbW9yZSBv
biBtb2Rlcm4gaGFyZHdhcmUuCj4+Pj4KPj4+PiBPbGQgaGFyZHdhcmUgc2hvdWxkIGNvbnRpbnVl
IHRvIHdvcmsgaW4gUENJIG1vZGUuCj4+Pgo+Pj4gTWlnaHQgd2FudCB0byBjbGFyaWZ5IHRoYXQg
dGhlcmUgaXMgbm8gbG9zcyBvZiBmdW5jdGlvbmFsaXR5IGhlcmUuCj4+PiBTb21ldGhpbmcgbGlr
ZToKPj4+Cj4+PiAiVGhlcmUgaXMgbm8gbG9zcyBvZiBmdW5jdGlvbmFsaXR5IGhlcmUuICBHUFVz
IHdpbGwgY29udGludWUgdG8KPj4+IGZ1bmN0aW9uLiAgVGhpcyBqdXN0IGRyb3BzIHRoZSB1c2Ug
b2YgdGhlIEFHUCBNTVUgaW4gdGhlIGNoaXBzZXQgaW4KPj4+IGZhdm9yIG9mIHRoZSBNTVUgb24g
dGhlIGRldmljZSB3aGljaCBoYXMgcHJvdmVuIHRvIGJlIG11Y2ggbW9yZQo+Pj4gcmVsaWFibGUu
ICBEdWUgdG8gaXRzIHVucmVsaWFiaWxpdHksIEFHUCBzdXBwb3J0IGhhcyBiZWVuIGRpc2FibGVk
IG9uCj4+PiBQb3dlclBDIGZvciB5ZWFycyBhbHJlYWR5IHNvIHRoZXJlIGlzIG5vIGNoYW5nZSBv
biBQb3dlclBDLiIKPj4KPj4gVGhlcmUncyBhIGRpZmZlcmVuY2UgYmV0d2VlbiBzb21ldGhpbmcg
YmVpbmcgZGlzYWJsZWQgYnkgZGVmYXVsdCBvciBub3QKPj4gYmVpbmcgYXZhaWxhYmxlIGF0IGFs
bC4gV2UgbWF5IGRlY2lkZSBpdCdzIHdvcnRoIGl0IGFueXdheSwgYnV0IGxldCdzIGRvCj4+IGl0
IGJhc2VkIG9uIGZhY3RzLgo+Pgo+IAo+IEkgZGlkbid0IG1lYW4gdG8gaW1wbHkgdGhhdCBBR1Ag
R0FSVCBzdXBwb3J0IHdhcyBhbHJlYWR5IHJlbW92ZWQuICBCdXQKPiBmb3IgdGhlIHZhc3QgbWFq
b3JpdHkgb2YgdXNlcnMgdGhlIGVuZCByZXN1bHQgaXMgdGhlIHNhbWUuICBJZiB5b3UKPiBrbmV3
IGVub3VnaCByZS1lbmFibGUgQUdQIEdBUlQsIHlvdSBwcm9iYWJseSB3b3VsZG4ndCBoYXZlIGJl
ZW4gYXMKPiBjb25mdXNlZCBhYm91dCB3aGF0IHRoaXMgcGF0Y2ggc2V0IGRvZXMgZWl0aGVyLiAg
VG8gcmVpdGVyYXRlLCB0aGlzCj4gcGF0Y2ggc2V0IGRvZXMgbm90IHJlbW92ZSBzdXBwb3J0IGZv
ciBBR1AgY2FyZHMsIGl0IG9ubHkgcmVtb3ZlcyB0aGUKPiBzdXBwb3J0IGZvciBBR1AgR0FSVC4g
IFRoZSBjYXJkcyB3aWxsIHN0aWxsIGJlIGZ1bmN0aW9uYWwgdXNpbmcgdGhlCj4gZGV2aWNlIEdB
UlQuICBUaGVyZSBtYXkgYmUgcGVyZm9ybWFuY2UgdHJhZGVvZmZzIHRoZXJlIGluIHNvbWUgY2Fz
ZXMuCgpJJ2xsIHZvbHVudGVlciB0byBiZSB0aGUgb25lIGFza2luZzogaG93IGJpZyBpcyB0aGlz
IHBlcmZvcm1hbmNlIApkaWZmZXJlbmNlPyBIYXZlIGFueSBiZW5jaG1hcmtzIGJlZW4gcnVuIGJl
Zm9yZSBhbmQgYWZ0ZXIgcmVtb3ZhbCBvZiBBR1AgCkdBUlQgY29kZSBvbiBhZmZlY3RlZCBub3V2
ZWF1L3JhZGVvbiBzeXN0ZW1zPyBPciBpcyB0aGlzIGNvZGUgYmVpbmcgCmRyb3BwZWQgX2p1c3Rf
IGJlY2F1c2UgaXQncyBjdW1iZXJzb21lLCB3aXRoIG5vIHJlZ2FyZCBmb3IgbWV0cmljcyB0aGF0
IApkZXRlcm1pbmUgdGhlIHZhbHVlIG9mIEFHUCBHQVJUIHN1cHBvcnQ/CgpSb3kKCj4gCj4gQWxl
eAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTm91
dmVhdSBtYWlsaW5nIGxpc3QKPiBOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo+IAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
