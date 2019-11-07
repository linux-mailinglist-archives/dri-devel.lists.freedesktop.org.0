Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04204F293E
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 09:35:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C746C6EEFF;
	Thu,  7 Nov 2019 08:35:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B6016EEFE
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 08:35:47 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id t26so1378945wmi.4
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Nov 2019 00:35:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=YfNv4PjwR24si/d0WYMHce8yI68SCM7QkBCiTCtA1k8=;
 b=IDma66q5YWyXZhAOSs4mGODuKgTI6PzGu7WyRqgMxw2nxK79sOkDlv5HmZM0rQra77
 JlHxI5WVV6nnmlMLz7GtCU/MIZY0FtASd0SpSMwIOcEDQ6EoTcpQ37Vxz3XuWtRoxG2b
 QbLdYM2kUz+RXfCj/FvnhA+aHyur0R2gbOyz0AvXs4SnjxN8xq6WvCaqhPdpyTpGQjiY
 XFegz2sEPk9SjxPfM1UsyB+PEuRiNPSzjEgieKxkPYUbQUO/7/Yw1MONCE1mbmOVid7Z
 ixbuKQtQ8b6DfRZigf58txCcK2Z3l4WgKAsf9FPj8y0NGCIOqWFCysFzfcZatD2cJw8R
 PdRw==
X-Gm-Message-State: APjAAAVGOv1/jZ/Xn1+efU5TSs/4uiJNvH7a8hpthlZqcK3wTeHq0Y+q
 XPs9d+va6IIcay/uDUPbtce5iw==
X-Google-Smtp-Source: APXvYqwHgsSrrqd51TIGZu/Za+UPNbmwRQv/lpWv0o0X0X67xMkmto35yQV+hdKuHSaP9WnbtkvG/Q==
X-Received: by 2002:a05:600c:21d9:: with SMTP id
 x25mr1794320wmj.50.1573115746019; 
 Thu, 07 Nov 2019 00:35:46 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id y19sm2110750wmd.29.2019.11.07.00.35.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2019 00:35:45 -0800 (PST)
Date: Thu, 7 Nov 2019 09:35:43 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH v3 1/5] drm: Move EXPORT_SYMBOL_FOR_TESTS_ONLY under a
 separate Kconfig
Message-ID: <20191107083543.GL23790@phenom.ffwll.local>
References: <20191106142432.14022-1-chris@chris-wilson.co.uk>
 <20191106142432.14022-2-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191106142432.14022-2-chris@chris-wilson.co.uk>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YfNv4PjwR24si/d0WYMHce8yI68SCM7QkBCiTCtA1k8=;
 b=KQ9dTtNzKcJBxny1K0dWz5o6vIFoEzmyDTFGNy4CpBfiVTxkXMKQz0FzO7jHkppLdh
 xixkIvCtjOGeuZoELq44zIFAzLMvlqXvoE31mFabky8O3XV57jcVOxd9GYzdq4jFLljF
 bFrOkFkYT0ScsS9WxlxyRRMIk9oJXqFS8xiJI=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMDYsIDIwMTkgYXQgMDI6MjQ6MjhQTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IEN1cnJlbnRseSwgd2Ugb25seSBleHBvcnQgc3ltYm9scyBmb3IgZHJtLXNlbGZ0ZXN0
