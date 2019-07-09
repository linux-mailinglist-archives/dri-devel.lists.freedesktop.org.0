Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B2C63370
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 11:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C98889FCA;
	Tue,  9 Jul 2019 09:32:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78B789FA0
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 09:32:37 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id 31so3423172wrm.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2019 02:32:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fZLHKqkJ/NUVMWKCRqPqvpzAlJVepsiVEMIESMtizP4=;
 b=nlfzaUeI6imBVhpAW52pKfPYg4QXqjJO0Dz9M7L3xYCrhH5MzjRZ1DVKKBeM5p2qnR
 VZA2lFcqKfYefjbEsUZk6LD8DCithoIGpNyK95TH27nZKR5GIF5XWBjYmsvSF6encGNE
 oMVAH6TLswfO0XUynnYG5IgUYCHHD0I1H6waIMnrGBPcCg410M7mp3cU3xQ8BkmZv59r
 zyYu7/i70+iWvXyyDHeRNWxa2ESSLfBlFNODuUDHQPDLUeQniN8RVFtBhzEX/QONTrot
 Nk6mKVVTi6BwTEBgH/WCIly9DVSAZ6AmBWo5zUwf2/jySoc9JLAuXJKqBaFJxEcTfIsW
 6hAQ==
X-Gm-Message-State: APjAAAUt6muD9jUU6rnDq30Dpv6LGj1Vq53cXjMfbYfE85w2btohA6pE
 f6nSdXCuyp6sS+T4ZFSotceOQg==
X-Google-Smtp-Source: APXvYqxWgUwVKIFqEOVudEP2OfPQxaT1pt5nyieC3nMAj4U6oS88unDOAKek0G5oyu2upD9ht5RuhQ==
X-Received: by 2002:a5d:67cd:: with SMTP id n13mr24144549wrw.138.1562664756359; 
 Tue, 09 Jul 2019 02:32:36 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id g25sm1777053wmk.39.2019.07.09.02.32.35
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 02:32:35 -0700 (PDT)
Date: Tue, 9 Jul 2019 10:32:34 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v2] backlight: rave-sp: don't touch initial state and
 register with correct device
Message-ID: <20190709093234.a3mllxammtgngyrq@holly.lan>
References: <20190708124129.5664-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190708124129.5664-1-l.stach@pengutronix.de>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=fZLHKqkJ/NUVMWKCRqPqvpzAlJVepsiVEMIESMtizP4=;
 b=OAv2Ww1zVSR4ONj4RqVFiH5wkiLiEYuBl50/GodSQVowyytVq5MGQzmLvWILntZ4S6
 h5GhUsvj4PZ2/aqDfYc5EKSj5fGrlvqD+GvxjKrFeVrNszazkJ8udL0j+I1EibOXhBs8
 S3P87sjhbOASl53veCjF8Y/3uEjr6sIlNI7uhxv51aNXAWFnGFADM/Hj/0ok1Pw8K6t+
 p8lYNKGwzuam1weaZ4EzzV52HIjS9vlU4WmLxNvAOu0iZJicSNX/lR46gYQtsiLe2O4w
 Q3y3LkFgk5pfWQ9Y1Etv9t7NZsG8qTmPYxcpEFNQyxk+DKs3wO/51F1bs7K5YcAQ2P1o
 Qq2w==
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
Cc: Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMDgsIDIwMTkgYXQgMDI6NDE6MjlQTSArMDIwMCwgTHVjYXMgU3RhY2ggd3Jv
dGU6Cj4gVGhpcyB3YXkgdGhlIGJhY2tsaWdodCBjYW4gYmUgcmVmZXJlbmNlZCB0aHJvdWdoIGl0
cyBkZXZpY2Ugbm9kZSBhbmQKPiBlbmFibGluZy9kaXNhYmxpbmcgY2FuIGJlIG1hbmFnZWQgdGhy
b3VnaCB0aGUgcGFuZWwgZHJpdmVyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEx1Y2FzIFN0YWNoIDxs
LnN0YWNoQHBlbmd1dHJvbml4LmRlPgoKUmV2aWV3ZWQtYnk6IERhbmllbCBUaG9tcHNvbiA8ZGFu
aWVsLnRob21wc29uQGxpbmFyby5vcmc+CgoKPiAtLS0KPiAgZHJpdmVycy92aWRlby9iYWNrbGln
aHQvcmF2ZS1zcC1iYWNrbGlnaHQuYyB8IDEwICsrKysrKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQs
IDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy92aWRlby9iYWNrbGlnaHQvcmF2ZS1zcC1iYWNrbGlnaHQuYyBiL2RyaXZlcnMvdmlkZW8vYmFj
a2xpZ2h0L3JhdmUtc3AtYmFja2xpZ2h0LmMKPiBpbmRleCA0NjJmMTRhMWIxOWQuLjA1YjVmMDAz
YTNkMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9yYXZlLXNwLWJhY2ts
aWdodC5jCj4gKysrIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcmF2ZS1zcC1iYWNrbGlnaHQu
Ywo+IEBAIC00OCwxNCArNDgsMjAgQEAgc3RhdGljIGludCByYXZlX3NwX2JhY2tsaWdodF9wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJc3RydWN0IGRldmljZSAqZGV2ID0g
JnBkZXYtPmRldjsKPiAgCXN0cnVjdCBiYWNrbGlnaHRfZGV2aWNlICpiZDsKPiAgCj4gLQliZCA9
IGRldm1fYmFja2xpZ2h0X2RldmljZV9yZWdpc3RlcihkZXYsIHBkZXYtPm5hbWUsIGRldi0+cGFy
ZW50LAo+ICsJYmQgPSBkZXZtX2JhY2tsaWdodF9kZXZpY2VfcmVnaXN0ZXIoZGV2LCBwZGV2LT5u
YW1lLCBkZXYsCj4gIAkJCQkJICAgIGRldl9nZXRfZHJ2ZGF0YShkZXYtPnBhcmVudCksCj4gIAkJ
CQkJICAgICZyYXZlX3NwX2JhY2tsaWdodF9vcHMsCj4gIAkJCQkJICAgICZyYXZlX3NwX2JhY2ts
aWdodF9wcm9wcyk7Cj4gIAlpZiAoSVNfRVJSKGJkKSkKPiAgCQlyZXR1cm4gUFRSX0VSUihiZCk7
Cj4gIAo+IC0JYmFja2xpZ2h0X3VwZGF0ZV9zdGF0dXMoYmQpOwo+ICsJLyoKPiArCSAqIElmIHRo
ZXJlIGlzIGEgcGhhbmRsZSBwb2ludGluZyB0byB0aGUgZGV2aWNlIG5vZGUgd2UgY2FuCj4gKwkg
KiBhc3N1bWUgdGhhdCBhbm90aGVyIGRldmljZSB3aWxsIG1hbmFnZSB0aGUgc3RhdHVzIGNoYW5n
ZXMuCj4gKwkgKiBJZiBub3Qgd2UgbWFrZSBzdXJlIHRoZSBiYWNrbGlnaHQgaXMgaW4gYSBjb25z
aXN0ZW50IHN0YXRlLgo+ICsJICovCj4gKwlpZiAoIWRldi0+b2Zfbm9kZS0+cGhhbmRsZSkKPiAr
CQliYWNrbGlnaHRfdXBkYXRlX3N0YXR1cyhiZCk7Cj4gIAo+ICAJcmV0dXJuIDA7Cj4gIH0KPiAt
LSAKPiAyLjIwLjEKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
