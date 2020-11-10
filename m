Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF792AE242
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 22:56:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73BB889CCE;
	Tue, 10 Nov 2020 21:56:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE33A89CBA;
 Tue, 10 Nov 2020 21:56:48 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id p1so14349441wrf.12;
 Tue, 10 Nov 2020 13:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=40omrK6jwVC+aGDjc/p56ppv0VGpUdQ0A5+JFg7+4BU=;
 b=M352Gzv0QFRwWiCLRwUwno3Jg8Xz7FeRCTZVmlV/O/l73Iy4IHTrK26aGfaVEGKdH0
 3JcMPIYM+ycOaq7AZtFqSMFyvwH5L/6tLuJgQqUO8OxjH7C/eweuJaKi/Q5vBamhW95h
 x1WXVzTDGvpX1cSHlfOh6n9AEEQLrt67YRyd6i25HbWvF3NYkrKNedhIrUFmpH/FV8si
 ySRZVtT723W+dsFnPtUUvfI7wCd4RhGjO7J4Yh2gTDycOpZKLn60ggtZp56uOH7V1enC
 FxJRrIkV6hM64e5F+tiIQH7QPh6RkbSdRy/DDXBlK03vozbBt1Ox0Ja2RawvhrGHlijA
 FpVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=40omrK6jwVC+aGDjc/p56ppv0VGpUdQ0A5+JFg7+4BU=;
 b=QkF8zc1NYYv/SkQZ3t2apBUxttVLAN8p2UTIOE+OwH+VbxoT0Pf3SeEX7Ql0soaMd+
 RH+MZr48ZgH+pthilOG4b91SukSzR5DkbasbpQsRc2WInOMofD61FWc8kQr94zu6nQKg
 ocqoPwz/EcP6mjcaSFo1AhCIfZVOztjtH+kUfs3CgnYgHs9Fr0L2KDd/iIQJmlm1D82D
 RlLOOAhHoWxV1iM7by1wotlMFSCPvA0TgPvUW9MCI+hE4qbDNUFsR1Dq3+YiAWCtkUrZ
 Rv32g88iq/rRpg+wJKDOxwFEaVPprGo+HDidN4N/c8pZPnr3UALpncALzqeesTZ2+lwJ
 iR1Q==
X-Gm-Message-State: AOAM530YSdRYxyoTsJEAhjkegg3ADwwTfk+QjxJm5RkzOxarFK3TnRFP
 pNwgcLRkmfoB89+EFrS8XnpCkcC1U6uUhHGSa1Q=
X-Google-Smtp-Source: ABdhPJzDUdhiFsWJCcbbAH8zpxq3hpcRSnN+82fZTQneP9T8/MJXOJpnYQS9UGxklNwYE5q6WceWD/XEtSe88r6hrEk=
X-Received: by 2002:adf:e9c9:: with SMTP id l9mr27739118wrn.124.1605045407718; 
 Tue, 10 Nov 2020 13:56:47 -0800 (PST)
MIME-Version: 1.0
References: <20201106214949.2042120-1-lee.jones@linaro.org>
 <20201106214949.2042120-12-lee.jones@linaro.org>
In-Reply-To: <20201106214949.2042120-12-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 10 Nov 2020 16:56:31 -0500
Message-ID: <CADnq5_OxJ+bWzvrmNGgnArGVUyZx6K=+rxZMhbpThTwA2LJ5Mg@mail.gmail.com>
Subject: Re: [PATCH 11/19] drm/radeon/radeon_drv: Source file headers are not
 good candidates for kernel-doc
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Gareth Hughes <gareth@valinux.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgNiwgMjAyMCBhdCA0OjUwIFBNIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+IHdyb3RlOgo+Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdh
cm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmM6Mjogd2Fy
bmluZzogQ2Fubm90IHVuZGVyc3RhbmQgICogZmlsZSByYWRlb25fZHJ2LmMKPgo+IENjOiBBbGV4
IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2
bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxp
ZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzog
R2FyZXRoIEh1Z2hlcyA8Z2FyZXRoQHZhbGludXguY29tPgo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gU2ln
bmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCkFwcGxpZWQuICBU
aGFua3MhCgpBbGV4Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYu
YyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMgYi9k
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYuYwo+IGluZGV4IDU2MDI2N2NjMjU4OTIu
LmJiN2IzM2U1MzVmODEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRl
b25fZHJ2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYuYwo+IEBA
IC0xLDQgKzEsNCBAQAo+IC0vKioKPiArLyoKPiAgICogXGZpbGUgcmFkZW9uX2Rydi5jCj4gICAq
IEFUSSBSYWRlb24gZHJpdmVyCj4gICAqCj4gLS0KPiAyLjI1LjEKPgo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlz
dAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
