Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D96D46F695
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 01:01:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D986898CE;
	Sun, 21 Jul 2019 23:00:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B23898CE
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jul 2019 23:00:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id 7E59628A24F
Message-ID: <22d7eca4ad8aa2e73933c4f83c92221ce6e0945a.camel@collabora.com>
Subject: Re: [PATCH] Enable backlight when trigger is activated
From: Ezequiel Garcia <ezequiel@collabora.com>
To: Pavel Machek <pavel@ucw.cz>, kernel list <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-omap@vger.kernel.org, tony@atomide.com, sre@kernel.org, 
 nekit1000@gmail.com, mpartap@gmx.net, merlijn@wizzup.org, 
 jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org,
 b.zolnierkie@samsung.com,  dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Date: Sun, 21 Jul 2019 20:00:44 -0300
In-Reply-To: <20190718190849.GA11409@amd>
References: <20190718190849.GA11409@amd>
Organization: Collabora
User-Agent: Evolution 3.30.5-1.1 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUGF2ZWwsCgpUaGUgY29tbWl0IGxvZyBpcyBsYWNraW5nIHRoZSBwcm9wZXIgImxlZHM6IHRy
aWdnZXJzOiAiLgoKQWxzby4uLgoKT24gVGh1LCAyMDE5LTA3LTE4IGF0IDIxOjA4ICswMjAwLCBQ
YXZlbCBNYWNoZWsgd3JvdGU6Cj4gQ29uZmlndXJpbmcgYmFja2xpZ2h0IHRyaWdnZXIgZnJvbSBk
dHMgcmVzdWx0cyBpbiBiYWNrbGlnaHQgb2ZmIGR1cmluZwo+IGJvb3QuIE1hY2hpbmUgbG9va3Mg
ZGVhZCB1cG9uIGJvb3QsIHdoaWNoIGlzIG5vdCBnb29kLgo+IAo+IEZpeCB0aGF0IGJ5IGVuYWJs
aW5nIExFRCBvbiB0cmlnZ2VyIGFjdGl2YXRpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF2ZWwg
TWFjaGVrIDxwYXZlbEB1Y3cuY3o+Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbGVkcy90cmln
Z2VyL2xlZHRyaWctYmFja2xpZ2h0LmMgYi9kcml2ZXJzL2xlZHMvdHJpZ2dlci9sZWR0cmlnLWJh
Y2tsaWdodC5jCj4gaW5kZXggNDg3NTc3ZC4uNmU2YmM3OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2xlZHMvdHJpZ2dlci9sZWR0cmlnLWJhY2tsaWdodC5jCj4gKysrIGIvZHJpdmVycy9sZWRzL3Ry
aWdnZXIvbGVkdHJpZy1iYWNrbGlnaHQuYwo+IEBAIC0xMTQsNiArMTE0LDggQEAgc3RhdGljIGlu
dCBibF90cmlnX2FjdGl2YXRlKHN0cnVjdCBsZWRfY2xhc3NkZXYgKmxlZCkKPiAgCW4tPm9sZF9z
dGF0dXMgPSBVTkJMQU5LOwo+ICAJbi0+bm90aWZpZXIubm90aWZpZXJfY2FsbCA9IGZiX25vdGlm
aWVyX2NhbGxiYWNrOwo+ICAKPiArCWxlZF9zZXRfYnJpZ2h0bmVzcyhsZWQsIExFRF9PTik7Cj4g
KwoKVGhpcyBsb29rcyBmaXNoeS4KCk1heWJlIHlvdSBzaG91bGQgdXNlIGEgZGVmYXVsdC1zdGF0
ZSA9ICJrZWVwIiBpbnN0ZWFkPyAoYW5kIHlvdSdsbCBoYXZlCnRvIHN1cHBvcnQgaXQgaW4gdGhl
IExFRCBkcml2ZXIpLgoKVGhhdCdsbCBnaXZlIHlvdSBwcm9wZXIgImRvbid0IHRvdWNoIHRoZSBM
RUQgaWYgaXQgd2FzIHR1cm5lZCBvbiIgYmVoYXZpb3IsCndoaWNoIGlzIHdoYXQgeW91IHNlZW0g
dG8gd2FudC4KClJlZ2FyZHMsCkV6ZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
