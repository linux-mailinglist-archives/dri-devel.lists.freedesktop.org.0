Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0814A586F90
	for <lists+dri-devel@lfdr.de>; Mon,  1 Aug 2022 19:29:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4D1311A1A4;
	Mon,  1 Aug 2022 17:28:59 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6C648AD1B;
 Mon,  1 Aug 2022 17:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659374930; x=1690910930;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=M74AuQ4AL6LJpGzX0ABXJ3owg2Ahbx+/x9efdgIpSA8=;
 b=jR9n/PXIVN9nXetGjNVjyGQfafERMPVP4egQfkvvi3zyyGLixekDZrku
 mWGn1FIHRQ1oZ9my/hR9Yf6mRAkJqPTeLk+8GbnarFefTNotakkGNgWUs
 SstYkurOqTwZNC8lphc119q69C1uOaux1oLzPhNFfRBHW08RVbBthJP2w
 gkZhYdUAvdL5SU4SHKCLVOCNMBXSWBfAjrnS4KLlQAYC8Yep8HBq0rTv1
 OwGvkWUUQ92AZA8iZmnV/GHuYq3Iy1iBVpRlDXTzE8TBDPHjKi6ODkHQM
 QPXZM6UX9Rh/cvg7YEdrT4YYnLv7Y6maE8Oc9TrAnzPu6wRyet5C0xBQq w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="289976639"
X-IronPort-AV: E=Sophos;i="5.93,208,1654585200"; d="scan'208";a="289976639"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2022 10:28:48 -0700
X-IronPort-AV: E=Sophos;i="5.93,208,1654585200"; d="scan'208";a="552590557"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2022 10:28:48 -0700
Date: Mon, 1 Aug 2022 10:28:29 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: John.C.Harrison@Intel.com
Subject: Re: [PATCH 0/1] Move DG2 to GuC v70.4.1
Message-ID: <20220801172829.GJ14039@nvishwa1-DESK>
References: <20220728230722.2749701-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220728230722.2749701-1-John.C.Harrison@Intel.com>
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
Cc: Intel-GFX@Lists.FreeDesktop.Org, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 28, 2022 at 04:07:21PM -0700, John.C.Harrison@Intel.com wrote:
>From: John Harrison <John.C.Harrison@Intel.com>
>
>The latest GuC release contains a bunch of fixes for DG2. Start using
>it.
>
>Note that some of these fixes require i915 side support which will
>follow in separate patches.

So, this patch series has a dependency on those i915 fixes required?

Niranjana

>
>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>
>
>John Harrison (1):
>  drm/i915/dg2: Update DG2 to GuC v70.4.1
>
> drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>-- 
>2.37.1
>
