Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57478B26A4
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 22:29:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FC726F454;
	Fri, 13 Sep 2019 20:29:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 908DD6F453;
 Fri, 13 Sep 2019 20:29:12 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 7so4005959wme.1;
 Fri, 13 Sep 2019 13:29:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BwnRj7PJq/SSAsVSbXgfwpYXCFA29Cu8FrdaeblUNaY=;
 b=csINR5BhjfHps/Fd0+Y6mPYXB4tpFXs96zqg0M1Wu8t68ILKVq8zIQgo0/3KNP653k
 TvCVx8YZnKjjgcIKuccPKw71fRg8aQ5c30QjP17/xEE1GMGl/UCAFtYn1Qx+nf5ilnay
 CZ/CSuKZ0dDNtQp8q0uv1hTLQA3HDmgMf1LIjWOaAYCGAbqJSnqlor9/K3J17JXfIBy3
 36WZ5aYPUdarX08DHysejGRujCOtgafiyFD21JGpd7LWHJAO6Qi2lffzdtHONNwGBxya
 zZBJlLNAWPr85cDWznpXAiPYUaZcTvFwyjtFCkS+X8glOV30HzSxCAQJrouSe2Hi4a2d
 OtSw==
X-Gm-Message-State: APjAAAVBnB5a/Iz+IFoQMjBCut2Nb3LNUmzoP+AHvdcPz1u/TsSayojW
 X66ccES/AzZ3b+9gMGpJ0bMHGeHNTlX1CHT646w=
X-Google-Smtp-Source: APXvYqybKucIudJAu7egTjDbJuVeu1SDruW9ZLV4m+SqmtqqxTpYMT8KJGaBUCDH4rcNUxo1IB45fuUuDiTa66dDaY0=
X-Received: by 2002:a1c:ca0f:: with SMTP id a15mr4832349wmg.102.1568406551112; 
 Fri, 13 Sep 2019 13:29:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190913080248.28695-1-colin.king@canonical.com>
In-Reply-To: <20190913080248.28695-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 13 Sep 2019 16:28:58 -0400
Message-ID: <CADnq5_P+G9bRLvFAZht+LzjwmquO5guAHFAeWFO2DTi-mTasTw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: rename variable eanble -> enable
To: Colin King <colin.king@canonical.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=BwnRj7PJq/SSAsVSbXgfwpYXCFA29Cu8FrdaeblUNaY=;
 b=Tm/zd6+los5t4+AELALzP5pfwfBhKBcHKteH6R/c7Nu9nPt0meOqPrYNxlxwSnxldc
 sj4rLEyShvwUzwCkJC8uiAvJYmhXxAFFH8heSHfKGyC1Z0WwGjmM0uw8C13rR4/IwESW
 1S+3IqfjoUInrqRbKw2wBdZeI612npcV0eHqk4T5jvuO3Bhf6QZ93PoYwCNvBvQM0yiU
 6vWJR7tzUAWPHSCn/BL4N2+qloDw8QwFzUMV61hEQv8L5b/bwxSz6kuHbXi51RLhc7Dg
 wm3prHOgOPxDYLDOEed+r7O2bZvpnM4NayliF+z5N2VIgA3uRTAbTGBhGBPjZ7IuPGwb
 dHog==
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
Cc: Leo Li <sunpeng.li@amd.com>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgNDowMiBBTSBDb2xpbiBLaW5nIDxjb2xpbi5raW5nQGNh
bm9uaWNhbC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdA
Y2Fub25pY2FsLmNvbT4KPgo+IFRoZXJlIGlzIGEgc3BlbGxpbmcgbWlzdGFrZSBpbiB0aGUgdmFy
aWFibGUgbmFtZSBlYW5ibGUsCj4gcmVuYW1lIGl0IHRvIGVuYWJsZS4KPgo+IFNpZ25lZC1vZmYt
Ynk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+CgpBcHBsaWVkLiAg
dGhhbmtzIQoKQWxleAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
ZS9kY2VfbWVtX2lucHV0LmMgfCA4ICsrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfbWVtX2lucHV0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNlL2RjZV9tZW1faW5wdXQuYwo+IGluZGV4IDE0ODhmZmRkZjRlMy4uNTk0
NDUyNGZhYWI5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
Y2UvZGNlX21lbV9pbnB1dC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjZS9kY2VfbWVtX2lucHV0LmMKPiBAQCAtNjA2LDExICs2MDYsMTEgQEAgc3RhdGljIHZvaWQg
ZGNlX21pX2FsbG9jYXRlX2RtaWYoCj4gICAgICAgICB9Cj4KPiAgICAgICAgIGlmIChkY2VfbWkt
PndhLnNpbmdsZV9oZWFkX3JkcmVxX2RtaWZfbGltaXQpIHsKPiAtICAgICAgICAgICAgICAgdWlu
dDMyX3QgZWFuYmxlID0gICh0b3RhbF9zdHJlYW1fbnVtID4gMSkgPyAwIDoKPiArICAgICAgICAg
ICAgICAgdWludDMyX3QgZW5hYmxlID0gICh0b3RhbF9zdHJlYW1fbnVtID4gMSkgPyAwIDoKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRjZV9taS0+d2Euc2luZ2xlX2hlYWRfcmRy
ZXFfZG1pZl9saW1pdDsKPgo+ICAgICAgICAgICAgICAgICBSRUdfVVBEQVRFKE1DX0hVQl9SRFJF
UV9ETUlGX0xJTUlULAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRU5BQkxFLCBl
YW5ibGUpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRU5BQkxFLCBlbmFibGUp
Owo+ICAgICAgICAgfQo+ICB9Cj4KPiBAQCAtNjM2LDExICs2MzYsMTEgQEAgc3RhdGljIHZvaWQg
ZGNlX21pX2ZyZWVfZG1pZigKPiAgICAgICAgICAgICAgICAgICAgICAgICAxMCwgMzUwMCk7Cj4K
PiAgICAgICAgIGlmIChkY2VfbWktPndhLnNpbmdsZV9oZWFkX3JkcmVxX2RtaWZfbGltaXQpIHsK
PiAtICAgICAgICAgICAgICAgdWludDMyX3QgZWFuYmxlID0gICh0b3RhbF9zdHJlYW1fbnVtID4g
MSkgPyAwIDoKPiArICAgICAgICAgICAgICAgdWludDMyX3QgZW5hYmxlID0gICh0b3RhbF9zdHJl
YW1fbnVtID4gMSkgPyAwIDoKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRjZV9t
aS0+d2Euc2luZ2xlX2hlYWRfcmRyZXFfZG1pZl9saW1pdDsKPgo+ICAgICAgICAgICAgICAgICBS
RUdfVVBEQVRFKE1DX0hVQl9SRFJFUV9ETUlGX0xJTUlULAo+IC0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgRU5BQkxFLCBlYW5ibGUpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgRU5BQkxFLCBlbmFibGUpOwo+ICAgICAgICAgfQo+ICB9Cj4KPiAtLQo+IDIuMjAuMQo+
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
