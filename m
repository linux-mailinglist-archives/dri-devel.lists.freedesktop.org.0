Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D73614262B
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 14:43:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC3EC892B5;
	Wed, 12 Jun 2019 12:43:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83C49892B5
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 12:43:55 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:63749
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hb2bZ-0000iN-Gb; Wed, 12 Jun 2019 14:43:53 +0200
Subject: Re: [PATCH v3 3/6] drm/modes: Allow to specify rotation and
 reflection on the commandline
To: Maxime Ripard <maxime.ripard@bootlin.com>
References: <cover.87b91639451f23d4ab68a7c9812f2dd158869025.1555591281.git-series.maxime.ripard@bootlin.com>
 <ba320b3a13c4444102b77c4d00f7c1dc810adc3c.1555591281.git-series.maxime.ripard@bootlin.com>
 <9ccb7573-d46e-4b90-7caa-7b8cd7b8e7a2@tronnes.org>
 <20190611124933.2g6l3d7nx6lqft6k@flea>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <1d0d6259-54cb-9a26-003d-2a35b8a40f3f@tronnes.org>
Date: Wed, 12 Jun 2019 14:43:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190611124933.2g6l3d7nx6lqft6k@flea>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=V5xuatLmbSWIhlTDBXotDYiBA61Br0Wwkxd5ZecpoWY=; 
 b=cf+Quw9u4Bo/zkT5FEW6xYNWSxkfUOIDgJNiU9PydnT1YUwT4r/FWs8p0ifrsFKA+gKdWX15eUBxUO2IjYCiPK7pz5Ig5lh2frtP+Fd/3vQKJOPjD08oMEBpEEsbaPUi76JXCzkLW3QMJ4qz8B6wHpei3JY+2IylAnTdBbOROs9ZyhrbLysHA6PjjYwV+hIBUrVBSVlxrvtcqlQbruEuIPRfDo+Yuf4UETmzsY+3KvnF4d4FBF71i+a2X1ibLtjqUMi036ESDZtpu1GR/9GTenyL+YH6NzINEgdGHmiaR2XtyLRgZmEErhbCB24dJg5O5I4pVH3T5LIVQq/7/FQzyg==;
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
Cc: eben@raspberrypi.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Sean Paul <seanpaul@chromium.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMTEuMDYuMjAxOSAxNC40OSwgc2tyZXYgTWF4aW1lIFJpcGFyZDoKPiBIaSBOb3JhbGYs
Cj4gCj4gT24gVGh1LCBBcHIgMTgsIDIwMTkgYXQgMDY6NDA6NDJQTSArMDIwMCwgTm9yYWxmIFRy
w7hubmVzIHdyb3RlOgo+PiBEZW4gMTguMDQuMjAxOSAxNC40MSwgc2tyZXYgTWF4aW1lIFJpcGFy
ZDoKPj4+ICsJLyoqCj4+PiArCSAqIFdlIHdhbnQgdGhlIHJvdGF0aW9uIG9uIHRoZSBjb21tYW5k
IGxpbmUgdG8gb3ZlcndyaXRlCj4+PiArCSAqIHdoYXRldmVyIGNvbWVzIGZyb20gdGhlIHBhbmVs
Lgo+Pj4gKwkgKi8KPj4+ICsJY21kbGluZSA9ICZjb25uZWN0b3ItPmNtZGxpbmVfbW9kZTsKPj4+
ICsJaWYgKGNtZGxpbmUtPnNwZWNpZmllZCAmJgo+Pj4gKwkgICAgY21kbGluZS0+cm90YXRpb24g
IT0gRFJNX01PREVfUk9UQVRFXzApCj4+Cj4+IEkgYmVsaWV2ZSB5b3UgbmVlZCB0byBkcm9wIHRo
YXQgc2Vjb25kIGNoZWNrLCBvdGhlcndpc2Ugcm90YXRlPTAgd2lsbAo+PiBub3Qgb3ZlcndyaXRl
IHBhbmVsIHJvdGF0aW9uLgo+IAo+IEdvb2QgY2F0Y2ggOikKPiAKPj4+ICsJCX0gZWxzZSBpZiAo
IXN0cm5jbXAob3B0aW9uLCAicmVmbGVjdF94IiwgZGVsaW0gLSBvcHRpb24pKSB7Cj4+PiArCQkJ
cm90YXRpb24gfD0gRFJNX01PREVfUkVGTEVDVF9YOwo+Pj4gKwkJCXNlcCA9IGRlbGltOwo+Pj4g
KwkJfSBlbHNlIGlmICghc3RybmNtcChvcHRpb24sICJyZWZsZWN0X3kiLCBkZWxpbSAtIG9wdGlv
bikpIHsKPj4KPj4gSSB0aGluayB5b3Ugc2hvdWxkIGRyb3AgcmVmbGVjdF94IGFuZCBfeSBmb3Ig
bm93IHNpbmNlIHRoZXkncmUgbm90Cj4+IHN1cHBvcnRlZC4gUGVvcGxlIGxpa2UgbWUgdGhhdCBv
bmx5IHJlYWRzIGNvZGUgYW5kIG5vdCBkb2N1bWVudGF0aW9uCj4+IChhaGVtLi4pIHdpbGwgZ2V0
IHRoZSBpbXByZXNzaW9uIHRoYXQgdGhpcyBzaG91bGQgd29yay4KPiAKPiBJJ20gbm90IHN1cmUg
d2hhdCB5b3UgbWVhbiBoZXJlLCB0aGlzIGlzIGRlZmluaXRlbHkgc3VwcG9zZWQgdG8KPiB3b3Jr
LiBJcyB0aGVyZSBhIGxpbWl0YXRpb24geW91J3JlIHRoaW5raW5nIG9mPwo+IAoKSXQncyB0aGlz
IG9uZSBpbiBkcm1fY2xpZW50X3BhbmVsX3JvdGF0aW9uKCkgd2hpY2ggbGltaXRzIHJvdGF0aW9u
IHRvCkRSTV9NT0RFX1JPVEFURV8xODA6CgoJLyoKCSAqIFRPRE86IHN1cHBvcnQgOTAgLyAyNzAg
ZGVncmVlIGhhcmR3YXJlIHJvdGF0aW9uLAoJICogZGVwZW5kaW5nIG9uIHRoZSBoYXJkd2FyZSB0
aGlzIG1heSByZXF1aXJlIHRoZSBmcmFtZWJ1ZmZlcgoJICogdG8gYmUgaW4gYSBzcGVjaWZpYyB0
aWxpbmcgZm9ybWF0LgoJICovCglpZiAoKnJvdGF0aW9uICE9IERSTV9NT0RFX1JPVEFURV8xODAg
fHwgIXBsYW5lLT5yb3RhdGlvbl9wcm9wZXJ0eSkKCQlyZXR1cm4gZmFsc2U7CgpOb3JhbGYuCgo+
PiBEb2N1bWVudGF0aW9uL2ZiL21vZGVkYi50eHQgbmVlZHMgdG8gYmUgdXBkYXRlZCB3aXRoIHRo
aXMgbmV3IHZpZGVvPSBvcHRpb24uCj4gCj4gV2lsbCBkbywgdGhhbmtzIQo+IAo+IG1heGltZQo+
IAo+IC0tCj4gTWF4aW1lIFJpcGFyZCwgQm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJu
ZWwgZW5naW5lZXJpbmcKPiBodHRwczovL2Jvb3RsaW4uY29tCj4gCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
