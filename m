Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF84F6C2957
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 05:53:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6791E10E03F;
	Tue, 21 Mar 2023 04:53:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1625D10E03F;
 Tue, 21 Mar 2023 04:53:39 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 i5-20020a05600c354500b003edd24054e0so3608857wmq.4; 
 Mon, 20 Mar 2023 21:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679374417;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GX92zv5VKe7ckWl7sGbnyvzQGMyhv0ppTgbomfq1PHk=;
 b=qF3P8D4CRjzvhUxLVQgRiz6W+/M1ImZhcGKi9Pa0nX1Ff6WYPi63iF4XyriDoUaYvb
 QnB3UVfLFdHHSS6XYstKNll0YwK6hb3vEAh13/HkjvahLtPX+piikYURGlt/NGF6rytO
 nq7Bbt4QUIr2WNIQC/V5JWShA/iygKlM8vouw3PhLJeDPHu9S3vLcc3iux3BvtyjfrVT
 6nt0zQBJhnkTcuy9lSpW/1Rv2qCgBBvXsUSsdrMqvy2WTIZQsOxMqnAvhhENYjQqTMcP
 M25KrjljExnmI1mbMoAG1TkTQwaBwXvm5mevcQ7qY3Q3+EgAnZOyzxDdlQKsvgYOZFcT
 /PSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679374417;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GX92zv5VKe7ckWl7sGbnyvzQGMyhv0ppTgbomfq1PHk=;
 b=z1rqAmmUjQfqkgE3unmy8s/yvJBCVWED6YjyvlOkpaR6zN2comnz+8DoAjs121pqSq
 L68vt1JJ7d7C7SOFanwpvDAmeS2bpUjHvoeVO9laAlNLUBr5pQjS+dmsE2UwzBoPkkuw
 omcuiokppwgCviVFzWMSuNzS11PTSIm6a8pugfRN8oYY6yPCBs6ANRWSPpc/jN4KdLMq
 53wSD3jZjEc4kJvkSjLwyOK/UKx5iH9pMhbtMqUmofZ4Mv+mHexLMks20nsxzcpXRptD
 tuuLWBCmQbjOP2o38h/k4qYvtV3GXOGZpeyZq6Um/KB0hTPdJp/X1gU8S+uWuDjRz6OF
 GGuw==
X-Gm-Message-State: AO0yUKV0DM0nljWGGxOOmsKfajEeGzrhujf1qppHJa+qq8DYW9cwLn/v
 kuJzbh9r2A/TXUjaozgkZMM=
X-Google-Smtp-Source: AK7set87NeoiO5ioLPK68M5XrIbeQVoFDpjKadoZoPnR87tYfA6zznLp86hd1TMPB583S2T+TthuaA==
X-Received: by 2002:a05:600c:21c7:b0:3dc:4042:5c21 with SMTP id
 x7-20020a05600c21c700b003dc40425c21mr1263182wmj.6.1679374417390; 
 Mon, 20 Mar 2023 21:53:37 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 h20-20020a1ccc14000000b003dc522dd25esm12244259wmb.30.2023.03.20.21.53.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 21:53:36 -0700 (PDT)
Date: Tue, 21 Mar 2023 07:53:32 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 18/23] PM / QoS: Decouple request alloc from
 dev_pm_qos_mtx
