Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2C63A2D78
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 15:51:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B85E86ED25;
	Thu, 10 Jun 2021 13:51:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E921B6ED20;
 Thu, 10 Jun 2021 13:51:41 +0000 (UTC)
IronPort-SDR: 2qhxZDMf4/xka/mr+QbwHpoLrjXf/RA7YMVANlKeuBJfpxrk1zQ2R1wr9a5qx90oW3Undh/7XJ
 dg5w6OnIIY9A==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="205333179"
X-IronPort-AV: E=Sophos;i="5.83,263,1616482800"; d="scan'208";a="205333179"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 06:51:37 -0700
IronPort-SDR: IDx/c5dTIyfDu/DVuHVFk3vzL2zSRP30vGd8+BrVJBbToLf18nhyBw+lyQ+8zUZHYoRKZ53fuM
 DLv2JlZRqDHg==
X-IronPort-AV: E=Sophos;i="5.83,263,1616482800"; d="scan'208";a="482844464"
Received: from ppiorkow-desk.igk.intel.com (HELO localhost) ([10.102.12.149])
 by orsmga001-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2021 06:51:34 -0700
Date: Thu, 10 Jun 2021 15:55:44 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [Intel-gfx] [PATCH 09/13] drm/i915/doc: Include GuC ABI
 documentation
Message-ID: <20210610135544.scqqhd3awdymx4bk@intel.com>
References: <20210610043649.144416-1-matthew.brost@intel.com>
 <20210610043649.144416-10-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210610043649.144416-10-matthew.brost@intel.com>
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

Matthew Brost <matthew.brost@intel.com> wrote on śro [2021-cze-09 21:36:45 -0700]:
> From: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> GuC ABI documentation is now ready to be included in i915.rst
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>

Acked-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> ---
>  Documentation/gpu/i915.rst | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
> index 42ce0196930a..c7846b1d9293 100644
> --- a/Documentation/gpu/i915.rst
> +++ b/Documentation/gpu/i915.rst
> @@ -518,6 +518,14 @@ GuC-based command submission
>  .. kernel-doc:: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>     :doc: GuC-based command submission
>  
> +GuC ABI
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/uc/abi/guc_communication_mmio_abi.h
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> +
>  HuC
>  ---
>  .. kernel-doc:: drivers/gpu/drm/i915/gt/uc/intel_huc.c
> -- 
> 2.28.0
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
