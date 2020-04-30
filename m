Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3101BFF48
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 16:53:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1851A6E91D;
	Thu, 30 Apr 2020 14:53:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A0D26E91D;
 Thu, 30 Apr 2020 14:53:48 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id j2so7300786wrs.9;
 Thu, 30 Apr 2020 07:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+QmnvA5dChJIrax5V/yu0dUwTA3YT4Rbv3dYKbrlm30=;
 b=XMafNpnqZG9Xdd7UCHcbsV9f2c8cG/AAV3triecqXWg4KtluV8iWCXdtsAyYLBrbtS
 /ymgp1h6s/Ot7N+Pv/6/0QhvJ7iiu4tlLd36OgC0vSAuFTBU6qckF82f6ftOGqJXPKGv
 4b8qCnS8WlMEfblgozRdx1BwqUACDuVSzQa/9KdqBjjkJesUjNtkZKXHEpCeutZ5Dux0
 bjz+gvYSj3qNbOYLsHZ99BVOxxrhkN5XGf3w1ewGboFLGsqOGzbuprjG8Jks8PK1X/Ki
 tePOZILA4bveKNlBTjMy6qWWOdhMAn+FQoGY2VUOLcVhMq8G3yuZ6KrHeaoO2r/bQSMF
 LOWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+QmnvA5dChJIrax5V/yu0dUwTA3YT4Rbv3dYKbrlm30=;
 b=e1f4+llpMLZkbiiLVTJSZEcSBW81DuY8eHA2HOWm7StPFKE4hvvJuelQKPakY+RVu0
 fP8KQYPBXDzpyVt3AkWkl7+IRGyZfHA6wMG7uIyMXDdVunkBrofiarAOa0ULLbCyHvcT
 pi07JUezz5kt0c9knGNdDho1hRI7udkvrguUxSCN6ouIpDMMVxxdudYAd5u0smKmw3LX
 Fzx4ZrOJ1q+2E7nx1qMx0DF2yG7gFajhqEv63AafCGEcMTl8Hf2aL4NhnGcNCd0dOr6i
 J+L7Mihqb9V9z4PT6hfwRG6lKZfDtuF2asY3gywjizI+KHZTbrPhMGmuUUd/2M0wQQRy
 22Hg==
X-Gm-Message-State: AGi0PuawkvtnwN111OgAmlEr9Iv7gQA5nNXTW+lzYytMnMSHcChtW+Nk
 5iZhj1fzRM1XT77vQJEQcje1ZMFbIXcagEiBWvtYag==
X-Google-Smtp-Source: APiQypKPNxr+JrUQbiF77qrXpEEmom/FKCXB3JuYSzSBbLwlnR1j6K3W+ykUs0PMmTzo2G0I3AwwMK53JhmZEivp4kM=
X-Received: by 2002:adf:f844:: with SMTP id d4mr4292599wrq.362.1588258427244; 
 Thu, 30 Apr 2020 07:53:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200426131244.22293-1-bernard@vivo.com>
 <2c67e29b-df17-6ae3-cb55-af950acc022c@amd.com>
In-Reply-To: <2c67e29b-df17-6ae3-cb55-af950acc022c@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 30 Apr 2020 10:53:35 -0400
Message-ID: <CADnq5_M-pZoFXeeULweXGkzDEvbBjoKm1ZBqAwn0S3J7iM18TA@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: cleanup coding style a bit
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
Cc: opensource.kernel@vivo.com, David Airlie <airlied@linux.ie>,
 Bernard Zhao <bernard@vivo.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCk9uIFN1biwgQXByIDI2LCAyMDIwIGF0IDk6MTggQU0g
Q2hyaXN0aWFuIEvDtm5pZwo8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IEFt
IDI2LjA0LjIwIHVtIDE1OjEyIHNjaHJpZWIgQmVybmFyZCBaaGFvOgo+ID4gTWF5YmUgbm8gbmVl
ZCB0byBjaGVjayB3cyBiZWZvcmUga21hbGxvYywga21hbGxvYyB3aWxsIGNoZWNrCj4gPiBpdHNl
bGYsIGttYWxsb2NgcyBsb2dpYyBpcyBpZiBwdHIgaXMgTlVMTCwga21hbGxvYyB3aWxsIGp1c3QK
PiA+IHJldHVybgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEJlcm5hcmQgWmhhbyA8YmVybmFyZEB2
aXZvLmNvbT4KPgo+IFJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29l
bmlnQGFtZC5jb20+Cj4KPiBJJ20gd29uZGVyaW5nIHdoeSB0aGUgYXV0b21hdGVkIHNjcmlwdHMg
aGF2ZW4ndCBmb3VuZCB0aGF0IG9uZSBiZWZvcmUuCj4KPiA+IC0tLQo+ID4gICBkcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL2F0b20uYyB8IDMgKy0tCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9hdG9tLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2F0b20uYwo+ID4gaW5k
ZXggMmMyNzYyN2I2NjU5Li5mMTViMjBkYTUzMTUgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL2F0b20uYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9hdG9t
LmMKPiA+IEBAIC0xMjExLDggKzEyMTEsNyBAQCBzdGF0aWMgaW50IGF0b21fZXhlY3V0ZV90YWJs
ZV9sb2NrZWQoc3RydWN0IGF0b21fY29udGV4dCAqY3R4LCBpbnQgaW5kZXgsIHVpbnQzMgo+ID4g
ICAgICAgU0RFQlVHKCI8PFxuIik7Cj4gPgo+ID4gICBmcmVlOgo+ID4gLSAgICAgaWYgKHdzKQo+
ID4gLSAgICAgICAgICAgICBrZnJlZShlY3R4LndzKTsKPiA+ICsgICAgIGtmcmVlKGVjdHgud3Mp
Owo+ID4gICAgICAgcmV0dXJuIHJldDsKPiA+ICAgfQo+ID4KPgo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
