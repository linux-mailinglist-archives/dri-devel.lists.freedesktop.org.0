Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD39F1D0A10
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 09:46:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5ECD6E97C;
	Wed, 13 May 2020 07:46:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 082316E480;
 Wed, 13 May 2020 07:46:26 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id j5so19587727wrq.2;
 Wed, 13 May 2020 00:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=FZ+9EK71j0H8yMkeKLOglVmETJPUNkJ17juMjI8ntEg=;
 b=MG0zygEh/D/JLVBFrXQm+O3kCRToQdbfND84qvwIzJAWzMwxTipre3hElSNuu7VIXt
 pTVMnYjsAlHBi9lJKvEx5BLlO/Td3c3fXVgbSXu36XHKhzq7Hhh/FACXgZSjDMCPS5RE
 eiFLih82OUOtJA4aK7j3JQxDDodP5mK3hBNAypAH1L62VJUSaWsiJU5MaRMws6kw9KyP
 xxqKFm9ym3NhNA5AYmZIPkmjbQI+7yCurkOpy0LbRrpKraa7ePfOayU+78pn55PY4dDX
 h756WcyAXTHIrNBKnY4y7+srbx2Pl3x2jTDXpLU2bnlC4x0NDlS6pd8ERDBAWeGuPqVR
 hlkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=FZ+9EK71j0H8yMkeKLOglVmETJPUNkJ17juMjI8ntEg=;
 b=h3WOUNyfVE32x0LHFw6+K3ixv/mIuXmjI/ldFhAmz1hUbj2n/cVE8c974bi7jQ0qRk
 tbXIPU3yc/OOZdIQe0LSsdl9Rqy+7hdOybPsrpQNmoMuPGIpUcxr2WaIELOBOJs5z789
 rMOxEE2zpME1vr+wFgiqH3k75LoXJvvN2qJ0F2vVK0IXDg10ZKZ4AtXRC8MqKFgSB0cx
 xt12y3W7/BlZonL44C6YAxrdA2R4hJnAY3+pRjaQ9UYaqBLRgVeuZyeslsaP2/44gqqD
 ucRyJgq3acyke5Z9lOzUKYzvSz9xbe7MeSzzzKsxsCnjwNjPGx4rNRm4iW/xKqkDYUxk
 c51A==
X-Gm-Message-State: AGi0PuY8ehSeATESd8sRvHwXKJ7BhFPJMyoFh0GKcAopd2sTHD+QJTzm
 uVwNOHsmZdJ/Z8SLPRVexhBedc+o
X-Google-Smtp-Source: APiQypJu4165CVoDdwZKCjv/x3nBfaFA4cEpErDfh7Y7I3aftjDpBfQeIMXBLhRVQa9KpV8gH/6wUQ==
X-Received: by 2002:adf:e64c:: with SMTP id b12mr28832009wrn.131.1589355984411; 
 Wed, 13 May 2020 00:46:24 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id u74sm35077134wmu.13.2020.05.13.00.46.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 May 2020 00:46:23 -0700 (PDT)
Subject: Re: [Nouveau] [PATCH 1/3] drm/radeon: remove AGP support
To: Alex Deucher <alexdeucher@gmail.com>, Roy Spliet <nouveau@spliet.org>
References: <20200511171722.96576-1-christian.koenig@amd.com>
 <20200511171722.96576-2-christian.koenig@amd.com>
 <CADnq5_MyO_L+1w69qDLzhg34W6Qer-uSRR2tb7-2uXLC_6PXSg@mail.gmail.com>
 <ba0b1ab7-3078-a6f2-41cd-326ca21ee99f@daenzer.net>
 <CADnq5_MdbJUXs7wbG=HCOKj4Vp_NmLkcJng=EXynSXPe9gsyOQ@mail.gmail.com>
 <777c08d1-3ac3-16ca-0222-e2d62c281e50@spliet.org>
 <CADnq5_NK6ziShvkDug5xGHm7oZTf9qEu41gOxvNANQHFD2a-qQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <5c3da9d3-8b77-e97f-28a2-e1083a53a1d7@gmail.com>
