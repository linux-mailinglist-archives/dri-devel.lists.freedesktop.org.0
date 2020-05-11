Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED7A1CE5D3
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 22:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 920306E54C;
	Mon, 11 May 2020 20:43:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06CC96E54C;
 Mon, 11 May 2020 20:43:14 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id n5so6005036wmd.0;
 Mon, 11 May 2020 13:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EIZyBmvet1t7hUUn8aqK578gMpc6CvlM2SMJuDGmRUE=;
 b=dqnBD60rvERY6CyspR5CSwxYFtiadhs/WYQWBbZb42Bf/qvnajwgvOaZaIBO1bIS7W
 5xNlx4w8wsEprNwXkyF/3Qv3XSkarvt28ATyEVz/vqKR051acgvsjhsqComx3rHjEnkj
 37U/YDknIVG0b1WjL0JVkAXBaN122YKfRA6hBexpAgFyO8ZPGxwoh7SRjVJ0iin7XfGP
 AWecowC6A+ejlG8wRTAd0Q6PpBkjwSw2M+CBZGLi5gmVeVev4MR6tyULtOIr1Pmvo4ky
 YSnxfK6kLpH0vOWxUSxshOZWywe4ogUwVagBrQqzHrw8+n92SB3q4V1TRxLhKmBbbUvb
 wHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EIZyBmvet1t7hUUn8aqK578gMpc6CvlM2SMJuDGmRUE=;
 b=F20KRDPQs47eiObzeFfpAk8lW6bsWcO2sRH1AW+54E4sk/ee1jjXDee5Occ96Z6MmI
 tHRiaNXYFnhH7VoeNauvVsdOvGNayi0mpAjyQ1cLWcLyQkpdsFUJyR4nWksW36OC7fVX
 wUiHdeu7MpJnyvwhVIFUiJPxlXw61tBquR+xyCuoiSUlS3ohQxdf24/7Eaa4aUkdRolb
 QZsH5oxrTRVCXKDu0HYwvnUwAH5EJ68YTUujckt7WTpBmaVtYAjg91UmwGgts4X8d4N6
 iFxqokk6RhY+x/5CNmGat/zxTCRDzK+M6tc5AcsdhpmbBLNSVJycd7TysLicrER50hKY
 4VpQ==
X-Gm-Message-State: AGi0PuZ+Uxv3Af5NhWnRexVthACNJ+SBgf7qWnONXZwgftOYn/itCVgc
 HRtVwAAaLjHGo6L4CYG6EEIF5Wc+GiIePHeadpQ=
X-Google-Smtp-Source: APiQypLxyCJFdFV9Qm//NvpE4qn+/vftRfogoxrpif/Gh9ViX/QXl3i0Ro/QpJK55OSiJ3g5awdrlBMxgCYRrpo9z2U=
X-Received: by 2002:a7b:cb0c:: with SMTP id u12mr36194118wmj.137.1589229793486; 
 Mon, 11 May 2020 13:43:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200511171722.96576-1-christian.koenig@amd.com>
 <1815605280.20200511161440@sympatico.ca>
 <CADnq5_MYPcAoWzCcBkJAkd858gCVbJpCJobiwH_BBbwgEdx5rA@mail.gmail.com>
