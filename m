Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B38A18110
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2019 22:27:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 538D0898E1;
	Wed,  8 May 2019 20:27:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C966898E1
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2019 20:27:24 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id k24so7637354qtq.7
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2019 13:27:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Y1oAL2e+nDxNSlN8Pn+qOcIb2+7Ea2X17YXpRqljKsI=;
 b=dJKHH0NSpXkxf0lPG80cKFAPE8LG8q4RanhoHEtjdH58tZktkzo1gfkzA1JzNCa8Ze
 64qOPB5vKzsle/0dEj6nILgGDUFtPdqdFFR80SxSzQbEXQdgh49akFFLrVrWiAx/9hfM
 GxKJRn0p1oX9xEMwqALZTG34A2Xw6c/8FWYNbs+zxVVU6noDu6f00XH7WyIZSdD1lAPk
 k4EyCwCxVByqvVj0ETh4tzMcg6/uelJpJf7hZASp/9yfEMm2bf39a422IrlA81r/L21K
 LbTw9IanpUbYFQCdgbfldOpnPwTlDP3EPX2niBJXf5wkDOPAzOQ4DFJ8VP1Ujt1hgRjd
 Tb8w==
X-Gm-Message-State: APjAAAVvUq4GaqY+VxC1Zd8bgSAwygNet00HoEQ+zmEvgYySmQ5D4MPI
 398mhGGYnR9inTBiLs+7fVdOZw==
X-Google-Smtp-Source: APXvYqxI348a5G44Us1OX3HYd/MQ95CBhXbRtWT/DUszb4SCQek/YD2KQUahgddFgYiOum1m0aUGCA==
X-Received: by 2002:ad4:4587:: with SMTP id x7mr164380qvu.192.1557347243293;
 Wed, 08 May 2019 13:27:23 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id n66sm9721679qkc.36.2019.05.08.13.27.22
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 08 May 2019 13:27:22 -0700 (PDT)
Date: Wed, 8 May 2019 16:27:21 -0400
From: Sean Paul <sean@poorly.run>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: No zap shader is not an error
Message-ID: <20190508202721.GL17077@art_vandelay>
References: <20190508130726.27557-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190508130726.27557-1-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Y1oAL2e+nDxNSlN8Pn+qOcIb2+7Ea2X17YXpRqljKsI=;
 b=JYS8nhvWxAfBtVu9xdrLwq3zymLBJolq7Z9h0ZdiIgsCPff2mlXK3P72whWTnh4qGo
 Ovg1aPAs0W8mSKgvaqdCikqOluGa84/dKcPAijH55blUXF4x6wpB06Gv7KbwF80938Wm
 XLa66QvaPs8fLJ/hTq3p38J3z9RxOCvASvTkW3wDhvZVGQRRP+YAd6Lo3RZywh5rIWIS
 +kpbU+4YKEaRU+N8OXKOx6Fx+ldPmplcErXwrt05qb3uuzpzvUSppLHPCPWX+4XRXvMP
 Iw5H+K1Em7mb34jBBW3APKQTwZr5vmROWfBMkWt6Ga/vrZ57PaRmMhjTJ88APBbAOYDj
 99+g==
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
PgoKQXMgZGlzY3Vzc2VkIG9uIElSQywgSSd2ZSBzdHVmZmVkIHRoaXMgaW4gLW1pc2MtbmV4dC1m
aXhlcyBmb3IgdGhlIG5leHQgUFIgSSdtCnNlbmRpbmcgb3V0LgoKU2VhbgoKPiAtLS0KPiAgZHJp
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
