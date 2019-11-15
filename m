Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B31FD95D
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 10:33:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 740126E2CD;
	Fri, 15 Nov 2019 09:33:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58EBC6E2CD;
 Fri, 15 Nov 2019 09:33:29 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C3CCB291BDE;
 Fri, 15 Nov 2019 09:33:27 +0000 (GMT)
Date: Fri, 15 Nov 2019 10:33:24 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 2/8] drm/atmel: ditch fb_create wrapper
Message-ID: <20191115103324.1fbeca63@collabora.com>
In-Reply-To: <20191115092120.4445-3-daniel.vetter@ffwll.ch>
References: <20191115092120.4445-1-daniel.vetter@ffwll.ch>
 <20191115092120.4445-3-daniel.vetter@ffwll.ch>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAxNSBOb3YgMjAxOSAxMDoyMToxNCArMDEwMApEYW5pZWwgVmV0dGVyIDxkYW5pZWwu
dmV0dGVyQGZmd2xsLmNoPiB3cm90ZToKCj4gU3BvdHRlZCB3aGlsZSBsb29raW5nIHRocm91Z2gg
dGhlbSBhbGwuCj4gCj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRl
ckBpbnRlbC5jb20+Cj4gQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiBDYzog
Qm9yaXMgQnJlemlsbG9uIDxiYnJlemlsbG9uQGtlcm5lbC5vcmc+CgpBY2tlZC1ieTogQm9yaXMg
QnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4KCj4gQ2M6IE5pY29sYXMg
RmVycmUgPG5pY29sYXMuZmVycmVAbWljcm9jaGlwLmNvbT4KPiBDYzogQWxleGFuZHJlIEJlbGxv
bmkgPGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29tPgo+IENjOiBMdWRvdmljIERlc3JvY2hl
cyA8bHVkb3ZpYy5kZXNyb2NoZXNAbWljcm9jaGlwLmNvbT4KPiBDYzogbGludXgtYXJtLWtlcm5l
bEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hdG1lbC1obGNk
Yy9hdG1lbF9obGNkY19kYy5jIHwgOCArLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDcgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hdG1lbC1obGNkYy9hdG1lbF9obGNkY19kYy5jIGIvZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhs
Y2RjL2F0bWVsX2hsY2RjX2RjLmMKPiBpbmRleCA5MjY0MDI5OGFkNDEuLjhkYzkxN2ExMjcwYiAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXRtZWwtaGxjZGMvYXRtZWxfaGxjZGNfZGMu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hdG1lbC1obGNkYy9hdG1lbF9obGNkY19kYy5jCj4g
QEAgLTU1NywxMiArNTU3LDYgQEAgc3RhdGljIGlycXJldHVybl90IGF0bWVsX2hsY2RjX2RjX2ly
cV9oYW5kbGVyKGludCBpcnEsIHZvaWQgKmRhdGEpCj4gIAlyZXR1cm4gSVJRX0hBTkRMRUQ7Cj4g
IH0KPiAgCj4gLXN0YXRpYyBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICphdG1lbF9obGNkY19mYl9j
cmVhdGUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPiAtCQlzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVf
cHJpdiwgY29uc3Qgc3RydWN0IGRybV9tb2RlX2ZiX2NtZDIgKm1vZGVfY21kKQo+IC17Cj4gLQly
ZXR1cm4gZHJtX2dlbV9mYl9jcmVhdGUoZGV2LCBmaWxlX3ByaXYsIG1vZGVfY21kKTsKPiAtfQo+
IC0KPiAgc3RydWN0IGF0bWVsX2hsY2RjX2RjX2NvbW1pdCB7Cj4gIAlzdHJ1Y3Qgd29ya19zdHJ1
Y3Qgd29yazsKPiAgCXN0cnVjdCBkcm1fZGV2aWNlICpkZXY7Cj4gQEAgLTY1Nyw3ICs2NTEsNyBA
QCBzdGF0aWMgaW50IGF0bWVsX2hsY2RjX2RjX2F0b21pY19jb21taXQoc3RydWN0IGRybV9kZXZp
Y2UgKmRldiwKPiAgfQo+ICAKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fbW9kZV9jb25maWdf
ZnVuY3MgbW9kZV9jb25maWdfZnVuY3MgPSB7Cj4gLQkuZmJfY3JlYXRlID0gYXRtZWxfaGxjZGNf
ZmJfY3JlYXRlLAo+ICsJLmZiX2NyZWF0ZSA9IGRybV9nZW1fZmJfY3JlYXRlLAo+ICAJLmF0b21p
Y19jaGVjayA9IGRybV9hdG9taWNfaGVscGVyX2NoZWNrLAo+ICAJLmF0b21pY19jb21taXQgPSBh
dG1lbF9obGNkY19kY19hdG9taWNfY29tbWl0LAo+ICB9OwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
