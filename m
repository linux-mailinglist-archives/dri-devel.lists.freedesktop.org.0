Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D50FE357D16
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 09:13:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 825D16EA18;
	Thu,  8 Apr 2021 07:13:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17466EA18;
 Thu,  8 Apr 2021 07:13:40 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id a7so1274256eju.1;
 Thu, 08 Apr 2021 00:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=SIsKHQSOkEvfWiwZtx+7YzUKhU32xlwrRsu8RrEKflk=;
 b=qqw6qBYeovL+Buc7HYSSR0uKxSd/6OgmyLcygOQ7MOS7r4blO5jVMALylkXUb54pNs
 2LyFbeUYBhnf4QnN0GLNhyqWTaI+3IFp/Kvoo0Rqof/4xK38fytip2qiug2ajyEu06ft
 4ahLV0zzufJQj0iR02TX4VpR5InSmsHiqZJ30Fp6PDAyNQJ/LvrPFT6NWwX25F8LfQpv
 h4r/blI2Y3abwv5eF2jdSiNGDW4kzHaEh0AOv7wrxdeeD+4yP0mQsHAjwxUv512BLuJE
 muPKGTAFjAsC18QT4l3hxDJdOMiEytuBk4iDWpdez7KXPRCQ54tj18/0o4VJ7fD2K0K4
 IMKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=SIsKHQSOkEvfWiwZtx+7YzUKhU32xlwrRsu8RrEKflk=;
 b=TOxNQCTAKSZtbr/+BN9zWlnrlppV4lT36SjYmetR90PDUBCY0lAVuAzXO49+/ZjR30
 car9uTkGKA/9Agm/GsOlj0gTNiJi+wicXca1SnHHoVoYC4fEGAXhB49KtA6Ybm5Q1XOb
 BfVErTVaQHEXhUHBZ4wSKcc1AcYXaesVV9DRWzwFp4iEABjVzU99VcqgYbtrmRbLKqfs
 JtLjwJ6jchZHTHFr807aFJMWtsB9MO/L0KMIXVSjjh3hD6+F9cPInAbS14qyTFPjJitB
 lktvk7J0ifttzFfrbXOAD9RBAFj6R/4ve3eHNVl2UYSx5yGllQVRL1w9mlP7t3KT2u2G
 CmOg==
X-Gm-Message-State: AOAM532Inyr9VjEP/kgHByUnuA11UHcpGqqcdAChg0rI+mYfDFdJQf+u
 M3t7VNXeOJoA3Dqx+HAWt7I=
X-Google-Smtp-Source: ABdhPJzw7o9eYZs1hiUlyfqwY9EzR9ujuq8X59n8ag37IxZP+3Xh8TYLap4SDJ8pGbSlVLN3Ry2+kQ==
X-Received: by 2002:a17:906:e5a:: with SMTP id
 q26mr634735eji.263.1617866019363; 
 Thu, 08 Apr 2021 00:13:39 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:38f:e031:7d24:433b?
 ([2a02:908:1252:fb60:38f:e031:7d24:433b])
 by smtp.gmail.com with ESMTPSA id r26sm5724426edc.43.2021.04.08.00.13.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 00:13:38 -0700 (PDT)
Subject: Re: [pull] amdgpu, radeon, ttm, sched drm-next-5.13
To: Alex Deucher <alexdeucher@gmail.com>, Dave Airlie <airlied@gmail.com>
References: <20210401222931.3823-1-alexander.deucher@amd.com>
 <0fa472a5-08b4-87cd-c295-7502bd30c2c0@gmail.com>
 <CADnq5_NXz-B3BjQdP1x7P3tPC160EO906_TZObJhx85CHt6b2A@mail.gmail.com>
 <CAPM=9twymi8Emi+GpDW0Gz_OQ63BGwwzKwF_Jxq8=i_VC9U=3w@mail.gmail.com>
 <CADnq5_Ored1NxmDP5=_-5BXstsTdUPB31upM2AVFLXM1EXKQzQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <d5cf9d27-471c-f89d-375a-be4a76a5debc@gmail.com>
