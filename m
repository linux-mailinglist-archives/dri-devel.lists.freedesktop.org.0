Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF2472F3E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 14:54:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 706886E4B0;
	Wed, 24 Jul 2019 12:54:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 895A86E4B0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 12:54:01 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id p17so44408344ljg.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 05:54:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8s9iwMI4cfgXm2mI4kKjxaoQF77Iv3LnFssVNk4/AqE=;
 b=p6fS3Ql8cbAGtPFqD1oY0v01aMTmJGbpdYpghT4E8J0KzDDqV87AA/qRuwY9gbxO0o
 GN0TS62Ek44q4z02/Mw2w0m4b/Cj0Yche1m49fAIfJO7BGwZ2LXCNLVaxDPBdwE+YDr1
 yYvGLZqeC11qACobRo1dIAMc96CSyXUxb14K7NMAApFUxhnAnnUfGADOsGgh8fsT39da
 mzU6Ub8X8fZ+ye6pKrJaXFjghH/R4PcQ6GojsN28JWh63HKYV0jrQWq478Q8ATwHF3Dn
 Nc9I+OaP432MunvX4b2bGUVZvonGrez1XZR7FvhdE/pZ5xzKGNnOlKuhH0r4UflvgN5I
 V8wQ==
X-Gm-Message-State: APjAAAWE7Y8ijMT3V3VJ9XxoBOUBDnA4OJkfrMqmXTlFgRA551ml2jhQ
 8CIGv58enscmq0no+WAAy4YJTGvKeer/j3iw0jtMKQ==
X-Google-Smtp-Source: APXvYqxZKwYIfufL+NOiqSuv6XiPFbChSpOwB74aj0pQp3yYznJLElIPijgnRJJpEuGBIzDFWAWl2n2grgGihEArFZg=
X-Received: by 2002:a2e:9048:: with SMTP id n8mr23521163ljg.37.1563972839947; 
 Wed, 24 Jul 2019 05:53:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190723133755.22677-1-linus.walleij@linaro.org>
 <20190723181000.GA24663@ravnborg.org>
 <CACRpkdZhYy6o9xMD42pQm-MCZUi0EpXs1uwQg6D-B4NXpyMHWw@mail.gmail.com>
 <4d576e9cc749fc47b57f9bc64a082aa791e9780c.camel@arm.com>
In-Reply-To: <4d576e9cc749fc47b57f9bc64a082aa791e9780c.camel@arm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 24 Jul 2019 14:53:48 +0200
Message-ID: <CACRpkdYYcco-4+vOfNFTVvJ5Yb6t5HNdBZjT8T87J7G9egV=4Q@mail.gmail.com>
Subject: Re: [PATCH 0/3] RFT: PL111 DRM conversion of nspire
To: Pawel Moll <pawel.moll@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=8s9iwMI4cfgXm2mI4kKjxaoQF77Iv3LnFssVNk4/AqE=;
 b=e6gvQFZnmqmpSV1KLF5/Oh4lmuhM+EVXiC4pDDYJGMi/JyybPBcZWITgcypC2TuL6q
 kFoFmaW1yUWOnX+Ftl4FcvWz32H1FOQl1KpMftg/vudtHv+gDtsSwjJQ3eYnE6L7gbH0
 KP2NhVvUYl3AI47t8ya5DycFECEqq8+7pnhyaw7dySZptDVFwGKAokJt0aoZ2gIv9nC4
 r2hfHQfjWREb1kUs82nbNyI1zCfGlPvBLsm3VEa0TFkT/184d/gQ0IIoDHhnE1mCGaRG
 FJ5N3d/XGWgPQL4rn/UgoEpvu+1FTKfl0Z9kiVPUscZq0M4sceqio208VDrVLI3ABqm4
 HCLg==
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
Cc: Liviu Dudau <Liviu.Dudau@arm.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Fabian Vogt <fabian@ritter-vogt.de>, Daniel Tang <dt.tangr@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgMjo0NyBQTSBQYXdlbCBNb2xsIDxwYXdlbC5tb2xsQGFy
bS5jb20+IHdyb3RlOgo+IE9uIFdlZCwgMjAxOS0wNy0yNCBhdCAxMzoyOCArMDEwMCwgTGludXMg
V2FsbGVpaiB3cm90ZToKPiA+IE9uIFR1ZSwgSnVsIDIzLCAyMDE5IGF0IDg6MTAgUE0gU2FtIFJh
dm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPiB3cm90ZToKPiA+ID4gT24gVHVlLCBKdWwgMjMsIDIw
MTkgYXQgMDM6Mzc6NTJQTSArMDIwMCwgTGludXMgV2FsbGVpaiB3cm90ZToKPiA+ID4gRG8gd2Ug
bmVlZCB0byBzdXBwb3J0IGFybSxwbDExeCx0ZnQtcjBnMGIwLXBhZHMgYmVmb3JlCj4gPiA+IHdl
IGNhbiBvYnNvbGV0ZSBmYmRldiBzdHVmZj8KPiA+Cj4gPiBObyBJIGRvbid0IHRoaW5rIHNvLCB0
aGUgb25seSBpbi10cmVlIHBsYXRmb3JtIHRoYXQgd2FzIHVzaW5nIGl0IHdhcwo+ID4gdGhlIE5v
bWFkaWsgYW5kIGFsbCBpdCBkaWQgd2FzIHRvIHN3aXRjaCBSR0IgdG8gQkdSIGFuZAo+ID4gSSBh
bHJlYWR5IGhhbmRsZSB0aGF0IGluIHRoZSBkcml2ZXIgdXNpbmcgdGhlIGhhcmR3YXJlCj4gPiBm
ZWF0dXJlIHRvIHN3aXRjaCBSR0IgYW5kIEJHUiBhcm91bmQgaW5zdGVhZC4KPiA+Cj4gPiBSaWdo
dCBub3cgSSBqdXN0IGNoZWNrIHRoYXQgdGhlIHBhZHMgYXJlIHRoZXJlLCBJIG1pZ2h0IGp1c3QK
PiA+IHJlbW92ZSB0aGUgY2hlY2suCj4gPgo+ID4gSG93ZXZlciBQYXdlbCBhZGRlZCB0aGlzIGJp
bmRpbmcgYW5kIG1pZ2h0IGJlIGFibGUgdG8gdGVsbAo+ID4gc29tZXRoaW5nIGFib3V0IGlmIHRo
ZXJlIGFyZSBwbGF0Zm9ybXMgb3V0IHRoZXJlIHRoYXQgcmVhbGx5Cj4gPiBuZWVkcyB0aGlzLiBQ
b3NzaWJseSBMaXZpdSBrbm93cyBtb3JlLgo+Cj4gSXQgd2FzIG9ubHkgdGhlcmUgc28gdGhlIGZi
ZGV2IGRyaXZlciBjb3VsZCBmaWd1cmUgb3V0IHRoZSBvdXRwdXQgbW9kZS4KPiBJIHRha2UgdGhh
dCBEUk0gInBpcGVsaW5lIiBub3cgdGFrZXMgY2FyZSBvZiBpdCwgc28gSSdkIHNheSB0aGF0IHRo
ZQo+IG1vbWVudCB0aGUgZmJkZXYgZHJpdmVyIGRpZXMsIHRoZSBiaW5kaW5nIGNhbiBnbyBhbG9u
ZyA6LSkKCk9LIEknbGwgZ2V0IHJpZCBvZiBpdC4gOikKCllvdXJzLApMaW51cyBXYWxsZWlqCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
