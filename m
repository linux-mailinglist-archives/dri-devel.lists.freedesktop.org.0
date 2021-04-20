Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7E33662B0
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 01:59:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C3076E919;
	Tue, 20 Apr 2021 23:59:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B88BD6E919;
 Tue, 20 Apr 2021 23:59:46 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 i20-20020a4a8d940000b02901bc71746525so8853620ook.2; 
 Tue, 20 Apr 2021 16:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SxR++HmNMtsFaPjPoWGP3yCDilrISVYh6Idyrh/hrQc=;
 b=L+daVzwAV3O2jG3d8KotJCsora66UrQgGpdGHwBkaGI8yj52YKK0u07pbL9YvlIg+J
 oWG6Pk4ENP6bMkQhEFUpUgnxQ9bDe+B5v5fCJqTG4p98vUij6+7as8RZxPV595xQ4CcB
 VnVcAYnthE5I3eGeFy4cP9XpWgL5mvlBRwo9lfdIu3qLPs8Lcf5Tzvf5unZXwiDlR+QR
 9VLFLmvIcLdib3m9erqIheKWPA5NcEHyv8Oh5XU7toYOoCk5ji56oiiAwuLQZhI8o/24
 aG2PAe4cpE05aWfYAj3oVkxMFZpsC9ItAp/czFBmcTJBK9CKnShST28wqTY2SXj3NDrc
 ge9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SxR++HmNMtsFaPjPoWGP3yCDilrISVYh6Idyrh/hrQc=;
 b=EHbaxxCbgov20gXHSQb0pHjSR5AMlgDoWUqeSuJaKDdncVZTNQkF/jT/SwuUKf0DfO
 /7WpJYGL4MZmhUGEy7K3ay+EJ5dxZJtnN5Y/Th6zJc7ezI9qeZb1PJ4BbiiaXhrEGMVR
 cHH4x68hkX3Ph4pPuBBJ7FBb/V49843dillorwtqos3S1A8AApWNjZJ6wvBxSL0i3trC
 fnr2pG+e7o5JgxIo8SHXj+J9GvxNMk+DhlYHM+nFi9xZEUjMdlCOzL3EIwdOdt6800be
 IA55gqUsz/Tpyfgr9cbwbNhRszdv4Bk1mkYMWwfoGUxmvurkVUIX++P2scmhj79DNxih
 kbow==
X-Gm-Message-State: AOAM5325EFvMpTEHf7bu+kqH2yTwzYydUiohtK6GljwY7y5dWGWn1ebN
 DyBEe5zPQBAjUV1Mr2iM6p+NNYlhuX98bsyzcy8=
X-Google-Smtp-Source: ABdhPJzl+deAHpDoxg3MeSz0QbS8aVCVRzHVR2KPghP8gR1TmN2eLRRbC5EaE1urYpXG0jTZl3S325GT9aiaEjqcP/4=
X-Received: by 2002:a4a:800d:: with SMTP id x13mr18900158oof.61.1618963186047; 
 Tue, 20 Apr 2021 16:59:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-32-lee.jones@linaro.org>
 <2029fbcf-8d2b-7a85-edd2-481a571ae43d@amd.com>
In-Reply-To: <2029fbcf-8d2b-7a85-edd2-481a571ae43d@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 20 Apr 2021 19:59:35 -0400
Message-ID: <CADnq5_N5_poFcOpQzV+Ae22rwD0PG3kq0O3q10gmbb7=fNpEyA@mail.gmail.com>
Subject: Re: [PATCH 31/40] drm/amd/amdgpu/amdgpu_gart: Correct a couple of
 function names in the docs
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
 Nirmoy Das <nirmoy.das@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIHRoYW5rcyEKCkFsZXgKCk9uIEZyaSwgQXByIDE2LCAyMDIxIGF0IDExOjUzIEFN
IENocmlzdGlhbiBLw7ZuaWcKPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4KPiBB
bSAxNi4wNC4yMSB1bSAxNjozNyBzY2hyaWViIExlZSBKb25lczoKPiA+IEZpeGVzIHRoZSBmb2xs
b3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMpOgo+ID4KPiA+ICAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dhcnQuYzo3Mzogd2FybmluZzogZXhwZWN0aW5nIHByb3Rv
dHlwZSBmb3IgYW1kZ3B1X2R1bW15X3BhZ2VfaW5pdCgpLiBQcm90b3R5cGUgd2FzIGZvciBhbWRn
cHVfZ2FydF9kdW1teV9wYWdlX2luaXQoKSBpbnN0ZWFkCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9nYXJ0LmM6OTY6IHdhcm5pbmc6IGV4cGVjdGluZyBwcm90b3R5cGUg
Zm9yIGFtZGdwdV9kdW1teV9wYWdlX2ZpbmkoKS4gUHJvdG90eXBlIHdhcyBmb3IgYW1kZ3B1X2dh
cnRfZHVtbXlfcGFnZV9maW5pKCkgaW5zdGVhZAo+ID4KPiA+IENjOiBBbGV4IERldWNoZXIgPGFs
ZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4
LmllPgo+ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiA+IENjOiBOaXJt
b3kgRGFzIDxuaXJtb3kuZGFzQGFtZC5jb20+Cj4gPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiA+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+Cj4gUmV2aWV3ZWQt
Ynk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPgo+ID4gLS0t
Cj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nYXJ0LmMgfCA0ICsrLS0K
PiA+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dhcnQu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nYXJ0LmMKPiA+IGluZGV4IGM1
YTlhNGZiMTBkMmIuLjU1NjJiNWM5MGMwMzIgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZ2FydC5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZ2FydC5jCj4gPiBAQCAtNjAsNyArNjAsNyBAQAo+ID4gICAgKi8KPiA+
Cj4gPiAgIC8qKgo+ID4gLSAqIGFtZGdwdV9kdW1teV9wYWdlX2luaXQgLSBpbml0IGR1bW15IHBh
Z2UgdXNlZCBieSB0aGUgZHJpdmVyCj4gPiArICogYW1kZ3B1X2dhcnRfZHVtbXlfcGFnZV9pbml0
IC0gaW5pdCBkdW1teSBwYWdlIHVzZWQgYnkgdGhlIGRyaXZlcgo+ID4gICAgKgo+ID4gICAgKiBA
YWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyCj4gPiAgICAqCj4gPiBAQCAtODYsNyArODYsNyBA
QCBzdGF0aWMgaW50IGFtZGdwdV9nYXJ0X2R1bW15X3BhZ2VfaW5pdChzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldikKPiA+ICAgfQo+ID4KPiA+ICAgLyoqCj4gPiAtICogYW1kZ3B1X2R1bW15X3Bh
Z2VfZmluaSAtIGZyZWUgZHVtbXkgcGFnZSB1c2VkIGJ5IHRoZSBkcml2ZXIKPiA+ICsgKiBhbWRn
cHVfZ2FydF9kdW1teV9wYWdlX2ZpbmkgLSBmcmVlIGR1bW15IHBhZ2UgdXNlZCBieSB0aGUgZHJp
dmVyCj4gPiAgICAqCj4gPiAgICAqIEBhZGV2OiBhbWRncHVfZGV2aWNlIHBvaW50ZXIKPiA+ICAg
ICoKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
YW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
