Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3AC816CE
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 12:18:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FAFF6E3E1;
	Mon,  5 Aug 2019 10:18:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 725A66E3E1
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 10:18:20 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id h10so7363538ljg.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 03:18:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+OidWRK0NxQrN09q+H0Lz4wCrhTqBVNanJIQIVy/gII=;
 b=pPJ+Wj2KD06YRvOSqWoaRu1O3ZfFnKj/jMJveGSlG8F9RjCplxLWdsdGkloZAqevvt
 e4KPwzRP7VqmYT0UrAKOQv5MQwEsp8QLH5ca2nQ1LoL89QylCW4EgVlxD2dWBG89+TYv
 SfYRa471G4K34zwqye72VxfXEQGN8yIeViaQfXG4/XE3e16N6Pr5AEXmC+gcZhqHlfF8
 zr9WaKVCuC9bC9FKADVfNWYoeHIDsp2YaKnyEMbbvh5H4UwhnyvZ8RtMg8F96cerSMdD
 3inwLNbsjn/6ETuF4lnuaU4V/b42jUnv+9EX2D+QUf23Hylt6dsvNK5ACp4UcPQwq/go
 ilRg==
X-Gm-Message-State: APjAAAVQtOofDdlzX4k/AclgcvRlv1jMU/AxU8YXuL8w7E0PZpov82/U
 ldpjYz0djA7r1jqdg8xXfvVgIPt2W5ofl5+4CcoJBQ==
X-Google-Smtp-Source: APXvYqx/47plwVQoKfOxPFRbz9uFPNTC89i2gTxTm/2vOWF4WlpGegp3L3NCwltCpv/ud4yUTO+QjSZAiKhvzrIe6xY=
X-Received: by 2002:a2e:8756:: with SMTP id q22mr79254317ljj.108.1565000298784; 
 Mon, 05 Aug 2019 03:18:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190725145040.42182-1-kevin.brodsky@arm.com>
 <042d5c3d-96fe-5466-3869-a0a3a08b964d@arm.com>
In-Reply-To: <042d5c3d-96fe-5466-3869-a0a3a08b964d@arm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 5 Aug 2019 12:18:06 +0200
Message-ID: <CACRpkdbPhxW2-vDhPDz-KpD-AxPJL+Px_ZH8cWVVbCiYpJh3PA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: fast models: Increase clcd's
 max-memory-bandwidth
To: Robin Murphy <robin.murphy@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=+OidWRK0NxQrN09q+H0Lz4wCrhTqBVNanJIQIVy/gII=;
 b=lg9VOKzw2db4frYUxtdqEfbgWkOvq9p9FMJSWhGilAgUkM1A/cuExt3oECmeK5QKT6
 t5Uh1vcuMjWQDCEH2XWwYYrGgnCaHakuBuPZr7IZ74XtRBQZ4mTkhnafC8TgX/okuR+l
 ERsy1o8RzDxio5fauDNDhsZ3/Hs5I7gbIqZtIl8P3LOKWCPB7LonUWnBG487BvJqoIEv
 Wtphcmcr/28nxzQPeSvW1GzZogMY4wfQNOdqOLIb5SA6T1UvLt29Guy+svKOhPj0y/j/
 kT+jMS7sypmnQsa64XAOBnEmpKpk0FcEROskM39/RUXBRHfCnWVd7Ys0NGGZZecRgpcF
 N7hw==
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Ruben Ayrapetyan <ruben.ayrapetyan@arm.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgNToxNSBQTSBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBo
eUBhcm0uY29tPiB3cm90ZToKCj4gR2l2ZW4gdGhhdCB0aGUgcHJvcGVydHkgaXMgb3B0aW9uYWwg
YW55d2F5LCB3b3VsZCBpdCBodXJ0IHRvIGp1c3QgcmVtb3ZlCj4gaXQ/IEFmdGVyIHRyeWluZyB0
byBkaWcgdXAgYW55IHJlbGV2YW50IGludGVybmFsIGVtYWlsIGhpc3RvcnksIGl0J3MKPiBzdGls
bCBmYXIgZnJvbSBjbGVhciBob3cgYW5kIHdoeSBpdCBnb3QgaGVyZSBpbiB0aGUgZmlyc3QgcGxh
Y2UuCgpJc24ndCBpdCBqdXN0IG15IHNsb3BweSBjb3B5LXBhc3RlIHdoZW4gZml4aW5nIHVwIHRo
ZSBkZXZpY2UgdHJlZXMKZm9yIHRoZSBEUk0gdHJhbnNpdGlvbj8gSSBhZ3JlZSBpdCBzaG91bGQg
anVzdCBiZSByZW1vdmVkLgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
