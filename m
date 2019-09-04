Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D3DA80EE
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 13:15:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47D738949C;
	Wed,  4 Sep 2019 11:15:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 520898930A
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 11:15:37 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id a22so2066161ljd.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2019 04:15:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nHq3ycJ87pRU9sYhgJHhfznS6sB5FLISaAxTxaJIi4Q=;
 b=BKbeBKFDwIRzWGnnUhcNJ+GY+uSsA6J+INu3horrwji3pOU8O9nACxkc7CRit86Loa
 mgB6Ohr7WUEorO4gJaYsQPgTmHnrWr4VvLrAGDG9wY4JEUY2JPRdou9zS+n6fGuUDUvG
 EGd0P80GanzytBhuGXYM7RcI8zTyi6sxyuOEKgSs8Nv7u9yzniL1QBOKIVrOFdpX0W6T
 pKdvQlJ8/JP7IHrawBhiQPB6vDxuzmhSiT2/xV6FKr6WEtfySkiMsYVHXPGvg5KQOJuT
 QSW7mwtv7S2pg1QDSvS3r8Y1qkfogAXZXQIr/tXjbAnF3L977TJn0b1wjgGa+sqaCSLA
 g7YQ==
X-Gm-Message-State: APjAAAVq2XXg+R3aELxFLa1qLa/Roa4mKa0zzUNmuUqHngAe/GLfj71r
 GbTl27Q0aSQBaeVXsoAPPnI41qBz0IWRo5qYZh8=
X-Google-Smtp-Source: APXvYqxXqsQOygvk+fD5pZjRHaRu9s90ct8/RwL/UzDw9S0/w7gV8FHgckqqjRwitx1y/o4OCZmqshrWgfcD677xJ9U=
X-Received: by 2002:a2e:780c:: with SMTP id t12mr10331161ljc.226.1567595735449; 
 Wed, 04 Sep 2019 04:15:35 -0700 (PDT)
MIME-Version: 1.0
References: <64d41701-55a4-e526-17ae-8936de4bc1ef@suse.de>
 <20190824051605.GA63850@shbuild999.sh.intel.com>
 <1b897bfe-fd40-3ae3-d867-424d1fc08c44@suse.de>
 <d114b0b6-6b64-406e-6c3f-a8b8d5502413@intel.com>
 <44029e80-ba00-8246-dec0-fda122d53f5e@suse.de>
 <90e78ce8-d46a-5154-c324-a05aa1743c98@intel.com>
 <2e1b4d65-d477-f571-845d-fa0a670859af@suse.de>
 <20190904062716.GC5541@shbuild999.sh.intel.com>
 <72c33bf1-9184-e24a-c084-26d9c8b6f9b7@suse.de>
 <CAKMK7uGdOtyDHZMSzY8J45bX57EFKo=DWNUi+WL+GVOzoBpUhw@mail.gmail.com>
 <20190904083558.GD5541@shbuild999.sh.intel.com>
 <CAKMK7uGVKEN=pi4Erc_gtbL3ZFN-b6pm-nXSznjd_rH4H2yn4w@mail.gmail.com>
In-Reply-To: <CAKMK7uGVKEN=pi4Erc_gtbL3ZFN-b6pm-nXSznjd_rH4H2yn4w@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 4 Sep 2019 21:15:23 +1000
Message-ID: <CAPM=9tzDMfRf_VKaiHmnb_KKVwqW3=y=09JO0SJrG6ySe=DbfQ@mail.gmail.com>
Subject: Re: [LKP] [drm/mgag200] 90f479ae51: vm-scalability.median -18.8%
 regression
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=nHq3ycJ87pRU9sYhgJHhfznS6sB5FLISaAxTxaJIi4Q=;
 b=o5p1efLJErepXbkkgoCaSYwntoU0Yu8oLiX3TSWnk3q6AbU+GcoP4l60fwxs/JVYkT
 H7o/ClMARxhMlbsc2ku8rtFBEODbtEd6NBg/8RTXwh2XVpmM6KoQEuEqv8x3lG8PV5yH
 NgjzR+Z7vePf8ctqggj4hEqE9o/H3pQyISJm8Fheau6OnI2bj7JgLVQZT/wKheLpFBEf
 +WdRRNgoSoWxoCV0BrZe20hDQpmhoYUfe4wD1JRzWTNtRXcr2/ERQldKIfVJjxecStiK
 9PBW5cOu9tDZ7AAc0UEv7fjrfKGDyFBre0HbqqFPSmsMfpt57lx43LjyPxlZSNg/bp4E
 lsTQ==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Feng Tang <feng.tang@intel.com>,
 Rong Chen <rong.a.chen@intel.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, LKP <lkp@01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCA0IFNlcCAyMDE5IGF0IDE5OjE3LCBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwu
