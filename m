Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0CB7E2ED
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 21:02:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 013B76E78A;
	Thu,  1 Aug 2019 19:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCCD16E789;
 Thu,  1 Aug 2019 19:02:43 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id a15so65638413wmj.5;
 Thu, 01 Aug 2019 12:02:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/POvTmTfjL31nxmINd6RtTIgV6KXg8CsQfIX6UeNUIA=;
 b=Ve6NHxwqnoTJqkBTAJkQ3HswVRTaXGSjeDEvgM/vHzSxQq860TFeh2f0iW/6p4qzjc
 Ryt/+jH24HnHHmAlIuuCOC0BFoXskpV95Yb8dlg7zQ3HjGbf0cC0NORBhFicjOJkZnXM
 FT5e1y5eSvycEmWWD7dVyW+QBw0SRCsnqeZQNMg3VrgNBTM7MTM8tz9R29GdPOnCPLLm
 SPZJdRoBwGDwwJ6Yr5K0T21U/2dHkHW8U9IjhzaKpgt4Mf4t1vckyr/xQBRUGe7PcLhA
 zG3TqCGhLURhMoTmv3W7XMuxYkuaFHmGT9SQY10t9eSpkPH2PUPJJbf5aNsT5jmrhHkh
 pvRg==
X-Gm-Message-State: APjAAAX3kJJtidujX1yuzIofkxEKw8ertxajhFzRNWGk9USr/i+AFbEn
 DltPXKXU6LNVqPZl10iPqGY/vej3h0HlR3a4yuc=
X-Google-Smtp-Source: APXvYqxd7txH/0Xqawtlq4/3946FsQXXqi/tgTt2bmCLEn79m8eixcweHvGESH1mFACooCrMoEojNCTRqwePPhfPcIE=
X-Received: by 2002:a7b:c751:: with SMTP id w17mr175934wmk.127.1564686161830; 
 Thu, 01 Aug 2019 12:02:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190801083941.4230-1-colin.king@canonical.com>
In-Reply-To: <20190801083941.4230-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 1 Aug 2019 15:02:30 -0400
Message-ID: <CADnq5_OdBM83zkkgtjwzQ0jqsiDP5wZoMXioGcq4mycX2=Tavw@mail.gmail.com>
Subject: Re: [PATCH][drm-next] drm/amd/powerplay: fix a few spelling mistakes
To: Colin King <colin.king@canonical.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=/POvTmTfjL31nxmINd6RtTIgV6KXg8CsQfIX6UeNUIA=;
 b=rcE8EeiR8tECv5Jp3ADVBJoLuCzbgP+eanvLuzFYhYz/P2uJlPRPIa2JcgjPl6ntA6
 bzpgX3XyrX+Ttzr3kI0thbxr3oAktPgjIXJC/QtgbYuFjIXUb60WzYTqpgb8z5eZ8qcr
 +mJUwXGEtw0OA9ERd2nfA5Q+qS+Cf8kbRnvD8sEJyXcR4hbcp7C+pdatinbgVFIvtPE7
 wqNvG7gzcYCTWvQDzmtE07B/sKnGNu1F7y3iJQ9FCqCl417wV9FInMOGQl71BwXNwwBS
 rgx+m2BLJ41o9aXZUMV3D5zr6ZjKa1hF1VqFal2ytUDDZ959/NSb/bfxC4KM2bv/Z5Hj
 7+cw==
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Rex Zhu <rex.zhu@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIHRoYW5rcyEKCkFsZXgKCk9uIFRodSwgQXVnIDEsIDIwMTkgYXQgNDozOSBBTSBD
b2xpbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogQ29s
aW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KPgo+IFRoZXJlIGFyZSBhIGZl
dyBzcGVsbGluZyBtaXN0YWtlcyAidW5rbm93IiAtPiAidW5rbm93biIgYW5kCj4gImVuYWJlbGQi
IC0+ICJlbmFibGVkIi4gRml4IHRoZXNlLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtp
bmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jIHwgNiArKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9hbWRncHVfc211LmMKPiBpbmRleCAxM2IyYzhhNjAyMzIuLmQwMjlhOTllNjAwZSAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKPiBAQCAt
MzksNyArMzksNyBAQCBzdGF0aWMgY29uc3QgY2hhciogX19zbXVfbWVzc2FnZV9uYW1lc1tdID0g
ewo+ICBjb25zdCBjaGFyICpzbXVfZ2V0X21lc3NhZ2VfbmFtZShzdHJ1Y3Qgc211X2NvbnRleHQg
KnNtdSwgZW51bSBzbXVfbWVzc2FnZV90eXBlIHR5cGUpCj4gIHsKPiAgICAgICAgIGlmICh0eXBl
IDwgMCB8fCB0eXBlID4gU01VX01TR19NQVhfQ09VTlQpCj4gLSAgICAgICAgICAgICAgIHJldHVy
biAidW5rbm93IHNtdSBtZXNzYWdlIjsKPiArICAgICAgICAgICAgICAgcmV0dXJuICJ1bmtub3du
IHNtdSBtZXNzYWdlIjsKPiAgICAgICAgIHJldHVybiBfX3NtdV9tZXNzYWdlX25hbWVzW3R5cGVd
Owo+ICB9Cj4KPiBAQCAtNTIsNyArNTIsNyBAQCBzdGF0aWMgY29uc3QgY2hhciogX19zbXVfZmVh
dHVyZV9uYW1lc1tdID0gewo+ICBjb25zdCBjaGFyICpzbXVfZ2V0X2ZlYXR1cmVfbmFtZShzdHJ1
Y3Qgc211X2NvbnRleHQgKnNtdSwgZW51bSBzbXVfZmVhdHVyZV9tYXNrIGZlYXR1cmUpCj4gIHsK
PiAgICAgICAgIGlmIChmZWF0dXJlIDwgMCB8fCBmZWF0dXJlID4gU01VX0ZFQVRVUkVfQ09VTlQp
Cj4gLSAgICAgICAgICAgICAgIHJldHVybiAidW5rbm93IHNtdSBmZWF0dXJlIjsKPiArICAgICAg
ICAgICAgICAgcmV0dXJuICJ1bmtub3duIHNtdSBmZWF0dXJlIjsKPiAgICAgICAgIHJldHVybiBf
X3NtdV9mZWF0dXJlX25hbWVzW2ZlYXR1cmVdOwo+ICB9Cj4KPiBAQCAtNzksNyArNzksNyBAQCBz
aXplX3Qgc211X3N5c19nZXRfcHBfZmVhdHVyZV9tYXNrKHN0cnVjdCBzbXVfY29udGV4dCAqc211
LCBjaGFyICpidWYpCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvdW50KyssCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNtdV9nZXRfZmVhdHVyZV9uYW1lKHNtdSwg
aSksCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZlYXR1cmVfaW5kZXgsCj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICEhc211X2ZlYXR1cmVfaXNfZW5hYmxlZChzbXUs
IGkpID8gImVuYWJlbGQiIDogImRpc2FibGVkIik7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICEhc211X2ZlYXR1cmVfaXNfZW5hYmxlZChzbXUsIGkpID8gImVuYWJsZWQiIDogImRp
c2FibGVkIik7Cj4gICAgICAgICB9Cj4KPiAgZmFpbGVkOgo+IC0tCj4gMi4yMC4xCj4KPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
