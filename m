Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 651D94DA6B2
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 01:09:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42EFD899E6;
	Wed, 16 Mar 2022 00:09:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E33898C6;
 Wed, 16 Mar 2022 00:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647389357; x=1678925357;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Onc+wtOOlR/eTQn9QNrK6WBnXqtTs2A7Ts2z3d6y/QQ=;
 b=OP+icT3y7NJJ66AWqC4GuLZnGwbu7sZOwR9Se1inD/ffCMuuoAKs6EO7
 arRpcaZF9dxwlC8XTtbWr/KeB5NqZsfH/lWLZ2Qzv4SBXwjQlRYFlwtUR
 suySMEO9a5usR2Ur75+BSmjeJDA304U3N/mDdf1xz2kY1h3i0FqJ02rRP
 wPKdSo5Wgr0NQnddm0WqNd97ANO11bZXAZjoqH0hTy88s6e9Q7jJibaDc
 giYPc1tFJBXD90xOG9Eydqej1TT7UUmMJBwugUbs9TezkEJ0Pu3/TDrFl
 K+lAhhq218ajUk/+sWEPDosUf28nv/FdQomjpc0CvLJrCqMB8WK+78WVK Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="243902661"
X-IronPort-AV: E=Sophos;i="5.90,185,1643702400"; d="scan'208";a="243902661"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 17:09:16 -0700
X-IronPort-AV: E=Sophos;i="5.90,185,1643702400"; d="scan'208";a="516093682"
Received: from bpham-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.162.166])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 17:09:15 -0700
Date: Tue, 15 Mar 2022 17:09:14 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [Intel-gfx] [PATCH 3/3] drm/i915: Add support for steered
 register writes
Message-ID: <20220316000914.24vjr3l62ij53l7w@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220314234203.799268-1-matthew.d.roper@intel.com>
 <20220314234203.799268-4-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220314234203.799268-4-matthew.d.roper@intel.com>
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

On Mon, Mar 14, 2022 at 04:42:03PM -0700, Matt Roper wrote:
>Upcoming patches will need to steer writes to multicast registers as
>well as reading them.
>
>Although the setting of the 'multicast' bit should only really matter
>for write operations (reads always operate in a unicast manner and give
>us the result from one specific instance), Wa_22013088509 suggests that
>we leave the multicast bit enabled when performing read operations, so
>we follow suit here.
>
>Cc: Harish Chegondi <harish.chegondi@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
