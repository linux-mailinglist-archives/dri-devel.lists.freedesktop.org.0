Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9551297938
	for <lists+dri-devel@lfdr.de>; Sat, 24 Oct 2020 00:04:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 710976E842;
	Fri, 23 Oct 2020 22:03:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E7F16E834;
 Fri, 23 Oct 2020 22:03:54 +0000 (UTC)
Date: Fri, 23 Oct 2020 22:03:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1603490632;
 bh=qzB91Ubxupcx9OPD7IhKyOP7RJXvP6iDjdCbyxkaCQA=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=Oe03KUAZUSwmZj2dLqy9zdyGNDBib5YEcsNXyYoxrs7ssBQ8etUR5XECQVlvWBih7
 O/RHSPoF+s66XDyZ8KjpoSbkVFRYsfOpmNlWwCU7ZCSshK9K+u7TtTZwvDiibqq/7Q
 RQEejxaTZmXoIQREmbZWWHsErsiCVthKC39AVmzi9fF1AWPzcaWkzhXYAM3BRE85lB
 doAWpcF2berH7urXhNucEa07f7mtnJ7iVYuejCx5mQTv9mQfXzQEYNYIIkiWQJEKfV
 l18M5U4f8MKQM2zcEeWtYUDtlZuoFFDlbkQVsrKmo/3DL0YrJ93fHLmYuljQe/yrBK
 zWH+9TeI3Psmw==
To: Ville Syrjala <ville.syrjala@linux.intel.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: Don't create the IN_FORMATS blob when the driver
 does not provide .format_mod_supported()
Message-ID: <wusQ8YNZOE_lHaJ5e15M4lmDPxrD2HiUYKJN5Sh6bcZC-Ly-IzqOPeU9OSmC1X4ftuMbwhJpHRnpDQDnp6Z5-bHrONqzOyS8sdKYxN-TFTY=@emersion.fr>
In-Reply-To: <20201023203957.3255-1-ville.syrjala@linux.intel.com>
References: <20201023203957.3255-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpZGF5LCBPY3RvYmVyIDIzLCAyMDIwIDEwOjM5IFBNLCBWaWxsZSBTeXJqYWxhIDx2aWxs
ZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cgo+IEZyb206IFZpbGxlIFN5cmrDpGzD
pCB2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbQo+Cj4gVGhlIGNvZGUgcmVzcG9uc2libGUg
Zm9yIGNyZWF0aW5nIHRoZSBJTl9GT1JNQVRTCj4gYmxvYiBpcyBicm9rZW4gd2hlbiB0aGUgZHJp
dmVyIGRvZXNuJ3QgcHJvdmlkZSBhCj4gLmZvcm1hdF9tb2Rfc3VwcG9ydGVkKCkgaG9vay4gSXQg
anVzdCBjb3BpZXMgaW4KPiB0aGUgZm9ybWF0IGxpc3QsIGJ1dCBsZWF2ZXMgYWxsIHRoZSBtb2Rp
ZmllciBpbmZvcm1hdGlvbgo+IHplcm9lZC4gVGhhdCB3b3VsZCBpbmRpY2F0ZSAoaW4gYSB2ZXJ5
IHNpbGx5IHdheSkgdGhhdAo+IHRoZXJlIGFyZSBpbiBmYWN0IG5vIHN1cHBvcnRlZCBmb3JtYXQr
bW9kaWZpZXIgY29tYmluYXRpb25zLgo+IFRoYXQgaXMgdXR0ZXIgbm9uc2Vuc2UuCgpTaG91bGQg
d2UgV0FSTl9PTiB3aGVuIHRoZSBkcml2ZXIgZW5hYmxlcyBhbGxvd19mYl9tb2RpZmllcnMgYnV0
CmRvZXNuJ3QgcG9wdWxhdGUgZm9ybWF0X21vZF9zdXBwb3J0ZWQ/Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
