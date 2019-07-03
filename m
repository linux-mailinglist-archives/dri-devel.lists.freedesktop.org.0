Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD485DC8B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 04:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC6636E0BE;
	Wed,  3 Jul 2019 02:32:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 062836E0BE
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 02:32:37 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A0ECE21873
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 02:32:37 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id w17so865730qto.10
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2019 19:32:37 -0700 (PDT)
X-Gm-Message-State: APjAAAVR/HQ+KJSbWCXa8WbpUSpkk/8Pm+Qqr7Np3xPEvEys4NZ2dnHz
 Z2AfGLOm9+loQfA9DC9TnHH0J/prqLzoAxcZ5A==
X-Google-Smtp-Source: APXvYqwtxZUXfS7T+po7PKuI/nGgvaDQeMzeI/78z50apmU+KaoT+C/FfFoCmrqhKsZZjJCVTjCU8e23V11UBr5gq1Q=
X-Received: by 2002:aed:3f10:: with SMTP id p16mr28374282qtf.110.1562121156892; 
 Tue, 02 Jul 2019 19:32:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190627155318.38053-1-steven.price@arm.com>
 <20190627155318.38053-3-steven.price@arm.com>
In-Reply-To: <20190627155318.38053-3-steven.price@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 2 Jul 2019 20:32:25 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+fmjqdcQgSJ69O33BJH7AUWvb_YcbJNur+wSpd5VMNOA@mail.gmail.com>
Message-ID: <CAL_Jsq+fmjqdcQgSJ69O33BJH7AUWvb_YcbJNur+wSpd5VMNOA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] drm/panfrost: Use drm_gem_map_offset()
To: Steven Price <steven.price@arm.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1562121157;
 bh=n0WMYfJB3u3567TZQwG6ImcIFEDatY3bPs5dKzrXQtE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=koLbxnZ9er+WL86MfO2lkZ3mDKDz03bBIFrb/W0InimUL6deA2SXBBstBinlAyhvU
 MvnF81cjoo51yAnQ964/Qdnavtv5ylyrc6RsCFoyNwSBZbZ98/oZI6pVUSmo9EuMvj
 g8SMJRsSXPDjLk6cIUCINxaWG+S54p3XhdaUPz8k=
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
Cc: David Airlie <airlied@linux.ie>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgOTo1MyBBTSBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmlj
ZUBhcm0uY29tPiB3cm90ZToKPgo+IHBhbmZyb3N0X2lvY3RsX21tYXBfYm8oKSBjb250YWlucyBh
IHJlaW1wbGVtZW50YXRpb24gb2YKPiBkcm1fZ2VtX21hcF9vZmZzZXQoKSBidXQgd2l0aCBhIGJ1
ZyAtIGl0IGFsbG93cyBtYXBwaW5nIGltcG9ydGVkCj4gb2JqZWN0cyAod2l0aG91dCBnb2luZyB0
aHJvdWdoIHRoZSBleHBvcnRlcikuIEZpeCB0aGlzIGJ5IHN3aXRjaGluZyB0bwo+IHVzZSB0aGUg
bmV3bHkgcmVuYW1lZCBkcm1fZ2VtX21hcF9vZmZzZXQoKSBmdW5jdGlvbiBpbnN0ZWFkIHdoaWNo
IGhhcwo+IHRoZSBib251cyBvZiBzaW1wbGlmeWluZyB0aGUgY29kZS4KCldoaWxlIGl0IG1heSBo
YXZlIGJlZW4gYSBidWcsIGl0IHdvcmtlZCAoYnkgc29tZSBkZWZpbml0aW9uIG9mCndvcmtlZCku
IE5vdyBtZXNhIGJyZWFrcyBvbiBpbXBvcnRpbmcgYnVmZmVycyB3aGljaCBhbHdheXMgZ2V0Cm1t
YXBwZWQuIFNvIHdlIG5lZWQgdG8gcmV2ZXJ0IHRoaXMsIGdldCBpbXBvcnQgbW1hcHMgdG8gd29y
aywgb3IgZHJvcAptbWFwcGluZyBvZiBpbXBvcnRzIGFuZCBiYWNrcG9ydCB0aGF0IHRvIDE5LjEu
IEkgZG9uJ3QgdGhpbmsgdGhlcmUKc2hvdWxkIGJlIGFueSBuZWVkIHRvIG1tYXAgaW1wb3J0cy4K
ClJvYgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
