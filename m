Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCFE1A1ABF
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 06:09:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B226E94C;
	Wed,  8 Apr 2020 04:09:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 915006E94B;
 Wed,  8 Apr 2020 04:09:12 +0000 (UTC)
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 41C6D20730;
 Wed,  8 Apr 2020 04:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586318952;
 bh=zYwiFZGl49KN9HFEtiHeiuJk7M7xUgpFciGBR71vuWY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vdQWIl1ziK6+WwhAgSahgStxdGDxzR9LUwlTirmuxDArLhD4UiCet62VMCq/v3Uw5
 ZMs34U3GMOHKaBOVSpqsMOuv70339QyGB5C6R8mrT6Eg7moIwnqzNtJF2b6cy4EzKH
 v4B9u63sN1oZfreFer1k4aKFL43ePpyTnDGH9ZK4=
Date: Tue, 7 Apr 2020 21:09:10 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 12/15] drm/amdgpu/display: add a late register connector
 callback
Message-ID: <20200408040910.GA80793@sol.localdomain>
References: <20200207195058.2354-1-alexander.deucher@amd.com>
 <20200207195058.2354-13-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200207195058.2354-13-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBGZWIgMDcsIDIwMjAgYXQgMDI6NTA6NTVQTSAtMDUwMCwgQWxleCBEZXVjaGVyIHdy
b3RlOgo+IFRvIGhhbmRsZSBkZWJ1Z2ZzIHNldHVwIG9uIG5vbiBEUCBNU1QgY29ubmVjdG9ycy4K
PiAKPiBSZXZpZXdlZC1ieTogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+
Cj4gQWNrZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4K
PiBTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+
Cj4gLS0tCj4gIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyAg
fCAxOCArKysrKysrKysrKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCj4gaW5kZXggYWY4MTU1NzA4NTY5Li5iNjE5MDA3OWVk
M2YgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9h
bWRncHVfZG0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtLmMKPiBAQCAtNDQ4Niw2ICs0NDg2LDE5IEBAIGFtZGdwdV9kbV9jb25uZWN0b3Jf
YXRvbWljX2R1cGxpY2F0ZV9zdGF0ZShzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQo+
ICAJcmV0dXJuICZuZXdfc3RhdGUtPmJhc2U7Cj4gIH0KPiAgCj4gK3N0YXRpYyBpbnQKPiArYW1k
Z3B1X2RtX2Nvbm5lY3Rvcl9sYXRlX3JlZ2lzdGVyKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25u
ZWN0b3IpCj4gK3sKPiArCXN0cnVjdCBhbWRncHVfZG1fY29ubmVjdG9yICphbWRncHVfZG1fY29u
bmVjdG9yID0KPiArCQl0b19hbWRncHVfZG1fY29ubmVjdG9yKGNvbm5lY3Rvcik7Cj4gKwo+ICsj
aWYgZGVmaW5lZChDT05GSUdfREVCVUdfRlMpCj4gKwljb25uZWN0b3JfZGVidWdmc19pbml0KGFt
ZGdwdV9kbV9jb25uZWN0b3IpOwo+ICsjZW5kaWYKPiArCj4gKwlyZXR1cm4gMDsKPiArfQoKVGhp
cyBpbnRyb2R1Y2VkIGEgY29tcGlsZXIgd2FybmluZzoKCmRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1Ly4uL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jOiBJbiBmdW5jdGlvbiDigJhhbWRn
cHVfZG1fY29ubmVjdG9yX2xhdGVfcmVnaXN0ZXLigJk6CmRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1Ly4uL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jOjQ3MjY6MzA6IHdhcm5pbmc6IHVu
dXNlZCB2YXJpYWJsZSDigJhhbWRncHVfZG1fY29ubmVjdG9y4oCZIFstV3VudXNlZC12YXJpYWJs
ZV0KIDQ3MjYgfCAgc3RydWN0IGFtZGdwdV9kbV9jb25uZWN0b3IgKmFtZGdwdV9kbV9jb25uZWN0
b3IgPQogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+
fn5+fgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
