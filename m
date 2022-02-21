Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 522E84BD56F
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 06:42:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A183A10E554;
	Mon, 21 Feb 2022 05:42:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 988D110E538;
 Mon, 21 Feb 2022 05:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645422152; x=1676958152;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QjYNSA4p/ATUEwS13O52nmaFheu/v4laidm2ZPmnLHk=;
 b=aXVXGn7+zRdRcPZkUBBaY4uiEKMds+sT5lMmiR2qhPvtQ4fsemMwCCEB
 cve6i/3/WAkIG4YGbEn98VCSzl2cagEgdVQKuiGjT6jNTxqRAQRzIS3mv
 WtiB2Ighq8ilw0j9+prZwIk4Gp1DAiC+nZ0wm18Zn7wnpWFCzcFrM91DB
 xxIdFUoLOKDrTL7Uk6L3RgDtrKR2xHM38/B4kRCcpcRsdYBP2+sqrRhM6
 RUdxQyaI6YvsHhiOQDUFAiKP8HcObHCeE1hlSC9IMFAjS4L+QaGocDMkf
 p7Sx5DT1g3LZlGH5x6AxeE6Y9rvS5gY5ZvM+Eqk6Ftkjpe7hg00xgf+Vw A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10264"; a="232061528"
X-IronPort-AV: E=Sophos;i="5.88,384,1635231600"; d="scan'208";a="232061528"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2022 21:42:31 -0800
X-IronPort-AV: E=Sophos;i="5.88,384,1635231600"; d="scan'208";a="706131609"
Received: from hemmamis-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.171.78])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2022 21:42:31 -0800
Date: Sun, 20 Feb 2022 21:42:38 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH topic/core-for-CI] drm/i915/dg2: Add
 relocation exception
Message-ID: <20220221054238.es6uhd3n4qqkxfuo@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220218223853.939464-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220218223853.939464-1-lucas.demarchi@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, Dave Airlie <airlied@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 18, 2022 at 02:38:53PM -0800, Lucas De Marchi wrote:
>The move to softpin in igt is ongoing and should land soon.
>Meanwhile, like was done for ADL and RKL, add an exception to allow
>running the igt display tests before that conversion is complete
>so we can unblock CI.
>
>Cc: Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>
>Cc: Dave Airlie <airlied@redhat.com>
>Cc: Daniel Vetter <daniel.vetter@intel.com>
>Cc: Jason Ekstrand <jason@jlekstrand.net>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Patch pushed to topic/core-for-CI branch with ack from Dave.

thanks
Lucas De Marchi
