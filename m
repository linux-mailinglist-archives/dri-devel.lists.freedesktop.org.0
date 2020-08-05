Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C5E23C526
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 07:34:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1200689ECD;
	Wed,  5 Aug 2020 05:34:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CBC189ECD
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 05:34:30 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id y134so17930063yby.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Aug 2020 22:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ucd8gOiAAZHbDAeLwBmuyJyu6gD51CWTG552YBC7mug=;
 b=dnPoiQV1YwUxvrA2iTN9dAKKFNkUQ9iCzczglQMBqYEf9tCFq22YSgGyUAlkGPd1jj
 /iSonb/mZg2XibtWV6McOvF33Se78DCxW6Z0wC2G2hjoMY2pCFFCxVVtNJvJd+RzXAsF
 fdzpdWmVjy14xlN65GrpRxiAfq+EoZUP1OmG22GAB5qBZCTiUkid1wNr9g+1GC4pQCG9
 X2djOZuIesnvcyYkSwAErhZGmGPxNYa8FsSLJu4MrTBnjq5Zh2gKEjcUclKVUA+k/5oQ
 13qh+qm1YDCbN6uGkwtwn5VR5uPXSKlpSR62xDoNaaxvGEVNEgQkjK6gyKxA55RqTJnt
 SDnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ucd8gOiAAZHbDAeLwBmuyJyu6gD51CWTG552YBC7mug=;
 b=A0jl8buWv0LzO1oYKuQLziN/A4Ho7i9BUVOGDVb6iMNCjU8iDTJAPDcf7f/IIdsIS+
 vaSn6sh1WPS/7pyiOf3KuliWbot9G0rXNKv26nYyRKOElrNPZ2HYSdBR3Z9ncfECGEY2
 AEtDSMFmVEeHm/2Wi6U9XAX91pP/3pTxIW8ULA3paTXikBXvzDDILLe11hnvJYlbil/Q
 MuJ9D/wybQ2QpdJLyzvv9ZEZLagoZ9yVdJ3cVnjAfqWXMOo65tEteeXC3oC5fx2ojgyr
 cq/kxFEbigzuOrRWVfqArLfTfmFcOwG/QSwKrEK8cxDXVOqOd7Sg6rzlkzR12f8rfzWw
 4SgA==
X-Gm-Message-State: AOAM533KsmZ3UDWimD44RCumMm2dbUSHgunQm0t3DuIO8fjRUBrZNtXL
 SStw4It8nxeYfU3ipkU7au4F9+dkxwy4iPUdpds=
X-Google-Smtp-Source: ABdhPJyBKksiBd7z4g0mVuoNOE+OYkrO+F1EKsbeBTbnb2dBQN7OrC+af7JhecSbbC+E14ToDAYjzyKBDXg4Sx6Bmow=
X-Received: by 2002:a25:cf08:: with SMTP id f8mr2163842ybg.435.1596605669399; 
 Tue, 04 Aug 2020 22:34:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200804025632.3868079-1-airlied@gmail.com>
 <20200804025632.3868079-10-airlied@gmail.com>
In-Reply-To: <20200804025632.3868079-10-airlied@gmail.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Wed, 5 Aug 2020 15:34:18 +1000
Message-ID: <CACAvsv7=qS05nLmbXrB6dCB+5LtWi3Q-RN=UCXMiwjcu2C2D7w@mail.gmail.com>
Subject: Re: [PATCH 09/59] drm/nouveau/ttm: don't fill in blank ttm debug
 callback
To: Dave Airlie <airlied@gmail.com>
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
Cc: sroland@vmware.com, ML dri-devel <dri-devel@lists.freedesktop.org>,
 linux-graphics-maintainer@vmware.com, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCA0IEF1ZyAyMDIwIGF0IDEyOjU3LCBEYXZlIEFpcmxpZSA8YWlybGllZEBnbWFpbC5j
