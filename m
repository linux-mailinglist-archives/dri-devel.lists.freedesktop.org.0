Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E267C2AE3BC
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 23:53:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F38F789167;
	Tue, 10 Nov 2020 22:53:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5733D89167;
 Tue, 10 Nov 2020 22:53:49 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id b6so151575wrt.4;
 Tue, 10 Nov 2020 14:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vHZRYrwtaZgXO55je8F150N4Va6hou4CjPXMEe4tSEM=;
 b=GBPDmOWHHv3RXG9E2b2CYbLvP7IhPgpSFE+w9s3ACmwPVnDWsYdqZnNl2l4u2MP9W0
 8r2CKLSyJDO0QUNW3wzex8v8bEhv4ke5lgmlIXxoiOelHpdbgGYYEcbaQ37KYhQ2Nnrz
 qzpCYIudD7Hybhg9SazNN9/MSIhFCIlkkDyoWFCYnKj45w/NCHkY2WE9IlcH7ugB8exR
 FX8f6j3nhNCUZb5foaZVhPM94lgJbj0RBlfb8cZT6DXzxEPmnX4WGbY1xG4Lq8yaNtL/
 VmU1sW4gP3owP25/QMkojQdQGYkJf/0iv2KDXhERh3aOS4xye6LCdUR5bgmqjnkgJjN8
 5sQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vHZRYrwtaZgXO55je8F150N4Va6hou4CjPXMEe4tSEM=;
 b=FpaiUE8UsxzeIztLRFdSfoeEOkHwLFd0v0OynJ1kcVaBVA0hPMfuibByhoxyqCFRay
 dsi8VmkZadF5tvvdufIbXZd25bB8SGm32t2ZiUpFIdaVl2bHjoEM2hXduWYos6rdT4iR
 rujl4kLBoanohgQJ6dt97FzJ7hy6PRV6ggQT1eU+kovcZBZFiK11dp5IMqWcaTo2k9W7
 sEe9yIVMAmv2/Wpb7b8FAsNYcjGhX/NcrdmP1HIuCqkqih04s+RKMLfDAthHxPUd5D5v
 omV7xHTrO4xTpKdJoLGXDjpQZYiDKz0t4JSnPqX4VkvHdVho2TsjFu8Iee4lteOGXj6f
 w67Q==
X-Gm-Message-State: AOAM530stAe2MbZnRhqSkiF5JYRE/UMFS4HEkV233VTgxJQPA7RRlpzD
 hUZ8SagA6aalY2cXxW3PLWnTubSoNJ6rTrF9Xvg=
X-Google-Smtp-Source: ABdhPJzUi4ke0o2ZA8AV2zpXRBJnOJhPrZQ1Pb3T/Bju7hubif2LD9LSu1ApFM3CX/M+pdhfqmKdniM/fdysTKx9G5w=
X-Received: by 2002:adf:e9c9:: with SMTP id l9mr27942155wrn.124.1605048828034; 
 Tue, 10 Nov 2020 14:53:48 -0800 (PST)
MIME-Version: 1.0
References: <20201110193112.988999-1-lee.jones@linaro.org>
 <20201110193112.988999-5-lee.jones@linaro.org>
In-Reply-To: <20201110193112.988999-5-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 10 Nov 2020 17:53:36 -0500
Message-ID: <CADnq5_NPS1-+jA=AUVY1g9Wm--pvmB=QUoCUTce4S_uwEziGDQ@mail.gmail.com>
Subject: Re: [PATCH 04/30] drm/radeon/si: Remove set but unused variable
 'mc_shared_chmap'
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
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTAsIDIwMjAgYXQgMjozMSBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vc2kuYzogSW4gZnVuY3Rpb24g
4oCYc2lfZ3B1X2luaXTigJk6Cj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vc2kuYzozMDkwOjY6
IHdhcm5pbmc6IHZhcmlhYmxlIOKAmG1jX3NoYXJlZF9jaG1hcOKAmSBzZXQgYnV0IG5vdCB1c2Vk
IFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQo+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFu
ZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4u
a29lbmlnQGFtZC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBD
YzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gU2ln
bmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCkFwcGxpZWQuICBU
aGFua3MhCgpBbGV4Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3NpLmMgfCA0ICsr
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3NpLmMgYi9kcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL3NpLmMKPiBpbmRleCBjMjdhZjg5Nzg1ZjM0Li40NTA3NmMyN2Q3ZGVkIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vc2kuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9yYWRlb24vc2kuYwo+IEBAIC0zMDg4LDcgKzMwODgsNyBAQCBzdGF0aWMgdm9pZCBzaV9z
ZXR1cF9yYihzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldiwKPiAgc3RhdGljIHZvaWQgc2lfZ3B1
X2luaXQoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpCj4gIHsKPiAgICAgICAgIHUzMiBnYl9h
ZGRyX2NvbmZpZyA9IDA7Cj4gLSAgICAgICB1MzIgbWNfc2hhcmVkX2NobWFwLCBtY19hcmJfcmFt
Y2ZnOwo+ICsgICAgICAgdTMyIG1jX2FyYl9yYW1jZmc7Cj4gICAgICAgICB1MzIgc3hfZGVidWdf
MTsKPiAgICAgICAgIHUzMiBoZHBfaG9zdF9wYXRoX2NudGw7Cj4gICAgICAgICB1MzIgdG1wOwo+
IEBAIC0zMjAwLDcgKzMyMDAsNyBAQCBzdGF0aWMgdm9pZCBzaV9ncHVfaW5pdChzdHJ1Y3QgcmFk
ZW9uX2RldmljZSAqcmRldikKPgo+ICAgICAgICAgV1JFRzMyKEJJRl9GQl9FTiwgRkJfUkVBRF9F
TiB8IEZCX1dSSVRFX0VOKTsKPgo+IC0gICAgICAgbWNfc2hhcmVkX2NobWFwID0gUlJFRzMyKE1D
X1NIQVJFRF9DSE1BUCk7Cj4gKyAgICAgICBSUkVHMzIoTUNfU0hBUkVEX0NITUFQKTsKPiAgICAg
ICAgIG1jX2FyYl9yYW1jZmcgPSBSUkVHMzIoTUNfQVJCX1JBTUNGRyk7Cj4KPiAgICAgICAgIHJk
ZXYtPmNvbmZpZy5zaS5udW1fdGlsZV9waXBlcyA9IHJkZXYtPmNvbmZpZy5zaS5tYXhfdGlsZV9w
aXBlczsKPiAtLQo+IDIuMjUuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
