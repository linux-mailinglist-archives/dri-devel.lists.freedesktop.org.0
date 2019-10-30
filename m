Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 146B5EAC40
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 10:05:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AE636EDF4;
	Thu, 31 Oct 2019 09:04:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp08.smtpout.orange.fr
 [80.12.242.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 281156EB90
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 21:10:54 +0000 (UTC)
Received: from belgarion ([90.55.204.252]) by mwinf5d15 with ME
 id KxAo210045TFNlm03xAoN2; Wed, 30 Oct 2019 22:10:52 +0100
X-ME-Helo: belgarion
X-ME-Auth: amFyem1pay5yb2JlcnRAb3JhbmdlLmZy
X-ME-Date: Wed, 30 Oct 2019 22:10:52 +0100
X-ME-IP: 90.55.204.252
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 38/46] video: backlight: tosa: use gpio lookup table
References: <20191018154052.1276506-1-arnd@arndb.de>
 <20191018154201.1276638-38-arnd@arndb.de>
X-URL: http://belgarath.falguerolles.org/
Date: Wed, 30 Oct 2019 22:10:48 +0100
In-Reply-To: <20191018154201.1276638-38-arnd@arndb.de> (Arnd Bergmann's
 message of "Fri, 18 Oct 2019 17:41:53 +0200")
Message-ID: <87h83qlz1j.fsf@belgarion.home>
User-Agent: Gnus/5.130008 (Ma Gnus v0.8) Emacs/26 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 31 Oct 2019 09:04:21 +0000
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 dri-devel@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Daniel Mack <daniel@zonque.org>,
 linux-fbdev@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4gd3JpdGVzOgoKPiBUaGUgZHJpdmVyIHNob3Vs
ZCBub3QgcmVxdWlyZSBhIG1hY2hpbmUgc3BlY2lmaWMgaGVhZGVyLiBDaGFuZ2UKPiBpdCB0byBw
YXNzIHRoZSBncGlvIGxpbmUgdGhyb3VnaCBhIGxvb2t1cCB0YWJsZSwgYW5kIG1vdmUgdGhlCj4g
dGltaW5nIGdlbmVyYXRvciBkZWZpbml0aW9ucyBpbnRvIHRoZSBkcml2ZXJzIGl0c2VsZi4KPgo+
IENjOiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+IENjOiBEYW5pZWwgVGhvbXBz
b24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgo+IENjOiBKaW5nb28gSGFuIDxqaW5nb29o
YW4xQGdtYWlsLmNvbT4KPiBDYzogQmFydGxvbWllaiBab2xuaWVya2lld2ljeiA8Yi56b2xuaWVy
a2llQHNhbXN1bmcuY29tPgo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4g
Q2M6IGxpbnV4LWZiZGV2QHZnZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVy
Z21hbm4gPGFybmRAYXJuZGIuZGU+Cj4KPiAtLS0KPiBJJ20gbm90IG92ZXJseSBjb25maWRlbnQg
dGhhdCBJIGdvdCB0aGUgY29ycmVjdCBkZXZpY2UgbmFtZXMKPiBmb3IgdGhlIGxvb2t1cCB0YWJs
ZSwgaXQgd291bGQgYmUgZ29vZCBpZiBzb21lb25lIGNvdWxkCj4gZG91YmxlLWNoZWNrLgpBaCB0
aGUgSTJDIGFuZCBTUEkgZGV2aWNlcyBxdWVycnlpbmcgR1BJT3MgLi4uIHVubGVzcyBzb21lb25l
IGRvZXMgYW4gYWN0dWFsCnRlc3QsIHRoaXMgd2lsbCBwcm9iYWJseSBiZSB2ZXJ5IHJlZ3Jlc3Np
b24gcHJvbmUgLi4uCgpBbnl3YXkgOgpBY2tlZC1ieTogUm9iZXJ0IEphcnptaWsgPHJvYmVydC5q
YXJ6bWlrQGZyZWUuZnI+CgpDaGVlcnMuCgotLQpSb2JlcnQKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
