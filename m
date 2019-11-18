Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0AD1001CC
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 10:53:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38DBB89312;
	Mon, 18 Nov 2019 09:53:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9446189312
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 09:53:15 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id j18so15497612wmk.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 01:53:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pgpDulYEB+k/2d5PKr9V8U4GTVUGdXAGXq/v0keVmDY=;
 b=tkkswpI8k+0L3feul5nxiA6W3wOjHTs6VOx1rHNgrGEqT5asP31Q6x00dUhQfMtuYY
 KxWMTF9PE3wiil3oOc+7WkDUd1yhhPIlAIIuqdao3U781oQioWR9k/vpCvmn51w8sDq+
 A2eNuPaxuw9mzVPOxG24yDHUYXiCp8bNEcZTIgiqhwPkTQRmuFL7baNNKMGPV4KHAwZ+
 OAzhk9ffGxu92i4QPrFEWi6g83Y3b687bk+mPSIwfSY3xpz1js+1B1Zu/mbKoBFt6En4
 p3TuxrJjsR/xJ0jir/5jcDGRxpuoaJSiEL9X0c5J2YFGlslgiJ4iEdHHz9PgcwuyC1LE
 MGGQ==
X-Gm-Message-State: APjAAAWrvLGIM9Y4FSSNgjq80pBw9/aovBK+aA2Ygw0wo17NoXwrdj10
 z3iXRnRI/J4LUcXR/CWJ2Q6ERg==
X-Google-Smtp-Source: APXvYqwpcEpu65M0JQzYX5FBABGOqUtjDtzpN8qlfsH6AHLBCsLvMaDs3DiM8Z+GYc1BOtNKMDLwyQ==
X-Received: by 2002:a1c:8086:: with SMTP id
 b128mr27665096wmd.104.1574070794186; 
 Mon, 18 Nov 2019 01:53:14 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id z2sm10325487wrs.89.2019.11.18.01.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 01:53:13 -0800 (PST)
Date: Mon, 18 Nov 2019 10:53:11 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: zhengbin <zhengbin13@huawei.com>
Subject: Re: [PATCH] drm/gma500: remove set but not used variable 'channel_eq'
Message-ID: <20191118095311.GD23790@phenom.ffwll.local>
References: <1573902268-117518-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1573902268-117518-1-git-send-email-zhengbin13@huawei.com>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=pgpDulYEB+k/2d5PKr9V8U4GTVUGdXAGXq/v0keVmDY=;
 b=XyvM8u1WNR4GaPbWKAwZobjU67gQ+FcLNLJzAQDLxS7aICNrPWetLaUcQfMGnDImwb
 oR2BH7+MDXpGw9etdkySm0mPwlrymVSInOIQ9nio4hWJLLIBqlsDOiTNT8ZAD0tnkb7E
 AC+RiiN0c+OrEGaBsh/ojUuwBAQD2d2RkZVO4=
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
Cc: airlied@linux.ie, daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBOb3YgMTYsIDIwMTkgYXQgMDc6MDQ6MjhQTSArMDgwMCwgemhlbmdiaW4gd3JvdGU6
Cj4gRml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgo+IAo+IGRy
aXZlcnMvZ3B1L2RybS9nbWE1MDAvY2R2X2ludGVsX2RwLmM6IEluIGZ1bmN0aW9uIGNkdl9pbnRl
bF9kcF9jb21wbGV0ZV9saW5rX3RyYWluOgo+IGRyaXZlcnMvZ3B1L2RybS9nbWE1MDAvY2R2X2lu
dGVsX2RwLmM6MTU5Njo3OiB3YXJuaW5nOiB2YXJpYWJsZSBjaGFubmVsX2VxIHNldCBidXQgbm90
IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCj4gCj4gSXQgaXMgbmV2ZXIgdXNlZCwg
c28gcmVtb3ZlIGl0Lgo+IAo+IFJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2Vp
LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiB6aGVuZ2JpbiA8emhlbmdiaW4xM0BodWF3ZWkuY29tPgoK
UXVldWVkIGZvciA1LjYgdGhhbmtzIGZvciB5b3VyIHBhdGNoLgotRGFuaWVsCgo+IC0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0vZ21hNTAwL2Nkdl9pbnRlbF9kcC5jIHwgMyAtLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9n
bWE1MDAvY2R2X2ludGVsX2RwLmMgYi9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2Nkdl9pbnRlbF9k
cC5jCj4gaW5kZXggNTcwYjU5NS4uNTc3MmIyZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vZ21hNTAwL2Nkdl9pbnRlbF9kcC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9j
ZHZfaW50ZWxfZHAuYwo+IEBAIC0xNTk0LDcgKzE1OTQsNiBAQCBjZHZfaW50ZWxfZHBfY29tcGxl
dGVfbGlua190cmFpbihzdHJ1Y3QgZ21hX2VuY29kZXIgKmVuY29kZXIpCj4gIHsKPiAgCXN0cnVj
dCBkcm1fZGV2aWNlICpkZXYgPSBlbmNvZGVyLT5iYXNlLmRldjsKPiAgCXN0cnVjdCBjZHZfaW50
ZWxfZHAgKmludGVsX2RwID0gZW5jb2Rlci0+ZGV2X3ByaXY7Cj4gLQlib29sIGNoYW5uZWxfZXEg
PSBmYWxzZTsKPiAgCWludCB0cmllcywgY3JfdHJpZXM7Cj4gIAl1MzIgcmVnOwo+ICAJdWludDMy
X3QgRFAgPSBpbnRlbF9kcC0+RFA7Cj4gQEAgLTE2MDIsNyArMTYwMSw2IEBAIGNkdl9pbnRlbF9k
cF9jb21wbGV0ZV9saW5rX3RyYWluKHN0cnVjdCBnbWFfZW5jb2RlciAqZW5jb2RlcikKPiAgCS8q
IGNoYW5uZWwgZXF1YWxpemF0aW9uICovCj4gIAl0cmllcyA9IDA7Cj4gIAljcl90cmllcyA9IDA7
Cj4gLQljaGFubmVsX2VxID0gZmFsc2U7Cj4gCj4gIAlEUk1fREVCVUdfS01TKCJcbiIpOwo+ICAJ
CXJlZyA9IERQIHwgRFBfTElOS19UUkFJTl9QQVRfMjsKPiBAQCAtMTY0OCw3ICsxNjQ2LDYgQEAg
Y2R2X2ludGVsX2RwX2NvbXBsZXRlX2xpbmtfdHJhaW4oc3RydWN0IGdtYV9lbmNvZGVyICplbmNv
ZGVyKQo+IAo+ICAJCWlmIChjZHZfaW50ZWxfY2hhbm5lbF9lcV9vayhlbmNvZGVyKSkgewo+ICAJ
CQlEUk1fREVCVUdfS01TKCJQVDIgdHJhaW4gaXMgZG9uZVxuIik7Cj4gLQkJCWNoYW5uZWxfZXEg
PSB0cnVlOwo+ICAJCQlicmVhazsKPiAgCQl9Cj4gCj4gLS0KPiAyLjcuNAo+IAoKLS0gCkRhbmll
bCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9n
LmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
