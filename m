Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2F4F6CB7
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 03:30:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D016E831;
	Mon, 11 Nov 2019 02:29:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1955E6F976
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 12:46:44 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id p26so4491762pfq.8
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2019 04:46:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=5rxvla9MqG20qS8PvXLmnssk4K8x/Hmcm3O9O7mRXxw=;
 b=bHvztflnKiWXDoSD3Ry7L8dEDx2XjadhuB27WKeghYocvAefemZQ/FRscqJYOALia7
 WSW/DG1RQSVUuFlOjjHHVdcDSHWyevsvZE1tAZ5cwHqPeUCUGximEvC0PdGYKDQ/cfSE
 s1aALfK5N3Pv/+mLJUYnFt08YoiZAwGt31UyAzzAaUs4APS6mbf2FXpEO0QMZcWXh9rq
 Eb73wUZeIMn/DGDK7xxjlZTAAZ7J58o15Eh+cjnjlmhwODz7LhhkWtwdqlSK2HuAZ6fx
 i7SwEMhoP14ZSOFGfkRy5r2vJSNb0KDDsvtKD9HhqWERmV7e7aK6ikpQLY8PmCE6RdDf
 xHYQ==
X-Gm-Message-State: APjAAAUcL+7WZKYkVsxRaXDX8boE5iPwKSpsX+05N6Qiu2SjdfPf+oNf
 b7t5qlRrFT8GjU8ql73lQW0=
X-Google-Smtp-Source: APXvYqyQ+Qhfryqn9y1yTDk88XHS4CTDkPsbWWZl/mPudP1Bo8G6TeUELgpef4D8uHsAaYCDaB2Pyw==
X-Received: by 2002:a17:90a:c004:: with SMTP id
 p4mr8684007pjt.104.1573217203600; 
 Fri, 08 Nov 2019 04:46:43 -0800 (PST)
Received: from wambui ([197.254.95.38])
 by smtp.gmail.com with ESMTPSA id n23sm5601302pff.137.2019.11.08.04.46.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2019 04:46:42 -0800 (PST)
