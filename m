Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE22687D62
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 13:35:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86E6110E1C7;
	Thu,  2 Feb 2023 12:35:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6BE110E1C7;
 Thu,  2 Feb 2023 12:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675341348; x=1706877348;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=sK01+u4QKwrt6v/fqe+avgm9K2OnjzjEuVK7lKWD+4o=;
 b=YiMo/XqDdYvjfG0Xwj3Xjk5L+EvUa0zFfvvo9RxvG8g6mGU8i33TwiEC
 7qI1k0xDhealo2rMq6c+14G11Cnd8nnjtmeg++hHjU2OgdRIuEXRCMwn0
 GE3G2bPI/risbzqfzX7p029TE9hzfVDlysx559ZaxmiIEKMLh4nbnMQaE
 k3PTxbhjm1pDPcXcEm2toc5jAMErWk/j6oMSoag6KT8PgINHV6xU1dBUv
 mayhn4czWwIi0bTbV449WwpvJR0LYvTineEqhKDxDlViZp/5F9udiHfCY
 12d7M0ud3Pkv7hhsdnYmAabF26eMMLiqj2xqjVnyp3InmoZF7p5y/fu5L Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="316431144"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="316431144"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 04:35:46 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="658707625"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="658707625"
Received: from ideak-desk.fi.intel.com ([10.237.72.58])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 04:35:44 -0800
Date: Thu, 2 Feb 2023 14:35:41 +0200
From: Imre Deak <imre.deak@intel.com>
To: Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 11/17] drm/display/dp_mst: Add helpers to query for
 payload allocation errors
Message-ID: <Y9uuHRBB9dfdxZVp@ideak-desk.fi.intel.com>
References: <20230131150548.1614458-12-imre.deak@intel.com>
 <202302021855.yyqIeQ2o-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202302021855.yyqIeQ2o-lkp@intel.com>
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
Reply-To: imre.deak@intel.com
Cc: intel-gfx@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev,
 oe-kbuild@lists.linux.dev, dri-devel@lists.freedesktop.org, lkp@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Feb 02, 2023 at 03:15:46PM +0300, Dan Carpenter wrote:
> Hi Imre,
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Imre-Deak/drm-i915-dp_mst-Add-the-MST-topology-state-for-modesetted-CRTCs/20230131-230853
> base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
> patch link:    https://lore.kernel.org/r/20230131150548.1614458-12-imre.deak%40intel.com
> patch subject: [PATCH v2 11/17] drm/display/dp_mst: Add helpers to query for payload allocation errors
> config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230202/202302021855.yyqIeQ2o-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> 
> smatch warnings:
> drivers/gpu/drm/display/drm_dp_mst_topology.c:3316 drm_dp_add_payload_part1() warn: missing error code 'ret'
> 
> vim +/ret +3316 drivers/gpu/drm/display/drm_dp_mst_topology.c
> 
> 4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3304  int drm_dp_add_payload_part1(struct drm_dp_mst_topology_mgr *mgr,
> 4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3305  			     struct drm_dp_mst_topology_state *mst_state,
> 4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3306  			     struct drm_dp_mst_atomic_payload *payload)
> ad7f8a1f9ced7f drivers/gpu/drm/drm_dp_mst_topology.c         Dave Airlie      2014-06-05  3307  {
> ad7f8a1f9ced7f drivers/gpu/drm/drm_dp_mst_topology.c         Dave Airlie      2014-06-05  3308  	struct drm_dp_mst_port *port;
> 5c4df7ffba973b drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak        2023-01-31  3309  	int ret = 0;
> 706246c761ddd3 drivers/gpu/drm/drm_dp_mst_topology.c         Lyude Paul       2018-12-13  3310  
> 4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3311  	port = drm_dp_mst_topology_get_port_validated(mgr, payload->port);
> 33f960e23c29d1 drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak        2022-12-14  3312  	if (!port) {
> 33f960e23c29d1 drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak        2022-12-14  3313  		drm_dbg_kms(mgr->dev,
> 33f960e23c29d1 drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak        2022-12-14  3314  			    "VCPI %d for port %p not in topology, not creating a payload\n",
> 33f960e23c29d1 drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak        2022-12-14  3315  			    payload->vcpi, payload->port);
> 5c4df7ffba973b drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak        2023-01-31 @3316  		goto alloc_fail;
> 
> Hard to tell if this is an error path or a success path.

thanks for the report. The function before the change in this patchset
returned 0 in this case, so I didn't want to change that. Looking at the
callers none of them uses the return value (except for printing an error
message). I think returning an error code in this case as well would be
more consistent, but that change should be a follow-up.

> 33f960e23c29d1 drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak        2022-12-14  3317  	}
> cfe9f90358d97a drivers/gpu/drm/drm_dp_mst_topology.c         Lyude Paul       2019-01-10  3318  
> 4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3319  	if (mgr->payload_count == 0)
> 4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3320  		mgr->next_start_slot = mst_state->start_slot;
> 3769e4c0af5b82 drivers/gpu/drm/drm_dp_mst_topology.c         Wayne Lin        2021-06-16  3321  
> 4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3322  	payload->vc_start_slot = mgr->next_start_slot;
> cfe9f90358d97a drivers/gpu/drm/drm_dp_mst_topology.c         Lyude Paul       2019-01-10  3323  
> 4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3324  	ret = drm_dp_create_payload_step1(mgr, payload);
> 4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3325  	drm_dp_mst_topology_put_port(port);
> 4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3326  	if (ret < 0) {
> 4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3327  		drm_warn(mgr->dev, "Failed to create MST payload for port %p: %d\n",
> 4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3328  			 payload->port, ret);
> 5c4df7ffba973b drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak        2023-01-31  3329  		goto alloc_fail;
> ad7f8a1f9ced7f drivers/gpu/drm/drm_dp_mst_topology.c         Dave Airlie      2014-06-05  3330  	}
> dfda0df3426483 drivers/gpu/drm/drm_dp_mst_topology.c         Dave Airlie      2014-08-06  3331  
> 5c4df7ffba973b drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak        2023-01-31  3332  	payload->alloc_failed = false;
> 5c4df7ffba973b drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak        2023-01-31  3333  
> 4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3334  	mgr->payload_count++;
> 4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3335  	mgr->next_start_slot += payload->time_slots;
> ad7f8a1f9ced7f drivers/gpu/drm/drm_dp_mst_topology.c         Dave Airlie      2014-06-05  3336  
> 4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3337  	return 0;
> 5c4df7ffba973b drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak        2023-01-31  3338  
> 5c4df7ffba973b drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak        2023-01-31  3339  alloc_fail:
> 5c4df7ffba973b drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak        2023-01-31  3340  	payload->vc_start_slot = -1;
> 5c4df7ffba973b drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak        2023-01-31  3341  	payload->alloc_failed = true;
> 5c4df7ffba973b drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak        2023-01-31  3342  
> 5c4df7ffba973b drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak        2023-01-31  3343  	return ret;
> ad7f8a1f9ced7f drivers/gpu/drm/drm_dp_mst_topology.c         Dave Airlie      2014-06-05  3344  }
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests
> 
