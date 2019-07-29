Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBE2792AB
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 19:55:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B002989BB3;
	Mon, 29 Jul 2019 17:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B8C689BB0;
 Mon, 29 Jul 2019 17:55:09 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 6F00220037;
 Mon, 29 Jul 2019 19:55:07 +0200 (CEST)
Date: Mon, 29 Jul 2019 19:55:06 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Brian Welty <brian.welty@intel.com>
Subject: Re: [RFC PATCH 1/3] drm: introduce new struct drm_mem_region
Message-ID: <20190729175506.GC1753@ravnborg.org>
References: <20190729165457.18500-1-brian.welty@intel.com>
 <20190729165457.18500-2-brian.welty@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190729165457.18500-2-brian.welty@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=rAoZsCgsuSWAWfXA6msA:9 a=CjuIK1q_8ugA:10
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQnJpYW4uCgpTbWFsbCBuaXQgYmVsb3cgLSBkaWQgbm90IHRyeSB0byB1bmRlcnN0YW5kIHlv
dXIgcGF0Y2guCgoJU2FtCgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fbW0uaCBiL2lu
Y2x1ZGUvZHJtL2RybV9tbS5oCj4gaW5kZXggMmMzYmJiNDNjN2QxLi4zZDEyM2ViMTBkNjIgMTAw
NjQ0Cj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX21tLmgKPiArKysgYi9pbmNsdWRlL2RybS9kcm1f
bW0uaAo+IEBAIC00Myw2ICs0Myw4IEBACj4gICNpbmNsdWRlIDxsaW51eC9tbV90eXBlcy5oPgo+
ICAjaW5jbHVkZSA8bGludXgvbGlzdC5oPgo+ICAjaW5jbHVkZSA8bGludXgvc3BpbmxvY2suaD4K
PiArI2luY2x1ZGUgPGxpbnV4L2RtYS1mZW5jZS5oPgo+ICsjaW5jbHVkZSA8bGludXgvaW8tbWFw
cGluZy5oPgoKS2VlcCBpbmNsdWRlIGZpbGVzIHNvcnRlZC4KCj4gICNpZmRlZiBDT05GSUdfRFJN
X0RFQlVHX01NCj4gICNpbmNsdWRlIDxsaW51eC9zdGFja2RlcG90Lmg+Cj4gICNlbmRpZgo+IEBA
IC01NCw2ICs1NiwzMSBAQAo+ICAjZGVmaW5lIERSTV9NTV9CVUdfT04oZXhwcikgQlVJTERfQlVH
X09OX0lOVkFMSUQoZXhwcikKPiAgI2VuZGlmCj4gIAo+ICtzdHJ1Y3QgZHJtX2RldmljZTsKPiAr
c3RydWN0IGRybV9tbTsKTGlrZXdpc2UgZm9yd2FyZHMuIEJ1dCB0aGV5IGFyZSBnb29kIGhlcmUu
CgoJU2FtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
