Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F6C240D2C
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 20:51:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7C0989C16;
	Mon, 10 Aug 2020 18:51:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B597789C16
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 18:51:29 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id qc22so10453961ejb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 11:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=I5rXizC/LJeXuuXUC6VwUXAfeqodTb2jxqsY3KANihY=;
 b=sT0knVYoesSDr5x4EBLlcQYXa32O46Ty0zUu4QNtJQ1GLK1Rv8sVVdJq9DrCwf5Kjm
 U9RoZHeG/F5oYk33trC8U60iR4xf2EYpUAbl7uuo61mLNQVlDM9Cj7N2/hQojuczyCFp
 1dX4oK5LdPA4QRBhLpfVbjAdNpJT57o7oML9PlUyKRS7UMZ/QaSmJp4QXVFCfx/qfNre
 9zSoCVQ80M6DP541ew5D5b81Wded6UMKOccHmE0amyx/4iur9V5MZoSbj0dAkhQ9iE6z
 Zg9nqJTAeMwyPnO7tOH5RiJVc2Qx1lt0jpM2Gbn+GQhA5WEHbEvaJ7a9KvD4KSbqBbyg
 n3nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=I5rXizC/LJeXuuXUC6VwUXAfeqodTb2jxqsY3KANihY=;
 b=SasO33TAy0H9vWzWZF6paGmbTwRmAV+7dO/VCBkHBhJLfivtYIPNEhnZIBPbEuft1p
 gSJuulx3rP9t6pemw7v6IXqGs6zdw4rDEaznHuJI6xwZa55ImkQWVfUeEFOJVLGAp1NQ
 AZwqyqJpIUls12nTef/dSGDT/he2oYb6Kijwqtzy/Wo1Bplan7kp1UIbFPDIKHi74OhW
 DJIareZ2foi3okLZ/sEOljueSPgFToFgcpsnVjJ5n5s7PZEs4P6fJlnoF4OEgYkVFSzy
 d/2KFypKsyvOMMFhs0oQGL01JjT0P+1+gqEYSmBaAlt4V6jvmc+J2x1dsRsypIAcjEAu
 36sA==
X-Gm-Message-State: AOAM532mCOKVjge6yPez3FYwhkO1G14rC/9h/ZcwQcrtuvMdQq44LmFg
 SUEnn6l5NWEV/OzvcEgpsK2oMv/GbvHMlV9Mu6w=
X-Google-Smtp-Source: ABdhPJyY9yZMj4/PMuCvMEFFjwfMyr0t6Ag8drOrpUYGvb8aZmVHGbtnzhcoVVwJsS5UMieZPdUXep/Rg0yn536JSG8=
X-Received: by 2002:a17:907:72c8:: with SMTP id
 du8mr22212231ejc.237.1597085488203; 
 Mon, 10 Aug 2020 11:51:28 -0700 (PDT)
MIME-Version: 1.0
References: <230cc360-89b9-bb39-ee7e-d68ac037345f@i-love.sakura.ne.jp>
 <e5822548-4373-5020-eb3a-9d6144b74d25@amd.com>
 <be670819-20d0-0757-a0f9-20054a527e77@vmware.com>
 <33c4495c-7fb5-f075-b30b-9ab9bdd4ce32@amd.com>
 <e4055371-5a78-0b32-9e1f-d17d865cbb8c@amd.com>
In-Reply-To: <e4055371-5a78-0b32-9e1f-d17d865cbb8c@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 11 Aug 2020 04:51:16 +1000
Message-ID: <CAPM=9txMmSdHqnTsq97voJnNabh+dzfSzeJL302z=WJJD9j8Gw@mail.gmail.com>
Subject: Re: [linux.git drm/ttm]: NULL pointer dereference upon driver probe
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 David Airlie <airlied@linux.ie>, Roland Scheidegger <sroland@vmware.com>,
 DRI <dri-devel@lists.freedesktop.org>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAxMCBBdWcgMjAyMCBhdCAyMjoyMCwgQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IEFtIDA3LjA4LjIwIHVtIDA5OjAyIHNjaHJpZWIg
