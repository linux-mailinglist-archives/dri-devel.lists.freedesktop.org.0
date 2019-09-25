Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F64FBE571
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 21:14:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B2C6EDF5;
	Wed, 25 Sep 2019 19:14:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C39366F3F1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 19:14:11 +0000 (UTC)
Received: by mail-yw1-xc42.google.com with SMTP id u65so2478927ywe.4
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 12:14:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Xm8JaZt34JpJZouJEYtJCJAMSPrJXNrwaxHnJcFeAUc=;
 b=DNH9F/WQ/GGRJq7xjgL8WY3iDVDPJRknMwvkgLAj0EJRgsD/Dv/8whMXdgqwbM4Zoj
 6PitOTJGj9sCEt+rWH28XiAQ0+GbR9wgu5DUOVSY33LxFFfzWN/mBgbCPOXueJBY8vho
 pfYEzOiArhPLVU7nbG/85FpV66GVRJP7F5YajAUgFfLJkKLbjh3n8B5h9yNszW9pazOD
 p47XaytcgQjgDoJiuFYAby713LC950l7BIzimdYo07RlZ9ku+NF4f5Si7Px9i9DeYC0t
 z0maeE0nEkggBkpBIXbKPq5ud88UmKrEMzQFIZHvzcV4nTs5TNUWjxrG3XR5UtzsXGbb
 wQYw==
X-Gm-Message-State: APjAAAVAd+UIZVcUGkZF0aLb39Bd614wtHVswvSkiHxYdCKnEjnBg3Xz
 0ysLOhuw7LSztWcXFqxTPSSuUQ==
X-Google-Smtp-Source: APXvYqyIniadt2/l2iR2+nEZXL2S6q2dL8klnXAOrvRz5y0Y/SVWPmRj/L7iOyPVvm4W56ba6+Sdcw==
X-Received: by 2002:a81:9917:: with SMTP id q23mr7379227ywg.404.1569438850932; 
 Wed, 25 Sep 2019 12:14:10 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id s187sm1484200ywd.27.2019.09.25.12.14.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 12:14:08 -0700 (PDT)
Date: Wed, 25 Sep 2019 15:14:08 -0400
From: Sean Paul <sean@poorly.run>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v2 14/27] drm/dp_mst: Destroy topology_mgr mutexes
Message-ID: <20190925191408.GG218215@art_vandelay>
References: <20190903204645.25487-1-lyude@redhat.com>
 <20190903204645.25487-15-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190903204645.25487-15-lyude@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=Xm8JaZt34JpJZouJEYtJCJAMSPrJXNrwaxHnJcFeAUc=;
 b=GROI0zk6+t9b0o8qqBzvwit83Yf8otVuWk37zltV/UUXle6QghuPqbyoYrG0Z6J2ZP
 Tfu0DGGAJcJ8fbrjPU8Ne6kAbUDXfn/X4DYEn1qFFGelOHHo3vcqhqOoFxQlC1stM/dK
 b/EKY9GHQzBA26NFrGrttU0aDqsU+51fOzSSz0S59o1DmJy5rJWXwZ9zLPmoIKq3t5Li
 9W2I/1loIpreSw6/DT3B6oL0jZ9as60r05gCvYhuyUgeY08azGHvBVH9GIjgtRVfvJtz
 DW3Py2+6uEtPlxMDLj3FrVzLn7bQFQo1QGFlRDgmp0GyO6PujgUgaaiOodrLF8sF6xTq
 h8cg==
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
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Juston Li <juston.li@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Harry Wentland <hwentlan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMDMsIDIwMTkgYXQgMDQ6NDU6NTJQTSAtMDQwMCwgTHl1ZGUgUGF1bCB3cm90
ZToKPiBUdXJucyBvdXQgd2UndmUgYmVlbiBmb3JnZXR0aW5nIGZvciBhIHdoaWxlIG5vdyB0byBh
Y3R1YWxseSBkZXN0cm95IGFueQo+IG9mIHRoZSBtdXRleGVzIHRoYXQgd2UgY3JlYXRlIGluIGRy
bV9kcF9tc3RfdG9wb2xvZ3lfbWdyLiBTbywgbGV0J3MgZG8KPiB0aGF0Lgo+IAo+IENjOiBKdXN0
b24gTGkgPGp1c3Rvbi5saUBpbnRlbC5jb20+Cj4gQ2M6IEltcmUgRGVhayA8aW1yZS5kZWFrQGlu
dGVsLmNvbT4KPiBDYzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVs
LmNvbT4KPiBDYzogSGFycnkgV2VudGxhbmQgPGh3ZW50bGFuQGFtZC5jb20+Cj4gQ2M6IERhbmll
bCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gU2lnbmVkLW9mZi1ieTogTHl1ZGUg
UGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KCkNsZWFudXAgaXMgb3ZlcnJhdGVkIDopCgpSZXZpZXdl
ZC1ieTogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+CgoKPiAtLS0KPiAgZHJpdmVycy9ncHUv
ZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyB8IDUgKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21z
dF90b3BvbG9neS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+IGlu
ZGV4IDc0MTYxZjQ0MjU4NC4uMmY4OGNjMTczNTAwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rw
X21zdF90b3BvbG9neS5jCj4gQEAgLTQzMzksNiArNDMzOSwxMSBAQCB2b2lkIGRybV9kcF9tc3Rf
dG9wb2xvZ3lfbWdyX2Rlc3Ryb3koc3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyICptZ3Ip
Cj4gIAltZ3ItPmF1eCA9IE5VTEw7Cj4gIAlkcm1fYXRvbWljX3ByaXZhdGVfb2JqX2ZpbmkoJm1n
ci0+YmFzZSk7Cj4gIAltZ3ItPmZ1bmNzID0gTlVMTDsKPiArCj4gKwltdXRleF9kZXN0cm95KCZt
Z3ItPmRlbGF5ZWRfZGVzdHJveV9sb2NrKTsKPiArCW11dGV4X2Rlc3Ryb3koJm1nci0+cGF5bG9h
ZF9sb2NrKTsKPiArCW11dGV4X2Rlc3Ryb3koJm1nci0+cWxvY2spOwo+ICsJbXV0ZXhfZGVzdHJv
eSgmbWdyLT5sb2NrKTsKPiAgfQo+ICBFWFBPUlRfU1lNQk9MKGRybV9kcF9tc3RfdG9wb2xvZ3lf
bWdyX2Rlc3Ryb3kpOwo+ICAKPiAtLSAKPiAyLjIxLjAKPiAKCi0tIApTZWFuIFBhdWwsIFNvZnR3
YXJlIEVuZ2luZWVyLCBHb29nbGUgLyBDaHJvbWl1bSBPUwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
