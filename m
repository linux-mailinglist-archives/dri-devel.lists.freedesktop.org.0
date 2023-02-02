Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2D3687D07
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 13:16:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4031410E4F2;
	Thu,  2 Feb 2023 12:16:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EEA010E4F2;
 Thu,  2 Feb 2023 12:16:32 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 j32-20020a05600c1c2000b003dc4fd6e61dso3567593wms.5; 
 Thu, 02 Feb 2023 04:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/gi6ygwK+Ed3kqscUd6G2XBWzqocOrYUpatO0ytaDdk=;
 b=cJsFtWsn5zeNrTSCEHdc97jXnvhwsi9qpJ/LwR9vadff1nMkOJlyX7GxOqBLPNyU+c
 JlmbNRDKVVSUMv6rhbzof+vCS+PjPhig7R9PIJVH2azTiu3/WDurngy2OePogl3XoCeb
 xpDZzZ8ITWCH20VOznlbCf2ld7Ewqp+fhSlFuk12e2w3Y9ioCb3NKlWsXdEWAevnG27D
 3VfF8DEtMRpK/JVJ2MUV4EzY1jLUdRXXRyGAZ3sHEWpvSx5TtFAo2rS14WANkEeIAiUG
 1wByXlb3xtTrZ8PTdc12nzEpPP4Q2GFvSjc9LrA3GTw+wuOy/HNZBBXCd7lKPJlhERd0
 iqeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/gi6ygwK+Ed3kqscUd6G2XBWzqocOrYUpatO0ytaDdk=;
 b=G1lBp5CtmNLgbNeIUj64HNT/AqRYZiCITXq0RMEfjuF2CWb9s+cAhxbv5/3klDpZXJ
 r+GZqC3xVCnphYIMSzvmIFzzMUuEb5itFvSfV6IJd4BV34sbff68CyoVoUqILJ5rDZ/e
 EufB3LgisgXbyqRYeDt8R/CjI4lMH5toPyWA6zWmaNpOBFAbQnxaN4dC5Gnju96aA0Eu
 ccW2dSLV5+S663uZmUhua6pwGgkD7NwF4etWqkHzXAZgPG4pDE/71I0YgRuqOCGRraod
 YjjGQskWa5C4UCpijqaZFRm8g3FR4w+HBKpwGG/kObOiF5+KFHE+vqpuZP4mjnN3og93
 xl6g==
X-Gm-Message-State: AO0yUKXuWcCGyzb57Y+U83BWc9yNBAuIjhRDoMmLixAlV3gC9GSq9MZj
 JuC7ny0ZIXIG6IynEkZK0Hs=
X-Google-Smtp-Source: AK7set8pYRNGJPQ22IMpy/HZrP6qt9rlrHP93M0y7on5zIH/fT479NmbxOvNb4nvUO4KYr/GyHdZag==
X-Received: by 2002:a05:600c:6018:b0:3dc:1ad6:55fd with SMTP id
 az24-20020a05600c601800b003dc1ad655fdmr5683543wmb.32.1675340190601; 
 Thu, 02 Feb 2023 04:16:30 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 q9-20020a1ce909000000b003dc34edacf8sm4508219wmc.31.2023.02.02.04.16.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 04:16:30 -0800 (PST)
Date: Thu, 2 Feb 2023 15:15:46 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Imre Deak <imre.deak@intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2 11/17] drm/display/dp_mst: Add helpers to query for
 payload allocation errors
Message-ID: <202302021855.yyqIeQ2o-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230131150548.1614458-12-imre.deak@intel.com>
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
Cc: lkp@intel.com, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Imre,

url:    https://github.com/intel-lab-lkp/linux/commits/Imre-Deak/drm-i915-dp_mst-Add-the-MST-topology-state-for-modesetted-CRTCs/20230131-230853
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230131150548.1614458-12-imre.deak%40intel.com
patch subject: [PATCH v2 11/17] drm/display/dp_mst: Add helpers to query for payload allocation errors
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230202/202302021855.yyqIeQ2o-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/gpu/drm/display/drm_dp_mst_topology.c:3316 drm_dp_add_payload_part1() warn: missing error code 'ret'

