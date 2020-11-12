Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 575C32B1079
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 22:31:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A3A66E44D;
	Thu, 12 Nov 2020 21:31:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F7C6E44C;
 Thu, 12 Nov 2020 21:31:27 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id c16so6731470wmd.2;
 Thu, 12 Nov 2020 13:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ltphK80Dwi9gQznPlQlyN4YpIhHPKbIf2gVpfnE2HcI=;
 b=bP2LN9S5Pf4fuiSRQsCYX6czzue5yO3/VjUACYDpYHgUjxZ2oc98jY4tEnXQoZ2wEj
 vKZPnSQvLj+0Yf3+H1gZXB4Bo2rnIuELOo63ZH2Q7GmQPEQr/zi9je2CfCZLi/X8t1+b
 7iuXWehIyHKJFRlcE/ytv37gU2FE+hvHwB5HrRgTHkZl7dV1A9ltfUuoQmxjjWQxgQ7R
 /S3LaNmgn00CZyzq7cjtSQAnM41w9YMdKuf8taxDagQ6+9aXPqTo7IQcd4g+mw5O0cmQ
 Iw6EC86a5CxJOjBN/UWei8jXz/I+FPnVG6/5atgP3yfqLTNNiiTyzWMa8ku04AlsH9jM
 tsXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ltphK80Dwi9gQznPlQlyN4YpIhHPKbIf2gVpfnE2HcI=;
 b=sXeKvpvkQJz6mSzJwilAKbojd0TZgXAYLv1/VgYNcGpK829+5jetBL6QAKAxbNLRgo
 YWWm6oeJPVX8cGxKphDuNXUqFZjXOL5vLgiy+WN/qDily5U1FR8bH0TyrilOceAPX4/S
 c6drzJfQf0YAGUIqhkgxRuvQEhyrE/s+gCERPTjDweKIBJErEB08G1wCfdoQnJt8LuZz
 efdDEaA30b2ata7FYKsU/N97IVtwrI2EWlLDNK+SVKyhiAiGwbtlJPu3+YH8Hrv6J7t0
 EJkfKvLG6+qlZ8xpSG92A6hQgmu5VtztJBgl1f0A/PXghLUq+v4Siq9PqKlEyzP1g9VU
 c3rA==
X-Gm-Message-State: AOAM531haFPSW6q8LOcDsxbu1ZIfxadDEYv+aOpg261uhPXz/12NhQeA
 ujO0LS2vaE2SdSQYlkRBCbJyY+wO/wjw5QUhFlg=
X-Google-Smtp-Source: ABdhPJzNfSfPYEKiCAFmNOttrty7rS8ZUMbff9aAkk048MYkpiyrQPEMs+yLfPkVxyaMDwdY2bNSoTmplM4XMWDQEeM=
X-Received: by 2002:a05:600c:2319:: with SMTP id
 25mr1700761wmo.102.1605216686520; 
 Thu, 12 Nov 2020 13:31:26 -0800 (PST)
MIME-Version: 1.0
References: <20201112190039.2785914-1-lee.jones@linaro.org>
 <20201112190039.2785914-30-lee.jones@linaro.org>
In-Reply-To: <20201112190039.2785914-30-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 12 Nov 2020 16:31:15 -0500
Message-ID: <CADnq5_MjzzRhu0zwOeefjGP_mJ2tfTVvK1O5x55dE03kRxDa3Q@mail.gmail.com>
Subject: Re: [PATCH 29/30] drm/amd/amdgpu/atombios_encoders: Remove set but
 unused variable 'backlight_level'
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Luben Tuikov <luben.tuikov@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMTIsIDIwMjAgYXQgMjowMSBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2F0b21iaW9zX2VuY29k
ZXJzLmM6IEluIGZ1bmN0aW9uIOKAmGFtZGdwdV9hdG9tYmlvc19lbmNvZGVyX2luaXRfYmFja2xp
Z2h04oCZOgo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hdG9tYmlvc19lbmNvZGVycy5j
OjE3NDo1OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhiYWNrbGlnaHRfbGV2ZWzigJkgc2V0IGJ1dCBu
b3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KPgo+IENjOiBBbGV4IERldWNoZXIg
PGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXgu
aWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogTHViZW4gVHVp
a292IDxsdWJlbi50dWlrb3ZAYW1kLmNvbT4KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYt
Ynk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2F0b21iaW9zX2VuY29kZXJzLmMgfCAzICstLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYXRvbWJpb3NfZW5jb2RlcnMuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2F0b21iaW9zX2VuY29kZXJzLmMKPiBpbmRleCBmYTgxN2ViZmY5ODA0
Li5hZjg3NTA1YWQ3ZDU3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2F0b21iaW9zX2VuY29kZXJzLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
dG9tYmlvc19lbmNvZGVycy5jCj4gQEAgLTE3MSw3ICsxNzEsNiBAQCB2b2lkIGFtZGdwdV9hdG9t
Ymlvc19lbmNvZGVyX2luaXRfYmFja2xpZ2h0KHN0cnVjdCBhbWRncHVfZW5jb2RlciAqYW1kZ3B1
X2VuY29kZQo+ICAgICAgICAgc3RydWN0IGJhY2tsaWdodF9wcm9wZXJ0aWVzIHByb3BzOwo+ICAg
ICAgICAgc3RydWN0IGFtZGdwdV9iYWNrbGlnaHRfcHJpdmRhdGEgKnBkYXRhOwo+ICAgICAgICAg
c3RydWN0IGFtZGdwdV9lbmNvZGVyX2F0b21fZGlnICpkaWc7Cj4gLSAgICAgICB1OCBiYWNrbGln
aHRfbGV2ZWw7Cj4gICAgICAgICBjaGFyIGJsX25hbWVbMTZdOwo+Cj4gICAgICAgICAvKiBNYWMg
bGFwdG9wcyB3aXRoIG11bHRpcGxlIEdQVXMgdXNlIHRoZSBnbXV4IGRyaXZlciBmb3IgYmFja2xp
Z2h0Cj4gQEAgLTIwNyw3ICsyMDYsNyBAQCB2b2lkIGFtZGdwdV9hdG9tYmlvc19lbmNvZGVyX2lu
aXRfYmFja2xpZ2h0KHN0cnVjdCBhbWRncHVfZW5jb2RlciAqYW1kZ3B1X2VuY29kZQo+Cj4gICAg
ICAgICBwZGF0YS0+ZW5jb2RlciA9IGFtZGdwdV9lbmNvZGVyOwo+Cj4gLSAgICAgICBiYWNrbGln
aHRfbGV2ZWwgPSBhbWRncHVfYXRvbWJpb3NfZW5jb2Rlcl9nZXRfYmFja2xpZ2h0X2xldmVsX2Zy
b21fcmVnKGFkZXYpOwo+ICsgICAgICAgYW1kZ3B1X2F0b21iaW9zX2VuY29kZXJfZ2V0X2JhY2ts
aWdodF9sZXZlbF9mcm9tX3JlZyhhZGV2KTsKCldlIGNhbiBkcm9wIHRoaXMgZnVuY3Rpb24gY2Fs
bCBhbHRvZ2V0aGVyLiAgV2UgY2FsbCBpdCBhZ2FpbiBiZWxvdyBpbmRpcmVjdGx5LgoKQWxleAoK
Pgo+ICAgICAgICAgZGlnID0gYW1kZ3B1X2VuY29kZXItPmVuY19wcml2Owo+ICAgICAgICAgZGln
LT5ibF9kZXYgPSBiZDsKPiAtLQo+IDIuMjUuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
