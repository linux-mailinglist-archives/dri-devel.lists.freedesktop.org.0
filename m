Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D895F108B0B
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 10:38:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C2A56E027;
	Mon, 25 Nov 2019 09:38:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87E16E027
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 09:38:19 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id 203so10421040lfa.12
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 01:38:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CnwnopemNuilKf0FzHp+qewqispNYxgrUET9BBeIqlQ=;
 b=MbNlIRd0kQPNT7z8RipUHKKPtX86i1C3tTZwHj0ek0Elb/D+m+YI7OmImjZ5aLL1EO
 tMe5ZZlVSwZXUy7TapowVVk9CxFOJ+HTf6lcyzwirL7BJhx3Zq8NeajgCJbkGJzg3tHa
 sHgUabEXJZzB71/kuqCyEo9/UbYG99349G80736CWx5Wic+GiPkgKECycnkhbwErRrqh
 Jy9NF+zpnVQbkGu9Xp5i/6PcUwl8fLHWiPmFB4nJ1OSwSxUX57hWJeBo6XeyxPIL28iv
 MWuTojKPicECJh+4BcdRxSP4Xu1Zt5A3YpGwI+m2p2QY0y4FhCnTy6Q/T1pN8MDyEjul
 uT6Q==
X-Gm-Message-State: APjAAAXLFnCwwu9tICDK8MCD3DsDsVJV4SoQ8hOtttEBuJMD2oZ/LpBm
 wdgcrzZhzV4KUV04l3COic99Dw+mlrgDoVavl3I=
X-Google-Smtp-Source: APXvYqx12PT18HSucV6aOvoxSAK5k7rhrcOf8Opc/+hWfi7VBMAXNYkMArDj9Z/mVSF+UeeSiXIHbbDpEzVsZmKoeus=
X-Received: by 2002:ac2:5504:: with SMTP id j4mr16163462lfk.144.1574674697900; 
 Mon, 25 Nov 2019 01:38:17 -0800 (PST)
MIME-Version: 1.0
References: <20191122100545.16812-1-tzimmermann@suse.de>
In-Reply-To: <20191122100545.16812-1-tzimmermann@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Mon, 25 Nov 2019 10:38:07 +0100
Message-ID: <CAMeQTsa2grXJKeVakHafS7BNOAaRy=1u3dGC4qPiDv4ST-Ua5Q@mail.gmail.com>
Subject: Re: [PATCH 0/6] drm/gma500: Cleanup framebuffer and fbdev
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=CnwnopemNuilKf0FzHp+qewqispNYxgrUET9BBeIqlQ=;
 b=k0CXnyu/sovoDAdX+YT05SkKg95JAY862L/hTdk1Qt3bd3Z9ufC5aXDKdPOhqgjukT
 QhuNvUHk4WIvjiRPtO38JcV14E4ms7YCQP8YjJnbl04nqleaqQdWDgodyck+rFGDp/3W
 y0QTHTLanE6V+c4maTsbukRFy49mxZLtCI8AGUKV+G8242oE1EDPJ02uy6op+fKEJsmB
 +yh2Cqu54kMwgO9l6l2x1KecCbIpm0lApD7iRJyM8k40hhp+PSwUp7DjqU65UsrArB76
 QtkpmDNjejArxWZdsV4CWKcUu3DtIM+7tJ0+PIKX0e+6qQddsv1NnXNTn5wzNF8FIHMY
 wqRA==
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgMTE6MDUgQU0gVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+IHdyb3RlOgo+Cj4gVGhlc2UgcGF0Y2hlcyByZW1vdmUgc3RydWN0IHBz
Yl9mcmFtZWJ1ZmZlciBhbmQgc3RydWN0IHBzYl9mYmRldgo+IGZyb20gZ21hNTAwLiBCb3RoIGFy
ZSByZXBsYWNlZCBieSB0aGVpciBlcXVpdmFsZW50cyBmcm9tIHRoZSBEUk0KPiBoZWxwZXJzLgo+
Cj4gVGhlIHBhdGNoc2V0IGhhcyBiZWVuIHRlc3RlZCBieSBydW5uaW5nIHRoZSBmYmRldiBjb25z
b2xlLCBYMTEgYW5kCj4gV2VzdG9uIG9uIGFuIEF0b20gWjUyMCB3aXRoIFBvdWxzYm8gZ3JhcGhp
Y3MgY2hpcC4KCkhpIFRob21hcywgbmljZSBjbGVhbnVwcyEKSSdsbCBhcHBseSB0byBkcm0tbWlz
Yy1uZXh0CgpGb3Igc2VyaWVzOgpTaWduZWQtb2ZmLWJ5OiBQYXRyaWsgSmFrb2Jzc29uIDxwYXRy
aWsuci5qYWtvYnNzb25AZ21haWwuY29tPgoKVGhhbmtzCgo+Cj4gVGhvbWFzIFppbW1lcm1hbm4g
KDYpOgo+ICAgZHJtL2dtYTUwMDogUmVtb3ZlIGFkZHJfc3BhY2UgZmllbGQgZnJvbSBwc2JfZnJh
bWVidWZmZXIKPiAgIGRybS9nbWE1MDA6IFJlbW92ZSBmaWVsZCAnZmJkZXYnIGZyb20gc3RydWN0
IHBzYl9mcmFtZWJ1ZmZlcgo+ICAgZHJtL2dtYTUwMDogUmVwbGFjZSBzdHJ1Y3QgcHNiX2ZyYW1l
YnVmZmVyIHdpdGggc3RydWN0IGRybV9mcmFtZWJ1ZmZlcgo+ICAgZHJtL2dtYTUwMDogUGFzcyBz
dHJ1Y3QgZHJtX2dlbV9vYmplY3QgdG8gZnJhbWVidWZmZXIgZnVuY3Rpb25zCj4gICBkcm0vZ21h
NTAwOiBTdG9yZSBmcmFtZWJ1ZmZlciBpbiBzdHJ1Y3QgZHJtX2ZiX2hlbHBlcgo+ICAgZHJtL2dt
YTUwMDogUmVtb3ZlIHN0cnVjdCBwc2JfZmJkZXYKPgo+ICBkcml2ZXJzL2dwdS9kcm0vZ21hNTAw
L2FjY2VsXzJkLmMgICAgfCAgMTUgKystLQo+ICBkcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2ZyYW1l
YnVmZmVyLmMgfCAxMjkgKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCj4gIGRyaXZlcnMvZ3B1
L2RybS9nbWE1MDAvZnJhbWVidWZmZXIuaCB8ICAxNSAtLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9n
bWE1MDAvcHNiX2Rydi5jICAgICB8ICAgMSArCj4gIGRyaXZlcnMvZ3B1L2RybS9nbWE1MDAvcHNi
X2Rydi5oICAgICB8ICAgOCArLQo+ICA1IGZpbGVzIGNoYW5nZWQsIDc0IGluc2VydGlvbnMoKyks
IDk0IGRlbGV0aW9ucygtKQo+Cj4gLS0KPiAyLjIzLjAKPgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
