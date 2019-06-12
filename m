Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6903D4339B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:30:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5FAF89568;
	Thu, 13 Jun 2019 07:28:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 832C68936B
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 15:37:11 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id u64so12021649oib.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 08:37:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3n+GxQUMFdCw39sCRdT3VANQBvF6Eyfiee97fe/539w=;
 b=WgdmvAhn3Qdq5Xrc2mSJelEJHI3ceYS5u5nx+jDjyjY/Dl8bQ4rR2KGCKQuDHlUhhn
 BkcF7CKY/zNcnL15T5WEOokO4kHfWAoTBUqJgorITJRRctV2HHJcUFN4tyhoxpRuQn05
 oI8BfzsMOBagOY9mjzEu8QmZymPVqEePi4uqGgBZlSwS50Fn7QD7mifVH/w41e/DtGNF
 DduqyV7rqbeRBchmg92T6/0B5iK9YjRTajcHe5gjyHgmCyj2Wjb+p839VUF8fAeWrFrb
 D43052eikxu9W8WspHf/CHagOxd5TC/+XzwhyQRcMq9oprW21JrXOmsx14YVO7mI5IkO
 olFA==
X-Gm-Message-State: APjAAAUAMCPoSigJCyxsOrjKT4mIRxh19u6GNWw7AfjgCZpRnGjWdMiH
 vEcmsqy4JbFegjDhHg3+1Ob/qnbd+m5Fwec5C84=
X-Google-Smtp-Source: APXvYqxZohqvEfAZxIRTST3vALaQgTPeGlIIAaYk3hmCa7KeJxwioYXCXm3pI7QMHdw8JQ2cua3Pbel+r5D6Ky/7L2U=
X-Received: by 2002:aca:e106:: with SMTP id y6mr20262035oig.77.1560353830511; 
 Wed, 12 Jun 2019 08:37:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190611110052.iw6qbw2yvypxus6t@shell.armlinux.org.uk>
 <E1haeXd-0001yS-Bg@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1haeXd-0001yS-Bg@rmk-PC.armlinux.org.uk>
From: Sven Van Asbroeck <thesven73@gmail.com>
Date: Wed, 12 Jun 2019 11:36:59 -0400
Message-ID: <CAGngYiUoLCzquqaxC3oMk7zJ8+WmgNi=NmFRO6HC8psu_PrunA@mail.gmail.com>
Subject: Re: [PATCH 08/13] drm/i2c: tda998x: move audio routing configuration
To: Russell King <rmk+kernel@armlinux.org.uk>
X-Mailman-Approved-At: Thu, 13 Jun 2019 07:27:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=3n+GxQUMFdCw39sCRdT3VANQBvF6Eyfiee97fe/539w=;
 b=HegVJJADEchm6pKxfMSQansS2752UK/V70F+YIEuNs090bWFs9DLMtp0/oxChejSKN
 e+n0wZCa17WNGP0A/pgzDxMR9BsXCIH5mg50OYjLAWd604y2Z41TotmREw9vZiqtGvje
 D9Rf4R7seK65UMi0UdRGWy8IjsPYNNRP/ka2h8l1WbWrr0ZIV4XNzwDhhjAdfcME7OdP
 PPtseM2IOiLJMfU7E+NRpvX4k46kxSeBuUdGmKalpQqsRk4fkR6VIAh3J46PPxuQm+Jl
 /AuY0kFCG5y67L5AJMv0Bs9C1PNP7TxtWwEyimAh5WMD8aHdxpSce7M236hj2sshf/gK
 RswA==
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Mark Brown <broonie@kernel.org>,
 Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgNzowMiBBTSBSdXNzZWxsIEtpbmcgPHJtaytrZXJuZWxA
YXJtbGludXgub3JnLnVrPiB3cm90ZToKPgo+IE1vdmUgdGhlIG11eCBhbmQgY2xvY2tpbmcgc2Vs
ZWN0aW9uIG91dCBvZiB0ZGE5OTh4X2NvbmZpZ3VyZV9hdWRpbygpCj4gaW50byB0aGUgcGFyZW50
IGZ1bmN0aW9ucywgc28gd2UgY2FuIHZhbGlkYXRlIHRoaXMgd2hlbiBwYXJhbWV0ZXJzCj4gYXJl
IHNldCBvdXRzaWRlIG9mIHRoZSBhdWRpbyBtdXRleC4KPgo+IFNpZ25lZC1vZmYtYnk6IFJ1c3Nl
bGwgS2luZyA8cm1rK2tlcm5lbEBhcm1saW51eC5vcmcudWs+Cj4gLS0tCgorLyogQ29uZmlndXJl
IHRoZSBUREE5OTh4IGF1ZGlvIGRhdGEgYW5kIGNsb2NrIHJvdXRpbmcuICovCitzdGF0aWMgaW50
IHRkYTk5OHhfZGVyaXZlX3JvdXRpbmcoc3RydWN0IHRkYTk5OHhfcHJpdiAqcHJpdiwKKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB0ZGE5OTh4X2F1ZGlvX3NldHRpbmdz
ICpzLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IHJvdXRl
KQoreworICAgICAgIHMtPnJvdXRlID0gJnRkYTk5OHhfYXVkaW9fcm91dGVbcm91dGVdOworICAg
ICAgIHMtPmVuYV9hcCA9IHByaXYtPmF1ZGlvX3BvcnRfZW5hYmxlW3JvdXRlXTsKKyAgICAgICBp
ZiAocy0+ZW5hX2FwID09IDApIHsKKyAgICAgICAgICAgICAgIGRldl9lcnIoJnByaXYtPmhkbWkt
PmRldiwgIm5vIGF1ZGlvIGNvbmZpZ3VyYXRpb24gZm91bmRcbiIpOworICAgICAgICAgICAgICAg
cmV0dXJuIC1FSU5WQUw7CisgICAgICAgfQorCisgICAgICAgcmV0dXJuIDA7Cit9CgpOaXQ6IHBy
aXYgaXMgbmVhcmx5IHVudXNlZCBpbiB0aGlzIGZ1bmN0aW9uLgpNYXliZSBkZWxlZ2F0ZSB0aGUg
ZXJyb3IgbG9nIHRvIHRoZSBjYWxsZXIsIGluIHRoYXQgY2FzZSB3ZSBjb3VsZCBqdXN0IHBhc3MK
cm91dGUgYW5kIGNvbnN0IGF1ZGlvX3BvcnRfZW5hYmxlIHRvIHRoZSBmdW5jdGlvbi4gSW5zdGVh
ZCBvZiBwYXNzaW5nIGluIHRoZQona2l0Y2hlbiBzaW5rJyBwcml2ID8KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