In-Reply-To: <CADnq5_MYPcAoWzCcBkJAkd858gCVbJpCJobiwH_BBbwgEdx5rA@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 12 May 2020 06:43:01 +1000
Message-ID: <CAPM=9tysbcgQ-KR8+icQ=3e6+SECxkwHdVpP8=w0Pmh9ML_+Lw@mail.gmail.com>
Subject: Re: [RFC] Remove AGP support from Radeon/Nouveau/TTM
To: Alex Deucher <alexdeucher@gmail.com>
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
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxMiBNYXkgMjAyMCBhdCAwNjoyOCwgQWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hlckBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBNYXkgMTEsIDIwMjAgYXQgNDoyMiBQTSBBbCBE
dW5zbXVpciA8YWwuZHVuc211aXJAc3ltcGF0aWNvLmNhPiB3cm90ZToKPiA+Cj4gPiBPbiBNb25k
YXksIE1heSAxMSwgMjAyMCwgMToxNzoxOSBQTSwgIkNocmlzdGlhbiBLw7ZuaWciIHdyb3RlOgo+
ID4gPiBIaSBndXlzLAo+ID4KPiA+ID4gV2VsbCBsZXQncyBmYWNlIGl0IEFHUCBpcyBhIHRvdGFs
IGhlYWRhY2hlIHRvIG1haW50YWluIGFuZCBkZWFkIGZvciBhdCBsZWFzdCAxMCsgeWVhcnMuCj4g
Pgo+ID4gPiBXZSBoYXZlIGEgbG90IG9mIHg4NiBzcGVjaWZpYyBzdHVmZiBpbiB0aGUgYXJjaGl0
ZWN0dXJlIGluZGVwZW5kZW50Cj4gPiA+IGdyYXBoaWNzIG1lbW9yeSBtYW5hZ2VtZW50IHRvIGdl
dCB0aGUgY2FjaGluZyByaWdodCwgYWJ1c2luZyB0aGUgRE1BCj4gPiA+IEFQSSBvbiBtdWx0aXBs
ZSBvY2Nhc2lvbnMsIG5lZWQgdG8gZGlzdGluY3QgYmV0d2VlbiBBR1AgYW5kIGRyaXZlciBzcGVj
aWZpYyBwYWdlIHRhYmxlcyBldGMgZXRjLi4uCj4gPgo+ID4gPiBTbyB0aGUgaWRlYSBoZXJlIGlz
IHRvIGp1c3QgZ28gYWhlYWQgYW5kIHJlbW92ZSB0aGUgc3VwcG9ydCBmcm9tCj4gPiA+IFJhZGVv
biBhbmQgTm91dmVhdSBhbmQgdGhlbiBkcm9wIHRoZSBuZWNlc3NhcnkgY29kZSBmcm9tIFRUTS4K
PiA+Cj4gPiA+IEZvciBSYWRlb24gdGhpcyBtZWFucyB0aGF0IHdlIGp1c3Qgc3dpdGNoIG92ZXIg
dG8gdGhlIGRyaXZlcgo+ID4gPiBzcGVjaWZpYyBwYWdlIHRhYmxlcyBhbmQgZXZlcnl0aGluZyBz
aG91bGQgbW9yZSBvciBsZXNzIGNvbnRpbnVlIHRvIHdvcmsuCj4gPgo+ID4gPiBGb3IgTm91dmVh
dSBJJ20gbm90IDEwMCUgc3VyZSwgYnV0IGZyb20gdGhlIGNvZGUgaXQgb2YgaGFuZCBsb29rcwo+
ID4gPiBsaWtlIHdlIGNhbiBkbyBpdCBzaW1pbGFyIHRvIFJhZGVvbi4KPiA+Cj4gPiA+IFBsZWFz
ZSBjb21tZW50IHdoYXQgeW91IHRoaW5rIGFib3V0IHRoaXMuCj4gPgo+ID4gPiBSZWdhcmRzLAo+
ID4gPiBDaHJpc3RpYW4uCj4gPgo+ID4gQ2hyaXN0aWFuLAo+ID4KPiA+IEkgd291bGQgcmVzcGVj
dGZ1bGx5IGFzayB0aGF0IHRoaXMgY2hhbmdlIGJlIHJlamVjdGVkLgo+ID4KPiA+IEknbSAgY3Vy
cmVudGx5ICBhbiAgZW5kIHVzZXIgb24gYm90aCBJbnRlbCAoMzItYml0IGFuZCA2NC1iaXQpIGFu
ZCBQUEMKPiA+IChNYWNzLCBJQk0gUG93ZXIgLSBCRSBhbmQgTEUpLgo+ID4KPiA+IExpbnV4IGlz
IG5vdCBqdXN0IHVzZWQgZm9yIG1vZGVybiBoYXJkd2FyZS4gVGhlcmUgaXMgYWxzbyBhIHN1YnNl
dCBvZgo+ID4gdGhlIHVzZXIgYmFzZSB0aGF0IHVzZXMgaXQgZm9yIHdoYXQgaXMgb2Z0ZW4gdGVy
bWVkIHJldHJvLWNvbXB1dGluZy4KPiA+IE5vIGl0J3Mgbm90IGNvbW1lcmNpYWwgdXNhZ2UsIGJ1
dCBubyBvbmUgY2FuIHNlcmlvdXNseSBjbGFpbSB0aGF0IHRoYXQKPiA+IExpbnV4IGlzIGZvciBi
dXNpbmVzcyBvbmx5Lgo+ID4KPiA+IE9mdGVuIHRoZSBvbGQgaGFyZHdhcmUgaXMgYnVpbHQgZmFy
IGJhdHRlciB0aGFuIHRoZSBtb2Rlcm4ganVuaywgYW5kCj4gPiB3aWxsIGNvbnRpbnVlIHRvIHJ1
biBmb3IgeWVhcnMgdG8gY29tZS4gVGhpcyBncm91cCBvZiBmb2xrcyBlaXRoZXIgaGFzCj4gPiBl
eGlzdGluZyBoYXJkd2FyZSB0aGV5IHdpc2ggdG8gY29udGludWUgdG8gdXNlLCBvciBhcmUgYWNx
dWlyaW5nIHRoZQo+ID4gc2FtZSBiZWNhdXNlIHRoZXkgYXJlIHRpcmVkIG9mIGdlbmVyaWMgbG9j
a2VkLWRvd24gaGFyZHdhcmUuCj4gPgo+ID4gQSBzaWduaWZpY2FudCBwZXJjZW50YWdlIG9mIHRo
ZSB2aWRlbyBoYXJkd2FyZSB0aGF0IGZhbGxzIGluIHRoZSByZXRybwo+ID4gY2F0ZWdvcnkgdXNl
cyB0aGUgQUdQIHZpZGVvIGJ1cy4gUmVtb3ZpbmcgdGhhdCBzdXBwb3J0IGZvciB0aG9zZSBjYXNl
cwo+ID4gd2hlcmUgaXQgd29ya3Mgd291bGQgc2V2ZXJlbHkgbGltaXQgcGVyZm9ybWFuY2UgYW5k
IGluIHNvbWUgY2FzZXMKPiA+IGZ1bmN0aW9uYWxpdHkuIFRoaXMgY2FuIG1lYW4gdGhlIGRpZmZl
cmVuY2UgYmV0d2VlbiBiZWluZyBhYmxlIHRvIHJ1bgo+ID4gYW4gYXBwbGljYXRpb24sIG9yIGhh
dmluZyBpdCBmYWlsLgo+ID4KPgo+IE5vdGUgdGhlcmUgaXMgbm8gbG9zcyBvZiBmdW5jdGlvbmFs
aXR5IGhlcmUsIGF0IGxlYXN0IG9uIHJhZGVvbgo+IGhhcmR3YXJlLiAgSXQganVzdCBjb21lcyBk
b3duIHRvIHdoaWNoIE1NVSBnZXRzIHVzZWQgZm9yIGFjY2VzcyB0bwo+IHN5c3RlbSBtZW1vcnks
IHRoZSBBR1AgTU1VIG9uIHRoZSBjaGlwc2V0IG9yIHRoZSBNTVUgYnVpbHQgaW50byB0aGUKPiBH
UFUuICBPbiBwb3dlcnBjIGhhcmR3YXJlLCBBR1AgaGFzIGJlZW4gcGFydGljdWxhcmx5IHVuc3Rh
YmxlLCBhbmQgQUdQCj4gaGFzIGJlZW4gZGlzYWJsZWQgYnkgZGVmYXVsdCBvbiByYWRlb24gb24g
cG93ZXJwYyBmb3IgeWVhcnMgbm93LiAgSW4KPiBmYWN0LCB0aGlzIHdpbGwgcHJvYmFibHkgbWFr
ZSBvbGRlciBoYXJkd2FyZSBtb3JlIHJlbGlhYmxlIGFzIGl0IHRha2VzCj4gQUdQIG91dCBvZiB0
aGUgZXF1YXRpb24uCj4KCkZyb20gbWVtb3J5IHRoZXJlIGlzIHF1aXRlIGEgbG9zcyBpbiBzcGVl
ZCB0aG91Z2gsIGxpa2UgcHJldHR5IHNldmVyZS4KClRoZSByYWRlb24gUENJIEdBUlQgaGFzIGEg
c2luZ2xlIHNsb3QgVExCLCBpZiBtZW1vcnkgc2VydmVzLgoKSSB0aGluayB0aGlzIGlzIGdvaW5n
IHRvIGJlIGEgaGFyZCBzZWxsIGF0IHRoaXMgc3RhZ2UsIEknbSBndWVzc2luZwp1c2VycyB3aWxs
IGNyYXdsIG91dCBvZiB0aGUgd29vZHdvcmssIEknbSBzdXJlIHdpdGggMiBob3VycyBhZnRlciBJ
J20KYWJsZSB0byBhY2Nlc3MgdGhlIG9mZmljZSwgSSBjYW4gYm9vdCB0aGUgODY1IEFHUCBib3gg
d2l0aCBhbiBydjM1MCBpbgppdCBvbiBhIG1vZGVybiBkaXN0cm8uCgpNYXliZSB3ZSBjYW4gZmlu
ZCBzb21lIHdheSB0byBjb21wYXJ0bWVudGFsaXNlIEFHUCBmdXJ0aGVyPwoKRGF2ZS4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
