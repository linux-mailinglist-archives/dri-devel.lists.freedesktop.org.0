Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E195D51A
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 19:15:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D7989FD4;
	Tue,  2 Jul 2019 17:15:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D81789FD4;
 Tue,  2 Jul 2019 17:15:45 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id e189so13651981oib.11;
 Tue, 02 Jul 2019 10:15:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=og3EkWQJXaWgCrH2OkKTqQBtV1KkCfT3gRvChQ4RFWk=;
 b=YB9zg+Gu23PqEzjJfzhimAPjaBvKzmMcsho1E1QzYVgfRr8JWc2BKx1t44Qg4j+Mut
 2uRSw4FyHzXyYBHVDRkK8TwDDNsW518TYFlXSCIVPkZXXKGtX5Xs7IW3ljyRWscGmfrr
 TYP/qH1YUEpXjcyb09hdyF/4Mezv9XtVAjQLwTEgd216inyNfnzyLSYUspwMfpWZUuzL
 XW5wJN+D7+RTQkK6BiAky7c7dlz7E8Gd3CaeMjjudzmnZBfUcF11BEgkyIrAouhAMYHa
 6OlWEXgBfAl4qsqxe7HqVnsOkT4YcVDnU0sv14JgUYoGCCjKluVqmpLeo2WeDoBLJuPK
 WWCg==
X-Gm-Message-State: APjAAAU71gAgEKbTG37XggsryM5VPnXdrQTF9xHO1hczWMi4mU1/o0Mf
 NtOsBmd8oP/yftqvtzdVlMFuOMf2n81qRN1yj7U=
X-Google-Smtp-Source: APXvYqzl0yrvFOrkrdBwV0B4j8J1gCEiL1qb57eXkLwL+8fKrTqyINfbu5mOLi+Byy1hcrDx4sC2VTVtBfRJLKuC2aU=
X-Received: by 2002:aca:de56:: with SMTP id v83mr3582702oig.162.1562087744262; 
 Tue, 02 Jul 2019 10:15:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190614173335.30907-1-emil.l.velikov@gmail.com>
 <b3b4b6d8-1b64-7860-88e5-ec91b9d2f711@amd.com>
In-Reply-To: <b3b4b6d8-1b64-7860-88e5-ec91b9d2f711@amd.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 2 Jul 2019 18:15:55 +0100
Message-ID: <CACvgo51LkcF6LydoH8BCaKwK4trfrm0EQkjMricQ3b0RXcrhrA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: extend AMDGPU_CTX_PRIORITY_NORMAL comment
To: "Koenig, Christian" <Christian.Koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=og3EkWQJXaWgCrH2OkKTqQBtV1KkCfT3gRvChQ4RFWk=;
 b=VxKYo+cKHqme91xpelXNGedZd1hjazwXl2QgAPcHQKNT4TYRYLVlUmiz892tUpxHD6
 4O4LYqoRHYu2iyehNPBgBE89BkSQ8wvU6BKwN7w41y0ojW4PDLCKCAaIYmY/9GExNA77
 0DANEBSAGMQVt/Pu6jWJrnS3ehT7iwmqaJFDuE52nje0NWoiMnQNhMgfwRhnS1Q20Mv2
 1oJ536apUpuqwbddMsWnspjBa7Cv/6Vw6w2O2KNBVnxV6oohtvYd7aeHSjYM6Ap9kf76
 6FxOPUFHFfdOO+7rRRcnhqUxyrSEItlqNG8Xh6o6I2qRhcbWNPiR8rfKckJyI+96w2hu
 adfQ==
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAxNCBKdW4gMjAxOSBhdCAxOTowMiwgS29lbmlnLCBDaHJpc3RpYW4KPENocmlzdGlh
bi5Lb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4KPiBBbSAxNC4wNi4xOSB1bSAxOTozMyBzY2hyaWVi
IEVtaWwgVmVsaWtvdjoKPiA+IEZyb206IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxh
Ym9yYS5jb20+Cj4gPgo+ID4gQ3VycmVudGx5IHRoZSBBTURHUFVfQ1RYX1BSSU9SSVRZXyogZGVm
aW5lcyBhcmUgdXNlZCBpbiBib3RoCj4gPiBkcm1fYW1kZ3B1X2N0eF9pbjo6cHJpb3JpdHkgYW5k
IGRybV9hbWRncHVfc2NoZWRfaW46OnByaW9yaXR5Lgo+ID4KPiA+IEV4dGVuZCB0aGUgY29tbWVu
dCB0byBtZW50aW9uIHRoZSBDQVBfU1lTX05JQ0Ugb3IgRFJNX01BU1RFUiByZXF1aXJlbWVudAo+
ID4gaXMgb25seSBhcHBsaWNhYmxlIHdpdGggdGhlIGZvcm1lci4KPiA+Cj4gPiBDYzogQmFzIE5p
ZXV3ZW5odWl6ZW4gPGJhc0BiYXNuaWV1d2VuaHVpemVuLm5sPgo+ID4gQ2M6IENocmlzdGlhbiBL
w7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiA+IENjOiBBbGV4IERldWNoZXIgPGFs
ZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBFbWlsIFZlbGlrb3Yg
PGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgo+ID4gLS0tCj4gPiBNaWxkbHkgY3VyaW91czog
d2h5IGRpZG4ndCBvbmUgZXh0ZW5kIGN0eF9hbWRncHVfY3R4IGluc3RlYWQgb2YgYWRkaW5nCj4g
PiBkcm1fYW1kZ3B1X3NjaGVkPyBOZXcgZmxhZyArIF91MzIgZmQgYXQgdGhlIGVuZCAoZm9yIHRo
ZSBmb3JtZXIpIHdvdWxkCj4gPiBoYXZlIGJlZW4gZW5vdWdoIChhbmQgdHdlYWtpbmcgdGhlIGlv
Y3RsIHBlcm1pc3Npb24gdGhpbmd5KS4KPgo+IFRoZSBkcm1fYW1kZ3B1X3NjaGVkIGlzIG9ubHkg
YWxsb3dlZCBmb3IgRFJNX01BU1RFUi4KPgpGYWlyIGVub3VnaC4KCklzIHRoZSBwYXRjaCB3cm9u
ZyBvciBkaWQgaXQgc2xpcCB0aHJvdWdoIHRoZSBjcmFja3M/IEkgY2Fubm90IHNlZSBpdAppbiBB
bGV4J3MgdHJlZS4KCi1FbWlsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
