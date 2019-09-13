Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DE8B19AC
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 10:32:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0147E6EEDA;
	Fri, 13 Sep 2019 08:32:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D37056EEDA
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 08:32:06 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id i8so26260434edn.13
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 01:32:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fg561yMuO77l6EwrcS5uC/U69LFnwV0/kL0h3hd/D/E=;
 b=NpUheu9CckllL/lyxIryiBnfhw0snVTmBRX8ufR3vLo8JMBJc7cfAuyLYQzTZGHZMa
 y6Xx/kxwfWiC4Go8ImD+nu4aG3wYp7GX4FHEQdXAVLO9fwM34y1Uy5FJtdjAwxACJBNM
 B4CBXEplVGjd6ujXLMKDxjcCBnJtv0YoQCVl7ZJPNsp/sJGz9FcSK4evu2nbmkSUVPw4
 B6fx+Pgw3T2kvgzSWjY7WGzIID8I8VASi4KVgmdgR7h2phEkUYvgkCp3kb4+H7SVeXVL
 iv2W8/kpJ/oes1R8rmmm9NknSMIllXHEN6jceuW73E1D3D4mO3bfqEqbP1dGekjJDMuw
 tJbA==
X-Gm-Message-State: APjAAAUFQc4ow1a1xgA5yaWJhlPLukbfxBNyDLTD6E3w1NJ4tw5ZHAyT
 T6y56RxHv+zOIENRFwiEWb4W3XZrp6KONQ==
X-Google-Smtp-Source: APXvYqxoYyjzDW0PYKbbJ1upWprNmarpposG5Y9LabYwBu+pOHfJm91WgU47DISWDHRdc0RdG7awjA==
X-Received: by 2002:a17:906:5215:: with SMTP id
 g21mr34558475ejm.105.1568363524638; 
 Fri, 13 Sep 2019 01:32:04 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com.
 [209.85.128.53])
 by smtp.gmail.com with ESMTPSA id gv20sm185360ejb.43.2019.09.13.01.32.03
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Sep 2019 01:32:03 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id r195so1772714wme.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 01:32:03 -0700 (PDT)
X-Received: by 2002:a1c:f002:: with SMTP id a2mr2514627wmb.113.1568363523190; 
 Fri, 13 Sep 2019 01:32:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190912094121.228435-1-tfiga@chromium.org>
 <20190912123821.rraib5entkcxt5p5@sirius.home.kraxel.org>
 <CAAFQd5AFXfu7ysFCi1XQS61DK8nbSk5-=UHkvpYWDtFae5YQ6Q@mail.gmail.com>
 <20190913080707.unhyoezesvfhx5np@sirius.home.kraxel.org>
In-Reply-To: <20190913080707.unhyoezesvfhx5np@sirius.home.kraxel.org>
From: Tomasz Figa <tfiga@chromium.org>
Date: Fri, 13 Sep 2019 17:31:50 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BUKdWkp7zvhLHyY+rjcwVLYXk1NKsrrfhoOHT_68T==Q@mail.gmail.com>
Message-ID: <CAAFQd5BUKdWkp7zvhLHyY+rjcwVLYXk1NKsrrfhoOHT_68T==Q@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/virtio: Export resource handles via DMA-buf API
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Fg561yMuO77l6EwrcS5uC/U69LFnwV0/kL0h3hd/D/E=;
 b=a8Gy6ADr33Gj3JqkIIegVOtHPKD+OOa/m+0myEhAXBgNsIBpTIzVUtfN6xUaMcNpxn
 zxwD0bZMXgTaGi5jU6Z+1qqBylt3w7YSKKnPAP6QkEBMVlKpk5yUlAjdtFn3HqAqCYza
 wzH2+P6msHitgv4HDCVInAQffZpF0c4pji25g=
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
Cc: Zach Reizner <zachr@chromium.org>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 Keiichi Watanabe <keiichiw@chromium.org>, stevensd@chromium.org,
 =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
 Pawel Osciak <posciak@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgNTowNyBQTSBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KPiAgIEhpLAo+Cj4gPiA+ID4gVG8gc2VhbWxlc3NseSBlbmFibGUg