b20+IHdyb3RlOgo+Cj4gRnJvbTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KPgo+
IEFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4g
U2lnbmVkLW9mZi1ieTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KUmV2aWV3ZWQt
Ynk6IEJlbiBTa2VnZ3MgPGJza2VnZ3NAcmVkaGF0LmNvbT4KCj4gLS0tCj4gIGRyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L25vdXZlYXVfdHRtLmMgfCA5IC0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgOSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9ub3V2ZWF1X3R0bS5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV90dG0uYwo+
IGluZGV4IGIwMDEyMDIxYWUxMi4uNmRlNzYyYTBjMjI5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfdHRtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9ub3V2ZWF1X3R0bS5jCj4gQEAgLTQ5LDEyICs0OSw2IEBAIG5vdXZlYXVfbWFuYWdlcl9k
ZWwoc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW4sIHN0cnVjdCB0dG1fbWVtX3JlZyAq
cmVnKQo+ICAgICAgICAgbm91dmVhdV9tZW1fZGVsKHJlZyk7Cj4gIH0KPgo+IC1zdGF0aWMgdm9p
ZAo+IC1ub3V2ZWF1X21hbmFnZXJfZGVidWcoc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICpt
YW4sCj4gLSAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkcm1fcHJpbnRlciAqcHJpbnRlcikK
PiAtewo+IC19Cj4gLQo+ICBzdGF0aWMgaW50Cj4gIG5vdXZlYXVfdnJhbV9tYW5hZ2VyX25ldyhz
dHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiwKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKPiBAQCAtODYsNyArODAsNiBAQCBjb25z
dCBzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXJfZnVuYyBub3V2ZWF1X3ZyYW1fbWFuYWdlciA9
IHsKPiAgICAgICAgIC50YWtlZG93biA9IG5vdXZlYXVfbWFuYWdlcl9maW5pLAo+ICAgICAgICAg
LmdldF9ub2RlID0gbm91dmVhdV92cmFtX21hbmFnZXJfbmV3LAo+ICAgICAgICAgLnB1dF9ub2Rl
ID0gbm91dmVhdV9tYW5hZ2VyX2RlbCwKPiAtICAgICAgIC5kZWJ1ZyA9IG5vdXZlYXVfbWFuYWdl
cl9kZWJ1ZywKPiAgfTsKPgo+ICBzdGF0aWMgaW50Cj4gQEAgLTExMiw3ICsxMDUsNiBAQCBjb25z
dCBzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXJfZnVuYyBub3V2ZWF1X2dhcnRfbWFuYWdlciA9
IHsKPiAgICAgICAgIC50YWtlZG93biA9IG5vdXZlYXVfbWFuYWdlcl9maW5pLAo+ICAgICAgICAg
LmdldF9ub2RlID0gbm91dmVhdV9nYXJ0X21hbmFnZXJfbmV3LAo+ICAgICAgICAgLnB1dF9ub2Rl
ID0gbm91dmVhdV9tYW5hZ2VyX2RlbCwKPiAtICAgICAgIC5kZWJ1ZyA9IG5vdXZlYXVfbWFuYWdl
cl9kZWJ1Zwo+ICB9Owo+Cj4gIHN0YXRpYyBpbnQKPiBAQCAtMTQ3LDcgKzEzOSw2IEBAIGNvbnN0
IHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlcl9mdW5jIG52MDRfZ2FydF9tYW5hZ2VyID0gewo+
ICAgICAgICAgLnRha2Vkb3duID0gbm91dmVhdV9tYW5hZ2VyX2ZpbmksCj4gICAgICAgICAuZ2V0
X25vZGUgPSBudjA0X2dhcnRfbWFuYWdlcl9uZXcsCj4gICAgICAgICAucHV0X25vZGUgPSBub3V2
ZWF1X21hbmFnZXJfZGVsLAo+IC0gICAgICAgLmRlYnVnID0gbm91dmVhdV9tYW5hZ2VyX2RlYnVn
Cj4gIH07Cj4KPiAgaW50Cj4gLS0KPiAyLjI2LjIKPgo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
