Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E00B9EAC5
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 16:20:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7D1889BA5;
	Tue, 27 Aug 2019 14:20:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A9789BA5;
 Tue, 27 Aug 2019 14:20:26 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id b16so18988231wrq.9;
 Tue, 27 Aug 2019 07:20:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iBAm6erRWZATcOthg0y2dJxIFllt+ucHuf1C3MzA8xw=;
 b=GTvoX1Q8vkTwiyKtz3OQGSEgLx+6q/kG5N407Onz63lpbkkxaLeiUbj2Jtrl++C/LY
 cNi3mbf7Pmk9sEA3IJQNKSJj8MGCbv+EMkpCNorvx/h3SNc/cPnaOihQgvRz62ayVmcl
 FhAUp4ro8CZpxHhUWm8fM7L/vc0vSTb2QP7Rm4y2kHY0VfFiZSszEpv9xyRrK/llT3Jz
 Jd9/tsOxY372fCTE5W43MGGa+ILBJPMVF/3xQY63GAjF6PL6AK0RQVoGQOUNQjdnh19a
 PgtBhJra+tf5few6hjUqbG4TVePBx3DT0e02qQko5F92j8jwoCd4cNQa8eUUiq4lepAy
 Uw9g==
X-Gm-Message-State: APjAAAVsoYiyXdtYdGstk0HMUyE2dyDDwzWKBAyvIo2IBs7AvV/bmuST
 L2061H2rInC2PSyXwC2GQShZb39+xHYQZll2aNU=
X-Google-Smtp-Source: APXvYqyf+l+zuM8bhu1HQmmKMsstVBdXQfSESMC96ize5xVQmpsWd4VMknKBd7ff6xmTFakrJ7EBlQeZs551NLPIbkY=
X-Received: by 2002:adf:dfc5:: with SMTP id q5mr31077656wrn.142.1566915624956; 
 Tue, 27 Aug 2019 07:20:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190827070925.16080-1-yuehaibing@huawei.com>
 <fb49a1d9-8405-4f88-6f9a-af863bd0f657@amd.com>
In-Reply-To: <fb49a1d9-8405-4f88-6f9a-af863bd0f657@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 27 Aug 2019 10:20:13 -0400
Message-ID: <CADnq5_Pe-qnTWZrDxmC=xqHJBQ_SkaBv8go9mVWWp7MciC4NHA@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/amd/display: remove unused function
 setFieldWithMask
To: Harry Wentland <hwentlan@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=iBAm6erRWZATcOthg0y2dJxIFllt+ucHuf1C3MzA8xw=;
 b=RFLfJno467RtH4FMFNsNGodYoehjqiEmmDcT0VHAQJujyCJrQoi0YkjOSL369QMh6H
 k5Li5GpbbvhBdrzdZKQ+vvxAw92nk+1X6N6OVTQxPBUjqhtv69OPNiU2eiypNiutjuOT
 4U3UeVOlM0Mlof1b0Rjcb12rIH38DcARvNw9UhyqmUpqiHhWyzXUgYlovd+GPoe6D1v2
 cqakq6Ntny2fBwXc0WWS45FRf5qQY/HjtwInf9MwZ6HDKqoa4gIXD2v8E8G/wsI83Fqg
 /Z5Okhwa3D0sbeKH0Vzpy5vcpeIYZ3nI3a0phBKECaVJ3Te3ofO/VqU4gNJaM0C4iUbG
 WmOw==
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
Cc: "Tatla, Harmanprit" <Harmanprit.Tatla@amd.com>, "Li,
 Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, YueHaibing <yuehaibing@huawei.com>,
 "Othman, Ahmad" <Ahmad.Othman@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alvin.lee3@amd.com" <alvin.lee3@amd.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "Bernstein,
 Eric" <Eric.Bernstein@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Koo, Anthony" <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMjcsIDIwMTkgYXQgMTA6MDEgQU0gSGFycnkgV2VudGxhbmQgPGh3ZW50bGFu
