Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13021110372
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 18:28:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBDEA6EA1B;
	Tue,  3 Dec 2019 17:28:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA6016EA1B
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 17:28:04 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id f4so2861405wmj.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 09:28:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=D8A7wkrhql6WKp7QUE2j3DPhuCaIOinsH690GSnBlRo=;
 b=hgV8kryI6qQ3qc6JdDwbXGNLlv97mYQKNYJZoUOBw57SxmkDaj9Nt3xSbjFnW0eLqL
 z2Rc59jjJH0csIXHldT4AMlvvMgLGUJP7mwK4tH0CM3WkMimca9oqPEyDOsVJwAv8HOX
 DVSeYb50cD8zY5nyh93PXMB26FZb/21/uZCCPPKsaOXxDzbS4SrxR9m148lPQV3Hfkve
 hAfCSWuWhJKN9hZs1FLf90+6LCk6c0PsXQJsFjSoFVgs94mX0BmSUbA83n0VODotCtTf
 qmz7E5/kA3+rS04DxexDdqhF3ChcKDouYHHx0GBw1INFw42Fki/AdgltILGeU0QkSjKq
 KbPA==
X-Gm-Message-State: APjAAAW7OBn3mCMghe1BkkVCR0CXRW3dtUWAX/I7/LnULvb92BRt/99l
 9/PE2w7JuB6tUUYUR2w/6pny+EGDIOw=
X-Google-Smtp-Source: APXvYqxe1dTXJobEAA2aYN5iowzW+UAv1FJbl3EGLloZcEJhKBb93RwSmCuojyPx0N2zVcKcfBI8vQ==
X-Received: by 2002:a1c:5603:: with SMTP id k3mr38150075wmb.150.1575394083288; 
 Tue, 03 Dec 2019 09:28:03 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id m10sm4529756wrx.19.2019.12.03.09.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 09:28:02 -0800 (PST)
Date: Tue, 3 Dec 2019 18:28:00 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/3] drm/cma-helper: Use sgt_dma_contiguous() helper
Message-ID: <20191203172800.GJ624164@phenom.ffwll.local>
References: <20191203163203.1486837-1-thierry.reding@gmail.com>
 <20191203163203.1486837-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191203163203.1486837-2-thierry.reding@gmail.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=D8A7wkrhql6WKp7QUE2j3DPhuCaIOinsH690GSnBlRo=;
 b=MNxdE9+s7frhMLrwjm4fX3cJ3UT68IVlVeUELRTHCxKktgqrjDokR8nS2ROeXOAqUn
 oHyYsCGHSM/iqv3S24tu04yz+kbb0DKsYarTNYzJSDztf+cfrskgc+woZ72yyNv/di6L
 JCN2zjDFxOnCHiBGDOgl8ytbA2PfE8zY3m91Y=
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBEZWMgMDMsIDIwMTkgYXQgMDU6MzI6MDJQTSArMDEwMCwgVGhpZXJyeSBSZWRpbmcg
d3JvdGU6Cj4gRnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KPiAKPiBG
dW5jdGlvbmFsaXR5IHRvIGNvdW50IHRoZSBudW1iZXIgb2YgY29udGlndW91cyBETUEgY2h1bmtz
IGluIGFuIFNHCj4gdGFibGUgaGFzIGJlZW4gYWRkZWQgdG8gdGhlIHNjYXR0ZXJsaXN0IGxpYnJh
cnkuIFVzZSB0aGlzIGZ1bmN0aW9uYWxpdHkKPiB0byByZXBsYWNlIGFuIG9wZW4tY29kZWQgdmVy
c2lvbiBpbiB0aGUgR0VNL0NNQSBoZWxwZXJzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRoaWVycnkg
UmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+CgpPbiB0aGUgZmlyc3QgMiBwYXRjaGVzOgoKUmV2
aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cgo+IC0tLQo+
ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9jbWFfaGVscGVyLmMgfCAyMiArKy0tLS0tLS0tLS0t
LS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9jbWFfaGVscGVy
LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9jbWFfaGVscGVyLmMKPiBpbmRleCAxMmU5OGZi
MjgyMjkuLjViYmFlOTY1NGNjNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dl
bV9jbWFfaGVscGVyLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9jbWFfaGVscGVy
LmMKPiBAQCAtNDcxLDI2ICs0NzEsOCBAQCBkcm1fZ2VtX2NtYV9wcmltZV9pbXBvcnRfc2dfdGFi
bGUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPiAgewo+ICAJc3RydWN0IGRybV9nZW1fY21hX29i
amVjdCAqY21hX29iajsKPiAgCj4gLQlpZiAoc2d0LT5uZW50cyAhPSAxKSB7Cj4gLQkJLyogY2hl
Y2sgaWYgdGhlIGVudHJpZXMgaW4gdGhlIHNnX3RhYmxlIGFyZSBjb250aWd1b3VzICovCj4gLQkJ
ZG1hX2FkZHJfdCBuZXh0X2FkZHIgPSBzZ19kbWFfYWRkcmVzcyhzZ3QtPnNnbCk7Cj4gLQkJc3Ry
dWN0IHNjYXR0ZXJsaXN0ICpzOwo+IC0JCXVuc2lnbmVkIGludCBpOwo+IC0KPiAtCQlmb3JfZWFj
aF9zZyhzZ3QtPnNnbCwgcywgc2d0LT5uZW50cywgaSkgewo+IC0JCQkvKgo+IC0JCQkgKiBzZ19k
bWFfYWRkcmVzcyhzKSBpcyBvbmx5IHZhbGlkIGZvciBlbnRyaWVzCj4gLQkJCSAqIHRoYXQgaGF2
ZSBzZ19kbWFfbGVuKHMpICE9IDAKPiAtCQkJICovCj4gLQkJCWlmICghc2dfZG1hX2xlbihzKSkK
PiAtCQkJCWNvbnRpbnVlOwo+IC0KPiAtCQkJaWYgKHNnX2RtYV9hZGRyZXNzKHMpICE9IG5leHRf
YWRkcikKPiAtCQkJCXJldHVybiBFUlJfUFRSKC1FSU5WQUwpOwo+IC0KPiAtCQkJbmV4dF9hZGRy
ID0gc2dfZG1hX2FkZHJlc3MocykgKyBzZ19kbWFfbGVuKHMpOwo+IC0JCX0KPiAtCX0KPiArCWlm
ICghc2d0X2RtYV9jb250aWd1b3VzKHNndCkpCj4gKwkJcmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7
Cj4gIAo+ICAJLyogQ3JlYXRlIGEgQ01BIEdFTSBidWZmZXIuICovCj4gIAljbWFfb2JqID0gX19k
cm1fZ2VtX2NtYV9jcmVhdGUoZGV2LCBhdHRhY2gtPmRtYWJ1Zi0+c2l6ZSk7Cj4gLS0gCj4gMi4y
My4wCj4gCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9y
YXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
