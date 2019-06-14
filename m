Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2346546038
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 16:11:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC9EE898EA;
	Fri, 14 Jun 2019 14:11:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE29C898EA
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 14:11:46 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1hbmvh-0001zd-17; Fri, 14 Jun 2019 16:11:45 +0200
Message-ID: <1560521504.18257.2.camel@pengutronix.de>
Subject: Re: [PATCH 3/3] gpu: ipu-v3: image-convert: Fix image downsize
 coefficients
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Steve Longerbeam <slongerbeam@gmail.com>
Date: Fri, 14 Jun 2019 16:11:44 +0200
In-Reply-To: <20190612011657.12119-3-slongerbeam@gmail.com>
References: <20190612011657.12119-1-slongerbeam@gmail.com>
 <20190612011657.12119-3-slongerbeam@gmail.com>
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
Cc: open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR FREESCALE IMX" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDE5LTA2LTExIGF0IDE4OjE2IC0wNzAwLCBTdGV2ZSBMb25nZXJiZWFtIHdyb3Rl
Ogo+IFRoZSBvdXRwdXQgb2YgdGhlIElDIGRvd25zaXplciB1bml0IGluIGJvdGggZGltZW5zaW9u
cyBtdXN0IGJlIDw9IDEwMjQKPiBiZWZvcmUgYmVpbmcgcGFzc2VkIHRvIHRoZSBJQyByZXNpemVy
IHVuaXQuIFRoaXMgd2FzIGNhdXNpbmcgY29ycnVwdGVkCj4gaW1hZ2VzIHdoZW46Cj4gCj4gaW5w
dXRfZGltID4gMTAyNCwgYW5kCj4gaW5wdXRfZGltIC8gMiA8IG91dHB1dF9kaW0gPCBpbnB1dF9k
aW0KPiAKPiBTb21lIGJyb2tlbiBleGFtcGxlcyB3ZXJlIDE5MjB4MTA4MCAtPiAxMDI0eDc2OCBh
bmQgMTkyMHgxMDgwIC0+Cj4gMTI4MHgxMDgwLgo+IAo+IEZpeGVzOiA3MGI5YjZiM2JjYjIxICgi
Z3B1OiBpcHUtdjM6IGltYWdlLWNvbnZlcnQ6IGNhbGN1bGF0ZSBwZXItdGlsZQo+IHJlc2l6ZSBj
b2VmZmljaWVudHMiKQo+IAo+IFNpZ25lZC1vZmYtYnk6IFN0ZXZlIExvbmdlcmJlYW0gPHNsb25n
ZXJiZWFtQGdtYWlsLmNvbT4KCkFsbCBhcHBsaWVkIG9uIHRoZSBpbXgtZHJtL2ZpeGVzIGJyYW5j
aC4KCnJlZ2FyZHMKUGhpbGlwcApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
