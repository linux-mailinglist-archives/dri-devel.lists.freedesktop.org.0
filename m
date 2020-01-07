Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B484132362
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 11:19:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B186E825;
	Tue,  7 Jan 2020 10:18:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C47AC6E825
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 10:18:56 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id z7so53174924wrl.13
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2020 02:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=5OSpiBgLmyZRMYClNdG6v/2d9HzZ4xtRsYnQ1Jt34tg=;
 b=cKnu1Uhpwa9RJbuLbSDrHf3Wgs0qUh32dyk3Vf3CNLB3H+XFgRV3LYY++WjzX50qqR
 asC3BHLKYzx4cJHTxSmnxNhaNXxBRxS+rRC9lQ1tELV30j6JWutWLaA06W1pl9vIwwpa
 otlIUVVVWP0bY1TtRMeiK+mJuwzsjJW5tODutbCpXvg/Qov6F015M5N+HG1+I68wKkZo
 QHWI2FWglN5WoSGINA4ckO2KpqkGwfAgD+0tz0zfUYGxegUvboV9AglfWks09IEwjVVt
 aCDXpv0kOSa4Q42pp2W6XbYdp2WiL7L2OMBQu2jzs0axxf+QfoCJWgtfAxhGb//eudJw
 4iaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=5OSpiBgLmyZRMYClNdG6v/2d9HzZ4xtRsYnQ1Jt34tg=;
 b=OdQ7sE6SZVk6nG23GokH5mH9ND7XcmofDzVtzaApB2tbcIKKCvH2jy+Pei+gGoST5V
 NDNwKysnseeJuTLgWcE1IcasLjT07l/QtFfLcBLYGyd4JuzSndrJgCC4+59M0pRye7e4
 MxCUvrmmifyCG7V3Tml/r/CUU3HDU/YfyKbzLD9sc4SIDCKL9LxQh8sbuksvZBkKkYfw
 Rrug+Q39jzRkEBc/hU1io7nwumKw+Gdcm9dTJze034mnew0DgNrHgNxzpIJAdzIRcucN
 4eh00LR+oTX+q8lFG2MIjxrjB2eyD5TdxAH89a/GlafLvDeeTF4LebVbiD1eUTXsqF2v
 XVyA==
X-Gm-Message-State: APjAAAWAlq6ac7iiAZFYYrDSW6B0v0m1ez6io0Jq9sfgjBkhoCJj/hpJ
 4SuV9lgIJARadcrGuFJ7KhTfIg==
X-Google-Smtp-Source: APXvYqz3Re5MwhTSC/BuabUjWdObG0LJv2kUstc3b+oywJXytPI+74gf5zIuTS4NULpii+z9mZXgwQ==
X-Received: by 2002:adf:e78a:: with SMTP id n10mr112714781wrm.62.1578392335397; 
 Tue, 07 Jan 2020 02:18:55 -0800 (PST)
Received: from dell ([2.27.35.135])
 by smtp.gmail.com with ESMTPSA id u14sm75650587wrm.51.2020.01.07.02.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 02:18:54 -0800 (PST)
Date: Tue, 7 Jan 2020 10:18:59 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH v3 4/6] mfd: atmel-hlcdc: return in case of error
Message-ID: <20200107101859.GD14821@dell>
References: <1576672109-22707-1-git-send-email-claudiu.beznea@microchip.com>
 <1576672109-22707-5-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1576672109-22707-5-git-send-email-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: alexandre.belloni@bootlin.com, airlied@linux.ie,
 nicolas.ferre@microchip.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, boris.brezillon@bootlin.com, sam@ravnborg.org,
 peda@axentia.se, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxOCBEZWMgMjAxOSwgQ2xhdWRpdSBCZXpuZWEgd3JvdGU6Cgo+IEZvciBITENEQyB0
aW1pbmcgZW5naW5lIGNvbmZpZ3VyYXRpb25zIGJpdCBBVE1FTF9ITENEQ19TSVAgb2YKPiBBVE1F
TF9ITENEQ19TUiBuZWVkcyB0byBiZSBwb2xsZWQgYmVmb3JlIGFwcGx5aW5nIG5ldyBjb25maWcu
IEluIGNhc2Ugb2YKPiB0aW1lb3V0IHRoZXJlIGlzIG5vIGluZGljYXRvciBhYm91dCB0aGlzLCBz
bywgcmV0dXJuIGluIGNhc2Ugb2YgdGltZW91dAo+IGFuZCBhbHNvIHByaW50IGEgbWVzc2FnZSBh
Ym91dCB0aGlzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJl
em5lYUBtaWNyb2NoaXAuY29tPgo+IEFja2VkLWZvci1NRkQtYnk6IExlZSBKb25lcyA8bGVlLmpv
bmVzQGxpbmFyby5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvbWZkL2F0bWVsLWhsY2RjLmMgfCAxNSAr
KysrKysrKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCgpQYXRjaCBhcHBsaWVkIGFuZCBwdWxsLXJlcXVlc3Qgc2VudCwgdGhhbmtzLgoK
LS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpMaW5hcm8gU2VydmljZXMgVGVjaG5pY2FsIExlYWQK
TGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBM
aW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
