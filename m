Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD25E0A03
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 19:03:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F6E86E895;
	Tue, 22 Oct 2019 17:03:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60C3B6E895
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 17:03:03 +0000 (UTC)
Received: by mail-yw1-xc41.google.com with SMTP id x65so6444646ywf.12
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 10:03:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nZ2WKQLUZZCYTX/pFJFfKJwQRc40Rh2JwIFJURQ6wzo=;
 b=KdRI5Knc2vFmgk0CEl0LQA6ejIQh9Q4RCfmmsoV5OBIjChEo+xwk446ixZ3J927zPF
 xKaHjg2wBC/VKFTv+j1M6IP0DGTEzOAsd0F8K+lsvLoWIAhTxGrWEHR5RmaIKNUZaz0a
 RYNSS88kJViXyqPXMDM7j1TDjklHAHVZAgU6swNO5JjL6sV+pkaIxwbobmvTZcNCfPAU
 Oxxoh9d60vq/sRwynW7WGOIU+cha/umr03wGxTXubW1Ik1wFxX1TXRVKrl+LaaeadFkS
 d0ku9utbtHqWCCIvNdZgZXuAm1o0//NgD/kRdVYwHeWmlHC8aa3qatQqDxQafWEZvExg
 saDw==
X-Gm-Message-State: APjAAAX1mWPN676rMV/RWQWWvuYpWs/3z3psGIyaW3FpOQUy2PXpuIx5
 QpAR8W28eDNXFzad0JPupuaGMFg5eMM=
X-Google-Smtp-Source: APXvYqwMxvm74yIFKypUOzTax+B8rmiyZVDfjakosf7W4UaawvlH9EpGpTfowG4Ly/0h/zd9A25DFQ==
X-Received: by 2002:a81:83c1:: with SMTP id t184mr3129608ywf.190.1571763782530; 
 Tue, 22 Oct 2019 10:03:02 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id g81sm4334296ywa.46.2019.10.22.10.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 10:03:01 -0700 (PDT)
Date: Tue, 22 Oct 2019 13:03:01 -0400
From: Sean Paul <sean@poorly.run>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 1/2] drm/todo: Remove i915 device_link task
Message-ID: <20191022170301.GF85762@art_vandelay>
References: <20191022152530.22038-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191022152530.22038-1-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=nZ2WKQLUZZCYTX/pFJFfKJwQRc40Rh2JwIFJURQ6wzo=;
 b=LeaI6V+ACrp+sAhLFUlPrtexMVSNMKDaG6IoKsN0d5imO0H+6ashmuVOBXFwEFs4V+
 WxjlXMMJb84GeY9M5GDsxhqYbArwDHjkOT+9dEuPkbBCfWF4PFlhMugksGlnqMx1GSXr
 UjcHsCbqYtKV4GOVC4MF9l69uyQuC235p5/M2wtFCSxSW/BEjVjTmckzQaZhERC0csBn
 dkqJ4ttm3EPbiDxA7ZVwql7ayx+n+ojB+444ImSNI9qX6pyVi2/cXrXxaLn4cztPr8xx
 hkGCw6doTX8F/kBpXDB3PltACeVr2Nh4G0Im+Av7SVDsLA4OpQfoyGV5eNfXqwPjjX74
 qHow==
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMjIsIDIwMTkgYXQgMDU6MjU6MjlQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBEb25lIHdpdGgKPiAKPiBjb21taXQgYWVmOWYzM2I3NjU4YTc0ODlmNzFkZjVkNmU2
ZWNiNDdmMjUyMWU4YQo+IEF1dGhvcjogSW1yZSBEZWFrIDxpbXJlLmRlYWtAaW50ZWwuY29tPgo+
IERhdGU6ICAgVHVlIE9jdCAyMyAxNzo0MzoxMCAyMDE4ICswMzAwCj4gCj4gICAgIGRybS9pOTE1
OiBFbnN1cmUgcHJvcGVyIEhEQSBzdXNwZW5kL3Jlc3VtZSBvcmRlcmluZyB3aXRoIGEgZGV2aWNl
IGxpbmsKPiAKPiBDYzogSW1yZSBEZWFrIDxpbXJlLmRlYWtAaW50ZWwuY29tPgo+IFNpZ25lZC1v
ZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+CgpSZXZpZXdlZC1i
eTogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+Cgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2dw
dS90b2RvLnJzdCB8IDcgLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QgYi9Eb2N1bWVudGF0
aW9uL2dwdS90b2RvLnJzdAo+IGluZGV4IDIzYjNhNjc3OTRiYS4uOWFjMTAyOTIyNzEyIDEwMDY0
NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0Cj4gKysrIGIvRG9jdW1lbnRhdGlv
bi9ncHUvdG9kby5yc3QKPiBAQCAtNDM4LDEzICs0MzgsNiBAQCBTZWUgZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L1RPRE8gZm9yIHRhc2tzLgo+ICAKPiAgQ29udGFjdDogSGFycnkgV2VudGxh
bmQsIEFsZXggRGV1Y2hlcgo+ICAKPiAtaTkxNQo+IC0tLS0tCj4gLQo+IC0tIE91ciBlYXJseS9s
YXRlIHBtIGNhbGxiYWNrcyBjb3VsZCBiZSByZW1vdmVkIGluIGZhdm91ciBvZiB1c2luZwo+IC0g
IGRldmljZV9saW5rX2FkZCB0byBtb2RlbCB0aGUgZGVwZW5kZW5jeSBiZXR3ZWVuIGk5MTUgYW5k
IHNuZF9oYWQuIFNlZQo+IC0gIGh0dHBzOi8vZHJpLmZyZWVkZXNrdG9wLm9yZy9kb2NzL2RybS9k
cml2ZXItYXBpL2RldmljZV9saW5rLmh0bWwKPiAtCj4gIEJvb3RzcGxhc2gKPiAgPT09PT09PT09
PQo+ICAKPiAtLSAKPiAyLjIzLjAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwKCi0tIApTZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVyLCBH
b29nbGUgLyBDaHJvbWl1bSBPUwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
