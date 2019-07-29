Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C27AE78E1C
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 16:36:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A139D89E9B;
	Mon, 29 Jul 2019 14:36:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5779789DB4;
 Mon, 29 Jul 2019 14:36:03 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id CCA4E20037;
 Mon, 29 Jul 2019 16:35:56 +0200 (CEST)
Date: Mon, 29 Jul 2019 16:35:55 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v1 02/11] drm: drop uapi dependency from drm_print.h
Message-ID: <20190729143555.GA16927@ravnborg.org>
References: <20190718161507.2047-1-sam@ravnborg.org>
 <20190718161507.2047-3-sam@ravnborg.org>
 <156346840026.24728.936589728458336617@skylake-alporthouse-com>
 <460bf1e1-a38b-5f79-26e5-93764067f4e1@amd.com>
 <87tvb5nh5c.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87tvb5nh5c.fsf@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=z97LkYvmAAAA:8
 a=K2UDfjvxisjQRRjod3UA:9 a=CjuIK1q_8ugA:10 a=vIYCe-biKPAlS5OZFR2a:22
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
Cc: Boris Brezillon <bbrezillon@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Thierry Reding <treding@nvidia.com>, Sean Paul <sean@poorly.run>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiA+Pgo+ID4+IEV2ZW4gdGhlbiBpdCBzbyB1c2VsZXNzICh3aGljaCBkcm0gZHJpdmVyIGlzIHRo
aXMgbWVzc2FnZSBmb3I/Pz8pIHRoYXQgSQo+ID4+IHdhbnQgdG8gcmVtb3ZlIHRoZW0gYWxsIDoo
Cj4gPgo+ID4gWWVhaCwgYWdyZWUuIEkgbWVhbiBpdCBpcyBuaWNlIGlmIHRoZSBjb3JlIGRybSBm
dW5jdGlvbnMgdXNlIGEgcHJlZml4IAo+ID4gZm9yIGRlYnVnIG91dHB1dC4KPiA+Cj4gPiBCdXQg
SSBhY3R1YWxseSBkb24ndCBzZWUgdGhlIHBvaW50IGZvciBpbmRpdmlkdWFsIGRyaXZlcnMuCj4g
Cj4gV2Ugc2hvdWxkIGFsbCBtaWdyYXRlIHRvIHRoZSB2ZXJzaW9ucyB3aXRoIGRldmljZS4uLgoK
SnVzdCB0byBkbyBhbiB4a2RjLmNvbS85MjcgSSBoYXZlIGNvbnNpZGVyZWQ6Cgpkcm1fZXJyKGNv
bnN0IHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sIC4uLikKZHJtX2luZm8oY29uc3Qgc3RydWN0IGRy
bV9kZXZpY2UgKmRybSwgLi4uKQoKZHJtX2ttc19lcnIoY29uc3Qgc3RydWN0IGRybV9kZXZpY2Ug
KmRybSwgLi4uKQpkcm1fa21zX2luZm8oY29uc3Qgc3RydWN0IGRybV9kZXZpY2UgKmRybSwgLi4u
KSkKCkFuZCBzbyBvbiBmb3IgdmJsLCBwcmltc2UuIGxlYXNlLCBzdGF0ZSBldGMuCgpUaGVuIHdl
IGNvdWxkIGZpc2ggb3V0IHJlbGV2YW50IGluZm8gZnJvbSB0aGUgZHJtIGRldmljZSBhbmQgcHJl
c2VudAp0aGlzIG5pY2VseS4KCkZvciB0aGUgY2FzZXMgd2hlcmUgbm8gZHJtX2RldmljZSBpcyBh
dmFpbGFibGUgdGhlIGZhbGxiYWNrIGlzOgpkcm1fZGV2X2Vycihjb25zdCBzdHJ1Y3QgZHJtX2Rl
dmljZSAqZHJtLCAuLi4pCmRybV9kZXZfaW5mbyhjb25zdCBzdHJ1Y3QgZHJtX2RldmljZSAqZHJt
LCAuLi4pKQoKV2UgY291bGQgbW9kaWZ5IHRoZSBleGlzdGluZyBVUFBFUkNBU0UgbWFjcm9zIHRv
IGJlIHBsYWNlaG9sZGVycyBmb3IKdGhlIG1vcmUgcmVhZGVyIGZyaWVuZGx5IGxvd2VyIGNhc2Vz
IHZhcmlhbnRzIGFuZCBiYXNlIGl0IGFsbCBvbiB0aGUKZXN0YWJsaXNoZWQgaW5mcmFzdHJ1Y3R1
cmUuCgpCdXQgdGhpcyBpcyBqdXN0IGlkbGUgdGhpbmtpbmcsIGFzIG9ubHkgYSBzZXJpb3VzIHBh
dGNoIHdvdWxkIHN0aXIgdGhlCnJlbGV2YW50IGRpc2N1c3Npb25zLgoKRm9yIG5vdyB0aGlzIGlz
IGZhciBmcm9tIHRoZSB0b3Agb2YgbXkgVE9ETyBsaXN0LgoKCglTYW0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
