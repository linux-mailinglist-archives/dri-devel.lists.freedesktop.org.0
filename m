Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCB12EF95C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 21:38:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E8776E811;
	Fri,  8 Jan 2021 20:38:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B08606E811;
 Fri,  8 Jan 2021 20:38:32 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id w3so10890303otp.13;
 Fri, 08 Jan 2021 12:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=F+uxettFRGlky9UwEMbAbyahgwrq7aawL5w5fcWbkBw=;
 b=IKm2Sfbj/rGYjYdtMySxzLxQ63/8U3+HzMldHBp0WK8F7M4aut+Td4yEkiAzQWi1h8
 L7msbhbiXEfUBKBsm521k+mcQgS1OBrApC/WxCfBt0j76wlLPRWUEhxHCOJmDKQW7rqP
 +Yn1qKhg91qdo+U9OEsjMGbkTFb1xMua4kJVZbP11xKXkaKTfJKniudOYqh84ag4OUmL
 S/g48yhAmRGkQC8vtW0C7y3SmJlBWOmRZIkbMI8hPdDsxs9P3JWwWkL7I57VOEaLBnVG
 hLwoLaf1jTWOcdF3GK8mpIWja45uxCxPrZR66syvQshT2XyDWkGf2IlAodIu6MLh4hjN
 6mGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=F+uxettFRGlky9UwEMbAbyahgwrq7aawL5w5fcWbkBw=;
 b=kMcYQskXiwwQMTHpvbYZTNQPUxsUcHkJhYka61v1R1D9rkFjV6IKcT57rbQMADBQYJ
 8rAk8zp6VyCjwBsaAGwchw7LtvLpAlbAia2AbBNnR677a7yLJSi3z6GYEhNB5gGkT5/K
 r/I0l0vy3rJKHQjizRy9+2RFUAHCw32WyXbNPi5gDXcOSGD0LxmFkd2sgw1u8EwDwKSy
 3n/Q/H0RdVx26WlHXtMs8smDyFXndINEniK2Ouolxohz1wWlwe56qcpRbnmZDOqLnOP9
 famfCV1fRMIWjLmpUg5Yl/TJjhaVJous19gAsn2+OKfx/iua7CXrGuh4XY+/9iMREAd7
 o6gQ==
X-Gm-Message-State: AOAM5333EeIWbJLl1/E8iizVWUq+6dDy+3UmJSUrS+nUP2b7hnu2/j3z
 cOrtCGr7LNy8VZF8GA42eNVp/voCkracuYylg3M=
X-Google-Smtp-Source: ABdhPJyo8W/DJW80s6mGIS4+XeSXcytFk1+4aHTkpjMoWGZLJOaZkhzJIbhnUhtDeNWFl8ywBkIrXIEKJ62N6myB/vc=
X-Received: by 2002:a05:6830:1b7b:: with SMTP id
 d27mr3992917ote.132.1610138312081; 
 Fri, 08 Jan 2021 12:38:32 -0800 (PST)
MIME-Version: 1.0
References: <20210108201457.3078600-1-lee.jones@linaro.org>
 <20210108201457.3078600-14-lee.jones@linaro.org>
In-Reply-To: <20210108201457.3078600-14-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 8 Jan 2021 15:38:21 -0500
Message-ID: <CADnq5_O6dmro2Rjjf8m3cJ4Mtv3utoLCmtqBjgFT9NtNXUFEWQ@mail.gmail.com>
Subject: Re: [PATCH 13/40] drm/amd/display/dc/basics/conversion: Demote
 obvious kernel-doc abuse
To: Lee Jones <lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKYW4gOCwgMjAyMSBhdCAzOjE1IFBNIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+IHdyb3RlOgo+Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdh
cm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9i
YXNpY3MvY29udmVyc2lvbi5jOjg2OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVt
YmVyICdtYXRyaXgnIG5vdCBkZXNjcmliZWQgaW4gJ2NvbnZlcnRfZmxvYXRfbWF0cml4Jwo+ICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2Jhc2ljcy9jb252ZXJzaW9u
LmM6ODY6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2ZsdCcgbm90IGRl
c2NyaWJlZCBpbiAnY29udmVydF9mbG9hdF9tYXRyaXgnCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvYmFzaWNzL2NvbnZlcnNpb24uYzo4Njogd2FybmluZzogRnVu
Y3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnYnVmZmVyX3NpemUnIG5vdCBkZXNjcmliZWQgaW4g
J2NvbnZlcnRfZmxvYXRfbWF0cml4Jwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9k
aXNwbGF5L2RjL2Jhc2ljcy9jb252ZXJzaW9uLmM6ODY6IHdhcm5pbmc6IEV4Y2VzcyBmdW5jdGlv
biBwYXJhbWV0ZXIgJ3BhcmFtJyBkZXNjcmlwdGlvbiBpbiAnY29udmVydF9mbG9hdF9tYXRyaXgn
Cj4KPiBDYzogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+Cj4gQ2M6IExl
byBMaSA8c3VucGVuZy5saUBhbWQuY29tPgo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20+Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERh
bmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogTGVlIEpvbmVzIDxsZWUuam9uZXNA
bGluYXJvLm9yZz4KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8
bGVlLmpvbmVzQGxpbmFyby5vcmc+CgpBcHBsaWVkLiAgVGhhbmtzIQoKQWxleAoKPiAtLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Jhc2ljcy9jb252ZXJzaW9uLmMgfCA5ICsr
Ky0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygt
KQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9iYXNpY3Mv
Y29udmVyc2lvbi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Jhc2ljcy9jb252
ZXJzaW9uLmMKPiBpbmRleCAyNGVkMDNkOGNkYTc0Li42NzY3ZmFiNTVjMjYwIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9iYXNpY3MvY29udmVyc2lvbi5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Jhc2ljcy9jb252ZXJzaW9uLmMK
PiBAQCAtNzMsMTIgKzczLDkgQEAgdWludDE2X3QgZml4ZWRfcG9pbnRfdG9faW50X2ZyYWMoCj4K
PiAgICAgICAgIHJldHVybiByZXN1bHQ7Cj4gIH0KPiAtLyoqCj4gLSogY29udmVydF9mbG9hdF9t
YXRyaXgKPiAtKiBUaGlzIGNvbnZlcnRzIGEgZG91YmxlIGludG8gSFcgcmVnaXN0ZXIgc3BlYyBk
ZWZpbmVkIGZvcm1hdCBTMkQxMy4KPiAtKiBAcGFyYW0gOgo+IC0qIEByZXR1cm4gTm9uZQo+IC0q
Lwo+ICsvKgo+ICsgKiBjb252ZXJ0X2Zsb2F0X21hdHJpeCAtIFRoaXMgY29udmVydHMgYSBkb3Vi
bGUgaW50byBIVyByZWdpc3RlciBzcGVjIGRlZmluZWQgZm9ybWF0IFMyRDEzLgo+ICsgKi8KPiAg
dm9pZCBjb252ZXJ0X2Zsb2F0X21hdHJpeCgKPiAgICAgICAgIHVpbnQxNl90ICptYXRyaXgsCj4g
ICAgICAgICBzdHJ1Y3QgZml4ZWQzMV8zMiAqZmx0LAo+IC0tCj4gMi4yNS4xCj4KPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
