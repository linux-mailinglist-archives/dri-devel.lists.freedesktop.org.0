Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D3629C01
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 18:20:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16DED6E11F;
	Fri, 24 May 2019 16:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E466E120
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 16:20:08 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id p26so15160041edr.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 09:20:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=qa/iTdMK2I5u7OLH5mUmubpi3Ui2X4Y/60DebnqcWKA=;
 b=ZghVyLBvAxuLayMDzTQ/regbz2qACv5u+fr/0Q8p7IGZ2ltfrr6/N2YLbV9Wgvznkr
 PyB/QVmqbd/qJ2Do37QMLjr1rGq7dtAAoVmNNkRd/uzdIz70+aUgAR0WnWTmpA1CgyXa
 7d+MJZqQiXBcbEZdtro2syZIkwMHSioHElu5RgDrCXj0iuNfP1AOqE3o3oSIAHhwTDZY
 eGXLmfHWaNDpLeg/4YLJnax1s+pYcxrxlxrN9r3FzBHp3QA7PlV2d67ShRgnHpNStGGi
 BQX/JDUx/gF7psCCSk3wRAy4lQzJZ1bthzA2TCENQBFtJbPQ9448JF7oRB3XuafusyOB
 EzEQ==
X-Gm-Message-State: APjAAAUrW4Y/z34lSxNkG2pw7/d55JFDoDYq86eww2I0cLKFY7OsYLsT
 zrmsZ6z0xFOVBkqpWwNqGKUjaw==
X-Google-Smtp-Source: APXvYqyyUQQMpWFfqqnY1+kkknYiFDuvhN02hQKZ5YtOLDuOntF6aWyDvGMULBXc37JgAEFjADK+/Q==
X-Received: by 2002:a17:906:4581:: with SMTP id
 t1mr64624488ejq.187.1558714806496; 
 Fri, 24 May 2019 09:20:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id f32sm850181edf.36.2019.05.24.09.20.04
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 May 2019 09:20:05 -0700 (PDT)
Date: Fri, 24 May 2019 18:20:03 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] drm/qxl: drop WARN_ONCE()
Message-ID: <20190524162003.GC21222@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, 
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20190524104251.22761-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190524104251.22761-1-kraxel@redhat.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=qa/iTdMK2I5u7OLH5mUmubpi3Ui2X4Y/60DebnqcWKA=;
 b=YUKjt5T1Uxbnehko3JGL2u2xg4tM7137f8tigXS15tKoOaor5fhH2rdF2bZu2pmZ29
 CXlen5OW7V7h5ZAJUlNaFmfhRqbz3V6eiRg1mrMLmxwMXEq8FAC96F/w2Y1k4xI8mTF8
 hN4YPvaOwSEvViy+ZqNaKCMe9VigQy4rKnUWI=
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMjQsIDIwMTkgYXQgMTI6NDI6NTBQTSArMDIwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiBUaGVyZSBpcyBubyBnb29kIHJlYXNvbiB0byBmbG9vZCB0aGUga2VybmVsIGxvZyB3
aXRoIGEgV0FSTgo+IHN0YWNrdHJhY2UganVzdCBiZWNhdXNlIHNvbWVvbmUgdHJpZWQgdG8gbW1h
cCBhIHByaW1lIGJ1ZmZlci4KClllYWggbm8gdXNlcnNwYWNlIHRyaWdnZXJhYmxlIGRtZXNnIG5v
aXNlIGFib3ZlIGRlYnVnIGxldmVsLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEdlcmQgSG9mZm1hbm4g
PGtyYXhlbEByZWRoYXQuY29tPgoKUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52
ZXR0ZXJAZmZ3bGwuY2g+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX3ByaW1lLmMg
fCAxIC0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfcHJpbWUuYyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhs
X3ByaW1lLmMKPiBpbmRleCAxMTQ2NTNiNDcxYzYuLjdkMzgxNmZjYTVhOCAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9wcmltZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3F4bC9xeGxfcHJpbWUuYwo+IEBAIC03Nyw2ICs3Nyw1IEBAIHZvaWQgcXhsX2dlbV9wcmltZV92
dW5tYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIHZvaWQgKnZhZGRyKQo+ICBpbnQgcXhs
X2dlbV9wcmltZV9tbWFwKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLAo+ICAJCSAgICAgICBz
dHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKmFyZWEpCj4gIHsKPiAtCVdBUk5fT05DRSgxLCAibm90IGlt
cGxlbWVudGVkIik7Cj4gIAlyZXR1cm4gLUVOT1NZUzsKPiAgfQo+IC0tIAo+IDIuMTguMQo+IAoK
LS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0
dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
