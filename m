Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FFC2C81EE
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 11:16:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B5789CF8;
	Mon, 30 Nov 2020 10:16:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4314089CF8;
 Mon, 30 Nov 2020 10:16:37 +0000 (UTC)
IronPort-SDR: rCk/Lg+2+br3MX+SaQ9l9cPXH4s4u8VXudZ/Nfkp7sJ95UzrDF3RmGz2CmK0neza/EamIfQ6tt
 Ze3BOqUQd/Rw==
X-IronPort-AV: E=McAfee;i="6000,8403,9820"; a="169114303"
X-IronPort-AV: E=Sophos;i="5.78,381,1599548400"; d="scan'208";a="169114303"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 02:16:34 -0800
IronPort-SDR: JC0HVK5RJ8ThAxRmfUrNATdjSyfgmOlrjzn+A9Zo4XZ41vwFJ1QbpE8VLuwtA55D97iKdfieoP
 t76sCNDWPeWg==
X-IronPort-AV: E=Sophos;i="5.78,381,1599548400"; d="scan'208";a="549041546"
Received: from cshanno1-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.44.44])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 02:16:31 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [RFC PATCH 119/162] drm/i915/dg1: Read OPROM via SPI
 controller
In-Reply-To: <20201127120718.454037-120-matthew.auld@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20201127120718.454037-1-matthew.auld@intel.com>
 <20201127120718.454037-120-matthew.auld@intel.com>
Date: Mon, 30 Nov 2020 12:16:29 +0200
Message-ID: <871rgbkv42.fsf@intel.com>
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
Cc: Tomas Winkler <tomas.winkler@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 27 Nov 2020, Matthew Auld <matthew.auld@intel.com> wrote:
> +	DRM_DEBUG_KMS("Found valid VBT in SPI flash\n");

Please use drm_dbg_kms() and friends throughout the series. We don't
want new users of DRM_DEBUG* in the driver.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
