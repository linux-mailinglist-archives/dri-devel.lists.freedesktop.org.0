Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8088D75D74E
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jul 2023 00:18:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD7DD10E09A;
	Fri, 21 Jul 2023 22:17:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF0E10E09A;
 Fri, 21 Jul 2023 22:17:55 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1b8b318c5cfso17559285ad.1; 
 Fri, 21 Jul 2023 15:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689977875; x=1690582675;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=Cjm6i6VGWK46ksrSf/WO54+zzsF5ULR5YF0/kPA+stI=;
 b=sIusdMkhzyYYzt7HTZ12ouC1zo0sibV8H/PYeYkaLxSBDEhc0NmcBhK/VXQFLOMD8W
 yS7JEFFOviSYIfM0AUhzG9IhwX1q9peWhyLEwZo1fi1Ei5S7h1BqDE1g6Of2+nZ7PTpx
 Q+UOBogLu+QuJl125anoYUSX9LRIuAPBV+8p+ObtmgkGeVXFhpawz5krJvA98tTOB6Ra
 lnn6h/GpqJu3CRz4orpNv/dF77t7/T6j5np29gkpvd7deyLug5Qg9GNsgFdanYl8stF4
 TYc5U1LqMLuLF3QdZikaEvERFBL7v8REuiNxCz5F8AxJJI9Sl1vfdhCDfmupGEmdv0d9
 iQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689977875; x=1690582675;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cjm6i6VGWK46ksrSf/WO54+zzsF5ULR5YF0/kPA+stI=;
 b=LbpXNdb7NwuAJl5LY+lXG0Rvst7WKrRB3aXoFwj0hI+CaHMNK5mdxOG8s5btPR4TrF
 UelrNqG2DogMz6WgWReEUSmvL7BLO7aggnEuQjIoOo8bAplUMqn1qxBnBAlwKhanzKvr
 7nme9tDTAppqE+DsJuRc0elUbNScDqec2rSWmVtFF846DPbWW5K/7+cwdZdmy+zCGosx
 pcC+wRrrsLUawXskwLpVri0yMMLcMWmOmlZqaZHRJfMIhRlXILRF6js//HtFT9bq0jR0
 Z8+9LYS4FhGcw4PyWt6bhh7o8XeuU8pguk6QXJNtMgPAI9Ccwu3nyqP3fhP+vksLqIaP
 E05A==
X-Gm-Message-State: ABy/qLbjPakhveAr/8hrFJyXEuo1k0DG+Jacmwunmhjo/CHvIuOLyKM4
 EcXXQ9TXmCq35/3q0yy/Xyg=
X-Google-Smtp-Source: APBJJlFHfb0jG/WWODgMdRojw07Pd0F9ziQEPHIpWaqHWQMOzDHQ9v53Ib02LKyBkAYUj3LalcPxeA==
X-Received: by 2002:a17:903:2304:b0:1bb:4861:d39e with SMTP id
 d4-20020a170903230400b001bb4861d39emr2970299plh.12.1689977874650; 
 Fri, 21 Jul 2023 15:17:54 -0700 (PDT)
Received: from localhost ([2620:10d:c090:400::5:fbd8])
 by smtp.gmail.com with ESMTPSA id
 t11-20020a170902a5cb00b001b9dab0397bsm2339866plq.29.2023.07.21.15.17.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jul 2023 15:17:54 -0700 (PDT)
Date: Fri, 21 Jul 2023 12:17:53 -1000
From: Tejun Heo <tj@kernel.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH 12/17] cgroup/drm: Introduce weight based drm cgroup
 control
Message-ID: <ZLsEEYDFlJZwrJiV@slm.duckdns.org>
References: <20230712114605.519432-1-tvrtko.ursulin@linux.intel.com>
 <20230712114605.519432-13-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230712114605.519432-13-tvrtko.ursulin@linux.intel.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Kenny.Ho@amd.com,
 Dave Airlie <airlied@redhat.com>,
 =?iso-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Intel-gfx@lists.freedesktop.org,
 Brian Welty <brian.welty@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>,
 cgroups@vger.kernel.org, "T . J . Mercier" <tjmercier@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 12, 2023 at 12:46:00PM +0100, Tvrtko Ursulin wrote:
> +DRM scheduling soft limits
> +~~~~~~~~~~~~~~~~~~~~~~~~~~

Please don't say soft limits for this. It means something different for
memcg, so it gets really confusing. Call it "weight based CPU time control"
and maybe call the triggering points as thresholds.

Thanks.

-- 
tejun
