Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2683B7AEEB
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 19:07:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D92BB6E5D2;
	Tue, 30 Jul 2019 17:07:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C1786E5D2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 17:07:40 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id q5so11297575ybp.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 10:07:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qks3K4GGrulb2C0Ck+/3WZ7Ox9e+XzeggPI4nq1FENI=;
 b=BCMloWFCrmhVWUMBXsV6M4itezHK5Z3OAU0gn+n4t2kCwnaBVp7J/g1m8jAVjy4c/Z
 +01TMnS0C8ZspKXnVcBSDkEt/lkjxWT09fTLrIN/69xjY1Cmgbhot0JeT6SL6Sy2ubHP
 GZE2nojn0lJddeKyYklDyleBxW9nSgkqmCShMhI2FI8yZHYAKzQbthn8wxVkan6t+89y
 rvJWpZ4s3PZrWDORAi1HD7B/dAZTWh24Rp78viAYybTiW7HouF/62M+kVC+TLg8/WVm7
 usdeForcWzLy3RPwCZjAzQcOIcR4JSw6payD0lW8TKTfjP/tn+g8EAuV+gFBMEjanl6I
 vX3g==
X-Gm-Message-State: APjAAAWx3rEx87R5OQZIHApq3ekCdjY8u7OwuxLg072R85gLjIT+3F6R
 1dAUzFxI13b55AdekcVb5BpQKQ==
X-Google-Smtp-Source: APXvYqyyhk5DPM+8bWP0tf2V0lR52Kjy3fuZGEK6h5rkpUxWToTAGb8tO/aypQUexqS+TP4/SxRaKg==
X-Received: by 2002:a25:f202:: with SMTP id i2mr73141060ybe.462.1564506459592; 
 Tue, 30 Jul 2019 10:07:39 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id v135sm15374362ywc.53.2019.07.30.10.07.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 30 Jul 2019 10:07:39 -0700 (PDT)
Date: Tue, 30 Jul 2019 13:07:38 -0400
From: Sean Paul <sean@poorly.run>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next] drm/rockchip: Make analogix_dp_atomic_check static
Message-ID: <20190730170738.GR104440@art_vandelay>
References: <20190730150057.57388-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190730150057.57388-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=qks3K4GGrulb2C0Ck+/3WZ7Ox9e+XzeggPI4nq1FENI=;
 b=KTozmroQs2NoFwB/7cl52MZhpQHOqD8frHClUzchrD+1HxPb9jxsHarpK3lbMg14oL
 LvrYfMv1OxYxEk6jTm/oYLAA1RdIdt90n8LIv84ycM//5KWB2QKFMMRnNP2+q294Y/Ip
 cuQdCy/DmyXBXHobGkSOPgzMDflCjWKmxCI2Gna6sU4P6WSEDL8WKeRFuFWX5o7CyMIF
 wZyKmBnSXQ1KHVTuWNQi9UsCTyRX35TUPnXApNzYCjn7YYiHM9VhcNZSbK+PsB7WjA7t
 EN1DNM4JQq0J0XMWbU6stHC55kbJswvAXgKDVC3C0YC0OmgqC4JCqrQVFSC9oXShtX0M
 E4oA==
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
Cc: jernej.skrabec@siol.net, jonas@kwiboo.se, airlied@linux.ie,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, seanpaul@chromium.org,
 Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgMTE6MDA6NTdQTSArMDgwMCwgWXVlSGFpYmluZyB3cm90
ZToKPiBGaXggc3BhcnNlIHdhcm5pbmc6Cj4gCj4gZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFs
b2dpeC9hbmFsb2dpeF9kcF9jb3JlLmM6MTE1MTo1OiB3YXJuaW5nOgo+ICBzeW1ib2wgJ2FuYWxv
Z2l4X2RwX2F0b21pY19jaGVjaycgd2FzIG5vdCBkZWNsYXJlZC4gU2hvdWxkIGl0IGJlIHN0YXRp
Yz8KPiAKPiBSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+Cj4gU2ln
bmVkLW9mZi1ieTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPgoKVGhhbmtzIGZv
ciB5b3VyIHBhdGNoLCBhcHBsaWVkIHRvIGRybS1taXNjLW5leHQKClNlYW4KCj4gLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXhfZHBfY29yZS5jIHwgNCArKy0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXhfZHBf
Y29yZS5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeF9kcF9jb3Jl
LmMKPiBpbmRleCBjODJjN2Q1Li5mMmY3ZjY5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXhfZHBfY29yZS5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeF9kcF9jb3JlLmMKPiBAQCAtMTE0OCw4ICsxMTQ4
LDggQEAgYW5hbG9naXhfZHBfYmVzdF9lbmNvZGVyKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25u
ZWN0b3IpCj4gIH0KPiAgCj4gIAo+IC1pbnQgYW5hbG9naXhfZHBfYXRvbWljX2NoZWNrKHN0cnVj
dCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsCj4gLQkJCSAgICAgc3RydWN0IGRybV9hdG9taWNf
c3RhdGUgKnN0YXRlKQo+ICtzdGF0aWMgaW50IGFuYWxvZ2l4X2RwX2F0b21pY19jaGVjayhzdHJ1
Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLAo+ICsJCQkJICAgIHN0cnVjdCBkcm1fYXRvbWlj
X3N0YXRlICpzdGF0ZSkKPiAgewo+ICAJc3RydWN0IGFuYWxvZ2l4X2RwX2RldmljZSAqZHAgPSB0
b19kcChjb25uZWN0b3IpOwo+ICAJc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKmNvbm5fc3Rh
dGU7Cj4gLS0gCj4gMi43LjQKPiAKPiAKCi0tIApTZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVy
LCBHb29nbGUgLyBDaHJvbWl1bSBPUwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
