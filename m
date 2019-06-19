Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4163D4B772
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 13:53:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F106E35F;
	Wed, 19 Jun 2019 11:53:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A258E6E35F
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 11:53:12 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1hdZ9L-00021A-3J; Wed, 19 Jun 2019 13:53:11 +0200
Message-ID: <1560945190.2398.3.camel@pengutronix.de>
Subject: Re: [PATCH v2] drm/imx: correct order of crtc disable
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Robert Beckett <bob.beckett@collabora.com>, 
 dri-devel@lists.freedesktop.org
Date: Wed, 19 Jun 2019 13:53:10 +0200
In-Reply-To: <20190619114135.19405-1-bob.beckett@collabora.com>
References: <20190619114135.19405-1-bob.beckett@collabora.com>
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
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
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, NXP Linux Team <linux-imx@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDE5LTA2LTE5IGF0IDEyOjQxICswMTAwLCBSb2JlcnQgQmVja2V0dCB3cm90ZToK
PiBOb3RpZnkgZHJtIGNvcmUgYmVmb3JlIHNlbmRpbmcgcGVuZGluZyBldmVudHMgZHVyaW5nIGNy
dGMgZGlzYWJsZS4KPiBUaGlzIGZpeGVzIHRoZSBmaXJzdCBldmVudCBhZnRlciBkaXNhYmxlIGhh
dmluZyBhbiBvbGQgc3RhbGUgdGltZXN0YW1wCj4gYnkgaGF2aW5nIGRybV9jcnRjX3ZibGFua19v
ZmYgdXBkYXRlIHRoZSB0aW1lc3RhbXAgdG8gbm93Lgo+IAo+IFRoaXMgd2FzIHNlZW4gd2hpbGUg
ZGVidWdnaW5nIHdlc3RvbiBsb2cgbWVzc2FnZToKPiBXYXJuaW5nOiBjb21wdXRlZCByZXBhaW50
IGRlbGF5IGlzIGluc2FuZTogLTgyMTIgbXNlYwo+IAo+IEFsc28gb25seSBzZW5kIHBlbmRpbmcg
ZXZlbnQgaWYgY3J0YyBpcyBrZXB0IGRpc2FibGVkLCBvdGhlcndpc2UgaXQgd2lsbAo+IGJlIHNl
bnQgb24gbmV4dCB2bGJsYW5rLgo+Cj4gRml4ZXM6IGE0NzQ0Nzg2NDJkNSAoImRybS9pbXg6IGZp
eCBjcnRjIHZibGFuayBzdGF0ZSByZWdyZXNzaW9uIikKClRoYW5rIHlvdSwgYXBwbGllZCB0byBp
bXgtZHJtL2ZpeGVzLgoKcmVnYXJkcwpQaGlsaXBwCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
