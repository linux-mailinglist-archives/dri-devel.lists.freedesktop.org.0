Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2EA345B23
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 10:43:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD89E6E87D;
	Tue, 23 Mar 2021 09:43:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 604486E87D
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 09:43:18 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id l18so14477517edc.9
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 02:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=0hkbYACOMfkrmU9Itv7aBZoZaQN614rwNKXnBs92y0U=;
 b=KFK7Gl6Loz5yCvngMmCyE/TcVpLAju6hCgi8R6DLg/KHgWlEvE0PmzfRnJByr6f1dz
 y1JF5RZjDJumy3xAkwhWz1LkOa9b1w3jXof53gbR7gRw4PcDJBhoC2SbKsKsQ3NraBkX
 oj/WRAdbq1BTlNYCgbY6SsaZzTWabF9u7JN986LiHT98xbkcQsCjKui3PWoAN6QOkqIx
 LFP2D2GOjHRk4bdSI5RwZsZwau1ta9+kMzTD8+nHII+bFvg1e7JYNP1KjyEdNrdJfQX6
 eKipxfAVe3VDY1D4NrXIC6A22Jyn5KTg6jxLq1LcjuFu5EJcFZnt/4QqfND3c6UrhIkw
 qhIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=0hkbYACOMfkrmU9Itv7aBZoZaQN614rwNKXnBs92y0U=;
 b=Gc8rC2toMlC1ApHDVIORZB6XsZ67tx5d5vTsC2Y3M2fUUx7ufe8rYqWjusuNac2r4L
 v5pEo7+yXP0Z8UVk2MbBWslOwRh+xKWwynkt0BxlxQb5TWmmT3cI8xfjNga3rMBuLWLo
 MCBt/uvr/qGCWxDvOgJ7fuc3hgzYGn6YqZR0EyGC8GemDTZKDIlfOb/a0ZhIpwBIzW3C
 VfNSQ8Io3LeDpUA8GDT3Hm5g6/0vNewNtyQwaSSURVRjA+zlH3ki14HqXAABYEcVJYpg
 jyAFwhwKidH61XdrG6AqgRp5897GSLSoLiO3XKYEtayXW8/UKpEc9+d8nbRabxBkk9UY
 52xw==
X-Gm-Message-State: AOAM530Pubpt0YA7ax/13Bk2MlTnmCvyNmbHzRoysbDvJwsiRLVVsxKM
 pyeFyP56JqvEThaYB/02LjSKbw==
X-Google-Smtp-Source: ABdhPJwfXBUZdaB1Qmf/e0goN/7hGlbXHdwvzBP8U1kMkO9nlQ2EQtfMy25rK2nJlLpWfLzwSL+1cw==
X-Received: by 2002:a05:6402:1d19:: with SMTP id
 dg25mr3789557edb.218.1616492597099; 
 Tue, 23 Mar 2021 02:43:17 -0700 (PDT)
Received: from dell ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id s9sm12075958edd.16.2021.03.23.02.43.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 02:43:16 -0700 (PDT)
Date: Tue, 23 Mar 2021 09:43:14 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] backlight: journada720: fix Wmisleading-indentation
 warning
Message-ID: <20210323094314.GV2916463@dell>
References: <20210322164134.827091-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210322164134.827091-1-arnd@kernel.org>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Richard Purdie <rpurdie@linux.intel.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMiBNYXIgMjAyMSwgQXJuZCBCZXJnbWFubiB3cm90ZToKCj4gRnJvbTogQXJuZCBC
ZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPiAKPiBXaXRoIGdjYy0xMSwgd2UgZ2V0IGEgd2Fybmlu
ZyBhYm91dCBjb2RlIHRoYXQgbG9va3MgY29ycmVjdAo+IGJ1dCBiYWRseSBpbmRlbnRlZDoKPiAK
PiBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9qb3JuYWRhNzIwX2JsLmM6IEluIGZ1bmN0aW9uIOKA
mGpvcm5hZGFfYmxfdXBkYXRlX3N0YXR1c+KAmToKPiBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9q
b3JuYWRhNzIwX2JsLmM6NjY6MTE6IGVycm9yOiB0aGlzIOKAmGVsc2XigJkgY2xhdXNlIGRvZXMg
bm90IGd1YXJkLi4uIFstV2Vycm9yPW1pc2xlYWRpbmctaW5kZW50YXRpb25dCj4gICAgNjYgfCAg
ICAgICAgIH0gZWxzZSAgLyogdHVybiBvbiBiYWNrbGlnaHQgKi8KPiAgICAgICB8ICAgICAgICAg
ICBefn5+Cj4gCj4gQ2hhbmdlIHRoZSBmb3JtYXR0aW5nIGFjY29yZGluZyB0byBvdXIgbm9ybWFs
IGNvbnZlbnRpb25zLgo+IAo+IEZpeGVzOiAxM2E3YjVkYzBkMTcgKCJiYWNrbGlnaHQ6IEFkZHMg
SFAgSm9ybmFkYSA3MDAgc2VyaWVzIGJhY2tsaWdodCBkcml2ZXIiKQo+IFNpZ25lZC1vZmYtYnk6
IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gLS0tCj4gIGRyaXZlcnMvdmlkZW8vYmFj
a2xpZ2h0L2pvcm5hZGE3MjBfYmwuYyB8IDQ0ICsrKysrKysrKysrKy0tLS0tLS0tLS0tLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQoKQXBwbGll
ZCwgdGhhbmtzLgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpTZW5pb3IgVGVjaG5pY2FsIExl
YWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdh
cmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
