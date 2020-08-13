Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7140F2437F7
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 11:51:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B05CA6E96D;
	Thu, 13 Aug 2020 09:51:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44CDF6E96D
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 09:51:10 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id t14so4482409wmi.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 02:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=zg93XxO4l+jcR8PfpAZh0n8+oaLX+Q4lgRFm3zGssrc=;
 b=DVhNg6KjuaCUFHNyZn3fii/TgH9lle+4x/mX1ByaV25FzltReZ+eVhVlAFfxQ0o9Cs
 BHZf8neUfriA+xuI3HFmlV1P91lUGIGAxoPO8cUIZwTOwse3gLkuyLdaGIZS3d1/pHDo
 nbyzVt8rKGwFYDxNNBq7//TAbTd/Q+eWflGMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=zg93XxO4l+jcR8PfpAZh0n8+oaLX+Q4lgRFm3zGssrc=;
 b=DCCkReoLGvuhC4xLxz6e9aBONTtTEOzC9dTbsaUJGXINN1mFj6pBvP71xXl/Coldws
 CGgFV0bhHyMu2baGVHcLAr5U4Gzu88ceTSwUzajcbGhGLzANN4HdhZ3xl/7e6NCgxmlA
 BkbTilazcp7k549xek/lK4kFJeVNic+ENL2tc0t425uavFRYUXerN6wPHNMdtieYvly8
 BBlS90s82WwwsT/MIqRw+NEvzHrwvWgTeRsIVIDt9F8L+NojmDaIoVtK3WxcZCwQHUt/
 LZoh9JH3ZCCIR/DVYCk8cFBK/DCBFXuRLIy/5bQQLuy+YxBQIaVeLO9Gb5xwUyOrYpOx
 IXgg==
X-Gm-Message-State: AOAM530XfgW8GBCP3fqhJJ+eFKrYGXgtx8o4JaQMddjRgRTIl4Ohrae0
 OFqviocOIyxM1SLnjf9+rh8F7A==
X-Google-Smtp-Source: ABdhPJzcoJ5rRTPQL/cGJK9cs5jwZn25rutC7+9OZPz6v1i5Qk0+wLJa418Yrv09qyu0BV9p+dgqdA==
X-Received: by 2002:a1c:1d2:: with SMTP id 201mr3368914wmb.132.1597312268880; 
 Thu, 13 Aug 2020 02:51:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 124sm8705928wmd.31.2020.08.13.02.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 02:51:08 -0700 (PDT)
Date: Thu, 13 Aug 2020 11:51:06 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/hisilicon: Fix build error of no type of module_init
Message-ID: <20200813095106.GK2352366@phenom.ffwll.local>
Mail-Followup-To: Thomas Zimmermann <tzimmermann@suse.de>,
 Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org, linuxarm@huawei.com
References: <1597289955-27381-1-git-send-email-tiantao6@hisilicon.com>
 <5e7ed4d6-8961-bdd0-6698-47571066357a@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5e7ed4d6-8961-bdd0-6698-47571066357a@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linuxarm@huawei.com, xinliang.liu@linaro.org,
 kraxel@redhat.com, alexander.deucher@amd.com,
 Tian Tao <tiantao6@hisilicon.com>, tglx@linutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTMsIDIwMjAgYXQgMTA6MDM6MThBTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gSGkKPiAKPiBBbSAxMy4wOC4yMCB1bSAwNTozOSBzY2hyaWViIFRpYW4gVGFv
Ogo+ID4gQWRkIG1pc3NpbmcgaW5jbHVkZSB0byBmaXggYnVpbGQgZXJyb3I6Cj4gPiBoaWJtY19k
cm1fZHJ2LmM6Mzg1OjE6IHdhcm5pbmc6IGRhdGEgZGVmaW5pdGlvbiBoYXMgbm8gdHlwZSBvciBz
dG9yYWdlCj4gPiBjbGFzcyBbZW5hYmxlZCBieSBkZWZhdWx0XQo+ID4gaGlibWNfZHJtX2Rydi5j
OjM4NToxOiBlcnJvcjogdHlwZSBkZWZhdWx0cyB0byDigJhpbnTigJkgaW4gZGVjbGFyYXRpb24K
PiA+IG9mIOKAmG1vZHVsZV9pbml04oCZIFstV2Vycm9yPWltcGxpY2l0LWludF0KPiA+IGhpYm1j
X2RybV9kcnYuYzozODU6MTogd2FybmluZzogcGFyYW1ldGVyIG5hbWVzICh3aXRob3V0IHR5cGVz
KSBpbiBmdW5jdGlvbgo+ID4gb2Yg4oCYbW9kdWxlX2V4aXTigJkgWy1XZXJyb3I9aW1wbGljaXQt
aW50XQo+ID4gaGlibWNfZHJtX2Rydi5jOjM4NToyOTI6MTogd2FybmluZzogcGFyYW1ldGVyIG5h
bWVzICh3aXRob3V0IHR5cGVzKSBpbgo+ID4gZnVuY3Rpb24gZGVjbGFyYXRpb24gW2VuYWJsZWQg
YnkgZGVmYXVsdF0KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogVGlhbiBUYW8gPHRpYW50YW82QGhp
c2lsaWNvbi5jb20+Cj4gPiBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRl
bC5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBz
dXNlLmRlPgo+IAo+IEkgcHVzaGVkIHRoZSBwYXRjaCB0byBkcm0tbWlzYy1uZXh0LCBidXQgZm9y
Z290IHRvIGFkZCBteSBSLWIgdGFnLiBJZgo+IGFueW9uZSBjb21wbGFpbnMsIGl0J3MgbXkgZmF1
bHQuCgpzb2IgaW1wbGllcyByLWIgZ2VuZXJhbGx5LCBtb3N0IG1haW50YWluZXJzIGRvIGl0IGxp
a2UgdGhhdCBhbmQgZG9uJ3QgYWRkCmJvdGggdGhlaXIgc29iIGFuZCByLWIgdGFnLiBUaGF0J3Mg
YWxzbyB3aHkgZGltIGRvZXNuJ3QgZW5mb3JjZSBhbiByLWIgdGFnCmluIHRoaXMgY2FzZS4KLURh
bmllbAo+IAo+IEJlc3QgcmVnYXJkcwo+IFRob21hcwo+IAo+ID4gLS0tCj4gPiAgZHJpdmVycy9n
cHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1fZHJ2LmMgfCAxICsKPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2hp
c2lsaWNvbi9oaWJtYy9oaWJtY19kcm1fZHJ2LmMKPiA+IGluZGV4IDFhZTM2MGQuLjJiNGY4MjEg
MTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1jL2hpYm1jX2Ry
bV9kcnYuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19k
cm1fZHJ2LmMKPiA+IEBAIC0xMSw2ICsxMSw3IEBACj4gPiAgICoJSmlhbmh1YSBMaSA8bGlqaWFu
aHVhQGh1YXdlaS5jb20+Cj4gPiAgICovCj4gPiAgCj4gPiArI2luY2x1ZGUgPGxpbnV4L21vZHVs
ZS5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC9wY2kuaD4KPiA+ICAKPiA+ICAjaW5jbHVkZSA8ZHJt
L2RybV9hdG9taWNfaGVscGVyLmg+Cj4gPiAKPiAKPiAtLSAKPiBUaG9tYXMgWmltbWVybWFubgo+
IEdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXIKPiBTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJt
YW55IEdtYkgKPiBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkKPiAoSFJC
IDM2ODA5LCBBRyBOw7xybmJlcmcpCj4gR2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7Zy
ZmZlcgo+IAoKCgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENv
cnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
