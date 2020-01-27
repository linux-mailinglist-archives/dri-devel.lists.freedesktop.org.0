Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC3C149FD9
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 09:26:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 616A16EA25;
	Mon, 27 Jan 2020 08:26:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7786EA25;
 Mon, 27 Jan 2020 08:26:24 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Jan 2020 00:25:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,369,1574150400"; d="scan'208";a="221666018"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by orsmga008.jf.intel.com with ESMTP; 27 Jan 2020 00:25:56 -0800
Date: Mon, 27 Jan 2020 13:44:24 +0530
From: "Bharadiya,Pankaj" <pankaj.laxminarayan.bharadiya@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [[Intel-gfx] [PATCH v2 00/10] drm: Introduce struct drm_device
 based WARN* and use them in i915
Message-ID: <20200127081423.GB8711@plaxmina-desktop.iind.intel.com>
References: <20200115034455.17658-1-pankaj.laxminarayan.bharadiya@intel.com>
 <878slzea12.fsf@intel.com>
 <20200123090041.GA804@plaxmina-desktop.iind.intel.com>
 <87blquik9y.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87blquik9y.fsf@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 sam@ravnborg.org, sudeep.dutt@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 23, 2020 at 11:39:37AM +0200, Jani Nikula wrote:
> On Thu, 23 Jan 2020, "Bharadiya,Pankaj" <pankaj.laxminarayan.bharadiya@intel.com> wrote:
> > Will rebase remaining patches and submit.
> 
> Please also add a patch to convert MISSING_CASE(),

Will do.

> and another to remove
> the WARN_ON/WARN_ON_ONCE "overrides" that we have in i915_utils.h.

Still i915 driver wil have many calls to WARN_ON* after this patch
series gets merged.

Shall I remove WARN_ON/WARN_ON_ONCE "overrides" so that existing
callers will fallback to original WARN_ON* implementation until
complete conversion is done? Just want to double confirm on this
before I submit a patch.

Thanks,
Pankaj

> 
> Thanks,
> Jani.
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
