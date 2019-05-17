Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC2D2200A
	for <lists+dri-devel@lfdr.de>; Sat, 18 May 2019 00:07:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86F498999E;
	Fri, 17 May 2019 22:07:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 741FE8999E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 22:07:05 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C9DE12F3;
 Sat, 18 May 2019 00:07:03 +0200 (CEST)
Date: Sat, 18 May 2019 01:06:47 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH] drm: rcar-du: writeback: include interface header
Message-ID: <20190517220647.GA21057@pendragon.ideasonboard.com>
References: <20190517212050.3561-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190517212050.3561-1-kieran.bingham+renesas@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1558130824;
 bh=MnCz2Ojjo7iLxTB+zccLU/er2kvrni3WBKp6QNyIvFo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Fx3bSAQAn0WyG3KGbSJnXAVTpccFNfK9JaLK2xaLofZ2rojxQ79vyrJyHAJu0pDSm
 x/OE0HK9I83JblwQoOa9wkClnGMCLES3WmVtBm8cToe4RTFQq+apqAD56t8FZSYvMO
 4cUJVTk+m5zGuzBs2z1rcdt93LoKhpNXuC6M5Zo0=
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
Cc: linux-renesas-soc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgS2llcmFuLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBGcmksIE1heSAxNywgMjAx
OSBhdCAxMDoyMDo0OVBNICswMTAwLCBLaWVyYW4gQmluZ2hhbSB3cm90ZToKPiBUaGUgbmV3IHdy
aXRlYmFjayBmZWF0dXJlIGlzIGV4cG9ydHMgZnVuY3Rpb25zIHNvIHRoYXQgdGhleSBjYW4KPiBp
bnRlZ3JhdGUgaW50byB0aGUgcmNhcl9kdV9rbXMgbW9kdWxlLgo+IAo+IFRoZSBpbnRlcmZhY2Ug
ZnVuY3Rpb25zIGFyZSBkZWZpbmVkIGluIHRoZSByY2FyX2R1X3dyaXRlYmFjayBoZWFkZXIsIGJ1
dAo+IGl0IGlzIG5vdCBpbmNsdWRlZCBpbiB0aGUgb2JqZWN0IGZpbGUgaXRzZWxmIGxlYWRpbmcg
dG8gY29tcGlsZXIKPiB3YXJuaW5ncyBmb3IgbWlzc2luZyBwcm90b3R5cGVzLgo+IAo+IEluY2x1
ZGUgdGhlIGhlYWRlciBhcyBhcHByb3ByaWF0ZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBLaWVyYW4g
QmluZ2hhbSA8a2llcmFuLmJpbmdoYW0rcmVuZXNhc0BpZGVhc29uYm9hcmQuY29tPgoKUmV2aWV3
ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNv
bT4KCkFuZCBhcHBsaWVkIHRvIG15IHRyZWUuCgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcmNh
ci1kdS9yY2FyX2R1X3dyaXRlYmFjay5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1
X3dyaXRlYmFjay5jIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV93cml0ZWJhY2su
Ywo+IGluZGV4IDk4OWEwYmU5NDEzMS4uYWUwNzI5MGJiYTZhIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfd3JpdGViYWNrLmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vcmNhci1kdS9yY2FyX2R1X3dyaXRlYmFjay5jCj4gQEAgLTE0LDYgKzE0LDcgQEAKPiAg
I2luY2x1ZGUgInJjYXJfZHVfY3J0Yy5oIgo+ICAjaW5jbHVkZSAicmNhcl9kdV9kcnYuaCIKPiAg
I2luY2x1ZGUgInJjYXJfZHVfa21zLmgiCj4gKyNpbmNsdWRlICJyY2FyX2R1X3dyaXRlYmFjay5o
Igo+ICAKPiAgLyoqCj4gICAqIHN0cnVjdCByY2FyX2R1X3diX2Nvbm5fc3RhdGUgLSBEcml2ZXIt
c3BlY2lmaWMgd3JpdGViYWNrIGNvbm5lY3RvciBzdGF0ZQoKLS0gClJlZ2FyZHMsCgpMYXVyZW50
IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
