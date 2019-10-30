Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C50EA456
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 20:41:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A8576EB4A;
	Wed, 30 Oct 2019 19:41:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B52BE6EB4A
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 19:41:27 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 777032080F
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 19:41:27 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id 205so2751336qkk.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 12:41:27 -0700 (PDT)
X-Gm-Message-State: APjAAAXE58xlh+DudLKOcnf6SHOIYWQZi+CaC7xbC/7eLCIcD5rn/m/T
 ZFnFajDLWYdDIyTrlZ0HkLXHSKozkdVvK4t6AA==
X-Google-Smtp-Source: APXvYqyqvg1+Tn9FCoTzJRFYxnTWFSAJoGx39ID8013WQzouA2EwiIVIg/nn1CY/2mAcs3a3eQwalerO9PIt0pcGXBw=
X-Received: by 2002:a05:620a:226:: with SMTP id
 u6mr1642377qkm.393.1572464486591; 
 Wed, 30 Oct 2019 12:41:26 -0700 (PDT)
MIME-Version: 1.0
References: <20191024114305.15581-1-linus.walleij@linaro.org>
 <20191024114305.15581-2-linus.walleij@linaro.org>
 <20191025192518.GA19549@bogus>
 <CACRpkdY8+Xa=QeTE6OQvZ6ZVkT14OapRLvGEmdsOhi0+==LPiw@mail.gmail.com>
In-Reply-To: <CACRpkdY8+Xa=QeTE6OQvZ6ZVkT14OapRLvGEmdsOhi0+==LPiw@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 30 Oct 2019 14:41:14 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+QkkX-Z+NEQ-DN5Z2GnaY5qV+jYGAU9EBhhEeSKoU0zA@mail.gmail.com>
Message-ID: <CAL_Jsq+QkkX-Z+NEQ-DN5Z2GnaY5qV+jYGAU9EBhhEeSKoU0zA@mail.gmail.com>
Subject: Re: [PATCH 2/3 v4] drm/panel: Add DT bindings for Sony ACX424AKP
To: Linus Walleij <linus.walleij@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1572464487;
 bh=bzbwyhdayJegZ3qLWnAfsQsZg12zuM3q8+iXodg7BYE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=EGKDEoog2zh179T1Ge/i3+Kc+qMFR3pwou11q79nQEhFwFwoAHSu3bcK/jEWKfoLi
 ncYnGWGOVlkFntBdclMOom+3yvIgj4WoHuBmBg978bJh2Maq2wqHM3ZLNbprkyzVcv
 CMmcDV0dlqIOQQXkNH02WGawJHahJn8U1UnFhFQU=
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMzAsIDIwMTkgYXQgMTE6MzggQU0gTGludXMgV2FsbGVpaiA8bGludXMud2Fs
bGVpakBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgT2N0IDI1LCAyMDE5IGF0IDk6MjUg
UE0gUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiBPbiBUaHUsIE9jdCAy
NCwgMjAxOSBhdCAwMTo0MzowNFBNICswMjAwLCBMaW51cyBXYWxsZWlqIHdyb3RlOgo+ID4gPiBU
aGlzIGFkZHMgZGV2aWNlIHRyZWUgYmluZGluZ3MgZm9yIHRoZSBTb255IEFDWDQyNEFLUCBwYW5l
bC4KPiA+ID4gTGV0J3MgdXNlIFlBTUwuCj4gPgo+ID4gQWxzbyBicm9rZW4uIFJ1biAnbWFrZSBk
dF9iaW5kaW5nX2NoZWNrJy4KPgo+IFRoYXQgaXMgd2hhdCBJJ20gZG9pbmcuCj4KPiBtYWtlIC1m
IE1ha2VmaWxlIC1qNSAtbDQgQVJDSD1hcm0gQ1JPU1NfQ09NUElMRT1hcm0tbGludXgtZ251ZWFi
aWhmLQo+IEtCVUlMRF9PVVRQVVQ9L2hvbWUvbGludXMvbGludXgtc3Rlcmljc3Nvbi9idWlsZC11
eDUwMAo+IGR0X2JpbmRpbmdfY2hlY2sKPiAgIENIS0RUICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvc29ueSxhY3g0MjRha3AueWFtbAo+ICAgQ0hLRFQg
ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9kc2ktY29udHJvbGxl
ci55YW1sCj4gICBTQ0hFTUEgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wcm9j
ZXNzZWQtc2NoZW1hLnlhbWwKPiAoLi4uKQo+Cj4gSSdtIGEgYml0IHVuc3VyZSBob3cgdGhpcyB0
aGluZyB3b3Jrcy4gQXJlIHRoZSBzZXZlcmFsIHBhc3Nlcz8KPiBCZWNhdXNlIGxhdGVyIG9uIHRo
aXMgYnJlYWtzIGJlY2F1c2Ugb2YgYW4gdW5yZWxhdGVkIGVycm9yIGluCj4gdGhlIGJpbmRpbmdz
IHVwc3RyZWFtOgo+IC9ob21lL2xpbnVzL2xpbnV4LXN0ZXJpY3Nzb24vRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3JlZ3VsYXRvci9maXhlZC1yZWd1bGF0b3IueWFtbDoKPiBwcm9w
ZXJ0aWVzOmNvbXBhdGlibGU6ZW51bTowOiB7J2NvbnN0JzogJ3JlZ3VsYXRvci1maXhlZCd9IGlz
IG5vdCBvZgo+IHR5cGUgJ3N0cmluZycKPiAvaG9tZS9saW51cy9saW51eC1zdGVyaWNzc29uL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZWd1bGF0b3IvZml4ZWQtcmVndWxhdG9y
LnlhbWw6Cj4gcHJvcGVydGllczpjb21wYXRpYmxlOmVudW06MTogeydjb25zdCc6ICdyZWd1bGF0
b3ItZml4ZWQtY2xvY2snfSBpcwo+IG5vdCBvZiB0eXBlICdzdHJpbmcnCj4gKC4uLikKPgo+IFRo
aXMgaXMgdjUuNC1yYzEuCj4KPiBJcyB0aGVyZSBhbnkgd2F5IEkgY2FuIHNlbGVjdGl2ZWx5IG1h
a2UgZHRfYmluZGluZ3NfY2hlY2sganVzdCB0YXJnZXQKPiB0aGUgZmlsZXMgSSB3YW5uYSBjaGVj
ayBhcyBhbnkgYnJva2VubmVzcyB1cHN0cmVhbSBjYXVzZSBwcm9ibGVtcwo+IGxpa2UgdGhpcz8g
KEFuZCBJIGFzc3VtZSB0aGF0IHdpbGwga2VlcCBoYXBwZW5pbmcuKQoKSSBwYXNzICctaycgdG8g
bWFrZSBzbyB3ZSBkb24ndCBzdG9wLiBZb3UgY2FuIGFsc28gc2V0IERUX1NDSEVNQV9GSUxFUwp0
byB0aGUgZmlsZSB5b3Ugd2FudCB0byBjaGVjay4gTGludXMnIHRyZWUgaXMgZml4ZWQgbm93IChh
bmQgbmV4dCBqdXN0CmJyb2tlIDooICkuCgpZZXMsIGl0IHdpbGwga2VlcCBoYXBwZW5pbmcgYXMg
bG9uZyBhcyBtYWludGFpbmVycyBkb24ndCBydW4gY2hlY2tzCmFuZC9vciB0YWtlIHBhdGNoZXMg
YmVmb3JlIEkgcmV2aWV3IHRoZW0uCgpSb2IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