cyB3aGljaCBhcmUgZWl0aGVyCj4gY29tcGlsZWQgYXMgbW9kdWxlcyBvciBpbnRvIHRoZSBtYWlu
IGRybSBidWlsdGluLiBIb3dldmVyLCBpZiB3ZSB3YW50IHRvCj4gZXhwb3J0IHN5bWJvbHMgZnJv
bSBkcm0ua28gZm9yIHRoZSBkcml2ZXJzJyBzZWxmdGVzdHMsIHdlIHJlcXVpcmUgYQo+IG1lYW5z
IG9mIGNvbnRyb2xsaW5nIHRoYXQgZXhwb3J0IHNlcGFyYXRlbHkuIFNvIHdlIGFkZCBhIG5ldyBL
Y29uZmlnIHRvCj4gZGV0ZXJtaW5lIHdoZXRoZXIgb3Igbm90IHRoZSBFWFBPUlRfU1lNQk9MX0ZP
Ul9URVNUU19PTkxZKCkgdGFrZXMKPiBlZmZlY3QuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXMg
V2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRh
bmllbC52ZXR0ZXJAZmZ3bGwuY2g+CgpSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVs
LnZldHRlckBmZndsbC5jaD4KCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9LY29uZmlnIHwgNCAr
KysrCj4gIGluY2x1ZGUvZHJtL2RybV91dGlsLmggIHwgMiArLQo+ICAyIGZpbGVzIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9LY29uZmlnCj4gaW5kZXggNjE3ZDlj
M2E4NmMzLi5kMzU2MGFmZTM0ZDMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL0tjb25m
aWcKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vS2NvbmZpZwo+IEBAIC01NCw2ICs1NCw5IEBAIGNv
bmZpZyBEUk1fREVCVUdfTU0KPiAgCj4gIAkgIElmIGluIGRvdWJ0LCBzYXkgIk4iLgo+ICAKPiAr
Y29uZmlnIERSTV9FWFBPUlRfRk9SX1RFU1RTCj4gKwlib29sCj4gKwo+ICBjb25maWcgRFJNX0RF
QlVHX1NFTEZURVNUCj4gIAl0cmlzdGF0ZSAia3NlbGZ0ZXN0cyBmb3IgRFJNIgo+ICAJZGVwZW5k
cyBvbiBEUk0KPiBAQCAtNjEsNiArNjQsNyBAQCBjb25maWcgRFJNX0RFQlVHX1NFTEZURVNUCj4g
IAlzZWxlY3QgUFJJTUVfTlVNQkVSUwo+ICAJc2VsZWN0IERSTV9MSUJfUkFORE9NCj4gIAlzZWxl
Y3QgRFJNX0tNU19IRUxQRVIKPiArCXNlbGVjdCBEUk1fRVhQT1JUX0ZPUl9URVNUUyBpZiBtCj4g
IAlkZWZhdWx0IG4KPiAgCWhlbHAKPiAgCSAgVGhpcyBvcHRpb24gcHJvdmlkZXMga2VybmVsIG1v
ZHVsZXMgdGhhdCBjYW4gYmUgdXNlZCB0byBydW4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0v
ZHJtX3V0aWwuaCBiL2luY2x1ZGUvZHJtL2RybV91dGlsLmgKPiBpbmRleCAwN2I4ZTlmMDQ1OTku
Ljc5OTUyZDhjNGJiYSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fdXRpbC5oCj4gKysr
IGIvaW5jbHVkZS9kcm0vZHJtX3V0aWwuaAo+IEBAIC00MSw3ICs0MSw3IEBACj4gICAqIFVzZSBF
WFBPUlRfU1lNQk9MX0ZPUl9URVNUU19PTkxZKCkgZm9yIGZ1bmN0aW9ucyB0aGF0IHNoYWxsCj4g
ICAqIG9ubHkgYmUgdmlzaWJsZSBmb3IgZHJtc2VsZnRlc3RzLgo+ICAgKi8KPiAtI2lmIGRlZmlu
ZWQoQ09ORklHX0RSTV9ERUJVR19TRUxGVEVTVF9NT0RVTEUpCj4gKyNpZiBkZWZpbmVkKENPTkZJ
R19EUk1fRVhQT1JUX0ZPUl9URVNUUykKPiAgI2RlZmluZSBFWFBPUlRfU1lNQk9MX0ZPUl9URVNU
U19PTkxZKHgpIEVYUE9SVF9TWU1CT0woeCkKPiAgI2Vsc2UKPiAgI2RlZmluZSBFWFBPUlRfU1lN
Qk9MX0ZPUl9URVNUU19PTkxZKHgpCj4gLS0gCj4gMi4yNC4wCj4gCgotLSAKRGFuaWVsIFZldHRl
cgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwu
Y2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
