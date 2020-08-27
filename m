Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2473254649
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 15:51:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA0EB6E0CE;
	Thu, 27 Aug 2020 13:51:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D38FE6E2B2;
 Thu, 27 Aug 2020 13:51:20 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id a5so5462786wrm.6;
 Thu, 27 Aug 2020 06:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gVkUKTaskmscEtJ5ZzwNNX4gLUBJNoLUiPlck3rKbv8=;
 b=U49jQz3y2e7EBaQRi0qQ8rVwz+yVCuKIkU3XMjTPV0+omeVKFMKkRkG1gj9Z1Qs0e+
 9/0eC6U3p2vdfQyOzwun5pf9Tgf3/WZK43hOtQZrAmXwbrTx+ZcmOCjxqbEFi/mTvLdR
 9QfHSL8A+03Qb/FkGs0R3usdDG+Cu4cehsMOL2SgT0SuW0RLJk3B2Yih4xj+1w0SiYhX
 3uvT4T8iKUPGuYAPD/H9xXeId5nuIflMmqrtHnkj2zYKDt9ysmD0UvCQhdSFAhZ9b4P2
 ahfSfh3d4Xf9Iti9vX/BS1QEv8Gd56wgLUwKxS28ZyBOsP7CixS9ed9DCUpS2gAyTvml
 LAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gVkUKTaskmscEtJ5ZzwNNX4gLUBJNoLUiPlck3rKbv8=;
 b=GV4VmHK1BVWAHLgDNxsJqCxCC18KFd3EM6NXcia26R92TAzDZuosdU7In0kaN1ImJc
 4c3lNiEUGuDk0328I7D9/M0IXJDRPPSge4e+W7euX/8CP0qu/yJVp/rzc/0YczUuEvAH
 TLXLSUwZzSXz+ve2cWWzxqngywKQ0isGS2R/mLKNlMLbxMi/leiavfWJcjTF1UyryFqr
 8USW1MRawvwmVzT6Q8o71Wfb0H+N9YCCm6c/Ya1Fqisb6KcnbCiMzTE0o54NF3CkWkZy
 GgQVl8kPdi4svnG9E4QTYd2DK/SU9qYCul9eTgwTxo1JCbnDTAo+VuG6tz2Ss0OP7/p8
 rWhg==
X-Gm-Message-State: AOAM530pD7dUk+NO16Oruj4BaoZoHUMaMw9xaHrvPgOp+p2WVao/cN8v
 8ObSq5NRxuMoMJ9xU3BAUYkLHk9+tODrwslL3AvW46ar
X-Google-Smtp-Source: ABdhPJxUZbYiTHvH8yDDYRyp/OquPDJR8jlbS1sFzWfTl9o8bEGgVH+bzOnmOMvlXjdes3JSpG739Z6gh+aJGBfj90Q=
X-Received: by 2002:adf:fecc:: with SMTP id q12mr21109309wrs.374.1598536279457; 
 Thu, 27 Aug 2020 06:51:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200825173349.24580-1-kai.heng.feng@canonical.com>
 <36ccb6ad-d005-4c39-fc32-7ecf4e71331f@amd.com>
