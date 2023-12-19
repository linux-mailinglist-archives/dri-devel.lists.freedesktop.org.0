Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E028184F9
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 11:05:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F95C10E44A;
	Tue, 19 Dec 2023 10:05:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 506B210E44A
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 10:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702980328; x=1734516328;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=GYh2QAC0fStEzODabV1bQJMw123SDu7m97yVaq82oLY=;
 b=h2qmnm3EyZhY8zLqKkAjHFnw3nTGjv5yYDnV5HvQMW1Xx7RFQm/1Gcu3
 WJoUvDr9VXIp5XEWedNn4xGxzzpxM60ZRRui3GzTpbvo7BnePc97F4Qsj
 vGkaR2fC5Bn4oPRrb93yDJ1t7dQDgGNApRbLJn3xhrp+8mTeYLgyqLkc7
 T7ErXRGfQEm4ccHpz1gmjSPb66dZs46smoeq579ORcFBnOSgp95Zd3gIL
 Zj+7d2vNBKji7rzWE/+cAIHGly9gz+ky1SpVR20uquDz62eHh1xkB6yRq
 ig096f3OZo/zD59rtAbN4vlKhnhIDBX5CUqM/CotIL60vC2/ex0kIqyd4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="395366632"
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; d="scan'208";a="395366632"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 02:05:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; d="scan'208";a="24131363"
Received: from alexeyze-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.34.118])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 02:05:25 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas <t.luettecken@web.de>, dri-devel@lists.freedesktop.org
Subject: Re: enforce the Display Stream Compression
In-Reply-To: <494cba52-2a19-e2dd-8a88-bc304f729889@web.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <494cba52-2a19-e2dd-8a88-bc304f729889@web.de>
Date: Tue, 19 Dec 2023 12:05:22 +0200
Message-ID: <87sf3ytsm5.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 18 Dec 2023, Thomas <t.luettecken@web.de> wrote:
> I want to enforce the Display Stream Compression (DSC) of the Intel i915
> driver in Linux Ubuntu 22.04 to test it. While inspecting the source
> code, I came across a query called "force_dsc_output_format" that seems
> useful to me. My question is more general and pertains to the procedure
> for setting such queries/switches. How can I set this query to True to
> force DSC? Do I need to modify the kernel parameter line, and if so,
> how? Or is there another method?

There are connector debugfs files named i915_dsc_* for controlling
this. They are for debug and test purposes only. See the relevant igt
tests for how they're used in testing [1].

BR,
Jani.


[1] https://gitlab.freedesktop.org/drm/igt-gpu-tools

-- 
Jani Nikula, Intel
