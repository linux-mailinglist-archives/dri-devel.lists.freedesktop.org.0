Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C2756438
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:13:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F00A46E2F9;
	Wed, 26 Jun 2019 08:13:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1063 seconds by postgrey-1.36 at gabe;
 Tue, 25 Jun 2019 23:35:33 UTC
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [195.92.253.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B44E16E162
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 23:35:33 +0000 (UTC)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hfugr-0002az-F9; Tue, 25 Jun 2019 23:17:29 +0000
Date: Wed, 26 Jun 2019 00:17:29 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] drm: return -EFAULT if copy_one_buf() fails
Message-ID: <20190625231729.GK17978@ZenIV.linux.org.uk>
References: <20190618125623.GA24896@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190618125623.GA24896@mwanda>
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
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMDM6NTY6MjNQTSArMDMwMCwgRGFuIENhcnBlbnRlciB3
cm90ZToKPiBUaGUgY29weV90b191c2VyKCkgZnVuY3Rpb24gcmV0dXJucyB0aGUgbnVtYmVyIG9m
IGJ5dGVzIHJlbWFpbmluZyB0byBiZQo+IGNvcGllZCwgYnV0IHdlIHdhbnQgdG8gcmV0dXJuIC1F
RkFVTFQuICBUaGlzIGZ1bmN0aW9uIGlzIGNhbGxlZCBmcm9tCj4gX19kcm1fbGVnYWN5X2luZm9i
dWZzKCkgd2hpY2ggZXhwZWN0cyBuZWdhdGl2ZSBlcnJvciBjb2Rlcy4KPiAKPiBGaXhlczogNWM3
NjQwYWI2MjU4ICgic3dpdGNoIGNvbXBhdF9kcm1faW5mb2J1ZnMoKSB0byBkcm1faW9jdGxfa2Vy
bmVsKCkiKQo+IFNpZ25lZC1vZmYtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3Jh
Y2xlLmNvbT4KPiAtLS0KPiBUaGlzIGdvZXMgdGhyb3VnaCBBbCdzIHRyZWUgYW5kIG5vdCB0aHJv
dWdoIGRybS4gIFByZXN1bWFibHkgdGhpcyBwYXRjaAo+IHdpbGwganVzdCBnZXQgZm9sZGVkIGlu
dG8gdGhlIG9yaWdpbmFsLgoKV2hhLi4/ICBUaGUgb3JpZ2luYWwgaGFzIGJlZW4gaW4gbWFpbmxp
bmUgc2luY2UgdjQuMTMsIHNvIGl0J3MgYSBiaXQgdG9vCmxhdGUgdG8gZm9sZCBhbnl0aGluZyBp
bnRvIGl0Li4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
