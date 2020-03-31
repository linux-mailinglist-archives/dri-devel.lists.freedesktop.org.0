Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A7C1996BD
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 14:44:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F8F6E314;
	Tue, 31 Mar 2020 12:44:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55DE66E314
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 12:44:14 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id c195so1056741wme.1
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 05:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Wy3ekJA6Bt0VTPNlP60L8kEa5fS2rb1OTqZ5iABlzQc=;
 b=Md+rr1GZv1lTJk3BWv+5tB6239jRxpCIB//hmMKavt5TnRVSTW11h3AaWRivfCkkQV
 f0D2yVC+15RXbDs4abLuzlvSV/uCCaokM8+u8l6jMwyVt4ruTVaNVh8EysBbARgU9oo5
 5EkS/vfnMVxYIcIlvcZ+Wguf/2ysPQ7stfp6dbiGvO2PFXl278PswQ2McajmHjrkfHf6
 Hn/utPfBaDiexNmEb+4GAFu90TGePR3GqNZHXNApEq3VvItcJWx8revkbQSsU2D3UiLE
 85//Nn2QdzzViE8u7ceD1l2kekQlABSyrTerxoxZqzPhYbKUxMaLsm8nzyYL9cH2L/sg
 lJgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=Wy3ekJA6Bt0VTPNlP60L8kEa5fS2rb1OTqZ5iABlzQc=;
 b=OEDIfVOBFeRQvFrPBuI1EjfNQE77VxyHvhvqJKwC6GpRRlUWdWVQgGW6t39rEdggXd
 sEzJfyuEg82n6oYNmufNN2W6aKq0Bt46wk0QsENQVoAvfNgoJZHDr3r3jAoBNvaZObeS
 naXh6rBFYX4BpJg+wMKTh+7R73AncAhjXDIsCL0O8AI+b7RVB35JVKjRJbz15TT+/BMg
 t2IGrEhezrGKayADEFaI8cJS0R1dH4NXYo7qu8f0qWukICsAXLEwLpfSl9c1I7W8KH4R
 hQK8C4q0dLYKG46th4NhA87Fh81rKiWxKgyp4QPl549Bha+es6oLprmend4CWU0q9NH9
 RBhQ==
X-Gm-Message-State: ANhLgQ2GazxZCfjTBgB1CWmqiHoOYTh1VrhveRiEqvPd3vGvPjO8mZHM
 h250tuUv8AYrxOu8n0lqXIY=
X-Google-Smtp-Source: ADFU+vu0M4YeUWa+XsszFSwzJ3BB+3xilBNNH3KOlRSrEc+i2btrpar5ZkASizuQknxZmaqElrkvrg==
X-Received: by 2002:a1c:9c15:: with SMTP id f21mr3275667wme.18.1585658653001; 
 Tue, 31 Mar 2020 05:44:13 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id r11sm27963715wrn.24.2020.03.31.05.44.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 31 Mar 2020 05:44:12 -0700 (PDT)
Subject: Re: [PATCH] drm/mm: revert "Break long searches in fragmented address
 spaces"
To: Daniel Vetter <daniel@ffwll.ch>, Chris Wilson <chris@chris-wilson.co.uk>
References: <20200330123425.3944-1-christian.koenig@amd.com>
 <c124b5d1-efc6-e826-2387-9f9ad06d1df0@gmail.com>
 <20200331091618.GM2363188@phenom.ffwll.local>
 <158564641293.18289.1145145659054294433@build.alporthouse.com>
 <CAKMK7uGNxhZB9Fd3i7rGK42pAgoJACRoR_NrrXF6rfCFkrg4GQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <1d7e5ffe-dae5-b391-796d-2fff41125578@gmail.com>
Date: Tue, 31 Mar 2020 14:44:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uGNxhZB9Fd3i7rGK42pAgoJACRoR_NrrXF6rfCFkrg4GQ@mail.gmail.com>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 Andi Shyti <andi.shyti@intel.com>, dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMzEuMDMuMjAgdW0gMTI6Mzggc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFR1ZSwgTWFy
IDMxLCAyMDIwIGF0IDExOjIwIEFNIENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNv
LnVrPiB3cm90ZToKPj4gUXVvdGluZyBEYW5pZWwgVmV0dGVyICgyMDIwLTAzLTMxIDEwOjE2OjE4
KQo+Pj4gT24gVHVlLCBNYXIgMzEsIDIwMjAgYXQgMTA6NTk6NDVBTSArMDIwMCwgQ2hyaXN0aWFu
IEvDtm5pZyB3cm90ZToKPj4+PiBBIG5vdCBzbyBnZW50bGUgcGluZywgc2luY2UgdGhpcyBwcmV0
dHkgbXVjaCBicm9rZSBhbGwgVFRNIGJhc2VkIGRyaXZlcnMuCj4+Pj4KPj4+PiBDb3VsZCB3ZSBy
ZXZlcnQgdGhpcyBmb3Igbm93Pwo+Pj4gQWx3YXlzIGFjayBmb3IgcmV2ZXJ0Lgo+Pj4KPj4+IEFj
a2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+PiBTbyB5b3Ug
ZGlkbid0IGNoZWNrIHRoZSBlYXJsaWVyIHBhdGNoIGVpdGhlcj8KPiBJIGRpZCwgYnV0IHdhc24n
dCBzdXBlciBzb2xkIG9uIHRoZSBpZGVhIG9mIG1vcmUgZmxhZ3MgdG8gc21hY2sgYW4gci1iCj4g
b250byBpdCwgc28gZmlndXJlZCBJJ2xsIHRocm93IHRoZSBkZWZhdWx0IGFjay1mb3ItcmV2ZXJ0
IG9uIHRoaXMKPiBtZWFud2hpbGUuCgpNaG0sIGFuZCB0aGVyZSBpcyBzb21ldGhpbmcgd3Jvbmcg
d2l0aCBlaXRoZXIgZHJpLWRldmVsIG9yIHBhdGNod29yayAoSSAKc3VzcGVjdCB0aGUgZm9ybWVy
KS4KCkkgY2FuJ3Qgc2VlIHlvdXIgcmVwbHkgb24gcGF0Y2h3b3JrIGFuZCBpdCBlbnRlcmVkIG15
IGluYm94IG11Y2ggbGF0ZXIgCnRoYW4gRGFuaWVscyBtYWlscy4KCkNocmlzdGlhbi4KCj4gLURh
bmllbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
