Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBAE6BCC5
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 15:09:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA0106E157;
	Wed, 17 Jul 2019 13:09:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C386E157
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 13:09:13 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id B0C2420020;
 Wed, 17 Jul 2019 15:09:10 +0200 (CEST)
Date: Wed, 17 Jul 2019 15:09:09 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH 05/10] drm/tinydrm: Clean up tinydrm_spi_transfer()
Message-ID: <20190717130909.GA4852@ravnborg.org>
References: <20190717115817.30110-1-noralf@tronnes.org>
 <20190717115817.30110-6-noralf@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190717115817.30110-6-noralf@tronnes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10
 a=wA55RHwfF6eYzscSkTYA:9 a=wPNLvfGTeEIA:10
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
Cc: david@lechnology.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMTcsIDIwMTkgYXQgMDE6NTg6MTJQTSArMDIwMCwgTm9yYWxmIFRyw7hubmVz
IHdyb3RlOgo+IFByZXAgd29yayBiZWZvcmUgbW92aW5nIHRoZSBmdW5jdGlvbiB0byBtaXBpLWRi
aS4KPiAKPiB0aW55ZHJtX3NwaV90cmFuc2ZlcigpIHdhcyBtYWRlIHRvIHN1cHBvcnQgb25lIGNs
YXNzIG9mIGRyaXZlcnMgaW4KPiBkcml2ZXJzL3N0YWdpbmcvZmJ0ZnQgdGhhdCBoYXMgbm90IGJl
ZW4gY29udmVydGVkIHRvIERSTSB5ZXQsIHNvIHN0cmlwCj4gYXdheSB0aGUgdW51c2VkIGZ1bmN0
aW9uYWxpdHk6Cj4gLSBTdGFydCBieXRlIChoZWFkZXIpIGlzIG5vdCB1c2VkLgo+IC0gTm8gZHJp
dmVyIHJlbGllcyBvbiB0aGUgYXV0b21hdGljIDE2LWJpdCBieXRlIHN3YXBwaW5nIG9uIGxpdHRs
ZSBlbmRpYW4KPiAgIG1hY2hpbmVzIHdpdGggU1BJIGNvbnRyb2xsZXJzIG9ubHkgc3VwcG9ydGlu
ZyA4IGJpdHMgcGVyIHdvcmQuCgpLZWVwaW5nIHVudXNlZCBjb2RlIGFyb3VuZCBpcyBuZXZlciBh
IGdvb2QgaWRlYS4KT24gdGhlIG90aGVyIGhhbmQsIHNob3VsZCB3ZSBub3QgdHJ5IHRvIGdldCB0
aGUgZHJpdmVyIGluIHF1ZXN0aW9ucwpwb3J0ZWQgc28gd2UgaGF2ZSBhIHVzZXIgYW5kIHdlIGRv
IG5vdCBuZWVkIHRvIHJlLWFkZCB0aGlzIGxhdGVyPwpXaGF0IGRyaXZlci9kaXNwbGF5IG5lZWRz
IHRoaXM/CgoJU2FtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
