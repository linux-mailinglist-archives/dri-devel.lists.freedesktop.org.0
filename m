Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5886E2CAAEF
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 19:42:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 261CE6E871;
	Tue,  1 Dec 2020 18:42:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F9EC6E554;
 Tue,  1 Dec 2020 18:42:12 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id f16so2627596otl.11;
 Tue, 01 Dec 2020 10:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=o8Yrz8jCTUvvNG9mLNTC9WmXE/KF1ZhcQr5AMsMwdps=;
 b=aBc33o0oe6NaVoE/E0JyZA7eVWqUew8ia3eAKpGwlmDiwdUYJDm8cxS2c2uGK3EZp6
 b8opUjYb0qH9xuqBwr1igXhJU6p+DIbW4p/j4eGebWV1Kp6N1fLXUxHBIiwkneuyv2oe
 XcU3MyRz+AdoR2sN0xm2TJB8eB9lPJ21weIMS0CmTrp1vw9hSxA5c6WAhKMGcFCJZh+A
 GgG8B774p7Ifu380VV//5y1hFe431rFjfmCTca71QpYSM6eYiHbksMXrXKg6d0ZmqPZh
 sc9U8ZtXlxZVkBY5v/Jq9Bpem2xp3QV5mgoUWF0j2cshMlRPJp1gaGayxrI16fn9OcGo
 4CZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=o8Yrz8jCTUvvNG9mLNTC9WmXE/KF1ZhcQr5AMsMwdps=;
 b=bJsrXMnLRvuAFB7/6rNX2SZGd/ekjvza5jZWeeU+WovacTbEf6cCedcjm/NnQGCFKO
 rTgoi2yk8rf2o7sx36JXNtQFfcYA7whNUSvpN0HCwl6OfpugdrzpiEzBhAEs6g6X77QF
 9kiOR0CfAnrNb7mNPWUJ8T+KUunIzkNoMBk0eLiSNHZCWtx629eu0mYlMLGMubACv3qO
 fcIqTh1FT8E5FktwIWXovpVzP7gXAZQNmFD/ad7OAds+0IH739p1OyEgp8YPZYu5cDPP
 6wnjyAX3ogYncCWtkCow5M3N+HlHaI4Xvb/bwBNOw9h4VNInaL4vN9LWfSL/0At1c5HM
 svkA==
X-Gm-Message-State: AOAM531lq7ITzDJWPISFj0OBc3leE3iD+pOKxJmgQf8Fc4GRBV4xbKEv
 om5DBl7OY4VB1XQF0rWoacRm/dcy5cKJug4a+zI=
X-Google-Smtp-Source: ABdhPJwPAdvf76C34gbDWPn0PpvAj/ob9qqS7TppUse2a8h8fydpmpIQPA9Da8aID2PSj86TD3qS8t2bQYY1iYisJic=
X-Received: by 2002:a9d:5388:: with SMTP id w8mr2866367otg.311.1606848131784; 
 Tue, 01 Dec 2020 10:42:11 -0800 (PST)
MIME-Version: 1.0
References: <20201126134240.3214176-1-lee.jones@linaro.org>
 <20201126134240.3214176-35-lee.jones@linaro.org>
In-Reply-To: <20201126134240.3214176-35-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 1 Dec 2020 13:42:00 -0500
Message-ID: <CADnq5_On90z1w=_usmjA7kHFVig3uHg4VJRecDraYZv8cmRAUQ@mail.gmail.com>
Subject: Re: [PATCH 34/40] drm/amd/display/amdgpu_dm/amdgpu_dm_helpers: Use
 'gnu_printf' format notation
To: Lee Jones <lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjYsIDIwMjAgYXQgODo0NCBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvYW1k
Z3B1X2RtL2FtZGdwdV9kbV9oZWxwZXJzLmM6IEluIGZ1bmN0aW9uIOKAmGRtX2R0bl9sb2dfYXBw
ZW5kX3bigJk6Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvYW1kZ3B1
X2RtL2FtZGdwdV9kbV9oZWxwZXJzLmM6MzQ1OjI6IHdhcm5pbmc6IGZ1bmN0aW9uIOKAmGRtX2R0
bl9sb2dfYXBwZW5kX3bigJkgbWlnaHQgYmUgYSBjYW5kaWRhdGUgZm9yIOKAmGdudV9wcmludGbi
gJkgZm9ybWF0IGF0dHJpYnV0ZSBbLVdzdWdnZXN0LWF0dHJpYnV0ZT1mb3JtYXRdCj4gIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZWxw
ZXJzLmM6Mzc1OjM6IHdhcm5pbmc6IGZ1bmN0aW9uIOKAmGRtX2R0bl9sb2dfYXBwZW5kX3bigJkg
bWlnaHQgYmUgYSBjYW5kaWRhdGUgZm9yIOKAmGdudV9wcmludGbigJkgZm9ybWF0IGF0dHJpYnV0
ZSBbLVdzdWdnZXN0LWF0dHJpYnV0ZT1mb3JtYXRdCj4KPiBDYzogSGFycnkgV2VudGxhbmQgPGhh
cnJ5LndlbnRsYW5kQGFtZC5jb20+Cj4gQ2M6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgo+
IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6ICJDaHJp
c3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBEYXZpZCBBaXJs
aWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5j
aD4KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVz
QGxpbmFyby5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVf
ZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1
X2RtL2FtZGdwdV9kbV9oZWxwZXJzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1k
Z3B1X2RtL2FtZGdwdV9kbV9oZWxwZXJzLmMKPiBpbmRleCBiN2Q3ZWMzYmEwMGQ3Li4yNGE4MTY0
MmJhYTI2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVf
ZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYwo+IEBAIC0zMTgsNiArMzE4LDcgQEAgdm9p
ZCBkbV9kdG5fbG9nX2JlZ2luKHN0cnVjdCBkY19jb250ZXh0ICpjdHgsCj4gICAgICAgICBkbV9k
dG5fbG9nX2FwcGVuZF92KGN0eCwgbG9nX2N0eCwgIiVzIiwgbXNnKTsKPiAgfQo+Cj4gK19fcHJp
bnRmKDMsIDQpCgpDYW4geW91IGV4cGFuZCBhIGJpdCBvbiB3aGF0IHRoaXMgZG9lcz8KCkFsZXgK
Cj4gIHZvaWQgZG1fZHRuX2xvZ19hcHBlbmRfdihzdHJ1Y3QgZGNfY29udGV4dCAqY3R4LAo+ICAg
ICAgICAgc3RydWN0IGRjX2xvZ19idWZmZXJfY3R4ICpsb2dfY3R4LAo+ICAgICAgICAgY29uc3Qg
Y2hhciAqbXNnLCAuLi4pCj4gLS0KPiAyLjI1LjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
