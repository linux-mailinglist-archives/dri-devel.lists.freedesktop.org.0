Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4B92DB369
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 19:14:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C32DE89933;
	Tue, 15 Dec 2020 18:14:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 785BE89933;
 Tue, 15 Dec 2020 18:14:17 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23336117-1500050 for multiple; Tue, 15 Dec 2020 18:13:09 +0000
MIME-Version: 1.0
In-Reply-To: <20201215144101.1878719-1-trix@redhat.com>
References: <20201215144101.1878719-1-trix@redhat.com>
Subject: Re: [PATCH] drm/i915: remove h from printk format specifier
From: Chris Wilson <chris@chris-wilson.co.uk>
To: airlied@linux.ie, daniel@ffwll.ch, daniele.ceraolospurio@intel.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 lionel.g.landwerlin@intel.com, rodrigo.vivi@intel.com,
 tejaskumarx.surendrakumar.upadhyay@intel.com, trix@redhat.com,
 tvrtko.ursulin@intel.com, venkata.s.dhanalakota@intel.com
Date: Tue, 15 Dec 2020 18:13:10 +0000
Message-ID: <160805599050.14591.5854311082825914383@build.alporthouse.com>
User-Agent: alot/0.9
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
Cc: Tom Rix <trix@redhat.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting trix@redhat.com (2020-12-15 14:41:01)
> From: Tom Rix <trix@redhat.com>
> 
> See Documentation/core-api/printk-formats.rst.
> h should no longer be used in the format specifier for printk.

It's understood by format_decode().
* 'h', 'l', or 'L' for integer fields

At least reference commit cbacb5ab0aa0 ("docs: printk-formats: Stop
encouraging use of unnecessary %h[xudi] and %hh[xudi]") as to why the
printk-formats.rst was altered so we know the code is merely in bad
taste and not using undefined behaviour of printk.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
