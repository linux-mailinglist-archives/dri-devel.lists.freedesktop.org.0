Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 649FA98993
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 04:43:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE9C96EA57;
	Thu, 22 Aug 2019 02:43:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C9346EA56;
 Thu, 22 Aug 2019 02:43:45 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id g67so4124141wme.1;
 Wed, 21 Aug 2019 19:43:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+2V9HhKKnOxcZwgG+smQxeIpzg5MY2WFsMF9dUz2ZWM=;
 b=n5DnwM3d3eClQgSlHeucnRbSzQG7y8VajFA64yO9Ghf7H1xA8YEuKNGl10EvTY9HNM
 eTCA1lpoiSinvfO2APyNSw+rHf4XRWS2MFpj/FUKJVoEeguFX4LajNoAdCuLkxlTVPvb
 CXS4d/xV9Z6G/1Dp55JxBqPFYossfC4VaXcuc1t1J5+xCEhG9kSY5bRq99HTwPZrrUSn
 Yzbzb1Le8HKcdRkdCltZsUN/lEH1YQn6IL5r1OFOp22VAF+5pfcw/L0VavSBIapTOMhZ
 zBqsBxrHTLVaJyg0mb8Ry0sdvW8XA1diC2rQgEJ4lxPgEAaaf/YUvt1h5V3dtBCz0dvb
 ljiw==
X-Gm-Message-State: APjAAAWN9+STkoO3U64JUx4T9E+RyS+r+7WimBWLnf9o8y85InTjHuiE
 u8kzoz7+pFphgQvGGn03wd04tXQlf61tf5yVujo=
X-Google-Smtp-Source: APXvYqxD/E+UHdGoXQKABwQgWR8efld2lFuHM9IPgAUnitZqsTlwwXt9fBIBFdnmKBvWb0d4kUCa1hVLcgbbn7ZuZFo=
X-Received: by 2002:a1c:1d42:: with SMTP id d63mr3041326wmd.34.1566441823801; 
 Wed, 21 Aug 2019 19:43:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190726140054.31388-1-yuehaibing@huawei.com>
