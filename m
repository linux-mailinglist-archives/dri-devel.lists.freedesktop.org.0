Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0762CD0E0
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 09:15:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5597F6E0AA;
	Thu,  3 Dec 2020 08:14:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77CAE6EA2A
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Dec 2020 15:01:53 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 3so8820208wmg.4
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Dec 2020 07:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wCxT7QSABY+FrHWg7o6I+Pegp/1kG+37hvn92Koh8mY=;
 b=IwPAUqLTwiLMpK2JWdu4paO6qWlQtpp62tp7Uyw7W2HjLYqwYqwowmc/rZnQBLn6tG
 Z4gIVcDcsEv++cjz48F7JPtjxp84mQzUSbId70oXIJsB57VjU6K5Pc3Mp+UCAZFdDMye
 A/yFuQfxSbScA1144Admg+5wCSzGGjcjzt99kH2V39FxyPj8Gg3UZ99509fxCMXCeRCP
 5ky7y12H0J2qir8MIPXX+qu0v1PT8zCvl98WVl0L9rZZ0+R2odXlU0/hI1N8rjSJcZtk
 HmWSB7VTZdI5fAV6GKZcXUvXrwoYO1O4PiFvqKoXdrw5eGH5rKhJkJ9WWDYVHGu+zAtJ
 tHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wCxT7QSABY+FrHWg7o6I+Pegp/1kG+37hvn92Koh8mY=;
 b=PH/Whhn1AkZKSZFwd3d0BIWl+qP47iLDpzmnpITtwc8pwzkowUah7vxrTmSPJulP1U
 mfGbX1WqfyTVaUsjDYi31TbDtaLwaG6LV2efrcisVFJFUEnqqO14vmS0C6Z2HSCm+u52
 UerRDz43dkgDNZFqFlhd0ZnULfomrQbVkWKyX7ute3msEvLNTHMZ7/wiTQ9a+uKFAW5Y
 5O0y5BbTZXgwX4udkOrKGfNFvQqC6lGhT6586XYBUs59JUAuMUFcGAVdJozld4zaP3fu
 Z24PYyhR/fGOftFRcXhXWSO7Xdtj85Q2JcRYiYhwz44+u2gA/+oJv+6XwUTOw3+/prlR
 C/sQ==
X-Gm-Message-State: AOAM530OSpx1qVustGi3gm/AVlihA50szGIg0NSUPIYijuCnv4jN0Tlv
 9NzejN9onybNdxbehYFx0WP3NA==
X-Google-Smtp-Source: ABdhPJwUFaN3Mkut9/f0dARotHECT9w4RzfSAPkxQ9jRp9JjLsOwf0QtrfoW3U/0Y5AlE9TBmNoiZg==
X-Received: by 2002:a1c:2e16:: with SMTP id u22mr3598698wmu.149.1606921311766; 
 Wed, 02 Dec 2020 07:01:51 -0800 (PST)
Received: from [192.168.43.23] ([37.172.217.20])
 by smtp.googlemail.com with ESMTPSA id l16sm2371592wrx.5.2020.12.02.07.01.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Dec 2020 07:01:51 -0800 (PST)
Subject: Re: [PATCH v2 0/5] Thermal devfreq cooling improvements with Energy
 Model
To: Lukasz Luba <lukasz.luba@arm.com>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20201118120358.17150-1-lukasz.luba@arm.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <dcc7e2fe-9ffb-0c81-c4df-e5b7874ebfd5@linaro.org>
Date: Wed, 2 Dec 2020 16:01:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201118120358.17150-1-lukasz.luba@arm.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 03 Dec 2020 08:14:41 +0000
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
Cc: amit.kucheria@verdurent.com, airlied@linux.ie, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, rui.zhang@intel.com, ionela.voinescu@arm.com,
 orjan.eide@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTgvMTEvMjAyMCAxMzowMywgTHVrYXN6IEx1YmEgd3JvdGU6Cj4gSGkgYWxsLAo+IAo+IFRo
aXMgcGF0Y2ggc2V0IGlzIGEgY29udGludWF0aW9uIG9mIG15IHByZXZpb3VzIHdvcmssIHdoaWNo
IGFpbWVkCj4gdG8gYWRkIEVuZXJneSBNb2RlbCB0byBhbGwgZGV2aWNlcy4gVGhpcyBzZXJpZXMg
aXMgYSBmb2xsb3cgdXAKPiBmb3IgdGhlIHBhdGNoZXMgd2hpY2ggZ290IG1lcmdlZCB0byB2NS45
LXJjMS4gSXQgYWltcyB0byBjaGFuZ2UKPiB0aGUgdGhlcm1hbCBkZXZmcmVxIGNvb2xpbmcgYW5k
IHVzZSB0aGUgRW5lcmd5IE1vZGVsIGluc3RlYWQgb2YKPiBwcml2YXRlIHBvd2VyIHRhYmxlIGFu
ZCBzdHJ1Y3R1cmVzLiBUaGUgbmV3IHJlZ2lzdHJhdGlvbiBpbnRlcmZhY2UKPiBpbiB0aGUgcGF0
Y2ggMy81IGhlbHBzIHRvIHJlZ2lzdGVyIGRldmZyZXEgY29vbGluZyBhbmQgdGhlIEVNIGluIG9u
ZQo+IGNhbGwuIFRoZXJlIGlzIGFsc28gYW5vdGhlciBpbXByb3ZlbWVudCwgcGF0Y2ggMi81IGlz
IGNoYW5naW5nIHRoZQo+IHdheSBob3cgdGhlcm1hbCBnZXRzIHRoZSBkZXZpY2Ugc3RhdHVzLiBO
b3cgaXQncyB0YWtlbiBvbiBkZW1hbmQKPiBhbmQgc3RvcmVkIGFzIGEgY29weS4gVGhlIGxhc3Qg
cGF0Y2ggd291bGRuJ3QgZ28gdGhyb3VnaCB0aGVybWFsIHRyZWUsCj4gYnV0IGl0J3MgaGVyZSBm
b3IgY29uc2lzdGVuY3kuCgpUaGUgcGF0Y2ggNS81IGlzIHJldmlld2VkIGJ5IHRoZSBtYWludGFp
bmVycy4gSWYgdGhleSBhZ3JlZSwgSSBjYW4gYXBwbHkKdGhlIHBhdGNoIHdpdGggdGhpcyBzZXJp
ZXMuCgoKLS0gCjxodHRwOi8vd3d3LmxpbmFyby5vcmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNv
dXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKCkZvbGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5m
YWNlYm9vay5jb20vcGFnZXMvTGluYXJvPiBGYWNlYm9vayB8CjxodHRwOi8vdHdpdHRlci5jb20v
IyEvbGluYXJvb3JnPiBUd2l0dGVyIHwKPGh0dHA6Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxv
Zy8+IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
