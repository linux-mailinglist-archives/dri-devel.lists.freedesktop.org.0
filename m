Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2390BFB1CB
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 14:52:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D9E16ED12;
	Wed, 13 Nov 2019 13:52:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D5B6ED12
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 13:52:35 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id d22so2650474lji.8
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 05:52:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KyCaCCfWBOINbn7kh6i3qJOp8XPmOM9fa7QHBkh+4VE=;
 b=KnhVfTvnXdA1x3A/AJVK6cLX52DxO+TGZdp1lDt7k1sIc0EF+xEdhSO8Z9UmySiOm0
 U+jymT8j1kNUoCyjdCHCWeAmP4/eWQ9CMc+sV9pUheordTL6Xd9qu40G/AA6YrFeXMoY
 OiBDtECjVEywdMFs9AmYFyiSFIuASOe8y0zhFknfqQLL5cE5D/H24xyUeIZB0t9N4uyZ
 VihOTSGsbB6FP+P380DZN7rYHOwCgxKRtEgUWtFbjAzSb/b5pdjV14z2TOFG2mqqbCFA
 ZkYOBKbNQOw6dGy3av11cRJt70S4AUKDJb2nsvBWZt5nKyDckXj9n6IFktV7mPgGgran
 oRJw==
X-Gm-Message-State: APjAAAXn6SHt+fhCue6txbM9uvM8WJ5qgbaf4gqxkIOJu46Ks+SlAD6/
 dxygo2HbAVTmjNiRQZjubUO5wIFvs91wukS+fLhnEQ==
X-Google-Smtp-Source: APXvYqwW5jWVJFHvPatvx+5Uafl6Y4kdh7Hv2nQ1whBv+PrGGl3XmyfhiAZkbrBJslMf1I6D0AFeGfskbMrj03akYJU=
X-Received: by 2002:a2e:8597:: with SMTP id b23mr2798713lji.218.1573653154150; 
 Wed, 13 Nov 2019 05:52:34 -0800 (PST)
MIME-Version: 1.0
References: <20191014184320.GA161094@dtor-ws> <20191105004050.GU57214@dtor-ws>
 <CACRpkdak-gW9+OV-SZQVNNi5BuyNzkjkKvHmYp2+eYq4vu2nyg@mail.gmail.com>
 <CAKMK7uG7FQ3bDWsTxq0n8Osh7jjws5ia3PFJXvDdo=nxKu7+Ng@mail.gmail.com>
In-Reply-To: <CAKMK7uG7FQ3bDWsTxq0n8Osh7jjws5ia3PFJXvDdo=nxKu7+Ng@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 13 Nov 2019 14:52:23 +0100
Message-ID: <CACRpkdYY_W8_L4---iMORt6vriUa9wKEi0d_kiMRbB_NQatRog@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-tfp410: switch to using
 fwnode_gpiod_get_index()
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=KyCaCCfWBOINbn7kh6i3qJOp8XPmOM9fa7QHBkh+4VE=;
 b=Ci1YJZmdB2Q2xO8P8ZdU5WgniMH8a5hnf6ZkAVx0eSPqbbK8FstfQDpuqQ0TJKycDs
 okSgKVUg3ewqFjrcMTQuSYl76f6x/dN8tN3p+yaahJUVQJJVbWXpJfyAROrp4gUHpzFw
 +CTTjEoPH03lrRSQ0AGkkREZcJRujo3J/rAVvbxSthO86QPxgD4Xb6MpHpfIpgvZ3sI7
 QZiKWqyV1ywUW03vvgfqW9jbrkq+KPVKB5A0fIV0sscO1/2DmCOeu+s8i+0QvkwQCeZb
 A5/zJpnugkJApnSwXPfRdoafoFYl80x17d+cI84FcN0CSeipZVo6saESTHnAlml8/Yl9
 MESQ==
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
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgNSwgMjAxOSBhdCA0OjQxIFBNIERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD4gd3JvdGU6Cj4gT24gVHVlLCBOb3YgNSwgMjAxOSBhdCA0OjI5IFBNIExpbnVzIFdhbGxl
aWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4gd3JvdGU6Cj4gPiBPbiBUdWUsIE5vdiA1LCAy
MDE5IGF0IDE6NDAgQU0gRG1pdHJ5IFRvcm9raG92Cj4gPiA8ZG1pdHJ5LnRvcm9raG92QGdtYWls
LmNvbT4gd3JvdGU6Cgo+ID4gSSdtIGhhcHB5IHRvIG1lcmdlIGl0IGludG8gdGhlIEdQSU8gdHJl
ZSBpZiBzb21lIERSTSBtYWludGFpbmVyIGNhbgo+ID4gcHJvdmlkZSBhbiBBQ0suCj4KPiBBY2su
CgpUaGFua3MhCgo+ID4gR2V0dGluZyBBQ0sgZnJvbSBEUk0gcGVvcGxlIGlzIHByb2JsZW1hdGlj
IGFuZCBhIGJpdCBvZiBmcmljdGlvbiBpbiB0aGUKPiA+IGNvbW11bml0eSwgRFZldHRlciB1c3Vh
bGx5IGFkdmljZSB0byBzZWVrIG11dHVhbCByZXZpZXdzIGV0YywgYnV0IElNTwo+ID4gaXQgd291
bGQgYmUgYmV0dGVyIGlmIHNvbWUgcGVvcGxlIGZlbHQgbW9yZSBjb21wZWxsZWQgdG8gcmV2aWV3
IHN0dWZmCj4gPiBldmVudHVhbGx5LiAoQW5kIHRoYXQgaGFzIHRoZSBwcm9ibGVtIHRoYXQgaXQg
ZG9lc24ndCBzY2FsZS4pCj4KPiBUaGlzIGhhcyBhIHJldmlldyBhbHJlYWR5IHBsdXMgaWYgeW91
IG1lcmdlIHlvdXIgaW1wbGllZCByZXZpZXcuCgpZZWFoIEkgbWlzc2VkIExhdXJlbnQncyByZXZp
ZXcgdGFnLiBJIG5lZWRlZCBzb21lIGt1bmQgb2YgY29uc2VudAp0byB0YWtlIGl0IGludG8gdGhl
IEdQSU8gdHJlZSBJIHN1cHBvc2UuCgo+IFRoYXQncyBtb3JlIHRoYW4gZ29vZCBlbm91Z2ggaW1v
LCBzbyBub3Qgc2VlaW5nIHRoZSBpc3N1ZSBoZXJlPwoKTm8gaXNzdWUuCgpXaGF0IGZyZWFrZWQg
bWUgb3V0IHdhcyB0aGUgb3B0aW9uIG9mIGhhdmluZyB0byBwdWxsIGluIGFuCmltbXV0YWJsZSBi
cmFuY2ggZnJvbSBteSBHUElPIHRyZWUgaW50byBkcm0tbWlzYy4gVGhhdCB3b3VsZApoYXZlIGJl
ZW4gc2NhcnkuIEtlZXBpbmcgaXQgYWxsIGluIG15IHRyZWUgd29ya3MgZmluZS4KCllvdXJzLApM
aW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