In-Reply-To: <36ccb6ad-d005-4c39-fc32-7ecf4e71331f@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 27 Aug 2020 09:51:08 -0400
Message-ID: <CADnq5_NX8xmYbz8EiXZMRLXUV46W7cLUsBEj+AHX=we-sN=m8w@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: Prefer lower feedback dividers
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "Deucher, Alexander" <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCk9uIFRodSwgQXVnIDI3LCAyMDIwIGF0IDc6MTggQU0g
Q2hyaXN0aWFuIEvDtm5pZwo8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IEFt
IDI1LjA4LjIwIHVtIDE5OjMzIHNjaHJpZWIgS2FpLUhlbmcgRmVuZzoKPiA+IENvbW1pdCAyZTI2
Y2NiMTE5YmQgKCJkcm0vcmFkZW9uOiBwcmVmZXIgbG93ZXIgcmVmZXJlbmNlIGRpdmlkZXJzIikK
PiA+IGZpeGVkIHNjcmVlbiBmbGlja2VyIGZvciBIUCBDb21wYXEgbng5NDIwIGJ1dCBicmVha3Mg
b3RoZXIgbGFwdG9wcyBsaWtlCj4gPiBBc3VzIFg1MFNMLgo+ID4KPiA+IFR1cm5zIG91dCB3ZSBh
bHNvIG5lZWQgdG8gZmF2b3IgbG93ZXIgZmVlZGJhY2sgZGl2aWRlcnMuCj4KPiBNaG0sIGxldCdz
IGhvcGUgdGhhdCB0aGlzIHdvcmtzIG91dCBmb3IgYWxsIG90aGVycyBhcyB3ZWxsIDopCj4KPiA+
Cj4gPiBVc2VycyBjb25maXJtZWQgdGhpcyBjaGFuZ2UgZml4ZXMgdGhlIHJlZ3Jlc3Npb24gYW5k
IGRvZXNuJ3QgcmVncmVzcyB0aGUKPiA+IG9yaWdpbmFsIGZpeC4KPiA+Cj4gPiBGaXhlczogMmUy
NmNjYjExOWJkICgiZHJtL3JhZGVvbjogcHJlZmVyIGxvd2VyIHJlZmVyZW5jZSBkaXZpZGVycyIp
Cj4gPiBCdWdMaW5rOiBodHRwczovL2J1Z3MubGF1bmNocGFkLm5ldC9idWdzLzE3OTEzMTIKPiA+
IEJ1Z0xpbms6IGh0dHBzOi8vYnVncy5sYXVuY2hwYWQubmV0L2J1Z3MvMTg2MTU1NAo+ID4gU2ln
bmVkLW9mZi1ieTogS2FpLUhlbmcgRmVuZyA8a2FpLmhlbmcuZmVuZ0BjYW5vbmljYWwuY29tPgo+
Cj4gUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4KPgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rpc3BsYXku
YyB8IDIgKy0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rp
c3BsYXkuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rpc3BsYXkuYwo+ID4gaW5k
ZXggZTBhZTkxMWVmNDI3Li43YjY5ZDZkZmU0NGEgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL3JhZGVvbl9kaXNwbGF5LmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9y
YWRlb24vcmFkZW9uX2Rpc3BsYXkuYwo+ID4gQEAgLTkzMyw3ICs5MzMsNyBAQCBzdGF0aWMgdm9p
ZCBhdml2b19nZXRfZmJfcmVmX2Rpdih1bnNpZ25lZCBub20sIHVuc2lnbmVkIGRlbiwgdW5zaWdu
ZWQgcG9zdF9kaXYsCj4gPgo+ID4gICAgICAgLyogZ2V0IG1hdGNoaW5nIHJlZmVyZW5jZSBhbmQg
ZmVlZGJhY2sgZGl2aWRlciAqLwo+ID4gICAgICAgKnJlZl9kaXYgPSBtaW4obWF4KGRlbi9wb3N0
X2RpdiwgMXUpLCByZWZfZGl2X21heCk7Cj4gPiAtICAgICAqZmJfZGl2ID0gRElWX1JPVU5EX0NM
T1NFU1Qobm9tICogKnJlZl9kaXYgKiBwb3N0X2RpdiwgZGVuKTsKPiA+ICsgICAgICpmYl9kaXYg
PSBtYXgobm9tICogKnJlZl9kaXYgKiBwb3N0X2RpdiAvIGRlbiwgMXUpOwo+ID4KPiA+ICAgICAg
IC8qIGxpbWl0IGZiIGRpdmlkZXIgdG8gaXRzIG1heGltdW0gKi8KPiA+ICAgICAgIGlmICgqZmJf
ZGl2ID4gZmJfZGl2X21heCkgewo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
