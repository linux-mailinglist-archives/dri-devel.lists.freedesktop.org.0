Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 021AB2B5333
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 21:51:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03CBC6EA8D;
	Mon, 16 Nov 2020 20:51:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA396E105;
 Mon, 16 Nov 2020 20:51:23 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id m6so3121905wrg.7;
 Mon, 16 Nov 2020 12:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Qs4skqLiNs1YGNTaNHs4+J+kILEtikJu7Z6PW9pHXL0=;
 b=M5uXhBMOsd621ueGmN9QqlJVWGt54ytFnAfTz5h9898EVgRiS8CtI9VQly7fRJoLqm
 HM6doMbFRhSbvRaF2bYqBm9iR7AivFctH5oTE5Y1ZI7XSFpPzQbZCCH7RbpHLZCkaQvJ
 Ckku+jjqFt4e9tiCQt1YO761Vm1LzwuVd1VP6bQjKF6NZsz1Lgyq1W9G5cul1xMVvt/q
 d2YzQY2YuyCCtOrQTw35V0HsQMPQkiUvzkPrp3V4R+22YvZLCzJaQOgAo3yoFONhNyA7
 DOveIEEBn/TG4oOPJg043MNPc3VJZOCe42yC0PC54dCKKvtKKy8wn8kLA849EM4VC8jb
 F5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Qs4skqLiNs1YGNTaNHs4+J+kILEtikJu7Z6PW9pHXL0=;
 b=EWeH04srlGthQvD93+VwCHVsTlBXgauNwU8dLm70PznEfSzmH8mwEs552G5T54fnXq
 FlyMYgiP/KsD3bn/Veiydv97/JlEBS11VpDSOz5jma6yNcQgccSQSN6DaZ/t1b8N7XkY
 oviuxUF5aW/D+s1yURv4skSjh66s9Ula80/tXFoHp5b8OKjY/Pm1ueQ6+JkDJ1zwRKwO
 zp7Lx5Cgiq+y0jL1ZcVIRT86O9BqODkAOQNB6Em0OpUeGPqOUXocJKBmYwpxTe/EDdlD
 jZqGZEAObvwQf5u8njG/xae37M+/E9+2G8xgHwfT2J/lTqQK6KsLhwjBkzsWFI5hTdOp
 0ruA==
X-Gm-Message-State: AOAM531k3AoxLBDimyzDwouquBHBKOoVoVNoiJHO15WLeaJgWOGPLPZ6
 GBhztFakgk4aIfCneTc/dUbGv1U3z+F1YhwBYwwSAOHc
X-Google-Smtp-Source: ABdhPJwb5tfPQcxAXgzsITx4XZUTsruBpQ3yy8t7sXvrXpQ2TsYsUKQMhZbknS5nZgr6BrsbqtJsP52X3CiLoO25nRk=
X-Received: by 2002:a5d:6992:: with SMTP id g18mr21179751wru.362.1605559882073; 
 Mon, 16 Nov 2020 12:51:22 -0800 (PST)
MIME-Version: 1.0
References: <20201116174112.1833368-1-lee.jones@linaro.org>
 <20201116174112.1833368-2-lee.jones@linaro.org>
In-Reply-To: <20201116174112.1833368-2-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Nov 2020 15:51:11 -0500
Message-ID: <CADnq5_Pf4oiEPBGvQZXVaoiFOjyrM8HcL9MXCe5xD5pOubd1jw@mail.gmail.com>
Subject: Re: [PATCH 01/42] drm/amd/amdgpu/atombios_encoders: Remove set but
 unused variable 'backlight_level'
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

