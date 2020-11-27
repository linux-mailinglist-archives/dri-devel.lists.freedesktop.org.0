Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E05472C67ED
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 15:30:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E4296EDF1;
	Fri, 27 Nov 2020 14:30:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56C26EDF0;
 Fri, 27 Nov 2020 14:30:32 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23134332-1500050 for multiple; Fri, 27 Nov 2020 14:30:28 +0000
MIME-Version: 1.0
In-Reply-To: <20201127120718.454037-148-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
 <20201127120718.454037-148-matthew.auld@intel.com>
Subject: Re: [RFC PATCH 147/162] drm/i915/gt: Allocate default ctx objects in
 SMEM
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Fri, 27 Nov 2020 14:30:28 +0000
Message-ID: <160648742842.2925.4328629214545297756@build.alporthouse.com>
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
Cc: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>,
 dri-devel@lists.freedesktop.org,
 Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Matthew Auld (2020-11-27 12:07:03)
> From: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>
> 
> If record default objects are created in LMEM and in suspend
> pin the pages of obj (src) and use blitter for eviction. But
> during request creation using blitter context and try to pin the same
> default object, to restore the ctx with default HW values, will leads to
> the dead lock situation. To avoid this, safe to keep these
> objects in SMEM.

Dead patch. Default object state should be recorded as shmemfs.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