YnVmZmVyIHNoYXJpbmcgd2l0aCBkcml2ZXJzIHVzaW5nIHN1Y2ggZnJhbWV3b3JrcywKPiA+ID4g
PiBtYWtlIHRoZSB2aXJ0aW8tZ3B1IGRyaXZlciBleHBvc2UgdGhlIHJlc291cmNlIGhhbmRsZSBh
cyB0aGUgRE1BIGFkZHJlc3MKPiA+ID4gPiBvZiB0aGUgYnVmZmVyIHJldHVybmVkIGZyb20gdGhl
IERNQS1idWYgbWFwcGluZyBvcGVyYXRpb24uICBBcmd1YWJseSwgdGhlCj4gPiA+ID4gcmVzb3Vy
Y2UgaGFuZGxlIGlzIGEga2luZCBvZiBETUEgYWRkcmVzcyBhbHJlYWR5LCBhcyBpdCBpcyB0aGUg
YnVmZmVyCj4gPiA+ID4gaWRlbnRpZmllciB0aGF0IHRoZSBkZXZpY2UgbmVlZHMgdG8gYWNjZXNz
IHRoZSBiYWNraW5nIG1lbW9yeSwgd2hpY2ggaXMKPiA+ID4gPiBleGFjdGx5IHRoZSBzYW1lIHJv
bGUgYSBETUEgYWRkcmVzcyBwcm92aWRlcyBmb3IgbmF0aXZlIGRldmljZXMuCj4gPgo+ID4gRmly
c3Qgb2YgYWxsLCB0aGFua3MgZm9yIHRha2luZyBhIGxvb2sgYXQgdGhpcy4KPiA+Cj4gPiA+IE5v
LiAgQSBzY2F0dGVyIGxpc3QgaGFzIGd1ZXN0IGRtYSBhZGRyZXNzZXMsIHBlcmlvZC4gIFN0dWZm
aW5nIHNvbWV0aGluZwo+ID4gPiBlbHNlIGludG8gYSBzY2F0dGVybGlzdCBpcyBhc2tpbmcgZm9y
IHRyb3VibGUsIHRoaW5ncyB3aWxsIGdvIHNlcmlvdXNseQo+ID4gPiB3cm9uZyB3aGVuIHNvbWVv
bmUgdHJpZXMgdG8gdXNlIHN1Y2ggYSBmYWtlIHNjYXR0ZXJsaXN0IGFzIHJlYWwgc2NhdHRlcmxp
c3QuCj4gPgo+ID4gV2hhdCBpcyBhICJndWVzdCBkbWEgYWRkcmVzcyI/IFRoZSBkZWZpbml0aW9u
IG9mIGEgRE1BIGFkZHJlc3MgaW4gdGhlCj4gPiBMaW51eCBETUEgQVBJIGlzIGFuIGFkZHJlc3Mg
aW50ZXJuYWwgdG8gdGhlIERNQSBtYXN0ZXIgYWRkcmVzcyBzcGFjZS4KPiA+IEZvciB2aXJ0aW8s
IHRoZSByZXNvdXJjZSBoYW5kbGUgbmFtZXNwYWNlIG1heSBiZSBzdWNoIGFuIGFkZHJlc3MKPiA+
IHNwYWNlLgo+Cj4gTm8uICBETUEgbWFzdGVyIGFkZHJlc3Mgc3BhY2UgaW4gdmlydHVhbCBtYWNo
aW5lcyBpcyBwcmV0dHkgbXVjaCB0aGUKPiBzYW1lIGl0IGlzIG9uIHBoeXNpY2FsIG1hY2hpbmVz
LiAgU28sIG9uIHg4NiB3aXRob3V0IGlvbW11LCBpZGVudGljYWwKPiB0byAoZ3Vlc3QpIHBoeXNp
Y2FsIGFkZHJlc3Mgc3BhY2UuICBZb3UgY2FuJ3QgcmUtZGVmaW5lIGl0IGxpa2UgdGhhdC4KPgoK
VGhhdCdzIG5vdCB0cnVlLiBFdmVuIG9uIHg4NiB3aXRob3V0IGlvbW11IHRoZSBETUEgYWRkcmVz
cyBzcGFjZSBjYW4KYmUgZGlmZmVyZW50IGZyb20gdGhlIHBoeXNpY2FsIGFkZHJlc3Mgc3BhY2Uu
IFRoYXQgY291bGQgYmUgc3RpbGwganVzdAphIHNpbXBsZSBhZGRpdGlvbi9zdWJ0cmFjdGlvbiBi
eSBjb25zdGFudCwgYnV0IHN0aWxsLCB0aGUgdHdvIGFyZQpleHBsaWNpdGx5IGRlZmluZWQgd2l0
aG91dCBhbnkgZ3VhcmFudGVlcyBhYm91dCBhIHNpbXBsZSBtYXBwaW5nCmJldHdlZW4gb25lIG9y
IGFub3RoZXIgZXhpc3RpbmcuCgpTZWUgaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvRG9jdW1l
bnRhdGlvbi9ETUEtQVBJLnR4dAoKIkEgQ1BVIGNhbm5vdCByZWZlcmVuY2UgYSBkbWFfYWRkcl90
IGRpcmVjdGx5IGJlY2F1c2UgdGhlcmUgbWF5IGJlCnRyYW5zbGF0aW9uIGJldHdlZW4gaXRzIHBo
eXNpY2FsCmFkZHJlc3Mgc3BhY2UgYW5kIHRoZSBETUEgYWRkcmVzcyBzcGFjZS4iCgo+ID4gSG93
ZXZlciwgd2UgY291bGQgYXMgd2VsbCBpbnRyb2R1Y2UgYSBzZXBhcmF0ZSBETUEgYWRkcmVzcwo+
ID4gc3BhY2UgaWYgcmVzb3VyY2UgaGFuZGxlcyBhcmUgbm90IHRoZSByaWdodCB3YXkgdG8gcmVm
ZXIgdG8gdGhlIG1lbW9yeQo+ID4gZnJvbSBvdGhlciB2aXJ0aW8gZGV2aWNlcy4KPgo+IHMvb3Ro
ZXIgdmlydGlvIGRldmljZXMvb3RoZXIgZGV2aWNlcy8KPgo+IGRtYS1idWZzIGFyZSBmb3IgYnVm
ZmVyIHNoYXJpbmcgYmV0d2VlbiBkZXZpY2VzLCBub3QgbGltaXRlZCB0byB2aXJ0aW8uCj4gWW91
IGNhbid0IHJlLWRlZmluZSB0aGF0IGluIHNvbWUgdmlydGlvLXNwZWNpZmljIHdheS4KPgoKV2Ug
ZG9uJ3QgbmVlZCB0byBsaW1pdCB0aGlzIHRvIHZpcnRpbyBkZXZpY2VzIG9ubHkuIEluIGZhY3Qg
SSBhY3R1YWxseQpmb3Jlc2VlIHRoaXMgaGF2aW5nIGEgdXNlIGNhc2Ugd2l0aCB0aGUgZW11bGF0
ZWQgVVNCIGhvc3QgY29udHJvbGxlciwKd2hpY2ggaXNuJ3QgYSB2aXJ0aW8gZGV2aWNlLgoKVGhh
dCBzYWlkLCBJIGRlbGliZXJhdGVseSByZWZlcnJlZCB0byB2aXJ0aW8gdG8ga2VlcCB0aGUgc2Nv
cGUgb2YgdGhlCnByb2JsZW0gaW4gY29udHJvbC4gSWYgdGhlcmUgaXMgYSBzb2x1dGlvbiB0aGF0
IGNvdWxkIHdvcmsgd2l0aG91dApzdWNoIGFzc3VtcHRpb24sIEknbSBtb3JlIHRoYW4gb3BlbiB0
byBkaXNjdXNzIGl0LCBvZiBjb3Vyc2UuCgo+ID4gPiBBbHNvIG5vdGUgdGhhdCAidGhlIERNQSBh
ZGRyZXNzIG9mIHRoZSBidWZmZXIiIGlzIGJvbmtlcnMgaW4gdmlydGlvLWdwdQo+ID4gPiBjb250
ZXh0LiAgdmlydGlvLWdwdSByZXNvdXJjZXMgYXJlIG5vdCByZXF1aXJlZCB0byBiZSBwaHlzaWNh
bGx5Cj4gPiA+IGNvbnRpZ291cyBpbiBtZW1vcnksIHNvIHR5cGljYWxseSB5b3UgYWN0dWFsbHkg
bmVlZCBhIHNjYXR0ZXIgbGlzdCB0bwo+ID4gPiBkZXNjcmliZSB0aGVtLgo+ID4KPiA+IFRoZXJl
IGlzIG5vIHN1Y2ggcmVxdWlyZW1lbnQgZXZlbiBvbiBhIGJhcmUgbWV0YWwgc3lzdGVtLCBzZWUg
YW55Cj4gPiBzeXN0ZW0gdGhhdCBoYXMgYW4gSU9NTVUsIHdoaWNoIGlzIHR5cGljYWwgb24gQVJN
L0FSTTY0LiBUaGUgRE1BCj4gPiBhZGRyZXNzIHNwYWNlIG11c3QgYmUgY29udGlndW91cyBvbmx5
IGZyb20gdGhlIERNQSBtYXN0ZXIgcG9pbnQgb2YKPiA+IHZpZXcuCj4KPiBZZXMsIHRoZSBpb21t
dSAoaWYgcHJlc2VudCkgY291bGQgcmVtYXAgeW91ciBzY2F0dGVybGlzdCB0aGF0IHdheS4gIFlv
dQo+IGNhbid0IGRlcGVuZCBvbiB0aGF0IHRob3VnaC4KClRoZSBJT01NVSBkb2Vzbid0IG5lZWQg
dG8gZXhpc3QgcGh5c2ljYWxseSwgdGhvdWdoLiBBZnRlciBhbGwsIGd1ZXN0Cm1lbW9yeSBtYXkg
bm90IGJlIHBoeXNpY2FsbHkgY29udGlndW91cyBpbiB0aGUgaG9zdCBhbHJlYWR5LCBidXQgd2l0
aAp5b3VyIGRlZmluaXRpb24gb2YgRE1BIGFkZHJlc3Mgd2Ugd291bGQgcmVmZXIgdG8gaXQgYXMg
Y29udGlndW91cy4gQXMKcGVyIG15IHVuZGVyc3RhbmRpbmcgb2YgdGhlIERNQSBhZGRyZXNzLCBh
bnl0aGluZyB0aGF0IGxldHMgdGhlIERNQQptYXN0ZXIgYWNjZXNzIHRoZSB0YXJnZXQgbWVtb3J5
IHdvdWxkIHF1YWxpZnkgYW5kIHRoZXJlIHdvdWxkIGJlIG5vCm5lZWQgZm9yIGFuIElPTU1VIGlu
IGJldHdlZW4uCgo+Cj4gV2hhdCBpcyB0aGUgcGxhbiBoZXJlPyAgSG9zdC1zaWRlIGJ1ZmZlciBz
aGFyaW5nIEkgZ3Vlc3M/ICBTbyB5b3UgYXJlCj4gbG9va2luZyBmb3Igc29tZSB3YXkgdG8gcGFz
cyBidWZmZXIgaGFuZGxlcyBmcm9tIHRoZSBndWVzdCB0byB0aGUgaG9zdCwKPiBldmVuIGluIGNh
c2UgdGhvc2UgYnVmZmVycyBhcmUgbm90IGNyZWF0ZWQgYnkgeW91ciBkcml2ZXIgYnV0IGltcG9y
dGVkCj4gZnJvbSBzb21ld2hlcmUgZWxzZT8KCkV4YWN0bHkuIFRoZSB2ZXJ5IHNwZWNpZmljIGZp
cnN0IHNjZW5hcmlvIHRoYXQgd2Ugd2FudCB0byBzdGFydCB3aXRoCmlzIGFsbG9jYXRpbmcgaG9z
dCBtZW1vcnkgdGhyb3VnaCB2aXJ0aW8tZ3B1IGFuZCB1c2luZyB0aGF0IG1lbW9yeQpib3RoIGFz
IG91dHB1dCBvZiBhIHZpZGVvIGRlY29kZXIgYW5kIGFzIGlucHV0ICh0ZXh0dXJlKSB0byBWaXJn
aWwzRC4KVGhlIG1lbW9yeSBuZWVkcyB0byBiZSBzcGVjaWZpY2FsbHkgYWxsb2NhdGVkIGJ5IHRo
ZSBob3N0IGFzIG9ubHkgdGhlCmhvc3QgY2FuIGtub3cgdGhlIHJlcXVpcmVtZW50cyBmb3IgbWVt
b3J5IGFsbG9jYXRpb24gb2YgdGhlIHZpZGVvCmRlY29kZSBhY2NlbGVyYXRvciBoYXJkd2FyZS4K
CkJlc3QgcmVnYXJkcywKVG9tYXN6Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
