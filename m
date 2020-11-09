Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A652AC5BE
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 21:10:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E04828933D;
	Mon,  9 Nov 2020 20:10:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CDBE89349
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 20:10:17 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id j7so2914024wrp.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 12:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=isstW/OQk5HF3Gxwa/5PQfQfcdrrAl2gRootGHnfwmg=;
 b=b9PmNSlYDGTXgm8+ZOIIw75Zz9FayKmlZQMBFlq/6mVfAnkO2nu9FcaF8z3RttXIfL
 RO/f2qxY0L6ynfjlbKeCZPMyVwGDZ8bPS2WmdyZemy2grq6uchKDGN2aYda4e/voohrD
 CwWuP4BZaDa2HexXo5kLW3NptPW+USNYlfTX+IBqq56jlF/BNvsQsASxiTjyYyITR2sH
 1wzWJzmaNN2ZFteRqeLGBMDMsXz47vel7gFor5RGXrxvikzV13MMET4OtobqCexiir7T
 wmxgMJsGeysAgpBolAjAjB5Saukm+TsTubOenqrRUR18r7h9ZAzZ7KHLkFcCp2qOF5Qs
 Hqvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=isstW/OQk5HF3Gxwa/5PQfQfcdrrAl2gRootGHnfwmg=;
 b=t4Ogo+bfFwR6Y4HWBAfgqy0KwEY7d8QOmUYT0Uwljpe4Sbdvr5USKDXdw5F+C5lKwX
 CXRck3Jc7P/WWkZv+pNx/WXsrbCdTZAMAdEVwvy10Hf/3OrfArPKc5L6CYa07iyLtQMd
 tgOcAIHK9D3o22oEw27zEwiCoBVU4MNQ6yY4ZEepGTxgB+izEhobHMjBxOfjId72n+S6
 HkhLLdeKMRvMlFtlX8T35AmywQ43ZJb4YjrjaSto1jPJjcXr02C6JTaD2NyOYBeyhHmt
 hWKGDKpJDyV1UoXd6lSD9eRyN1auCJMXQtTT1nsi0fqBbbHBujeF9MXZDYUQKy7DuZgD
 amCA==
X-Gm-Message-State: AOAM530X7mWz40aeDUNYJWl/vLbNmR+hVGJV80XX7NBk6dTzEjfQfGS9
 B6b7pNh8q6twjv2gaULPPW2hDg==
X-Google-Smtp-Source: ABdhPJwRP64JX7Dk2MtRgSE5kSbKtijqBvDcNaWUAaSen1GtFQoR1jaGfzfICezOVQkVgHguI9UVxg==
X-Received: by 2002:a5d:474d:: with SMTP id o13mr21094236wrs.178.1604952616295; 
 Mon, 09 Nov 2020 12:10:16 -0800 (PST)
Received: from dell ([91.110.221.139])
 by smtp.gmail.com with ESMTPSA id v12sm15258395wro.72.2020.11.09.12.10.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 12:10:15 -0800 (PST)
Date: Mon, 9 Nov 2020 20:10:13 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 17/19] drm/radeon/radeon_kms: Fix misnaming of
 'radeon_info_ioctl's dev param
Message-ID: <20201109201013.GC2063125@dell>
References: <20201106214949.2042120-1-lee.jones@linaro.org>
 <20201106214949.2042120-18-lee.jones@linaro.org>
 <CADnq5_Nys7igVo3sgzK0D4hnm=RHMrEM7Xty80jGROu_sy5svA@mail.gmail.com>
 <20201109195557.GA1940813@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201109195557.GA1940813@ravnborg.org>
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
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAwOSBOb3YgMjAyMCwgU2FtIFJhdm5ib3JnIHdyb3RlOgoKPiBIaSBBbGV4LAo+IE9u
IE1vbiwgTm92IDA5LCAyMDIwIGF0IDAyOjUwOjM1UE0gLTA1MDAsIEFsZXggRGV1Y2hlciB3cm90
ZToKPiA+IE9uIEZyaSwgTm92IDYsIDIwMjAgYXQgNDo1MCBQTSBMZWUgSm9uZXMgPGxlZS5qb25l
c0BsaW5hcm8ub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEg
a2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6Cj4gPiA+Cj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vcmFk
ZW9uL3JhZGVvbl9rbXMuYzoyMjY6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1i
ZXIgJ2Rldicgbm90IGRlc2NyaWJlZCBpbiAncmFkZW9uX2luZm9faW9jdGwnCj4gPiA+ICBkcml2
ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9rbXMuYzoyMjY6IHdhcm5pbmc6IEV4Y2VzcyBmdW5j
dGlvbiBwYXJhbWV0ZXIgJ3JkZXYnIGRlc2NyaXB0aW9uIGluICdyYWRlb25faW5mb19pb2N0bCcK
PiA+ID4KPiA+ID4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4K
PiA+ID4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+
ID4gPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+ID4gPiBDYzogRGFuaWVs
IFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+ID4gPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiA+ID4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+ID4g
U2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KPiA+ID4gLS0t
Cj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9rbXMuYyB8IDIgKy0KPiA+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4gPgo+ID4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fa21zLmMgYi9kcml2
ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9rbXMuYwo+ID4gPiBpbmRleCAwZDhmYmFiZmZjZWFk
Li4yMWMyMDY3OTVjMzY0IDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L3JhZGVvbl9rbXMuYwo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9r
bXMuYwo+ID4gPiBAQCAtMjEzLDcgKzIxMyw3IEBAIHN0YXRpYyB2b2lkIHJhZGVvbl9zZXRfZmls
cF9yaWdodHMoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPiA+ID4gIC8qKgo+ID4gPiAgICogcmFk
ZW9uX2luZm9faW9jdGwgLSBhbnN3ZXIgYSBkZXZpY2Ugc3BlY2lmaWMgcmVxdWVzdC4KPiA+ID4g
ICAqCj4gPiA+IC0gKiBAcmRldjogcmFkZW9uIGRldmljZSBwb2ludGVyCj4gPiA+ICsgKiBAZGV2
OiByYWRlb24gZGV2aWNlIHBvaW50ZXIKPiA+IAo+ID4gVGhpcyBzaG91bGQgYmU6Cj4gPiArICog
QGRldjogZHJtIGRldmljZSBwb2ludGVyCj4gCj4gZ29vZCBzcG90LiBJIGFtIGNvbnRpbnVpbmcg
dGhlIHdvcmsgb24gcmFkZW9uIGFuZCB3aWxsIHBvc3QgYSBwYXRjaHNldAo+IHRoYXQgY29udGFp
bnMgb25seSByYWRlb24gZml4ZXMgd2l0aCBMZWUncyBwYXRjaGVzIGFuZCBhIGZldyBtb3JlIGJ5
IG1lLgo+IEkgd2lsbCBmaXggdGhlIGFib3ZlLgoKV2hhdCBkbyB5b3UgbWVhbiBieSAiY29udGlu
dWluZyBvbiI/CgpIb3cgd2lsbCB5b3UgcHJldmVudCB5b3VyIHdvcmsgZnJvbSBjb25mbGljdGlu
ZyB3aXRoIG15IGN1cnJlbnQgZWZmb3J0PwoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpTZW5p
b3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIgT3Bl
biBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwg
VHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
