Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFF8D94E9
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 17:05:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A68D66E999;
	Wed, 16 Oct 2019 15:04:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B0C26E999
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 15:04:58 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 7so3329931wme.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 08:04:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=Gy9Mqvz7ViVsHcvjshcUIFjm83FQXB1FgFTRQgeKnZg=;
 b=kigBXWu7bZTvZBLM3EySawXXGO0iA5KS57fnlochvJHL6Iv5T+xTEqhngti+O3Ju4y
 GIqiZNeGdbHknfrZ5mAZ7rEwY2yuOIqRD0qzG8+6MnARbh/5PnsqqFwQW6GxU3HnoEIm
 Viv9IQ/1jlpC+u05aE6PMIbONqhwP7M51aO1fDw+QkxtRW0oFPftsSTmHjG4anR947m6
 CW7pMwqsRYtZi1Defjo8j2IAAxNy4qaBQD6e2gUAFpiOeaj3aZngVMwyPzZ3g8fmVv6y
 Jl0Z49nh/oqlkllP8Rp8kFxuckXC8Yrz8MNoFG/685DhaMEWGSlpPnuQUC/SA28u2vcy
 p+LQ==
X-Gm-Message-State: APjAAAVMUYK0gufSjoG+MSVTIQbblHFuW5TSn2I17WbIDYlP3uDCzeuj
 u6Z93hSQNXC9B3i02BNLPhkYKg==
X-Google-Smtp-Source: APXvYqwENQa0ZhP9R+YaODjOskIqVrhbRbWPHKcsVMTitFlrbg4jiwWjBaF/eiyfcZK+zwBUTq+a6g==
X-Received: by 2002:a7b:c387:: with SMTP id s7mr3630959wmj.22.1571238296595;
 Wed, 16 Oct 2019 08:04:56 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id m62sm2553828wmm.35.2019.10.16.08.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 08:04:55 -0700 (PDT)
