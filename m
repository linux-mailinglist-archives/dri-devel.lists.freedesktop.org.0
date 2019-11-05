Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3568CF0170
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 16:29:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A73B86EAB6;
	Tue,  5 Nov 2019 15:29:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 609806EAB6
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 15:29:52 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id k15so10216480lja.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Nov 2019 07:29:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=28try4muClFQlh9iqHPnuMbdLAxeCEgg636Rpb1wZM8=;
 b=nqgfSkO++ss5DrsFPX38Tqc1ZAbxg7a0G7m2qtV15ZVrZwhal8IkjRhxmZwl8ge8YT
 LOPcVCXuNCZldnwt4Bk1ctaZ/Qh1403ox//xKcX6cyBNK1/KOCEiMFgM6sAzotTX1mC1
 Aft9HO78GuN/L1Tm87Ck1WCMU2f7eh9vPrcDHf2hYIXGBpf3d+5J4gBRpXCBIxyj7Q64
 Dtd18TV1uZjAqKckMbx9OQP39xhwTpeVRxDnKsBQA66ClcC9yvlBSLAFsVquVLKdgQzq
 xOV0J5Fhpy3vwJOTxO1uJ93PgTq0FICMSsRJGxuigp0JNMuk7I7mC1c+gCWKeVU3WIyz
 ap+w==
X-Gm-Message-State: APjAAAVarhDv2q6j+e5+qoZ6Y4mLxsjOzMwN1IUyDHhS/NdDFd1vC2OL
 uJO4zjIpgunoPwRICNc8TP6iaWdXa1BLk4NchWo0qw==
X-Google-Smtp-Source: APXvYqxEL3fqUDLcfo6mqdD0ClDkn2bxHuGMnRoW5eEjhGzajtl3kL3nBMiBE8xX5dO1ORsfFdRO106BZJVC38Tulao=
X-Received: by 2002:a2e:a0c9:: with SMTP id f9mr23933312ljm.77.1572967790855; 
 Tue, 05 Nov 2019 07:29:50 -0800 (PST)
MIME-Version: 1.0
References: <20191014184320.GA161094@dtor-ws> <20191105004050.GU57214@dtor-ws>
In-Reply-To: <20191105004050.GU57214@dtor-ws>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 5 Nov 2019 16:29:39 +0100
Message-ID: <CACRpkdak-gW9+OV-SZQVNNi5BuyNzkjkKvHmYp2+eYq4vu2nyg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-tfp410: switch to using
 fwnode_gpiod_get_index()
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=28try4muClFQlh9iqHPnuMbdLAxeCEgg636Rpb1wZM8=;
 b=uo8KLjMarHlD53eWZPrliRhD2xVf0hN4iqn+31jBXWm2aAP/tEyuSyteVhFDm9YH4L
 tFHvrtdmpuTvdt6I9MUh2YqvgIMac1r3Kv870L38T8Tc7l1v0IqTFkLpX8eEl7ktLQcz
 GboVdtCINpiR2TmJO0P35K4JZWIg1QL3/bl7byWg4vljyN+4S+NFhQG36YQpZv8ue3Nj
 QW5grIFQF1eg6TswdZFU0HNtV+ZUpJffTh0Mugnt5dfzmFSLmj+2YhdzaL56+v2TUnoD
 TT78Zucz1PC0L7oI5GYCKQn++/XY9bu+eE4rUukb3yd17VkJakaNTNUIOh7QAqb1P1ge
 4JLQ==
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgNSwgMjAxOSBhdCAxOjQwIEFNIERtaXRyeSBUb3Jva2hvdgo8ZG1pdHJ5LnRv
cm9raG92QGdtYWlsLmNvbT4gd3JvdGU6Cj4gT24gTW9uLCBPY3QgMTQsIDIwMTkgYXQgMTE6NDM6
MjBBTSAtMDcwMCwgRG1pdHJ5IFRvcm9raG92IHdyb3RlOgoKPiA+IEluc3RlYWQgb2YgZndub2Rl
X2dldF9uYW1lZF9ncGlvZCgpIHRoYXQgSSBwbGFuIHRvIGhpZGUgYXdheSwgbGV0J3MgdXNlCj4g
PiB0aGUgbmV3IGZ3bm9kZV9ncGlvZF9nZXRfaW5kZXgoKSB0aGF0IG1pbWljcyBncGlvZF9nZXRf
aW5kZXgoKSwgYnV0Cj4gPiB3b3JrcyB3aXRoIGFyYml0cmFyeSBmaXJtd2FyZSBub2RlLgo+ID4K
PiA+IFJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFz
b25ib2FyZC5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgVG9yb2tob3YgPGRtaXRyeS50
b3Jva2hvdkBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+Cj4gPiBBbmRyemVqLCBOZWlsLAo+ID4KPiA+
IFRoaXMgZGVwZW5kcyBvbiB0aGUgbmV3IGNvZGUgdGhhdCBjYW4gYmUgYm91bmQgaW4KPiA+IGli
LWZ3bm9kZS1ncGlvZC1nZXQtaW5kZXggaW1tdXRhYmxlIGJyYW5jaCBvZiBMaW51cycgV2FsbGVp
aiB0cmVlOgo+ID4KPiA+ICAgICAgICAgZ2l0IHB1bGwgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L2xpbnVzdy9saW51eC1ncGlvLmdpdCBpYi1md25vZGUtZ3Bp
b2QtZ2V0LWluZGV4Cj4gPgo+ID4gSSBob3BlIHRoYXQgaXQgd291bGQgYmUgcG9zc2libGUgdG8g
cHVsbCBpbiB0aGlzIGltbXV0YWJsZSBicmFuY2ggYW5kCj4gPiBub3Qgd2FpdCB1bnRpbCBhZnRl
ciA1LjUgbWVyZ2Ugd2luZG93LCBvciwgYWx0ZXJuYXRpdmVseSwgbWVyZ2UgdGhyb3VnaAo+ID4g
TGludXMgV2FsbGVpaidzIHRyZWUuCj4KPiBBbnkgY2hhbmNlIHRoaXMgY291bGQgYmUgbWVyZ2Vk
LCBwbGVhc2U/CgpJJ20gaGFwcHkgdG8gbWVyZ2UgaXQgaW50byB0aGUgR1BJTyB0cmVlIGlmIHNv
bWUgRFJNIG1haW50YWluZXIgY2FuCnByb3ZpZGUgYW4gQUNLLgoKR2V0dGluZyBBQ0sgZnJvbSBE
Uk0gcGVvcGxlIGlzIHByb2JsZW1hdGljIGFuZCBhIGJpdCBvZiBmcmljdGlvbiBpbiB0aGUKY29t
bXVuaXR5LCBEVmV0dGVyIHVzdWFsbHkgYWR2aWNlIHRvIHNlZWsgbXV0dWFsIHJldmlld3MgZXRj
LCBidXQgSU1PCml0IHdvdWxkIGJlIGJldHRlciBpZiBzb21lIHBlb3BsZSBmZWx0IG1vcmUgY29t
cGVsbGVkIHRvIHJldmlldyBzdHVmZgpldmVudHVhbGx5LiAoQW5kIHRoYXQgaGFzIHRoZSBwcm9i
bGVtIHRoYXQgaXQgZG9lc24ndCBzY2FsZS4pCgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
