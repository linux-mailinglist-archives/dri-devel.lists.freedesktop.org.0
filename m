Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E115E56435
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:13:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 214596E303;
	Wed, 26 Jun 2019 08:13:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [195.92.253.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C86F56E162
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 23:35:35 +0000 (UTC)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hfuiE-0002co-Rt; Tue, 25 Jun 2019 23:18:54 +0000
Date: Wed, 26 Jun 2019 00:18:54 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v2] drm: return -EFAULT if copy_to_user() fails
Message-ID: <20190625231854.GL17978@ZenIV.linux.org.uk>
References: <20190618125623.GA24896@mwanda> <20190618131843.GA29463@mwanda>
 <20190618171629.GB25413@art_vandelay>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190618171629.GB25413@art_vandelay>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Mailman-Approved-At: Wed, 26 Jun 2019 08:12:13 +0000
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMDE6MTY6MjlQTSAtMDQwMCwgU2VhbiBQYXVsIHdyb3Rl
Ogo+IE9uIFR1ZSwgSnVuIDE4LCAyMDE5IGF0IDA0OjE4OjQzUE0gKzAzMDAsIERhbiBDYXJwZW50
ZXIgd3JvdGU6Cj4gPiBUaGUgY29weV9mcm9tX3VzZXIoKSBmdW5jdGlvbiByZXR1cm5zIHRoZSBu
dW1iZXIgb2YgYnl0ZXMgcmVtYWluaW5nCj4gPiB0byBiZSBjb3BpZWQgYnV0IHdlIHdhbnQgdG8g
cmV0dXJuIGEgbmVnYXRpdmUgZXJyb3IgY29kZS4gIE90aGVyd2lzZQo+ID4gdGhlIGNhbGxlcnMg
dHJlYXQgaXQgYXMgYSBzdWNjZXNzZnVsIGNvcHkuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IERh
biBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KPiAKPiBUaGFua3MgRGFuLCBJ
J3ZlIGFwcGxpZWQgdGhpcyB0byBkcm0tbWlzYy1maXhlcy4KCkZXSVcsIEFja2VkLWJ5OiBBbCBW
aXJvIDx2aXJvQHplbml2LmxpbnV4Lm9yZy51az4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
