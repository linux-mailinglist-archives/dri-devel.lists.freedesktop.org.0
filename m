Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D021A2E2AED
	for <lists+dri-devel@lfdr.de>; Fri, 25 Dec 2020 10:43:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DE6989C17;
	Fri, 25 Dec 2020 09:42:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD6F89F0A
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 20:59:07 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id b26so373903lff.9
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 12:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Paa/2Zgj9P95KKc/EM4S7akG+ebzd49b55aHgCq35nI=;
 b=XibHKH3lzyJ51D/2fdl3IDTxBo+rRPAAso0PTw2bRoWelBOVEL12b7vwet0Ap9n5W/
 iHT5gL1JD+4QKml3ZP2aP0n3RBt0RN7ir97YoOWNTIZ2D2FPDYG0Bu1MtIl59JE7bwYj
 dwB82UnkgMsHeCO1nayJVc0DLP4LtQ0gf4Lomocpe3wkhJRzC22NNd1qM4yBYcMAR9je
 G94iZSSXqDfiIUFnvAGE74PDAnS0pUxSheRKscYATXlTPxodyK0omHX01vBF9Md28k9L
 vf+lyl2JX91DHr/gEYGq3R08Fe+EGuPHqDa9SLOJLqi0ncmOusUTwTDaN7y0qYK1D85b
 A5ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Paa/2Zgj9P95KKc/EM4S7akG+ebzd49b55aHgCq35nI=;
 b=N+kSRUF8C+Cj6zqhOgC/ZTmG1j/NqtRFoYpZRYmuXPDtRAew1c3RZKsOQtV0SQ8i5J
 r9Zp8j4Op83Fi6QNUrQLYqXcT6Pel6BXmmMDgkXtHFJnwnNBh+MOTPN6MmXG4/jxFg6/
 yN5/us99OeZecupKdq8RJgYzi1pzZ++BT8KvhFyek1tKHXv0mujPPkuyfCC557t8REQP
 RMH2akoEcBN6U6fgfLmn4HndGr8hv6PPExocE9iw6Nveo5KgvWnvv/o9qVTyt027uPqO
 Ye3ZP5nadrNNDtZwsvi2w2lb4U+V4Mba13rva38/7JorR+jKeSOnOz0eF1CrEnlMGVRZ
 YPNA==
X-Gm-Message-State: AOAM530d1nWWCSLX8SfTfn0IlPIe1KrQGNwCkN9N6bIKujR+H3UFLpCp
 RKCShIMGiqMCvbPL3aPAN2Q=
X-Google-Smtp-Source: ABdhPJwgEzvh9ANtO8Hu+EE0UE3MF2J6XaYsYVTo0A5GcIAKl9dNfg1svW44bV8UGc4vRAGfTLm3lQ==
X-Received: by 2002:a19:801:: with SMTP id 1mr11053288lfi.113.1608757146318;
 Wed, 23 Dec 2020 12:59:06 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.googlemail.com with ESMTPSA id p24sm3346902lfo.53.2020.12.23.12.59.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Dec 2020 12:59:05 -0800 (PST)
Subject: Re: [PATCH v2 28/48] soc/tegra: Introduce core power domain driver
From: Dmitry Osipenko <digetx@gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-29-digetx@gmail.com>
 <20201222064029.duuzcsj53rt7xzvt@vireshk-i7>
 <c130f78d-3d97-9b26-be77-951fee0d8680@gmail.com>
 <3a5c00e5-2cdd-35ce-2714-d4ffbf9d516a@gmail.com>
 <20201223055715.2n5eba7fohrwpgr5@vireshk-i7>
 <239642ad-d7e9-364e-80d3-1da67625e247@gmail.com>
