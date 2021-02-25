Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D67393248AD
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 02:55:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F58E6E139;
	Thu, 25 Feb 2021 01:55:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 424E46E104;
 Thu, 25 Feb 2021 01:55:28 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id u20so6184310ejb.7;
 Wed, 24 Feb 2021 17:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=i3VIO1nHnPUxKu6tZXh33nsQtWjX1wulGCOkA+JXeHc=;
 b=E8R+Evj/3mi8rFmzXU6lIQUDGiJu14+B5T8SYnkK1zxuAJyBcwQ1CM5TxMDLZ7KtlT
 3kvOV2p5szayFxiYGJFc4kOopUQ8EH4N6eRu5NFRK7ZwUb08cAJxRW54fNsDYtPokvTl
 HI9crOrL2kwnd4plcHLD4ZD6b8O4Nsc/M+pEx0qeJc+K7ZvZkv5203V0MWkzRVxg58Yp
 sBTGpFvwslgBIZVp8QmESTKnECCjRPZLq4HLpkPzolAikrf0HiMLXslAU+2yCDYcssbC
 8VQGJr6tyB6285fdl26qBK9bP3khrEbgw8D+khFTP+m5BSqhXgA0kOzMzvw3XNmFeM1s
 gLpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=i3VIO1nHnPUxKu6tZXh33nsQtWjX1wulGCOkA+JXeHc=;
 b=VFKeKzUpnBY6qsVLIIDvyxxWEh0GizARI5MBGh5xuz/SYwm/nhk25hxZJzZEzs6I+U
 yHv4dumGWeUtlH/BYto72eSN3VIiDY7Qt3cWKfELNk/M7SeSZZNF81FC/ZI5qdLqYIiB
 a22dVtas6wcwyS5Gc6ZxEZmaZl5It10NXBodsn35di34C1bVRfrsT0JDeGdmG7Zon8VN
 Cwf+HP5lzINCsxJs10gGzajvGD7UDLkzItTD1X2nkW+s18sPFIK0JduaAXM7kDWnJz6Q
 BOTB/JWHe49Jn8ROFC4cF6Vu4jF4LASBtIeu+mO/fPkuTZb70mqYsdFvgPU5lV2lEuoV
 uXNw==
X-Gm-Message-State: AOAM532hnoPfPo128nHobTkbAvqqjNPVOw3YyYItGbh2dFQDBa+kfK7e
 Vo+k3xr0REua4H7JzkJaYO9VhBwsf/04iMqRnIo=
X-Google-Smtp-Source: ABdhPJy/UwLda6TcML22PaWGN7kr/Txag6r3KXc4fJwb7rSM0GND/t47VYbcSOA3ntD3QFR4KvTxuErEEfG5UAXJMfM=
X-Received: by 2002:a17:907:3e02:: with SMTP id
 hp2mr486960ejc.340.1614218126755; 
 Wed, 24 Feb 2021 17:55:26 -0800 (PST)
MIME-Version: 1.0
References: <YDYqJhsuNDKvD3V/@linux-uq9g>
In-Reply-To: <YDYqJhsuNDKvD3V/@linux-uq9g>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 25 Feb 2021 11:55:15 +1000
Message-ID: <CAPM=9tzu+Sa+1w4LCwdV0wsRCvqPnXSdrCxi-dTMxn+hN_Kz2A@mail.gmail.com>
Subject: Re: [PULL] drm-misc-fixes
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: "DRM maintainer tools announcements, discussion,
 and development" <dim-tools@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyNCBGZWIgMjAyMSBhdCAyMDoyNywgVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJt
