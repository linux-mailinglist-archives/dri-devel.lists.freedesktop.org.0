Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7991D1FBE1
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 22:57:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EFA389254;
	Wed, 15 May 2019 20:57:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79FF98922F;
 Wed, 15 May 2019 20:57:40 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 198so1402503wme.3;
 Wed, 15 May 2019 13:57:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9QC3JYnFQfQeHTD5SCXfr2i6Pl6XhnaYs2JDAFIiQBI=;
 b=izrXRUz+E8KAw7yUr249g8FmdgYRFSsjlvEJjjj8A79wvkxwbQ4wDdR7L8wy3Q5C/n
 P2DlVU1hno47O0Z+LcPomi2kQs+87zngGy5R8Gw7fiZL7YpVy5yJoSPrdT/cBQ3tJwys
 48CeZWoTux/z207YURdTYVn7x7uCR///Ln6gtaVrb9x1B433GASUJ4RWj1tDa/ubqzY+
 uxLksLNsNbzMQWkPigd4xdR51hrAaTbL6dpR6qv5PIoLlSSzM44bVJ/n56irB4kK5ycB
 xDnm6eyDphNCWz/5Ikavou3XB+rDRJCTd/eG0/4KjsHLm0TxRFIcosZT113hcLsZMtoh
 JhRg==
X-Gm-Message-State: APjAAAXZ33OZW+SmxrTqgRrRl63q6EUVmJHp7L4+bPLbc6SmozTYPEeN
 8eIpIuUCvDbCYro00FuVG5rPf5es3jZw05NkiXc=
X-Google-Smtp-Source: APXvYqxGtShHVqgtKX28zrE0zDc8LxPX+LlBig2BJi7/d6r7rjEHXXcdI8xJ5BM9S3hf8gdE6Mu12kvBDP6zlo+c+i8=
X-Received: by 2002:a1c:a755:: with SMTP id q82mr4208430wme.82.1557953858913; 
 Wed, 15 May 2019 13:57:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190510070734.20625-1-colin.king@canonical.com>
In-Reply-To: <20190510070734.20625-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 15 May 2019 16:57:22 -0400
Message-ID: <CADnq5_PPv42iXCad7HqgG-3zbE307bPrMSsXCdYCNpgrHi4iRA@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amdgpu: fix spelling mistake "retrived" ->
 "retrieved"
To: Colin King <colin.king@canonical.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=9QC3JYnFQfQeHTD5SCXfr2i6Pl6XhnaYs2JDAFIiQBI=;
 b=QeUIN/c7/YlIejWIwDt9XpSOZFjPytX3cqV93/cmYyOrRFBjhoggdWvA1mF7Egm8tA
 DzhN/Cuw+ZLuErtfNYEZB4jo5O5FGD11ZnB605idA/y+STjc2189YFgIK2HEzr9rFBDT
 poNNvgRRz21DX81CL83xAYOF+/vJjiUXxSxQr9pP5+fff8oLf7ImO+U2U5MeqsE+E+Wt
 lf8sBzUthaSu6G8+2cMrbJ3tqpLLhxUTe1opNv45y00rmsBbJrx3t/XeoKMEu28ODADF
 qa3479sDLLiyKNhFVOfpTaXR7i+NS10ln4juNbQQaQ4wfmnZ0S/GL8Dp7+EQK7/fgTFc
 BWAg==
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMTAsIDIwMTkgYXQgMzowNyBBTSBDb2xpbiBLaW5nIDxjb2xpbi5raW5nQGNh
bm9uaWNhbC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdA
Y2Fub25pY2FsLmNvbT4KPgo+IFRoZXJlIGlzIGEgc3BlbGxpbmcgbWlzdGFrZSBpbiBhIERSTV9F
UlJPUiBlcnJvciBtZXNzYWdlLiBGaXggdGhpcy4KPgo+IFNpZ25lZC1vZmYtYnk6IENvbGluIElh
biBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+CgpBcHBsaWVkLiAgdGhhbmtzIQoKQWxl
eAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGZfdjNfNi5jIHwgMiArLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kZl92M182LmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9kZl92M182LmMKPiBpbmRleCA3ZDM3NWY4ZGNjZTYuLmE1YzM1NTg4
NjlmYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kZl92M182LmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kZl92M182LmMKPiBAQCAtMTk0LDcg
KzE5NCw3IEBAIHN0YXRpYyB2b2lkIGRmX3YzXzZfcG1jX2dldF9jdHJsX3NldHRpbmdzKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2LAo+ICAgICAgICAgICAgICAgICByZXR1cm47Cj4KPiAgICAg
ICAgIGlmICgoKmxvX2Jhc2VfYWRkciA9PSAwKSB8fCAoKmhpX2Jhc2VfYWRkciA9PSAwKSkgewo+
IC0gICAgICAgICAgICAgICBEUk1fRVJST1IoIkRGIFBNQyBhZGRyZXNzaW5nIG5vdCByZXRyaXZl
ZCEgTG86ICV4LCBIaTogJXgiLAo+ICsgICAgICAgICAgICAgICBEUk1fRVJST1IoIkRGIFBNQyBh
ZGRyZXNzaW5nIG5vdCByZXRyaWV2ZWQhIExvOiAleCwgSGk6ICV4IiwKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICpsb19iYXNlX2FkZHIsICpoaV9iYXNlX2FkZHIpOwo+ICAgICAg
ICAgICAgICAgICByZXR1cm47Cj4gICAgICAgICB9Cj4gLS0KPiAyLjIwLjEKPgo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxp
bmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