QGFtZC5jb20+IHdyb3RlOgo+Cj4gT24gMjAxOS0wOC0yNyAzOjA5IGEubS4sIFl1ZUhhaWJpbmcg
d3JvdGU6Cj4gPiBBZnRlciBjb21taXQgYTlmNTRjZTNjNjAzICgiZHJtL2FtZC9kaXNwbGF5OiBS
ZWZhY3RvcmluZyBWVEVNIiksCj4gPiB0aGVyZSBpcyBubyBjYWxsZXIgaW4gdHJlZS4KPiA+Cj4g
PiBSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+IFNpZ25lZC1vZmYt
Ynk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KPgo+IFJldmlld2VkLWJ5OiBI
YXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KPgoKQXBwbGllZC4gIFRoYW5r
cyEKCkFsZXgKCj4gSGFycnkKPgo+ID4gLS0tCj4gPiAgLi4uL2RybS9hbWQvZGlzcGxheS9tb2R1
bGVzL2luZm9fcGFja2V0L2luZm9fcGFja2V0LmMgfCAxOSAtLS0tLS0tLS0tLS0tLS0tLS0tCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDE5IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9pbmZvX3BhY2tldC9pbmZvX3BhY2tl
dC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvaW5mb19wYWNrZXQvaW5m
b19wYWNrZXQuYwo+ID4gaW5kZXggNWY0Yjk4ZC4uZDg4NWQ2NCAxMDA2NDQKPiA+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2luZm9fcGFja2V0L2luZm9fcGFja2V0
LmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2luZm9fcGFj
a2V0L2luZm9fcGFja2V0LmMKPiA+IEBAIC0xMTQsMjUgKzExNCw2IEBAIGVudW0gQ29sb3JpbWV0
cnlZQ0NEUCB7Cj4gPiAgICAgICBDb2xvcmltZXRyeVlDQ19EUF9JVFUyMDIwWUNiQ3IgID0gNywK
PiA+ICB9Owo+ID4KPiA+IC12b2lkIHNldEZpZWxkV2l0aE1hc2sodW5zaWduZWQgY2hhciAqZGVz
dCwgdW5zaWduZWQgaW50IG1hc2ssIHVuc2lnbmVkIGludCB2YWx1ZSkKPiA+IC17Cj4gPiAtICAg
ICB1bnNpZ25lZCBpbnQgc2hpZnQgPSAwOwo+ID4gLQo+ID4gLSAgICAgaWYgKCFtYXNrIHx8ICFk
ZXN0KQo+ID4gLSAgICAgICAgICAgICByZXR1cm47Cj4gPiAtCj4gPiAtICAgICB3aGlsZSAoISgo
bWFzayA+PiBzaGlmdCkgJiAxKSkKPiA+IC0gICAgICAgICAgICAgc2hpZnQrKzsKPiA+IC0KPiA+
IC0gICAgIC8vcmVzZXQKPiA+IC0gICAgICpkZXN0ID0gKmRlc3QgJiB+bWFzazsKPiA+IC0gICAg
IC8vc2V0Cj4gPiAtICAgICAvL2RvbnQgbGV0IHZhbHVlIHNwYW4gcGFzdCBtYXNrCj4gPiAtICAg
ICB2YWx1ZSA9IHZhbHVlICYgKG1hc2sgPj4gc2hpZnQpOwo+ID4gLSAgICAgLy9pbnNlcnQgdmFs
dWUKPiA+IC0gICAgICpkZXN0ID0gKmRlc3QgfCAodmFsdWUgPDwgc2hpZnQpOwo+ID4gLX0KPiA+
IC0KPiA+ICB2b2lkIG1vZF9idWlsZF92c2NfaW5mb3BhY2tldChjb25zdCBzdHJ1Y3QgZGNfc3Ry
ZWFtX3N0YXRlICpzdHJlYW0sCj4gPiAgICAgICAgICAgICAgIHN0cnVjdCBkY19pbmZvX3BhY2tl
dCAqaW5mb19wYWNrZXQpCj4gPiAgewo+ID4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZngKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