Y2g+IHdyb3RlOgo+Cj4gT24gV2VkLCBTZXAgNCwgMjAxOSBhdCAxMDozNSBBTSBGZW5nIFRhbmcg
PGZlbmcudGFuZ0BpbnRlbC5jb20+IHdyb3RlOgo+ID4KPiA+IEhpIERhbmllbCwKPiA+Cj4gPiBP
biBXZWQsIFNlcCAwNCwgMjAxOSBhdCAxMDoxMToxMUFNICswMjAwLCBEYW5pZWwgVmV0dGVyIHdy
b3RlOgo+ID4gPiBPbiBXZWQsIFNlcCA0LCAyMDE5IGF0IDg6NTMgQU0gVGhvbWFzIFppbW1lcm1h
bm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gSGkKPiA+ID4g
Pgo+ID4gPiA+IEFtIDA0LjA5LjE5IHVtIDA4OjI3IHNjaHJpZWIgRmVuZyBUYW5nOgo+ID4gPiA+
ID4+IFRoYW5rIHlvdSBmb3IgdGVzdGluZy4gQnV0IGRvbid0IGdldCB0b28gZXhjaXRlZCwgYmVj
YXVzZSB0aGUgcGF0Y2gKPiA+ID4gPiA+PiBzaW11bGF0ZXMgYSBidWcgdGhhdCB3YXMgcHJlc2Vu
dCBpbiB0aGUgb3JpZ2luYWwgbWdhZzIwMCBjb2RlLiBBCj4gPiA+ID4gPj4gc2lnbmlmaWNhbnQg
bnVtYmVyIG9mIGZyYW1lcyBhcmUgc2ltcGx5IHNraXBwZWQuIFRoYXQgaXMgYXBwYXJlbnRseSB0
aGUKPiA+ID4gPiA+PiByZWFzb24gd2h5IGl0J3MgZmFzdGVyLgo+ID4gPiA+ID4KPiA+ID4gPiA+
IFRoYW5rcyBmb3IgdGhlIGRldGFpbGVkIGluZm8sIHNvIHRoZSBvcmlnaW5hbCBjb2RlIHNraXBz
IHRpbWUtY29uc3VtaW5nCj4gPiA+ID4gPiB3b3JrIGluc2lkZSBhdG9taWMgY29udGV4dCBvbiBw
dXJwb3NlLiBJcyB0aGVyZSBhbnkgc3BhY2UgdG8gb3B0bWlzZSBpdD8KPiA+ID4gPiA+IElmIDIg
c2NoZWR1bGVkIHVwZGF0ZSB3b3JrZXIgYXJlIGhhbmRsZWQgYXQgYWxtb3N0IHNhbWUgdGltZSwg
Y2FuIG9uZSBiZQo+ID4gPiA+ID4gc2tpcHBlZD8KPiA+ID4gPgo+ID4gPiA+IFRvIG15IGtub3ds
ZWRnZSwgdGhlcmUncyBvbmx5IG9uZSBpbnN0YW5jZSBvZiB0aGUgd29ya2VyLiBSZS1zY2hlZHVs
aW5nCj4gPiA+ID4gdGhlIHdvcmtlciBiZWZvcmUgYSBwcmV2aW91cyBpbnN0YW5jZSBzdGFydGVk
LCB3aWxsIG5vdCBjcmVhdGUgYSBzZWNvbmQKPiA+ID4gPiBpbnN0YW5jZS4gVGhlIHdvcmtlcidz
IGluc3RhbmNlIHdpbGwgY29tcGxldGUgYWxsIHBlbmRpbmcgdXBkYXRlcy4gU28gaW4KPiA+ID4g
PiBzb21lIHdheSwgc2tpcHBpbmcgd29ya2VycyBhbHJlYWR5IGhhcHBlbnMuCj4gPiA+Cj4gPiA+
IFNvIEkgdGhpbmsgdGhhdCB0aGUgbW9zdCBvZnRlbiBmYmNvbiB1cGRhdGUgZnJvbSBhdG9taWMg
Y29udGV4dCBpcyB0aGUKPiA+ID4gYmxpbmtpbmcgY3Vyc29yLiBJZiB5b3UgZGlzYWJsZSB0aGF0
IG9uZSB5b3Ugc2hvdWxkIGJlIGJhY2sgdG8gdGhlIG9sZAo+ID4gPiBwZXJmb3JtYW5jZSBsZXZl
bCBJIHRoaW5rLCBzaW5jZSBqdXN0IHdyaXRpbmcgdG8gZG1lc2cgaXMgZnJvbSBwcm9jZXNzCj4g
PiA+IGNvbnRleHQsIHNvIHNob3VsZG4ndCBjaGFuZ2UuCj4gPgo+ID4gSG1tLCB0aGVuIGZvciB0
aGUgb2xkIGRyaXZlciwgaXQgc2hvdWxkIGFsc28gZG8gdGhlIG1vc3QgdXBkYXRlIGluCj4gPiBu
b24tYXRvbWljIGNvbnRleHQ/Cj4gPgo+ID4gT25lIG90aGVyIHRoaW5nIGlzLCBJIHByb2ZpbGVk
IHRoYXQgdXBkYXRpbmcgYSAzTUIgc2hhZG93IGJ1ZmZlciBuZWVkcwo+ID4gMjAgbXMsIHdoaWNo
IHRyYW5zZmVyIHRvIDE1MCBNQi9zIGJhbmR3aWR0aC4gQ291bGQgaXQgYmUgcmVsYXRlZCB3aXRo
Cj4gPiB0aGUgY2FjaGUgc2V0dGluZyBvZiBEUk0gc2hhZG93IGJ1ZmZlcj8gc2F5IHRoZSBvcmdp
bmFsIGNvZGUgdXNlIGEKPiA+IGNhY2hhYmxlIGJ1ZmZlcj8KPgo+IEhtLCB0aGF0IHdvdWxkIGlu
ZGljYXRlIHRoZSB3cml0ZS1jb21iaW5pbmcgZ290IGJyb2tlbiBzb21ld2hlcmUuIFRoaXMKPiBz
aG91bGQgZGVmaW5pdGVseSBiZSBmYXN0ZXIuIEFsc28gd2Ugc2hvdWxkbid0IHRyYW5zZmVyIHRo
ZSBob2xlCj4gdGhpbmcsIGV4Y2VwdCB3aGVuIHNjcm9sbGluZyAuLi4KCkZpcnN0IHJ1bGUgb2Yg
ZmJjb24gdXNhZ2UsIHlvdSBhcmUgYWx3YXlzIGVmZmVjdGl2ZWx5IHNjcm9sbGluZy4KCkFsc28g
dGhlc2UgZGV2aWNlcyBtaWdodCBiZSBvbiBhIFBDSUUgMXggcGllY2Ugb2Ygd2V0IHN0cmluZywg
bm90IHN1cmUKaWYgdGhlIG51bWJlcnMgcmVmbGVjdCB0aGF0LgoKRGF2ZS4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
