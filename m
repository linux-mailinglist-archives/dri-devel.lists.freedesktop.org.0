Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AFA76FD46
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 11:29:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 759B810E6BF;
	Fri,  4 Aug 2023 09:29:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E007810E6BF
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 09:29:20 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2b9a2033978so29763931fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 02:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691141359; x=1691746159;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Dnn3YjqK0gYS2d3cBmIF54I2GW/nHeks1WnBWbPsCqA=;
 b=LSoxPSq6PqUSUyUwQor3UO7ej1NFQ1w4NXKg0U9UgkTQuNs7Wc5AVke2/McAMrWT+4
 /DtkaJ4zVQshHs/utXvU0hppM4B988NMvyyIH3sk1n0Vq4mrLnt8dQ4oa8goPba7vExa
 vx2slalXu7r2P1NFZ2LlJ1BDujQihTqO19ZhgRyF1Vb6ZVovAFIEI6Ujb6w+vQBiKb2Z
 urt5JNTo3bq83k1jYouWXynVOT80QpAKIYfO4qigVB7bRH8siqUZLzd3wXljoqbGC3R7
 aL43JH45KlCDdUmPkbCb2oNJ4Ea3wLh1ubtIOAj/QGX/sNXtlNGZd5JADjXRL/Thgpe9
 23CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691141359; x=1691746159;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Dnn3YjqK0gYS2d3cBmIF54I2GW/nHeks1WnBWbPsCqA=;
 b=IxIJoNRtJI7yybsYnITKn6J9idsZonnk1TQ5AKqR7YSui3u6LOmaJL4YsAlYlrLgeb
 wvFxldHbkgFDksI7Zd9WV5mhQLHUh5VGjcADUqEgviAi3Gr2BvVW/Wov11LI52FoGLk5
 IkfDMGdG61nwtySfCPkfaweyGMvzX/jWK7kaBKUDGrEWS/puCu4inUq69siMnr9qt0Y9
 Sgc+IX9nJ+YeSLu13VDrrNQs1OQCrbIDMN1ggWdVIiubMwAf4n/bYE0/gh0hk46PqJU7
 iEIN9rJmXBfI6U6D988PUsff0V7ftsNmadkKbFnmx/p7n3GrU43ZhdHi1S5AOiMM7S6a
 CvCw==
X-Gm-Message-State: AOJu0YyDKY9HpGHqd7Xv29KyMiyzPEOSzq/Q5BpJEVVn2KVEm+0WLxRB
 /+TURT0yuiXdDiGpA5/Ub1ZNbg==
X-Google-Smtp-Source: AGHT+IEHiVe4K3MqLOjm+DVCGQ3jTlV9XKFXZSedQKFKvv1j9d815up6QRwY2QCphNtBD8WAdX0iUw==
X-Received: by 2002:a05:651c:102a:b0:2b6:fc60:776f with SMTP id
 w10-20020a05651c102a00b002b6fc60776fmr972258ljm.30.1691141359043; 
 Fri, 04 Aug 2023 02:29:19 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 b13-20020a05600c11cd00b003fba6709c68sm1877070wmi.47.2023.08.04.02.29.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 02:29:18 -0700 (PDT)
Date: Fri, 4 Aug 2023 12:29:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 4/9] PM / QoS: Decouple request alloc from
 dev_pm_qos_mtx
