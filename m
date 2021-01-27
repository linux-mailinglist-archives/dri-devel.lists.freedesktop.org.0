Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA7F30558B
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 09:23:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D73EF6E5AE;
	Wed, 27 Jan 2021 08:23:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 614 seconds by postgrey-1.36 at gabe;
 Wed, 27 Jan 2021 08:23:14 UTC
Received: from mail.mleia.com (mleia.com [178.79.152.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB826E5B0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 08:23:14 +0000 (UTC)
Received: from mail.mleia.com (localhost [127.0.0.1])
 by mail.mleia.com (Postfix) with ESMTP id 9227042EB56;
 Wed, 27 Jan 2021 08:12:58 +0000 (UTC)
Subject: Re: [PATCH v3 4/5] amba: Make the remove callback return void
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20210126165835.687514-1-u.kleine-koenig@pengutronix.de>
 <20210126165835.687514-5-u.kleine-koenig@pengutronix.de>
From: Vladimir Zapolskiy <vz@mleia.com>
Message-ID: <b9bfa80b-ed5f-50f9-de50-76090007556c@mleia.com>
Date: Wed, 27 Jan 2021 10:12:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210126165835.687514-5-u.kleine-koenig@pengutronix.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20210127_081258_639999_D23EB9E2 
X-CRM114-Status: GOOD (  14.44  )
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>, linux-rtc@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>, Russell King <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, Mike Leach <mike.leach@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 coresight@lists.linaro.org, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>,
 linux-fbdev@vger.kernel.org, Matt Mackall <mpm@selenic.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>,
 linux-watchdog@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Leo Yan <leo.yan@linaro.org>,
 dmaengine@vger.kernel.org, alsa-devel@alsa-project.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMS8yNi8yMSA2OjU4IFBNLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBBbGwgYW1iYSBk
cml2ZXJzIHJldHVybiAwIGluIHRoZWlyIHJlbW92ZSBjYWxsYmFjay4gVG9nZXRoZXIgd2l0aCB0
aGUKPiBkcml2ZXIgY29yZSBpZ25vcmluZyB0aGUgcmV0dXJuIHZhbHVlIGFueWhvdywgaXQgZG9l
c24ndCBtYWtlIHNlbnNlIHRvCj4gcmV0dXJuIGEgdmFsdWUgaGVyZS4KPiAKPiBDaGFuZ2UgdGhl
IHJlbW92ZSBwcm90b3R5cGUgdG8gcmV0dXJuIHZvaWQsIHdoaWNoIG1ha2VzIGl0IGV4cGxpY2l0
IHRoYXQKPiByZXR1cm5pbmcgYW4gZXJyb3IgdmFsdWUgZG9lc24ndCB3b3JrIGFzIGV4cGVjdGVk
LiBUaGlzIHNpbXBsaWZpZXMgY2hhbmdpbmcKPiB0aGUgY29yZSByZW1vdmUgY2FsbGJhY2sgdG8g
cmV0dXJuIHZvaWQsIHRvby4KPiAKPiBSZXZpZXdlZC1ieTogVWxmIEhhbnNzb24gPHVsZi5oYW5z
c29uQGxpbmFyby5vcmc+Cj4gUmV2aWV3ZWQtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIu
ZGU+Cj4gQWNrZWQtYnk6IEFsZXhhbmRyZSBCZWxsb25pIDxhbGV4YW5kcmUuYmVsbG9uaUBib290
bGluLmNvbT4KPiBBY2tlZC1ieTogRG1pdHJ5IFRvcm9raG92IDxkbWl0cnkudG9yb2tob3ZAZ21h
aWwuY29tPgo+IEFja2VkLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+
ICMgZm9yIGRyaXZlcnMvbWVtb3J5Cj4gQWNrZWQtYnk6IE1hcmsgQnJvd24gPGJyb29uaWVAa2Vy
bmVsLm9yZz4KPiBBY2tlZC1ieTogRG1pdHJ5IFRvcm9raG92IDxkbWl0cnkudG9yb2tob3ZAZ21h
aWwuY29tPgo+IEFja2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5v
cmc+Cj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0Bw
ZW5ndXRyb25peC5kZT4KCkZvciBkcml2ZXJzL21lbW9yeS9wbDE3Mi5jOgoKQWNrZWQtYnk6IFZs
YWRpbWlyIFphcG9sc2tpeSA8dnpAbWxlaWEuY29tPgoKLS0KQmVzdCB3aXNoZXMsClZsYWRpbWly
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
