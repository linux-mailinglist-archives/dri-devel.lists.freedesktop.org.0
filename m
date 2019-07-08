Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F6E6257F
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 18:00:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0602989C59;
	Mon,  8 Jul 2019 16:00:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C2589C59;
 Mon,  8 Jul 2019 16:00:00 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c2so17713160wrm.8;
 Mon, 08 Jul 2019 09:00:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EfmsMBiD7ymdFFI6JkOA8q46/TMtliNwPPlkYR2dONs=;
 b=c82w1VCBq3pOROZiAD4KkxKbcnRYcKgjecx9fADVTMy89kVb7OgeD/oxl6p0ZWEwFI
 3DXIUo/TOZwAm5AqixBpWV1CrZVfXKkqp0NktmQCk+EWnBz9+8Q2QyPMtIJ4jo8/VEq1
 MrBdh3KK6g5MQMic/YWXGQIR2Fl069yPKdIGrgbY+xOzSEwr6MO6P3cFKJS+zC6w0kY1
 dh90+nNTCi82WNf7fp21o5pePXQnw3ROjAh+/Wn96nv12aqnuNn22jJY6aYERCSmv12l
 qGOhG/aYqCUKYs3qYod8vk/UuEc88EhJHvimQHQ+c6boTe9qziceCBMCnq8/metowxs7
 dcEw==
X-Gm-Message-State: APjAAAXZyz/7qQaLKUtNs8bChHwA7xC7laj3We3wipU2/qazlolbP1WT
 bq80Wc5641pJ7lQPjDSYFRbeKb/Vdfb5EJ5RShI=
X-Google-Smtp-Source: APXvYqytfkoPC+fjFM+XSffDXhGPJpmy59YbqycegztPzyhvYtqPhdSsol9PfYzWA/XbYSdkxpR1BLoMjpk4RuAW7NA=
X-Received: by 2002:adf:d847:: with SMTP id k7mr463991wrl.74.1562601598985;
 Mon, 08 Jul 2019 08:59:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190708135135.610355-1-arnd@arndb.de>
In-Reply-To: <20190708135135.610355-1-arnd@arndb.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 8 Jul 2019 11:59:47 -0400
Message-ID: <CADnq5_PAQ0_tJApqzCc8tRx-x7gY1HGaAG5zo-jc=zknaAdPow@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix building without CONFIG_HMM_MIRROR
To: Arnd Bergmann <arnd@arndb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=EfmsMBiD7ymdFFI6JkOA8q46/TMtliNwPPlkYR2dONs=;
 b=b46S21mTjINToSoVkmj+AcRN+LZjkQgqcpeDF3pmzNQbtPHSOuQFGiCZ1iZKgiR1VI
 5wUbKwy+k0sXzqpdeFD8VZkWg5mCpQio1phhXtkDz6AH3HgfTxiBMNzbuy/G1AWUbWH/
 7sKYHM7/uuVTPWUvmB9z6Vty+Npia5pVNSCUMpIq1lDnOLg2xBYJ3y3rH/su7tQPocbe
 1TAFvJZoecyq7m/JGFoH2nEttQIrdKi/FGO0VRZxRrdOBvUslKXAsh2Rrblplt8OsLgX
 iZcyiovKDWKth+W1kHXNA7aZyn+PQ6bx56jxOrifjOCUnKJTtATcLdRvqaxhxzYonvw1
 grFA==
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
Cc: Philip Yang <Philip.Yang@amd.com>, David Airlie <airlied@linux.ie>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgOCwgMjAxOSBhdCA5OjUxIEFNIEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIu
ZGU+IHdyb3RlOgo+Cj4gJ3N0cnVjdCBobW1fbWlycm9yJyBpcyBub3QgZGVmaW5lZCB3aXRob3V0
IHRoZSBLY29uZmlnIG9wdGlvbiBzZXQsCj4gc28gd2UgY2Fubm90IGluY2x1ZGUgaXQgd2l0aGlu
IGFub3RoZXIgc3RydWN0Ogo+Cj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1Ly4uL2FtZGdwdS9hbWRncHUuaDo3MjoKPiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS8uLi9hbWRncHUvYW1kZ3B1X21uLmg6Njk6MjA6IGVycm9yOiBmaWVsZCBoYXMgaW5j
b21wbGV0ZSB0eXBlICdzdHJ1Y3QgaG1tX21pcnJvcicKPiAgICAgICAgIHN0cnVjdCBobW1fbWly
cm9yICAgICAgIG1pcnJvcjsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KPiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9hbWRncHUvYW1kZ3B1X21uLmg6Njk6OTogbm90
ZTogZm9yd2FyZCBkZWNsYXJhdGlvbiBvZiAnc3RydWN0IGhtbV9taXJyb3InCj4gICAgICAgICBz
dHJ1Y3QgaG1tX21pcnJvciAgICAgICBtaXJyb3I7Cj4KPiBBZGQgdGhlICNpZmRlZiBhcm91bmQg
aXQgdGhhdCBpcyBhbHNvIHVzZWQgZm9yIGFsbCBmdW5jdGlvbnMgb3BlcmF0aW5nCj4gb24gaXQu
Cj4KPiBGaXhlczogNzU5MGY2ZDIxMWVjICgiZHJtL2FtZGdwdTogUHJlcGFyZSBmb3IgaG1tX3Jh
bmdlX3JlZ2lzdGVyIEFQSSBjaGFuZ2UiKQo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4g
PGFybmRAYXJuZGIuZGU+CgpBcHBsaWVkLiAgdGhhbmtzIQoKQWxleAoKPiAtLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21uLmggfCAyICsrCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfbW4uaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tbi5o
Cj4gaW5kZXggMjgxZmQ5ZmVmNjYyLi5iOGVkNjg5NDM2MjUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21uLmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfbW4uaAo+IEBAIC02NSw4ICs2NSwxMCBAQCBzdHJ1Y3QgYW1kZ3B1
X21uIHsKPiAgICAgICAgIHN0cnVjdCByd19zZW1hcGhvcmUgICAgIGxvY2s7Cj4gICAgICAgICBz
dHJ1Y3QgcmJfcm9vdF9jYWNoZWQgICBvYmplY3RzOwo+Cj4gKyNpZmRlZiBDT05GSUdfSE1NX01J
UlJPUgo+ICAgICAgICAgLyogSE1NIG1pcnJvciAqLwo+ICAgICAgICAgc3RydWN0IGhtbV9taXJy
b3IgICAgICAgbWlycm9yOwo+ICsjZW5kaWYKPiAgfTsKPgo+ICAjaWYgZGVmaW5lZChDT05GSUdf
SE1NX01JUlJPUikKPiAtLQo+IDIuMjAuMAo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