Date: Fri, 8 Nov 2019 15:46:30 +0300
From: Wambui Karuga <wambui.karugax@gmail.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH] drm/rockchip: use DRM_DEV_ERROR for log output
Message-ID: <20191108124630.GA10207@wambui>
References: <20191107092945.15513-1-wambui.karugax@gmail.com>
 <4c74db2614cefe23f888d0643c2d7c356086745a.camel@perches.com>
 <20191107133851.GF63329@art_vandelay>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191107133851.GF63329@art_vandelay>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Mon, 11 Nov 2019 02:29:25 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5rxvla9MqG20qS8PvXLmnssk4K8x/Hmcm3O9O7mRXxw=;
 b=uPGazBXt00dkMb4XcC5rtgD+hXWx7CX3wPcgEwLyc7/uLOfYxE6FYllxMnuz+mWElt
 TFD5nUaNmEAmii33SlcKmcwRB/VpqoHROLQX9ZyCrtx9I4iBwX8+lYIDPNfhEfijDRba
 bgcv/EsdA1DP+E5Hrr68Xo4mcflJRzSKf1MMQV10Dg+1kcWGz90yKhlmkk11yAfexpqx
 0dL1pT6VkNqhUK5pZzP1sxhyhWIrBVnYdFEDS5ZRUp5L6g4sixLzlXeJSblLGsL8+M+K
 g9JsPudijfoCeT2BTdTQukwx+LJytsnw6bdwQ/QAf/tWC8Qgm7SY9Efvhhs+ViecTSzM
 YUFA==
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
Reply-To: 20191107133851.GF63329@art_vandelay
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMDcsIDIwMTkgYXQgMDg6Mzg6NTFBTSAtMDUwMCwgU2VhbiBQYXVsIHdyb3Rl
Ogo+IE9uIFRodSwgTm92IDA3LCAyMDE5IGF0IDAxOjU0OjIyQU0gLTA4MDAsIEpvZSBQZXJjaGVz
IHdyb3RlOgo+ID4gT24gVGh1LCAyMDE5LTExLTA3IGF0IDEyOjI5ICswMzAwLCBXYW1idWkgS2Fy
dWdhIHdyb3RlOgo+ID4gPiBSZXBsYWNlIHRoZSB1c2Ugb2YgdGhlIGRldl9lcnIgbWFjcm8gd2l0
aCB0aGUgRFJNX0RFVl9FUlJPUgo+ID4gPiBEUk0gaGVscGVyIG1hY3JvLgo+ID4gCj4gPiBUaGUg
Y29tbWl0IG1lc3NhZ2Ugc2hvdWxkIHNob3cgdGhlIHJlYXNvbiBfd2h5XyB5b3UgYXJlIGRvaW5n
Cj4gPiB0aGlzIGluc3RlYWQgb2YganVzdCBzdGF0aW5nIHRoYXQgeW91IGFyZSBkb2luZyB0aGlz
Lgo+ID4gCj4gPiBJdCdzIG5vdCB0aGF0IGRldl9lcnIgaXMgdW5jb21tb24gaW4gZHJpdmVycy9n
cHUvZHJtLgo+ID4gCj4gCj4gSXQgaXMgdW5jb21tb24gKHRoaXMgaXMgdGhlIHNvbGUgaW5zdGFu
Y2UpIGluIHJvY2tjaGlwLCBob3dldmVyLiBTbyBpdCBtYWtlcwo+IHNlbnNlIHRvIGNvbnZlcnQg
dGhlIGRldl8qIHByaW50cyBpbiByb2NrY2hpcCB0byBEUk1fREVWIGZvciBjb25zaXN0ZW5jeS4K
PiAKPiBXYW1idWksIGNvdWxkIHlvdSBhbHNvIHBsZWFzZSBjb252ZXJ0IHRoZSBkZXZfd2FybiBp
bnN0YW5jZSBhcyB3ZWxsPwo+IApIZXksIFNlYW4uClRyeWluZyB0byBjb252ZXJ0IHRoaXMgZGV2
X3dhcm4gaW5zdGFuY2UsIGJ1dCB0aGUgY29ycmVzcG9uZGluZyBEUk1fV0FSTgptYWNybyBkb2Vz
IG5vdCB0YWtlIHRoZSBkZXYgcGFyYW1ldGVyIHdoaWNoIHNlZW1zIHRvIGJlIHVzZWZ1bCBpbiB0
aGUKb3JpZ2luYWwgb3V0cHV0LgpTaG91bGQgSSBzdGlsbCBjb252ZXJ0IGl0IHRvIERSTV9XQVJO
IHdpdGhvdXQgdGhlIGhkbWktPmRldiBwYXJhbWV0ZXI/CgpUaGFua3MsCndhbWJ1aQo+IEknbGwg
YXBwbHkgdGhpcyB0byBkcm0tbWlzYy1uZXh0IGFuZCBleHBhbmQgb24gdGhlIGNvbW1pdCBtZXNz
YWdlIGEgYml0Lgo+IAo+IFRoYW5rcywKPiAKPiBTZWFuCj4gCj4gPiAkIGdpdCBncmVwIC13IGRl
dl9lcnIgZHJpdmVycy9ncHUvZHJtIHwgd2MgLWwKPiA+IDE5NTAKPiA+ICQgZ2l0IGdyZXAgLXcg
RFJNX0RFVl9FUlJPUiBkcml2ZXJzL2dwdS9kcm0gfCB3YyAtbAo+ID4gNzU2Cj4gPiAKPiA+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kdy1taXBpLWRzaS1yb2NrY2hp
cC5jIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2R3LW1pcGktZHNpLXJvY2tjaGlwLmMKPiA+
IFtdCj4gPiA+IEBAIC05MTYsNyArOTE2LDcgQEAgc3RhdGljIGludCBkd19taXBpX2RzaV9yb2Nr
Y2hpcF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gPiAgCX0KPiA+ID4g
IAo+ID4gPiAgCWlmICghZHNpLT5jZGF0YSkgewo+ID4gPiAtCQlkZXZfZXJyKGRldiwgIm5vIGRz
aS1jb25maWcgZm9yICVzIG5vZGVcbiIsIG5wLT5uYW1lKTsKPiA+ID4gKwkJRFJNX0RFVl9FUlJP
UihkZXYsICJubyBkc2ktY29uZmlnIGZvciAlcyBub2RlXG4iLCBucC0+bmFtZSk7Cj4gPiA+ICAJ
CXJldHVybiAtRUlOVkFMOwo+ID4gPiAgCX0KPiA+IAo+ID4gCj4gPiAKPiA+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0Cj4gPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+IAo+IC0tIAo+
IFNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
