Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CB524F0E
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 14:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027098932A;
	Tue, 21 May 2019 12:41:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB668935B
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 12:41:34 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id w33so29148195edb.10
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 05:41:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=2AaibEaAFJKpQm4UOcrCSWFDuWbPFLOPkrUkyrm8tyQ=;
 b=Q9H0Tyf7pNB2tFsHFzqfUyOVUlq3yd8LjF0OCy2CfY7P/CmoY4dPsYuQmlo8eQQpjn
 JYCwjxvzB9eF6+KoC42ZOMd64qkbPzRw6ZJPk4Sc0Ku3AWcLaTQFunVJS58AaS/EAc5Z
 StpagbvF//j/kOX6Gm8SIGX6QMRt/xyHNkW23Qm/24XN/IGUAOGqBWnwzFFO3VzmrlBb
 haP6Fh2LjYqysm6TK8weSi4glpj8aVddnDRidF1/g1wHEb3BGjyyzdgHIpmAtVPRGJq/
 jQONukdeRjCA7qf9faVbbEm3DwEC/k2b31EnzPM1r7jKVZ7b1tGntbN+BitcG51kBB5D
 cLvw==
X-Gm-Message-State: APjAAAXPMpbcwdjxD1puQ4roVh6iIr8gvQ7jsVuiLU+LbEQX9fxXunEo
 r2TCD5V1FDMuEkB4RCQuGYlirA==
X-Google-Smtp-Source: APXvYqzYS5T/lYCkqkGoLSEC4XbGyRBf7zgxiXBYKBdgUgaQLxOBamfNESdbeMaPWSbFY+Q7TrmMZw==
X-Received: by 2002:a17:906:2e55:: with SMTP id
 r21mr54221533eji.88.1558442492822; 
 Tue, 21 May 2019 05:41:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id f8sm6202982edd.15.2019.05.21.05.41.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 21 May 2019 05:41:32 -0700 (PDT)
Date: Tue, 21 May 2019 14:41:30 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH] drm/fourcc: Fix the parameters name in the documentation
Message-ID: <20190521124130.GM21222@phenom.ffwll.local>
References: <20190521110906.15268-1-maxime.ripard@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190521110906.15268-1-maxime.ripard@bootlin.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=2AaibEaAFJKpQm4UOcrCSWFDuWbPFLOPkrUkyrm8tyQ=;
 b=knyu54K8cBH8cnXSuXs3VSz/7TSOWHZniyDFlCfgzXZj1PD07gPcf1zigY2pVSuepT
 J3C2eiaCXUAn/b+qZGOX2/e1fAoYQ026ZjVlQceJ9PzmluqP2c+SiHkePL0iRZyE7C5F
 h4WpUkdWHOqgv9BGtzGD+QNbqBeHJ4Z1vwfr8=
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
Cc: kbuild test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMjEsIDIwMTkgYXQgMDE6MDk6MDZQTSArMDIwMCwgTWF4aW1lIFJpcGFyZCB3
cm90ZToKPiBXZSBpbnRyb2R1Y2VkIG5ldyBmdW5jdGlvbnMgaW4gdGhlIGNvbW1pdCBiZjM5NjA3
YzE2MTQgKCJkcm0vZm91cmNjOiBQYXNzCj4gdGhlIGZvcm1hdF9pbmZvIHBvaW50ZXIgdG8gZHJt
X2Zvcm1hdF9wbGFuZV93aWR0aC9oZWlnaHQiKSBiYXNlZCBvbgo+IHByZXZpb3VzIG9uZXMgYnV0
IHdpdGggYSBzbGlnaHRseSBkaWZmZXJlbnQgcHJvdG90eXBlLiBIb3dldmVyLCB0aGUKPiBkb2N1
bWVudGF0aW9uIHdhc24ndCBjaGFuZ2VkIHRvIHJlZmxlY3QgdGhhdCBjaGFuZ2UuCj4gCj4gRml4
ZXM6IGJmMzk2MDdjMTYxNCAoImRybS9mb3VyY2M6IFBhc3MgdGhlIGZvcm1hdF9pbmZvIHBvaW50
ZXIgdG8gZHJtX2Zvcm1hdF9wbGFuZV93aWR0aC9oZWlnaHQiKQo+IFJlcG9ydGVkLWJ5OiBrYnVp
bGQgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBNYXhpbWUgUmlw
YXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPgoKUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0
ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cgo+IC0tLQo+ICBpbmNsdWRlL2RybS9kcm1fZm91
cmNjLmggfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2ZvdXJjYy5oIGIvaW5j
bHVkZS9kcm0vZHJtX2ZvdXJjYy5oCj4gaW5kZXggNDA1NDY2NjkyYmQyLi4zMDZkMWVmZWI1ZTAg
MTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2ZvdXJjYy5oCj4gKysrIGIvaW5jbHVkZS9k
cm0vZHJtX2ZvdXJjYy5oCj4gQEAgLTI2Miw3ICsyNjIsNyBAQCBkcm1fZm9ybWF0X2luZm9faXNf
eXV2X3NhbXBsaW5nXzQ0NChjb25zdCBzdHJ1Y3QgZHJtX2Zvcm1hdF9pbmZvICppbmZvKQo+ICAK
PiAgLyoqCj4gICAqIGRybV9mb3JtYXRfaW5mb19wbGFuZV93aWR0aCAtIHdpZHRoIG9mIHRoZSBw
bGFuZSBnaXZlbiB0aGUgZmlyc3QgcGxhbmUKPiAtICogQGZvcm1hdDogcGl4ZWwgZm9ybWF0IGlu
Zm8KPiArICogQGluZm86IHBpeGVsIGZvcm1hdCBpbmZvCj4gICAqIEB3aWR0aDogd2lkdGggb2Yg
dGhlIGZpcnN0IHBsYW5lCj4gICAqIEBwbGFuZTogcGxhbmUgaW5kZXgKPiAgICoKPiBAQCAtMjg0
LDcgKzI4NCw3IEBAIGludCBkcm1fZm9ybWF0X2luZm9fcGxhbmVfd2lkdGgoY29uc3Qgc3RydWN0
IGRybV9mb3JtYXRfaW5mbyAqaW5mbywgaW50IHdpZHRoLAo+ICAKPiAgLyoqCj4gICAqIGRybV9m
b3JtYXRfaW5mb19wbGFuZV9oZWlnaHQgLSBoZWlnaHQgb2YgdGhlIHBsYW5lIGdpdmVuIHRoZSBm
aXJzdCBwbGFuZQo+IC0gKiBAZm9ybWF0OiBwaXhlbCBmb3JtYXQgaW5mbwo+ICsgKiBAaW5mbzog
cGl4ZWwgZm9ybWF0IGluZm8KPiAgICogQGhlaWdodDogaGVpZ2h0IG9mIHRoZSBmaXJzdCBwbGFu
ZQo+ICAgKiBAcGxhbmU6IHBsYW5lIGluZGV4Cj4gICAqCj4gLS0gCj4gMi4yMS4wCj4gCj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwg
bWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgotLSAKRGFu
aWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Js
b2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
