Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9405B23E733
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 08:23:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F5B6E969;
	Fri,  7 Aug 2020 06:23:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD1816E969
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 06:23:02 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id x24so815562otp.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Aug 2020 23:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ThKvz/9eTksOGF/bwK0J6wv9v9j1Gjc0l+Boj232BiY=;
 b=Ruc6gCqXmCr5Hx+sj46Exbn/1hYMZmn6o9X8Emhm16IkAex34B3fStyptCaqc1f2ER
 CU/iyE4MtyWcRAnNIBCkTojoBn6D6tEDY8wDFW7yxD0I3XBf9wG4DUPNeqxhxrhC77dM
 x8xXHUgqpoJYbkMqGzlXExMS6xoX6JXodCkUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ThKvz/9eTksOGF/bwK0J6wv9v9j1Gjc0l+Boj232BiY=;
 b=ttmuWAEDcDjbWCLwUN1O0M1FVcCCsgXd2tc3b++QmLAOGn7+/YDI+DCYFGg6jLAtQQ
 xtcL3qcAH4wMUkcNctO3HMG85Ehj45oeGvHIn2YsKWT9vk9rR2LDlwflu+F4EU5pPupb
 Voyh0PQO5EwnTZ5nfr/WqhcL4gIvi4RrkqOKQnd3DBQ/el9ljs/cFrrQ3gLGqkuPF78w
 K7dJ2m65lwaBSRB6f0fiVJbRbcrabcG6JYzaNL6T4r3E4TiMrvLsnjPqQQd5GycO/4kr
 D4cRLRjBPxl4mEpVV/fu0WNhLcLtZTUY/zX6Gl9ZyyRT8ajwpY37HT7AShW7qlYnh9C3
 j0aw==
X-Gm-Message-State: AOAM5303rYN+HkXK3bXOllKxwOCSjzgJt8N9DUPDx52QfLfeqfiuQ6Tk
 8P0M53VPB8ymBvXnhIWJVy3zOdwUgfe4v49XUaJajg==
X-Google-Smtp-Source: ABdhPJx9FGmD8uMhL12d2z2hPfabfw7OH68NgMGj1ufrvgdxrT1UyGMJ8jvwXEeDxTg1tFfMtKfHg3WyH9H8N3cakbk=
X-Received: by 2002:a9d:f29:: with SMTP id 38mr11023364ott.281.1596781381738; 
 Thu, 06 Aug 2020 23:23:01 -0700 (PDT)
MIME-Version: 1.0
References: <230cc360-89b9-bb39-ee7e-d68ac037345f@i-love.sakura.ne.jp>
 <e5822548-4373-5020-eb3a-9d6144b74d25@amd.com>
 <CAKMK7uH+roU10xzb4fGdTgzHq_NGwM64A6ryYR-8je4UZW+bfQ@mail.gmail.com>
 <2945161e-edfb-f186-2339-cc2b442a24e6@i-love.sakura.ne.jp>
In-Reply-To: <2945161e-edfb-f186-2339-cc2b442a24e6@i-love.sakura.ne.jp>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 7 Aug 2020 08:22:50 +0200
Message-ID: <CAKMK7uHpgvq8MfhY+MEzYZ9a_EtPN_RCtZsa_0JBHZ5QMqHUOQ@mail.gmail.com>
Subject: Re: [linux.git drm/ttm]: NULL pointer dereference upon driver probe
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
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
Cc: David Airlie <airlied@linux.ie>, Roland Scheidegger <sroland@vmware.com>,
 DRI <dri-devel@lists.freedesktop.org>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgNywgMjAyMCBhdCAxMjo1NiBBTSBUZXRzdW8gSGFuZGEKPHBlbmd1aW4ta2Vy