T24gTW9uLCBOb3YgMTYsIDIwMjAgYXQgMTI6NDEgUE0gTGVlIEpvbmVzIDxsZWUuam9uZXNAbGlu
YXJvLm9yZz4gd3JvdGU6Cj4KPiBBbHNvIHJlbW92aW5nIHRoZSBjYWxsIHRvIGFtZGdwdV9hdG9t
Ymlvc19lbmNvZGVyX2dldF9iYWNrbGlnaHRfbGV2ZWxfZnJvbV9yZWcoKQo+IHNpbmNlLCBhY2Nv
cmRpbmcgdG8gQWxleCBEZXVjaGVyLCAiV2UgY2FsbCBpdCBhZ2FpbiBiZWxvdyBpbmRpcmVjdGx5
Ii4KPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMpOgo+
Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2F0b21iaW9zX2VuY29kZXJzLmM6IEluIGZ1
bmN0aW9uIOKAmGFtZGdwdV9hdG9tYmlvc19lbmNvZGVyX2luaXRfYmFja2xpZ2h04oCZOgo+ICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hdG9tYmlvc19lbmNvZGVycy5jOjE3NDo1OiB3YXJu
aW5nOiB2YXJpYWJsZSDigJhiYWNrbGlnaHRfbGV2ZWzigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1
bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KPgo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20+Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERh
bmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogTHViZW4gVHVpa292IDxsdWJlbi50
dWlrb3ZAYW1kLmNvbT4KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzog
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25l
cyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CgpBcHBsaWVkLiAgVGhhbmtzIQoKQWxleAoKPiAtLS0K
PiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYXRvbWJpb3NfZW5jb2RlcnMuYyB8IDMgLS0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2F0b21iaW9zX2VuY29kZXJzLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hdG9tYmlvc19lbmNvZGVycy5jCj4gaW5kZXggZmE4MTdlYmZmOTgwNC4u
NjEzNGVkOTY0MDI3OSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
dG9tYmlvc19lbmNvZGVycy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYXRv
bWJpb3NfZW5jb2RlcnMuYwo+IEBAIC0xNzEsNyArMTcxLDYgQEAgdm9pZCBhbWRncHVfYXRvbWJp
b3NfZW5jb2Rlcl9pbml0X2JhY2tsaWdodChzdHJ1Y3QgYW1kZ3B1X2VuY29kZXIgKmFtZGdwdV9l
bmNvZGUKPiAgICAgICAgIHN0cnVjdCBiYWNrbGlnaHRfcHJvcGVydGllcyBwcm9wczsKPiAgICAg
ICAgIHN0cnVjdCBhbWRncHVfYmFja2xpZ2h0X3ByaXZkYXRhICpwZGF0YTsKPiAgICAgICAgIHN0
cnVjdCBhbWRncHVfZW5jb2Rlcl9hdG9tX2RpZyAqZGlnOwo+IC0gICAgICAgdTggYmFja2xpZ2h0
X2xldmVsOwo+ICAgICAgICAgY2hhciBibF9uYW1lWzE2XTsKPgo+ICAgICAgICAgLyogTWFjIGxh
cHRvcHMgd2l0aCBtdWx0aXBsZSBHUFVzIHVzZSB0aGUgZ211eCBkcml2ZXIgZm9yIGJhY2tsaWdo
dAo+IEBAIC0yMDcsOCArMjA2LDYgQEAgdm9pZCBhbWRncHVfYXRvbWJpb3NfZW5jb2Rlcl9pbml0
X2JhY2tsaWdodChzdHJ1Y3QgYW1kZ3B1X2VuY29kZXIgKmFtZGdwdV9lbmNvZGUKPgo+ICAgICAg
ICAgcGRhdGEtPmVuY29kZXIgPSBhbWRncHVfZW5jb2RlcjsKPgo+IC0gICAgICAgYmFja2xpZ2h0
X2xldmVsID0gYW1kZ3B1X2F0b21iaW9zX2VuY29kZXJfZ2V0X2JhY2tsaWdodF9sZXZlbF9mcm9t
X3JlZyhhZGV2KTsKPiAtCj4gICAgICAgICBkaWcgPSBhbWRncHVfZW5jb2Rlci0+ZW5jX3ByaXY7
Cj4gICAgICAgICBkaWctPmJsX2RldiA9IGJkOwo+Cj4gLS0KPiAyLjI1LjEKPgo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxp
bmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