Message-ID: <155085b0-d2e4-4503-b75b-1a71193c2587@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230320144356.803762-19-robdclark@gmail.com>
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

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Clark/drm-msm-Pre-allocate-hw_fence/20230320-224826
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230320144356.803762-19-robdclark%40gmail.com
patch subject: [PATCH v2 18/23] PM / QoS: Decouple request alloc from dev_pm_qos_mtx
config: arm64-randconfig-m041-20230319 (https://download.01.org/0day-ci/archive/20230321/202303211207.mUCSt3CK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303211207.mUCSt3CK-lkp@intel.com/

smatch warnings:
drivers/base/power/qos.c:947 dev_pm_qos_update_user_latency_tolerance() error: uninitialized symbol 'req'.
drivers/base/power/qos.c:975 dev_pm_qos_update_user_latency_tolerance() warn: possible memory leak of 'req'

vim +/req +947 drivers/base/power/qos.c

2d984ad132a87c Rafael J. Wysocki 2014-02-11  923  int dev_pm_qos_update_user_latency_tolerance(struct device *dev, s32 val)
2d984ad132a87c Rafael J. Wysocki 2014-02-11  924  {
2d7e4629d7265d Rob Clark         2023-03-20  925  	struct dev_pm_qos_request *req = NULL;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  926  	int ret;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  927  
00dd582e52a535 Rob Clark         2023-03-20  928  	ret = dev_pm_qos_constraints_ensure_allocated(dev);
00dd582e52a535 Rob Clark         2023-03-20  929  	if (ret)
00dd582e52a535 Rob Clark         2023-03-20  930  		return ret;
00dd582e52a535 Rob Clark         2023-03-20  931  
2d7e4629d7265d Rob Clark         2023-03-20  932  	if (!dev->power.qos->latency_tolerance_req)
2d7e4629d7265d Rob Clark         2023-03-20  933  		req = kzalloc(sizeof(*req), GFP_KERNEL);
2d7e4629d7265d Rob Clark         2023-03-20  934  
2d984ad132a87c Rafael J. Wysocki 2014-02-11  935  	mutex_lock(&dev_pm_qos_mtx);
2d984ad132a87c Rafael J. Wysocki 2014-02-11  936  
00dd582e52a535 Rob Clark         2023-03-20  937  	if (!dev->power.qos->latency_tolerance_req) {
2d984ad132a87c Rafael J. Wysocki 2014-02-11  938  		struct dev_pm_qos_request *req;

This "req" shadows the ealier req.

2d984ad132a87c Rafael J. Wysocki 2014-02-11  939  
2d984ad132a87c Rafael J. Wysocki 2014-02-11  940  		if (val < 0) {
80a6f7c79b7822 Andrew Lutomirski 2016-11-29  941  			if (val == PM_QOS_LATENCY_TOLERANCE_NO_CONSTRAINT)
80a6f7c79b7822 Andrew Lutomirski 2016-11-29  942  				ret = 0;
80a6f7c79b7822 Andrew Lutomirski 2016-11-29  943  			else
2d984ad132a87c Rafael J. Wysocki 2014-02-11  944  				ret = -EINVAL;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  945  			goto out;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  946  		}
2d984ad132a87c Rafael J. Wysocki 2014-02-11 @947  		if (!req) {

So it leads to an unintialized variable and a leak.

2d984ad132a87c Rafael J. Wysocki 2014-02-11  948  			ret = -ENOMEM;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  949  			goto out;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  950  		}
2d984ad132a87c Rafael J. Wysocki 2014-02-11  951  		ret = __dev_pm_qos_add_request(dev, req, DEV_PM_QOS_LATENCY_TOLERANCE, val);
2d984ad132a87c Rafael J. Wysocki 2014-02-11  952  		if (ret < 0) {
2d984ad132a87c Rafael J. Wysocki 2014-02-11  953  			kfree(req);
2d984ad132a87c Rafael J. Wysocki 2014-02-11  954  			goto out;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  955  		}
2d984ad132a87c Rafael J. Wysocki 2014-02-11  956  		dev->power.qos->latency_tolerance_req = req;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  957  	} else {
2d7e4629d7265d Rob Clark         2023-03-20  958  		/*
2d7e4629d7265d Rob Clark         2023-03-20  959  		 * If we raced with another thread to allocate the request,
2d7e4629d7265d Rob Clark         2023-03-20  960  		 * simply free the redundant allocation and move on.
2d7e4629d7265d Rob Clark         2023-03-20  961  		 */
2d7e4629d7265d Rob Clark         2023-03-20  962  		if (req)
2d7e4629d7265d Rob Clark         2023-03-20  963  			kfree(req);
2d7e4629d7265d Rob Clark         2023-03-20  964  
2d984ad132a87c Rafael J. Wysocki 2014-02-11  965  		if (val < 0) {
2d984ad132a87c Rafael J. Wysocki 2014-02-11  966  			__dev_pm_qos_drop_user_request(dev, DEV_PM_QOS_LATENCY_TOLERANCE);
2d984ad132a87c Rafael J. Wysocki 2014-02-11  967  			ret = 0;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  968  		} else {
2d984ad132a87c Rafael J. Wysocki 2014-02-11  969  			ret = __dev_pm_qos_update_request(dev->power.qos->latency_tolerance_req, val);
2d984ad132a87c Rafael J. Wysocki 2014-02-11  970  		}
2d984ad132a87c Rafael J. Wysocki 2014-02-11  971  	}
2d984ad132a87c Rafael J. Wysocki 2014-02-11  972  
2d984ad132a87c Rafael J. Wysocki 2014-02-11  973   out:
2d984ad132a87c Rafael J. Wysocki 2014-02-11  974  	mutex_unlock(&dev_pm_qos_mtx);
2d984ad132a87c Rafael J. Wysocki 2014-02-11 @975  	return ret;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  976  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

