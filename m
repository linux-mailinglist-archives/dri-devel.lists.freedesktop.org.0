Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C382F2C2C5F
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 17:11:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC83C6E45E;
	Tue, 24 Nov 2020 16:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 199D86E45E;
 Tue, 24 Nov 2020 16:10:58 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id 64so9463186wra.11;
 Tue, 24 Nov 2020 08:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=libUlVl49I/i7vBirvP7mh4EFHUzeyktEhxk+XKEmZI=;
 b=XX94/Y1UCtmAsaoEgud7ffheaR5OREUQ6G+avAgY1e1dlbFOGmjiGpiw/lDwc0wOTU
 LRxo5TGuL8YoNnaEbsFTv6Lrx4kzRjpA6iPMvvcp5CZhcgFdNyJ35nPZJ8BVepMu2D6W
 7o9FaKxCdd+aQc9nDq3KPCft4zzGHqLD3UhLyye3tEJzy/Lalevqic3b9FggA7/NrL1U
 fABnVTAs944tsJdn1Q8v9LfXM/lPAzyv5YdyK+jgeDgH2vkQbQ2qcbJFckKi4pRQ3duI
 QyZH07iQ4Y9uacmIbZPcrr/yqdwW+UWAPgurdM5R6mdBLNdwotYYRS9HA/3bC7s3QO4l
 dQiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=libUlVl49I/i7vBirvP7mh4EFHUzeyktEhxk+XKEmZI=;
 b=g3GTsObBGBO8QwkESW/wI4iikpWmLM82xRcWsr7tiZ9FXzzoegLG6d58H87YTvXXNW
 4w70gIanxLu5Krt92Ji6KyklI/whnf3kB6cfHYPSPVK2cOuCB5dBgU+Lt6LWNPoMcUHg
 UjmJWE1Vp05dKBSShi+zqgGWamoNEynjwMQ1nh9Jysd5mwweTYmLivw4kOMW0iLgQ1I3
 sa3Rqam2/c3mxj71YXERpOAg6XBpBPa+fReJTyWG0Lm+twJUhnO2tVyuriEeC7I9YWhm
 ohxtflBcks9tHt+oae6PhY123w5aj00OxXIVlGd/cK6oLXmka5VkHIX5jLvnIthatUMf
 B5JQ==
X-Gm-Message-State: AOAM5333j5cmIqMxyxip+ALEPIvbSUkGHO2F/PMEdp+0KlVSum0t9IoS
 s8FI0t31d9IYH88gmZMk35ZBQsjRSIRwtxQm3II=
X-Google-Smtp-Source: ABdhPJzL3wH6V4aUxvIZUY/x1zyXe3RFBUZkm6ERX/NuxGg/yrAcxGOyHtr9vRR3Vv7QuHI/WrDxWdIIxSPsVcO+IhU=
X-Received: by 2002:adf:e551:: with SMTP id z17mr6171532wrm.374.1606234256820; 
 Tue, 24 Nov 2020 08:10:56 -0800 (PST)
MIME-Version: 1.0
References: <20201123111919.233376-1-lee.jones@linaro.org>
 <20201123111919.233376-23-lee.jones@linaro.org>
In-Reply-To: <20201123111919.233376-23-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 24 Nov 2020 11:10:45 -0500
Message-ID: <CADnq5_NiF-gb0748yid+1y1UwjO91=LO8zK5uHcTU+ojZ6T_Uw@mail.gmail.com>
Subject: Re: [PATCH 22/40] drm/amd/amdgpu/dce_v6_0: Fix formatting and missing
 parameter description issues
To: Lee Jones <lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Luben Tuikov <luben.tuikov@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMjMsIDIwMjAgYXQgNjoyMCBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RjZV92Nl8wLmM6MTky
OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdhc3luYycgbm90IGRlc2Ny
aWJlZCBpbiAnZGNlX3Y2XzBfcGFnZV9mbGlwJwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9kY2VfdjZfMC5jOjEwNTA6IHdhcm5pbmc6IENhbm5vdCB1bmRlcnN0YW5kICAqCj4KPiBDYzog
QWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0aWFu
IEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxh
aXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4g
Q2M6IEx1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+Cj4gQ2M6IGFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
PiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKQXBwbGll
ZC4gIFRoYW5rcyEKCkFsZXgKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Rj
ZV92Nl8wLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RjZV92
Nl8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kY2VfdjZfMC5jCj4gaW5kZXggOTQz
OTc2MzQ5MzQ2NC4uODNhODgzODViNzYyMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9kY2VfdjZfMC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
ZGNlX3Y2XzAuYwo+IEBAIC0xODAsNiArMTgwLDcgQEAgc3RhdGljIHZvaWQgZGNlX3Y2XzBfcGFn
ZWZsaXBfaW50ZXJydXB0X2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gICAqIEBh
ZGV2OiBhbWRncHVfZGV2aWNlIHBvaW50ZXIKPiAgICogQGNydGNfaWQ6IGNydGMgdG8gY2xlYW51
cCBwYWdlZmxpcCBvbgo+ICAgKiBAY3J0Y19iYXNlOiBuZXcgYWRkcmVzcyBvZiB0aGUgY3J0YyAo
R1BVIE1DIGFkZHJlc3MpCj4gKyAqIEBhc3luYzogYXN5bmNocm9ub3VzIGZsaXAKPiAgICoKPiAg
ICogRG9lcyB0aGUgYWN0dWFsIHBhZ2VmbGlwIChldmVyZ3JlZW4rKS4KPiAgICogRHVyaW5nIHZi
bGFuayB3ZSB0YWtlIHRoZSBjcnRjIGxvY2sgYW5kIHdhaXQgZm9yIHRoZSB1cGRhdGVfcGVuZGlu
Zwo+IEBAIC0xMDQ3LDcgKzEwNDgsNiBAQCBzdGF0aWMgdTMyIGRjZV92Nl8wX2xpbmVfYnVmZmVy
X2FkanVzdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPgo+Cj4gIC8qKgo+IC0gKgo+ICAg
KiBkY2VfdjZfMF9iYW5kd2lkdGhfdXBkYXRlIC0gcHJvZ3JhbSBkaXNwbGF5IHdhdGVybWFya3MK
PiAgICoKPiAgICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgo+IC0tCj4gMi4yNS4xCj4K
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
