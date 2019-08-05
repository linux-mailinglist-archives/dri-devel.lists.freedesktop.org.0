Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDE081714
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 12:31:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1453789CF4;
	Mon,  5 Aug 2019 10:31:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1BAA89CF4
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 10:31:44 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id 62so52650735lfa.8
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 03:31:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QIxUu482SI86vzot/QN+xZjKGKC7jZ1rFOV/82PfOvU=;
 b=EnIG+3G5sqsYO8oyYbjcwLNVExT699uJJ+vswo3GHc9jrHxyGq2VrfCuprBMjRemYx
 7zRs1EhHSxpVVfxup4gVpEQYyaVdeF6yJm7Jkkchjwkd+cCCaTj57rXYhERs/Z4vxxfb
 TqMSQFoaA25r2pYiXLyTSXyeafPe7JtprZiSSTkmzo7VYmXdNne+97TTLLJ2CHoFwHK1
 JUfmu38oOEkWvU2LTefcQ9dDg67Me6TTmNDNZHlKtHhTL3JOLcuTkQeD0C6K/rH6yCEr
 JVAl6umognfQVremEl8vsXl9mPe/b0duG0doMpHYYG/7SDjZ0PMJWbDJheeM5Ya6dVXQ
 LpuA==
X-Gm-Message-State: APjAAAW/FOxc8AMmwprUREm4eqcu2W6Ziz0cbOYoSPyTi2RldRX80q6E
 Io9mdQZpHnPi2LmRmXoHaO9d3ezFYnY3nWeMc8JjrQ==
X-Google-Smtp-Source: APXvYqzBOWNVd1+52WtBi9/+FuY34GhQwqLRgK9LSZD46rL9njP5XApHacVaGRV8/GwflRuY5XOjDwAMzTa4xJoC/nk=
X-Received: by 2002:ac2:5382:: with SMTP id g2mr68813972lfh.92.1565001103102; 
 Mon, 05 Aug 2019 03:31:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190725171215.71801-1-kevin.brodsky@arm.com>
In-Reply-To: <20190725171215.71801-1-kevin.brodsky@arm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 5 Aug 2019 12:31:32 +0200
Message-ID: <CACRpkdZi6tWVf-1g7JwQpQnEa+XUSfe_Xj6xf1sQwMDRQrpGhg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: fast models: Remove clcd's
 max-memory-bandwidth
To: Kevin Brodsky <kevin.brodsky@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=QIxUu482SI86vzot/QN+xZjKGKC7jZ1rFOV/82PfOvU=;
 b=J21D8PJcDAkvaKPpk4Orak40bhKxj0N223xJYOdMnVxHVIyYH2WxocRPwL2B4xbyjl
 ozRuzjBnmFMdsd3GEi/UrVdP/8Fbt8nI0f03ZT37amTuGrXNHv8ytg3GUoOKXKn84x7K
 bLuTkZZiug9vyAdw9davx5ub5XLbNEAb+XzUXgtA5pcinsyZqbtX+uW5e4QdPhFusCGE
 7iPwGZkbYNo0RQBXf7WM2Sms4yUtpPv1CUUibQdDzJsfpSWblSHmb2S56cmcPqFm/2yl
 tUnDFWGAyLNRmutykxC3Hm6oijz8nxNR9kOFmg4SCfNHp2gtAFLgtuMlZTLq9Yw8kWsN
 PTmw==
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
 Ruben Ayrapetyan <ruben.ayrapetyan@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Sudeep Holla <sudeep.holla@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgNzoxMiBQTSBLZXZpbiBCcm9kc2t5IDxrZXZpbi5icm9k
c2t5QGFybS5jb20+IHdyb3RlOgoKPiBJdCBpcyB1bmNsZWFyIHdoeSBtYXgtbWVtb3J5LWJhbmR3
aWR0aCBzaG91bGQgYmUgc2V0IGZvciBDTENEIG9uIHRoZQo+IGZhc3QgbW9kZWwuIFJlbW92aW5n
IHRoYXQgcHJvcGVydHkgYWxsb3dzIGFsbG9jYXRpbmcgYW5kIHVzaW5nIDMyYnBwCj4gYnVmZmVy
cywgd2hpY2ggbWF5IGJlIGRlc2lyYWJsZSBvbiBjZXJ0YWluIHBsYXRmb3JtcyBzdWNoIGFzCj4g
QW5kcm9pZC4KPgo+IFJlcG9ydGVkLWJ5OiBSdWJlbiBBeXJhcGV0eWFuIDxydWJlbi5heXJhcGV0
eWFuQGFybS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogS2V2aW4gQnJvZHNreSA8a2V2aW4uYnJvZHNr
eUBhcm0uY29tPgoKUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGlu
YXJvLm9yZz4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