Message-ID: <2298c089-827c-40a5-3ebe-3a91f3918ad5@gmail.com>
Date: Wed, 23 Dec 2020 23:59:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <239642ad-d7e9-364e-80d3-1da67625e247@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 25 Dec 2020 09:42:09 +0000
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-clk@vger.kernel.org, devel@driverdev.osuosl.org,
 Kevin Hilman <khilman@kernel.org>, Nicolas Chauvet <kwizart@gmail.com>,
 Viresh Kumar <vireshk@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjMuMTIuMjAyMCAyMzozNywgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gMjMuMTIuMjAy
MCAwODo1NywgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Cj4+IE9uIDIyLTEyLTIwLCAyMjozOSwg
RG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+Pj4gMjIuMTIuMjAyMCAyMjoyMSwgRG1pdHJ5IE9zaXBl
bmtvINC/0LjRiNC10YI6Cj4+Pj4+PiArCWlmIChJU19FUlIob3BwKSkgewo+Pj4+Pj4gKwkJZGV2
X2VycigmZ2VucGQtPmRldiwgImZhaWxlZCB0byBmaW5kIE9QUCBmb3IgbGV2ZWwgJXU6ICVwZVxu
IiwKPj4+Pj4+ICsJCQlsZXZlbCwgb3BwKTsKPj4+Pj4+ICsJCXJldHVybiBQVFJfRVJSKG9wcCk7
Cj4+Pj4+PiArCX0KPj4+Pj4+ICsKPj4+Pj4+ICsJZXJyID0gZGV2X3BtX29wcF9zZXRfdm9sdGFn
ZSgmZ2VucGQtPmRldiwgb3BwKTsKPj4+Pj4gSUlVQywgeW91IGltcGxlbWVudGVkIHRoaXMgY2Fs
bGJhY2sgYmVjYXVzZSB5b3Ugd2FudCB0byB1c2UgdGhlIHZvbHRhZ2UgdHJpcGxldAo+Pj4+PiBw
cmVzZW50IGluIHRoZSBPUFAgdGFibGUgPwo+Pj4+Pgo+Pj4+PiBBbmQgc28geW91IGFyZSBzZXR0
aW5nIHRoZSByZWd1bGF0b3IgKCJwb3dlciIpIGxhdGVyIGluIHRoaXMgcGF0Y2ggPwo+Pj4+IHll
cwo+Pj4+Cj4+Pj4+IEkgYW0gbm90IGluIGZhdm9yIG9mIGltcGxlbWVudGluZyB0aGlzIHJvdXRp
bmUsIGFzIGl0IGp1c3QgYWRkcyBhIHdyYXBwZXIgYWJvdmUKPj4+Pj4gdGhlIHJlZ3VsYXRvciBB
UEkuIFdoYXQgeW91IHNob3VsZCBiZSBkb2luZyByYXRoZXIgaXMgZ2V0IHRoZSByZWd1bGF0b3Ig
YnkKPj4+Pj4geW91cnNlbGYgaGVyZSAoaW5zdGVhZCBvZiBkZXBlbmRpbmcgb24gdGhlIE9QUCBj
b3JlKS4gQW5kIHRoZW4geW91IGNhbiBkbwo+Pj4+PiBkZXZfcG1fb3BwX2dldF92b2x0YWdlKCkg
aGVyZSBhbmQgc2V0IHRoZSB2b2x0YWdlIHlvdXJzZWxmLiBZb3UgbWF5IHdhbnQgdG8KPj4+Pj4g
aW1wbGVtZW50IGEgdmVyc2lvbiBzdXBwb3J0aW5nIHRyaXBsZXQgaGVyZSB0aG91Z2ggZm9yIHRo
ZSBzYW1lLgo+Pj4+Pgo+Pj4+PiBBbmQgeW91IHdvbid0IHJlcXVpcmUgdGhlIHN5bmMgdmVyc2lv
biBvZiB0aGUgQVBJIGFzIHdlbGwgdGhlbi4KPj4+Pj4KPj4+PiBUaGF0J3Mgd2hhdCBJIGluaXRp
YWxseSBkaWQgZm9yIHRoaXMgZHJpdmVyLiBJIGRvbid0IG1pbmQgdG8gcmV2ZXJ0IGJhY2sKPj4+
PiB0byB0aGUgaW5pdGlhbCB2YXJpYW50IGluIHYzLCBpdCBhcHBlYXJlZCB0byBtZSB0aGF0IGl0
IHdpbGwgYmUgbmljZXIKPj4+PiBhbmQgY2xlYW5lciB0byBoYXZlIE9QUCBBUEkgbWFuYWdpbmcg
ZXZlcnl0aGluZyBoZXJlLgo+Pj4KPj4+IEkgZm9yZ290IG9uZSBpbXBvcnRhbnQgZGV0YWlsICh3
aHkgdGhlIGluaXRpYWwgdmFyaWFudCB3YXNuJ3QgZ29vZCkuLgo+Pj4gT1BQIGVudHJpZXMgdGhh
dCBoYXZlIHVuc3VwcG9ydGFibGUgdm9sdGFnZXMgc2hvdWxkIGJlIGZpbHRlcmVkIG91dCBhbmQK
Pj4+IE9QUCBjb3JlIHBlcmZvcm1zIHRoZSBmaWx0ZXJpbmcgb25seSBpZiByZWd1bGF0b3IgaXMg
YXNzaWduZWQgdG8gdGhlIE9QUAo+Pj4gdGFibGUuCj4+Pgo+Pj4gSWYgcmVndWxhdG9yIGlzIGFz
c2lnbmVkIHRvIHRoZSBPUFAgdGFibGUsIHRoZW4gd2UgbmVlZCB0byB1c2UgT1BQIEFQSQo+Pj4g
Zm9yIGRyaXZpbmcgdGhlIHJlZ3VsYXRvciwgaGVuY2UgdGhhdCdzIHdoeSBJIGFkZGVkCj4+PiBk
ZXZfcG1fb3BwX3N5bmNfcmVndWxhdG9ycygpIGFuZCBkZXZfcG1fb3BwX3NldF92b2x0YWdlKCku
Cj4+Pgo+Pj4gUGVyaGFwcyBpdCBzaG91bGQgYmUgcG9zc2libGUgdG8gYWRkIGRldl9wbV9vcHBf
Z2V0X3JlZ3VsYXRvcigpIHRoYXQKPj4KPj4gV2hhdCdzIHdyb25nIHdpdGggZ2V0dGluZyB0aGUg
cmVndWxhdG9yIGluIHRoZSBkcml2ZXIgYXMgd2VsbCA/IEFwYXJ0IGZyb20gdGhlCj4+IE9QUCBj
b3JlID8KPiAKPiBUaGUgdm9sdGFnZSBzeW5jaW5nIHNob3VsZCBiZSBkb25lIGZvciBlYWNoIGNv
bnN1bWVyIHJlZ3VsYXRvcgo+IGluZGl2aWR1YWxseSBbMV0uCj4gCj4gU2Vjb25kbHksIHJlZ3Vs
YXRvciBjb3JlIGRvZXNuJ3Qgd29yayB3ZWxsIHRvZGF5IGlmIHRoZSBzYW1lIHJlZ3VsYXRvcgo+
IGlzIHJlcXVlc3RlZCBtb3JlIHRoYW4gb25lIHRpbWUgZm9yIHRoZSBzYW1lIGRldmljZS4KPiAK
Pj4+IHdpbGwgcmV0dXJuIHRoZSBPUFAgdGFibGUgcmVndWxhdG9yIGluIG9yZGVyIHRvIGFsbG93
IGRyaXZlciB0byB1c2UgdGhlCj4+PiByZWd1bGF0b3IgZGlyZWN0bHkuIEJ1dCBJJ20gbm90IHN1
cmUgd2hldGhlciB0aGlzIGlzIGEgbXVjaCBiZXR0ZXIKPj4+IG9wdGlvbiB0aGFuIHRoZSBvcHBf
c3luY19yZWd1bGF0b3JzKCkgYW5kIG9wcF9zZXRfdm9sdGFnZSgpIEFQSXMuCj4+Cj4+IHNldF92
b2x0YWdlKCkgaXMgc3RpbGwgZmluZSBhcyB0aGVyZSBpcyBzb21lIGRhdGEgdGhhdCB0aGUgT1BQ
IGNvcmUgaGFzLCBidXQKPj4gc3luY19yZWd1bGF0b3IoKSBoYXMgbm90aGluZyB0byBkbyB3aXRo
IE9QUCBjb3JlLgo+Pgo+PiBBbmQgdGhpcyBtYXkgbGVhZCB0byBtb3JlIHdyYXBwZXIgaGVscGVy
cyBpbiB0aGUgT1BQIGNvcmUsIHdoaWNoIEkgYW0gYWZyYWlkIG9mLgo+PiBBbmQgc28gZXZlbiBp
ZiBpdCBpcyBub3QgdGhlIGJlc3QsIEkgd291bGQgbGlrZSB0aGUgT1BQIGNvcmUgdG8gcHJvdmlk
ZSB0aGUgZGF0YQo+PiBhbmQgbm90IGdldCBpbnRvIHRoaXMuIE9mY291cnNlIHRoZXJlIGlzIGFu
IGV4Y2VwdGlvbiB0byB0aGlzLCBvcHBfc2V0X3JhdGUuCj4+Cj4gCj4gVGhlIHJlZ3VsYXRvcl9z
eW5jX3ZvbHRhZ2UoKSBzaG91bGQgYmUgaW52b2tlZCBvbmx5IGlmIHZvbHRhZ2Ugd2FzCj4gY2hh
bmdlZCBwcmV2aW91c2x5IFsxXS4KPiAKPiBUaGUgT1BQIGNvcmUgYWxyZWFkeSBoYXMgdGhlIGlu
Zm8gYWJvdXQgd2hldGhlciB2b2x0YWdlIHdhcyBjaGFuZ2VkIGFuZAo+IGl0IHByb3ZpZGVzIHRo
ZSBuZWNlc3NhcnkgbG9ja2luZyBmb3IgYm90aCBzZXRfdm9sdGFnZSgpIGFuZAo+IHN5bmNfcmVn
dWxhdG9yKCkuIFBlcmhhcHMgSSdsbCBuZWVkIHRvIGR1cGxpY2F0ZSB0aGF0IGZ1bmN0aW9uYWxp
dHkgaW4KPiB0aGUgUEQgZHJpdmVyLCBpbnN0ZWFkIG9mIG1ha2luZyBpdCBhbGwgZ2VuZXJpYyBh
bmQgcmUtdXNhYmxlIGJ5IG90aGVyCj4gZHJpdmVycy4KPiAKPiBbMV0KPiBodHRwczovL2VsaXhp
ci5ib290bGluLmNvbS9saW51eC92NS4xMC4yL3NvdXJjZS9kcml2ZXJzL3JlZ3VsYXRvci9jb3Jl
LmMjTDQxMDcKPiAKCkkganVzdCByZWFsaXplZCB0aGF0IHRoZSBsb2NraW5nIGlzIG1pc3Npbmcg
aW4gdGhlIHYyIHBhdGNoZXMsIHNvbWV0aGluZwp0byBmaXggaW4gdGhlIG5leHQgcmV2aXNpb24g
OikKClN0aWxsIEknbSBpbiBmYXZvciBvZiBleHRlbmRpbmcgdGhlIE9QUCBBUEkgd2l0aCB0aGUg
bmV3IGNvbW1vbgpmdW5jdGlvbnMuIEJ1dCBpZiB5b3UgaGF2ZSBhIHN0cm9uZyBvcGluaW9uIGFi
b3V0IHRoYXQsIHRoZW4gSSdsbCB0cnkgdG8Kd29yayBhcm91bmQgaXQgaW4gdGhlIFBEIGRyaXZl
ciBpbiB2My4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
