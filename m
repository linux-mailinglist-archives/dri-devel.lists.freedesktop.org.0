Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 805E28758C6
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 21:49:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6863810F170;
	Thu,  7 Mar 2024 20:49:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jq3e+EhV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4DB10F09B;
 Thu,  7 Mar 2024 20:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709844566; x=1741380566;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ilMUyXopEkmBNybJuR23NjEdPVgSG3BBUTWyPhUd7SE=;
 b=Jq3e+EhVCdLTVJCyLo+oOaDnSkQX3BAw8E7Ru6clqLoK/jYDTBZI/EwM
 TkefR+jzJB9iQtmoOMffrvcHccEVCz+Hk6M8I39DBxoAye0KeqV6VKbVO
 2m63S3R5QG0xJ2tnNABxP45FU1EZ9ToYPaTyDP9pSEqTdrR3s2HjyCe8s
 PAw879eA1KUoZuS3UzaZzSvm4lmYTRdEPsVAqmgesFwfnA2mJ/Ebq67na
 erlHtFxcAfMjHh9nvSiDX3NAUSYFbgB0bZ3UKank8EwCGvKF5mb1y++Y3
 J4U5iXhUlrcX4A/NTcDrwccQQgOJgjMXtrLAI+wSmTRscXXmo2IZfwgud g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15686320"
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; d="scan'208";a="15686320"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 12:49:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; d="scan'208";a="10168983"
Received: from tofferse-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.33.212])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 12:49:23 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 17/22] drm/i915/pxp: fix i915_pxp_tee_interface.h
 kernel-doc warnings
In-Reply-To: <xrotgqvs3n2zuifbhnjhhnylbn7nuo4isjorsscyyt7bpyiice@wnisn6x2jbrb>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1709749576.git.jani.nikula@intel.com>
 <f39bd169d27483aca7bed07929b87869bf8927fe.1709749576.git.jani.nikula@intel.com>
 <xrotgqvs3n2zuifbhnjhhnylbn7nuo4isjorsscyyt7bpyiice@wnisn6x2jbrb>
Date: Thu, 07 Mar 2024 22:49:19 +0200
Message-ID: <87v85xvkc0.fsf@intel.com>
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

On Thu, 07 Mar 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Wed, Mar 06, 2024 at 08:31:22PM +0200, Jani Nikula wrote:
>>Make documentation match code.
>>
>>Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>---
>> include/drm/i915_pxp_tee_interface.h | 19 ++++++++++++-------
>> 1 file changed, 12 insertions(+), 7 deletions(-)
>>
>>diff --git a/include/drm/i915_pxp_tee_interface.h b/include/drm/i915_pxp_tee_interface.h
>>index 7d96985f2d05..653e85d6e32b 100644
>>--- a/include/drm/i915_pxp_tee_interface.h
>>+++ b/include/drm/i915_pxp_tee_interface.h
>>@@ -14,12 +14,10 @@ struct scatterlist;
>>  * struct i915_pxp_component_ops - ops for PXP services.
>>  * @owner: Module providing the ops
>>  * @send: sends data to PXP
>>- * @receive: receives data from PXP
>>+ * @recv: receives data from PXP
>>+ * @gsc_command: send gsc command
>>  */
>> struct i915_pxp_component_ops {
>>-	/**
>>-	 * @owner: owner of the module provding the ops
>>-	 */
>
>
> isn't the other way around the more common one? i.e. document the
> struct members closer to their declaration.
>
>> 	struct module *owner;
>>
>> 	int (*send)(struct device *dev, const void *message, size_t size,
>>@@ -35,14 +33,21 @@ struct i915_pxp_component_ops {
>> /**
>>  * struct i915_pxp_component - Used for communication between i915 and TEE
>>  * drivers for the PXP services
>>- * @tee_dev: device that provide the PXP service from TEE Bus.
>>- * @pxp_ops: Ops implemented by TEE driver, used by i915 driver.
>>  */
>
> ... which you follow here.

Yeah, fixed locally, ditto for previous patch. Thanks for the reviews.

BR,
Jani.


-- 
Jani Nikula, Intel
