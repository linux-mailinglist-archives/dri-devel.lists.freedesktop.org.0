Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0EC2EFF1F
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jan 2021 12:10:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B01E76E8D2;
	Sat,  9 Jan 2021 11:10:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9753A6E8D2;
 Sat,  9 Jan 2021 11:10:48 +0000 (UTC)
Received: from zn.tnic (p200300ec2f1c3a00cbbba2c7022ca5ed.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f1c:3a00:cbbb:a2c7:22c:a5ed])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 605FE1EC03C5;
 Sat,  9 Jan 2021 12:10:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1610190645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q+HNSAGnLFdN3MqrWehu4yxQ5T20BGbWSK/3vkyYElA=;
 b=Ok0yeXOXW8ybckg0olUt1FFTby51CazQVYF1FBaFakZqXwf9om8iZCD0/A2s705ivuuMmF
 XC0m1A1lDsScrNXVBhD1b+HKtU6mOo/B134ei1m99gAnQY2TZuQVEh6xxYJO25m3u3uebV
 zPjEh7pOEfP7XYRxmxOJPq7PqiNPP44=
Date: Sat, 9 Jan 2021 12:10:35 +0100
From: Borislav Petkov <bp@alien8.de>
To: Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/2] drm/radeon: stop re-init the TTM page pool
Message-ID: <20210109111035.GA4234@zn.tnic>
References: <20210105182309.1362-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210105182309.1362-1-christian.koenig@amd.com>
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
Cc: ray.huang@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKYW4gMDUsIDIwMjEgYXQgMDc6MjM6MDhQTSArMDEwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPiBEcml2ZXJzIGFyZSBub3Qgc3VwcG9zZWQgdG8gaW5pdCB0aGUgcGFnZSBwb29s
IGRpcmVjdGx5IGFueSBtb3JlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9yYWRlb25fdHRtLmMgfCAzIC0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMgYi9k
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYwo+IGluZGV4IGQ0MzI4ZmY1Nzc1Ny4u
MzViNzE1ZjgyZWQ4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9u
X3R0bS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMKPiBAQCAt
NzI5LDkgKzcyOSw2IEBAIGludCByYWRlb25fdHRtX2luaXQoc3RydWN0IHJhZGVvbl9kZXZpY2Ug
KnJkZXYpCj4gIAl9Cj4gIAlyZGV2LT5tbWFuLmluaXRpYWxpemVkID0gdHJ1ZTsKPiAgCj4gLQl0
dG1fcG9vbF9pbml0KCZyZGV2LT5tbWFuLmJkZXYucG9vbCwgcmRldi0+ZGV2LCByZGV2LT5uZWVk
X3N3aW90bGIsCj4gLQkJICAgICAgZG1hX2FkZHJlc3NpbmdfbGltaXRlZCgmcmRldi0+cGRldi0+
ZGV2KSk7Cj4gLQo+ICAJciA9IHJhZGVvbl90dG1faW5pdF92cmFtKHJkZXYpOwo+ICAJaWYgKHIp
IHsKPiAgCQlEUk1fRVJST1IoIkZhaWxlZCBpbml0aWFsaXppbmcgVlJBTSBoZWFwLlxuIik7Cj4g
LS0gCgpXYXMgZmluYWxseSBhYmxlIHRvIHRlc3QgdGhvc2UgZHVyaW5nIHdvcmtzdGF0aW9uIGh3
IG1haW50ZW5hbmNlIHNvIEkKd2FzIGFibGUgdG8gaW5zdGFsbCBhIG5ldyBrZXJuZWwgYW5kIHJl
Ym9vdC4KClJlcG9ydGVkLWJ5OiBCb3Jpc2xhdiBQZXRrb3YgPGJwQHN1c2UuZGU+ClRlc3RlZC1i
eTogQm9yaXNsYXYgUGV0a292IDxicEBzdXNlLmRlPgoKVGhhbmtzIGZvciB0aGUgZml4ZXMhCgot
LSAKUmVnYXJkcy9HcnVzcywKICAgIEJvcmlzLgoKaHR0cHM6Ly9wZW9wbGUua2VybmVsLm9yZy90
Z2x4L25vdGVzLWFib3V0LW5ldGlxdWV0dGUKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
