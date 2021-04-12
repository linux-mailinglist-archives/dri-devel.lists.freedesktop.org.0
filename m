Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1444535CA9F
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 18:01:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9071D89C09;
	Mon, 12 Apr 2021 16:01:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A49789C09;
 Mon, 12 Apr 2021 16:01:26 +0000 (UTC)
IronPort-SDR: opfLIVizUSJK/KUPBR+A5TFvJMQYzyS77imWSLKNOn2V8jEYLZgRXctvb1ZchDTabCYLLHrz4I
 CWtzG03NWR/g==
X-IronPort-AV: E=McAfee;i="6200,9189,9952"; a="181744436"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; d="scan'208";a="181744436"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 09:01:25 -0700
IronPort-SDR: zVXwyWAGUT6Z9a7xAe6/OLBfTLstdflJZsRdmNg0XR629PxaHdOCbKhgBYLfLYYzZAp8rRzLHy
 sN9p6s6I7IPA==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; d="scan'208";a="423858660"
Received: from cyeni-mobl.ger.corp.intel.com (HELO localhost) ([10.252.62.41])
 by orsmga008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 09:01:22 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [Intel-gfx] [PATCH 18/19] drm/i915/gtt: map the PD up front
In-Reply-To: <YHRkixaDBaf5cgkJ@phenom.ffwll.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210412090526.30547-1-matthew.auld@intel.com>
 <20210412090526.30547-19-matthew.auld@intel.com>
 <YHRkixaDBaf5cgkJ@phenom.ffwll.local>
Date: Mon, 12 Apr 2021 19:01:19 +0300
Message-ID: <87lf9nijao.fsf@intel.com>
MIME-Version: 1.0
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 12 Apr 2021, Daniel Vetter <daniel@ffwll.ch> wrote:
> And that's some serious wtf. Yes we've done some compile-time type
> casting automagic between i915_priv and dev in the past, and I think even
> that was bad taste. But it was justified with that we have these
> everywhere (especially in the mmio macros), and it would be a terrible
> flag day.

FWIW, we had the dev_priv/dev macro trickery for a while to not have
that flag day conversion, until everything used i915 or &i915->drm. But
we got rid of it afterwards.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
