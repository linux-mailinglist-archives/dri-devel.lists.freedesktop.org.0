Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 144D1A530B
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 11:41:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 331CA8980C;
	Mon,  2 Sep 2019 09:41:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9C3B8980C
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 09:41:28 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id l11so4472880wrx.5
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 02:41:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=h2Js6ck3D0UcikM7wY4O7TjuGNb/yewcebe0HVIWGVI=;
 b=LYTmhejElH16RAPF8lk3goqI8+RhIyXwuWZ6HlZ9g2OlTiahQ5/AFFF5ceFun1JwaJ
 bRLQKX0NA2H46Sxx8XaLKQEebJC/l8MlDp0dgJdtvGlW9Diau4IuSlm4hDCe6S/xqq1b
 dyNwyslc4YSf2nhDl/T4jSOAQ85VuLkyaLy01jND5j0gJFzbb55LyAKVSgUI8nb/z5Av
 I+AfXnTc04Wz0zxdiX/Y1X/3cXzI0jqWTrqGttSIrPLPdi06f7zTy8HGEmApdWw3HU43
 02VqDd6VeOpu2V+IcmVWZvIclyhmoir80r2t3y1DDP0TTfeSjc/YTbyiABjBXeZy9P82
 wD5A==
X-Gm-Message-State: APjAAAWWn+/k/J6vyiHjDSmebAmkv/TUNp2DQXAWW905WEJumSNDbRNm
 5xndeobY/AKkOduJfiSlmXgM2A==
X-Google-Smtp-Source: APXvYqzkKuhIC5ceSL2MqksiJo+nl+juinzoBL6gv5vjR2DoMcJVpuf7UEULPjzSEYwJ3tB+sKZ3Hg==
X-Received: by 2002:adf:bace:: with SMTP id w14mr36779064wrg.283.1567417287276; 
 Mon, 02 Sep 2019 02:41:27 -0700 (PDT)
Received: from dell ([95.147.198.93])
 by smtp.gmail.com with ESMTPSA id l20sm11130924wrb.61.2019.09.02.02.41.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 02 Sep 2019 02:41:26 -0700 (PDT)
Date: Mon, 2 Sep 2019 10:41:25 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v3 1/4] MAINTAINERS: Add entry for stable backlight sysfs
 ABI documentation
Message-ID: <20190902094125.GL32232@dell>
References: <20190709190007.91260-1-mka@chromium.org>
 <20190709190007.91260-2-mka@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190709190007.91260-2-mka@chromium.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=h2Js6ck3D0UcikM7wY4O7TjuGNb/yewcebe0HVIWGVI=;
 b=IOJ6QyqKfV+Hn6dfHFS8VoI5kBFRJjPBRY+dx4Yb4MfdW3phxnyHIhL0fGu/EhWgQu
 SIQu6UvnMMp+UA442ybHMp4KX2Ny2Ni02sAfWv5YY00VCfm77lS2WogHJCv3Hn+EfU0X
 /sV15ifCB3BoEK3u3ejE+TlSTUQW/JtMM6nSaMmrll/a6lucI2DBikWSb5O3XHwnwLTz
 OJ/a3ZB0AXMNFuAgOMrpFUAWWPUSH6pGo0bV+d2a4d0UEr+H39lgwOUS73hSZcl2tyux
 xbUow1z61D1QEge+o3r80ODMyFZ1RdI084qGulClFTRdu3FSd9wWVn26sobjSUzIKrIu
 sPhA==
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
Cc: linux-pwm@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Brian Norris <briannorris@chromium.org>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAwOSBKdWwgMjAxOSwgTWF0dGhpYXMgS2FlaGxja2Ugd3JvdGU6Cgo+IEFkZCBhbiBl
bnRyeSBmb3IgdGhlIHN0YWJsZSBiYWNrbGlnaHQgc3lzZnMgQUJJIHRvIHRoZSBNQUlOVEFJTkVS
Uwo+IGZpbGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWF0dGhpYXMgS2FlaGxja2UgPG1rYUBjaHJv
bWl1bS5vcmc+Cj4gQWNrZWQtYnk6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxp
bmFyby5vcmc+Cj4gLS0tCj4gQ2hhbmdlcyBpbiB2MzoKPiAtIG5vbmUKPiAKPiBDaGFuZ2VzIGlu
IHYyOgo+IC0gYWRkZWQgRGFuaWVsJ3MgJ0Fja2VkLWJ5JyB0YWcKPiAtLS0KPiAgTUFJTlRBSU5F
UlMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpBcHBsaWVkLCB0aGFu
a3MuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCkxpbmFybyBTZXJ2aWNlcyBUZWNobmljYWwg
TGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKRm9s
bG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
