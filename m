Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A12216C32E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 15:02:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0FDA6EAD6;
	Tue, 25 Feb 2020 14:02:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5335D6EAD6;
 Tue, 25 Feb 2020 14:02:41 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 20345751-1500050 for multiple; Tue, 25 Feb 2020 14:02:01 +0000
MIME-Version: 1.0
To: David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jani.nikula@linux.intel.com
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200225134709.6153-2-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200225134709.6153-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20200225134709.6153-2-pankaj.laxminarayan.bharadiya@intel.com>
Message-ID: <158263931977.26598.171017617509031302@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [Intel-gfx][PATCH 01/10] drm/i915: Add i915 device based
 MISSING_CASE macro
Date: Tue, 25 Feb 2020 14:01:59 +0000
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
Cc: pankaj.laxminarayan.bharadiya@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Pankaj Bharadiya (2020-02-25 13:47:00)
> Now that we have struct drm_device based drm_WARN, introduce struct
> drm_i915_private based i915_MISSING_CASE macro which uses drm_WARN so
> that device specific information will also get printed in backtrace.
> 
> i915_MISSING_CASE macro should be preferred over MISSING_CASE,
> wherever possible.

Whatever for? MISSING_CASE() itself should be a complete picture for the
forgotten code.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
