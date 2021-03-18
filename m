Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA153404AA
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 12:33:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C70786E8DB;
	Thu, 18 Mar 2021 11:33:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E91516E110;
 Thu, 18 Mar 2021 11:33:49 +0000 (UTC)
IronPort-SDR: XAaeS4o2xeBxd06CxHXrdEo+u6N0ql1X/y9DQDSlD18/aPaCe8ljK7x7LJ2WPjhA/CUv219nK6
 0KIkYnCTzdMw==
X-IronPort-AV: E=McAfee;i="6000,8403,9926"; a="177251516"
X-IronPort-AV: E=Sophos;i="5.81,258,1610438400"; d="scan'208";a="177251516"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 04:33:48 -0700
IronPort-SDR: mfYMxLBVLSUR67cCDieoxHRQ9u/gyk0B5Mz4F2lX9YBY6snA4hrMHt580+tckNrXlp1X2eCWue
 lMiZrFMTUDwQ==
X-IronPort-AV: E=Sophos;i="5.81,258,1610438400"; d="scan'208";a="406328061"
Received: from pvolkovs-mobl1.ccr.corp.intel.com (HELO [10.252.35.198])
 ([10.252.35.198])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 04:33:45 -0700
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <a0e13bbb-6ba6-ff24-4db8-0e02e605de18@linux.intel.com>
Date: Thu, 18 Mar 2021 12:33:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
Content-Language: en-US
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJtLW1pc2MtZml4ZXMtMjAyMS0wMy0xODoKZHJtLW1pc2MtZml4ZXMgZm9yIHY1LjEyLXJjNDoK
LSBNYWtlIHR0bV9ib191bnBpbigpIG5vdCB3cmFwYXJvdW5kIG9uIHRvbyBtYW55IHVucGlucy4K
LSBGaXggY29jY2ljaGVjayB3YXJuaW5nIGluIG9tYXAuClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBz
aW5jZSBjb21taXQgZGUwNjZlMTE2MzA2YmFmM2E2YTYyNjkxYWM2M2NmYzBiMWRhYmRkYjoKCiAg
ZHJtL2NvbXBhdDogQ2xlYXIgYm91bmNlIHN0cnVjdHVyZXMgKDIwMjEtMDMtMTEgMTE6MTE6MzMg
KzAxMDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAgZ2l0Oi8v
YW5vbmdpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS1taXNjIHRhZ3MvZHJtLW1pc2MtZml4ZXMt
MjAyMS0wMy0xOAoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDY5MDkxMTU0NDI3NTll
ZmVmM2Q0YmM1ZDljNTRkNzk0M2YxYWZjMTQ6CgogIGRybS9vbWFwOiBkc2k6IGZpeCB1bnNpZ25l
ZCBleHByZXNzaW9uIGNvbXBhcmVkIHdpdGggemVybyAoMjAyMS0wMy0xNyAxMzo1OToyMyArMDIw
MCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KZHJtLW1pc2MtZml4ZXMgZm9yIHY1LjEyLXJjNDoKLSBNYWtlIHR0bV9ib191
bnBpbigpIG5vdCB3cmFwYXJvdW5kIG9uIHRvbyBtYW55IHVucGlucy4KLSBGaXggY29jY2ljaGVj
ayB3YXJuaW5nIGluIG9tYXAuCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkNocmlzdGlhbiBLw7ZuaWcgKDEpOgogICAgICBk
cm0vdHRtOiBtYWtlIHR0bV9ib191bnBpbiBtb3JlIGRlZmVuc2l2ZQoKSnVubGluIFlhbmcgKDEp
OgogICAgICBkcm0vb21hcDogZHNpOiBmaXggdW5zaWduZWQgZXhwcmVzc2lvbiBjb21wYXJlZCB3
aXRoIHplcm8KCiBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvZHNpLmMgfCA3ICsrKystLS0K
IGluY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmggICAgICB8IDYgKysrKy0tCiAyIGZpbGVzIGNo
YW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
