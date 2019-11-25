Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD72C108AA4
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 10:17:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DAC26E056;
	Mon, 25 Nov 2019 09:17:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 593426E056
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 09:17:18 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id g206so14282846wme.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 01:17:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=trTrVnI2bsOh77Ac8uPPlBYuXoLTqSYRnPeWOpSi7Yg=;
 b=QlxzibmCpB4FUmPW8n6ORHJ40w4Ne/Z5xZ1JydaWwYEMJGYGFYcmBx9yJRo5KmBm6W
 +cx/5wTWEW9AGQ8O4DldHj2Hg1iAG2Z1k1oYGJpNwDoRITT5jRFu4DHROp9NR2upffmr
 P0egnJ1I8tdDr2pG0X2yyyLzMuTXGMHLTJwem95i2ONIzy1DTJGzIoQAwpxZ9Xw6EUPN
 Cd6NYpR6eUe+PrAYEwXavITxJJggPeLmHa3P6oKF4iZyFPGSSb6v+vaKTNNIFy6Z1sfT
 FDbeppeL+FhGF7r/LkZcuxAtES34SVHaGsgd6RHxhQtMQAQk8jqkipeTZHDbcvtdcs2C
 +kww==
X-Gm-Message-State: APjAAAW5mO/YTOlKL2Auk695Ugr5QbaJJ5w9K34NqorFIZUEu8ZoCVu/
 IulReqcEGR9EccW6v3qSznw2Ig==
X-Google-Smtp-Source: APXvYqwh8ktqmZV1nhRY+hQVHwJ6U40qgTag2K4tWaWThVN2r5Ts294S9YTMUAegqo8DUITvtStsBQ==
X-Received: by 2002:a7b:c001:: with SMTP id c1mr28086154wmb.96.1574673436820; 
 Mon, 25 Nov 2019 01:17:16 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id 60sm8569483wrn.86.2019.11.25.01.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 01:17:16 -0800 (PST)
Date: Mon, 25 Nov 2019 10:17:14 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/6] drm/gma500: Cleanup framebuffer and fbdev
Message-ID: <20191125091714.GI29965@phenom.ffwll.local>
References: <20191122100545.16812-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191122100545.16812-1-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=trTrVnI2bsOh77Ac8uPPlBYuXoLTqSYRnPeWOpSi7Yg=;
 b=K/EMPo24tr2YGC+vHNF6rI2dJ/M/JG8c7Elo2wP2YNh7DRl0rBuavYsDSJaTyeyJm0
 bialk4P4222r9cV6KwPsNi7TkHHS0FkP9mCrjHzfgLQDWRCcMNwZuMbQb3H5dqHsyqQr
 eyt1DvVuJ3wnGFJP/YIWczKhnR9NMfrg9MM2s=
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgMTE6MDU6MzlBTSArMDEwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gVGhlc2UgcGF0Y2hlcyByZW1vdmUgc3RydWN0IHBzYl9mcmFtZWJ1ZmZlciBh
bmQgc3RydWN0IHBzYl9mYmRldgo+IGZyb20gZ21hNTAwLiBCb3RoIGFyZSByZXBsYWNlZCBieSB0
aGVpciBlcXVpdmFsZW50cyBmcm9tIHRoZSBEUk0KPiBoZWxwZXJzLgo+IAo+IFRoZSBwYXRjaHNl
dCBoYXMgYmVlbiB0ZXN0ZWQgYnkgcnVubmluZyB0aGUgZmJkZXYgY29uc29sZSwgWDExIGFuZAo+
IFdlc3RvbiBvbiBhbiBBdG9tIFo1MjAgd2l0aCBQb3Vsc2JvIGdyYXBoaWNzIGNoaXAuCgpPbiB0
aGUgc2VyaWVzOiBBY2tlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5j
aD4KPiAKPiBUaG9tYXMgWmltbWVybWFubiAoNik6Cj4gICBkcm0vZ21hNTAwOiBSZW1vdmUgYWRk
cl9zcGFjZSBmaWVsZCBmcm9tIHBzYl9mcmFtZWJ1ZmZlcgo+ICAgZHJtL2dtYTUwMDogUmVtb3Zl
IGZpZWxkICdmYmRldicgZnJvbSBzdHJ1Y3QgcHNiX2ZyYW1lYnVmZmVyCj4gICBkcm0vZ21hNTAw
OiBSZXBsYWNlIHN0cnVjdCBwc2JfZnJhbWVidWZmZXIgd2l0aCBzdHJ1Y3QgZHJtX2ZyYW1lYnVm
ZmVyCj4gICBkcm0vZ21hNTAwOiBQYXNzIHN0cnVjdCBkcm1fZ2VtX29iamVjdCB0byBmcmFtZWJ1
ZmZlciBmdW5jdGlvbnMKPiAgIGRybS9nbWE1MDA6IFN0b3JlIGZyYW1lYnVmZmVyIGluIHN0cnVj
dCBkcm1fZmJfaGVscGVyCj4gICBkcm0vZ21hNTAwOiBSZW1vdmUgc3RydWN0IHBzYl9mYmRldgo+
IAo+ICBkcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2FjY2VsXzJkLmMgICAgfCAgMTUgKystLQo+ICBk
cml2ZXJzL2dwdS9kcm0vZ21hNTAwL2ZyYW1lYnVmZmVyLmMgfCAxMjkgKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9nbWE1MDAvZnJhbWVidWZmZXIuaCB8ICAx
NSAtLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9nbWE1MDAvcHNiX2Rydi5jICAgICB8ICAgMSArCj4g
IGRyaXZlcnMvZ3B1L2RybS9nbWE1MDAvcHNiX2Rydi5oICAgICB8ICAgOCArLQo+ICA1IGZpbGVz
IGNoYW5nZWQsIDc0IGluc2VydGlvbnMoKyksIDk0IGRlbGV0aW9ucygtKQo+IAo+IC0tCj4gMi4y
My4wCj4gCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9y
YXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
