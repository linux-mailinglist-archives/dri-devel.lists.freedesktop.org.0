Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B33CB2B5B25
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 09:42:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B57F6E134;
	Tue, 17 Nov 2020 08:42:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F41E06E134
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 08:42:44 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id s13so2416757wmh.4
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 00:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=INVepkInhsjBHSvjvAvny9URQAKXqQU8PTJjrdyilLg=;
 b=TZQDVLDqGyhoKFtvLeWZ9D6JvfFDVq4YVlcxXgVDbox+jB0SsBAUuhzq4kxSLDZLx7
 tA+VgCtW1erqoJIc8z07yw3lm6p8aZlF55+CU1a7SzZKEte8obieZnLXPaDlPWhdMJ0T
 Bz7aMyMAkSstYfbqY8YRK0KEK1Hpk+DQlDbvnl78N4YGpH6p33GTCcEdYX2FRd1u/6ea
 7BYX2gQh2juy/3g7glEG9oyJOHulags6Aoj+YnqU8fr0YPt3p9UY/4jeRTV1x3TF2cOD
 Qxda6iNjGPjBT6bKBIWqkOT/jfZoXTNaIyZFygEK6H1052iF37L+TESdmQwARohUr/63
 7bzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=INVepkInhsjBHSvjvAvny9URQAKXqQU8PTJjrdyilLg=;
 b=g+2FtS0PZLQp1HZWO+6M/21p4WAvF6iAGCaU/cnHinLfMk0obcEKc3ZE7OF347yakO
 wIAo35lDZHlkvnw2D8vkRu4YfSRjUIw3qImaSR9EZCo5SIPfnq8t4mD+411q6JCt0iJZ
 TvVobss7UfCNzOuoX+lo1C6N7EnRYS7XPk13372DLXSLSfXjQkF9IZaVOfUtbnxWQOPj
 vOFz3IlVy+mq+dcc4dvR0gGXRruwWFjI47M1sd9Ky11DanNHmCdiuG7yfMoG6bvno9m6
 fNftc32y9/vDGBrJb8DpcmVfpUmq4Z+s1VJc39B6sndVdw9NkVCr1wWhPV2AQ5WHCNEw
 mfmQ==
X-Gm-Message-State: AOAM532H04kv216CiGptpmJx0PsHf61x32Zs1WhQye7xutgyNoQUBaka
 iwyskmbsMrR7ZXuFzRcpsKGLjIxbehOHvZj/
X-Google-Smtp-Source: ABdhPJyNVLesnBzBLGwI8R/r91IU6DQIR0oUVG7aPWGO4TNkn9RRrKNJU7HvQjW4Pp8LVhnPffCnxg==
X-Received: by 2002:a1c:6284:: with SMTP id w126mr3140057wmb.145.1605602563687; 
 Tue, 17 Nov 2020 00:42:43 -0800 (PST)
Received: from dell ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id o17sm2471180wmd.34.2020.11.17.00.42.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 00:42:42 -0800 (PST)
Date: Tue, 17 Nov 2020 08:42:41 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 01/43] drm/radeon/atombios_encoders: Move
 'radeon_atom_get_tv_timings()'s prototype into shared location
Message-ID: <20201117084241.GC1869941@dell>
References: <20201116173005.1825880-1-lee.jones@linaro.org>
 <20201116173005.1825880-2-lee.jones@linaro.org>
 <CADnq5_NnPiySfPv4Jgk4j8rvzxYkoVxRBGUAjdQJW_tL2RuTBA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_NnPiySfPv4Jgk4j8rvzxYkoVxRBGUAjdQJW_tL2RuTBA@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAxNiBOb3YgMjAyMCwgQWxleCBEZXVjaGVyIHdyb3RlOgoKPiBPbiBNb24sIE5vdiAx
NiwgMjAyMCBhdCAxMjozMCBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPiB3cm90
ZToKPiA+Cj4gPiBGaXhlcyB0aGUgZm9sbG93aW5nIFc9MSBrZXJuZWwgYnVpbGQgd2FybmluZyhz
KToKPiA+Cj4gPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fYXRvbWJpb3MuYzoxNzkx
OjY6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYcmFkZW9uX2F0b21fZ2V0
X3R2X3RpbWluZ3PigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQo+ID4gIDE3OTEgfCBib29sIHJh
ZGVvbl9hdG9tX2dldF90dl90aW1pbmdzKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LCBpbnQg
aW5kZXgsCj4gPiAgfCBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+ID4KPiA+IENjOiBBbGV4
IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gPiBDYzogIkNocmlzdGlhbiBL
w7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gPiBDYzogRGF2aWQgQWlybGllIDxh
aXJsaWVkQGxpbnV4LmllPgo+ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4K
PiA+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gQ2M6IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpv
bmVzQGxpbmFyby5vcmc+Cj4gCj4gQXBwbGllZC4gIFRoYW5rcyEKClN1cGVyc3RhciEgIFRoYW5r
cyBBbGV4LgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpTZW5pb3IgVGVjaG5pY2FsIExlYWQg
LSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUg
Zm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
