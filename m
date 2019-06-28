Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2D05989B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 12:42:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F1C6E8D5;
	Fri, 28 Jun 2019 10:42:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9D826E8D5
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 10:41:59 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 0571827EA8A;
 Fri, 28 Jun 2019 11:41:57 +0100 (BST)
Date: Fri, 28 Jun 2019 12:41:54 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] drm: connector: remove bogus NULL check
Message-ID: <20190628124154.5245f629@collabora.com>
In-Reply-To: <20190628103925.2686249-1-arnd@arndb.de>
References: <20190628103925.2686249-1-arnd@arndb.de>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Alex Deucher <alexander.deucher@amd.com>,
 Uma Shankar <uma.shankar@intel.com>, Sean Paul <sean@poorly.run>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyOCBKdW4gMjAxOSAxMjozOTowNSArMDIwMApBcm5kIEJlcmdtYW5uIDxhcm5kQGFy
bmRiLmRlPiB3cm90ZToKCj4gbW9kZS0+bmFtZSBpcyBhIGNoYXJhY3RlciBhcnJheSBpbiBhIHN0
cnVjdHVyZSwgY2hlY2tpbmcgaXQncwo+IGFkZHJlc3MgaXMgcG9pbnRsZXNzIGFuZCBjYXVzZXMg
YSB3YXJuaW5nIHdpdGggc29tZSBjb21waWxlcnM6Cj4gCj4gZHJpdmVycy9ncHUvZHJtL2RybV9j
b25uZWN0b3IuYzoxNDQ6MTU6IGVycm9yOiBhZGRyZXNzIG9mIGFycmF5ICdtb2RlLT5uYW1lJyB3
aWxsIGFsd2F5cyBldmFsdWF0ZSB0byAndHJ1ZScKPiAgICAgICBbLVdlcnJvciwtV3BvaW50ZXIt
Ym9vbC1jb252ZXJzaW9uXQo+ICAgICAgICAgICAgICAgICAgICAgICBtb2RlLT5uYW1lID8gbW9k
ZS0+bmFtZSA6ICIiLAo+ICAgICAgICAgICAgICAgICAgICAgICB+fn5+fn5efn5+IH4KPiBpbmNs
dWRlL2RybS9kcm1fcHJpbnQuaDozNjY6Mjk6IG5vdGU6IGV4cGFuZGVkIGZyb20gbWFjcm8gJ0RS
TV9ERUJVR19LTVMnCj4gICAgICAgICBkcm1fZGJnKERSTV9VVF9LTVMsIGZtdCwgIyNfX1ZBX0FS
R1NfXykKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+Cj4g
Cj4gUmVtb3ZlIHRoZSBjaGVjayBoZXJlLgo+IAo+IEZpeGVzOiAzYWVlYjEzZDg5OTYgKCJkcm0v
bW9kZXM6IFN1cHBvcnQgbW9kZXMgbmFtZXMgb24gdGhlIGNvbW1hbmQgbGluZSIpCj4gU2lnbmVk
LW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KClJldmlld2VkLWJ5OiBCb3Jp
cyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgoKPiAtLS0KPiAgZHJp
dmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fY29ubmVjdG9yLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jCj4g
aW5kZXggM2FmZWQ1Njc3OTQ2Li5iM2YyY2Y3ZWFlOWMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2RybV9jb25uZWN0b3IuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVj
dG9yLmMKPiBAQCAtMTQxLDcgKzE0MSw3IEBAIHN0YXRpYyB2b2lkIGRybV9jb25uZWN0b3JfZ2V0
X2NtZGxpbmVfbW9kZShzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQo+ICAKPiAgCURS
TV9ERUJVR19LTVMoImNtZGxpbmUgbW9kZSBmb3IgY29ubmVjdG9yICVzICVzICVkeCVkQCVkSHol
cyVzJXNcbiIsCj4gIAkJICAgICAgY29ubmVjdG9yLT5uYW1lLAo+IC0JCSAgICAgIG1vZGUtPm5h
bWUgPyBtb2RlLT5uYW1lIDogIiIsCj4gKwkJICAgICAgbW9kZS0+bmFtZSwKPiAgCQkgICAgICBt
b2RlLT54cmVzLCBtb2RlLT55cmVzLAo+ICAJCSAgICAgIG1vZGUtPnJlZnJlc2hfc3BlY2lmaWVk
ID8gbW9kZS0+cmVmcmVzaCA6IDYwLAo+ICAJCSAgICAgIG1vZGUtPnJiID8gIiByZWR1Y2VkIGJs
YW5raW5nIiA6ICIiLAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
