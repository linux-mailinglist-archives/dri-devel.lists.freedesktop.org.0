Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 173AA3662AB
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 01:57:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15BBA6E918;
	Tue, 20 Apr 2021 23:57:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 139E86E915;
 Tue, 20 Apr 2021 23:57:40 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 92-20020a9d02e50000b029028fcc3d2c9eso14947268otl.0; 
 Tue, 20 Apr 2021 16:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=znEmkMwEuNpZTNjrNgX8auZmv/MxbCMnb2W49monkys=;
 b=GVmGslbMavTYJCEB5YDV7vPKVrES6hCjXPElLvaZ8xCTmq/1sq4+i3zMHP4DlW3zVj
 a3Sn9CYwlIJQorMuwBwOAyAXznfF6yGrTstFc9tLTUtCIOB8KGhz5PQRePKr+M6ZOsdv
 cbYnfr9wKZvD/2tOHX+nR5zR+2cSp4WGEybv22kiQFRCPmXIu2v5HIcQ5zlJCq9ES62+
 cg898IMEtcSTu766dCX2jgBRw59371oBnTLS4qf6O+dDEzlzQGAhKJTRq4p1rD9V0LZq
 5SJYnBsEewSArBUNZdqWPKx+b8aw77GsA5pFcyQ7FirUWFWdUn0F3IkrbqKUnA8mBXBs
 Uzmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=znEmkMwEuNpZTNjrNgX8auZmv/MxbCMnb2W49monkys=;
 b=Yo8cXCZp4rY4oWV+qBgfkX2pC+h4eUErpdKQ3vRGZGFHB6LMA8BiAW+aB9lxGzMxvw
 7jeXC4jdf02Y4m/NC5wyu+poj7RzuLX11srhjjtqvQsj2FBiHVywOh+yLoTeStZYzoeS
 XgO8Fh6qdzWuMVASSgwYctaf6efrSxILgocmCSLpCTE0731yMAgySjSScF3GX8wAiHRB
 2r5pGxPaRJFlC/vHWM3+lvC+2E6MPynQ5hkLiGZ2supICVkX3EujTwlfH17uOdq3HxCH
 xDozf6QJO7aDpGGWnXtPogp6GxkbcMNNSMQvnzjSvYr7byKMhDuO1/yhn4pst0eLD+Me
 1mFw==
X-Gm-Message-State: AOAM532kkIihjT1x1weeqQMF0X8JP6HvFVsIlkqfC51WO6Ef/fNodm8s
 TdkRIhB9wPh125Nc5bnrl94riMHYMfmb/B+TX/dmTn/CQNtFQA==
X-Google-Smtp-Source: ABdhPJy0WX4lLPLxND4/HFVgGNXBRjQ/mNfR3/MJa/8m1ZFFUa3yeWLUsZ7eZkSrg37tWk3VIErSVNQvG4LUauD3Wv4=
X-Received: by 2002:a05:6830:1f12:: with SMTP id
 u18mr14241509otg.132.1618963059489; 
 Tue, 20 Apr 2021 16:57:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-30-lee.jones@linaro.org>
 <dfb153eb-53cc-ad27-2114-c0db07610a60@amd.com>
In-Reply-To: <dfb153eb-53cc-ad27-2114-c0db07610a60@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 20 Apr 2021 19:57:28 -0400
Message-ID: <CADnq5_PUK_cGJ+x5rx7bTpWq1iSqYKp5QqiTXRgwoucw1WPQng@mail.gmail.com>
Subject: Re: [PATCH 29/40] drm/amd/amdgpu/amdgpu_fence: Provide description
 for 'sched_score'
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Jerome Glisse <glisse@freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Lee Jones <lee.jones@linaro.org>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCk9uIEZyaSwgQXByIDE2LCAyMDIxIGF0IDExOjUyIEFN
IENocmlzdGlhbiBLw7ZuaWcKPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4KPiBB
bSAxNi4wNC4yMSB1bSAxNjozNyBzY2hyaWViIExlZSBKb25lczoKPiA+IEZpeGVzIHRoZSBmb2xs
b3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMpOgo+ID4KPiA+ICAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ZlbmNlLmM6NDQ0OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJh
bWV0ZXIgb3IgbWVtYmVyICdzY2hlZF9zY29yZScgbm90IGRlc2NyaWJlZCBpbiAnYW1kZ3B1X2Zl
bmNlX2RyaXZlcl9pbml0X3JpbmcnCj4gPgo+ID4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVy
LmRldWNoZXJAYW1kLmNvbT4KPiA+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4KPiA+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4g
PiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+ID4gQ2M6IFN1bWl0IFNlbXdh
bCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+Cj4gPiBDYzogSmVyb21lIEdsaXNzZSA8Z2xpc3Nl
QGZyZWVkZXNrdG9wLm9yZz4KPiA+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
ID4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+IENjOiBsaW51eC1tZWRp
YUB2Z2VyLmtlcm5lbC5vcmcKPiA+IENjOiBsaW5hcm8tbW0tc2lnQGxpc3RzLmxpbmFyby5vcmcK
PiA+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Cj4KPiBS
ZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+
Cj4gPiAtLS0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ZlbmNlLmMg
fCAxICsKPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gPgo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9mZW5jZS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ZlbmNlLmMKPiA+IGluZGV4IDQ3ZWE0Njg1OTYx
ODQuLjMwNzcyNjA4ZWFjNmMgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZmVuY2UuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2ZlbmNlLmMKPiA+IEBAIC00MzQsNiArNDM0LDcgQEAgaW50IGFtZGdwdV9mZW5jZV9k
cml2ZXJfc3RhcnRfcmluZyhzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsCj4gPiAgICAqCj4gPiAg
ICAqIEByaW5nOiByaW5nIHRvIGluaXQgdGhlIGZlbmNlIGRyaXZlciBvbgo+ID4gICAgKiBAbnVt
X2h3X3N1Ym1pc3Npb246IG51bWJlciBvZiBlbnRyaWVzIG9uIHRoZSBoYXJkd2FyZSBxdWV1ZQo+
ID4gKyAqIEBzY2hlZF9zY29yZTogb3B0aW9uYWwgc2NvcmUgYXRvbWljIHNoYXJlZCB3aXRoIG90
aGVyIHNjaGVkdWxlcnMKPiA+ICAgICoKPiA+ICAgICogSW5pdCB0aGUgZmVuY2UgZHJpdmVyIGZv
ciB0aGUgcmVxdWVzdGVkIHJpbmcgKGFsbCBhc2ljcykuCj4gPiAgICAqIEhlbHBlciBmdW5jdGlv
biBmb3IgYW1kZ3B1X2ZlbmNlX2RyaXZlcl9pbml0KCkuCj4KPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
