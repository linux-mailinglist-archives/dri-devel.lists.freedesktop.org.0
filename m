Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 197DA698FB
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 18:26:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB9C89A4B;
	Mon, 15 Jul 2019 16:26:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6569189A0F
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 16:26:19 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id B116B20021;
 Mon, 15 Jul 2019 18:26:16 +0200 (CEST)
Date: Mon, 15 Jul 2019 18:26:15 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH v1 02/33] drm/xen: drop use of drmP.h
Message-ID: <20190715162615.GA27038@ravnborg.org>
References: <20190630061922.7254-1-sam@ravnborg.org>
 <20190630061922.7254-3-sam@ravnborg.org>
 <7c758e43-048b-d094-bced-9d171987538f@gmail.com>
 <20190701060524.GA28256@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190701060524.GA28256@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=DBfv99YmAAAA:8
 a=5Y2y6C4kfaShNWru4agA:9 a=CjuIK1q_8ugA:10 a=c73wXdw0ADZYY2z2LwuN:22
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
Cc: xen-devel@lists.xenproject.org, dri-devel@lists.freedesktop.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMDEsIDIwMTkgYXQgMDg6MDU6MjRBTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IEhpIE9sZWtzYW5kcgo+IAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGVuL3hl
bl9kcm1fZnJvbnQuaAo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJv
bnQuaAo+ID4gPiBAQCAtMTEsMTMgKzExLDE5IEBACj4gPiA+ICAgI2lmbmRlZiBfX1hFTl9EUk1f
RlJPTlRfSF8KPiA+ID4gICAjZGVmaW5lIF9fWEVOX0RSTV9GUk9OVF9IXwo+ID4gPiAtI2luY2x1
ZGUgPGRybS9kcm1QLmg+Cj4gPiA+IC0jaW5jbHVkZSA8ZHJtL2RybV9zaW1wbGVfa21zX2hlbHBl
ci5oPgo+ID4gPiAtCj4gPiA+ICAgI2luY2x1ZGUgPGxpbnV4L3NjYXR0ZXJsaXN0Lmg+Cj4gPiA+
ICsjaW5jbHVkZSA8ZHJtL2RybV9jb25uZWN0b3IuaD4KPiA+ID4gKyNpbmNsdWRlIDxkcm0vZHJt
X3NpbXBsZV9rbXNfaGVscGVyLmg+Cj4gPiA+ICsjaW5jbHVkZSA8ZHJtL2RybV9zaW1wbGVfa21z
X2hlbHBlci5oPgo+ID4gbm8gbmVlZCB0byBpbmNsdWRlIHR3aWNlCj4gPiB3aXRoIHRoYXQgZml4
ZWQ6Cj4gPiBBY2tlZC1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRy
dXNoY2hlbmtvQGVwYW0uY29tPgoKQXBwbGllZCwgdGhhbmtzLgoKCVNhbQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
