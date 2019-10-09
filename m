Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD94D13C1
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 18:13:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EFC76E9A8;
	Wed,  9 Oct 2019 16:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25F626E9A8
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 16:13:18 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id c4so2581419edl.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2019 09:13:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=DiUbSMaz7dBGcIpo+8CRtRNIID7EZSNfgb7AB8YL5bk=;
 b=mwJ5onTPdQRfpUXA15Z7sar5XnyZVZxFIKx7A0A0x3FbpIb64wblff2KzRC/OVkjZw
 h9Izz7VyzCCc1EkC45zaiQwOPUktWGG3xrLU4kLjkXAysEt46a4lblNRK8pNGK5B10xq
 LDo5nK1aw/8azC6iwzvopuVFCBEUaQwX6qjsnTuuMgsYVqbo5k2Pj7ORH+fGCZC85rAr
 gkHUIB+6efF1ha1YiNYS7/PJ6BFOOAb1blCdl16UeRau7p9R5OuEa3ahActIGY22MVRu
 XxT4iKhMJeS6dkbv0Q4lm4szJs8ZLOLui2rdwSYOcCz7cXAYeCpPQcvwmgvbhCRImo+O
 IXhw==
X-Gm-Message-State: APjAAAVe08JG8TzzuJYEXDMVVKlWbAMhETU2bJgxAP/sn1JxYgK4aA6g
 jluCmsCU516+DEb8mR8NoH88Og==
X-Google-Smtp-Source: APXvYqyh8dG7lzd8IU8gclWF1HVviYmLIe0zSzArsSh+pHGEFGyPy/+aOxp1mdGmCbzHEAXPHEnbtw==
X-Received: by 2002:a17:907:2118:: with SMTP id
 qn24mr3571742ejb.141.1570637596741; 
 Wed, 09 Oct 2019 09:13:16 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id gs24sm303277ejb.5.2019.10.09.09.13.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 09:13:15 -0700 (PDT)
Date: Wed, 9 Oct 2019 18:13:13 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH] Documentation: Fix warning in drm-kmsc-helpers.rst
Message-ID: <20191009161313.GQ16989@phenom.ffwll.local>
References: <20191007151921.27099-1-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191007151921.27099-1-sean@poorly.run>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=DiUbSMaz7dBGcIpo+8CRtRNIID7EZSNfgb7AB8YL5bk=;
 b=kmUXTzvwGe/oawqWRqNB7cXpXLc82LQRR/FwAHHJfjddSchi9TRwrE+TK83kMlN21S
 ZFQ3jLRPSTVJxTfI/RwpgFUGNYa1tIy/Y1YaBaH2wWhJDp2f0gmy3wBIW9tjakP+Q+l1
 RQ3lcHZxa3w9GvKEpmaFQcee8+Batmm8nKElI=
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
Cc: linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMDcsIDIwMTkgYXQgMTE6MTk6MDFBTSAtMDQwMCwgU2VhbiBQYXVsIHdyb3Rl
Ogo+IEZyb206IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+IAo+IEZpeGVzIHRo
ZSBmb2xsb3dpbmcgd2FybmluZzoKPiAuLi9pbmNsdWRlL2RybS9kcm1fYXRvbWljX3N0YXRlX2hl
bHBlci5oOjE6IHdhcm5pbmc6IG5vIHN0cnVjdHVyZWQgY29tbWVudHMgZm91bmQKPiAKPiBGaXhl
czogOWVmOGE5ZGM0YjIxICgiZHJtOiBFeHRyYWN0IGRybV9hdG9taWNfc3RhdGVfaGVscGVyLlto
Y10iKQo+IENjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29t
Pgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiBDYzogTWFh
cnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KPiBDYzog
TWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPgo+IENjOiBTZWFuIFBhdWwgPHNlYW5A
cG9vcmx5LnJ1bj4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVt
Lm9yZz4KClJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNo
PgoKPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9ncHUvZHJtLWttcy1oZWxwZXJzLnJzdCB8IDMgLS0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2dwdS9kcm0ta21zLWhlbHBlcnMucnN0IGIvRG9jdW1lbnRhdGlvbi9ncHUvZHJt
LWttcy1oZWxwZXJzLnJzdAo+IGluZGV4IDM4NjgwMDhkYjhhOS4uOTY2OGE3ZmUyNDA4IDEwMDY0
NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZ3B1L2RybS1rbXMtaGVscGVycy5yc3QKPiArKysgYi9E
b2N1bWVudGF0aW9uL2dwdS9kcm0ta21zLWhlbHBlcnMucnN0Cj4gQEAgLTc3LDkgKzc3LDYgQEAg
QXRvbWljIFN0YXRlIFJlc2V0IGFuZCBJbml0aWFsaXphdGlvbgo+ICBBdG9taWMgU3RhdGUgSGVs
cGVyIFJlZmVyZW5jZQo+ICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAKPiAtLi4g
a2VybmVsLWRvYzo6IGluY2x1ZGUvZHJtL2RybV9hdG9taWNfc3RhdGVfaGVscGVyLmgKPiAtICAg
OmludGVybmFsOgo+IC0KPiAgLi4ga2VybmVsLWRvYzo6IGRyaXZlcnMvZ3B1L2RybS9kcm1fYXRv
bWljX3N0YXRlX2hlbHBlci5jCj4gICAgIDpleHBvcnQ6Cj4gIAo+IC0tIAo+IFNlYW4gUGF1bCwg
U29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCj4gCgotLSAKRGFuaWVsIFZl
dHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3
bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
