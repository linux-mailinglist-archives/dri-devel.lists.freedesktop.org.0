Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD76CD0809
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 09:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 566D26E90B;
	Wed,  9 Oct 2019 07:13:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 592BD6E8B7
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 23:46:13 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id n197so840291iod.9
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2019 16:46:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=SPl3L4+4Zy9QlJN3K7IuqOc2JedlA0ldY7i+AP0Siqo=;
 b=aBcBHA9kChwcI+CcuD2AE6zFyjiAKK3mEKI/Kq5ESE0Q4JfMNteHo7D6SlSFSabjIG
 yb21ndGtOZQGCOm2QXCUbTxCikRkFW8nN2iD6jz772wpTKt0AlDyWgR7D6cYlx9PTCE4
 E23cULSAOaCeeO9QqOClc8ThNGEyVslXy0gysxInc61dGFWUiWueht9myy0qAJwhxuGz
 QdaAdZxLU8bvcJKiLR5JTk0OkrDImWEL7JywoCplwSdtAluGFKH9dC3JeZDaH2IcI1df
 7keNSPveKcT8NMAN5GoHAq70aZNx0bortVRN88jeRF4JoGHNltz0s+noFsfy7jxpNmEW
 1F4Q==
X-Gm-Message-State: APjAAAVIt9ezzkmAzCGPBqLrGaysZYwJTEXgTlZ0OTIVEG12SbCWzZi/
 Swlolk3DNMmvo2YPhI0hgoT9HA==
X-Google-Smtp-Source: APXvYqz97nlCIt/+/P4PPfxa3nO+CVIeqE66+NVgtpZhnKj/IpAG2fhUxvCWOIqX/CoRt6DSjpBBFw==
X-Received: by 2002:a92:d084:: with SMTP id h4mr287013ilh.223.1570578372595;
 Tue, 08 Oct 2019 16:46:12 -0700 (PDT)
Received: from localhost ([64.62.168.194])
 by smtp.gmail.com with ESMTPSA id m11sm250603ioq.5.2019.10.08.16.46.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 16:46:12 -0700 (PDT)
Date: Tue, 8 Oct 2019 16:46:06 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: pwm: Convert PWM bindings to
 json-schema
In-Reply-To: <20191002164047.14499-1-krzk@kernel.org>
Message-ID: <alpine.DEB.2.21.9999.1910081643220.11044@viisi.sifive.com>
References: <20191002164047.14499-1-krzk@kernel.org>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 09 Oct 2019 07:12:51 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=SPl3L4+4Zy9QlJN3K7IuqOc2JedlA0ldY7i+AP0Siqo=;
 b=I+N5hkvPCF8K1LY460NnH3Bs+ppv36e7pHAAko5cPGtVK7Q1xpMFtMk1sbwX3EL9Ae
 UX5ufwjfjE2WsQxxVvaJrkkGtrrD1A1swJroeZ6oWYFiFUD/gbGKkY6710T0F0X5S5Xo
 BF95rAFQKdDZy+9dBrgr05QKn2VguSytZtPaHPhpxauj1vAvK0o8UX1wBJzBZa1yl7EV
 jLHoqHF7Hse1l/Ohr1dGC6ATYWRzE6EftbRk42hoGB79bBRXmsmPeyS2gmRpO97jk05b
 X+CS58w6j5DGF3spjHV4AncNibrgaK8A9wTUdRqszmiSN3PwPwqQA/IsTfJ60gtOiuUB
 4Xrw==
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-tegra@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyIE9jdCAyMDE5LCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgoKPiBDb252ZXJ0
IGdlbmVyaWMgUFdNIGJpbmRpbmdzIHRvIERUIHNjaGVtYSBmb3JtYXQgdXNpbmcganNvbi1zY2hl
bWEuICBUaGUKPiBjb25zdW1lciBiaW5kaW5ncyBhcmUgc3BsaXQgdG8gc2VwYXJhdGUgZmlsZS4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+
Cj4gCj4gLS0tCj4gCgpbIC4uLiBdCgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcHdtL3B3bS1zaWZpdmUudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3B3bS9wd20tc2lmaXZlLnR4dAo+IGluZGV4IDM2NDQ3ZTNjOTM3OC4uM2Qx
ZGQ3YjA2ZWZjIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9wd20vcHdtLXNpZml2ZS50eHQKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcHdtL3B3bS1zaWZpdmUudHh0Cj4gQEAgLTE3LDcgKzE3LDcgQEAgUmVxdWlyZWQgcHJv
cGVydGllczoKPiAgICBQbGVhc2UgcmVmZXIgdG8gc2lmaXZlLWJsb2Nrcy1pcC12ZXJzaW9uaW5n
LnR4dCBmb3IgZGV0YWlscy4KPiAgLSByZWc6IHBoeXNpY2FsIGJhc2UgYWRkcmVzcyBhbmQgbGVu
Z3RoIG9mIHRoZSBjb250cm9sbGVyJ3MgcmVnaXN0ZXJzCj4gIC0gY2xvY2tzOiBTaG91bGQgY29u
dGFpbiBhIGNsb2NrIGlkZW50aWZpZXIgZm9yIHRoZSBQV00ncyBwYXJlbnQgY2xvY2suCj4gLS0g
I3B3bS1jZWxsczogU2hvdWxkIGJlIDMuIFNlZSBwd20udHh0IGluIHRoaXMgZGlyZWN0b3J5Cj4g
Ky0gI3B3bS1jZWxsczogU2hvdWxkIGJlIDMuIFNlZSBwd20ueWFtbCBpbiB0aGlzIGRpcmVjdG9y
eQo+ICAgIGZvciBhIGRlc2NyaXB0aW9uIG9mIHRoZSBjZWxsIGZvcm1hdC4KPiAgLSBpbnRlcnJ1
cHRzOiBvbmUgaW50ZXJydXB0IHBlciBQV00gY2hhbm5lbAoKRm9yIHRoZSBTaUZpdmUgUFdNIGRy
aXZlciBkb2N1bWVudGF0aW9uOgoKQWNrZWQtYnk6IFBhdWwgV2FsbXNsZXkgPHBhdWwud2FsbXNs
ZXlAc2lmaXZlLmNvbT4KCgotIFBhdWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