vim +/ret +3316 drivers/gpu/drm/display/drm_dp_mst_topology.c

4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3304  int drm_dp_add_payload_part1(struct drm_dp_mst_topology_mgr *mgr,
4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3305  			     struct drm_dp_mst_topology_state *mst_state,
4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3306  			     struct drm_dp_mst_atomic_payload *payload)
ad7f8a1f9ced7f drivers/gpu/drm/drm_dp_mst_topology.c         Dave Airlie      2014-06-05  3307  {
ad7f8a1f9ced7f drivers/gpu/drm/drm_dp_mst_topology.c         Dave Airlie      2014-06-05  3308  	struct drm_dp_mst_port *port;
5c4df7ffba973b drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak        2023-01-31  3309  	int ret = 0;
706246c761ddd3 drivers/gpu/drm/drm_dp_mst_topology.c         Lyude Paul       2018-12-13  3310  
4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3311  	port = drm_dp_mst_topology_get_port_validated(mgr, payload->port);
33f960e23c29d1 drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak        2022-12-14  3312  	if (!port) {
33f960e23c29d1 drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak        2022-12-14  3313  		drm_dbg_kms(mgr->dev,
33f960e23c29d1 drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak        2022-12-14  3314  			    "VCPI %d for port %p not in topology, not creating a payload\n",
33f960e23c29d1 drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak        2022-12-14  3315  			    payload->vcpi, payload->port);
5c4df7ffba973b drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak        2023-01-31 @3316  		goto alloc_fail;

Hard to tell if this is an error path or a success path.

33f960e23c29d1 drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak        2022-12-14  3317  	}
cfe9f90358d97a drivers/gpu/drm/drm_dp_mst_topology.c         Lyude Paul       2019-01-10  3318  
4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3319  	if (mgr->payload_count == 0)
4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3320  		mgr->next_start_slot = mst_state->start_slot;
3769e4c0af5b82 drivers/gpu/drm/drm_dp_mst_topology.c         Wayne Lin        2021-06-16  3321  
4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3322  	payload->vc_start_slot = mgr->next_start_slot;
cfe9f90358d97a drivers/gpu/drm/drm_dp_mst_topology.c         Lyude Paul       2019-01-10  3323  
4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3324  	ret = drm_dp_create_payload_step1(mgr, payload);
4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3325  	drm_dp_mst_topology_put_port(port);
4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3326  	if (ret < 0) {
4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3327  		drm_warn(mgr->dev, "Failed to create MST payload for port %p: %d\n",
4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3328  			 payload->port, ret);
5c4df7ffba973b drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak        2023-01-31  3329  		goto alloc_fail;
ad7f8a1f9ced7f drivers/gpu/drm/drm_dp_mst_topology.c         Dave Airlie      2014-06-05  3330  	}
dfda0df3426483 drivers/gpu/drm/drm_dp_mst_topology.c         Dave Airlie      2014-08-06  3331  
5c4df7ffba973b drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak        2023-01-31  3332  	payload->alloc_failed = false;
5c4df7ffba973b drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak        2023-01-31  3333  
4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3334  	mgr->payload_count++;
4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3335  	mgr->next_start_slot += payload->time_slots;
ad7f8a1f9ced7f drivers/gpu/drm/drm_dp_mst_topology.c         Dave Airlie      2014-06-05  3336  
4d07b0bc403403 drivers/gpu/drm/display/drm_dp_mst_topology.c Lyude Paul       2022-08-17  3337  	return 0;
5c4df7ffba973b drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak        2023-01-31  3338  
5c4df7ffba973b drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak        2023-01-31  3339  alloc_fail:
5c4df7ffba973b drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak        2023-01-31  3340  	payload->vc_start_slot = -1;
5c4df7ffba973b drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak        2023-01-31  3341  	payload->alloc_failed = true;
5c4df7ffba973b drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak        2023-01-31  3342  
5c4df7ffba973b drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak        2023-01-31  3343  	return ret;
ad7f8a1f9ced7f drivers/gpu/drm/drm_dp_mst_topology.c         Dave Airlie      2014-06-05  3344  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

