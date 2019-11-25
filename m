Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FA31093A1
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 19:40:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 123B389E36;
	Mon, 25 Nov 2019 18:40:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 848BF89E36
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 18:40:01 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id C230320037;
 Mon, 25 Nov 2019 19:39:55 +0100 (CET)
Date: Mon, 25 Nov 2019 19:39:54 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/5] drm/udl: Convert to GEM framebuffer helpers
Message-ID: <20191125183954.GA17436@ravnborg.org>
References: <20191114141025.32198-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191114141025.32198-1-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=VwTHNnYSvYTx0M86I4AA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: dri-devel@lists.freedesktop.org, kraxel@redhat.com, airlied@redhat.com,
 sean@poorly.run, emil.velikov@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhvbWFzLgoKT24gVGh1LCBOb3YgMTQsIDIwMTkgYXQgMDM6MTA6MjBQTSArMDEwMCwgVGhv
bWFzIFppbW1lcm1hbm4gd3JvdGU6Cj4gVWRsIHVzZXMgc3RydWN0IHVkbF9mcmFtZWJ1ZmZlciBm
b3IgcmVwcmVzZW50aW5nIGl0cyBmcmFtZWJ1ZmZlci4gVGhlCj4gdHlwZSBjYW4gYmUgcmVwbGFj
ZWQgYnkgdGhlIHN0YW5kYXJkIERSTSBmcmFtZWJ1ZmZlciBzdHJ1Y3R1cmUuCj4gCj4gUGF0Y2hl
cyAxIHRvIDQgcHJlcGFyZSB0aGUgZHJpdmVyIGZvciB0aGUgY29udmVyc2lvbi4gUGF0Y2ggNSBy
ZXBsYWNlcwo+IHRoZSBzdHJ1Y3R1cmUuCj4gCj4gVGhlIHBhdGNoc2V0IGhhcyBiZWVuIHRlc3Rl
ZCBieSBydW5uaW5nIHRoZSBmYiBjb25zb2xlLCBYMTEgYW5kIFdlc3Rvbgo+IG9uIGEgRGlzcGxh
eUxpbmsgYWRhcHRlci4KClNlcmllcyBsb29rcyBnb29kLCB3aXRoIHNvbWUgbmljZSBjbGVhbnVw
IHRvIHByZXBhcmUgZm9yIHRoZQpyZW1vdmFsIG9mIHVkbF9mcmFtZWJ1ZmZlci4KCldob2xlIHNl
cmllcyBpczoKQWNrZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KCj4gCj4g
VGhvbWFzIFppbW1lcm1hbm4gKDUpOgo+ICAgZHJtL3VkbDogVW5tYXAgYnVmZmVyIG9iamVjdCBh
ZnRlciBkYW1hZ2UgdXBkYXRlCj4gICBkcm0vdWRsOiBSZW1vdmUgdWRsIGltcGxlbWVudGF0aW9u
IG9mIEdFTSdzIGZyZWVfb2JqZWN0KCkKPiAgIGRybS91ZGw6IFN0b3JlIGFjdGl2ZSBmcmFtZWJ1
ZmZlciBpbiBkZXZpY2Ugc3RydWN0dXJlCj4gICBkcm0vdWRsOiBDYWxsIHVkbF9oYW5kbGVfZGFt
YWdlKCkgd2l0aCBEUk0gZnJhbWVidWZmZXIKPiAgIGRybS91ZGw6IFJlcGxhY2Ugc3RydWN0IHVk
bF9mcmFtZWJ1ZmZlciB3aXRoIGdlbmVyaWMgaW1wbGVtZW50YXRpb24KPiAKPiAgZHJpdmVycy9n
cHUvZHJtL3VkbC91ZGxfZHJ2LmggICAgIHwgIDE0ICsrLS0KPiAgZHJpdmVycy9ncHUvZHJtL3Vk
bC91ZGxfZmIuYyAgICAgIHwgMTMxICsrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9nZW0uYyAgICAgfCAgMTggKy0tLQo+ICBkcml2ZXJzL2dw
dS9kcm0vdWRsL3VkbF9tYWluLmMgICAgfCAgIDMgKwo+ICBkcml2ZXJzL2dwdS9kcm0vdWRsL3Vk
bF9tb2Rlc2V0LmMgfCAgMzEgKysrLS0tLQo+ICA1IGZpbGVzIGNoYW5nZWQsIDcwIGluc2VydGlv
bnMoKyksIDEyNyBkZWxldGlvbnMoLSkKPiAKPiAtLQo+IDIuMjMuMApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
