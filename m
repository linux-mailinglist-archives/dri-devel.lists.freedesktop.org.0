Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3446C94E1
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 01:36:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A3406E1BC;
	Wed,  2 Oct 2019 23:36:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF75E6E1B9;
 Wed,  2 Oct 2019 23:36:06 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 18699908-1500050 for multiple; Thu, 03 Oct 2019 00:35:52 +0100
MIME-Version: 1.0
To: Andrew Morton <akpm@linux-foundation.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <157005892305.6186.11083242843371260826@jlahtine-mobl.ger.corp.intel.com>
References: <bug-205065-27@https.bugzilla.kernel.org/>
 <20191002145721.83c29b4fc81bb49fbd2435a6@linux-foundation.org>
 <157005892305.6186.11083242843371260826@jlahtine-mobl.ger.corp.intel.com>
Message-ID: <157005934855.4047.10478435692309669762@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [Bug 205065] New: workqueue: PF_MEMALLOC task 173(kswapd0) is
 flushing !WQ_MEM_RECLAIM events:gen6_pm_rps_work [i915]
Date: Thu, 03 Oct 2019 00:35:48 +0100
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
Cc: Tejun Heo <tj@kernel.org>, bugzilla-daemon@bugzilla.kernel.org,
 romanescu.2019@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBKb29uYXMgTGFodGluZW4gKDIwMTktMTAtMDMgMDA6Mjg6NDMpCj4gKyBDaHJpcyBh
bmQgVHZydGtvCgpJdCdzIGEgdHJpdmlhbCB3YXJuaW5nLCB0aGF0J3MgYWxyZWFkeSBmaXhlZC4g
SW4gdGhpcyBjYXNlIGJ5IHNlcGFyYXRpbmcKb3V0IHRoZSBwb3dlcm9mZiBpbnRvIHByb2Nlc3Mg
Y29udGV4dC4KYzczMDJmMjA0NDkwICgiZHJtL2k5MTU6IERlZmVyIGZpbmFsIGludGVsX3dha2Vy
ZWZfcHV0IHRvIHByb2Nlc3MgY29udGV4dCIpCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