Message-ID: <1085ed08-ac8f-4847-b232-0dcea6a61d77@kadam.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230803220202.78036-5-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Len Brown <len.brown@intel.com>,
 lkp@intel.com, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-arm-msm@vger.kernel.org,
 "open list:POWER MANAGEMENT CORE" <linux-pm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pavel Machek <pavel@ucw.cz>,
 oe-kbuild-all@lists.linux.dev, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Clark/PM-devfreq-Drop-unneed-locking-to-appease-lockdep/20230804-060505
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230803220202.78036-5-robdclark%40gmail.com
patch subject: [PATCH v3 4/9] PM / QoS: Decouple request alloc from dev_pm_qos_mtx
config: i386-randconfig-m021-20230730 (https://download.01.org/0day-ci/archive/20230804/202308041725.Npwswh0L-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308041725.Npwswh0L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202308041725.Npwswh0L-lkp@intel.com/

smatch warnings:
drivers/base/power/qos.c:973 dev_pm_qos_update_user_latency_tolerance() warn: possible memory leak of 'req'

vim +/req +973 drivers/base/power/qos.c

2d984ad132a87c Rafael J. Wysocki 2014-02-11  923  int dev_pm_qos_update_user_latency_tolerance(struct device *dev, s32 val)
2d984ad132a87c Rafael J. Wysocki 2014-02-11  924  {
b5ac35ff4296f7 Rob Clark         2023-08-03  925  	struct dev_pm_qos_request *req = NULL;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  926  	int ret;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  927  
211fb32e3a0547 Rob Clark         2023-08-03  928  	ret = dev_pm_qos_constraints_ensure_allocated(dev);
211fb32e3a0547 Rob Clark         2023-08-03  929  	if (ret)
211fb32e3a0547 Rob Clark         2023-08-03  930  		return ret;
211fb32e3a0547 Rob Clark         2023-08-03  931  
b5ac35ff4296f7 Rob Clark         2023-08-03  932  	if (!dev->power.qos->latency_tolerance_req)
b5ac35ff4296f7 Rob Clark         2023-08-03  933  		req = kzalloc(sizeof(*req), GFP_KERNEL);
b5ac35ff4296f7 Rob Clark         2023-08-03  934  
2d984ad132a87c Rafael J. Wysocki 2014-02-11  935  	mutex_lock(&dev_pm_qos_mtx);
2d984ad132a87c Rafael J. Wysocki 2014-02-11  936  
211fb32e3a0547 Rob Clark         2023-08-03  937  	if (!dev->power.qos->latency_tolerance_req) {
2d984ad132a87c Rafael J. Wysocki 2014-02-11  938  		if (val < 0) {
80a6f7c79b7822 Andrew Lutomirski 2016-11-29  939  			if (val == PM_QOS_LATENCY_TOLERANCE_NO_CONSTRAINT)
80a6f7c79b7822 Andrew Lutomirski 2016-11-29  940  				ret = 0;
80a6f7c79b7822 Andrew Lutomirski 2016-11-29  941  			else
2d984ad132a87c Rafael J. Wysocki 2014-02-11  942  				ret = -EINVAL;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  943  			goto out;

kfree(req);?

2d984ad132a87c Rafael J. Wysocki 2014-02-11  944  		}
2d984ad132a87c Rafael J. Wysocki 2014-02-11  945  		if (!req) {
2d984ad132a87c Rafael J. Wysocki 2014-02-11  946  			ret = -ENOMEM;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  947  			goto out;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  948  		}
2d984ad132a87c Rafael J. Wysocki 2014-02-11  949  		ret = __dev_pm_qos_add_request(dev, req, DEV_PM_QOS_LATENCY_TOLERANCE, val);
2d984ad132a87c Rafael J. Wysocki 2014-02-11  950  		if (ret < 0) {
2d984ad132a87c Rafael J. Wysocki 2014-02-11  951  			kfree(req);
2d984ad132a87c Rafael J. Wysocki 2014-02-11  952  			goto out;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  953  		}
2d984ad132a87c Rafael J. Wysocki 2014-02-11  954  		dev->power.qos->latency_tolerance_req = req;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  955  	} else {
b5ac35ff4296f7 Rob Clark         2023-08-03  956  		/*
b5ac35ff4296f7 Rob Clark         2023-08-03  957  		 * If we raced with another thread to allocate the request,
b5ac35ff4296f7 Rob Clark         2023-08-03  958  		 * simply free the redundant allocation and move on.
b5ac35ff4296f7 Rob Clark         2023-08-03  959  		 */
b5ac35ff4296f7 Rob Clark         2023-08-03  960  		if (req)
b5ac35ff4296f7 Rob Clark         2023-08-03  961  			kfree(req);
b5ac35ff4296f7 Rob Clark         2023-08-03  962  
2d984ad132a87c Rafael J. Wysocki 2014-02-11  963  		if (val < 0) {
2d984ad132a87c Rafael J. Wysocki 2014-02-11  964  			__dev_pm_qos_drop_user_request(dev, DEV_PM_QOS_LATENCY_TOLERANCE);
2d984ad132a87c Rafael J. Wysocki 2014-02-11  965  			ret = 0;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  966  		} else {
2d984ad132a87c Rafael J. Wysocki 2014-02-11  967  			ret = __dev_pm_qos_update_request(dev->power.qos->latency_tolerance_req, val);
2d984ad132a87c Rafael J. Wysocki 2014-02-11  968  		}
2d984ad132a87c Rafael J. Wysocki 2014-02-11  969  	}
2d984ad132a87c Rafael J. Wysocki 2014-02-11  970  
2d984ad132a87c Rafael J. Wysocki 2014-02-11  971   out:
2d984ad132a87c Rafael J. Wysocki 2014-02-11  972  	mutex_unlock(&dev_pm_qos_mtx);
2d984ad132a87c Rafael J. Wysocki 2014-02-11 @973  	return ret;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  974  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

