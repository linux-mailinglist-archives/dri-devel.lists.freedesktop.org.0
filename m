Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 433E430004E
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 11:31:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D032F89E15;
	Fri, 22 Jan 2021 10:31:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC47D89E0D
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 10:31:29 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1l2tiy-0001xf-Iy; Fri, 22 Jan 2021 11:31:28 +0100
Message-ID: <4fa2aafafda0d459576dee466d0f828ab02bbed3.camel@pengutronix.de>
Subject: Re: [PATCH libdrm] tests/util: Add mxsfb-drm driver
From: Lucas Stach <l.stach@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
Date: Fri, 22 Jan 2021 11:31:28 +0100
In-Reply-To: <20201230182933.565-1-festevam@gmail.com>
References: <20201230182933.565-1-festevam@gmail.com>
User-Agent: Evolution 3.38.3 (3.38.3-1.fc33) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRmFiaW8sCgpJJ3ZlIHB1c2hlZCB0aGlzIHBhdGNoIHRvIHRoZSBsaWJkcm0gZ2l0IHJlcG8u
CgpSZWdhcmRzLApMdWNhcwoKQW0gTWl0dHdvY2gsIGRlbSAzMC4xMi4yMDIwIHVtIDE1OjI5IC0w
MzAwIHNjaHJpZWIgRmFiaW8gRXN0ZXZhbToKPiBBZGQgYW4gZW50cnkgZm9yIHRoZSAibXhzZmIt
ZHJtIiBkcml2ZXIsIHNvIHRoYXQgdGhlIHRlc3QgdXRpbGl0aWVzCj4gd29yayB3aXRoIHRoZSBt
eHNmYiBkcml2ZXIgd2l0aG91dCBwYXNzaW5nIHRoZSAtTSBhcmd1bWVudC4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+Cj4gLS0tCj4gwqB0ZXN0
cy91dGlsL2ttcy5jIHwgMSArCj4gwqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAK
PiBkaWZmIC0tZ2l0IGEvdGVzdHMvdXRpbC9rbXMuYyBiL3Rlc3RzL3V0aWwva21zLmMKPiBpbmRl
eCAwOGI0OGZlNTg1YjcuLjM5YTkzODY2YTlkMSAxMDA2NDQKPiAtLS0gYS90ZXN0cy91dGlsL2tt
cy5jCj4gKysrIGIvdGVzdHMvdXRpbC9rbXMuYwo+IEBAIC0xNDksNiArMTQ5LDcgQEAgc3RhdGlj
IGNvbnN0IGNoYXIgKiBjb25zdCBtb2R1bGVzW10gPSB7Cj4gwqAJImFybWFkYS1kcm0iLAo+IMKg
CSJrb21lZGEiLAo+IMKgCSJpbXgtZGNzcyIsCj4gKwkibXhzZmItZHJtIiwKPiDCoH07Cj4gwqAK
PiAKPiDCoGludCB1dGlsX29wZW4oY29uc3QgY2hhciAqZGV2aWNlLCBjb25zdCBjaGFyICptb2R1
bGUpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
