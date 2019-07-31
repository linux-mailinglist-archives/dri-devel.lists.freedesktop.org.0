Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B01857CA40
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 19:26:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F646E17F;
	Wed, 31 Jul 2019 17:26:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3EF16E15E;
 Wed, 31 Jul 2019 17:26:10 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 9F91780348;
 Wed, 31 Jul 2019 19:26:07 +0200 (CEST)
Date: Wed, 31 Jul 2019 19:26:06 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 1/8] drm/amdgpu: drop drmP.h in amdgpu_amdkfd_arcturus.c
Message-ID: <20190731172606.GA981@ravnborg.org>
References: <20190731155246.20603-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190731155246.20603-1-alexander.deucher@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=zd2uoN0lAAAA:8
 a=7gkXJVJtAAAA:8 a=o_AB6skRCk40mteTbBcA:9 a=CjuIK1q_8ugA:10
 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQWxleC4KCk9uIFdlZCwgSnVsIDMxLCAyMDE5IGF0IDEwOjUyOjM5QU0gLTA1MDAsIEFsZXgg
RGV1Y2hlciB3cm90ZToKPiBVbnVzZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVy
IDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfYW1ka2ZkX2FyY3R1cnVzLmMgfCAxIC0KPiAgMSBmaWxlIGNoYW5nZWQs
IDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2FtZGtmZF9hcmN0dXJ1cy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2FtZGtmZF9hcmN0dXJ1cy5jCj4gaW5kZXggNGQ5MTAxODM0YmE3Li5jNzlhYWViZWVh
ZjAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtm
ZF9hcmN0dXJ1cy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Ft
ZGtmZF9hcmN0dXJ1cy5jCj4gQEAgLTI4LDcgKzI4LDYgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L3Vh
Y2Nlc3MuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L21tdV9jb250ZXh0Lmg+Cj4gICNpbmNsdWRlIDxs
aW51eC9maXJtd2FyZS5oPgo+IC0jaW5jbHVkZSA8ZHJtL2RybVAuaD4KPiAgI2luY2x1ZGUgImFt
ZGdwdS5oIgo+ICAjaW5jbHVkZSAiYW1kZ3B1X2FtZGtmZC5oIgo+ICAjaW5jbHVkZSAic2RtYTAv
c2RtYTBfNF8yXzJfb2Zmc2V0LmgiCgpUaGFua3MhCgpBbGwgcGF0Y2hlcyBhcmU6CkFja2VkLWJ5
OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CgoKQWN0dWFsIHN0YXR1cyBpbiBkcm0t
bWlzYzoKCiQgZ2l0IGdyZXAgZHJtUCB8IGN1dCAtZCAnLycgLWYgMSB8IHNvcnQgfCB1bmlxIC1j
CiAgICAgIDYgYW1kCQk8PSBmaXhlZCBieSB0aGlzIHBhdGNoc2V0CiAgICAgIDggYXJtCQk8PSBw
YXRjaCBzZW50LiBOZWVkcyB0byByZWJhc2UgYW5kIHJlc2VuZAogICAgICA2IGFybWFkYQkJPD0g
cGF0Y2ggc2VudC4gTmVlZHMgdG8gcmViYXNlIGFuZCByZXNlbmQKICAgICAgMSBldG5hdml2CQk8
PSBhbHJlYWR5IGZpeGVkIGluIGV0bmF2aXYgcmVwbwogICAgICAyIGV4eW5vcwkJPD0gU29tZWhv
dyBtaXNzZWQgdGhlc2UuIFBhdGNoIHJlYWR5LCBuZWVkcyB0byBzZW5kIGl0IG91dAogICAgICAx
IGkyYwkJPD0gcGF0Y2ggc2VudC4gTmVlZHMgdG8gcmViYXNlIGFuZCByZXNlbmQKICAgICAgMiBt
c20JCTw9IHBhdGNoIHNlbnQuIE5lZWRzIHRvIHJlYmFzZSBhbmQgcmVzZW5kCiAgICAgMjcgbm91
dmVhdQkJPD0gYWxyZWFkeSBmaXhlZCBpbiBub3V2ZWF1IHJlcG8KICAgICAgNCB0ZWdyYQkJPD0g
cGF0Y2ggc2VudC4gTmVlZHMgdG8gcmVhYnNlIGFuZCByZXNlbmQKICAgICAxMyB2bXdnZngJCTw9
IGFscmVhZHkgZml4ZWQgaW4gdm13Z2Z4IHJlcG8KClNvIHRoaW5ncyBsb29rcyBkb2FibGUuIEkg
anVzdCBuZWVkIHRvIGZpbmQgYSBmZXcgaG91cnMuLgoKCVNhbQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
