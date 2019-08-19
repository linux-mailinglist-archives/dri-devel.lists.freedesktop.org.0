Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFCB92450
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 15:09:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DE658984D;
	Mon, 19 Aug 2019 13:08:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E359B8984D;
 Mon, 19 Aug 2019 13:08:57 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id c3so8672942wrd.7;
 Mon, 19 Aug 2019 06:08:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OGliP8V2z6rC/V1TsVyjYxuHbh1FvlQGrbLjX5U0g6k=;
 b=nMU5TO+oymyJyMAkI9Dywvr6gnvcl96BrAfTqecF2bMumkB+BGO1zX9vSn6nIxac9h
 88HXRgq7LsBxEBf8pbBcAWtbbq7CQukihFk24rosf6WX4KfnOAFtTUQCgW8sKbGHO6LW
 vzGrjqZXyEKxuLxoZgojLjBLQqe9TyyKaUH2IOQc58snLjYF11gw9Dyxx0QPqjOiLmKt
 JMAValViP69U9fBI+W03dfkyg1QYsWkwmkYJS+Yt+TFlNp9k/hh8mnbhY531RdbzHo8l
 ncQG9eLno3O+wh4jyToiRGK7ppPf/7/ZdE+yGXMS6u0b+3yI+u4QAjXYqkuxNzCmPfwH
 JeFA==
X-Gm-Message-State: APjAAAXAM7QtU2o188CQVuoglfGN3dhAqe7TfN/HOoz/FXXBNINtESVf
 jwOr9Z4hsp8lumo+5Gx5pOXvdKMnDfwHz1E6GL08nw==
X-Google-Smtp-Source: APXvYqxFSg4vpkwnhd00k4l84C3iqI7jsMOwWo+lWFFN0MS3qJnjl+Yqpb3iE0iyIZnBjSU3HlJVqVktWbyqpmkA9dc=
X-Received: by 2002:a5d:4f91:: with SMTP id d17mr27204432wru.74.1566220136401; 
 Mon, 19 Aug 2019 06:08:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190818155957.4029-1-christophe.jaillet@wanadoo.fr>
 <81BEC287-3D11-4B5B-BF32-3E29F3266453@amd.com>
In-Reply-To: <81BEC287-3D11-4B5B-BF32-3E29F3266453@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 19 Aug 2019 09:08:43 -0400
Message-ID: <CADnq5_OsELJss5pyMmcHJnvVr7FpA0COJE+SmxM7ZQpfvQShYA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix a typo in the include header guard of
 'navi12_ip_offset.h'
To: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=OGliP8V2z6rC/V1TsVyjYxuHbh1FvlQGrbLjX5U0g6k=;
 b=CIEJfur6EE/6ApcjOj//kF9mng1Plat1WW4UOQ/jeuioUW7VWIhgTGG3tFljranNVq
 e/ee7r807xMJEDBbhncTsUKaIHKqb1TOqEZE6AQlY8Gb8lXePAm0itY0OGNjaZPWdB10
 Ygf8giytV3aRNviemmPVFs9sE1ilDJO4Jhwu197NMMDZIKFE829o6n1FJwSXkKaHvNzO
 vNFGEhzjgEyG/mjfFr5vxuF5/5rpH0He2h32zE3dfYEV4GruniiHDirlOTW/ZwMV2ByR
 MOVDlycNVCTkOCsMnGoDi4qLQIsL/pNtM8doYkQ82XUKxcsui49zWsH4npMsvYURyj73
 9kAw==
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIHRoYW5rcyEKCkFsZXgKCk9uIFN1biwgQXVnIDE4LCAyMDE5IGF0IDk6MzMgUE0g
WXVhbiwgWGlhb2ppZSA8WGlhb2ppZS5ZdWFuQGFtZC5jb20+IHdyb3RlOgo+Cj4gUmV2aWV3ZWQt
Ynk6IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+Cj4KPiBYaWFvamllCj4KPiA+
IE9uIEF1ZyAxOSwgMjAxOSwgYXQgMTI6MDAgQU0sIENocmlzdG9waGUgSkFJTExFVCA8Y2hyaXN0
b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI+IHdyb3RlOgo+ID4KPiA+ICdfbmF2aTEwX2lwX29mZnNl
dF9IRUFERVInIGlzIGFscmVhZHkgdXNlZCBpbiAnbmF2aTEwX2lwX29mZnNldC5oJywgc28gdXNl
Cj4gPiAnX25hdmkxMl9pcF9vZmZzZXRfSEVBREVSJyBpbnN0ZWFkIGhlcmUuCj4gPgo+ID4gU2ln
bmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBKQUlMTEVUIDxjaHJpc3RvcGhlLmphaWxsZXRAd2FuYWRv
by5mcj4KPiA+IC0tLQo+ID4gZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL25hdmkxMl9pcF9v
ZmZzZXQuaCB8IDQgKystLQo+ID4gMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNs
dWRlL25hdmkxMl9pcF9vZmZzZXQuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9uYXZp
MTJfaXBfb2Zmc2V0LmgKPiA+IGluZGV4IDIyOWU4ZmRkZmNjMS4uNmMyY2M2Mjk2YzA2IDEwMDY0
NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL25hdmkxMl9pcF9vZmZzZXQu
aAo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL25hdmkxMl9pcF9vZmZzZXQu
aAo+ID4gQEAgLTE4LDggKzE4LDggQEAKPiA+ICAqIEFOIEFDVElPTiBPRiBDT05UUkFDVCwgVE9S
VCBPUiBPVEhFUldJU0UsIEFSSVNJTkcgRlJPTSwgT1VUIE9GIE9SIElOCj4gPiAgKiBDT05ORUNU
SU9OIFdJVEggVEhFIFNPRlRXQVJFIE9SIFRIRSBVU0UgT1IgT1RIRVIgREVBTElOR1MgSU4gVEhF
IFNPRlRXQVJFLgo+ID4gICovCj4gPiAtI2lmbmRlZiBfbmF2aTEwX2lwX29mZnNldF9IRUFERVIK
PiA+IC0jZGVmaW5lIF9uYXZpMTBfaXBfb2Zmc2V0X0hFQURFUgo+ID4gKyNpZm5kZWYgX25hdmkx
Ml9pcF9vZmZzZXRfSEVBREVSCj4gPiArI2RlZmluZSBfbmF2aTEyX2lwX29mZnNldF9IRUFERVIK
PiA+Cj4gPiAjZGVmaW5lIE1BWF9JTlNUQU5DRSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIDcKPiA+ICNkZWZpbmUgTUFYX1NFR01FTlQgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgNQo+ID4gLS0KPiA+IDIuMjAuMQo+ID4KPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