Q2hyaXN0aWFuIEvDtm5pZzoKPiA+IEFtIDA2LjA4LjIwIHVtIDIwOjUwIHNjaHJpZWIgUm9sYW5k
IFNjaGVpZGVnZ2VyOgo+ID4+IEFtIDA2LjA4LjIwIHVtIDE3OjI4IHNjaHJpZWIgQ2hyaXN0aWFu
IEvDtm5pZzoKPiA+Pj4gTXkgYmVzdCBndWVzcyBpcyB0aGF0IHlvdSBhcmUgZmFjaW5nIHR3byBz
ZXBhcmF0ZSBidWdzIGhlcmUuCj4gPj4+Cj4gPj4+IENyYXNoICMxIGlzIHNvbWVob3cgcmVsYXRl
ZCB0byBDUlRDcyBhbmQgbWlnaHQgZXZlbiBiZSBjYXVzZSBieSB0aGUKPiA+Pj4gYXRvbWljLWhl
bHBlciBjaGFuZ2UgeW91IG5vdGVkIGJlbG93Lgo+ID4+Pgo+ID4+PiBDcmFzaCAjMiBpcyBjYXVz
ZWQgYmVjYXVzZSB2bXdfYm9fY3JlYXRlX2FuZF9wb3B1bGF0ZSgpIHRyaWVzIHRvCj4gPj4+IG1h
bnVhbGx5IHBvcHVsYXRlIGEgQk8gb2JqZWN0IGluc3RlYWQgb2YgcmVseWluZyBvbiBUVE0gdG8g
ZG8gaXQgd2hlbgo+ID4+PiBuZWNlc3NhcnkuIFRoaXMgaW5kZWVkIGRvZXNuJ3Qgd29yayBhbnkg
bW9yZSBiZWNhdXNlIG9mICJkcm0vdHRtOiBtYWtlCj4gPj4+IFRUIGNyZWF0aW9uIHB1cmVseSBv
cHRpb25hbCB2MyIuCj4gPj4+Cj4gPj4+IFF1ZXN0aW9uIGlzIHdoeSB2bXdnZnggaXMgZG9pbmcg
dGhpcz8KPiA+PiBOb3QgcmVhbGx5IHN1cmUgdW5mb3J0dW5hdGVseSwgaXQncyBwb3NzaWJsZSB2
bXdnZnggaXMgZG9pbmcgaXQgYmVjYXVzZQo+ID4+IHR0bSBsYWNrZWQgc29tZSBjYXBhYmlsaXRp
ZXMgYXQgc29tZSBwb2ludD8KPiA+Cj4gPiBJIHRoaW5rIHNvIGFzIHdlbGwsIHllcy4KPiA+Cj4g
Pj4gICBUcnlpbmcgdG8gZmlndXJlIHRoaXMgb25lIG91dC4uLgo+ID4KPiA+IFByb2JsZW0gaXMg
dGhhdCB3aGF0IHZtd2dmeCBpcyBkb2luZyBoZXJlIGlzIHF1ZXN0aW9uYWJsZSBhdCBiZXN0Lgo+
ID4KPiA+IEJ5IGRlZmluaXRpb24gQk9zIGluIHRoZSBTWVNURU0gZG9tYWluIGFyZSBub3QgYWNj
ZXNzaWJsZSBieSB0aGUgR1BVLAo+ID4gZXZlbiBpZiBpdCBpcyBhIHZpcnR1YWwgb25lLgo+ID4K
PiA+IEFuZCB3aGF0IHZtd2dmeCBkb2VzIGlzIGFsbG9jYXRpbmcgb25lIGluIHRoZSBTWVNURU0g
ZG9tYWluIGFzIG5vdAo+ID4gZXZpY3RhYmxlIGFuZCB0aGVuIGJ5cGFzc2luZyBUVE0gaW4gZmls
bGluZyBhbmQgbWFwcGluZyBpdCB0byB0aGUgR1BVLgo+ID4KPiA+IFRoYXQgZG9lc24ndCByZWFs
bHkgbWFrZXMgc2Vuc2UgdG8gbWUsIHdoeSBzaG91bGRuJ3QgdGhhdCBCTyBiZSBwdXQgaW4KPiA+
IHRoZSBHVFQgZG9tYWluIHRoZW4gaW4gdGhlIGZpcnN0IHBsYWNlPwo+Cj4gV2VsbCBJIHRoaW5r
IEkgZmlndXJlZCBvdXQgd2hhdCBWTVdHRlggaXMgZG9pbmcgaGVyZSwgYnV0IHlvdSB3b24ndCBs
aWtlIGl0Lgo+Cj4gU2VlIFZNV0dGWCBkb2Vzbid0IHN1cHBvcnQgVFRNcyBHVFQgZG9tYWluLiBT
byB0byBpbXBsZW1lbnQgdGhlIG1vYiBhbmQKPiBvdGFibGUgQk9zIGl0IGlzIGFsbG9jYXRpbmcg
c3lzdGVtIGRvbWFpbiBCT3MsIHBpbm5pbmcgdGhlbSBhbmQgbWFudWFsbHkKPiBmaWxsaW5nIHRo
ZW0gd2l0aCBwYWdlcy4KPgo+IFRoZSBjb3JyZWN0IGZpeCB3b3VsZCBiZSB0byBhdWRpdCBWTVdH
RlggYW5kIGZpeCB0aGlzIGhhbmRsaW5nIHNvIHRoYXQKPiBpdCBkb2Vzbid0IG1lc3MgYW55IG1v
cmUgd2l0aCBUVE0gaW50ZXJuYWwgb2JqZWN0IHN0YXRlLgo+Cj4gVGlsbCB0aGF0IGhhcHBlbnMg
d2UgY2FuIG9ubHkgcmV2ZXJ0IHRoZSBwYXRjaCBmb3Igbm93LgoKUHJvYmFibHkgZ29vZCB0byBk
bywgYXQgbGVhc3Qgd2Uga25vdyB0aGUgcHJvYmxlbSBub3cuCgpIb3dldmVyIEkgZm91bmQgbXlz
ZWxmIGluIHRoZSBzYW1lIHBsYWNlIHllc3RlcmRheSBzbyB3ZSBzaG91bGQKZGlzY3VzcyBob3cg
dG8gZml4IGl0IGdvaW5nIGZvcndhcmQuCgpBdCBsZWFzdCBvbiBJbnRlbCBJR1BzIHlvdSBoYXZl
IEdUVCBhbmQgUFBHVFQgKHBlci1wcm9jZXNzIHRhYmxlKS4gR1RUCm9uIGxhdGVyIGh3IGlzIG9u
bHkgbmVlZGVkIGZvciBjZXJ0YWluIG9iamVjdHMsIGxpa2Ugc2Nhbm91dCBldGMuIE5vdApldmVy
eSBvYmplY3QgbmVlZHMgdG8gYmUgaW4gdGhlIEdUVCBkb21haW4uCgpCdXQgd2hlbiB5b3UgZ2V0
IGFuIGV4ZWNidWZmZXIgYW5kIHlvdSB3YW50IHRvIGJpbmQgdGhlIFBQR1RUIG9iamVjdHMsCnlv
dSBuZWVkIHRvIGVpdGhlciBtb3ZlIHRoZSBvYmplY3QgdG8gdGhlIEdUVCBkb21haW4gcG9pbnRs
ZXNzbHkgYW5kCnN1Ym9wdGltYWxseSwgc2luY2UgdGhlIEdUVCBkb21haW4gY291bGQgZmlsbCB1
cCBhbmQgc3RhcnQgbmVlZGluZwpldmljdGlvbnMuCgpTbyB0aGUgb3B0aW9uIGlzIHRvIGdldCBT
WVNURU0gZG9tYWluIG9iamVjdHMsIG9ubHkgbW92ZSB0aGVtIHRvClRUTV9QTF9UVCB3aGVuIHBp
bm5pbmcgZm9yIHNjYW5vdXQgZXRjLCBidXQgb3RoZXJ3aXNlIGdlbmVyYXRlIHRoZQpwYWdlcyBs
aXN0cyBmcm9tIHRoZSBvYmplY3RzLiBJbiBteSBwbGF5aW5nIGFyb3VuZCBJJ3ZlIGhhY2tlZCB1
cCBhIFRUCmNyZWF0ZS9wb3B1bGF0ZSBwYXRoLCB3aXRoIG5vIGJpbmQuCgpEYXZlLgpJIGhhdmUg
aGFyZHdhcmUgdGhhdCBoYXMgbm8gcmVxdWlyZW1lbnQgZm9yIGFsbCBvYmplY3RzIHRvIGJlIGlu
IHRoZQpUVCBkb21haW4sIGJ1dCBzdGlsbCBoYXMgYSBUVCBkb21haW4uCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
