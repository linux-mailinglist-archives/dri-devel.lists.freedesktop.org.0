Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7481B7AAED
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 16:27:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1084B6E570;
	Tue, 30 Jul 2019 14:27:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9CBF6E570
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 14:27:44 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id j21so25540139uap.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 07:27:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=puPnLkvNLlCaYDgxdbRocelmYYmQ2dy5ZEvb1Px3hfI=;
 b=S6CztGokBk/WFxK5JjylmMhQaaIIXw7FRoFf2uqeon48sLzPzJSGZOEyj4BYYc42IY
 6LM9VG4SUeveZ/PX1WbaScHiM7Xjany1wOh6jCaT9PQUA6W1cmspR3WeIIWHZwKdeygj
 6khNXQOFuYNFHDkVqyl/gAyvsyA0lwqwDQHIsyxsr+itYHJLgI2nQZRdEe/lVFxqW5UM
 +mzVIo5sE1MxKAU6BzFMTaBZCXexSHlTJnWgdk68ZESQIpeNMuZIbk6dQuxxq/cbgODk
 vr7SUwIXwu+zInqiO4Esxq7Qu8GRIGhf0v+C782WhDWS7ltEfJTrMolI192Q0h1B/wST
 O/9A==
X-Gm-Message-State: APjAAAXlGvEMxr0IGi7nzztUhqZJoUDXkdHDOZJF6QlpvC16DIFRC5aw
 XVJ88VdGIbx/KZmR3CfIuPzcLNvqAefGQhghRMA=
X-Google-Smtp-Source: APXvYqzntkUYGgYaV+9L3qJcvgXETCE8d+SsfKQls3g9uxT4PcRXbbqpuJwlA0iN5spKcva092AUkq4stwx6ETqoIBY=
X-Received: by 2002:ab0:7006:: with SMTP id k6mr38638853ual.42.1564496863444; 
 Tue, 30 Jul 2019 07:27:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190729195526.13337-1-noralf@tronnes.org>
 <CAMqqaJF8wsekJgriFBxoj5t7FoKTYpqOm_9-NTmf-p5cq3P35Q@mail.gmail.com>
 <45577a65-300e-24ed-8f79-3aa222da40a3@tronnes.org>
In-Reply-To: <45577a65-300e-24ed-8f79-3aa222da40a3@tronnes.org>
From: =?UTF-8?B?Sm9zZWYgTHXFoXRpY2vDvQ==?= <josef@lusticky.cz>
Date: Tue, 30 Jul 2019 16:27:07 +0200
Message-ID: <CAMqqaJEFRTBaUB7q2Ehr7YsicuoUxf+D-W5oSNwgjd1XatyhyQ@mail.gmail.com>
Subject: Re: [RFC 0/4] drm/mipi-dbi: Support panel drivers
To: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lusticky.cz; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=puPnLkvNLlCaYDgxdbRocelmYYmQ2dy5ZEvb1Px3hfI=;
 b=WDxUBwJoP8zvGiK4JJR/EL14hFPFrJud/on9J2Xe5/0ALu2aqRIX7qAQ+UEEnp/pcl
 4bFhI2HRzwdafJ043cX2cVG3HFmF05f8texkn5L3o4r1+gX6Bjufe2IBVlujxIsUpMjP
 ZFxgWR+IA9KMk/8J4XSnOj5D/ySZk5oads1PRbgodA7VxZgPpVEGxR9TbKEpfSwaYL7l
 bJs6P4Yx4H7zk46otiai+jqjOunWLsoFZaD4Lb4jVb96ghvmNQ6RjfTQmmYSVOEdj/4i
 5i9r5qnT6eaaZ19j84LxyDI5mA6fUc92Pj02q2GMLvfCgcPe9EvbsmSIjLKSir4xdmMo
 uoTg==
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

