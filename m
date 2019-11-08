Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21897F508C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 17:06:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BAA76F9E6;
	Fri,  8 Nov 2019 16:06:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E09C26F9E6
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 16:06:04 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id g17so2969088ybd.13
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2019 08:06:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=pp2jWlCqJKLEk+ibjFXlnfbIxOH3q9oKQMy0Ofpc8qE=;
 b=nn5DTA0RRbYrPlHlWd3KDopncpaONxiBIot/e4+JeQIXtOBg8AqPzsUm2xpTTX6jHe
 ueRR3pF1fN5p+RiM8d1Bdx3+OkK3ipJSHZpE0zOUOSqiXcRLmxd64/9WebdumnJSonHQ
 B8iFP8oSR/X4mUAYAz/0V5TXXOXd+HdJhUqAYwOQVtrmQ6ByQs9joKt1PPCOVkksB1Kh
 VzyGEYON/G8sMi7dfueQfTpVZAxIyxQCkaPhFmM9BUA2fhMxoqIcHHAlG8cff8wT3qyu
 thn+TuFTgohJ22SfacvDH66hCC72cHKl7Uia4IE/YZWS4rDMWuvfk7/mbMpBxJoVCu7j
 RyRA==
X-Gm-Message-State: APjAAAUOSQq3kYsVKnN/TBDexmr0iZOGK3hbiF32RIO5rDbsoFP8wusl
 ZESx6H39MdYIjhGEm59PlCrOHnZccJ4=
X-Google-Smtp-Source: APXvYqwHJn8rPwXJPMSPwZbAmzYjmDgS/hvf7KYotndLpNLBWxDPVgII5ANOE6uR/uxdy54DyxixSw==
X-Received: by 2002:a25:c64b:: with SMTP id k72mr9417242ybf.4.1573229163819;
 Fri, 08 Nov 2019 08:06:03 -0800 (PST)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id 138sm2987950ywr.46.2019.11.08.08.06.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2019 08:06:03 -0800 (PST)
