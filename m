Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4022682956C
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 09:54:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BABBB10E57C;
	Wed, 10 Jan 2024 08:54:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91A2410E57C
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 08:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704876853; x=1736412853;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=dnkOCs6cDjp4KVNwXB688/VNuCpa9hdDD9eN/2CWKqY=;
 b=MfZ2QAubtlpgWll62Noq72bHsEcHen9aUX6H9ihF5+VgeZw1H9eC+wN9
 Sk7NTYD/8sHV+B7WCcv7Hfc8uJEPf32IhhMsiPlUsJIzzONgMu2MoIDtv
 q8aAOsYP0bmBa3vBNCzv2XVyDbWJdCMnlBy6+eRgAMszPJux9idn+uRBu
 YLhHjpx5CZg9CsY0zSmOfxBbEqg6YKHOYsXaNfhfghF2Ae6YfFranQXOx
 vXlok2tLi3dgLIpzPNp+DZ9Ssa8yV/ojwpAhFyz3DsknB5/nUARZsAf0S
 A05xEGEy+tIi3R0zxd8Cu3hyyQVT3eh86BD6pQOqemzcfm6UrRheELwBH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="484634428"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="484634428"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 00:54:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="901075092"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="901075092"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.36.240])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 00:54:11 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: f380cedric <ce-ce-mel@hotmail.fr>, dri-devel@lists.freedesktop.org
Subject: Re: Lenovo b40-30 i915.invert_brightness
In-Reply-To: <VI1P195MB24600B1096F3B65D68CD99C4DE6A2@VI1P195MB2460.EURP195.PROD.OUTLOOK.COM>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <VI1P195MB24600B1096F3B65D68CD99C4DE6A2@VI1P195MB2460.EURP195.PROD.OUTLOOK.COM>
Date: Wed, 10 Jan 2024 10:54:08 +0200
Message-ID: <87il41woun.fsf@intel.com>
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

On Tue, 09 Jan 2024, f380cedric <ce-ce-mel@hotmail.fr> wrote:
> Dear maintainers,
>
> I have a Lenovo b40-30 that I have been running with nomodeset for a while.
> The issue was that it needed invert_brightness. Here are the requested IDs: 0f31, 17aa, 3986 :).

Please file a bug as described at [1].

BR.
Jani.

[1] https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html


-- 
Jani Nikula, Intel
