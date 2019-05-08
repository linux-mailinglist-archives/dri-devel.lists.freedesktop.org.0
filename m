Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAA217B95
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2019 16:35:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51530892A4;
	Wed,  8 May 2019 14:35:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A01F1892A4
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2019 14:35:49 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id o7so1349637qtp.4
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2019 07:35:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3CqV7qK/MYg0m3+i2Zpuf5DMfjvdX/UQG8imkRgo8G4=;
 b=eiLlA0yyejDxBya6R5dLXn5pi5TRgUeA3u9m9oxh9V4Kz1U0m1QwiOlVRXtSJDpKiS
 a6ZqPIoTADGiHBN0DwdScZNeJ2REjH2EgqCaXfLjRcMnzFcVHu4I0Cj9Or+rKsvJePyI
 AFeLO+kk7QKLGmUUYTW8+EmQSLAbaGotSMyS9zHp3QP6qqW80zWyiJRLOz1S9YSMS3RO
 KHjENBgp59yNKN7zHri7rZ8CkxvZp6cjDxyaxB6PllzDecmdqKC2mL6o0hyW7u1OBFAO
 ZDDFmk2PsR7qSeJx4UqDTvTjGPfNM5aNfvKbtKTRFGzb8uaViqjL2VQ0ZOI9E3/6ChVl
 zDHw==
X-Gm-Message-State: APjAAAXDbtrNMlK9YOWKytIkKVuirW6hiUcikLxD6U2FMuk3mvG08lY4
 fTYI5MbriM59EZN6yve9TwRzbKEzmyY=
X-Google-Smtp-Source: APXvYqwRXPijPs76WYJinxhIWtACNjsBn+EyW7O54bxbDoCzWVQhJluAtNSkYy2fL/8CdskcCrCziQ==
X-Received: by 2002:ad4:51c2:: with SMTP id p2mr14418052qvq.64.1557326148469; 
 Wed, 08 May 2019 07:35:48 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id s50sm10775869qts.39.2019.05.08.07.35.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 08 May 2019 07:35:47 -0700 (PDT)
Date: Wed, 8 May 2019 10:35:46 -0400
From: Sean Paul <sean@poorly.run>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: No zap shader is not an error
Message-ID: <20190508143546.GJ17077@art_vandelay>
References: <20190508130726.27557-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190508130726.27557-1-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=3CqV7qK/MYg0m3+i2Zpuf5DMfjvdX/UQG8imkRgo8G4=;
 b=Y7IdqX5SwtfUZhMC8Omj7ZnkfOutLCTgi99GUmAKTzJeA+tn5upJO2YMtJb0gbCT1a
 Ya/o8+LtVpEmBSX5gjKepenV9kfHwcVWfzyayXiH44+BpddsoK3sYXfePk/hMIYzczhG
 +CvJaScO1luWaIia9bjHEy0+TBUkVdOsjNMYDGElJtShKGzwb27gOyMdwjb47LPkYyTm
 8ZexTO4FrY/srB6LmYc/uaSkgX2RjwKflAdPOrQJTgF6fW3zPbgKGrhnily+9FjTR8Qk
 MwwZAvQqflQk3f9w6dAdUGbRQNtW5lx9PmJ4K7tc7uXjedIVZlN3fHMs/juLzjmlEAco
 j1Sg==
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMDgsIDIwMTkgYXQgMDY6MDY6NTJBTSAtMDcwMCwgUm9iIENsYXJrIHdyb3Rl
Ogo+IEZyb206IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPiAKPiBEZXBlbmRp
bmcgb24gcGxhdGZvcm0gZmlybXdhcmUsIGEgemFwIHNoYWRlciBtYXkgbm90IGJlIHJlcXVpcmVk
IHRvIHRha2UKPiB0aGUgR1BVIG91dCBvZiBzZWN1cmUgbW9kZSBvbiBib290LCBpbiB3aGljaCBj
YXNlIHdlIGNhbiBqdXN0IHdyaXRlCj4gUkJCTV9TRUNWSURfVFJVU1RfQ05UTCBkaXJlY3RseS4g
IFdoaWNoIHdlICptb3N0bHkqIGhhbmRsZWQsIGJ1dCBtaXNzZWQKPiBjbGVhcmluZyAncmV0JyBy
ZXN1bHRpbmcgdGhhdCBod19pbml0KCkgcmV0dXJuZWQgYW4gZXJyb3Igb24gdGhlc2UKPiBkZXZp
Y2VzLgo+IAo+IEZpeGVzOiBhYmNjYjlmZTMyNjcgZHJtL21zbS9hNnh4OiBBZGQgemFwIHNoYWRl
ciBsb2FkCj4gU2lnbmVkLW9mZi1ieTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3Jn
PgoKUmV2aWV3ZWQtYnk6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgoKPiAtLS0KPiAgZHJp
dmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9ncHUuYyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9h
ZHJlbm8vYTZ4eF9ncHUuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ3B1LmMK
PiBpbmRleCBlYzI0NTA4YjlkNjguLmU3NGRjZTQ3NDI1MCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dwdS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21z
bS9hZHJlbm8vYTZ4eF9ncHUuYwo+IEBAIC01MjcsNiArNTI3LDcgQEAgc3RhdGljIGludCBhNnh4
X2h3X2luaXQoc3RydWN0IG1zbV9ncHUgKmdwdSkKPiAgCQlkZXZfd2Fybl9vbmNlKGdwdS0+ZGV2
LT5kZXYsCj4gIAkJCSJaYXAgc2hhZGVyIG5vdCBlbmFibGVkIC0gdXNpbmcgU0VDVklEX1RSVVNU
X0NOVEwgaW5zdGVhZFxuIik7Cj4gIAkJZ3B1X3dyaXRlKGdwdSwgUkVHX0E2WFhfUkJCTV9TRUNW
SURfVFJVU1RfQ05UTCwgMHgwKTsKPiArCQlyZXQgPSAwOwo+ICAJfQo+ICAKPiAgb3V0Ogo+IC0t
IAo+IDIuMjAuMQo+IAoKLS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAv
IENocm9taXVtIE9TCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
