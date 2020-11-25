Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DE22C3C3C
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 10:36:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCBA06E88D;
	Wed, 25 Nov 2020 09:36:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C55C6E87B;
 Wed, 25 Nov 2020 09:36:27 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23101504-1500050 for multiple; Wed, 25 Nov 2020 09:36:05 +0000
MIME-Version: 1.0
In-Reply-To: <20201125012938.2767821-1-luomeng12@huawei.com>
References: <20201125012938.2767821-1-luomeng12@huawei.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: fix error return code in
 check_partial_mapping()
From: Chris Wilson <chris@chris-wilson.co.uk>
To: airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, luomeng12@huawei.com, rodrigo.vivi@intel.com
Date: Wed, 25 Nov 2020 09:36:04 +0000
Message-ID: <160629696476.23345.6606091270794045054@build.alporthouse.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Luo Meng (2020-11-25 01:29:38)
> Fix to return a negative error code from the error handling case
> instead of 0 in function check_partial_mapping(), as done elsewhere
> in this function.

It's not an error, just the end of testing.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
