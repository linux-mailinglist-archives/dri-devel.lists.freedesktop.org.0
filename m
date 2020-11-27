Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9ED2C6C33
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 20:56:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA59E6F3AE;
	Fri, 27 Nov 2020 19:56:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 233316F3AA;
 Fri, 27 Nov 2020 19:56:40 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23138793-1500050 for multiple; Fri, 27 Nov 2020 19:56:39 +0000
MIME-Version: 1.0
In-Reply-To: <20201127120718.454037-6-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
 <20201127120718.454037-6-matthew.auld@intel.com>
Subject: Re: [RFC PATCH 005/162] drm/i915/gt: Rename lrc.c to
 execlists_submission.c
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Fri, 27 Nov 2020 19:56:37 +0000
Message-ID: <160650699728.2925.2203675844144641078@build.alporthouse.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Matthew Auld (2020-11-27 12:04:41)
> From: Chris Wilson <chris@chris-wilson.co.uk>
> 
> We want to separate the utility functions for controlling the logical
> ring context from the execlists submission mechanism (which is an
> overgrown scheduler).
> 
> This is similar to Daniele's work to split up the files, but being
> selfish I wanted to base it after my own changes to intel_lrc.c petered
> out.

Note in accordance with recent intel_ring_submission.c vs
intel_ring_scheduler.c, this would be intel_execlists_scheduler.c
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