bmVsQGktbG92ZS5zYWt1cmEubmUuanA+IHdyb3RlOgo+Cj4gT24gMjAyMC8wOC8wNyAwOjM5LCBE
YW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4gT24gVGh1LCBBdWcgNiwgMjAyMCBhdCA1OjI4IFBNIENo
cmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4gPj4KPiA+
PiBNeSBiZXN0IGd1ZXNzIGlzIHRoYXQgeW91IGFyZSBmYWNpbmcgdHdvIHNlcGFyYXRlIGJ1Z3Mg
aGVyZS4KPiA+Pgo+ID4+IENyYXNoICMxIGlzIHNvbWVob3cgcmVsYXRlZCB0byBDUlRDcyBhbmQg
bWlnaHQgZXZlbiBiZSBjYXVzZSBieSB0aGUKPiA+PiBhdG9taWMtaGVscGVyIGNoYW5nZSB5b3Ug
bm90ZWQgYmVsb3cuCj4gPgo+ID4gWWVhaCwgYW5kIEkgdGhpbmsgSSBrbm93IHdoYXQncyBnb2lu
ZyBvbi4gUGF0Y2ggaW5jb21pbmcuIFdoZW4gdGVzdGluZwo+ID4gdGhhdCBwYXRjaCwgcGxlYXNl
IG1ha2Ugc3VyZSB5b3UncmUgdGVzdGluZyBvbiBhIGtlcm5lbCB3aXRoIHNob3dzCj4gPiBjcmFz
aCBwYXR0ZXJuIDEsIGJ1dCBpcyBub3QgYnJva2VuIGJ5IGNyYXNoIHBhdHRlcm4gMi4KPiA+IC1E
YW5pZWwKPgo+IEkgY29uZmlybWVkIHRoYXQgdGhlIHBhdGNoIGF0IGh0dHBzOi8vbGttbC5rZXJu
ZWwub3JnL3IvMjAyMDA4MDYxNTQyMjcuMjI1NTE5Ny0xLWRhbmllbC52ZXR0ZXJAZmZ3bGwuY2gK
PiBjaGFuZ2VzIGNyYXNoIHBhdHRlcm4gZnJvbSAxIHRvIDIuIFlvdSBjYW4gc2VuZCB0aGUgcGF0
Y2ggZm9yIGF2b2lkaW5nIENyYXNoICMxLgo+Cj4gPgo+ID4+Cj4gPj4gQ3Jhc2ggIzIgaXMgY2F1
c2VkIGJlY2F1c2Ugdm13X2JvX2NyZWF0ZV9hbmRfcG9wdWxhdGUoKSB0cmllcyB0bwo+ID4+IG1h
bnVhbGx5IHBvcHVsYXRlIGEgQk8gb2JqZWN0IGluc3RlYWQgb2YgcmVseWluZyBvbiBUVE0gdG8g
ZG8gaXQgd2hlbgo+ID4+IG5lY2Vzc2FyeS4gVGhpcyBpbmRlZWQgZG9lc24ndCB3b3JrIGFueSBt
b3JlIGJlY2F1c2Ugb2YgImRybS90dG06IG1ha2UKPiA+PiBUVCBjcmVhdGlvbiBwdXJlbHkgb3B0
aW9uYWwgdjMiLgo+ID4+Cj4gPj4gUXVlc3Rpb24gaXMgd2h5IHZtd2dmeCBpcyBkb2luZyB0aGlz
Pwo+ID4+Cj4gPj4gUmVnYXJkcywKPiA+PiBDaHJpc3RpYW4uCj4gPj4KPgo+IEYuWS5JLiBzeXpi
b3QgaXMgcmVwb3J0aW5nIGEgc2ltaWxhciBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2Ugb24gdmly
dGlvIGF0Cj4gaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20vYnVnP2lkPTk1NTc2MzEwNWE5
MTlkZjVkMTliOGVkMjZmMjQ0ZDY5OGVmMTVhYzMgLgo+IEJpc2VjdGlvbiBhdHRlbXB0IGlzIG5v
dCBtYWRlIHlldCBiZWNhdXNlIHJlcHJvZHVjZXIgaXMgbm90IGZvdW5kIHlldC4KCk5haCwgdGhh
dCdzIGEgZGlmZmVyZW50IG9uZSwgZmlyZXdvcmtzIGluIHNobWVtIGhlbHBlcnMuIHZtdyBibG93
cyB1cApkdWUgdG8gdHRtIGhlbHBlciBjb2RlLiBUaG9zZSBhcmUgdHdvIHRvdGFsbHkgZGlmZmVy
ZW50IHdheXMgdG8gbWFuYWdlCmdwdSBtZW1vcnksIHNvIGRlZmluaXRlbHkgZGlmZmVyZW50IGJ1
Z3MuCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENv
cnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
