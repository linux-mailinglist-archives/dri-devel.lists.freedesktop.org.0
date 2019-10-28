Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E69D0E7331
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 15:03:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C8246E891;
	Mon, 28 Oct 2019 14:03:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C67D6E891;
 Mon, 28 Oct 2019 14:03:09 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id g7so9588942wmk.4;
 Mon, 28 Oct 2019 07:03:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rJWcxYoQBw9FC5bU2SEpgmxglktki3/N2UJx+E1uoHc=;
 b=lxa9CVnAZ51jm46qoF6QJmVqDQbwfapCgOhRYqoj5Eci2nBq8BRCgd1xRNRP5hxp8L
 kW+q23iZMQdvVS2mY+smuXgPUwv+GWEC4cgKzFsJJ64oIgE5WhIJ12Ie8uB+vi/xj9xs
 HTMApdV3eQkiqMpjNn8SgmHQan2TEgjMfVnj/QJ6LnDBmP1OROAZNakJMDT9T8i8kyT4
 FZ1rnfwxMwNm0NnOL8+8DF/MP738g1NhoXUQH7JTocotWmRovSQ5RV3OacmvMy81q6jK
 Uzh8z+tsRCLV3hT7v3pPAUI/vM62WARqGL5K36FnjnF6isdbW6jeODqCzLqBAVo7xrJm
 rRNg==
X-Gm-Message-State: APjAAAUmEyf4/WCsEaloVUkhcELwNop/VJ75AbGwsRTim3idGYSMW+FR
 B9k882drd9jE5Ced1+Pob9vPyqdx/RG8CYs47A5FTQ==
X-Google-Smtp-Source: APXvYqzTcpDANF0xCHv5oY8VRV1/vSnNLjz/Lq4qlStLKG0XmYYPuKxqosYZHm6ZF4EgQwtb4EEs/MBIX4kXxxrE4I4=
X-Received: by 2002:a05:600c:24cb:: with SMTP id
 11mr99575wmu.141.1572271387834; 
 Mon, 28 Oct 2019 07:03:07 -0700 (PDT)
MIME-Version: 1.0
References: <20191028092005.31121-1-wambui.karugax@gmail.com>
In-Reply-To: <20191028092005.31121-1-wambui.karugax@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 28 Oct 2019 10:02:55 -0400
Message-ID: <CADnq5_P7spc_po3rCYCVHwqCRp4x1CX60yTX2CXQcYCt9FXDqg@mail.gmail.com>
Subject: Re: [Outreachy][PATCH 0/2] sparse warning cleanup
To: Wambui Karuga <wambui.karugax@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=rJWcxYoQBw9FC5bU2SEpgmxglktki3/N2UJx+E1uoHc=;
 b=DanefYv1nIEQfdUnfpue30LOoTxTvjUO5ceGUpcB0pjWXEVXGaoLDGqmzz1V/0GsbN
 4Aa1JZu7SxLgnmJDauSoR3WjisKMPOD/YjE5iZ7c6ZEOa8HMj5gtNPIQ/iM7xr/jhPmm
 3wTOXCVHpBZ0FG6f2Qo1g3R2fYzpI8Wy3hpsWoRJ0r+7NZ/wXB7NuNDa/fhqXjyG0AYU
 fdGyxvG6tb9xhM+ISjrWEepXeGS7MXlYw6qGlBExSPJfzXP0cyk4nlmnNMC3doTn5b7Z
 qGJJVt34VE/LK+gG95dBHx87hWDY5/UJdBZ2bh7Jqn5HjJLmav+IRJAEzP2I7vR8+8kn
 2jfg==
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
Cc: Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 outreachy-kernel@googlegroups.com,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjgsIDIwMTkgYXQgODo0NyBBTSBXYW1idWkgS2FydWdhIDx3YW1idWkua2Fy
dWdheEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gVGhpcyBwYXRjaHNldCBhZGRyZXNzZXMgdGhlIHNw
YXJzZSB3YXJuaW5nIGFib3V0IHRoZQo+IGBhbWRncHVfZXhwX2h3X3N1cHBvcnRgIHZhcmlhYmxl
IGFuZCBjb3JyZWN0cyB0aGUgbWlzcGVsbGluZyBvZiB0aGUKPiB3b3JkICJfTEVOVEgiLgo+Cj4g
V2FtYnVpIEthcnVnYSAoMik6Cj4gICBkcm0vYW1kOiBkZWNsYXJlIGFtZGdwdV9leHBfaHdfc3Vw
cG9ydCBpbiBhbWRncHUuaAo+ICAgZHJtL2FtZDogY29ycmVjdCAiX0xFTlRIIiBtaXNwZWxsaW5n
IGluIGNvbnN0YW50CgpBcHBsaWVkIHRoZSBzZXJpZXMuICBUaGFua3MhCgpBbGV4Cgo+Cj4gIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oICAgICAgICB8IDUgKysrLS0KPiAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIHwgNCArKy0tCj4gIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyAgICB8IDIgKy0KPiAgMyBmaWxlcyBj
aGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4KPiAtLQo+IDIuMTcuMQo+
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQt
Z2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
