Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7DA6DD727
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 11:50:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 909CC10E117;
	Tue, 11 Apr 2023 09:50:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B6F10E0BE
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 09:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681206626; x=1712742626;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JrVteDFyeT/P8hd4qs4Q0KWR23l+rPhB5Jf5eKrKS6c=;
 b=OBv6PPSOTvuf6aQ6Hxk8sq4l/nQR1flaymFLCF7LxZiv2WJ+r2dZse1+
 naTsgtpTNAuRzuQXyEsgePsMnVM5ZmhmqRF9H8r7nEiy2usc918yq02Er
 ocinbrv1iiL2Dk6MXyJOV1NaGOZyChi7n0s0Otj1518CR4lDtGtyTOD2b
 2jfw6lmAxplBRoXAjkmuRmwTSUw4US0EzIWVIaRbOiZNM+ri8oJczvtbY
 G6ocBm0TrC2gyNamKiVB+xi0nsKuVisoyEtvSHduLsUU+0Qx9yVR7fsfI
 p+jFIiVBh+RU3kefiNrzbjQF/GqH1fe+xz+9VhWbRDb+NdpqKsjLc0KuK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="327676609"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="327676609"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2023 02:49:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="1018312507"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="1018312507"
Received: from faerberc-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.252.55.254])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2023 02:49:26 -0700
Date: Tue, 11 Apr 2023 11:48:58 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the drm tree
Message-ID: <ZDUtCi1GFMDO9Z5L@ashyti-mobl2.lan>
References: <20230411160236.28845f80@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230411160236.28845f80@canb.auug.org.au>
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
Cc: Dave Airlie <airlied@redhat.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Andi Shyti <andi.shyti@linux.intel.com>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen,

On Tue, Apr 11, 2023 at 04:02:36PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the drm tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> drivers/gpu/drm/i915/gt/uc/intel_guc.h:274: warning: Function parameter or member 'dbgfs_node' not described in 'intel_guc'
> 
> Introduced by commit
> 
>   70b5ffb393f3 ("drm/i915/gt: Create per-gt debugfs files")

that's mine to take... will fix it!

Thanks!

Andi
