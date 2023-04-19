Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8597C6E77E7
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 13:00:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08EFE10E928;
	Wed, 19 Apr 2023 11:00:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D16F10E931;
 Wed, 19 Apr 2023 10:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681901999; x=1713437999;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=umiz2+HMqVj08Lv+L07JaGMm/pA3YDbYaAE8NB2VFyo=;
 b=oC4iwtsdu62GmKF5BnT3XKysaETZEPS+rXaEycg58glojWosyW5SfyAN
 bXhVDWFk7IJmRKrCNwV2QHj5Dqmz1Es2WAgKHOArlz1fxJ2f0eYH7t2Qk
 5FrQmZDpGh7kSYAoV432wQiuUQQ3FWbsMljlunVMDgdVTlJuTo7Xt9umf
 UtXP4gWoJmrd8e1XV9NRqwadN2hcwJjpTVTg5XzJQ8g8sIgaV1ntj4cu8
 MOF+PFkVPkNW3O2fmE5Scd7Gm3Yb56n63g9GFofV6AGCoMujqRMgGWzgQ
 UA6k6OTiPMXKV7YCRvPdf38jyyk1lG3chDQbtV7dtOtZcjbtRHP+O/La7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="325750925"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="325750925"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 03:59:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="691466107"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="691466107"
Received: from crijnder-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.35.137])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 03:59:56 -0700
Date: Wed, 19 Apr 2023 12:59:52 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: fei.yang@intel.com
Subject: Re: [Intel-gfx] [PATCH 1/8] drm/i915/mtl: Set has_llc=0
Message-ID: <ZD/JqAbexyinWggx@ashyti-mobl2.lan>
References: <20230417062503.1884465-1-fei.yang@intel.com>
 <20230417062503.1884465-2-fei.yang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230417062503.1884465-2-fei.yang@intel.com>
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

Hi Fei,

On Sun, Apr 16, 2023 at 11:24:56PM -0700, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> On MTL, GT is no longer allocated on LLC, set has_llc=0.
> 
> Signed-off-by: Fei Yang <fei.yang@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
