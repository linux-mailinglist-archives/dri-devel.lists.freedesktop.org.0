Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D94F20AD5F
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 09:37:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E660A6EC43;
	Fri, 26 Jun 2020 07:36:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E972E6E045
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 22:50:54 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id c21so4111920lfb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 15:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1byI84A1taS+jyeFTLN0XYFRgDGLuM/PTKl1uJXzto8=;
 b=VHzu87QK5SbM/3R0eKocVe9eak+kYN52JFUFpF/aYoPf1FpTtcnUEmdi28naOjF6/p
 cOBuMiGZMCrJGUrt5x5VSvTl8Vd/VPeg4wDYpvKsL453RXsa/IqfIPcpwMadA2tuNPnw
 6NIM2sJbD0KBVRUDBvZACd2emB/cNH4lPxHlpVJJinRChD2NzddpdxNPXElIk+0ZpQOP
 abZTXTaH2JVgGkZwfib3ms04xNO84Cvzalu8gVjprYfXP08bkVSy9KSVwvdva90c55QM
 /p1JuDhwr4BorHz7iJyGMR0bKOmDGyaFEGsY0OajO2eOf6Y/rXVdOCo6HTmv+z7YDbKj
 UXIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1byI84A1taS+jyeFTLN0XYFRgDGLuM/PTKl1uJXzto8=;
 b=SPqUhiNbHk2FfuhC2JtHptaiIRpZykeRax6WNs3eYsNZAar+DcdYx37Ldb5qBoaO66
 1VKrFTBQiMEikKy4W6ensv95LgU8G27Kl2fh+uMJLBeZMNctNBjpJz/z6u3cYypvn8aK
 V6XY61zgDcCnvh8Q6JGuE3xuI6YeifXvpV1PbU5tFTYztWm+CNVOfFc+N0yIDvAib9ik
 trDacwSE/ZuosH4N9EcBwLmdQ1NYjhNLibPxXWxQM7yKStuTrBg1bxQCqQRpIODczWMI
 PeKiQ4FwByRsauE/k4ErK+njOwPiS9HHJdp9n3St9qLv1kGjQbRwTtZWCZcavvTELL5D
 QaJg==
X-Gm-Message-State: AOAM531OPXk3quNpx8A7V90xbe/OXizTr8ZHKx3M3twUGNlR779OjHJp
 kJ8GdHkamhsNCxq3QGxHqy4=
X-Google-Smtp-Source: ABdhPJxsG8eY7FoghI/aJTlV3ecDuy0RQuMpKsAqomxJRhzs+FdHGa0XBgIi9Nz0rlmnN+0cxk9Q8A==
X-Received: by 2002:a05:6512:31c5:: with SMTP id
 j5mr178183lfe.26.1593125453321; 
 Thu, 25 Jun 2020 15:50:53 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id 203sm2377129ljf.14.2020.06.25.15.50.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jun 2020 15:50:52 -0700 (PDT)
Subject: Re: [RFC] Host1x/TegraDRM UAPI (drm_tegra_submit_relocation)
To: Mikko Perttunen <cyndis@kapsi.fi>,
 Thierry Reding <thierry.reding@gmail.com>, Jon Hunter
 <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org, gustavo@padovan.org
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
 <7cc0d47b-024a-263e-3b63-1d1184b462b3@gmail.com>
 <8d60baf4-45e8-296a-279e-dc105966361c@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <eb3cac23-cd8c-732b-684c-c2d531de00a2@gmail.com>
