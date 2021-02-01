Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DC530B9B8
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 09:27:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7497F6E910;
	Tue,  2 Feb 2021 08:27:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED4189F27
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 13:32:16 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id p20so5019936ejb.6
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Feb 2021 05:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SUydFo1Yzotx0dJ4Xcz97tLTNFlDu1WGwY4qJbgVXXs=;
 b=wyZ43vex9y/L7OURr8uGRzyf57+Hup9CBw9Buo9eC58gaE+WeIPEb8PIF+gCg4cBUg
 r78c01pYMF0J7ZOMvwczmTMXNZnrOvPD0e0SV8BiV0Dg7uhQfcGZGTAHgVU6+sskAZO/
 ikQcHNpiGu6VBuLaF7yq5FJ4EoZv15y1u8NUviPrB/y1fFA/NYF0uNhyCwL899lwXaMo
 VgpNBoYI89Vu1tSmFKjjleUukqquoe0NwbzMKpaAir7v4g4FmvZBuvqnC2SwWbtgWnvs
 DCw8A8vlAGs1yzOtfKV/bR1p3YyW84iZKBCqrxtImm1S8lWJxgFaIq6zKsA9qncl/4QN
 aO5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SUydFo1Yzotx0dJ4Xcz97tLTNFlDu1WGwY4qJbgVXXs=;
 b=f10Q6B87wflBF19j/UG4JMByyVOuRt5U7GSkjXs6mHh10aDWnwpBZq63saUn7WJ45+
 umiY/NFJZrKJgLh0+u5QdtwLQ+kiGEzBk/FtNmFdwwjHcSa9XVX9qLG2v+apcOMMT34/
 POoRhcK6U3QcKvr9PHfEGJhWAdtBCuQVMjy3+4ChJKCt3KI0P/hyiupv0/h4LzxDw6a4
 iyGooUvrsxdTCC/t7kQBqybdn0KRD6/AHgOEa5hVJMjuLs1xzWJiozkwOWeLhCFttBOc
 oHxqbzjer6QSHA2yQ6io2wFBscUSF8sVzsGBqkm4Nvw3UX+wcemcGdnCG7oeGDIxe1X4
 FOVw==
X-Gm-Message-State: AOAM531k9J1fNiE/+ud3RWcz+7Msdc5TgPFghV72Myb+ufqU+8BekiUK
 lJjYEMW0T98U2TV+ZHj8ed3gBepTCcEsBKEgjaEJ8Q==
X-Google-Smtp-Source: ABdhPJzYtumr5qMj0oJ66hU20VJCP1zC7FFpU6A9O7Lh32/0bXXjdYDXapxt84S31R/HCRbQM+NowZkWGOah6C3gA8k=
X-Received: by 2002:a17:906:86cf:: with SMTP id
 j15mr17990890ejy.216.1612186334684; 
 Mon, 01 Feb 2021 05:32:14 -0800 (PST)
MIME-Version: 1.0
References: <20210119044157.3801598-1-jun.nie@linaro.org>
In-Reply-To: <20210119044157.3801598-1-jun.nie@linaro.org>
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 1 Feb 2021 21:32:03 +0800
Message-ID: <CABymUCMX1=w7xWu1NBdtTMzT=2prNEFuVeUn2zONjsC3-ZOAsw@mail.gmail.com>
Subject: Re: [PATCH] drm: bridge: adv7511: Add set_jack handler
To: a.hajda@samsung.com, John Stultz <john.stultz@linaro.org>
X-Mailman-Approved-At: Tue, 02 Feb 2021 08:27:00 +0000
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
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 airlied@linux.ie, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 bogdan.togorean@analog.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SnVuIE5pZSA8anVuLm5pZUBsaW5hcm8ub3JnPiDkuo4yMDIx5bm0MeaciDE55pel5ZGo5LqMIOS4
i+WNiDEyOjQy5YaZ6YGT77yaCj4KPiBXaXRoIGNvbW1pdCA1NWM1Y2M2M2FiLCB0aGUgaGRtaV9j
b2RlY19zZXRfamFjaygpIHdpbGwgcmVwb3J0IHVuc3VwcG9ydAo+IGZhaWx1cmUgaWYgc2V0X2ph
Y2sgaGFuZGxlciBpcyBtaXNzaW5nLiBBZGQgc2V0X2phY2sgaGFuZGxlciB0byByZXNvbHZlCj4g
dGhpcyBmYWlsdXJlLgo+Cj4gU2lnbmVkLW9mZi1ieTogSnVuIE5pZSA8anVuLm5pZUBsaW5hcm8u
b3JnPgo+IC0tLQo+ICAuLi4vZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExX2F1ZGlvLmMg
ICAgfCAyNyArKysrKysrKysrKysrKy0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRp
b25zKCspLCA3IGRlbGV0aW9ucygtKQo+CgpEb2VzIGFueW9uZSBoYXZlIGNvbW1lbnRzIG9uIHRo
aXMgcGF0Y2g/CgpUaGFua3MhCkp1bgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