YW5uQHN1c2UuZGU+IHdyb3RlOgo+Cj4gSGkgRGF2ZSBhbmQgRGFuaWVsLAo+Cj4gaGVyZSdzIHRo
aXMgd2VlaydzIFBSIGZvciBkcm0tbWlzYy1maXhlcy4gT25lIG9mIHRoZSBwYXRjaGVzIGlzIGEg
bWVtb3J5Cj4gbGVhazsgdGhlIHJlc3QgaXMgZm9yIGhhcmR3YXJlIGlzc3Vlcy4KPgoKVGhpcyBp
cyBiYXNlZCBvbiA1LjExIGFuZCBJJ20gbm90IGN1cnJlbnRseSBpbiB0aGUgbWFya2V0IGZvciBh
CmJhY2ttZWdlIG5vdyBiZWZvcmUgcmMxIHNvIGNhbiB5b3UganVzdCB0b3AgdGhpcyB1cCBuZXh0
IHdlZWs/CgpUaG91Z2ggbWF5YmUgdGhlIHR0bSBmaXggc2hvdWxkIGJlIGZhc3QgdHJhY2tlZCwg
d2lsbCBjb250ZW1wbGF0ZSBpdC4KCkRhdmUuCgo+IEJlc3QgcmVnYXJkcwo+IFRob21hcwo+Cj4g
ZHJtLW1pc2MtZml4ZXMtMjAyMS0wMi0yNDoKPiAgKiBkcm0vcGFuZWw6IGtkMzV0MTMzOiBXb3Jr
IHdpdGggbm9uLWNvbnRpbnVvdXMgRFNJIGNsb2NrCj4gICogZHJtL3JvY2tjaGlwOiBSZXF1aXJl
IFlUUiBtb2RpZmllciBmb3IgQUZCQwo+ICAqIGRybS90dG06IEZpeCBhIG1lbW9yeSBsZWFrIGlu
IGVycm9yIGhhbmRsaW5nCj4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBmNDBk
ZGNlODg1OTM0ODI5MTk3NjFmNzQ5MTBmNDJmNGI4NGMwMDRiOgo+Cj4gICBMaW51eCA1LjExICgy
MDIxLTAyLTE0IDE0OjMyOjI0IC0wODAwKQo+Cj4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJl
cG9zaXRvcnkgYXQ6Cj4KPiAgIGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0t
bWlzYyB0YWdzL2RybS1taXNjLWZpeGVzLTIwMjEtMDItMjQKPgo+IGZvciB5b3UgdG8gZmV0Y2gg
Y2hhbmdlcyB1cCB0byA1NGRhYjNhNzE4ZjcwOTQ1MzJkYWY3ZDI1Y2QxNDEyMWEwZTAwZTM0Ogo+
Cj4gICBkcm0vcGFuZWw6IGtkMzV0MTMzOiBhbGxvdyB1c2luZyBub24tY29udGludW91cyBkc2kg
Y2xvY2sgKDIwMjEtMDItMjMgMjI6NDQ6NTggKzAxMDApCj4KPiAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gICogZHJtL3Bh
bmVsOiBrZDM1dDEzMzogV29yayB3aXRoIG5vbi1jb250aW51b3VzIERTSSBjbG9jawo+ICAqIGRy
bS9yb2NrY2hpcDogUmVxdWlyZSBZVFIgbW9kaWZpZXIgZm9yIEFGQkMKPiAgKiBkcm0vdHRtOiBG
aXggYSBtZW1vcnkgbGVhayBpbiBlcnJvciBoYW5kbGluZwo+Cj4gLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IEFseXNzYSBS
b3Nlbnp3ZWlnICgxKToKPiAgICAgICBkcm0vcm9ja2NoaXA6IFJlcXVpcmUgdGhlIFlUUiBtb2Rp
ZmllciBmb3IgQUZCQwo+Cj4gSGVpa28gU3R1ZWJuZXIgKDEpOgo+ICAgICAgIGRybS9wYW5lbDog
a2QzNXQxMzM6IGFsbG93IHVzaW5nIG5vbi1jb250aW51b3VzIGRzaSBjbG9jawo+Cj4geGluaHVp
IHBhbiAoMSk6Cj4gICAgICAgZHJtL3R0bTogRml4IGEgbWVtb3J5IGxlYWsKPgo+ICBkcml2ZXJz
L2dwdS9kcm0vcGFuZWwvcGFuZWwtZWxpZGEta2QzNXQxMzMuYyB8ICAzICsrLQo+ICBkcml2ZXJz
L2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5oICB8IDExICsrKysrKysrKysrCj4g
IGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgICAgICAgICAgICAgICAgIHwgIDkgKysrKysr
LS0tCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
Pgo+IC0tCj4gVGhvbWFzIFppbW1lcm1hbm4KPiBHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyCj4g
U1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJICj4gTWF4ZmVsZHN0ci4gNSwgOTA0
MDkgTsO8cm5iZXJnLCBHZXJtYW55Cj4gKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQo+IEdlc2No
w6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
