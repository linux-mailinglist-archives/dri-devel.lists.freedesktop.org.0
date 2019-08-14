Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9463C8DC58
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 19:51:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F3A6E7AC;
	Wed, 14 Aug 2019 17:51:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F35EF6E7AC
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 17:51:41 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id a21so7796686edt.11
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 10:51:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=hpZv0dZ+e4/piGCRx6wKcQsVm+Q59rTvsb8q4M4q/Ng=;
 b=idAKdh2Ao6LUSL38YCQzc1K0iLEOjbyCYwaBaUZVj/DrPknIvW7kinZ8gQo6Dtm/78
 4zeBlLC7N4qoFrPL3yBmjPx/eMOFsQok9kVuw2lALv6OUIoh+TjMSDqsA2+9EbmYZpVO
 vh47nAfqypOBkAU5FpnJd+TZJH5DgTGx/jLPy0EJ2Nen5COvSvQmtjX+ynyEvdfyaYlt
 CUyPgVwJHO1R0Hk55Qfg8rKJEv2uYE1mCwdg/gGyQt1zrUMUDbe6ttrlTeyW5hvw/zLn
 cwuVkpGM4enyCJTGERj8S+q7oSGrIcD6GKnTyOIZ6jvI9VVKr5oDT0MeFRsfRdiNiFaO
 htpg==
X-Gm-Message-State: APjAAAVTm3CHQRPQhlstftbqR5t5XZipzV+4W3MvSeZYqrGQj+o7Ahk4
 rQWivEW+WgR6+DmdITh7Pr5WSg==
X-Google-Smtp-Source: APXvYqzq6NGJu/QPxj+8of6Ofj278x+6lu69VJTwhI3zN+sWM2mziWjrL1xh339hck1vUHABB0rn6g==
X-Received: by 2002:a50:eb92:: with SMTP id y18mr900325edr.245.1565805100553; 
 Wed, 14 Aug 2019 10:51:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id z16sm83928edm.59.2019.08.14.10.51.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 10:51:39 -0700 (PDT)
Date: Wed, 14 Aug 2019 19:51:37 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] drm/vboxvideo: Make structure vbox_fb_helper_funcs
 constant
Message-ID: <20190814175137.GU7444@phenom.ffwll.local>
References: <20190813062548.24770-1-nishkadg.linux@gmail.com>
 <687f24b1-c3c5-c9d6-9abb-3c84ae009715@redhat.com>
 <20190814172634.GP7444@phenom.ffwll.local>
 <3d20c06e-ff9a-ff05-350b-9d54ab5161cb@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3d20c06e-ff9a-ff05-350b-9d54ab5161cb@redhat.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=hpZv0dZ+e4/piGCRx6wKcQsVm+Q59rTvsb8q4M4q/Ng=;
 b=LiOHGHYvg4TkBTaSXZ+sFsg0LYTagiM+MxthrG6Ofoon+Dmug0ek5F2Oup677je1AC
 UNWaqAwykthTxmhOxJHtrfs6xF7NCPoPlce0Pm2akdvZabZ6YwhBMHkWictCF2VagtQB
 4xQTytRcsOkPgIHCI4dmwq3oxCb5vboW+th0U=
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
 Nishka Dasgupta <nishkadg.linux@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMDc6MzY6NTVQTSArMDIwMCwgSGFucyBkZSBHb2VkZSB3
