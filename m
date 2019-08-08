Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E3C8604F
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 12:44:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9377989C1F;
	Thu,  8 Aug 2019 10:44:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C4E89213;
 Thu,  8 Aug 2019 10:44:34 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17928851-1500050 for multiple; Thu, 08 Aug 2019 11:44:23 +0100
MIME-Version: 1.0
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Xiong Zhang <xiong.y.zhang@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190808103236.GB30506@mwanda>
References: <20190808103236.GB30506@mwanda>
Message-ID: <156526106102.20411.17520131390381233492@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] drm/i915: Use after free in error path in
 intel_vgpu_create_workload()
Date: Thu, 08 Aug 2019 11:44:21 +0100
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBEYW4gQ2FycGVudGVyICgyMDE5LTA4LTA4IDExOjMyOjM2KQo+IFdlIGNhbid0IGZy
ZWUgIndvcmtsb2FkIiB1bnRpbCBhZnRlciB0aGUgcHJpbnRrIG9yIGl0J3MgYSB1c2UgYWZ0ZXIK
PiBmcmVlLgo+IAo+IEZpeGVzOiAyMDg5YTc2YWRlOTAgKCJkcm0vaTkxNS9ndnQ6IENoZWNraW5n
IHdvcmtsb2FkJ3MgZ21hIGVhcmxpZXIiKQo+IFNpZ25lZC1vZmYtYnk6IERhbiBDYXJwZW50ZXIg
PGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KClRoYXQncyB0aGUgc2ltcGxlciBwYXRjaCwKUmV2
aWV3ZWQtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgotQ2hyaXMK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
