Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CED56741
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 12:57:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E24C96E382;
	Wed, 26 Jun 2019 10:57:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B336E382
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 10:57:26 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id f15so2225179wrp.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 03:57:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=0Mp2X3uUYygyUZH2VQNMWqRZzz0G4HZjkY+o2sLP3XQ=;
 b=USIO/dPjpdDl+p0gO4/IZfsL/bDOl+CT1HZUI5cu3NxXG4Hyz+4LiPmHFb9zFfEimK
 Cczmq2vk+3c3wNuGnKxxapnRIeL8RSfZRD6jGeodUUl0bnD4wJDEYnRAL1kh5K0hvy46
 5qemzFkeUbuQOYr8a7ZjuPSUZMuarBWFXzD//1kEK08uzuTsn73XMP/TSgHzeWljS5s8
 DwLQiYdMUcMZCYHeC30Q79knZAgvFOCvjaZ+k4ktZN/s7SLeC3zvtWTTsZCk1kyfddlu
 cW6z8+jagadoef3+l0jljwoJfYTPGpFOvxdbySd8y40GSFkNEn6xa11VYJiEnO8bTCWc
 Q/0Q==
X-Gm-Message-State: APjAAAWlhOMX0s1g369v9cIYvAaYY+hi9YK2VS9Aod0k5LTQvB/Tewdt
 LFJykqdE1x13H398Lz7t9jxj9jFM79o=
X-Google-Smtp-Source: APXvYqxcKact6y2VazDjACaBwBoZt6ULVQ4X5ODPEEv4/9be/yXk+6/uGqYXkvXA+UqI2vBKCeNLog==
X-Received: by 2002:adf:d843:: with SMTP id k3mr3288112wrl.332.1561546644641; 
 Wed, 26 Jun 2019 03:57:24 -0700 (PDT)
Received: from dell ([2.27.35.164])
 by smtp.gmail.com with ESMTPSA id q12sm19839064wrp.50.2019.06.26.03.57.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 26 Jun 2019 03:57:24 -0700 (PDT)
Date: Wed, 26 Jun 2019 11:57:22 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1] backlight: gpio_backlight: Enable ACPI enumeration
Message-ID: <20190626105722.GP21119@dell>
References: <20190619152127.11670-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190619152127.11670-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=0Mp2X3uUYygyUZH2VQNMWqRZzz0G4HZjkY+o2sLP3XQ=;
 b=bFkuHeWiQ22Q+3CdGwrV356cFF1YsEeZVIrZg5WR9FqoA1+b4nLh5tYJqHZtlJ+I3M
 +wLP0HESSCvKzp9wdWdGUWdhx+1mSe4fuRKM6U5Qipfc+4YrjG9Hm4M/nfyEMEelgw3a
 uI8ElEbvfhcy/pjsUlYO2K3SA7aocIOh3w7L5oymPGJZzt/WYhchgQmASk5yfFRuJQMw
 9+wSnQuB4ZtaTBFEXkNl1kSvfCo3ssHrwPcL2yMM9qTrhKSI5RXxbnXoP5D4vbbF8JAe
 E6k9YfwgHDzvpKjgRzZigEsfstabObirQxhCRgKde80pi8CsW7UU3rH1v2rQWe+1ntzj
 StBQ==
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxOSBKdW4gMjAxOSwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgoKPiBBQ1BJIGFsbG93
cyB0byBlbnVtZXJhdGUgc3BlY2lmaWMgZGV2aWNlcyBieSB1c2luZyBjb21wYXRpYmxlIHN0cmlu
Z3MuCj4gRW5hYmxlIHRoYXQgZW51bWVyYXRpb24gZm9yIEdQSU8gYmFzZWQgYmFja2xpZ2h0IGRl
dmljZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5keSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNo
ZW5rb0BsaW51eC5pbnRlbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dw
aW9fYmFja2xpZ2h0LmMgfCAyMyArKysrKysrKystLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hh
bmdlZCwgOSBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKCkFwcGxpZWQsIHRoYW5rcy4K
Ci0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KTGluYXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFk
CkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cg
TGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
