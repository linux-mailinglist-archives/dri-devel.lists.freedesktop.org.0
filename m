Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABC935ECF9
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 08:13:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 409AD6E448;
	Wed, 14 Apr 2021 06:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F8586E448
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 06:13:12 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id g9so2616878wrx.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 23:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=s/qsaNKElXIqYcGQ3D9DhLtEdzKDUnrwltbMdfbQlx0=;
 b=z5yWzlbbBA5oiAa5E9YPhUpCjJps/8D8DoXo7AUo//kcHKxstSr1W3PiGiDYTBfRc0
 rpoaVDTVB6EWoyuen2alnsuMoBphaebFgJj4YipbWNxMv8KszEayslHsoKRaFOzXAe5L
 GHkVacYvI7DOQhkXxe2CvB0riGW0reg6A3T4sb/dmljJN+Hk7DBVhYMeMkP2rg0QiQcY
 4xi9Vwu/T9ZWqYieGF962BtTz7wNnwm0G6axLl2KhYYhfnhRSpMmg4zl6fntOCNORNfB
 3Zsti8DyeRAbksoa4aNJBMfeqR6X9lMz53VkTycJg5ifitXmVeYGb8dhNvKW/hku4CpX
 xocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=s/qsaNKElXIqYcGQ3D9DhLtEdzKDUnrwltbMdfbQlx0=;
 b=RhYnR8aB+aDTOl0gXNsDrX9ftZykyTdPFLvv/RoGSE2x4Zc7GA4LiVMvH97cSwXKqf
 o2FPRCCIc4w8JnSeGW2m63XtvhI3VSFhQ9balfcbuOE2C0GqtqYvysOOifnFFeybclyX
 BNd9ziOEHIk05Qx1r8zFL5wn6mSV6IOhxH/afGcgOUK4M0sjK5zBE/YvfW1xitZqgP7y
 kfurAQqyAiiGC8oEAn5RytBnUomh0TYBHZH0nxfUG/kbvdz1agm/rNAu9eYKCAhDyg7o
 jVaHyEMBSxlBqtFd7C6FPp5grQcZAJejE7XItMRQ9z7tNivKC102pDUQnxDwZcs7tZiN
 fRIQ==
X-Gm-Message-State: AOAM530DSlubaxYeiUEs5x3AZWpVIzJbKP1nel54ieAFEiYJ1EIlS/bH
 ptssYiTGqghG2OIUPuTqNEaEPg==
X-Google-Smtp-Source: ABdhPJwtomDmRAYyV/PE1J2o23D5cj/StMzlkJ7UI2FhKySrxYRdf2Mp0Id9tFDETM2GCVkQPT+JuQ==
X-Received: by 2002:a5d:4312:: with SMTP id h18mr40293249wrq.193.1618380790874; 
 Tue, 13 Apr 2021 23:13:10 -0700 (PDT)
Received: from Armstrongs-MacBook-Pro.local
 ([2a01:e0a:90c:e290:29e7:a4d9:c2b0:1adc])
 by smtp.gmail.com with ESMTPSA id l13sm4324434wmj.3.2021.04.13.23.13.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Apr 2021 23:13:10 -0700 (PDT)
Subject: Re: [PATCH v3 2/3] drm: bridge: add it66121 driver
To: Robert Foss <robert.foss@linaro.org>
References: <20210412154648.3719153-1-narmstrong@baylibre.com>
 <20210412154648.3719153-3-narmstrong@baylibre.com>
 <CAG3jFysFb+y6ymXsBQatuwtPEYRTBnWTku0EpmNyR2gR5a=Y2w@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <3266977b-9d19-c81d-6fd7-b6fa0714b1ef@baylibre.com>
Date: Wed, 14 Apr 2021 08:13:08 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAG3jFysFb+y6ymXsBQatuwtPEYRTBnWTku0EpmNyR2gR5a=Y2w@mail.gmail.com>
Content-Language: fr
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
Cc: Phong LE <ple@baylibre.com>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, paul@crapouillou.net,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iLAoKTGUgMTMvMDQvMjAyMSDDoCAyMjoyMSwgUm9iZXJ0IEZvc3MgYSDDqWNyaXTCoDoK
PiBIZXkgTmVpbCAmIFBob25nLAo+IAo+IFRoYW5rcyBmb3Igc3VibWl0dGluZyB0aGlzIHNlcmll
cyEKPiAKPj4gKwo+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fYnJpZGdlX2Z1bmNzIGl0NjYx
MjFfYnJpZGdlX2Z1bmNzID0gewo+PiArICAgICAgIC5hdHRhY2ggPSBpdDY2MTIxX2JyaWRnZV9h
dHRhY2gsCj4+ICsgICAgICAgLmVuYWJsZSA9IGl0NjYxMjFfYnJpZGdlX2VuYWJsZSwKPj4gKyAg
ICAgICAuZGlzYWJsZSA9IGl0NjYxMjFfYnJpZGdlX2Rpc2FibGUsCj4+ICsgICAgICAgLm1vZGVf
c2V0ID0gaXQ2NjEyMV9icmlkZ2VfbW9kZV9zZXQsCj4+ICsgICAgICAgLm1vZGVfdmFsaWQgPSBp
dDY2MTIxX2JyaWRnZV9tb2RlX3ZhbGlkLAo+PiArICAgICAgIC5kZXRlY3QgPSBpdDY2MTIxX2Jy
aWRnZV9kZXRlY3QsCj4+ICsgICAgICAgLmdldF9lZGlkID0gaXQ2NjEyMV9icmlkZ2VfZ2V0X2Vk
aWQsCj4+ICsgICAgICAgLmF0b21pY19nZXRfb3V0cHV0X2J1c19mbXRzID0gaXQ2NjEyMV9icmlk
Z2VfYXRvbWljX2dldF9vdXRwdXRfYnVzX2ZtdHMsCj4+ICsgICAgICAgLmF0b21pY19nZXRfaW5w
dXRfYnVzX2ZtdHMgPSBpdDY2MTIxX2JyaWRnZV9hdG9taWNfZ2V0X2lucHV0X2J1c19mbXRzLAo+
PiArfTsKPiAKPiBJIHdvdWxkIGxpa2UgdG8gc2VlIGFuIGltcGxlbWVudGF0aW9uIG9mIEhQRCwg
c2luY2UgaXQgaXMgc3VwcG9ydGVkIGJ5Cj4gdGhlIGhhcmR3YXJlWzFdIChhbmQgcmVxdWlyZWQg
YnkgdGhlIGRvY3VtZW50YXRpb24pLiBJUlEgc3RhdHVzIGJpdCAwCj4gc2VlbXMgdG8gYmUgdGhl
IHJlc3BvbnNpYmxlIGZvciBub3RpZnlpbmcgdXMgYWJvdXQgaG90IHBsdWcgZGV0ZWN0aW9uCj4g
ZXZlbnRzLgoKSXQncyBpbXBsZW1lbnRlZCBpbiB0aGUgSVJRIGhhbmRsZXIgd2l0aCB0aGUgSVQ2
NjEyMV9JTlRfU1RBVFVTMV9IUERfU1RBVFVTIGV2ZW50LgoKTmVpbAoKPiAKPiBbMV0gaHR0cHM6
Ly9yb2NrY2hpcC5mci9yYWR4YS9JVDY2MTIxX1Byb2dyYW1taW5nX0d1aWRlLnYxLjA1LnBkZgo+
IAo+IAo+IFJvYi4KPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