Date: Thu, 8 Apr 2021 09:13:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CADnq5_Ored1NxmDP5=_-5BXstsTdUPB31upM2AVFLXM1EXKQzQ@mail.gmail.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpBbSAwNy4wNC4yMSB1bSAyMTowNCBzY2hyaWViIEFsZXggRGV1Y2hlcjoKPiBPbiBXZWQsIEFw
ciA3LCAyMDIxIGF0IDM6MjMgQU0gRGF2ZSBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29tPiB3cm90
ZToKPj4gT24gV2VkLCA3IEFwciAyMDIxIGF0IDA2OjU0LCBBbGV4IERldWNoZXIgPGFsZXhkZXVj
aGVyQGdtYWlsLmNvbT4gd3JvdGU6Cj4+PiBPbiBGcmksIEFwciAyLCAyMDIxIGF0IDEyOjIyIFBN
IENocmlzdGlhbiBLw7ZuaWcKPj4+IDxja29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4g
d3JvdGU6Cj4+Pj4gSGV5IEFsZXgsCj4+Pj4KPj4+PiB0aGUgVFRNIGFuZCBzY2hlZHVsZXIgY2hh
bmdlcyBzaG91bGQgYWxyZWFkeSBiZSBpbiB0aGUgZHJtLW1pc2MtbmV4dAo+Pj4+IGJyYW5jaCAo
bm90IDEwMCUgc3VyZSBhYm91dCB0aGUgVFRNIHBhdGNoLCBuZWVkIHRvIGRvdWJsZSBjaGVjayBu
ZXh0IHdlZWspLgo+Pj4+Cj4+PiBUaGUgVFRNIGNoYW5nZSBpcyBub3QgaW4gZHJtLW1pc2MgeWV0
Lgo+Pj4KPj4+PiBDb3VsZCB0aGF0IGNhdXNlIHByb2JsZW1zIHdoZW4gYm90aCBhcmUgbWVyZ2Vk
IGludG8gZHJtLW5leHQ/Cj4+PiBEYXZlLCBEYW5pZWwsIGhvdyBkbyB5b3Ugd2FudCB0byBoYW5k
bGUgdGhpcz8gIFRoZSBkdXBsaWNhdGVkIHBhdGNoIGlzIHRoaXMgb25lOgo+Pj4gaHR0cHM6Ly9j
Z2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtLW1pc2MvY29tbWl0Lz9pZD1hYzRlYjgzYWIyNTVk
ZTljMzExODRkZjUxZmQxNTM0YmEzNmZkMjEyCj4+PiBhbWRncHUgaGFzIGNoYW5nZXMgd2hpY2gg
ZGVwZW5kIG9uIGl0LiAgVGhlIHNhbWUgcGF0Y2ggaXMgaW5jbHVkZWQgaW4gdGhpcyBQUi4KPj4g
T3VjaCBub3Qgc3VyZSBob3cgYmVzdCB0byBzeW5jIHVwIGhlcmUsIG1heWJlIGdldCBtaXNjLW5l
eHQgaW50byBteQo+PiB0cmVlIHRoZW4gcmViYXNlIHlvdXIgdHJlZSBvbiB0b3Agb2YgaXQ/Cj4g
SSBjYW4gZG8gdGhhdC4KClBsZWFzZSBsZXQgbWUgZG91YmxlIGNoZWNrIGxhdGVyIHRvZGF5IHRo
YXQgd2UgaGF2ZSBldmVyeXRoaW5nIHdlIG5lZWQgCmluIGRybS1taXNjLW5leHQuCgpSZWdhcmRz
LApDaHJpc3RpYW4uCgo+Cj4gQWxleAo+Cj4KPj4gRGF2ZS4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
