Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CFF1DE49F
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 12:40:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 274F96E9BC;
	Fri, 22 May 2020 10:40:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF0986E9BA;
 Fri, 22 May 2020 10:40:09 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id j21so12479508ejy.1;
 Fri, 22 May 2020 03:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=TYcDv5vIBw6ya7Ut1f794E52nl6X9yRKNiq2adVnOx8=;
 b=UAhIRTANXcE313UyA5JQ4miAQk2o05HqRii5VRnb/Kx6Z8NMwgJu4gODrOVh0/fRHi
 IfhY73LkEqaEfuO/b49HBpYZcWXntIHjTkZjFKzsSDGzsDe3kX4LFpM67iuZP3LVjbDC
 4aMltvsHT+kdY0sx7cq/l22jKESV5WLhwW1x6PNngbWZZGyWmAOW3t0OHuirKuARApt6
 FqWgZqsw7Aw1wrZOugSC47Bc9GCWmtUvFruQ9Wj7nz3NFwe5zI3WdMY6AKL0X/Y879iW
 5qoIcPjMNQIGTp+eJPWcHAIFv7ijOulYJlGCCFOvtxgk28VL33AhgrK2SfKrUkUv9Dui
 HO7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=TYcDv5vIBw6ya7Ut1f794E52nl6X9yRKNiq2adVnOx8=;
 b=IJdP/rMLu+SA7nk9XSKdq9CRqdlVbRCx0++2r36Nx/y9XvvTfJQZYbhzrSjWcFAuQd
 aU9sFum8EJZCppHFDjQXwoUvibJv6V3RVlXosrfqEZ9LaKeaRlma3u68oXwmodHDJqxo
 +EhM6LJhb3KS09R4VMy/b8GDg7QUMVfzx3PonF9itY6mqOmfV52pSy1Bz7bnCTnBiaA1
 wmVnPJO7TLmnD4vZzGy0/hcvuKhKATKMluer5VebRCM9YcHNqDvsk7/NxIOFuaz3DcmY
 hYSb1sG38f7wseCDeBy/soHS7efipDNKorv5xiRQjuHePIy106EWsxWUfG/X/VTQQet6
 k70w==
X-Gm-Message-State: AOAM532y9BrgKPrTrC4+XK3fHuAARfaVrOKFQUQP362pbb++cQjdZQnB
 a0GniPM6F6a61FQ8/W5YGX0khvyA
X-Google-Smtp-Source: ABdhPJxHtE4KJPqzO9Lc0q5UUIbrtk+yBBPBSCLMPtlSplSq0cLdvbHcPvyGSaJwnNGkUdD8ox2lmw==
X-Received: by 2002:a17:906:3041:: with SMTP id d1mr7666526ejd.7.1590144008390; 
 Fri, 22 May 2020 03:40:08 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id w12sm6916357edj.22.2020.05.22.03.40.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 May 2020 03:40:07 -0700 (PDT)
Subject: Re: [RFC] Deprecate AGP GART support for Radeon/Nouveau/TTM
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>
References: <20200513110313.12979-1-christian.koenig@amd.com>
 <9d784383-905e-59af-b17c-923c92474ece@gmail.com>
 <ea2dfaaa-a7ca-5e4a-9264-0a82f1d5ea9b@daenzer.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <39241451-b25e-759f-6d52-455d806add09@gmail.com>
