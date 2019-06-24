Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC50D51BE8
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 22:03:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50BB789DBD;
	Mon, 24 Jun 2019 20:03:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF97B89DBD
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 20:03:52 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id j6so3749635ioa.5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 13:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MODC0ogg5YjkQPNkOGskIKtf6/ZXAORt86to46yuFlo=;
 b=LXZOXbve3Y06TuNxS0r48aWKhyzy7n5DJSazFvIm67THXkbbNXURvgHoi/cvv6b/1p
 c5rueGpyy/NdqHj6Z2dCzFpJV0dao5hM5LbYzW1eEA4aCbXVVMsuHn3pBd0w2pvP8u6/
 dZln/S4lLe2QAFOCBl8zqYOGNFeJqroAIotktyDOlJRd0MBCSGarXkY0WlANApNclNnQ
 FJphVqL2i2nuJNkBeApZpXGvv5E1LluNDVUS18bEEBu+4QFb2Hr4t/BAK1HmjhMgg6Ts
 7R3MoCSLdmqyV/rPMRdLcQGQ6JX1xc+jyvUt3+xJ18sHNqVy6RjvXDhygJkFrAkcrjDZ
 BjUA==
X-Gm-Message-State: APjAAAV78bQjioC2Ogj3WHWNpIXA6y0DHELVjwGbGTphb6JI9LRzTYaR
 IiB63a4H1yWdbWm1bBdFQYNDXJhkSbM=
X-Google-Smtp-Source: APXvYqxaVwdIv6a/EMxGTLrwwI7iytfWDWdkse/M3s7V62lvfoLkN/NJLtzxctywvy0+A9VWcTrx/w==
X-Received: by 2002:a02:c90d:: with SMTP id t13mr107531373jao.62.1561406631786; 
 Mon, 24 Jun 2019 13:03:51 -0700 (PDT)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com.
 [209.85.166.46])
 by smtp.gmail.com with ESMTPSA id p9sm10885700ioj.49.2019.06.24.13.03.49
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Jun 2019 13:03:50 -0700 (PDT)
Received: by mail-io1-f46.google.com with SMTP id w25so4363659ioc.8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 13:03:49 -0700 (PDT)
X-Received: by 2002:a02:a48f:: with SMTP id d15mr14797429jam.12.1561406629525; 
 Mon, 24 Jun 2019 13:03:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190621211346.1324-1-ezequiel@collabora.com>
 <20190621211346.1324-4-ezequiel@collabora.com>
In-Reply-To: <20190621211346.1324-4-ezequiel@collabora.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Jun 2019 13:03:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UDswMa9X2QxRX9gRnY9=Y2ELMNOZvGZCz4g6fi2c6oEg@mail.gmail.com>
Message-ID: <CAD=FV=UDswMa9X2QxRX9gRnY9=Y2ELMNOZvGZCz4g6fi2c6oEg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: rockchip: Add RK3288 VOP gamma LUT
 address
To: Ezequiel Garcia <ezequiel@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=MODC0ogg5YjkQPNkOGskIKtf6/ZXAORt86to46yuFlo=;
 b=mDON5sJTCH+vmc//kOAbSHoxD8EtwXQ6+vuQPeBBhNsMTrLo/I/oEiAaPrFWCRuY6s
 ucBjK3P6JnSVNSVjGZ++u+kSgkjIOYZt2ClKfKnxD5GySnrg+Otjy1+pkblkmRhJR9UM
 OpsEFGn9pSmHlkpUUiqT+l1a9UmKWbf8YDGRk=
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
 Jacopo Mondi <jacopo@jmondi.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sean Paul <seanpaul@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 kernel@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBGcmksIEp1biAyMSwgMjAxOSBhdCAyOjE0IFBNIEV6ZXF1aWVsIEdhcmNpYSA8ZXpl
cXVpZWxAY29sbGFib3JhLmNvbT4gd3JvdGU6Cj4KPiBSSzMyODggU29DIFZPUHMgaGF2ZSBvcHRp
b25hbCBzdXBwb3J0IEdhbW1hIExVVCBzZXR0aW5nLAo+IHdoaWNoIHJlcXVpcmVzIHNwZWNpZnlp
bmcgdGhlIEdhbW1hIExVVCBhZGRyZXNzIGluIHRoZSBkZXZpY2V0cmVlLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogRXplcXVpZWwgR2FyY2lhIDxlemVxdWllbEBjb2xsYWJvcmEuY29tPgo+IC0tLQo+IENo
YW5nZXMgZnJvbSB2MToKPiAqIERyb3AgcmVnLW5hbWVzLCBhcyBzdWdnZXN0ZWQgYnkgRG91Zy4K
PiAtLS0KPiAgYXJjaC9hcm0vYm9vdC9kdHMvcmszMjg4LmR0c2kgfCA0ICsrLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKClJldmlld2VkLWJ5OiBE
b3VnbGFzIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
