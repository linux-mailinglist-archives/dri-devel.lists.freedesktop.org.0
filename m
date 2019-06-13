Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5B943F63
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 17:57:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85D2489824;
	Thu, 13 Jun 2019 15:57:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D5F89824
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 15:57:15 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 64C4B208CA;
 Thu, 13 Jun 2019 15:57:15 +0000 (UTC)
Date: Thu, 13 Jun 2019 17:57:13 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Liviu Dudau <liviu.dudau@arm.com>
Subject: Re: [PATCH] malidp: no need to check return value of debugfs_create
 functions
Message-ID: <20190613155713.GA4632@kroah.com>
References: <20190613132829.GB4863@kroah.com>
 <20190613145221.GP4173@e110455-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613145221.GP4173@e110455-lin.cambridge.arm.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560441435;
 bh=4Cfiy3JGtGJFOc+drm8FXE9Au5A5V+1dZolnG5NqKBY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T5Cyz2dgLYCL2sb1lszl9pCWfHkwuosNqUXjiyJtnSIPVn10Wa3gM/Lc/pICBf2WF
 FAE5bqzqEYwRUWlj7msbb0wFlwCikTW/Ej1x/XfSs5StsQ+60S4pI25CgIX5vXn41m
 ZKCF4ljDb3fxUsS7yExewecylgPK103VC8B2qgbk=
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

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDM6NTI6MjJQTSArMDEwMCwgTGl2aXUgRHVkYXUgd3Jv
dGU6Cj4gT24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDM6Mjg6MjlQTSArMDIwMCwgR3JlZyBLcm9h
aC1IYXJ0bWFuIHdyb3RlOgo+ID4gV2hlbiBjYWxsaW5nIGRlYnVnZnMgZnVuY3Rpb25zLCB0aGVy
ZSBpcyBubyBuZWVkIHRvIGV2ZXIgY2hlY2sgdGhlCj4gPiByZXR1cm4gdmFsdWUuICBUaGUgZnVu
Y3Rpb24gY2FuIHdvcmsgb3Igbm90LCBidXQgdGhlIGNvZGUgbG9naWMgc2hvdWxkCj4gPiBuZXZl
ciBkbyBzb21ldGhpbmcgZGlmZmVyZW50IGJhc2VkIG9uIHRoaXMuCj4gCj4gSSByZW1lbWJlciB3
aGVuIHdyaXRpbmcgdGhpcyBjb2RlIGFuZCB0ZXN0aW5nIG5vdCBmdWxseSBjb21wbGV0ZSBjb2Rl
IHRoYXQgbGVmdAo+IG5vZGVzIGFyb3VuZCBvbiByZW1vdmluZyB0aGUgbW9kdWxlIHRoYXQgdGhl
cmUgd2VyZSBlcnJvcnMgYmVpbmcgcmV0dXJuZWQgYnkKPiBkZWJ1Z2ZzX2NyZWF0ZV9maWxlKCku
IEhhcyB0aGF0IGNoYW5nZWQgc2luY2UgMiB5ZWFycyBhZ28/IDopCgpFcnJvcnMgY2FuIGJlIHJl
dHVybmVkIGlmIHlvdSBkbyBzb21ldGhpbmcgZm9vbGlzaDoKCS0gcGFzcyBhbiBlcnJvciBhcyBh
IHBhcmVudCBwb2ludGVyCgktIHBhc3MgYSBuYW1lIHRoYXQgaXMgYWxyZWFkeSBwcmVzZW50Cm9y
IGlmIHRoZSBzeXN0ZW0gaXMgb3V0IG9mIHJlc291cmNlcwoJLSBjYW4gbm90IGluY3JlbWVudCBz
dXBlcmJsb2NrIHJlZmVyZW5jZQoJLSBvdXQgb2YgbWVtb3J5IHRvIGNyZWF0ZSBhbiBpbm9kZQoK
SWYgdGhvc2UgbGFzdCB0d28gdGhpbmdzIGFyZSBoYXBwZW5pbmcsIHRoZW4geW91ciBzeXN0ZW0g
aXMgY3Jhc2hpbmcKYWxyZWFkeSwgZGVidWdmcyBpcyB0aGUgbGVhc3Qgb2YgeW91ciB3b3JyaWVz
IDopCgo+ID4gQ2M6IExpdml1IER1ZGF1IDxsaXZpdS5kdWRhdUBhcm0uY29tPgo+ID4gQ2M6IEJy
aWFuIFN0YXJrZXkgPGJyaWFuLnN0YXJrZXlAYXJtLmNvbT4KPiA+IENjOiBEYXZpZCBBaXJsaWUg
PGFpcmxpZWRAbGludXguaWU+Cj4gPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNo
Pgo+ID4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+IFNpZ25lZC1vZmYt
Ynk6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4gCj4g
QWNrZWQtYnk6IExpdml1IER1ZGF1IDxsaXZpdS5kdWRhdUBhcm0uY29tPgo+IAo+IEknbGwgcHVs
bCBpdCBpbnRvIHRoZSBtYWxpZHAgdHJlZS4KCldvbmRlcmZ1bCwgdGhhbmtzIQoKZ3JlZyBrLWgK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
