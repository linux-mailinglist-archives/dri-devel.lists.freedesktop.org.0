Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 309045F48E8
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 19:48:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDFF910E067;
	Tue,  4 Oct 2022 17:48:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF0610E042;
 Tue,  4 Oct 2022 17:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664905719; x=1696441719;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=xRBhPS1JFOQoTWOKJc9Gxwc+xVQdzkbN2jPCUjaWrh4=;
 b=YSv1M+eDsOXVXLj0SI68MUv8jKEbCnnSMkEHvvHFbuCAeUyJGEOQHMOE
 2YLek/9PvIw5/oBgxoMe0M/M+zn6ddFhRnFwoPk/4jhkHBHhjn/vP996F
 6dlvCbBp7vley/ghrMXRYbe0ryX9cWzbTg+o/3vysjXO289ag5yPcMuqg
 0BV+yXA1lydzg4nQTJOjQKuTQuYiE71MAOq4yZN4MtDA1CZ/lQ5ruucMU
 Y5gQS1cc5qShbzyuA6y9sCn6CrhPYcrs3i1FTUIlKczCLH4at6JxUvhgt
 sV7/T3BNuzlFrAy16MA9ln8yAhk91XgFLFYrR6pcLb44q5Jd/TpysnAeW g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="290216587"
X-IronPort-AV: E=Sophos;i="5.95,158,1661842800"; d="scan'208";a="290216587"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2022 10:36:28 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="799199387"
X-IronPort-AV: E=Sophos;i="5.95,158,1661842800"; d="scan'208";a="799199387"
Received: from pvarla-mobl4.gar.corp.intel.com (HELO localhost)
 ([10.252.39.104])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2022 10:36:25 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 0/4] Fix HFVSDB parsing
In-Reply-To: <20220916100551.2531750-1-ankit.k.nautiyal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220916100551.2531750-1-ankit.k.nautiyal@intel.com>
Date: Tue, 04 Oct 2022 20:36:22 +0300
Message-ID: <87lepvsd7t.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, uma.shankar@intel.com,
 swati2.sharma@intel.com, maarten.lankhorst@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 16 Sep 2022, Ankit Nautiyal <ankit.k.nautiyal@intel.com> wrote:
> Fix issues in HFVSDB parsing for DSC support.
> Also minor refactoring in Logging.
>
> Split from original patch into a new series.
> https://patchwork.freedesktop.org/patch/495193/
>
> v2: Minor styling fixes.

Thanks for the patches, pushed to drm-misc-next.

BR,
Jani.

>
> Ankit Nautiyal (4):
>   drm/edid: Fix minimum bpc supported with DSC1.2 for HDMI sink
>   drm/edid: Split DSC parsing into separate function
>   drm/edid: Refactor HFVSDB parsing for DSC1.2
>   drm/edid: Avoid multiple log lines for HFVSDB parsing
>
>  drivers/gpu/drm/drm_edid.c | 153 +++++++++++++++++++++----------------
>  1 file changed, 87 insertions(+), 66 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
