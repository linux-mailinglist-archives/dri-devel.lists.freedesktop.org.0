Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C05242A86
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 15:42:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F0A6E0FF;
	Wed, 12 Aug 2020 13:42:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 052666E0FF;
 Wed, 12 Aug 2020 13:42:18 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id o23so2336316ejr.1;
 Wed, 12 Aug 2020 06:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=3W8RrOcieXQTHbwagMgPr+h9faxaX5DdAWlD9cZaad8=;
 b=GZe5uJMKa6M7aZOFurAGN9HZW+E47x14RvVije8+4VEvriC8FqaaAmxuAbfh/vNXjI
 K8Fz+9UcesZrEUV8U3cmbM/MbXyDttUuOqRHBPoa5aoZsC44ZQFv5B8ZRwkqC0qlwIpz
 BJTi+EGpDG6HD/qV5gCGf4X5j0YCVwOsIM/VhLuV/KvaWiAPJQT3R+LQ+orGAwJOxR1D
 wdEpg4zSX453qYPv6keXc8ut7IeNYE1rhYcWzLtwAFRrFpRDvti6F7QZ8O6Opxacf1h0
 NnIXwmlk2b1h6v8pC9lO/ZHa/XaxMwdds/CjRDIV1dgXDvDriD10tQhJuZQSNq/39zB3
 XrLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=3W8RrOcieXQTHbwagMgPr+h9faxaX5DdAWlD9cZaad8=;
 b=rBCAbV3hRnhcHwORJJlb8TE/SaXeU/iJflLy83Nr3cBvj4IXyQ+eHyF1v/qFJ4aGFa
 eJP+g4bjhkkArcl5fpC29qLSqVAZOdvNocLSxPvU008pcbHRkTWxDwDz2L4LbCnN3EDH
 ZIDzFsjo92rgNBIGxwRCaZyAp+doMLZvXs9ng4fwvCHvLkQP/520Ziwvbl1LVxa9wMUQ
 gk7tGi+KH0J7K6uduwdhB6H5ZabXB4hkV9TMGeLmaAbKyfI8ZRKwwwTMKXuUfwVGs00v
 dBZhAiUw7bY/EuqzSEmMGcGLeh8xk92BGT/sRV2Jw5GHFounEv+FRYo3b8on4YXtO+74
 aBUQ==
X-Gm-Message-State: AOAM533NErPPmf3+LX8rJeYyv5uH4Kt0jxrYO3HoR2vhJvT9Ra+Bp1gH
 QuWL4ylvCS2mtl+X5XWTXGYpNWCc
X-Google-Smtp-Source: ABdhPJz5PfpdpcG7CvEvziHljHL6qv3bHCRPg+EEp6qGqe5AMSuEHoC83YTMk3D0FiNYd5rGdhNvIg==
X-Received: by 2002:a17:906:cc4a:: with SMTP id
 mm10mr30488102ejb.451.1597239736717; 
 Wed, 12 Aug 2020 06:42:16 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id n10sm1503001edo.43.2020.08.12.06.42.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2020 06:42:14 -0700 (PDT)
Subject: Re: RFC: How to adjust the trace pid?
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, daniel.vetter@ffwll.ch,
 Dave Airlie <airlied@gmail.com>
References: <20200807133658.1866-1-christian.koenig@amd.com>
Message-ID: <1975d7d1-8f94-5852-6ccc-19fde4d4a919@gmail.com>
Date: Wed, 12 Aug 2020 15:42:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200807133658.1866-1-christian.koenig@amd.com>
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
Cc: alexander.deucher@amd.com, Shashank.Sharma@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGluZz8gRGFuaWVsLCBEYXZlIGFueSBvcGluaW9uIG9uIHRoaXM/CgpDaHJpc3RpYW4uCgpBbSAw
Ny4wOC4yMCB1bSAxNTozNiBzY2hyaWViIENocmlzdGlhbiBLw7ZuaWc6Cj4gSGkgZXZlcnlib2R5
LAo+Cj4gaW4gYW1kZ3B1IHdlIGdvdCB0aGUgZm9sbG93aW5nIGlzc3VlIHdoaWNoIEknbSBzZWVr
aW5nIGFkdmlzZSBob3cgdG8gY2xlYW5seSBoYW5kbGUgaXQuCj4KPiBXZSBoYXZlIGEgYnVuY2gg
b2YgdHJhY2UgcG9pbnRzIHdoaWNoIGFyZSByZWxhdGVkIHRvIHRoZSBWTSBzdWJzeXN0ZW0gYW5k
IGV4ZWN1dGVkIGluIGVpdGhlciBhIHdvcmsgaXRlbSwga3RocmVhZCBvciBmb3JlaWduIHByb2Nl
c3MgY29udGV4dC4KPgo+IE5vdyB0cmFjaW5nIHRoZSBwaWQgb2YgdGhlIGNvbnRleHQgd2hpY2gg
d2UgYXJlIGV4ZWN1dGluZyBpbiBpcyBub3QgcmVhbGx5IHRoYXQgdXNlZnVsLCBzbyBJJ20gd29u
ZGVyaW5nIGlmIHdlIGNvdWxkIGp1c3Qgb3ZlcndyaXRlIHRoZSBwaWQgcmVjb3JkZWQgaW4gdGhl
IHRyYWNlIGVudHJ5Pwo+Cj4gVGhlIGZvbGxvd2luZyBwYXRjaCBkb2VzIGV4YWN0bHkgdGhhdCBm
b3IgdGhlIHZtX2dyYWJfaWQoKSB0cmFjZSBwb2ludCwgYnV0IEknbSBub3QgMTAwJSBzdXJlIGlm
IHRoYXQgaXMgbGVnYWwgb3Igbm90Lgo+Cj4gQW55IGlkZWFzPyBDb21tZW50cz8KPgo+IFRoYW5r
cywKPiBDaHJpc3RpYW4uCj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
