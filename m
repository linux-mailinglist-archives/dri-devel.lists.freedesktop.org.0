Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5FE2C2C21
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 16:59:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 582E46E435;
	Tue, 24 Nov 2020 15:59:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1494F6E223;
 Tue, 24 Nov 2020 15:59:56 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id p8so22850317wrx.5;
 Tue, 24 Nov 2020 07:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MOtYH7zmSkm/wyvjXA2uMSLKpOc4fBY8q1YbKJj9gW0=;
 b=ogvSpNCxGxIIwc+Bd8F9iaRRkhOWrd+JlcfhHNjNyPAJXK1DlhdusjdKggBPpofh6l
 +ynvtZftDwL+YuK24EjTioFRQxF0lsewJk+QqRs5xV8zptd8fs980w1Vb5Kz8Uqgshg2
 SV34dMaAhy82NU0P5OinQokTrIYWHJUFA0PxcfAFUl+pJI2zgFxYurkQ6lUm1gbpx8Wc
 ELyfteZLxmP/D7LrHQ1WPSwNIv81mNTUEOWvMNH8nWhIexb1cciBIWfORViOowp0ZjBx
 YmuaI8UJLMjng5XyURd4OhVVGdV4n5Kd8KvMEmdMZlfFozOVOmyldq4x43A3HBFHOQ6s
 jJKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MOtYH7zmSkm/wyvjXA2uMSLKpOc4fBY8q1YbKJj9gW0=;
 b=D+Z574TUQBIYclAoGK8qE10f1UdMr22TwOIVu5SqhysbnxbxcmLNPWnYxAbEleTFVD
 JSFxVzTv+feOw+02Xqe2snd1RBcFekDr16e5KT5htxv+dNUMpm+fve19McVRz0DLW0HU
 h79QZzPSoB1bF4CRUAtBauu3hso/hkJDD2uWhHAygEhC49TarpvQApLP2cc98f9GVLaz
 91G7l5K8V+wpeo+bLoRt0ZtXLVerUN/NONNedNxCZH/mBVv505lwb70KAGkx8ZAwFll/
 O8tQiHiP0saehdZQa8ABF7F+fu1mcbOO+80cj/3+Z8A2cmzn69BLYvyXj/QR1UeoGLap
 mGag==
X-Gm-Message-State: AOAM533t9O3YzDIaGqnRiFvt2NZbL7SIB+3fiP1emZDptMNeNuGe7dQ0
 hPrURHJRsnLQfeMTFtWNGSyPpOeBfQjRW/mdrhvNhqyl
X-Google-Smtp-Source: ABdhPJwyF6prafk3stqFvVWr6XpQzFxZOZgLt6R8IKixuiSDtOBmePgANgSRdEfkuA8Foe9Xoa4nBPPW5wKbWZo2xGY=
X-Received: by 2002:a5d:400a:: with SMTP id n10mr5983166wrp.362.1606233594712; 
 Tue, 24 Nov 2020 07:59:54 -0800 (PST)
MIME-Version: 1.0
References: <20201123111919.233376-1-lee.jones@linaro.org>
 <20201123111919.233376-8-lee.jones@linaro.org>
In-Reply-To: <20201123111919.233376-8-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 24 Nov 2020 10:59:43 -0500
Message-ID: <CADnq5_NwUvnMTrAO1t6KWVS=zVEodmYMr-D9_G_1gUM7x4yiiw@mail.gmail.com>
Subject: Re: [PATCH 07/40] drm/amd/amdgpu/dce_v8_0: Supply description for
 'async'
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
 Luben Tuikov <luben.tuikov@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMjMsIDIwMjAgYXQgNjoxOSBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RjZV92OF8wLmM6MTg1
OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdhc3luYycgbm90IGRlc2Ny
aWJlZCBpbiAnZGNlX3Y4XzBfcGFnZV9mbGlwJwo+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFu
ZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4u
a29lbmlnQGFtZC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBD
YzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBMdWJlbiBUdWlrb3YgPGx1
YmVuLnR1aWtvdkBhbWQuY29tPgo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gU2lnbmVkLW9mZi1ieTogTGVl
IEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCkFwcGxpZWQuICBUaGFua3MhCgpBbGV4CgoK
PiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGNlX3Y4XzAuYyB8IDEgKwo+ICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9kY2VfdjhfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
ZGNlX3Y4XzAuYwo+IGluZGV4IDc5NzMxODNmYTMzNWUuLjIyNGIzMDIxNDQyN2YgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGNlX3Y4XzAuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RjZV92OF8wLmMKPiBAQCAtMTc2LDYgKzE3Niw3IEBAIHN0
YXRpYyB2b2lkIGRjZV92OF8wX3BhZ2VmbGlwX2ludGVycnVwdF9maW5pKHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2KQo+ICAgKiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyCj4gICAqIEBj
cnRjX2lkOiBjcnRjIHRvIGNsZWFudXAgcGFnZWZsaXAgb24KPiAgICogQGNydGNfYmFzZTogbmV3
IGFkZHJlc3Mgb2YgdGhlIGNydGMgKEdQVSBNQyBhZGRyZXNzKQo+ICsgKiBAYXN5bmM6IGFzeW5j
aHJvbm91cyBmbGlwCj4gICAqCj4gICAqIFRyaWdnZXJzIHRoZSBhY3R1YWwgcGFnZWZsaXAgYnkg
dXBkYXRpbmcgdGhlIHByaW1hcnkKPiAgICogc3VyZmFjZSBiYXNlIGFkZHJlc3MuCj4gLS0KPiAy
LjI1LjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