Date: Fri, 26 Jun 2020 01:50:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <8d60baf4-45e8-296a-279e-dc105966361c@kapsi.fi>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 26 Jun 2020 07:36:15 +0000
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
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjUuMDYuMjAyMCAxMjoyNywgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4gT24gNi8yNS8y
MCAxOjMzIEFNLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IDIzLjA2LjIwMjAgMTU6MDksIE1p
a2tvIFBlcnR0dW5lbiDQv9C40YjQtdGCOgo+Pj4gc3RydWN0IGRybV90ZWdyYV9zdWJtaXRfcmVs
b2NhdGlvbiB7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgIC8qIFtpbl0gSW5kZXggb2YgR0FUSEVSIG9y
IEdBVEhFUl9VUFRSIGNvbW1hbmQgaW4gY29tbWFuZHMuICovCj4+PiDCoMKgwqDCoMKgwqDCoMKg
IF9fdTMyIGdhdGhlcl9jb21tYW5kX2luZGV4Owo+Pj4KPj4+IMKgwqDCoMKgwqDCoMKgwqAgLyoK
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAqIFtpbl0gTWFwcGluZyBoYW5kbGUgKG9idGFpbmVkIHRo
cm91Z2ggQ0hBTk5FTF9NQVApIG9mIHRoZQo+Pj4gbWVtb3J5Cj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqAgKsKgwqAgdGhlIGFkZHJlc3Mgb2Ygd2hpY2ggd2lsbCBiZSBwYXRjaGVkIGluLgo+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgICovCj4+PiDCoMKgwqDCoMKgwqDCoMKgIF9fdTMyIG1hcHBpbmdfaWQ7
Cj4+Pgo+Pj4gwqDCoMKgwqDCoMKgwqDCoCAvKgo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgICogW2lu
XSBPZmZzZXQgaW4gdGhlIGdhdGhlciB0aGF0IHdpbGwgYmUgcGF0Y2hlZC4KPj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCAqLwo+Pj4gwqDCoMKgwqDCoMKgwqDCoCBfX3U2NCBnYXRoZXJfb2Zmc2V0Owo+
Pj4KPj4+IMKgwqDCoMKgwqDCoMKgwqAgLyoKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAqIFtpbl0g
T2Zmc2V0IGluIHRhcmdldCBidWZmZXIgd2hvc2UgcGFkZHIvSU9WQSB3aWxsIGJlCj4+PiB3cml0
dGVuCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgKsKgwqAgdG8gdGhlIGdhdGhlci4KPj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCAqLwo+Pj4gwqDCoMKgwqDCoMKgwqDCoCBfX3U2NCB0YXJnZXRfb2Zmc2V0
Owo+Pj4KPj4+IMKgwqDCoMKgwqDCoMKgwqAgLyoKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAqIFtp
bl0gTnVtYmVyIG9mIGJpdHMgdGhlIHJlc3VsdGluZyBhZGRyZXNzIHdpbGwgYmUgbG9naWNhbGx5
Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgKsKgwqAgc2hpZnRlZCByaWdodCBiZWZvcmUgd3JpdGlu
ZyB0byBnYXRoZXIuCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgKi8KPj4+IMKgwqDCoMKgwqDCoMKg
wqAgX191MzIgc2hpZnQ7Cj4+Pgo+Pj4gwqDCoMKgwqDCoMKgwqDCoCBfX3UzMiByZXNlcnZlZFsx
XTsKPj4+IH07Cj4+Cj4+IFdlIHdpbGwgYWxzbyBuZWVkIHJlYWQvd3JpdGUgZGlyZWN0aW9uIGZs
YWcgaGVyZSBmb3IgdGhlCj4+IERNQS1yZXNlcnZhdGlvbnMgc2V0IHVwLCBpdCB3aWxsIGJlIHVz
ZWQgZm9yIHRoZSBpbXBsaWNpdCBCTyBmZW5jaW5nIGJ5Cj4+IHRoZSBqb2IncyBzY2hlZHVsZXIu
Cj4+Cj4gCj4gSWRlYWxseSBvbiBuZXdlciBjaGlwcyB3aXRoIGNvbnRleHQgaXNvbGF0aW9uLCB3
ZSBubyBsb25nZXIga25vdyB3aGF0Cj4gRE1BLUJVRnMgYXJlIGJlaW5nIHVzZWQgYnkgdGhlIGpv
YiBhdCBzdWJtaXQgdGltZSAtIHRoZXkgd291bGQganVzdCBiZQo+IHBvaW50ZXJzIGFmdGVyIGJl
aW5nIE1BUHBlZC4KClRoZSBETUEtQlVGcyB0aGVtc2VsdmVzIHNob3VsZG4ndCBiZSBuZWVkZWQs
IGJ1dCBHRU1zIHNob3VsZC4KCj4gRG8geW91IGtub3cgaG93IG90aGVyIEdQVXMgZGVhbCB3aXRo
IERNQSByZXNlcnZhdGlvbnMgLSBJIGV4cGVjdAo+IHNlcGFyYXRlIE1BUCBhbmQgU1VCTUlUIHN0
ZXBzIHdvdWxkIGJlIHByZXR0eSBjb21tb24/CgpJIGNhbid0IGluc3RhbnRseSByZWNhbGwgd2hh
dCBvdGhlciBkcml2ZXJzIGRvLCBjb3VsZCBiZSB3b3J0aHdoaWxlIHRvCnRha2UgYSBjbG9zZXIg
bG9vay4KCj4gRG8geW91IGhhdmUgdG8KPiBwYXNzIHRoZSBETUEtQlVGIHRvIGJvdGggc3RlcHMg
KGkuZS4gZG8gSU9NTVUgbWFwcGluZyBkdXJpbmcgTUFQLCBhbmQKPiBtYW5hZ2UgcmVzZXJ2YXRp
b25zIGF0IFNVQk1JVCk/CgpZZXMsIHRoaXMgc291bmRzIGdvb2QgdG8gbWUgaWYgRE1BLUJVRiBw
YXJ0IGlzIHJlcGxhY2VkIHdpdGggYSBHRU0uCgpQbGVhc2Ugc2VlIG15IG90aGVyIHJlcGx5IHJl
Z2FyZGluZyB0aGUgTUFQIElPQ1RMIHdoZXJlIEknbSBzdWdnZXN0aW5nCnRvIGJhY2sgbWFwcGlu
ZyBJRHMgd2l0aCBhIEdFTS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
