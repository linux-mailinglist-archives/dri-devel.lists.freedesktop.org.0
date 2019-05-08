Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70811173EF
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2019 10:35:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E24189862;
	Wed,  8 May 2019 08:35:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 689B68986D
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2019 08:35:24 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id p27so6363534eda.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2019 01:35:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=O82OgpfzeDh2UEeB/vmic+hMxc9DH+yp719HK/Iv7xI=;
 b=QsUD3s6XlcUPTIEqkj9zkBznCVCeRvoQdrzLSlKp5eUPYDCuGENZffN2W9zEl56MmL
 EcjH8M2s7B6M2u9oyOyc7kvX3ki47pCxGxzF6EseXDcv/40zzFrPPQbRq5Bb6t4XFifu
 fX9yN9s+avUXHHi4dm0qiy8enkFWhLxKdXohpOJcUNRnI/qgRhhJoPkGv+Aluc9YjY5p
 GvsfyGWYjfCovbVrW3HuN3Dp3rF7vVRA+om5jkiReRR7ERPtHVy/tzxn3m9+GoMMKLe+
 CNanauMvnBQTBf88Jyz6dSa4+k76SFq8JUf67y7QYx8rcixl0nsYPH3ObmAF27YI72Ui
 jr9g==
X-Gm-Message-State: APjAAAWGREwLh11Y7auy2Y3/qvXzza76zsYbYhogoTAM9JdHYj4wvR4z
 47UApdP7UGU+u2jp8iyL1E3NbA==
X-Google-Smtp-Source: APXvYqxGx8OsiIdz2sy8/idKb8APDa8zpodaXm0vDZ+ekASTAgEhxUCZYEn7hnen6RqRvgXKmM2T6g==
X-Received: by 2002:a50:87ab:: with SMTP id a40mr36539324eda.188.1557304523070; 
 Wed, 08 May 2019 01:35:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id y13sm3739593edp.77.2019.05.08.01.35.21
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 08 May 2019 01:35:22 -0700 (PDT)
Date: Wed, 8 May 2019 10:35:19 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jordan Crouse <jcrouse@codeaurora.org>
Subject: Re: [PATCH] drm/atomic: Check that the config funcs exist
 drm_mode_alloc
Message-ID: <20190508083519.GS17751@phenom.ffwll.local>
Mail-Followup-To: Jordan Crouse <jcrouse@codeaurora.org>,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>
References: <1557256451-24950-1-git-send-email-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1557256451-24950-1-git-send-email-jcrouse@codeaurora.org>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=O82OgpfzeDh2UEeB/vmic+hMxc9DH+yp719HK/Iv7xI=;
 b=bI+OTnFQBhAMy/Fosn0WFLRAjME86sn9+AY2pJSC/YisVJpsAi3ITxRhfc+MXIkAcO
 2xPP+zbqNdgib/BoAt3L0GfsYBQ5EAC4h+HB97Ud18Rm8WZSEl1Jala96sRo/86WW6BW
 NLiHu2roFj/eR4y3VgLe5lQ3BFFna8Yrm2nvI=
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMDcsIDIwMTkgYXQgMDE6MTQ6MTFQTSAtMDYwMCwgSm9yZGFuIENyb3VzZSB3
cm90ZToKPiBBbiBlcnJvciB3aGlsZSBpbml0aWFsaXppbmcgdGhlIG1zbSBkcml2ZXIgZW5kcyB1
cCBjYWxsaW5nCj4gZHJtX2F0b21pY19oZWxwZXJfc2h1dGRvd24oKSB3aXRob3V0IGZpcnN0IGlu
aXRpYWxpemluZyB0aGUgZnVuY3MKPiBpbiBtb2RlX2NvbmZpZy4gV2hpbGUgSSdtIG5vdCAxMDAl
IHN1cmUgdGhpcyBpc24ndCBhIG9yZGVyaW5nCj4gcHJvYmxlbSBpbiBtc20gYWRkaW5nIGEgY2hl
Y2sgdG8gZHJtX21vZGVfYWxsb2Mgc2VlbXMgbGlrZQo+IGEgbmljZSBhbmQgc2FmZSBzb2x1dGlv
bi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKb3JkYW4gQ3JvdXNlIDxqY3JvdXNlQGNvZGVhdXJvcmEu
b3JnPgoKSG0geWVhaCB0aGlzIGxvb2tzIGEgYml0IHRvbyBtdWNoIGxpa2UgZHVjdHRhcGUuIEkg
dGhpbmsgTm9yYWxmIHN0YXJ0ZWQKd29ya2luZyBvbiBzb21lIGlkZWFzIG9mIGRldm0tbGlrZSBh
dXRvbWF0aWMgY2xlYW51cCBmb3IgZHJtIHN0dWZmICh3ZQpjYW5ub3QgdXNlIGRldm0sIHRoYXQg
aGFzIHRoZSB3cm9uZyBsaWZldGltZXMsIGRlc3BpdGUgYWxsIHRoZSBkcml2ZXJzCnVzaW5nIGl0
KS4KClNpbXBsZSBmaXggd291bGQgYmUgdG8gbW92ZSB1cCB0aGUgYXNzaWdubWVudCBvZiBjb25m
aWcuZnVuY3MgdG8gYmUgbXVjaAplYXJsaWVyIGluIHlvdXIgZHJpdmVyIGxvYWQgSSBndWVzcy4K
LURhbmllbAoKPiAtLS0KPiAKPiAgZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWMuYyB8IDMgKysr
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2RybV9hdG9taWMuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljLmMK
PiBpbmRleCA1ZWI0MDEzLi4xNzI5NDI4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fYXRvbWljLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pYy5jCj4gQEAgLTEx
NCw2ICsxMTQsOSBAQCBkcm1fYXRvbWljX3N0YXRlX2FsbG9jKHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYpCj4gIHsKPiAgCXN0cnVjdCBkcm1fbW9kZV9jb25maWcgKmNvbmZpZyA9ICZkZXYtPm1vZGVf
Y29uZmlnOwo+ICAKPiArCWlmICghY29uZmlnLT5mdW5jcykKPiArCQlyZXR1cm4gTlVMTDsKPiAr
Cj4gIAlpZiAoIWNvbmZpZy0+ZnVuY3MtPmF0b21pY19zdGF0ZV9hbGxvYykgewo+ICAJCXN0cnVj
dCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZTsKPiAgCj4gLS0gCj4gMi43LjQKPiAKCi0tIApEYW5p
ZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxv
Zy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
