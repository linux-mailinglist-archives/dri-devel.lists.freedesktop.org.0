Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF35449CD
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 19:43:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EA8B892CB;
	Thu, 13 Jun 2019 17:43:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 898BC892CB
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 17:43:06 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E09742175B;
 Thu, 13 Jun 2019 17:43:05 +0000 (UTC)
Date: Thu, 13 Jun 2019 19:43:04 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH] armada: no need to check return value of debugfs_create
 functions
Message-ID: <20190613174304.GC9415@kroah.com>
References: <20190613132850.GC4863@kroah.com>
 <20190613143600.ldcqfw4s3t2pxh2y@shell.armlinux.org.uk>
 <20190613160114.GC4632@kroah.com>
 <20190613161559.tef4ajcs5rdldf5d@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613161559.tef4ajcs5rdldf5d@shell.armlinux.org.uk>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560447786;
 bh=VsL02xIJ5M5xq+Dj+8nyLBHAeKcK8kKOyLMef/sHyig=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tEPdrMIIqUlCaxiIIrv9WIds6Xp8TZHGex2QlcH6RmFPbciETsYoT8iKHl1gGuCxA
 Qq52BDKw+MKiS3dTjlTjYXgvRXlcwhC8yGU2tgQ5PwkgdPX2KenBHRUOnmCw29BYgh
 /V4Kjkp6sf8n8FR0Ka/6AXAgFcOtG1d/uJUR/Nnk=
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDU6MTU6NTlQTSArMDEwMCwgUnVzc2VsbCBLaW5nIC0g
QVJNIExpbnV4IGFkbWluIHdyb3RlOgo+IE9uIFRodSwgSnVuIDEzLCAyMDE5IGF0IDA2OjAxOjE0
UE0gKzAyMDAsIEdyZWcgS3JvYWgtSGFydG1hbiB3cm90ZToKPiA+IE9uIFRodSwgSnVuIDEzLCAy
MDE5IGF0IDAzOjM2OjAwUE0gKzAxMDAsIFJ1c3NlbGwgS2luZyAtIEFSTSBMaW51eCBhZG1pbiB3
cm90ZToKPiA+ID4gT24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDM6Mjg6NTBQTSArMDIwMCwgR3Jl
ZyBLcm9haC1IYXJ0bWFuIHdyb3RlOgo+ID4gPiA+IFdoZW4gY2FsbGluZyBkZWJ1Z2ZzIGZ1bmN0
aW9ucywgdGhlcmUgaXMgbm8gbmVlZCB0byBldmVyIGNoZWNrIHRoZQo+ID4gPiA+IHJldHVybiB2
YWx1ZS4gIFRoZSBmdW5jdGlvbiBjYW4gd29yayBvciBub3QsIGJ1dCB0aGUgY29kZSBsb2dpYyBz
aG91bGQKPiA+ID4gPiBuZXZlciBkbyBzb21ldGhpbmcgZGlmZmVyZW50IGJhc2VkIG9uIHRoaXMu
Cj4gPiA+IAo+ID4gPiBQbGVhc2UgZG9uJ3QgbWVyZ2UgdGhpcyBwYXRjaCAtIEkgaGF2ZSBhIGNo
YW5nZSB0aGF0IGNvbmZsaWN0cyB3aXRoIHRoaXMKPiA+ID4gd2hpY2ggc3dpdGNoZXMgdXMgb3Zl
ciB0byB1c2luZyBkcm1fZGVidWdmc19jcmVhdGVfZmlsZXMoKSwgdGhlcmVieQo+ID4gPiBlbGlt
aW5hdGluZyB0aGlzIGNvZGUuCj4gPiAKPiA+IElzbid0IGl0ICJmaXJzdCByZWNlaXZlZCwgZmly
c3QgYXBwbGllZD8iICBUaGF0J3MgaG93IGl0IGlzIGZvciBteQo+ID4gc3Vic3lzdGVtcy4uLgo+
IAo+IFdoZW4gSSBzdGFydGVkIHdvcmtpbmcgb24gdGhlIGtlcm5lbCBpbiB0aGUgMTk5MHMsIGl0
IHdhcyAidGhlIG1vc3QKPiB0ZWNobmljYWxseSBjb3JyZWN0IGFwcHJvYWNoIG9mIGNvbXBldGlu
ZyBhcHByb2FjaGVzIi4gIElmIHdlJ3ZlCj4gbm93IHN3aXRjaGVkIHRvICJmaXJzdCByZWNlaXZl
ZCwgZmlyc3QgYXBwbGllZCIgdGhhdCBjYW4gb25seSBiZQo+IGhhcm1mdWwgYW5kIGRlbW90aXZh
dGluZyB0byB0aG9zZSB3aG8gd2lzaCB0byBkbyBhIGdvb2Qgam9iLgo+IAo+IElmIHNvbWVvbmUg
aGFzIGEgYmV0dGVyIGFwcHJvYWNoIHJlYWR5IHRvIGdvLCB3aHkgc2hvdWxkIHRoZQo+IGluZmVy
aW9yIGFwcHJvYWNoIGJlIGFwcGxpZWQgYW5kIHRoZW4gdGhlIGJldHRlciBhcHByb2FjaCBoYXZl
IHRvCj4gYmUgcmViYXNlZCBvbiB0b3Agb2YgdGhlIGluZmVyaW9yIGFwcHJvYWNoPyAgVGhpcyBt
YWtlcyBubyBzZW5zZS4KCklmIHlvdSBoYXZlIGEgYmV0dGVyIGFwcHJvYWNoIHJlYWR5IHRvIGdv
LCBwbGVhc2UgcG9zdCBpdCBhbmQgSSB3aWxsIGJlCmdsYWQgdG8gcmViYXNlIG15IHBhdGNoIG9u
IHRvcCBvZiB5b3Vycy4KCmdyZWcgay1oCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
