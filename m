Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E0F449CB
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 19:42:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E47E9892F2;
	Thu, 13 Jun 2019 17:42:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB7BB892F2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 17:42:17 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 466D6218B6;
 Thu, 13 Jun 2019 17:42:17 +0000 (UTC)
Date: Thu, 13 Jun 2019 19:42:15 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Liviu Dudau <liviu.dudau@arm.com>
Subject: Re: [PATCH] malidp: no need to check return value of debugfs_create
 functions
Message-ID: <20190613174215.GB9415@kroah.com>
References: <20190613132829.GB4863@kroah.com>
 <20190613145221.GP4173@e110455-lin.cambridge.arm.com>
 <20190613155713.GA4632@kroah.com>
 <20190613162755.GR4173@e110455-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613162755.GR4173@e110455-lin.cambridge.arm.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560447737;
 bh=Ld8jToxkrKE08YxPdXyzTi4UV4EL//E96V+qePxnLZk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jNe1fBcOC7jd+MPhtHw1wo3YlJHur7fNe81zoK/y830glEoCipayb+CIPALEW97Br
 QX1CTtCHioHCJEbKV+AhD/TFHJbb8zr3FiF1wFitrk9Z4NG/4XQFPl53/HSxDmGks0
 zjZWSiPJAjtegz32c2qSrPtZj5qZg8zA8lJWrFIo=
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

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDU6Mjc6NTVQTSArMDEwMCwgTGl2aXUgRHVkYXUgd3Jv
dGU6Cj4gT24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDU6NTc6MTNQTSArMDIwMCwgR3JlZyBLcm9h
aC1IYXJ0bWFuIHdyb3RlOgo+ID4gT24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDM6NTI6MjJQTSAr
MDEwMCwgTGl2aXUgRHVkYXUgd3JvdGU6Cj4gPiA+IE9uIFRodSwgSnVuIDEzLCAyMDE5IGF0IDAz
OjI4OjI5UE0gKzAyMDAsIEdyZWcgS3JvYWgtSGFydG1hbiB3cm90ZToKPiA+ID4gPiBXaGVuIGNh
bGxpbmcgZGVidWdmcyBmdW5jdGlvbnMsIHRoZXJlIGlzIG5vIG5lZWQgdG8gZXZlciBjaGVjayB0
aGUKPiA+ID4gPiByZXR1cm4gdmFsdWUuICBUaGUgZnVuY3Rpb24gY2FuIHdvcmsgb3Igbm90LCBi
dXQgdGhlIGNvZGUgbG9naWMgc2hvdWxkCj4gPiA+ID4gbmV2ZXIgZG8gc29tZXRoaW5nIGRpZmZl
cmVudCBiYXNlZCBvbiB0aGlzLgo+ID4gPiAKPiA+ID4gSSByZW1lbWJlciB3aGVuIHdyaXRpbmcg
dGhpcyBjb2RlIGFuZCB0ZXN0aW5nIG5vdCBmdWxseSBjb21wbGV0ZSBjb2RlIHRoYXQgbGVmdAo+
ID4gPiBub2RlcyBhcm91bmQgb24gcmVtb3ZpbmcgdGhlIG1vZHVsZSB0aGF0IHRoZXJlIHdlcmUg
ZXJyb3JzIGJlaW5nIHJldHVybmVkIGJ5Cj4gPiA+IGRlYnVnZnNfY3JlYXRlX2ZpbGUoKS4gSGFz
IHRoYXQgY2hhbmdlZCBzaW5jZSAyIHllYXJzIGFnbz8gOikKPiA+IAo+ID4gRXJyb3JzIGNhbiBi
ZSByZXR1cm5lZCBpZiB5b3UgZG8gc29tZXRoaW5nIGZvb2xpc2g6Cj4gPiAJLSBwYXNzIGFuIGVy
cm9yIGFzIGEgcGFyZW50IHBvaW50ZXIKPiA+IAktIHBhc3MgYSBuYW1lIHRoYXQgaXMgYWxyZWFk
eSBwcmVzZW50Cj4gCj4gVGhhdCBpcyB3aGF0IEkgd2FzIGhpdHRpbmcgcHJldmlvdXNseS4gSWYg
d2UgZm9sbG93IHRoZSBuZXcgYWR2aWNlIG9mIG5vdAo+IGNoZWNraW5nIGZvciBlcnJvcnMgZG9l
cyB0aGlzIG1lYW4gSSBjYW4gbm93IHN0YXJ0IHRvIGhpZGUgZGVidWdmcyBlbnRyaWVzCj4gYnkg
dG91Y2hpbmcgc29tZSBkZWJ1Z2ZzIGZpbGVzIGJlZm9yZSBtb2R1bGVzIGdldCBsb2FkZWQ/CgpI
b3cgY2FuIHlvdSAidG91Y2giIGEgZGVidWdmcyBmaWxlIHRvZGF5PwoKQW5kIGV2ZW4gaWYgdGhl
cmUgaXMgYSBkdXBsaWNhdGUgZGVidWdmcyBmaWxlLCB5b3Ugc2hvdWxkbid0IGNhcmUgYXMKeW91
ciBkcml2ZXIgc2hvdWxkIGtlZXAgZ29pbmcgZXZlbiBpZiBjcmVhdGlvbiBvZiBpdCBmYWlscyBh
cyBubwpmdW5jdGlvbmFsaXR5IG9mIHRoZSBjb2RlIHNob3VsZCBldmVyIHJlbHkgb24gZGVidWdm
cy4KCnRoYW5rcywKCmdyZWcgay1oCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