Date: Fri, 22 May 2020 12:40:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <ea2dfaaa-a7ca-5e4a-9264-0a82f1d5ea9b@daenzer.net>
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
Cc: debian-powerpc@lists.debian.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAuMDUuMjAgdW0gMTg6MjUgc2NocmllYiBNaWNoZWwgRMOkbnplcjoKPiBPbiAyMDIwLTA1
LTIwIDQ6NDMgcC5tLiwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4gQW0gMTMuMDUuMjAgdW0g
MTM6MDMgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+Pj4gVW5mb3J0dW5hdGVseSBBR1AgaXMg
c3RpbGwgdG8gd2lkZWx5IHVzZWQgYXMgd2UgY291bGQganVzdCBkcm9wCj4+PiBzdXBwb3J0IGZv
ciB1c2luZyBpdHMgR0FSVC4KPj4+Cj4+PiBOb3QgdXNpbmcgdGhlIEFHUCBHQVJUIGFsc28gZG9l
c24ndCBtZWFuIGEgbG9zcyBpbiBmdW5jdGlvbmFsaXR5IHNpbmNlCj4+PiBkcml2ZXJzIHdpbGwg
anVzdCBmYWxsYmFjayB0byB0aGUgZHJpdmVyIHNwZWNpZmljIFBDSSBHQVJULgo+Pj4KPj4+IEZv
ciBub3cganVzdCBkZXByZWNhdGUgdGhlIGNvZGUgYW5kIGRvbid0IGVuYWJsZSB0aGUgQUdQIEdB
UlQgaW4gVFRNCj4+PiBldmVuIHdoZW4gZ2VuZXJhbCBBR1Agc3VwcG9ydCBpcyBhdmFpbGFibGUu
Cj4+IFNvIEkndmUgdXNlZCBhbiBhbmNpZW50IHN5c3RlbSAoMzJiaXQpIHRvIHNldHVwIGEgdGVz
dCBib3ggZm9yIHRoaXMuCj4+Cj4+Cj4+IFRoZSBmaXJzdCBHUFUgSSBjb3VsZCB0ZXN0IGlzIGFu
IFJWMjgwIChSYWRlb24gOTIwMCBQUk8pIHdoaWNoIGlzIGVhc2lseQo+PiAxNSB5ZWFycyBvbGQu
Cj4+Cj4+IFdoYXQgaGFwcGVucyBpbiBBR1AgbW9kZSBpcyB0aGF0IGdseGdlYXJzIHNob3dzIGFy
dGlmYWN0cyBkdXJpbmcKPj4gcmVuZGVyaW5nIG9uIHRoaXMgc3lzdGVtLgo+Pgo+PiBJbiBQQ0kg
bW9kZSB0aG9zZSByZW5kZXJpbmcgYXJ0aWZhY3RzIGFyZSBnb25lIGFuZCBnbHhnZWFycyBzZWVt
cyB0bwo+PiBkcmF3IGV2ZXJ5dGhpbmcgY29ycmVjdGx5IG5vdy4KPj4KPj4gUGVyZm9ybWFuY2Ug
aXMgb2J2aW91c2x5IG5vdCBjb21wYXJhYmxlLCBjYXVzZSBpbiBBR1Agd2UgZG9uJ3QgcmVuZGVy
Cj4+IGFsbCB0cmlhbmdsZXMgY29ycmVjdGx5Lgo+Pgo+Pgo+PiBUaGUgc2Vjb25kIEdQVSBJIGNv
dWxkIHRlc3QgaXMgYW4gUlY2MzAgUFJPIChSYWRlb24gSEQgMjYwMCBQUk8gQUdQKQo+PiB3aGlj
aCBpcyBtb3JlIHRoYW4gMTAgeWVhcnMgb2xkLgo+Pgo+PiBBcyBmYXIgYXMgSSBjYW4gdGVsbCB0
aGlzIG9uZSB3b3JrcyBpbiBib3RoIEFHUCBhbmQgUENJZSBtb2RlIHBlcmZlY3RseQo+PiBmaW5l
Lgo+Pgo+PiBTaW5jZSB0aGlzIGlzIG9ubHkgYSAzMmJpdCBzeXN0ZW0gSSBjb3VsZG4ndCByZWFs
bHkgdGVzdCBhbnkgT3BlbkdMIGdhbWUKPj4gdGhhdCB3ZWxsLgo+Pgo+PiBCdXQgZm9yIGdseGdl
YXJzIHN3aXRjaGluZyBmcm9tIEFHUCB0byBQQ0llIG1vZGUgc2VlbXMgdG8gcmVzdWx0IGluIGEK
Pj4gcm91Z2hseSA1JSBwZXJmb3JtYW5jZSBkcm9wLgo+Pgo+PiBUaGUgc3VycHJpc2luZyByZWFz
b24gZm9yIHRoaXMgaXMgbm90IHRoZSBiZXR0ZXIgVExCIHBlcmZvcm1hbmNlLCBidXQKPj4gdGhl
IGxhY2sgb2YgVVNXQyBzdXBwb3J0IGZvciB0aGUgUENJZSBHQVJUIGluIHJhZGVvbi4KPiBJIHN1
c3BlY3QgdGhlIG1haW4gcmVhc29uIGl0J3Mgb25seSA1JSBpcyB0aGF0IFBDSWUgR0FSVCBwYWdl
IHRhYmxlcyBhcmUKPiBzdG9yZWQgaW4gVlJBTSwgc28gdGhleSBkb24ndCBuZWVkIHRvIGJlIGZl
dGNoZWQgYWNyb3NzIHRoZSBQQ0llIGxpbmsKPiAoYW5kIHByZXN1bWFibHkgaXQgaGFzIG1vcmUg
dGhhbiBvbmUgVExCIGVudHJ5IGFzIHdlbGwpLiBUaGUgZGlmZmVyZW5jZQo+IGlzIG11Y2ggYmln
Z2VyIHdpdGggbmF0aXZlIEFHUCBBU0lDcyB3aXRoIFBDSSBHQVJULgoKRG8geW91IGhhdmUgc29t
ZSBoYXJkd2FyZSB5b3UgY291bGQgZ2l2ZSB0aGF0IGEgdHJ5IG9uPwoKSSBtZWFuIHRoZSBmaXJz
dCBjYXJkIEkgcHV0IGludG8gdGhlIHN5c3RlbSBvYnZpb3VzbHkgb25seSB3b3JrZWQgCmNvcnJl
Y3RseSB3aXRoIEFHUCBkaXNhYmxlZC4KCldoaWxlIEkgYWdyZWUgdGhhdCBpdCBtZWFucyBhIHBl
cmZvcm1hbmNlIHJlZ3Jlc3Npb24sIHRoaXMgaXMgYSByYXRoZXIgCmhpZ2ggbW90aXZhdGlvbiB0
byBnbyBhaGVhZCB3aXRoIGF0IGxlYXN0IHRoZSBmaXJzdCBwYXRjaC4KCkNocmlzdGlhbi4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
