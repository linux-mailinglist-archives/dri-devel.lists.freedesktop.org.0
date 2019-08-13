Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9E08C410
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 00:07:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E6BE6E0DD;
	Tue, 13 Aug 2019 22:07:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD266E0DD
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 22:07:28 +0000 (UTC)
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 2C218738;
 Tue, 13 Aug 2019 22:07:27 +0000 (UTC)
Date: Tue, 13 Aug 2019 16:07:26 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Best practice for embedded code samles? [Was: drm/drv: Use //
 for comments in example code]
Message-ID: <20190813160726.3f9eb8c8@lwn.net>
In-Reply-To: <20190811213215.GA26468@ravnborg.org>
References: <20190808163629.14280-1-j.neuschaefer@gmx.net>
 <20190811213215.GA26468@ravnborg.org>
Organization: LWN.net
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Jonathan =?UTF-8?B?TmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCAxMSBBdWcgMjAxOSAyMzozMjoxNSArMDIwMApTYW0gUmF2bmJvcmcgPHNhbUByYXZu
Ym9yZy5vcmc+IHdyb3RlOgoKPiBJIHdvbmRlciBpZiB0aGVyZSBpcyBhIGJldHRlciB3YXkgdG8g
ZW1iZWQgYSBjb2RlIHNhbXBsZQo+IHRoYW4gcmV2ZXJ0aW5nIHRvIC8vIHN0eWxlIGNvbW1lbnRz
Lgo+IAo+IEFzIHRoZSBrZXJuZWwgZG8gbm90IGxpa2UgLy8gY29tbWVudHMgd2Ugc2hvdWxkIHRy
eSB0byBhdm9pZCB0aGVtIGluCj4gZXhhbXBsZXMuCgpJZiB5b3UncmUgZW1iZWRkaW5nIGEgY29k
ZSBzYW1wbGUgKmludG8gYSBjb2RlIGNvbW1lbnQqIHRoZW4gSSBzdXNwZWN0CnRoaXMgaXMgYWJv
dXQgYXMgZ29vZCBhcyBpdCBnZXRzLiAgVGhlIGFsdGVybmF0aXZlIGlzIHRvIHB1dCBpdCBpbiBh
cyBhCnBsYWluIGxpdGVyYWwgdGV4dCBibG9jay4gIFRoYXQgd291bGQgbG9zZSB0aGUgc3ludGF4
IGhpZ2hsaWdodGluZzsgSQp0aGluayB0aGF0J3MgYW4gZW50aXJlbHkgYmVhcmFibGUgY29zdCwg
YnV0IG90aGVycyBzZWVtIHRvIGZlZWwKZGlmZmVyZW50bHkgYWJvdXQgaXQuCgpUaGFua3MsCgpq
b24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
