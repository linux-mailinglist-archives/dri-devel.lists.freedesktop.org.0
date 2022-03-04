Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AA64CCEFF
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 08:26:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B81D310E950;
	Fri,  4 Mar 2022 07:26:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D99110E950;
 Fri,  4 Mar 2022 07:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646378759; x=1677914759;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=arcUkRQFbIhbxWJ6wWGD3LeSNf+eatOH2vr0aWB2GFc=;
 b=Emqo755snMc9CcsPmpGF+70jUlKBwixTff6lXHp2GbUsVE4F/COm1cbL
 Y9unlh/fYr4nVEquGxl4mBga6o7wXrQLRGPgu79dzMgXmg9a8nK6GVLGw
 pmfLZOGwU97rQaLIeoWMpGwnm6g1eq71iQyoKIB+WANvIHPoplOMRWss6
 7GF8s1iGAMBfZdzpNe+jL4XV6yO8n/MyRXtSQvCNiMfnKjCrFLrYGbo7F
 XBfoUfdEkl2DaUZK/0UI7KXNfyAFAw63ppp8OxsJ1Gw3ACXbyK0q76ALW
 LG097MwUQwnLrRDJq852baJQwm77gH2LoIR79bHgIV4fj/HwZ0otbh8vv g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10275"; a="254108719"
X-IronPort-AV: E=Sophos;i="5.90,154,1643702400"; d="scan'208";a="254108719"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 23:25:58 -0800
X-IronPort-AV: E=Sophos;i="5.90,154,1643702400"; d="scan'208";a="536181361"
Received: from davidgba-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.215.14])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 23:25:58 -0800
Date: Thu, 3 Mar 2022 23:25:58 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915/xehp: Support platforms with
 CCS engines but no RCS
Message-ID: <20220304072558.jhmcr3wnqkdh6vjg@ldmartin-desk2>
References: <20220303223435.2793124-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220303223435.2793124-1-matthew.d.roper@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 03, 2022 at 02:34:34PM -0800, Matt Roper wrote:
>In the past we've always assumed that an RCS engine is present on every
>platform.  However now that we have compute engines there may be
>platforms that have CCS engines but no RCS, or platforms that are
>designed to have both, but have the RCS engine fused off.
>
>Various engine-centric initialization that only needs to be done a
>single time for the group of RCS+CCS engines can't rely on being setup
>with the RCS now; instead we add a I915_ENGINE_FIRST_RENDER_COMPUTE flag
>that will be assigned to a single engine in the group; whichever engine
>has this flag will be responsible for some of the general setup
>(RCU_MODE programming, initialization of certain workarounds, etc.).
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
