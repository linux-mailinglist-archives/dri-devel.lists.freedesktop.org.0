Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B30F12ABFC5
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 16:25:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F04389A76;
	Mon,  9 Nov 2020 15:25:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE6438984D;
 Mon,  9 Nov 2020 15:25:37 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id C30C58053A;
 Mon,  9 Nov 2020 16:25:32 +0100 (CET)
Date: Mon, 9 Nov 2020 16:25:30 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 10/19] drm/radeon/radeon: Move prototype into shared header
Message-ID: <20201109152530.GA1888045@ravnborg.org>
References: <20201106214949.2042120-1-lee.jones@linaro.org>
 <20201106214949.2042120-11-lee.jones@linaro.org>
 <20201107142651.GA1014611@ravnborg.org>
 <20201109110603.GV2063125@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201109110603.GV2063125@dell>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VafZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=IkcTkHD0fZMA:10 a=0bRNquZ1QDSsZ4hO3z4A:9 a=QEXdDO2ut3YA:10
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGVlLAo+ID4gCj4gPiBPdGhlciBwdWJsaWMgZnVuY3Rpb25zIGluIHJhZGVvbl9kZXZpY2Uu
YyBoYXZlIHRoZWlyIHByb3RvdHlwZSBpbgo+ID4gcmFkZW9uLmggLSBmb3IgZXhhbXBsZSByYWRl
b25faXNfcHgoKQo+ID4gCj4gPiBBZGQgcmFkZW9uX2RldmljZV9pc192aXJ0dWFsKCkgdGhlcmUg
c28gd2UgYXZvaWlkIHRoaXMgbmV3IGhlYWRlci4KPiAKPiBPaCB5ZXMsIEkgcmVtZW1iZXIgd2h5
IHRoaXMgd2Fzbid0IGEgc3VpdGFibGUgc29sdXRpb24gbm93Ogo+IAo+IFRoZSBtYWNybyAicmFk
ZW9uX2luaXQiIGluIHJhZGVvbi5oIGNsYXNoZXMgd2l0aCB0aGUgaW5pdCBmdW5jdGlvbiBvZgo+
IHRoZSBzYW1lIG5hbWUgaW4gcmFkZW9uX2Rydi5jOgo+IAo+ICAgSW4gZmlsZSBpbmNsdWRlZCBm
cm9tIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5jOjUzOgo+ICAgZHJpdmVycy9n
cHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmM6NjIwOjMxOiBlcnJvcjogZXhwZWN0ZWQgaWRlbnRp
ZmllciBvciDigJgo4oCZIGJlZm9yZSDigJh2b2lk4oCZCj4gICA2MjAgfCBzdGF0aWMgaW50IF9f
aW5pdCByYWRlb25faW5pdCh2b2lkKQouLi4KPiAKPiBIb3cgd291bGQgeW91IGxpa2UgbWUgdG8g
bW92ZSBmb3J3YXJkPwoKRml4IHRoZSB0aG91c2FuZCBvZiB3YXJuaW5ncyBpbiBvdGhlciBwbGFj
ZXMgOi0pCkkgd2lsbCB0YWtlIGEgbG9vayBhdCByYWRlb24gYW5kIHBvc3QgYSBuZXcgc2VyaWVz
IGJhc2VkIG9uIHlvdXIgd29yawp3aXRoIGFsbCBXPTEgd2FybmluZ3MgZml4ZWQuCgoJU2FtCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
