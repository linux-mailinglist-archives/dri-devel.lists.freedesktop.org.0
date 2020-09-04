Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E149425D7EA
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 13:54:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA6256EB49;
	Fri,  4 Sep 2020 11:53:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3777B6EB46;
 Fri,  4 Sep 2020 11:53:58 +0000 (UTC)
IronPort-SDR: HAvs6YeKQu8lvctGWEnQ0qC8CmBeyyRPPCw/3/KVqNaj2SYse6S4OY2fuTRy8I34TBMTrcTpgy
 T7fq9Km8ebCg==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="145430537"
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="145430537"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 04:53:57 -0700
IronPort-SDR: cSJP0Wz2YyDI6wfQ64d+Xj/sQpO3csNjuKnHSvOsgiJqNFtWWKsH16OmvFvivaNsd9zJr1OFad
 /dZxRodfpPYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="339669593"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 04 Sep 2020 04:53:55 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 04 Sep 2020 14:53:54 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 00/18] drm/i915: Pimp DP DFP handling
Date: Fri,  4 Sep 2020 14:53:36 +0300
Message-Id: <20200904115354.25336-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkF0
dGVtcHQgdG8gZGVhbCB3aXRoIERQIGRvd25zdHJlYW0gZmFjaW5nIHBvcnRzIChERlApIG1vcmUK
dGhvcm91Z2hseS4gVGhpcyBpbnZvbHZlcyByZWFkaW5nIG1vcmUgb2YgdGhlIHBvcnQgY2Fwcwph
bmQgZGVhbGluZyB3aXRoIHZhcmlvdXMgY2xvY2svYnBjIGxpbWl0YXRpb25zLgoKQW5kIHdlIHRy
eSB0byBlbmFibGUgWUNiQ3IgNDQ0LT40MjAgY29udmVyc2lvbiBmb3IgSERNSSBERlBzCndoaWNo
IGNvdWxkIGFsbG93IHNvbWUgNGsgZGlzcGxheXMgdG8gYWN0dWFsbHkgdXNlIDRrIG9uCnByZS1p
Y2wgaGFyZHdhcmUgKHdoaWNoIGRvZXNuJ3QgaGF2ZSBuYXRpdmUgNDIwIG91dHB1dCksCmFzc3Vt
aW5nIHdlIGRvbid0IHJ1biBpbnRvIHNvbWUgb3RoZXIgaGFyZHdhcmUgbGltaXRzLgoKSSBkcm9w
cGVkIG15IGVhcmxpZXIgcGF0Y2hlcyB0byBhbHNvIGhvb2sgaW4gdGhlIERQIGR1YWwgbW9kZQph
ZGFwdGVyIHByb2Jpbmcgc2luY2Ugc2FkbHkgSSd2ZSBub3QgYWN0dWFsbHkgc2VlbiBhIERQLT5E
UCsrCmRvbmdsZSB0aGF0IHBhc3NlcyB0aHJvdWdoIHRoZSBpMmMgdHJhZmZpYyBmb3IgdGhvc2Uu
CgpPbmx5IHBpbXBlZCB0aGUgU1NUIHNpZGUgb2YgdGhpbmdzLiBOb3Qgc3VyZSB3aGF0IHdvdWxk
CmJlIHJlcXVpcmVkIHRvIGdldCBpdCBhbGwgd29ya2luZyBmb3IgTVNULgoKVmlsbGUgU3lyasOk
bMOkICgxOCk6CiAgZHJtL2RwOiBEdW1wIGRvd25zdHJlYW0gZmFjaW5nIHBvcnQgY2FwcwogIGRy
bS9pOTE1L2xzcGNvbjogRG8gbm90IHNlbmQgaW5mb2ZyYW1lcyB0byBub24tSERNSSBzaW5rcwog
IGRybS9kcDogRGVmaW5lIHByb3RvY29sIGNvbnZlcnRlciBEUENEIHJlZ2lzdGVycwogIGRybS9k
cDogRGVmaW5lIG1vcmUgZG93bnN0cmVhbSBmYWNpbmcgcG9ydCBjYXBzCiAgZHJtL2k5MTU6IFJl
d29ya2QgREZQIG1heCBicGMgaGFuZGxpbmcKICBkcm0vZHA6IEFkZCBoZWxwZXJzIHRvIGlkZW50
aWZ5IGRvd25zdHJlYW0gZmFjaW5nIHBvcnQgdHlwZXMKICBkcm0vZHA6IFBpbXAgZHJtX2RwX2Rv
d25zdHJlYW1fbWF4X2JwYygpCiAgZHJtL2RwOiBSZWRvIGRybV9kcF9kb3duc3RyZWFtX21heF9j
bG9jaygpIGFzCiAgICBkcm1fZHBfZG93bnN0cmVhbV9tYXhfZG90Y2xvY2soKQogIGRybS9pOTE1
OiBSZXdvcmtkIERQIERGUCBjbG9jayBoYW5kbGluZwogIGRybS9kcDogQWRkIGRybV9kcF9kb3du
c3RyZWFtX3ttaW4sbWF4fV90bWRzX2Nsb2NrKCkKICBkcm0vaTkxNTogRGVhbCB3aXRoIFRNRFMg
REZQIGNsb2NrIGxpbWl0cwogIGRybS9pOTE1OiBDb25maWd1cmUgRFAgMS4zKyBwcm90b2NvbCBj
b252ZXJ0ZWQgSERNSSBtb2RlCiAgZHJtL2RwOiBBZGQgZHJtX2RwX2Rvd25zdHJlYW1fbW9kZSgp
CiAgZHJtL2k5MTU6IEhhbmRsZSBkb3duc3RyZWFtIGZhY2luZyBwb3J0cyB3L28gRURJRAogIGRy
bS9pOTE1OiBFeHRyYWN0IGludGVsX2hkbWlfaGFzX2F1ZGlvKCkKICBkcm0vaTkxNTogRFAtPkhE
TUkgVE1EUyBjbG9jayBsaW1pdHMgdnMuIGRlZXAgY29sb3IKICBkcm0vZHA6IEFkZCBoZWxwZXJz
IGZvciBERlAgWUNiQ3IgNDoyOjAgaGFuZGxpbmcKICBkcm0vaTkxNTogRG8gWUNiQ3IgNDQ0LT40
MjAgY29udmVyc2lvbiB2aWEgRFAgcHJvdG9jb2wgY29udmVydGVycwoKIGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fZHBfaGVscGVyLmMgICAgICAgICAgICAgICB8IDM4MiArKysrKysrKysrKysrKystLS0K
IGRyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jICAgICAgICAgICAgICAgICAgICB8ICAxOSArCiBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RkaS5jICAgICAgfCAgMTEgKy0KIC4u
Li9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfZGVidWdmcy5jICB8ICAgMyArLQogLi4u
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV90eXBlcy5oICAgIHwgICA5ICsKIGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYyAgICAgICB8IDMwNCArKysrKysrKysr
Ky0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5oICAgICAgIHwgICAx
ICsKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRtaS5jICAgICB8ICA4MiAr
Ky0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hkbWkuaCAgICAgfCAgIDIg
KwogaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oICAgICAgICAgICAgICAgICAgIHwgIDYzICsr
LQogaW5jbHVkZS9kcm0vZHJtX2VkaWQuaCAgICAgICAgICAgICAgICAgICAgICAgIHwgICA0ICsK
IDExIGZpbGVzIGNoYW5nZWQsIDczOCBpbnNlcnRpb25zKCspLCAxNDIgZGVsZXRpb25zKC0pCgot
LSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
