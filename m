Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EC89E4B1
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 11:45:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AAF7893C0;
	Tue, 27 Aug 2019 09:45:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C3D68925F
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 09:45:03 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id k2so18112235wrq.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 02:45:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=6f+Icsxz68/2WUOQOXJPlnmhND3c9kjk7Qbbyj0A0kg=;
 b=RVm2XMHOBZpE/Ibcr/u9cwxxxS1jKVQRX39MEt8DD925LzwMI2SE7FGkH5UNYej96m
 oFlBO9UNLeW5t2CiW5V450nhO04nqI5xLo1gD+KDX8rwlt8LUqdNL6KqRtnpWi4ZdQV1
 tWG5pCTlcAtTZ0sQYZ+I3G7ZoBdYfsw/n2sDBUnPwf+5B8uQpQTq6jiy2+W20eSwIHkt
 41wET7Olz58FRsrTwOLCPkS1hySKWKAmsctR3bEke+a0ubT4YzHBgQSBb8o6HpuLynxY
 EwiO7VNAi2Zs6vrEDtgGRGz2wrqybELxkV5JEI/1pLwxEud8KyTxAV0vYluKWVHh8ZW/
 5txw==
X-Gm-Message-State: APjAAAVJiad1hTkurnvAnZyQTma/6bPQvEwsCP6t7Pp6M06KWCOP/2o0
 fEbJ4OPNsaCOYdEbBL53Yz+nGA==
X-Google-Smtp-Source: APXvYqzj0vKC3iOhGGKsmddO0sx2ggiSMWTkca88AucPIDge5HC2ZDkK0IXCRr00WWZ8LAlMeqxRXw==
X-Received: by 2002:adf:f5c5:: with SMTP id k5mr6828393wrp.42.1566899101785;
 Tue, 27 Aug 2019 02:45:01 -0700 (PDT)
Received: from dell ([2.27.35.174])
 by smtp.gmail.com with ESMTPSA id f24sm2510743wmc.25.2019.08.27.02.45.00
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 27 Aug 2019 02:45:01 -0700 (PDT)
Date: Tue, 27 Aug 2019 10:44:59 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH v3 2/4] backlight: Expose brightness curve type through
 sysfs
Message-ID: <20190827094459.GB4804@dell>
References: <20190709190007.91260-1-mka@chromium.org>
 <20190709190007.91260-3-mka@chromium.org>
 <20190807201528.GO250418@google.com>
 <510f6d8a-71a0-fa6e-33ea-c4a4bfa96607@linaro.org>
 <20190816175317.GU250418@google.com>
 <20190819100241.5pctjxmsq6crlale@holly.lan>
 <20190819185049.GZ250418@google.com>
 <20190820135617.64urowbu2kwdynib@holly.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190820135617.64urowbu2kwdynib@holly.lan>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=6f+Icsxz68/2WUOQOXJPlnmhND3c9kjk7Qbbyj0A0kg=;
 b=DAEHqRPgmw98bL/haImN9fD6UfMYR1/S2NnQjdEW81PFCu9T2dceMxS2vBYT+J/OLc
 t2sru5JRJ0GKU0Zg8KmLGV4Rl/1mnBt8AMc4VqoVzpP4Bkq+eNnmp5LyyEsyu0HI+gAE
 I62570EvJBOCoNiTRpNvR+H7ZpvBO6rqAvAQ6Ao7dUAIRV6gvPmGQsXt5uQcy+M0MAO8
 ZD6MvYoxL4JxOwg1W7lDM6k59M+/nFzr1vEiYlrKUCGp4+bNnquLtb5hJOzbAxX/qXDQ
 ZjaRJMCJJ9YOQJwIFZhpn7xBIG+rUxC3uNxq+C2cOxRgHVL9QDNuse/CwpjGabaHxouc
 s6RA==
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Brian Norris <briannorris@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Wy4uLl0KCj4gPiBJSVVDIHRoZSBjb25jbHVzaW9uIGlzIHRoYXQgdGhlcmUgaXMgbm8gbmVlZCBm
b3IgYSBzdHJpbmcgYXR0cmlidXRlCj4gPiBiZWNhdXNlIHdlIG9ubHkgbmVlZCB0byBkaXN0aW5n
dWlzaCBiZXR3ZWVuICdwZXJjZXB0dWFsJyBhbmQKPiA+ICdub24tcGVyY2VwdHVhbCcuIElmIHRo
YXQgaXMgY29ycmVjdCwgZG8geW91IGhhdmUgYW55IHByZWZlcmVuY2UgZm9yCj4gPiB0aGUgYXR0
cmlidXRlIG5hbWUgKCdwZXJjZXB0dWFsX3NjYWxlJywgJ3BlcmNlcHR1YWwnLCAuLi4pPwo+IAo+
IE1vcmUgYSBzdW1tYXJ5IHRoYW4gYSBjb25jbHVzaW9uISBUaGVyZSBpcyBhIHJlYXNvbiBJIGhh
dmUgbGVmdCBhIGJpdCBvcgo+IHNwYWNlIGZvciBvdGhlcnMgdG8gY29tbWVudCBvbiB0aGlzIG92
ZXIgdGhlIGxhc3QgbW9udGggKGFuZCBhIGJpdCkuCj4gCj4gVG8gYmUgY2xlYXIgbXkgUmV2aWV3
ZWQtYnk6IG1lYW5zIHRoYXQgSSBiZWxpZXZlIHRoYXQgdGhlIGtlcm5lbCBpcyBiZXR0ZXIKPiB3
aXRoICJub24tbGluZWFyL2xpbmVhci91bmtub3duIiB0aGFuIHdpdGhvdXQgaXQgYW5kIHRoYXQg
SSBhbSBjb21mb3J0YWJsZQo+IHRoZSBBUEkgaXNuJ3QgbGlrZWx5IHRvIGJlIGEgbWlsbHN0b25l
IGZvciB1cy4KPiAKPiBMZWUsIEppbmdvbzogRWl0aGVyIG9mIHlvdSBjYXJlIHRvIG9mZmVyICQw
LjAyCgpObywgbm90IHJlYWxseS4gIEhhcHB5IHRvIGxlYXZlIGl0IHRvIHlvdXIgZ29vZCBqdWRn
ZW1lbnQuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCkxpbmFybyBTZXJ2aWNlcyBUZWNobmlj
YWwgTGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MK
Rm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
