Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F80A29A57
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 16:49:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 014D36E0E8;
	Fri, 24 May 2019 14:49:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D35A26E0E8
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 14:49:14 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id i3so9670981wml.4
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 07:49:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=M1OVfqkksdeurBVUMPNqtFo9e47tslxfnlj6Q1FVC7s=;
 b=BFjI6IsXxLNDTUhsfIH459F7adLYhuB5DQyb+CafuPvFyrYOHvRcrLZ649RXOUi1sm
 Ibmu1rI0uAJaN7kXStT4su+TyP3mPoR83k8yohyzY83WU2yLxwIbcT+ScJckhjciWI/Y
 CuFT+FG1KP/RgiNfMbTRringTlQ4A8cbhciopIzE6ScTC56ubUjOwTqKyi41xg7DNwO2
 OsovuScZJmGPVh98EWx4NDv4RiknIjVliMqucAIWVuYzBtwA4k67vpKSmhAb9hwnkdTi
 yiCUQ1ld9YRsxYYs8Ommv8vmdbHoVNTuss1Dg05lmNs2njqTBQfi0SV5jW1tAM+cRTLi
 SLBg==
X-Gm-Message-State: APjAAAVdUXhUxbIjf2d+s9gcf828/joTNI9tfhY0sBbFweg/yixQieri
 K7HSivU7f1ex3myQNnNY092Ukw==
