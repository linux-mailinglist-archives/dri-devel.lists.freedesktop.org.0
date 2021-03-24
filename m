Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B903475E5
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 11:23:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E67376E9B0;
	Wed, 24 Mar 2021 10:22:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00F8B6E9B0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 10:22:56 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id j18so23851306wra.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 03:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ReYdg+qOxyzg7pfDHNN8JwOdhx/QxafMQjTjNtrXa8I=;
 b=fYqP4nrTK5V2tRC3ApY9z0UO8DcbwSs1H48dvXtuu0+ws3W8rcW7Wmorwzqb8haIBS
 Q5QNx9pIwkBWvtRzdvomARtKXwDRqOMZrU8sliEIRMeQk6T42odgrdjEC0fNs4XL844t
 Xft8F0ZGQTGRxKSIRO2C7zvr1hnFkfKDr6/c2T9NxUinnlfTuDGWoSiAaVXq6+o9/ZSX
 sD+2NBO/iOGnPDdM6/3KsupAV9qLP1PMaHHNWGArQCPA7sDHTaKYYNMbImt5B05Z94w+
 sZ6dHiGLa6oaQ3gWSFFOMSEFpRCrbWNWOTAMWrPbr+rpjitN5CnfKGFpg2yy3PxqGr+b
 F1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ReYdg+qOxyzg7pfDHNN8JwOdhx/QxafMQjTjNtrXa8I=;
 b=T+aHCfWMiUg490LhK/BtnJyIe3HCHE0+PP/GSEb73MHgcDWs9NQAvrP1vs3GhewcLU
 fR0B17zBjppLiTnxLg5erZk4JygupjzdUfpi8lvzBdf2kZNT27H6j6Os5Z5Mxr5lPsib
 qp6zATggyaghOO/SyiPA08r7Ltn21ujfCx+0oPkZeljJqDlYEmMg9pfdlRRR8QyJH2zv
 7Qq6oqVgx8Vv7KKOAAkJPg72NXb/611IGHscwNwKqDx0+N9VYYgz5/Awumzv4QNqQSJD
 Y2jxRvDuAbeh+3r7TBWHOHnpcp9jcPxDMyvEi0MUKQpd6gtoK4nEgeSkrONVOAM51JUX
 PR4g==
X-Gm-Message-State: AOAM530IaRBhx8AvjgZDj9EDTMO68aOZQ8BKlIEwXQt1rqLLj+lBs3jQ
 gkRboF4EQ4yX+WUFgmoidEA3piHJEmXnaHiA
X-Google-Smtp-Source: ABdhPJzUWAa2c6ks9s1E371QpDg5Le+5aHbahskQq8WdE1l/jSG3ic1jWi3CqJeZeIbfyCGvcYWh2A==
X-Received: by 2002:adf:a302:: with SMTP id c2mr2669695wrb.212.1616581375257; 
 Wed, 24 Mar 2021 03:22:55 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:16a8:fbd2:45bb:a5b7?
 ([2a01:e0a:90c:e290:16a8:fbd2:45bb:a5b7])
 by smtp.gmail.com with ESMTPSA id x23sm1790457wmi.33.2021.03.24.03.22.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 03:22:54 -0700 (PDT)
Subject: Re: [PATCH v1] MAINTAINERS: Update Maintainers of DRM Bridge Drivers
To: Robert Foss <robert.foss@linaro.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <maxime@cerno.tech>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Andrzej Hajda
 <a.hajda@samsung.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
References: <20210324102019.1251744-1-robert.foss@linaro.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <28a7ebe7-d54d-b36e-f093-89d57b15300f@baylibre.com>
Date: Wed, 24 Mar 2021 11:22:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210324102019.1251744-1-robert.foss@linaro.org>
Content-Language: en-US
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgIQoKT24gMjQvMDMvMjAyMSAxMToyMCwgUm9iZXJ0IEZvc3Mgd3JvdGU6Cj4gQWRkIG15c2Vs
ZiBhcyBjby1tYWludGFpbmVyIG9mIERSTSBCcmlkZ2UgRHJpdmVycy4gUmVwb3NpdG9yeQo+IGNv
bW1pdCBhY2Nlc3MgaGFzIGFscmVhZHkgYmVlbiBncmFudGVkLgo+IAo+IGh0dHBzOi8vZ2l0bGFi
LmZyZWVkZXNrdG9wLm9yZy9mcmVlZGVza3RvcC9mcmVlZGVza3RvcC8tL2lzc3Vlcy8zMzgKPiAK
PiBDYzogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgo+IENjOiBMYXVy
ZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4gQ2M6IEpv
bmFzIEthcmxtYW4gPGpvbmFzQGt3aWJvby5zZT4KPiBDYzogQW5kcnplaiBIYWpkYSA8YS5oYWpk
YUBzYW1zdW5nLmNvbT4KPiBDYzogSmVybmVqIMWga3JhYmVjIDxqZXJuZWouc2tyYWJlY0BzaW9s
Lm5ldD4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IFNpZ25lZC1vZmYt
Ynk6IFJvYmVydCBGb3NzIDxyb2JlcnQuZm9zc0BsaW5hcm8ub3JnPgoKKyBDQzogZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwoKPiAtLS0KPiAgTUFJTlRBSU5FUlMgfCAxICsKPiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJT
IGIvTUFJTlRBSU5FUlMKPiBpbmRleCA0YjcwNWJhNTFjNTQuLjE2YWNlOGY1ODY0OSAxMDA2NDQK
PiAtLS0gYS9NQUlOVEFJTkVSUwo+ICsrKyBiL01BSU5UQUlORVJTCj4gQEAgLTU5MDIsNiArNTkw
Miw3IEBAIEY6CWRyaXZlcnMvZ3B1L2RybS9hdG1lbC1obGNkYy8KPiAgRFJNIERSSVZFUlMgRk9S
IEJSSURHRSBDSElQUwo+ICBNOglBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgo+
ICBNOglOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Cj4gK006CVJvYmVy
dCBGb3NzIDxyb2JlcnQuZm9zc0BsaW5hcm8ub3JnPgo+ICBSOglMYXVyZW50IFBpbmNoYXJ0IDxM
YXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4gIFI6CUpvbmFzIEthcmxtYW4gPGpv
bmFzQGt3aWJvby5zZT4KPiAgUjoJSmVybmVqIFNrcmFiZWMgPGplcm5lai5za3JhYmVjQHNpb2wu
bmV0Pgo+IAoKQWNrZWQtYnk6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNv
bT4KCldlbGNvbWUgdG8gdGhlIHRlYW0sIGhlbHAgaXMgbmVlZGVkICEKCk5laWwKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
