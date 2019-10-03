Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED66CAF42
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 21:30:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8ABB6E266;
	Thu,  3 Oct 2019 19:30:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 656FE6E266;
 Thu,  3 Oct 2019 19:30:22 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Oct 2019 12:30:21 -0700
X-IronPort-AV: E=Sophos;i="5.67,253,1566889200"; d="scan'208";a="182486354"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com) ([10.7.196.65])
 by orsmga007-auth.jf.intel.com with
 ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Oct 2019 12:30:21 -0700
Date: Thu, 3 Oct 2019 12:30:51 -0700
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <20191003193051.GA26421@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.11.3 (2019-02-01)
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@intel.com>,
 Sean Paul <sean@poorly.run>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSBhbmQgRGFuaWVsLAoKVGhpcyB2MiBjb250YWlucyBhIGNyaXRpY2FsIERQLU1TVCBm
aXggdGhhdCBpdCB3b3VsZCBiZSByZWFsbHkgZ29vZCB0byBiZQpwcm9wYWdhdGVkIGFzIHNvb24g
YXMgcG9zc2libGUuCgpCZXNpZGVzIGFsbCB0aGUgZHJtLWludGVsLW5leHQtZml4ZXMgdGhhdCBJ
IG1lbnRpb25lZCBvbiBwcmV2aW91cyBlbWFpbC4KCkhlcmUgZ29lcyBkcm0taW50ZWwtZml4ZXMt
MjAxOS0xMC0wMy0xOgotIEZpeCBEUC1NU1QgY3J0Y19tYXNrCi0gRml4IGRzYyBkcHAgY2FsY3Vs
YXRpb25zCi0gRml4IGc0eCBzcHJpdGUgc2NhbGluZyBzdHJpZGUgY2hlY2sgd2l0aCBHVFQgcmVt
YXBwaW5nCgpTaG9ydCBzdW1tYXJ5IG9mIGZpeGVzIHB1bGwgKGxlc3MgdGhhbiB3aGF0IGdpdCBz
aG9ydGxvZyBwcm92aWRlcyk6Ci0gZXhwbGFpbiBhbnl0aGluZyBub24tZml4ZXMgKGUuZy4gY2xl
YW51cHMpIGFuZCB3aHkgaXQncyBhcHByb3ByaWF0ZQotIGhpZ2hsaWdodCByZWdyZXNzaW9ucwot
IHN1bW1hcml6ZSBwdWxsIHJlcXVlc3RzIGNvbnRhaW5lZApUaGlzIHNob3VsZG4ndCBiZSBtb3Jl
IHRoYW4gYSBmZXcgbGluZXMgKG9yIGl0IGluZGljYXRlcyB5b3VyIGZpeGVzIHB1bGwgaXMgYQpi
aXQgdG9vIGJpZykuCgpUaGFua3MsClJvZHJpZ28uCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2lu
Y2UgY29tbWl0IDU0ZWNiOGY3MDI4YzVlYjNkNzQwYmI4MmIwZjFkOTBmMmRmNjNjNWM6CgogIExp
bnV4IDUuNC1yYzEgKDIwMTktMDktMzAgMTA6MzU6NDAgLTA3MDApCgphcmUgYXZhaWxhYmxlIGlu
IHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAgZ2l0Oi8vYW5vbmdpdC5mcmVlZGVza3RvcC5vcmcv
ZHJtL2RybS1pbnRlbCB0YWdzL2RybS1pbnRlbC1maXhlcy0yMDE5LTEwLTAzLTEKCmZvciB5b3Ug
dG8gZmV0Y2ggY2hhbmdlcyB1cCB0byA0ODVmNjgyYmU5ZmM4ZDQxMzc2OTM2YTNiMDE0MjNlZGQw
N2I5YTc1OgoKICBSZXZlcnQgImRybS9pOTE1OiBGaXggRFAtTVNUIGNydGNfbWFzayIgKDIwMTkt
MTAtMDMgMTI6MjM6MDcgLTA3MDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCi0gRml4IERQLU1TVCBjcnRjX21hc2sKLSBG
aXggZHNjIGRwcCBjYWxjdWxhdGlvbnMKLSBGaXggZzR4IHNwcml0ZSBzY2FsaW5nIHN0cmlkZSBj
aGVjayB3aXRoIEdUVCByZW1hcHBpbmcKClNob3J0IHN1bW1hcnkgb2YgZml4ZXMgcHVsbCAobGVz
cyB0aGFuIHdoYXQgZ2l0IHNob3J0bG9nIHByb3ZpZGVzKToKLSBleHBsYWluIGFueXRoaW5nIG5v
bi1maXhlcyAoZS5nLiBjbGVhbnVwcykgYW5kIHdoeSBpdCdzIGFwcHJvcHJpYXRlCi0gaGlnaGxp
Z2h0IHJlZ3Jlc3Npb25zCi0gc3VtbWFyaXplIHB1bGwgcmVxdWVzdHMgY29udGFpbmVkClRoaXMg
c2hvdWxkbid0IGJlIG1vcmUgdGhhbiBhIGZldyBsaW5lcyAob3IgaXQgaW5kaWNhdGVzIHlvdXIg
Zml4ZXMgcHVsbCBpcyBhCmJpdCB0b28gYmlnKS4KCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KTWFhcnRlbiBMYW5raG9yc3Qg
KDEpOgogICAgICBkcm0vaTkxNS9kcDogRml4IGRzYyBicHAgY2FsY3VsYXRpb25zLCB2NS4KClZp
bGxlIFN5cmrDpGzDpCAoMik6CiAgICAgIGRybS9pOTE1OiBGaXggZzR4IHNwcml0ZSBzY2FsaW5n
IHN0cmlkZSBjaGVjayB3aXRoIEdUVCByZW1hcHBpbmcKICAgICAgUmV2ZXJ0ICJkcm0vaTkxNTog
Rml4IERQLU1TVCBjcnRjX21hc2siCgogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9kaXNwbGF5LmMgfCAgMTIgKy0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
ZGlzcGxheS5oIHwgICAyICstCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rw
LmMgICAgICB8IDE4NCArKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuaCAgICAgIHwgICA2ICstCiBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2RwX21zdC5jICB8ICAgNCArLQogZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9zcHJpdGUuYyAgfCAgIDUgKy0KIDYgZmlsZXMgY2hhbmdlZCwgMTEx
IGluc2VydGlvbnMoKyksIDEwMiBkZWxldGlvbnMoLSkKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
