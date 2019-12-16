Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FE0120F10
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 17:17:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 581306E05F;
	Mon, 16 Dec 2019 16:17:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B79616E05F
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 16:17:12 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id y17so7997891wrh.5
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 08:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=r3ZGFYVqEiHwYj/KwvD5Pu4+HTWz/KZ7Kiw/TxOn57I=;
 b=xbo/lwqOQy1FS7C+xsYSQcx5bgukzpffD2E22Gt2BGvjQIeMuv0YnpsfV8OlRk/c1l
 lUKBWCY89izvWtL2Li/GnK0jVcO43iIwYYs7qsAzvTxsADEWbW5yYZuEXMIdfm5DnExM
 6ri7EUiveI2iMptBammNBQI0/nmcfXVf8XIQsxCicVH0cGr6cXIuPfgCiyMeQaR90EL7
 2d82MtLPM7zZVM6FQil0MXXwM5f3v8ZfrSNnmcM8mRYr4i/VDi8V5yG9NbnIq5WJCi6J
 KWa06ztKcC9ETLPv7kwKNtrvE+Viu0W+R8Rd01swoaBcJYuP1tDb4BAHg0LrheAsUksJ
 4keA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=r3ZGFYVqEiHwYj/KwvD5Pu4+HTWz/KZ7Kiw/TxOn57I=;
 b=RyOIfKUAml/m7zMlAkoK8n9XswM0X6HnSQtgrKQWbvsAM3bInciIE+BEje21tZf+mu
 iPjlUorVkOJk1y2MXL9ql4Lw+aKNXzFQPzPu7OY5PIDOJ3SffS/xyUG6FsE1eNidcNwQ
 LvgkSwJMAPJCy2bgYAIslXyyW/UFwvbG30I3lR14SENlSEUlaepU3uwbpKOg5TOBvS5Q
 5fxpJsxBos7iIMmWgeNAdF7BwKfdCXzwczrOb1m7+SYEGDwULPMjeXgEaW+vuv+1CF62
 1y4MPpba2JFK7BcbvmSsqPHuZImM2l59MuzQtgtd5Nv/lqGdFh3QeE49gSUFiExbyech
 Cq6g==
X-Gm-Message-State: APjAAAVeyLXgP8mHuRJKupI9BEaQVz1WoqB6kmmBrO3ycA66XQHBqmQ0
 Kt9OhhREb60h3qXBvTIxZS++U6NIozg=
X-Google-Smtp-Source: APXvYqziVssigAv2YlptZeqjNq6fPlpxFmzjNGrhVJGnWBGQLzm5s6+4MSYn72RUTN5cM6L52pW9eQ==
X-Received: by 2002:adf:dfd2:: with SMTP id q18mr31049989wrn.152.1576513031335; 
 Mon, 16 Dec 2019 08:17:11 -0800 (PST)
Received: from dell ([185.17.149.202])
 by smtp.gmail.com with ESMTPSA id o66sm18121839wmo.20.2019.12.16.08.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2019 08:17:10 -0800 (PST)
Date: Mon, 16 Dec 2019 16:17:10 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH v2 3/6] mfd: atmel-hlcdc: add struct device member to
 struct atmel_hlcdc_regmap
Message-ID: <20191216161710.GO2369@dell>
References: <1576249496-4849-1-git-send-email-claudiu.beznea@microchip.com>
 <1576249496-4849-4-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1576249496-4849-4-git-send-email-claudiu.beznea@microchip.com>
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
Cc: alexandre.belloni@bootlin.com, bbrezillon@kernel.org, airlied@linux.ie,
 nicolas.ferre@microchip.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, ludovic.desroches@microchip.com,
 sam@ravnborg.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAxMyBEZWMgMjAxOSwgQ2xhdWRpdSBCZXpuZWEgd3JvdGU6Cgo+IEFkZCBzdHJ1Y3Qg
ZGV2aWNlIG1lbWJlciB0byBzdHJ1Y3QgYXRtZWxfaGxjZGNfcmVnbWFwIHRvIGJlCj4gYWJsZSB0
byB1c2UgZGV2XyooKSBzcGVjaWZpYyBsb2dnaW5nIGZ1bmN0aW9ucy4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAbWljcm9jaGlwLmNvbT4KPiAtLS0K
PiAgZHJpdmVycy9tZmQvYXRtZWwtaGxjZGMuYyB8IDMgKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKykKCkZvciBteSBvd24gcmVmZXJlbmNlOgogIEFja2VkLWZvci1NRkQtYnk6
IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CgotLSAKTGVlIEpvbmVzIFvmnY7nkLzm
lq9dCkxpbmFybyBTZXJ2aWNlcyBUZWNobmljYWwgTGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNv
dXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0
dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