In-Reply-To: <20190726140054.31388-1-yuehaibing@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 21 Aug 2019 22:43:31 -0400
Message-ID: <CADnq5_PcbKZDsqmoL2wK061sL=KfCedmEafn_hpbFZ9tNGrNdA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdkfd: remove set but not used variable 'pdd'
To: YueHaibing <yuehaibing@huawei.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=+2V9HhKKnOxcZwgG+smQxeIpzg5MY2WFsMF9dUz2ZWM=;
 b=DSJhBF3Om5/KnpK+0LWyWxE8iGn6amDhoaCrc6WmWx+9OLDLwggvxVU9fYFk8iGW+C
 r2LEowif2v/CyzooTyOh4UIyUjrXmBBMCR9llt2CoCGz+65AneozS1eJzxFdnB1jxqPt
 UAO79ce9gqDDb7O511X3mihMdNPdeAV+dwUfNE1fp+5Lo2bFg09Ef8xSL4Ey7e/1dW7w
 /vs3AKg7Jc4HkmrGxwWoGpYeKp0CcDrtUKvGbRckIjAmLrSbII/qGqgh3svbsDW1i6cb
 o3q7PZDN9XyxJhTnhho44E5EptnAZ3rwRvPxdpPceedQ+PPVOsTzQEBrP97XeanaHMpC
 aprA==
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
Cc: Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIHRoYW5rcyEKCkFsZXgKCk9uIEZyaSwgSnVsIDI2LCAyMDE5IGF0IDExOjU4IEFN
IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4gd3JvdGU6Cj4KPiBGaXhlcyBnY2Mg
Jy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGUnIHdhcm5pbmc6Cj4KPiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS8uLi9hbWRrZmQva2ZkX3Byb2Nlc3MuYzogSW4gZnVuY3Rpb24gcmVzdG9yZV9w
cm9jZXNzX3dvcmtlcjoKPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9hbWRrZmQva2Zk
X3Byb2Nlc3MuYzo5NDk6Mjk6IHdhcm5pbmc6Cj4gIHZhcmlhYmxlIHBkZCBzZXQgYnV0IG5vdCB1
c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQo+Cj4gSXQgaXMgbm90IHVzZWQgc2luY2UK
PiBjb21taXQgNWI4NzI0NWZhZjU3ICgiZHJtL2FtZGtmZDogU2ltcGxpZnkga2ZkMmtnZCBpbnRl
cmZhY2UiKQo+Cj4gUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgo+
IFNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KPiAtLS0K
PiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3MuYyB8IDExIC0tLS0tLS0t
LS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzcy5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3MuYwo+IGluZGV4IDhmMTA3NmMuLjI0MGJmNjggMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3MuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzLmMKPiBAQCAtMTA0Miw3ICsx
MDQyLDYgQEAgc3RhdGljIHZvaWQgcmVzdG9yZV9wcm9jZXNzX3dvcmtlcihzdHJ1Y3Qgd29ya19z
dHJ1Y3QgKndvcmspCj4gIHsKPiAgICAgICAgIHN0cnVjdCBkZWxheWVkX3dvcmsgKmR3b3JrOwo+
ICAgICAgICAgc3RydWN0IGtmZF9wcm9jZXNzICpwOwo+IC0gICAgICAgc3RydWN0IGtmZF9wcm9j
ZXNzX2RldmljZSAqcGRkOwo+ICAgICAgICAgaW50IHJldCA9IDA7Cj4KPiAgICAgICAgIGR3b3Jr
ID0gdG9fZGVsYXllZF93b3JrKHdvcmspOwo+IEBAIC0xMDUxLDE2ICsxMDUwLDYgQEAgc3RhdGlj
IHZvaWQgcmVzdG9yZV9wcm9jZXNzX3dvcmtlcihzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCj4g
ICAgICAgICAgKiBsaWZldGltZSBvZiB0aGlzIHRocmVhZCwga2ZkX3Byb2Nlc3MgcCB3aWxsIGJl
IHZhbGlkCj4gICAgICAgICAgKi8KPiAgICAgICAgIHAgPSBjb250YWluZXJfb2YoZHdvcmssIHN0
cnVjdCBrZmRfcHJvY2VzcywgcmVzdG9yZV93b3JrKTsKPiAtCj4gLSAgICAgICAvKiBDYWxsIHJl
c3RvcmVfcHJvY2Vzc19ib3Mgb24gdGhlIGZpcnN0IEtHRCBkZXZpY2UuIFRoaXMgZnVuY3Rpb24K
PiAtICAgICAgICAqIHRha2VzIGNhcmUgb2YgcmVzdG9yaW5nIHRoZSB3aG9sZSBwcm9jZXNzIGlu
Y2x1ZGluZyBvdGhlciBkZXZpY2VzLgo+IC0gICAgICAgICogUmVzdG9yZSBjYW4gZmFpbCBpZiBl
bm91Z2ggbWVtb3J5IGlzIG5vdCBhdmFpbGFibGUuIElmIHNvLAo+IC0gICAgICAgICogcmVzY2hl
ZHVsZSBhZ2Fpbi4KPiAtICAgICAgICAqLwo+IC0gICAgICAgcGRkID0gbGlzdF9maXJzdF9lbnRy
eSgmcC0+cGVyX2RldmljZV9kYXRhLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
dHJ1Y3Qga2ZkX3Byb2Nlc3NfZGV2aWNlLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBwZXJfZGV2aWNlX2xpc3QpOwo+IC0KPiAgICAgICAgIHByX2RlYnVnKCJTdGFydGVkIHJlc3Rv
cmluZyBwYXNpZCAlZFxuIiwgcC0+cGFzaWQpOwo+Cj4gICAgICAgICAvKiBTZXR0aW5nIGxhc3Rf
cmVzdG9yZV90aW1lc3RhbXAgYmVmb3JlIHN1Y2Nlc3NmdWwgcmVzdG9yYXRpb24uCj4gLS0KPiAy
LjcuNAo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
