Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFD446BDF
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 23:30:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8539E89973;
	Fri, 14 Jun 2019 21:30:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA3389973;
 Fri, 14 Jun 2019 21:30:00 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 783322002E;
 Fri, 14 Jun 2019 23:29:56 +0200 (CEST)
Date: Fri, 14 Jun 2019 23:29:50 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 16/59] drm/hisilicon: Drop drm_gem_prime_export/import
Message-ID: <20190614212949.GA19476@ravnborg.org>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-17-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614203615.12639-17-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=QyXUC8HyAAAA:8
 a=7gkXJVJtAAAA:8 a=BTeA3XvPAAAA:8 a=SJz97ENfAAAA:8 a=mpaa-ttXAAAA:8
 a=vB8X5qE8XnFCd5uAZnEA:9 a=wPNLvfGTeEIA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=tafbbOV3vt1XuEhzTjGK:22 a=vFet0B0WnEQeilDPIY6i:22
 a=6heAxKwa5pAsJatQ0mat:22
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMTA6MzU6MzJQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBUaGV5J3JlIHRoZSBkZWZhdWx0Lgo+IAo+IEFzaWRlOiBXb3VsZCBiZSByZWFsbHkg
bmljZSB0byBzd2l0Y2ggdGhlIG90aGVycyBvdmVyIHRvCj4gZHJtX2dlbV9vYmplY3RfZnVuY3Mu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5j
b20+Cj4gQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiBDYzogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiBDYzogWGlubGlhbmcgTGl1IDx6LmxpdXhp
bmxpYW5nQGhpc2lsaWNvbi5jb20+Cj4gQ2M6ICJOb3JhbGYgVHLDuG5uZXMiIDxub3JhbGZAdHJv
bm5lcy5vcmc+Cj4gQ2M6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+Cj4gQ2M6IFRob21hcyBa
aW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgoKVHJpdmlhbCAtIHlvdSBjYW4gYWRkIG15
OgpSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgoKPiAtLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1fZHJ2LmMgfCAyIC0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2Rydi5jCj4gaW5kZXggNzNmMmI1M2YzMmNjLi42
ZTk1ZDNiMTY3Y2MgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJp
bi9raXJpbl9kcm1fZHJ2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmlu
L2tpcmluX2RybV9kcnYuYwo+IEBAIC0xMjYsOCArMTI2LDYgQEAgc3RhdGljIHN0cnVjdCBkcm1f
ZHJpdmVyIGtpcmluX2RybV9kcml2ZXIgPSB7Cj4gIAo+ICAJLnByaW1lX2hhbmRsZV90b19mZAk9
IGRybV9nZW1fcHJpbWVfaGFuZGxlX3RvX2ZkLAo+ICAJLnByaW1lX2ZkX3RvX2hhbmRsZQk9IGRy
bV9nZW1fcHJpbWVfZmRfdG9faGFuZGxlLAo+IC0JLmdlbV9wcmltZV9leHBvcnQJPSBkcm1fZ2Vt
X3ByaW1lX2V4cG9ydCwKPiAtCS5nZW1fcHJpbWVfaW1wb3J0CT0gZHJtX2dlbV9wcmltZV9pbXBv
cnQsCj4gIAkuZ2VtX3ByaW1lX2dldF9zZ190YWJsZSA9IGRybV9nZW1fY21hX3ByaW1lX2dldF9z
Z190YWJsZSwKPiAgCS5nZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlID0gZHJtX2dlbV9jbWFfcHJp
bWVfaW1wb3J0X3NnX3RhYmxlLAo+ICAJLmdlbV9wcmltZV92bWFwCQk9IGRybV9nZW1fY21hX3By
aW1lX3ZtYXAsCj4gLS0gCj4gMi4yMC4xCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
