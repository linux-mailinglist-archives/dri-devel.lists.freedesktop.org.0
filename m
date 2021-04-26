Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5052136B432
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 15:42:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D190789DC1;
	Mon, 26 Apr 2021 13:42:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB9F189DC1;
 Mon, 26 Apr 2021 13:42:36 +0000 (UTC)
IronPort-SDR: 32ro+3pbv24pBrkhyJUmWG2XRrmNE7Yn0OUer+vKGfSThtSJ+W771m8G7UvUCp3rfK/eZf7AVP
 wPk7EhxmDOig==
X-IronPort-AV: E=McAfee;i="6200,9189,9966"; a="196396175"
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="196396175"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2021 06:42:36 -0700
IronPort-SDR: CndGDu7JZLXg16IGPoVLqogAd89ZpdwPR1IRcyN20l3nT9UX2bU6j8TdLNzaNw4HZ0L8eYQM2s
 NkNI+fob10RQ==
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="429401767"
Received: from unknown (HELO localhost) ([10.252.50.197])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2021 06:42:32 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dan Carpenter <dan.carpenter@oracle.com>, kbuild@lists.01.org,
 Anshuman Gupta <anshuman.gupta@intel.com>
Subject: Re: [drm-intel:drm-intel-next 3/4]
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c:582 intel_dp_hdcp2_read_msg()
 error: uninitialized symbol 'msg_end'.
In-Reply-To: <20210402104348.GW2065@kadam>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210402104348.GW2065@kadam>
Date: Mon, 26 Apr 2021 16:42:29 +0300
Message-ID: <87im495fi2.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>, kbuild-all@lists.01.org,
 lkp@intel.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 02 Apr 2021, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> tree:   git://anongit.freedesktop.org/drm-intel drm-intel-next
> head:   b29854ec3b9ca6512a783e2153465f27a777a654
> commit: 989cf9a93892409cf8e84c30c0faaa522ac83807 [3/4] drm/i915/hdcp: Add DP HDCP2.2 timeout to read entire msg
> config: i386-randconfig-m031-20210401 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, fixed a while back with 28972f821ea7 ("drm/i915/hdcp: Fix
uninitialized symbol 'msg_end'").

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