Date: Fri, 8 Nov 2019 11:06:02 -0500
From: Sean Paul <sean@poorly.run>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] drm/rockchip: use DRM_DEV_ERROR for log output
Message-ID: <20191108160602.GG63329@art_vandelay>
References: <20191107092945.15513-1-wambui.karugax@gmail.com>
 <20191107133851.GF63329@art_vandelay>
 <20191108124630.GA10207@wambui> <4996186.DxzAFJqeGu@diego>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4996186.DxzAFJqeGu@diego>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=pp2jWlCqJKLEk+ibjFXlnfbIxOH3q9oKQMy0Ofpc8qE=;
 b=P9+KNuvnFxtHeZW47U9PU1hLw36tD6FBGxejakql8CpvkHWnHxaE2Hsb7Ult2eNypQ
 GfJOBVChlOCUTlmcZG1H+puAgs5DttZdWxZliRFToxhKWccMxT/b0VI05a347WPVP9uY
 k7uIoL08R6YWDSolqaXK0cW9gcfV0NEyYlPI/6raUnB5Wu3yOQDEuVXKPK6QQxDjte/u
 NVLBdMqcIJgzkTG+cvIjn3mPQZoK1A6pS4Fu3joklD3YiDU64B/sUcyDfbqSe+hzpfk+
 gTOUloLnBFdK5+BdO1A3eNjqBPcRGLwipGEtRn6GhK6iCkiDvxjT1gEVcYKAzdmzi6Q1
 yoCg==
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMDgsIDIwMTkgYXQgMDM6MDY6NDRQTSArMDEwMCwgSGVpa28gU3TDvGJuZXIg
d3JvdGU6Cj4gSGksCj4gCj4gW2l0IHNlZW1zIHlvdXIgUmVwbHktVG8gbWFpbCBoZWFkZXIgaXMg
c2V0IHN0cmFuZ2VseSBhcwo+IFJlcGx5LVRvOiAyMDE5MTEwNzEzMzg1MS5HRjYzMzI5QGFydF92
YW5kZWxheQo+IHdoaWNoIGNvbmZ1c2VzIG15IE1UQV0KPiAKPiBBbSBGcmVpdGFnLCA4LiBOb3Zl
bWJlciAyMDE5LCAxMzo0NjozMCBDRVQgc2NocmllYiBXYW1idWkgS2FydWdhOgo+ID4gT24gVGh1
LCBOb3YgMDcsIDIwMTkgYXQgMDg6Mzg6NTFBTSAtMDUwMCwgU2VhbiBQYXVsIHdyb3RlOgo+ID4g
PiBPbiBUaHUsIE5vdiAwNywgMjAxOSBhdCAwMTo1NDoyMkFNIC0wODAwLCBKb2UgUGVyY2hlcyB3
cm90ZToKPiA+ID4gPiBPbiBUaHUsIDIwMTktMTEtMDcgYXQgMTI6MjkgKzAzMDAsIFdhbWJ1aSBL
YXJ1Z2Egd3JvdGU6Cj4gPiA+ID4gPiBSZXBsYWNlIHRoZSB1c2Ugb2YgdGhlIGRldl9lcnIgbWFj
cm8gd2l0aCB0aGUgRFJNX0RFVl9FUlJPUgo+ID4gPiA+ID4gRFJNIGhlbHBlciBtYWNyby4KPiA+
ID4gPiAKPiA+ID4gPiBUaGUgY29tbWl0IG1lc3NhZ2Ugc2hvdWxkIHNob3cgdGhlIHJlYXNvbiBf
d2h5XyB5b3UgYXJlIGRvaW5nCj4gPiA+ID4gdGhpcyBpbnN0ZWFkIG9mIGp1c3Qgc3RhdGluZyB0
aGF0IHlvdSBhcmUgZG9pbmcgdGhpcy4KPiA+ID4gPiAKPiA+ID4gPiBJdCdzIG5vdCB0aGF0IGRl
dl9lcnIgaXMgdW5jb21tb24gaW4gZHJpdmVycy9ncHUvZHJtLgo+ID4gPiA+IAo+ID4gPiAKPiA+
ID4gSXQgaXMgdW5jb21tb24gKHRoaXMgaXMgdGhlIHNvbGUgaW5zdGFuY2UpIGluIHJvY2tjaGlw
LCBob3dldmVyLiBTbyBpdCBtYWtlcwo+ID4gPiBzZW5zZSB0byBjb252ZXJ0IHRoZSBkZXZfKiBw
cmludHMgaW4gcm9ja2NoaXAgdG8gRFJNX0RFViBmb3IgY29uc2lzdGVuY3kuCj4gPiA+IAo+ID4g
PiBXYW1idWksIGNvdWxkIHlvdSBhbHNvIHBsZWFzZSBjb252ZXJ0IHRoZSBkZXZfd2FybiBpbnN0
YW5jZSBhcyB3ZWxsPwo+ID4gPiAKPiA+IEhleSwgU2Vhbi4KPiA+IFRyeWluZyB0byBjb252ZXJ0
IHRoaXMgZGV2X3dhcm4gaW5zdGFuY2UsIGJ1dCB0aGUgY29ycmVzcG9uZGluZyBEUk1fV0FSTgo+
ID4gbWFjcm8gZG9lcyBub3QgdGFrZSB0aGUgZGV2IHBhcmFtZXRlciB3aGljaCBzZWVtcyB0byBi
ZSB1c2VmdWwgaW4gdGhlCj4gPiBvcmlnaW5hbCBvdXRwdXQuCj4gPiBTaG91bGQgSSBzdGlsbCBj
b252ZXJ0IGl0IHRvIERSTV9XQVJOIHdpdGhvdXQgdGhlIGhkbWktPmRldiBwYXJhbWV0ZXI/Cj4g
Cj4gVGhlcmUgZXhpc3RzIERSTV9ERVZfRVJST1IsIERSTV9ERVZfSU5GTyBhbmQgRFJNX0RFVl9E
RUJVRyB0bwo+IGhhbmRsZSBhY3R1YWwgZGV2aWNlcy4gSW50ZXJlc3RpbmdseSB0aGVyZSBpcyBu
byBEUk1fREVWX1dBUk4gdGhvdWdoLgo+IAo+IFNvIGRlcGVuZGluZyBvbiB3aGF0IFNlYW4gc3Vn
Z2VzdCBhbm90aGVyIG9wdGlvbiB3b3VsZCBiZSB0byBhZGQgdGhlCj4gbWlzc2luZyBEUk1fREVW
X1dBUk4gYW5kIHRoZW4gdXNlIGl0IHRvIHJlcGxhY2UgdGhlIGRldl93YXJuLgoKWWVwLCB0aGlz
IHNvdW5kcyBnb29kIHRvIG1lIG1lLgoKU2VhbgoKPiAKPiAKPiBIZWlrbwo+IAo+IAo+IAo+ID4g
Cj4gPiBUaGFua3MsCj4gPiB3YW1idWkKPiA+ID4gSSdsbCBhcHBseSB0aGlzIHRvIGRybS1taXNj
LW5leHQgYW5kIGV4cGFuZCBvbiB0aGUgY29tbWl0IG1lc3NhZ2UgYSBiaXQuCj4gPiA+IAo+ID4g
PiBUaGFua3MsCj4gPiA+IAo+ID4gPiBTZWFuCj4gPiA+IAo+ID4gPiA+ICQgZ2l0IGdyZXAgLXcg
ZGV2X2VyciBkcml2ZXJzL2dwdS9kcm0gfCB3YyAtbAo+ID4gPiA+IDE5NTAKPiA+ID4gPiAkIGdp
dCBncmVwIC13IERSTV9ERVZfRVJST1IgZHJpdmVycy9ncHUvZHJtIHwgd2MgLWwKPiA+ID4gPiA3
NTYKPiA+ID4gPiAKPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2No
aXAvZHctbWlwaS1kc2ktcm9ja2NoaXAuYyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kdy1t
aXBpLWRzaS1yb2NrY2hpcC5jCj4gPiA+ID4gW10KPiA+ID4gPiA+IEBAIC05MTYsNyArOTE2LDcg
QEAgc3RhdGljIGludCBkd19taXBpX2RzaV9yb2NrY2hpcF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQo+ID4gPiA+ID4gIAl9Cj4gPiA+ID4gPiAgCj4gPiA+ID4gPiAgCWlmICgh
ZHNpLT5jZGF0YSkgewo+ID4gPiA+ID4gLQkJZGV2X2VycihkZXYsICJubyBkc2ktY29uZmlnIGZv
ciAlcyBub2RlXG4iLCBucC0+bmFtZSk7Cj4gPiA+ID4gPiArCQlEUk1fREVWX0VSUk9SKGRldiwg
Im5vIGRzaS1jb25maWcgZm9yICVzIG5vZGVcbiIsIG5wLT5uYW1lKTsKPiA+ID4gPiA+ICAJCXJl
dHVybiAtRUlOVkFMOwo+ID4gPiA+ID4gIAl9Cj4gPiA+ID4gCj4gPiA+ID4gCj4gPiA+ID4gCj4g
PiA+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+
ID4gPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPiA+ID4gZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwo+ID4gPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCj4gPiA+IAo+ID4gCj4gCj4gCj4gCj4gCgotLSAKU2VhbiBQYXVs
LCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