Date: Wed, 13 May 2020 09:46:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CADnq5_NK6ziShvkDug5xGHm7oZTf9qEu41gOxvNANQHFD2a-qQ@mail.gmail.com>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: nouveau <nouveau@lists.freedesktop.org>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTIuMDUuMjAgdW0gMjM6MTIgc2NocmllYiBBbGV4IERldWNoZXI6Cj4gT24gVHVlLCBNYXkg
MTIsIDIwMjAgYXQgNDo1MiBQTSBSb3kgU3BsaWV0IDxub3V2ZWF1QHNwbGlldC5vcmc+IHdyb3Rl
Ogo+PiBPcCAxMi0wNS0yMDIwIG9tIDE0OjM2IHNjaHJlZWYgQWxleCBEZXVjaGVyOgo+Pj4gT24g
VHVlLCBNYXkgMTIsIDIwMjAgYXQgNDoxNiBBTSBNaWNoZWwgRMOkbnplciA8bWljaGVsQGRhZW56
ZXIubmV0PiB3cm90ZToKPj4+PiBPbiAyMDIwLTA1LTExIDEwOjEyIHAubS4sIEFsZXggRGV1Y2hl
ciB3cm90ZToKPj4+Pj4gT24gTW9uLCBNYXkgMTEsIDIwMjAgYXQgMToxNyBQTSBDaHJpc3RpYW4g
S8O2bmlnCj4+Pj4+IDxja29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4+
Pj4+PiBBR1AgaXMgZGVwcmVjYXRlZCBmb3IgMTArIHllYXJzIG5vdyBhbmQgbm90IHVzZWQgYW55
IG1vcmUgb24gbW9kZXJuIGhhcmR3YXJlLgo+Pj4+Pj4KPj4+Pj4+IE9sZCBoYXJkd2FyZSBzaG91
bGQgY29udGludWUgdG8gd29yayBpbiBQQ0kgbW9kZS4KPj4+Pj4gTWlnaHQgd2FudCB0byBjbGFy
aWZ5IHRoYXQgdGhlcmUgaXMgbm8gbG9zcyBvZiBmdW5jdGlvbmFsaXR5IGhlcmUuCj4+Pj4+IFNv
bWV0aGluZyBsaWtlOgo+Pj4+Pgo+Pj4+PiAiVGhlcmUgaXMgbm8gbG9zcyBvZiBmdW5jdGlvbmFs
aXR5IGhlcmUuICBHUFVzIHdpbGwgY29udGludWUgdG8KPj4+Pj4gZnVuY3Rpb24uICBUaGlzIGp1
c3QgZHJvcHMgdGhlIHVzZSBvZiB0aGUgQUdQIE1NVSBpbiB0aGUgY2hpcHNldCBpbgo+Pj4+PiBm
YXZvciBvZiB0aGUgTU1VIG9uIHRoZSBkZXZpY2Ugd2hpY2ggaGFzIHByb3ZlbiB0byBiZSBtdWNo
IG1vcmUKPj4+Pj4gcmVsaWFibGUuICBEdWUgdG8gaXRzIHVucmVsaWFiaWxpdHksIEFHUCBzdXBw
b3J0IGhhcyBiZWVuIGRpc2FibGVkIG9uCj4+Pj4+IFBvd2VyUEMgZm9yIHllYXJzIGFscmVhZHkg
c28gdGhlcmUgaXMgbm8gY2hhbmdlIG9uIFBvd2VyUEMuIgo+Pj4+IFRoZXJlJ3MgYSBkaWZmZXJl
bmNlIGJldHdlZW4gc29tZXRoaW5nIGJlaW5nIGRpc2FibGVkIGJ5IGRlZmF1bHQgb3Igbm90Cj4+
Pj4gYmVpbmcgYXZhaWxhYmxlIGF0IGFsbC4gV2UgbWF5IGRlY2lkZSBpdCdzIHdvcnRoIGl0IGFu
eXdheSwgYnV0IGxldCdzIGRvCj4+Pj4gaXQgYmFzZWQgb24gZmFjdHMuCj4+Pj4KPj4+IEkgZGlk
bid0IG1lYW4gdG8gaW1wbHkgdGhhdCBBR1AgR0FSVCBzdXBwb3J0IHdhcyBhbHJlYWR5IHJlbW92
ZWQuICBCdXQKPj4+IGZvciB0aGUgdmFzdCBtYWpvcml0eSBvZiB1c2VycyB0aGUgZW5kIHJlc3Vs
dCBpcyB0aGUgc2FtZS4gIElmIHlvdQo+Pj4ga25ldyBlbm91Z2ggcmUtZW5hYmxlIEFHUCBHQVJU
LCB5b3UgcHJvYmFibHkgd291bGRuJ3QgaGF2ZSBiZWVuIGFzCj4+PiBjb25mdXNlZCBhYm91dCB3
aGF0IHRoaXMgcGF0Y2ggc2V0IGRvZXMgZWl0aGVyLiAgVG8gcmVpdGVyYXRlLCB0aGlzCj4+PiBw
YXRjaCBzZXQgZG9lcyBub3QgcmVtb3ZlIHN1cHBvcnQgZm9yIEFHUCBjYXJkcywgaXQgb25seSBy
ZW1vdmVzIHRoZQo+Pj4gc3VwcG9ydCBmb3IgQUdQIEdBUlQuICBUaGUgY2FyZHMgd2lsbCBzdGls
bCBiZSBmdW5jdGlvbmFsIHVzaW5nIHRoZQo+Pj4gZGV2aWNlIEdBUlQuICBUaGVyZSBtYXkgYmUg
cGVyZm9ybWFuY2UgdHJhZGVvZmZzIHRoZXJlIGluIHNvbWUgY2FzZXMuCj4+IEknbGwgdm9sdW50
ZWVyIHRvIGJlIHRoZSBvbmUgYXNraW5nOiBob3cgYmlnIGlzIHRoaXMgcGVyZm9ybWFuY2UKPj4g
ZGlmZmVyZW5jZT8gSGF2ZSBhbnkgYmVuY2htYXJrcyBiZWVuIHJ1biBiZWZvcmUgYW5kIGFmdGVy
IHJlbW92YWwgb2YgQUdQCj4+IEdBUlQgY29kZSBvbiBhZmZlY3RlZCBub3V2ZWF1L3JhZGVvbiBz
eXN0ZW1zPyBPciBpcyB0aGlzIGNvZGUgYmVpbmcKPj4gZHJvcHBlZCBfanVzdF8gYmVjYXVzZSBp
dCdzIGN1bWJlcnNvbWUsIHdpdGggbm8gcmVnYXJkIGZvciBtZXRyaWNzIHRoYXQKPj4gZGV0ZXJt
aW5lIHRoZSB2YWx1ZSBvZiBBR1AgR0FSVCBzdXBwb3J0Pwo+Pgo+IEkgZG9uJ3QgdGhpbmsgYW55
b25lIGhhcyBhbnkgc29saWQgbnVtYmVycywganVzdCBhbmVjZG90YWwgZnJvbQo+IG1lbW9yeS4g
IEkgY2VydGFpbmx5IGRvbid0IGhhdmUgYW55IGZ1bmN0aW9uYWwgQUdQIHN5c3RlbXMgYXQgdGhp
cwo+IHBvaW50LiAgSXQncyBtb3N0bHkganVzdCBjdW1iZXJzb21lIGFuZCB3b3VsZCBhbGxvdyB1
cyB0byBjbGVhbiB0dG0KPiBhbmQgcHJvYmFibHkgaW1wcm92ZSBzdGFiaWxpdHkgYXQgdGhlIHNh
bWUgdGltZS4gIEF0IGxlYXN0IG9uIHRoZQo+IHJhZGVvbiBzaWRlLCB0aGUgb25seSBuYXRpdmUg
QUdQIGNhcmRzIHdlcmUgcjF4eCwgcjJ4eCwgYW5kIHNvbWUgb2YKPiB0aGUgZWFybHkgcjN4eCBi
b2FyZHMuICBPbmNlIHdlIHN3aXRjaGVkIHRvIHBjaWUgbWlkLXdheSB0aHJvdWdoIHIzeHgsCj4g
ZXZlcnl0aGluZyB3YXMgbmF0aXZlIHBjaWUgYW5kIHRoZSBBR1AgY2FyZHMgdXNlZCBhIHBjaWUg
dG8gQUdQIGJyaWRnZQo+IGNoaXAgc28gdGhleSBoYWQgYSBkZWNlbnQgb24gY2hpcCBNTVUuICBU
aG9zZSBvbGRlciBjYXJkcyB0b3BwZWQgb3V0Cj4gYXQgbWF5YmUgMzIgb3IgNjQgTUIgb2YgdnJh
bSwgc28gdGhleSBhcmUgZ29pbmcgdG8gYmUgaGFyZCBwcmVzc2VkIHRvCj4gZGVhbCB3aXRoIG1v
ZGVybiBkZXNrdG9wcyBhbnl3YXkuICBObyBpZGVhIHdoYXQgc29ydCBvZiBHQVJUCj4gY2FwYWJp
bGl0aWVzIE5WIEFHUCBoYXJkd2FyZSBhdCB0aGlzIHRpbWUgaGFkLgoKSSBjb3VsZCBvbmx5IHRl
c3Qgd2l0aCBhbiBvbGQgeDg2IE1hYyBhbmQgYW4gcjN4eCBnZW5lcmF0aW9uIGh3IGFuZCBpbiAK
dGhpcyBjYXNlIG1ha2luZyB0aGUgc3dpdGNoIGRpZG4ndCBoYWQgYW55IG5vdGljZWFibGUgZWZm
ZWN0IGF0IGFsbC4KCkJ1dCBJIGRpZG4ndCBkbyBtb3JlIHRoYW4gcGxheWluZyBhcm91bmQgd2l0
aCB0aGUgZGVza3RvcCBlZmZlY3RzIGFuZCAKcGxheWluZyBhIHZpZGVvLgoKSSBkbyBoYXZlIGEg
UEMgeDg2IEFHUCBib2FyZCBseWluZyBhcm91bmQgc29tZXdoZXJlIGhlcmUsIGdvaW5nIHRvcCBn
aXZlIAp0aGF0IG9uZSBhIHRyeSBhIHdlbGwuCgpDaHJpc3RpYW4uCgo+Cj4gQWxleAo+Cj4+IFJv
eQo+Pgo+Pj4gQWxleAo+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPj4+IE5vdXZlYXUgbWFpbGluZyBsaXN0Cj4+PiBOb3V2ZWF1QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwo+Pj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9ub3V2ZWF1Cj4+PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