Date: Wed, 16 Oct 2019 17:04:53 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v4 08/11] drm/ttm: add drm_gem_ttm_mmap()
Message-ID: <20191016150453.GS11828@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>
References: <20191016115203.20095-1-kraxel@redhat.com>
 <20191016115203.20095-9-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191016115203.20095-9-kraxel@redhat.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=Gy9Mqvz7ViVsHcvjshcUIFjm83FQXB1FgFTRQgeKnZg=;
 b=G9sSCpQWzfSQ2lgVJZuH2GvIMH7I+v+Zsriz4Mk7x7se0mK/ibhKOqMtCpv5XjWRYN
 kf0LTGEoWRMYsmzpfbDDPxPB+1Ad+s+dopUEQWWsPHir9iUGVUOzQYDUSr7c8F+0nKBu
 fzHiqkv6+OUkT0snZt+o1rhuuIsfYcsLuLtag=
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMTYsIDIwMTkgYXQgMDE6NTI6MDBQTSArMDIwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiBBZGQgaGVscGVyIGZ1bmN0aW9uIHRvIG1tYXAgdHRtIGJvJ3MgdXNpbmcgJmRybV9n
ZW1fb2JqZWN0X2Z1bmNzLm1tYXAoKS4KPiAKPiBOb3RlIHRoYXQgd2l0aCB0aGlzIGNvZGUgcGF0
aCBhY2Nlc3MgdmVyaWZpY2F0aW9uIGlzIGRvbmUgYnkKPiBkcm1fZ2VtX21tYXAoKSAod2hpY2gg
Y2FsbHMgZHJtX3ZtYV9ub2RlX2lzX2FsbG93ZWQoKCkpLgo+IFRoZSAmdHRtX2JvX2RyaXZlci52
ZXJpZnlfYWNjZXNzKCkgY2FsbGJhY2sgaXMgaXMgbm90IHVzZWQuCj4gCj4gdjM6IHVzZSB0dG1f
Ym9fbW1hcF9vYmogaW5zdGVhZCBvZiB0dG1fYm9fbW1hcF92bWFfc2V0dXAKPiAKPiBTaWduZWQt
b2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KClJldmlld2VkLWJ5OiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgoKQWxzbyBvbiB0aGUgZW50aXJl
IHNlcmllczoKCkFja2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNo
PgoKCj4gLS0tCj4gIGluY2x1ZGUvZHJtL2RybV9nZW1fdHRtX2hlbHBlci5oICAgICB8ICAyICsr
Cj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3R0bV9oZWxwZXIuYyB8IDE3ICsrKysrKysrKysr
KysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL2RybS9kcm1fZ2VtX3R0bV9oZWxwZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9n
ZW1fdHRtX2hlbHBlci5oCj4gaW5kZXggNjI2OGY4OWM1YTQ4Li4xMThjZWY3NmY4NGYgMTAwNjQ0
Cj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2dlbV90dG1faGVscGVyLmgKPiArKysgYi9pbmNsdWRl
L2RybS9kcm1fZ2VtX3R0bV9oZWxwZXIuaAo+IEBAIC0xNSw1ICsxNSw3IEBACj4gIAo+ICB2b2lk
IGRybV9nZW1fdHRtX3ByaW50X2luZm8oc3RydWN0IGRybV9wcmludGVyICpwLCB1bnNpZ25lZCBp
bnQgaW5kZW50LAo+ICAJCQkgICAgY29uc3Qgc3RydWN0IGRybV9nZW1fb2JqZWN0ICpnZW0pOwo+
ICtpbnQgZHJtX2dlbV90dG1fbW1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKmdlbSwKPiArCQkg
ICAgIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKTsKPiAgCj4gICNlbmRpZgo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV90dG1faGVscGVyLmMgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2dlbV90dG1faGVscGVyLmMKPiBpbmRleCBhNTM0MTA0ZDhiZWUuLjc0MTJiZmM1YzA1
YSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV90dG1faGVscGVyLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV90dG1faGVscGVyLmMKPiBAQCAtNTIsNSArNTIs
MjIgQEAgdm9pZCBkcm1fZ2VtX3R0bV9wcmludF9pbmZvKHN0cnVjdCBkcm1fcHJpbnRlciAqcCwg
dW5zaWduZWQgaW50IGluZGVudCwKPiAgfQo+ICBFWFBPUlRfU1lNQk9MKGRybV9nZW1fdHRtX3By
aW50X2luZm8pOwo+ICAKPiArLyoqCj4gKyAqIGRybV9nZW1fdHRtX21tYXAoKSAtIG1tYXAgJnR0
bV9idWZmZXJfb2JqZWN0Cj4gKyAqIEBnZW06IEdFTSBvYmplY3QuCj4gKyAqIEB2bWE6IHZtIGFy
ZWEuCj4gKyAqCj4gKyAqIFRoaXMgZnVuY3Rpb24gY2FuIGJlIHVzZWQgYXMgJmRybV9nZW1fb2Jq
ZWN0X2Z1bmNzLm1tYXAKPiArICogY2FsbGJhY2suCj4gKyAqLwo+ICtpbnQgZHJtX2dlbV90dG1f
bW1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKmdlbSwKPiArCQkgICAgIHN0cnVjdCB2bV9hcmVh
X3N0cnVjdCAqdm1hKQo+ICt7Cj4gKwlzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvID0gZHJt
X2dlbV90dG1fb2ZfZ2VtKGdlbSk7Cj4gKwo+ICsJcmV0dXJuIHR0bV9ib19tbWFwX29iaih2bWEs
IGJvKTsKPiArfQo+ICtFWFBPUlRfU1lNQk9MKGRybV9nZW1fdHRtX21tYXApOwo+ICsKPiAgTU9E
VUxFX0RFU0NSSVBUSU9OKCJEUk0gZ2VtIHR0bSBoZWxwZXJzIik7Cj4gIE1PRFVMRV9MSUNFTlNF
KCJHUEwiKTsKPiAtLSAKPiAyLjE4LjEKPiAKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVu
Z2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
