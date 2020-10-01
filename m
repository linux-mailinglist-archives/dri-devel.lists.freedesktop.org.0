Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8638627FC1C
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 10:59:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9547E6E17D;
	Thu,  1 Oct 2020 08:59:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE8356E17D
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Oct 2020 08:59:48 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id v12so2167385wmh.3
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Oct 2020 01:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=b4uSbu8JvKsaI+3hqVofQ3z9cg5g3XgnsLm2bYiWDFk=;
 b=CSA/BM34eAh4uxHpWVnchqjL1b16lmxgAkzEvgzHS8oJV0z7w/6BU6EORdc+vBc8Od
 7ITBw1XDCFkhg7ud5YZOfaXuPyNIoKJFa9KK04ycpnX3Td2RpS6tVFahB2x6U2JLXFPA
 vBodacrjHDzCGiFSs72eV/tII9LM5qkYK3DchQUK6SM75T9s1gBzq7TR+l2B9T/HhsMy
 OtBe509uoRqzq1cSRFWwADWtPsOqGTf5Qa7iwipnTiZEiKYngHZMnZCoJRtSFUC+0SCJ
 TZDXuWq/M80WIaVo9uu82duq5zxzDe+jQI9M6REAuHhbhwcgyNw2cW+jCH9yhdrszY5r
 0kHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=b4uSbu8JvKsaI+3hqVofQ3z9cg5g3XgnsLm2bYiWDFk=;
 b=P6iuJJVM9RmLi3TC70PP0sJDIi9ajA+7RtzxWcAUIvrFZl5IPs4SGC/b9l0Vo8TOtK
 TEhAeIZiLTCvv6iodK9LwSdo9GSnm+ccoTh1x/JYPOZyBRe+C+7U79nnvfIQ0w8tCWx0
 IhMI9MBnNiPkt1XWyNnZyzSaZgwrqAzsdFo/gviuJrkX0Q0S8hF/OCcENZ0ZLi9ro0KO
 dQnc3TmsP7VUEvC0AI15YxYP6vC52a5GLSsDI39lMepo7YzQVt5ojPrwao5dPxBP7QNe
 TuNX7HhabLN65UA/5rdtJmJZbJBsuwvsNxq0TOllnPtWveXXCVDZQP/lk22Cbg8e0mWQ
 in2g==
X-Gm-Message-State: AOAM531HOtNP2kOsngK0oKZ7Lx3AXDX1GfQ1ESbqIr0YpirOJrq8Jmy8
 hNmqKok08SiA0ky9fTVEOgbxOw==
X-Google-Smtp-Source: ABdhPJyPA3mYaoEaFvcuTP+d8RRiG5H63+dOD++jzcwDuW56pVdMKmDJwOeB6crMhJUOMOTyzxVMLA==
X-Received: by 2002:a1c:4604:: with SMTP id t4mr7196747wma.156.1601542787367; 
 Thu, 01 Oct 2020 01:59:47 -0700 (PDT)
Received: from dell ([91.110.221.236])
 by smtp.gmail.com with ESMTPSA id 91sm8271604wrq.9.2020.10.01.01.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 01:59:46 -0700 (PDT)
Date: Thu, 1 Oct 2020 09:59:44 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3 v3] backlight: Add Kinetic KTD253 backlight driver
Message-ID: <20201001080716.GL6148@dell>
References: <20200819205150.164403-1-linus.walleij@linaro.org>
 <20200819205150.164403-3-linus.walleij@linaro.org>
 <20200828104731.GQ1826686@dell>
 <CACRpkdaEXd4=zmbGYX0ZKX5BSP3de7UAp6j9Mw76LogXVo6X9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdaEXd4=zmbGYX0ZKX5BSP3de7UAp6j9Mw76LogXVo6X9Q@mail.gmail.com>
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAzMCBTZXAgMjAyMCwgTGludXMgV2FsbGVpaiB3cm90ZToKCj4gT24gRnJpLCBBdWcg
MjgsIDIwMjAgYXQgMTI6NDcgUE0gTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4gd3Jv
dGU6Cj4gCj4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy92aWRlby9iYWNrbGlnaHQv
a3RkMjUzLWJhY2tsaWdodC5jCj4gPgo+ID4gQXBwbGllZCwgdGhhbmtzLgo+IAo+IE5vdCB0byB1
bm5lY2Vzc2FyaWx5IG5hZyBidXQgSSBjYW4ndCBzZWUgdGhpcyBpbiBsaW51eC1uZXh0IGFuZCBz
aW5jZSB3ZQo+IGFyZSBhdCAtcmM3IGl0IG1ha2VzIG1lIGEgYml0IG5lcnZvdXMsIGlzIGl0IHN0
aWxsIGdvbm5hIGJlIGluIHY1LjEwPwoKSGVoLCB5b3UncmUgcmlnaHQuICBBcG9sb2dpZXMsIHRl
c3RlZCBhbmQgcHVzaGVkIG5vdy4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KU2VuaW9yIFRl
Y2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291
cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0
ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
