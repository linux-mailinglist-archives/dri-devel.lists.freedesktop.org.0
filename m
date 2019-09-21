Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9B9BA286
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2019 14:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D916E21E;
	Sun, 22 Sep 2019 12:06:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D476E075
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2019 18:55:47 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id A460B2002D;
 Sat, 21 Sep 2019 20:55:42 +0200 (CEST)
Date: Sat, 21 Sep 2019 20:55:41 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v3] drm: panel-lvds: Potential Oops in probe error handling
Message-ID: <20190921185541.GA32133@ravnborg.org>
References: <20190911104928.GA15930@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190911104928.GA15930@mwanda>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=yPCof4ZbAAAA:8
 a=bz466c7j6o7e4iieULIA:9 a=CjuIK1q_8ugA:10
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuLgoKT24gV2VkLCBTZXAgMTEsIDIwMTkgYXQgMDE6NDk6MjhQTSArMDMwMCwgRGFuIENh
cnBlbnRlciB3cm90ZToKPiBUaGUgImx2ZHMtPmJhY2tsaWdodCIgcG9pbnRlciBjb3VsZCBiZSBO
VUxMIGluIHNpdHVhdGlvbnMgd2hlcmUKPiBvZl9wYXJzZV9waGFuZGxlKCkgcmV0dXJucyBOVUxM
LiAgVGhpcyBjb2RlIGlzIGNsZWFuZXIgaWYgd2UgdXNlIHRoZQo+IG1hbmFnZWQgZGV2bV9vZl9m
aW5kX2JhY2tsaWdodCgpIHNvIHRoZSBjbGVhbiB1cCBpcyBhdXRvbWF0aWMuCj4gCj4gRml4ZXM6
IDdjOWRmZjViZDY0MyAoImRybTogcGFuZWxzOiBBZGQgTFZEUyBwYW5lbCBkcml2ZXIiKQo+IFNp
Z25lZC1vZmYtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KPiAt
LS0KPiB2MzogVXNlIGRldm1fb2ZfZmluZF9iYWNrbGlnaHQoKS4gIFRoaXMgdmVyc2lvbiBpcyBx
dWl0ZSBhIGJpdCBtb3JlCj4gICAgIGFtYml0aW91cywgYW5kIEkgaGF2ZW4ndCB0ZXN0ZWQgaXQg
c28gcGxlYXNlIHJldmlldyBjYXJlZnVsbHkuCkxvb2tzIGdvb2QuCkFwcGxpZWQgYW5kIHB1c2hl
ZCB0byBkcm0tbWlzYy1uZXh0LgoKSXQgd2lsbCBoaXQgdXBzdHJlYW0gbm90IGF0IHRoaXMgYnV0
IG5leHQgbWVyZ2Ugd2luZG93LgoKCVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
