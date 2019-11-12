Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A451F8C22
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 10:45:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74C4F6EAD9;
	Tue, 12 Nov 2019 09:45:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B68B16EAD9
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 09:44:59 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id z26so2313377wmi.4
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 01:44:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=tv3E9hazFmY5BlqvqrZIIO79OJReT4uhzyYRNlf2kPA=;
 b=kecFWyjOzju3EJeCk2yMSvEtuCAc6T7MK8Ee8S85RpNCpSPbfKkJBhW39ajBw/+i9+
 Q+5UIChSbyqtKUGbd4ID40diDXNyKV+VlFlDWI0EAwDYhf80wCib2cStglM8sO2JSwvY
 sNT8gpSLVhywD82ttK2YKfvLLRaQTtyYOTWQ2mEG9Q4H319R63OS0hCuRlvp0XWScyGP
 4FGsbVnvyVQUWzi44mwOcv1NfH7C5wlHSv7mBH9mB9C4v3G/7hOtYTNSfaOwYwowvgt8
 VknmayyUcb5sA+nNoIYaFFWxfTSRpobBl2drf1W1WOufBtQFtirV0fRtIKWgDsUAAw1i
 FSqw==
X-Gm-Message-State: APjAAAURPizVGPFBZsPf+MdbmsfV8E6hcGQBxfEaKLv1OHyhx35fOlsh
 mONa1pe+xsW7Y0bVYLMlMcc/eA==
X-Google-Smtp-Source: APXvYqz3RnaJlqUjRMlojLl2gq/rIRZyqI4x450oGrnKCjW7CYWSIkXcHUdfN9OhfIK+TtN0VBqCRA==
X-Received: by 2002:a1c:e154:: with SMTP id y81mr3084961wmg.126.1573551898358; 
 Tue, 12 Nov 2019 01:44:58 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id b66sm3748945wmh.39.2019.11.12.01.44.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 01:44:57 -0800 (PST)
Date: Tue, 12 Nov 2019 10:44:55 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 10/12] drm/modes: parse_cmdline: Remove some unnecessary
 code
Message-ID: <20191112094455.GG23790@phenom.ffwll.local>
References: <20191110154101.26486-1-hdegoede@redhat.com>
 <20191110154101.26486-11-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191110154101.26486-11-hdegoede@redhat.com>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tv3E9hazFmY5BlqvqrZIIO79OJReT4uhzyYRNlf2kPA=;
 b=IAK7sdtxpC5hJ1FxE5J9oFsV8RlZVh3b3kyhiEquPXBzf9caViYmUhmQeUEeQGjpw6
 KJaQe5yf7QD8+0jfPUBBLY6nAuhtkZ6a+q+Sqjtit43Kn04SyGDe03OvO3RSIqJwksbg
 MRZn+5P/lBicn6Jz+42VtKCRpSxFdZhAB8j5c=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mathieu =?iso-8859-1?Q?Alexandre-T=E9treault?= <alexandretm@amotus.ca>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBOb3YgMTAsIDIwMTkgYXQgMDQ6NDA6NTlQTSArMDEwMCwgSGFucyBkZSBHb2VkZSB3
cm90ZToKPiBSZW1vdmUgMiBiaXRzIG9mIGRlYWQtY29kZToKPiAKPiAxKSBkcm1fbW9kZV9wYXJz
ZV9jb21tYW5kX2xpbmVfZm9yX2Nvbm5lY3RvcigpIGFsd2F5cyBnZXRzIGNhbGxlZCB3aXRoIGEK
PiB6ZXJvLWVkIGRybV9jbWRsaW5lX21vZGUgc3RydWN0IGFuZCBhc3N1bWVzIHNvIGluIG1vc3Qg
cGxhY2VzLCBzbyB0aGVyZSBpcwo+IG5vIHJlYXNvbiB0byBzZXQgbW9kZS0+c3BlY2lmaWVkIHRv
IGZhbHNlIGlmIG5vIG1vZGVfb3B0aW9uIGlzIHByZXNlbnQuCj4gCgpIbSBJJ2Qga2VlcCB0aGF0
IHBhcnQsIGp1c3QgZm9yIHNhZmV0eS4gSXQncyBub3QgcmVhbGx5IGEgcGVyZm9ybWFuY2UKY3Jp
dGljYWwgcGF0aCByZWFsbHkgLi4uCi1EYW5pZWwKCj4gMikgZmJfZ2V0X29wdGlvbnMoKSB3aWxs
IHJldHVybiBmYl9tb2RlX29wdGlvbiBpZiBubyB2aWRlbz08Y29ubmVjdG9yLW5hbWU+Cj4gYXJn
dW1lbnQgaXMgcHJlc2VudCBvbiB0aGUga2VybmVsIGNvbW1hbmRsaW5lLCBzbyB0aGVyZSBpcyBu
byBuZWVkIHRvIGFsc28KPiBkbyB0aGlzIGluIGRybV9tb2RlX3BhcnNlX2NvbW1hbmRfbGluZV9m
b3JfY29ubmVjdG9yKCkgYXMgb3VyIG9ubHkgY2FsbGVyCj4gdXNlcyBmYl9nZXRfb3B0aW9ucygp
IHRvIGdldCB0aGUgbW9kZV9vcHRpb24gYXJndW1lbnQuCj4gCj4gU2lnbmVkLW9mZi1ieTogSGFu
cyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJt
L2RybV9tb2Rlcy5jIHwgNyAtLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX21vZGVzLmMKPiBpbmRleCAxMTlmZWQ3YWI4MTUuLjBiZjNjYjhjMDhmZiAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX21vZGVzLmMKPiBAQCAtMTc0NywxNSArMTc0Nyw4IEBAIGJvb2wgZHJtX21v
ZGVfcGFyc2VfY29tbWFuZF9saW5lX2Zvcl9jb25uZWN0b3IoY29uc3QgY2hhciAqbW9kZV9vcHRp
b24sCj4gIAo+ICAJbW9kZS0+cGFuZWxfb3JpZW50YXRpb24gPSBEUk1fTU9ERV9QQU5FTF9PUklF
TlRBVElPTl9VTktOT1dOOwo+ICAKPiAtI2lmZGVmIENPTkZJR19GQgo+ICAJaWYgKCFtb2RlX29w
dGlvbikKPiAtCQltb2RlX29wdGlvbiA9IGZiX21vZGVfb3B0aW9uOwo+IC0jZW5kaWYKPiAtCj4g
LQlpZiAoIW1vZGVfb3B0aW9uKSB7Cj4gLQkJbW9kZS0+c3BlY2lmaWVkID0gZmFsc2U7Cj4gIAkJ
cmV0dXJuIGZhbHNlOwo+IC0JfQo+ICAKPiAgCW5hbWUgPSBtb2RlX29wdGlvbjsKPiAgCj4gLS0g
Cj4gMi4yMy4wCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29y
cG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
