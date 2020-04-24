Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CF01B8059
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 22:16:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 644A66EB3D;
	Fri, 24 Apr 2020 20:16:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D88D86EB86;
 Fri, 24 Apr 2020 20:16:34 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id k13so12534626wrw.7;
 Fri, 24 Apr 2020 13:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=s2Kqcd847642kR70JpEfV+P8d3XYHEMIIpz5tgu/YCI=;
 b=o6UCsamzx09ft7cbYz5b/vP6s1unQr8As1dEWNnIpLlOb0YnHzbEjwZuNijpmtuS5S
 yh0Opu3rFREorI9oYM7kEw5YSzqeCSVJaKAfNz6a0l68tDZPFAh5S/rMxo8+MWujW/0V
 1csafg+gkSFwQLluOZMR3zXhMRAySX6+JFnefhb1vcoi6iRVZ+DTTz/8+0qwZzhySMik
 CpgXXLY16uIHCxd62tdURrZAcknbgTL2odARhPap021Zf8SuYzi6PRpiW1LUg9E8TYUk
 04pHQqDIjD00wndkEFvh9ZduQ37ThH9pDp3NIx5bhMsQMvy8M7BiK/DNHp4tAl3BszZM
 XNeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=s2Kqcd847642kR70JpEfV+P8d3XYHEMIIpz5tgu/YCI=;
 b=g5fvlW3mz9ZpHCSnemL6yhCoe6zLofxtFdzOgTbfYfkAexne8SSS1MUUboUIjDBn2j
 Z4mmhqF7Oi6tqXhpV4EJocwMj1Dn4BxjV7YaGybidS27Xr5OnbY5hp5FHOCdICgylyZh
 QpMPSxG2kMoQns7a3L9SK8Jhi0xS1XKr7jjKL0lGicNxmZlUHgsV2l5r9yPTX9SI26kP
 0IUwjkuSq3dihuIXjnbA80xL/cToYcSCG7cIVSjxM5/PZyqCmE+qarN/Kz4473HcHN9e
 1uWhl1JFjCnJ8oRN0LNj1J3btY3UsnOQjKMmX+6Z1azU1caF3TmcPPRtWUZ6GP/QIJIL
 PyUA==
X-Gm-Message-State: AGi0PuZQ7zX1751Jxj38C6B0a4BrXXTchDDTlc4nL7F6hZo39u83H3oS
 jK98Pm0dJqU5TFuRB+Ud9jxxkSgN9JjsFj6Vlcs=
X-Google-Smtp-Source: APiQypKd9+AHmK/fDx+LGJLOZOAyeNpYq05LFze2JpMkv+P2DLetcDU9gQomu7057aUNA0WoC5Hlm8wr3Z5R9ajrR2s=
X-Received: by 2002:adf:f844:: with SMTP id d4mr12853029wrq.362.1587759393501; 
 Fri, 24 Apr 2020 13:16:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200424075620.22364-1-zhengbin13@huawei.com>
 <2ebe7c66-0562-b61d-bf36-278a52590ce7@amd.com>
In-Reply-To: <2ebe7c66-0562-b61d-bf36-278a52590ce7@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 24 Apr 2020 16:16:21 -0400
Message-ID: <CADnq5_O+jpdSwBB47zdepqG=wJQWWYbBH1DnyPDFBa96H8kkGw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Remove unneeded semicolon
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
Cc: Dave Airlie <airlied@linux.ie>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Zheng Bin <zhengbin13@huawei.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCk9uIEZyaSwgQXByIDI0LCAyMDIwIGF0IDM6NTYgQU0g
Q2hyaXN0aWFuIEvDtm5pZwo8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IEFt
IDI0LjA0LjIwIHVtIDA5OjU2IHNjaHJpZWIgWmhlbmcgQmluOgo+ID4gRml4ZXMgY29jY2ljaGVj
ayB3YXJuaW5nOgo+ID4KPiA+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmM6
MjUzNDoyLTM6IFVubmVlZGVkIHNlbWljb2xvbgo+ID4KPiA+IFJlcG9ydGVkLWJ5OiBIdWxrIFJv
Ym90IDxodWxrY2lAaHVhd2VpLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IFpoZW5nIEJpbiA8emhl
bmdiaW4xM0BodWF3ZWkuY29tPgo+Cj4gUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dmeF92OV8wLmMgfCAyICstCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4
X3Y5XzAuYwo+ID4gaW5kZXggMDlhYTVmNTA5YmQyLi40M2Q4NDIxNDk5NWMgMTAwNjQ0Cj4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jCj4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jCj4gPiBAQCAtMjUzMSw3ICsyNTMxLDcg
QEAgc3RhdGljIHZvaWQgZ2Z4X3Y5XzBfaW5pdF9zcV9jb25maWcoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYpCj4gPiAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gICAgICAgZGVmYXVsdDoKPiA+
ICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiAtICAgICB9Owo+ID4gKyAgICAgfQo+ID4gICB9Cj4g
Pgo+ID4gICBzdGF0aWMgdm9pZCBnZnhfdjlfMF9jb25zdGFudHNfaW5pdChzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldikKPiA+IC0tCj4gPiAyLjI2LjAuMTA2Lmc5ZmFkZWRkCj4gPgo+Cj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1h
aWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
