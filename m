Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 050CB219DC
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 16:32:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3027C898EE;
	Fri, 17 May 2019 14:32:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406EF898EE;
 Fri, 17 May 2019 14:32:52 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 16590567-1500050 for multiple; Fri, 17 May 2019 15:32:37 +0100
MIME-Version: 1.0
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190517140617.31187-1-janusz.krzysztofik@linux.intel.com>
References: <20190517140617.31187-1-janusz.krzysztofik@linux.intel.com>
Message-ID: <155810355587.12244.1572259791791116662@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [RFC PATCH] drm/i915: Tolerate file owned GEM contexts on hot
 unbind
Date: Fri, 17 May 2019 15:32:35 +0100
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
Cc: Janusz Krzysztofik <janusz.krzysztofik@intel.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBKYW51c3ogS3J6eXN6dG9maWsgKDIwMTktMDUtMTcgMTU6MDY6MTcpCj4gRnJvbTog
SmFudXN6IEtyenlzenRvZmlrIDxqYW51c3oua3J6eXN6dG9maWtAaW50ZWwuY29tPgo+IAo+IER1
cmluZyBpOTE1X2RyaXZlcl91bmxvYWQoKSwgR0VNIGNvbnRleHRzIGFyZSB2ZXJpZmllZCByZXN0
cmljdGl2ZWx5Cj4gaW5zaWRlIGk5MTVfZ2VtX2ZpbmkoKSBpZiB0aGV5IGRvbid0IGNvbnN1bWUg
c2hhcmVkIHJlc291cmNlcyB3aGljaAo+IHNob3VsZCBiZSBjbGVhbmVkIHVwIGJlZm9yZSB0aGUg
ZHJpdmVyIGlzIHJlbGVhc2VkLiAgSWYgdGhvc2UgY2hlY2tzCj4gZG9uJ3QgcmVzdWx0IGluIGtl
cm5lbCBwYW5pYywgb25lIG1vcmUgY2hlY2sgaXMgcGVyZm9ybWVkIGF0IHRoZSBlbmQgb2YKPiBp
OTE1X2dlbV9maW5pKCkgd2hpY2ggaXNzdWVzIGEgV0FSTl9PTigpIGlmIEdFTSBjb250ZXh0cyBz
dGlsbCBleGlzdC4KCkp1c3QgZml4IHRoZSB1bmRlcmx5aW5nIGJ1ZyBvZiB0aGlzIGNvZGUgYmVp
bmcgY2FsbGVkIHRvbyBlYXJseS4gVGhlCmFzc3VtcHRpb25zIHdlIG1hZGUgZm9yIHVubG9hZCBh
cmUgY2xlYXJseSBpbnZhbGlkIHdoZW4gYXBwbGllZCB0bwp1bmJpbmQsIGFuZCB3ZSBuZWVkIHRv
IHNwbGl0IHRoZSBwaGFzZXMuCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
