Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB8FE1ED5
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 17:05:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 511346EAFB;
	Wed, 23 Oct 2019 15:05:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BCCD6EAFB
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 15:05:22 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1iNICN-0001DX-M0; Wed, 23 Oct 2019 17:05:19 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1iNICM-0003oD-0j; Wed, 23 Oct 2019 17:05:18 +0200
Date: Wed, 23 Oct 2019 17:05:17 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] backlight: pwm_bl: configure pwm only once per backlight
 toggle
Message-ID: <20191023150517.u4hmnd6m4qyshu6q@pengutronix.de>
References: <20191017120917.fcb7x4fq4tbl2iat@pengutronix.de>
 <20191017125932.GB3768303@ulmo>
 <aa73b430-527c-8066-ad9c-edab62a05fc9@ysoft.com>
 <20191017151437.GA85210@ulmo>
 <CAHCN7xJduG9yxAhuW6D1_kpd5=p7LhO_YCWjVxcCoW5bmSEJGQ@mail.gmail.com>
 <20191017171326.GA531411@ulmo>
 <CAHCN7xJWco5gTdjmJZRbNqi1aO+ytor5XMJWQX8a38tfGbz+xg@mail.gmail.com>
 <f6d2427d-21fe-e89c-0bfe-572bc1d00863@ysoft.com>
 <CAHCN7xJJH12sdeLb97OutJqThv+TzMaNj-Y50_C9G7UgEQCbxg@mail.gmail.com>
 <CAOMZO5AgUjA8eSNVM_rKi-7NAX8hj039STcJ4Ov4w-0m4WTf8w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOMZO5AgUjA8eSNVM_rKi-7NAX8hj039STcJ4Ov4w-0m4WTf8w@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
 Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sascha Hauer <kernel@pengutronix.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Lee Jones <lee.jones@linaro.org>, Adam Ford <aford173@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMjMsIDIwMTkgYXQgMTE6MjM6MTFBTSAtMDMwMCwgRmFiaW8gRXN0ZXZhbSB3
cm90ZToKPiBPbiBXZWQsIE9jdCAyMywgMjAxOSBhdCAxMToxNiBBTSBBZGFtIEZvcmQgPGFmb3Jk
MTczQGdtYWlsLmNvbT4gd3JvdGU6Cj4gCj4gPiBXaGF0IGlzIHRoZSBwbGFuIHRvIGFkZHJlc3Mg
dGhlIHJlZ3Jlc3Npb24gZm9yIDUuND8gIEkgd2Fzbid0IHN1cmUgaWYKPiA+IHdlJ3JlIGdvaW5n
IHRvIGFwcGx5IHRoZSBpLm14IGZpeGVzIG9yIHRlbXBvcmFyaWx5IHJldmVydCB0aGUKPiA+IG9m
ZmVuZGluZyBwYXRjaCwgb3Igc29tZXRoaW5nIGVsc2UuIChvciBtYXliZSBub3RoaW5nIGF0IGFs
bCkKPiAKPiBZZXMsIEkgZG8gc2VlIHRoZSByZWdyZXNzaW9uIG9uIGEgaW14NTMgYm9hcmQgd2l0
aCA1LjQtcmMgdG9vIGFuZCBhbHNvCj4gaW50ZXJlc3RlZCBvbiBhIGZpeC4KClRoaWVycnkgYWxy
ZWFkeSBzZW50IGEgcmV2ZXJ0IG9mIG15IGNoYW5nZSB0byB0aGUgbGlzdC4gV2Ugb25seQpkaXNj
dXNzZWQgdGhlIHdvcmRpbmcgc2hvcnRseSBhbmQgSSBleHBlY3QgdGhhdCB0aGlzIHJldmVydCB3
aWxsIG1ha2UgaXQKaW50byA1LjQuCgpCZXN0IHJlZ2FyZHMKVXdlCgotLSAKUGVuZ3V0cm9uaXgg
ZS5LLiAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgVXdlIEtsZWluZS1Lw7ZuaWcgICAgICAg
ICAgICB8CkluZHVzdHJpYWwgTGludXggU29sdXRpb25zICAgICAgICAgICAgICAgICB8IGh0dHA6
Ly93d3cucGVuZ3V0cm9uaXguZGUvICB8Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