WWVzLCB0aGUgb25ib2FyZCBSQU0gaXMgaWxpOTM0MSBmZWF0dXJlLgpJIGFtIGFibGUgdG8gZHJp
dmUgdGhlIERpc3BsYXlUZWNoIERUMDI0Q1RGVCBwYW5lbCBpbiBib3RoIG1vZGVzLgoKSSd2ZSBq
dXN0IHRlc3RlZCB0aGUgRGlzcGxheVRlY2ggRFQwMjRDVEZUIHBhbmVsIHdpdGggeW91ciBwYXRj
aHNldAphbmQgaXQgd29ya3MgZmluZSB3aXRoIHBhcmFsbGVsIFJHQiBpbnB1dCBtb2RlOgpjb21w
YXRpYmxlID0gImRpc3BsYXl0ZWNoLGR0MDI0Y3RmdCIsICJpbGl0ZWssaWxpOTM0MSI7CmFuZCB3
aXRoIFNQSSBpbnB1dCBtb2RlOgpjb21wYXRpYmxlID0gIm1pLG1pMDI4M3F0IiwgImlsaXRlayxp
bGk5MzQxIjsKCkhvd2V2ZXIsIHRoZXJlIHNlZW1zIHRvIGJlIGFuIGlzc3VlIHdoZW4gaSB1c2UK
Y29tcGF0aWJsZSA9ICJkaXNwbGF5dGVjaCxkdDAyNGN0ZnQiLCAiaWxpdGVrLGlsaTkzNDEiOwpi
dXQgbm8gcG9ydCBwcm9wZXJ0eS4KVGhpcyBpcyBjYXVzZWQgYnkgY2FsbGluZyBkdDAyNGN0ZnRf
cHJlcGFyZSBpbiBzdWNoIGNhc2UuCgpJIHdvdWxkIGV4cGVjdGVkIHRoZSBkcml2ZXIgdG8gZmFs
bGJhY2sgdG8gU1BJIGlucHV0IG1vZGUgaW4gc3VjaCBjYXNlLgpJbiBvdGhlciB3b3JkcywgdGhl
IGlsaTkzNDEtYmFzZWQgcGFuZWxzIGNhbiBiZSB1c2VkIGluIGJvdGggbW9kZXMsCmJ1dCBub3Qg
YWxsIGRpc3BsYXlzIGF2YWlsYWJsZQpvbiB0aGUgbWFya2V0IHByb3ZpZGUgYnJlYWtvdXQgcGlu
cyBmb3IgdGhlIHBhcmFsbGVsIFJHQiBjb25uZWN0aW9uLgoKw7p0IDMwLiA3LiAyMDE5IHYgMTY6
MDggb2Rlc8OtbGF0ZWwgTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+IG5hcHNh
bDoKPgo+Cj4KPiBEZW4gMzAuMDcuMjAxOSAwOC40MCwgc2tyZXYgSm9zZWYgTHXFoXRpY2vDvToK
PiA+IEhpIE5vcmFsZiwKPiA+IHRoZSBwYXRjaCBzZXJpZXMgbG9va3MgZ29vZCwgc2VlIGNvbW1l
bnRzIGluIHRoZSBwYXRjaCBlbWFpbHMuCj4gPgo+ID4gT25lIHF1ZXN0aW9uOiBpcyB0aGVyZSBh
IGdlbmVyYWwgbWVjaGFuaXNtIHRvIHRlbGwgYSBkcml2ZXIgbm90IHRvIHVzZQo+ID4gcGFyYWxs
ZWwgUkdCIGV2ZW4gdGhvdWdoCj4gPiB0aGUgZGlzcGxheSBzdXBwb3J0cyBpdCBhbmQgInBvcnQi
IGlzIHNwZWNpZmllZCBpbiB0aGUgZGV2aWNlLXRyZWU/Cj4gPgo+Cj4gTm90IHRoYXQgSSBrbm93
IG9mLiBJdCB3YXMganVzdCBvbmUgZGlmZmVyZW5jZSB0aGF0IHN0b29kIG91dCB3aGljaAo+IHdv
dWxkIG1ha2UgaXQgZWFzeSB0byBoYXZlIHRoZSBzYW1lIHBhbmVsIGRyaXZlciBzdXBwb3J0IGJv
dGggRFBJIGFuZAo+IERCSSBwaXhlbCBtb2RlLgo+Cj4gU2luY2UgeW91ciBwYW5lbCBoYXMgYSBp
bGk5MzQxIEkgYXNzbXVlIGl0IGhhcyBvbmJvYXJkIFJBTT8gU28geW91Cj4gc2hvdWxkIGJlIGFi
bGUgdG8gZHJpdmUgeW91ciBkaXNwbGF5IGluIGJvdGggbW9kZXMgSSBndWVzcy4KPgo+IE5vcmFs
Zi4KPgo+ID4gSm9zZWYKPiA+Cj4gPiBwbyAyOS4gNy4gMjAxOSB2IDIxOjU1IG9kZXPDrWxhdGVs
IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPiBuYXBzYWw6Cj4gPj4KPiA+PiBJ
bnNwaXJlZCBieSB0aGUgdGhyZWFkWzFdIGZvbGxvd2luZyB0aGUgc3VibWlzc2lvbiBvZiBhIG5l
dyBpbGk5MzQxCj4gPj4gcGFuZWwgZHJpdmVyWzJdLCBJIHNldCBvdXQgdG8gc2VlIGlmIEkgY291
bGQgc3VwcG9ydCBwYW5lbCBkcml2ZXJzIGluCj4gPj4gZHJtX21pcGlfZGJpLgo+ID4+Cj4gPj4g
SSBoYXZlIGluY2x1ZGVkIHRoZSBvcmlnaW5hbCBkcml2ZXIsIGRvbmUgc29tZSBwcmVwIHdvcmsg
b24gaXQsIGFkZGVkCj4gPj4gcGFuZWwgc3VwcG9ydCB0byBkcm1fbWlwaV9kYmkgYW5kIGNvbnZl
cnRlZCBtaTAyODNxdCB0byB0aGlzIG5ldyBwYW5lbAo+ID4+IGRyaXZlci4KPiA+Pgo+ID4+IFRo
ZSBiaWcgcXVlc3Rpb24gaXMgd2hldGhlciBvciBub3QgcGFuZWwgZHJpdmVycyBzaG91bGQgYmUg
YWxsb3dlZCB0bwo+ID4+IHR1cm4gdGhlbXNlbHZlcyBpbnRvIGZ1bGwgZmxlZGdlZCBEUk0gZHJp
dmVycy4KPiA+Pgo+ID4+IE5vcmFsZi4KPiA+Pgo+ID4+IFsxXQo+ID4+IGh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2RyaS1kZXZlbC8yMDE5LUp1bHkvMjI4MTkzLmh0bWwK
PiA+PiBbMl0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzMxNjUyOC8K
PiA+Pgo+ID4+IEpvc2VmIEx1c3RpY2t5ICgxKToKPiA+PiAgIGRybS9wYW5lbDogQWRkIElsaXRl
ayBJTEk5MzQxIHBhcmFsbGVsIFJHQiBwYW5lbCBkcml2ZXIKPiA+Pgo+ID4+IE5vcmFsZiBUcsO4
bm5lcyAoMyk6Cj4gPj4gICBkcm0vcGFuZWwvaWxpOTM0MTogUmViYXNlIGFuZCBzb21lIG1vcmUK
PiA+PiAgIGRybS9taXBpLWRiaTogU3VwcG9ydCBjb21tYW5kIG1vZGUgcGFuZWwgZHJpdmVycwo+
ID4+ICAgZHJtL3BhbmVsL2lsaTkzNDE6IFN1cHBvcnQgbWkwMjgzcXQKPiA+Pgo+ID4+ICBNQUlO
VEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNiArCj4gPj4gIGRy
aXZlcnMvZ3B1L2RybS9kcm1fbWlwaV9kYmkuYyAgICAgICAgICAgICAgIHwgMTEwICsrKysrCj4g
Pj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9LY29uZmlnICAgICAgICAgICAgICAgIHwgICA5ICsK
PiA+PiAgZHJpdmVycy9ncHUvZHJtL3BhbmVsL01ha2VmaWxlICAgICAgICAgICAgICAgfCAgIDEg
Kwo+ID4+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtaWxpdGVrLWlsaTkzNDEuYyB8IDQ1
MiArKysrKysrKysrKysrKysrKysrCj4gPj4gIGluY2x1ZGUvZHJtL2RybV9taXBpX2RiaS5oICAg
ICAgICAgICAgICAgICAgIHwgICA4ICsKPiA+PiAgNiBmaWxlcyBjaGFuZ2VkLCA1ODYgaW5zZXJ0
aW9ucygrKQo+ID4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3Bh
bmVsLWlsaXRlay1pbGk5MzQxLmMKPiA+Pgo+ID4+IC0tCj4gPj4gMi4yMC4xCj4gPj4KPiA+Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