cm90ZToKPiBIaSwKPiAKPiBPbiAxNC0wOC0xOSAxOToyNiwgRGFuaWVsIFZldHRlciB3cm90ZToK
PiA+IE9uIFR1ZSwgQXVnIDEzLCAyMDE5IGF0IDA5OjU3OjE5QU0gKzAyMDAsIEhhbnMgZGUgR29l
ZGUgd3JvdGU6Cj4gPiA+IEhpLAo+ID4gPiAKPiA+ID4gT24gMTMtMDgtMTkgMDg6MjUsIE5pc2hr
YSBEYXNndXB0YSB3cm90ZToKPiA+ID4gPiBUaGUgc3RhdGljIHN0cnVjdHVyZSB2Ym94X2ZiX2hl
bHBlcl9mdW5jcywgb2YgdHlwZSBkcm1fZmJfaGVscGVyX2Z1bmNzLAo+ID4gPiA+IGlzIHVzZWQg
b25seSB3aGVuIGl0IGlzIHBhc3NlZCBhcyB0aGUgdGhpcmQgYXJndW1lbnQgdG8KPiA+ID4gPiBk
cm1fZmJfaGVscGVyX2ZiZGV2X3NldHVwKCksIHdoaWNoIGRvZXMgbm90IG1vZGlmeSBpdC4gSGVu
Y2UgbWFrZSBpdAo+ID4gPiA+IGNvbnN0YW50IHRvIHByb3RlY3QgaXQgZnJvbSB1bmludGVuZGVk
IG1vZGlmaWNhdGlvbnMuCj4gPiA+ID4gSXNzdWUgZm91bmQgd2l0aCBDb2NjaW5lbGxlLgo+ID4g
PiA+IAo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IE5pc2hrYSBEYXNndXB0YSA8bmlzaGthZGcubGlu
dXhAZ21haWwuY29tPgo+ID4gPiAKPiA+ID4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2gsIHRoaXMg
bG9va3MgZ29vZCB0byBtZToKPiA+ID4gCj4gPiA+IFJldmlld2VkLWJ5OiBIYW5zIGRlIEdvZWRl
IDxoZGVnb2VkZUByZWRoYXQuY29tPgo+ID4gCj4gPiBJJ20gYXNzdW1pbmcgeW91J2xsIGFwcGx5
IHRoaXMgdG8gZHJtLW1pc2MtbmV4dCB0b28/IEdvb2QgdG8gc3RhdGUgdGhhdCwKPiA+IHRvIGF2
b2lkIGNvbmZ1c2lvbiBhbmQgY29vcmRpbmF0aW9uIGlzc3Vlcy4KPiAKPiBBY3R1YWxseSBJJ20g
c28gdXNlZCB0byB0aGUgd29ya2Zsb3cgaW4gb3RoZXIgc3Vic3lzdGVtcyBJIHdhcwo+IGV4cGVj
dGluZyB0aGUgc3Vic3lzIG1haW50YWluZXIgdG8gcGljayBpdCB1cC4gQnV0IEkga25vdyB0aGF0
Cj4gaXMgbm90IGhvdyBpdCB3b3JrcyBmb3IgdGhlIGRybSBzdWJzeXMgYW5kIHNpbmNlIEknbSB0
aGUgdmJveHZpZGVvCj4gbWFpbnRhaW5lciBJIGd1ZXNzIGl0IG1ha2VzIHNlbnNlIGZvciBtZSB0
byBwaWNrIHRoaXMgdXAgYW5kIHB1c2ggaXQuCgpZZWFoLCBkcm0gc3Vic3lzdGVtIG1haW50YWlu
ZXJzIGFyZSBleGNlZWRpbmdseSBsYXp5IGJhc3RhcmRzLiBTYW1lCmFwcGxpZXMgdG8gc3VidHJl
ZSBtYWludGFpbmVycyAoYXQgbGVhc3QgaW4gbW9zdCBjYXNlcykuCiAKPiBTbyB5ZXMgSSB3aWxs
IHBpY2sgdGhpcyB1cCBhbmQgcHVzaCBpdCB0byBkcm0tbWlzYy1uZXh0LCBzb3JyeQo+IGZvciB0
aGUgY29uZnVzaW9uLgoKVGhhbmtzLCBEYW5pZWwKCj4gCj4gUmVnYXJkcywKPiAKPiBIYW5zCj4g
Cj4gCj4gPiA+ID4gLS0tCj4gPiA+ID4gICAgZHJpdmVycy9ncHUvZHJtL3Zib3h2aWRlby92Ym94
X2Rydi5jIHwgMiArLQo+ID4gPiA+ICAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQo+ID4gPiA+IAo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vdmJveHZpZGVvL3Zib3hfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vdmJveHZpZGVvL3Zib3hf
ZHJ2LmMKPiA+ID4gPiBpbmRleCAwMjUzN2FiOWNjMDguLjJiNTdlYTMxOTVmMiAxMDA2NDQKPiA+
ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmJveHZpZGVvL3Zib3hfZHJ2LmMKPiA+ID4gPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vdmJveHZpZGVvL3Zib3hfZHJ2LmMKPiA+ID4gPiBAQCAtMzIs
NyArMzIsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgcGNpaWRsaXN0W10g
PSB7Cj4gPiA+ID4gICAgfTsKPiA+ID4gPiAgICBNT0RVTEVfREVWSUNFX1RBQkxFKHBjaSwgcGNp
aWRsaXN0KTsKPiA+ID4gPiAtc3RhdGljIHN0cnVjdCBkcm1fZmJfaGVscGVyX2Z1bmNzIHZib3hf
ZmJfaGVscGVyX2Z1bmNzID0gewo+ID4gPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9mYl9o
ZWxwZXJfZnVuY3MgdmJveF9mYl9oZWxwZXJfZnVuY3MgPSB7Cj4gPiA+ID4gICAgCS5mYl9wcm9i
ZSA9IHZib3hmYl9jcmVhdGUsCj4gPiA+ID4gICAgfTsKPiA+ID4gPiAKPiA+IAoKLS0gCkRhbmll
bCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9n
LmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
