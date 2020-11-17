Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BF92B6E2F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 20:13:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E2956E077;
	Tue, 17 Nov 2020 19:13:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 133476E06D
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 19:13:09 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 1so2788767wme.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 11:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=WNUVTXMmnykufcQ4Q8lOWcJVUiIN3QeGQB95A76tQ+8=;
 b=i0YBLj2HBs3hcsN/sjWp36dXpyzOLonq5s71qRK7+wGLc3Xp1HvfGP8JlWZH5JAY9H
 NAepCFPBk+/LY4QzQ+pSU0XFUCVkhBP7o5kblNYIG29TWf1zyq2gPuPh/f3PeMpk7tsa
 Qxeiz28OVxAkTt5us3nJPXFCdykpxw9J7ni2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=WNUVTXMmnykufcQ4Q8lOWcJVUiIN3QeGQB95A76tQ+8=;
 b=M/HH18S1P695FYCLMcXmufUcp+PtTaSAbjM+tD2cRoaU4ls2Nj+wHl+F0NTN8INxBT
 Szv/IOSxHsJ2eEceU6RDRBLCPlhU/FXIFpwY7VWD5T9OcEx3PZAuDLODT2wXa1ISXwxD
 qZ291FFhjIXo8Wd9+yshmgCpoK/LpKglqVCNixwvNbE8KPmhNszFoaVvbr3dxXq2i1Os
 bmf6fK/pMazh47KYnEcQxvErmxCmHqjp703G4ic2vTyF/QAfAso4l+RQGJeT1TaA8kDq
 F7s8s9v3AgtySaowNiCEPCed7CuNvG4hA640SHjOsreOrOZh+hh6s2lZCNLUKZN50GgY
 K+mA==
X-Gm-Message-State: AOAM532tcbaoDhkfEhlINumzzJX2UBrhA15pQTQJhVLdO/f42eW4P3oa
 t/UrYwWFGu68nJZM67BtG2/s0A==
X-Google-Smtp-Source: ABdhPJweuOOwDW8ob2fCJCgh19KgYC/5yerZWUwLSSEiJpkdEJlwJjHbZ0Lfpao9PySksN69RQprUg==
X-Received: by 2002:a1c:ddd7:: with SMTP id u206mr590340wmg.27.1605640387840; 
 Tue, 17 Nov 2020 11:13:07 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c5sm19496393wrb.64.2020.11.17.11.13.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 11:13:06 -0800 (PST)
Date: Tue, 17 Nov 2020 20:13:04 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 03/42] drm/drm_dp_mst_topology: Remove set but never used
 variable 'len'
Message-ID: <20201117191304.GS401619@phenom.ffwll.local>
Mail-Followup-To: Lee Jones <lee.jones@linaro.org>,
 linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
References: <20201116174112.1833368-1-lee.jones@linaro.org>
 <20201116174112.1833368-4-lee.jones@linaro.org>
 <20201117172925.GN401619@phenom.ffwll.local>
 <20201117181250.GL1869941@dell> <20201117181340.GM1869941@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117181340.GM1869941@dell>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTcsIDIwMjAgYXQgMDY6MTM6NDBQTSArMDAwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+IE9uIFR1ZSwgMTcgTm92IDIwMjAsIExlZSBKb25lcyB3cm90ZToKPiAKPiA+IE9uIFR1ZSwg
MTcgTm92IDIwMjAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiAKPiA+ID4gT24gTW9uLCBOb3Yg
MTYsIDIwMjAgYXQgMDU6NDA6MzNQTSArMDAwMCwgTGVlIEpvbmVzIHdyb3RlOgo+ID4gPiA+IEZp
eGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMpOgo+ID4gPiA+IAo+
ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jOiBJbiBmdW5jdGlv
biDigJhkcm1fZHBfc2VuZF9xdWVyeV9zdHJlYW1fZW5jX3N0YXR1c+KAmToKPiA+ID4gPiAgZHJp
dmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYzozMjYzOjY6IHdhcm5pbmc6IHZhcmlh
YmxlIOKAmGxlbuKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxl
XQo+ID4gPiA+IAo+ID4gPiA+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9y
c3RAbGludXguaW50ZWwuY29tPgo+ID4gPiA+IENjOiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtl
cm5lbC5vcmc+Cj4gPiA+ID4gQ2M6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNl
LmRlPgo+ID4gPiA+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gPiA+ID4g
Q2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiA+ID4gPiBDYzogZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8
bGVlLmpvbmVzQGxpbmFyby5vcmc+Cj4gPiA+IAo+ID4gPiBHb2luZyB0byBhcHBseSB0aGlzLCBi
dXQgSSBub3RpY2VkIHRoYXQgdGhlIHJldHVybiB2YWx1ZSBvZiB0aGUKPiA+ID4gYnVpbGRfcXVl
cnlfc3RyZWFtX2VuY19zdGF0dXMoKSBpcyBwb2ludGxlc3MuIENhbiB5b3UgcGxzIGZvbGxvdyB1
cCB3aXRoCj4gPiA+IGFuIGFkZGl0aW9uYWwgcGF0Y2ggdG8gY2hhbmdlIHRoYXQgdG8gdm9pZD8K
PiA+IAo+ID4gSSBjYW4uCj4gCj4gTG9va3MgbGlrZSB5b3UncmUgZ2V0dGluZyBkcm9wcGVkIGFn
YWluIQoKSSBnZXQgaXQgb24gbGlzdC4gU28gbm90IGxvc3QuCgp0YmggbXkgcGVyc29uYWwgY2M6
IGlzIHN1Y2ggYSBkaXNhc3Ryb3VzIG1lc3MgaXQncyBhY3R1YWxseSBlYXNpZXIgdG8gcGluZwpt
ZSB3aXRoIGFuIGludGVyZXN0aW5nIHN1YmplY3Qgb24gZHJpLWRldmVsIGhlcmUgLi4uCi1EYW5p
ZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9u
Cmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