X-Google-Smtp-Source: APXvYqxYJ1yQsTD5Dm2L9ePvKHSZvu8av4zCv2xTmS5i9JL+H8Cen0n+w4WLmVz0CdD8t0e2ooexWw==
X-Received: by 2002:a1c:1bc5:: with SMTP id b188mr144055wmb.174.1558709353426; 
 Fri, 24 May 2019 07:49:13 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f8:1c0c:6c86:46e0:a7ad:5246:f04d])
 by smtp.gmail.com with ESMTPSA id z4sm2558108wru.69.2019.05.24.07.49.11
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 May 2019 07:49:12 -0700 (PDT)
Subject: Re: [PATCH] drm/i915/dsi: Use a fuzzy check for burst mode clock check
To: Daniel Vetter <daniel.vetter@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20190524130607.4021-1-hdegoede@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <2c8453e4-286b-2a05-4481-ac7f4b1843d9@redhat.com>
Date: Fri, 24 May 2019 16:49:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190524130607.4021-1-hdegoede@redhat.com>
Content-Language: en-US
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiA1LzI0LzE5IDM6MDYgUE0sIEhhbnMgZGUgR29lZGUgd3JvdGU6Cj4gUHJpb3IgdG8g
dGhpcyBjb21taXQgd2UgZmFpbCB0byBpbml0IHRoZSBEU0kgcGFuZWwgb24gdGhlIEdQRCBNaWNy
b1BDOgo+IGh0dHBzOi8vd3d3LmluZGllZ29nby5jb20vcHJvamVjdHMvZ3BkLW1pY3JvcGMtNi1p
bmNoLWhhbmRoZWxkLWluZHVzdHJ5LWxhcHRvcCMvCj4gCj4gVGhlIHByb2JsZW0gaXMgaW50ZWxf
ZHNpX3ZidF9pbml0KCkgZmFpbGluZyB3aXRoIHRoZSBmb2xsb3dpbmcgZXJyb3I6Cj4gKkVSUk9S
KiBCdXJzdCBtb2RlIGZyZXEgaXMgbGVzcyB0aGFuIGNvbXB1dGVkCj4gCj4gVGhlIHBjbGsgaW4g
dGhlIFZCVCBwYW5lbCBtb2RlbGluZSBpcyA3MDAwMCwgdG9nZXRoZXIgd2l0aCAyNCBicHAgYW5k
Cj4gNCBsaW5lcyB0aGlzIHJlc3VsdHMgaW4gYSBiaXRyYXRlIHZhbHVlIG9mIDcwMDAwICogMjQg
LyA0ID0gNDIwMDAwLgo+IEJ1dCB0aGUgdGFyZ2V0X2J1cnN0X21vZGVfZnJlcSBpbiB0aGUgVkJU
IGlzIDQxODAwMC4KPiAKPiBUaGlzIGNvbW1pdCB3b3JrcyBhcm91bmQgdGhpcyBwcm9ibGVtIGJ5
IGFkZGluZyBhbiBpbnRlbF9mdXp6eV9jbG9ja19jaGVjawo+IHdoZW4gdGFyZ2V0X2J1cnN0X21v
ZGVfZnJlcSA8IGJpdHJhdGUgYW5kIHNldHRpbmcgdGFyZ2V0X2J1cnN0X21vZGVfZnJlcSB0bwo+
IGJpdHJhdGUgd2hlbiB0aGF0IGNoZWNrcyBzdWNjZWVkcywgZml4aW5nIHRoZSBwYW5lbCBub3Qg
d29ya2luZy4KPiAKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6
IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+CgpJIGp1c3QgcmVhbGl6ZWQgdGhh
dCB0aGlzIHBhdGNoIGRlcGVuZHMgb24gYSBwYXRjaCBmcm9tIGFub3RoZXIgc2VyaWVzIG9mCm1p
bmUgd2hpY2ggZXhwb3J0cyBpbnRlbF9mdXp6eV9jbG9ja19jaGVjaywgSSB3aWxsIHJlc2VuZCB0
aGlzIGFzIGEgc2VyaWVzCndpdGggdGhlIHBhdGNoIGRvaW5nIHRoZSBleHBvcnRpbmcgYXMgZmly
c3QgcGF0Y2gsIHNvIHRoYXQgdGhlIENJIGNhbiB0ZXN0CnRoaXMuCgpSZWdhcmRzLAoKSGFucwoK
Cj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9kc2lfdmJ0LmMgfCAxMSArKysr
KysrKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZHNpX3ZidC5jIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvaW50ZWxfZHNpX3ZidC5jCj4gaW5kZXggMDIyYmY1OTQxOGRmLi5hMmE5YjlkMGVl
YWEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZHNpX3ZidC5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZHNpX3ZidC5jCj4gQEAgLTg5NSw2ICs4
OTUsMTcgQEAgYm9vbCBpbnRlbF9kc2lfdmJ0X2luaXQoc3RydWN0IGludGVsX2RzaSAqaW50ZWxf
ZHNpLCB1MTYgcGFuZWxfaWQpCj4gICAJCWlmIChtaXBpX2NvbmZpZy0+dGFyZ2V0X2J1cnN0X21v
ZGVfZnJlcSkgewo+ICAgCQkJdTMyIGJpdHJhdGUgPSBpbnRlbF9kc2lfYml0cmF0ZShpbnRlbF9k
c2kpOwo+ICAgCj4gKwkJCS8qCj4gKwkJCSAqIFNvbWV0aW1lcyB0aGUgVkJUIGNvbnRhaW5zIGEg
c2xpZ2h0bHkgbG93ZXIgY2xvY2ssCj4gKwkJCSAqIHRoZW4gdGhlIGJpdHJhdGUgd2UgaGF2ZSBj
YWxjdWxhdGVkLCBpbiB0aGlzIGNhc2UKPiArCQkJICoganVzdCByZXBsYWNlIGl0IHdpdGggdGhl
IGNhbGN1bGF0ZWQgYml0cmF0ZS4KPiArCQkJICovCj4gKwkJCWlmIChtaXBpX2NvbmZpZy0+dGFy
Z2V0X2J1cnN0X21vZGVfZnJlcSA8IGJpdHJhdGUgJiYKPiArCQkJICAgIGludGVsX2Z1enp5X2Ns
b2NrX2NoZWNrKAo+ICsJCQkJCW1pcGlfY29uZmlnLT50YXJnZXRfYnVyc3RfbW9kZV9mcmVxLAo+
ICsJCQkJCWJpdHJhdGUpKQo+ICsJCQkJbWlwaV9jb25maWctPnRhcmdldF9idXJzdF9tb2RlX2Zy
ZXEgPSBiaXRyYXRlOwo+ICsKPiAgIAkJCWlmIChtaXBpX2NvbmZpZy0+dGFyZ2V0X2J1cnN0X21v
ZGVfZnJlcSA8IGJpdHJhdGUpIHsKPiAgIAkJCQlEUk1fRVJST1IoIkJ1cnN0IG1vZGUgZnJlcSBp
cyBsZXNzIHRoYW4gY29tcHV0ZWRcbiIpOwo+ICAgCQkJCXJldHVybiBmYWxzZTsKPiAKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
