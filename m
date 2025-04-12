Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2717A86DD5
	for <lists+dri-devel@lfdr.de>; Sat, 12 Apr 2025 16:40:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D07F210E2BA;
	Sat, 12 Apr 2025 14:40:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rNt7A+RU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C6510E2C8
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Apr 2025 14:40:03 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43cf3192f3bso30157415e9.1
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Apr 2025 07:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744468802; x=1745073602; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cswGh3MBDvLrz7sPiMH+U5xgTD0yu6/wLQBlOuX6Iwc=;
 b=rNt7A+RUDent+mcdJ7M7Uf5DwS9pn40fyGJGOnx/fskZ/v/7KVSOBncs8bU/klw19a
 zl5POsRBNV3Nr+Iu3CX0Wt1WhG7lLDfDG88JcHfPWXV/JMjnQ7/1+STJjNJSDYqF/bzj
 vO4/w2gDaIB4Bve53X3Mg6VLvmP2IdIVHwux6krVYfuL7bDMPx74q0y/sqvCL3f03M71
 5+d9i0QneD2fk7QsepcFrlcutqucfQNQAUpFz9QBlJlnAZgDQVj2oaY0f7NHcGN5xctX
 inR5SCE9+4PgFGLRO/aLkCJthQjF+Yi15FBxxcfoTHUTjoJ866CeHXfG3lIRl/lXTY+u
 hggQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744468802; x=1745073602;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cswGh3MBDvLrz7sPiMH+U5xgTD0yu6/wLQBlOuX6Iwc=;
 b=gvaSVxvtG8fhoIRkdNRpibiuS/ts4Pn95rCQsXeytiHQJTYKu9Ss8n1yTs+CAhPSGI
 gtF7Jfo2b6ulNjmDO4FjH/RkZCD5xINUbBJOHQBSXLsD838dETEznh/Igl3oGUVXr+R2
 a2ns/Di8LRYJzUB2wWlvwd4IA1hSZZ3nF/jiTFwGgoMBoo9Uil6T4Do3xH//aMR3UOjD
 DAbeyFkuvuJncQ+ei4/sevk8zwheSuCxEa5d+9vMOcD6aYtHE6HPA89rgdHeDrH4WBtB
 h5PARfgBc5fyTugjAzZJbfMuD008kuLUbwVtvu3epdmn+uXfDhGVcNjS+nAfOblHwZgv
 1puA==
X-Gm-Message-State: AOJu0YwlkF+sLn7FdrNP+IHxgUpKn96cBKxO9Jxfud3W8G/d28ybfOr7
 AA4oEfZh12NKEVkV7xI3UtoX77FO2aiphYK9sW+i1839SVXd1u4lUCFDRaMGqdkQ+c8bkX9jGdT
 b
X-Gm-Gg: ASbGncvYB5mb5kCysX2+88L47j9KJVPTOCIQr8QspEMiZr92SGXLege6kNvKHt15Bwd
 1n+G917kp6YRolBd9CyKtggmf8Ub/BDKESabXBi9Tpjo9wWLmDgdkK/SVVKh18iGhvCBTGik+Ej
 47Iwm5XQE7C6iASJRmjnMQgYsTYtyO7jfHLbJ0JixcdNuPbJvU47Rhk/3BFp/O4RH07wPbqv0zp
 gPFtBx2qE9HlyVqI5GnqIQx4Z8eMJBMogic+58H7JoxhgXcVvA7I07Y1jZLoJTg8dJfGp/9lTCQ
 ivukcogKSPmheE8nsD1i+qZbCeYp8O8W8Qb69CIsYxSjUg==
X-Google-Smtp-Source: AGHT+IEs/cbFKcUMtPaP5lR8A359ER4Zhsfq4r7XaP1MNqyrB0FjcUM3LHbDfpcmG9VxVNKgbcFjSg==
X-Received: by 2002:a05:600c:46ca:b0:43d:aed:f7de with SMTP id
 5b1f17b1804b1-43f3a9ab456mr50264205e9.21.1744468802042; 
 Sat, 12 Apr 2025 07:40:02 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-43f2075fc8esm122548715e9.30.2025.04.12.07.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Apr 2025 07:40:01 -0700 (PDT)
Date: Sat, 12 Apr 2025 17:39:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org
Subject: [bug report] drm/panthor: Call panthor_gpu_coherency_init() after PM
 resume()
Message-ID: <6cb91960-1bb6-43d5-aec3-ed6048e8613e@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Boris Brezillon,

Commit 7d5a3b22f5b5 ("drm/panthor: Call panthor_gpu_coherency_init()
after PM resume()") from Apr 4, 2025 (linux-next), leads to the
following Smatch static checker warning:

	drivers/gpu/drm/panthor/panthor_device.c:248 panthor_device_init()
	warn: missing unwind goto?

drivers/gpu/drm/panthor/panthor_device.c
    167 int panthor_device_init(struct panthor_device *ptdev)
    168 {
    169         u32 *dummy_page_virt;
    170         struct resource *res;
    171         struct page *p;
    172         int ret;
    173 
    174         init_completion(&ptdev->unplug.done);
    175         ret = drmm_mutex_init(&ptdev->base, &ptdev->unplug.lock);
    176         if (ret)
    177                 return ret;
    178 
    179         ret = drmm_mutex_init(&ptdev->base, &ptdev->pm.mmio_lock);
    180         if (ret)
    181                 return ret;
    182 
    183         atomic_set(&ptdev->pm.state, PANTHOR_DEVICE_PM_STATE_SUSPENDED);
    184         p = alloc_page(GFP_KERNEL | __GFP_ZERO);
    185         if (!p)
    186                 return -ENOMEM;
    187 
    188         ptdev->pm.dummy_latest_flush = p;
    189         dummy_page_virt = page_address(p);
    190         ret = drmm_add_action_or_reset(&ptdev->base, panthor_device_free_page,
    191                                        ptdev->pm.dummy_latest_flush);
    192         if (ret)
    193                 return ret;
    194 
    195         /*
    196          * Set the dummy page holding the latest flush to 1. This will cause the
    197          * flush to avoided as we know it isn't necessary if the submission
    198          * happens while the dummy page is mapped. Zero cannot be used because
    199          * that means 'always flush'.
    200          */
    201         *dummy_page_virt = 1;
    202 
    203         INIT_WORK(&ptdev->reset.work, panthor_device_reset_work);
    204         ptdev->reset.wq = alloc_ordered_workqueue("panthor-reset-wq", 0);
    205         if (!ptdev->reset.wq)
    206                 return -ENOMEM;
    207 
    208         ret = drmm_add_action_or_reset(&ptdev->base, panthor_device_reset_cleanup, NULL);
    209         if (ret)
    210                 return ret;
    211 
    212         ret = panthor_clk_init(ptdev);
    213         if (ret)
    214                 return ret;
    215 
    216         ret = panthor_devfreq_init(ptdev);
    217         if (ret)
    218                 return ret;
    219 
    220         ptdev->iomem = devm_platform_get_and_ioremap_resource(to_platform_device(ptdev->base.dev),
    221                                                               0, &res);
    222         if (IS_ERR(ptdev->iomem))
    223                 return PTR_ERR(ptdev->iomem);
    224 
    225         ptdev->phys_addr = res->start;
    226 
    227         ret = devm_pm_runtime_enable(ptdev->base.dev);
    228         if (ret)
    229                 return ret;
    230 
    231         ret = pm_runtime_resume_and_get(ptdev->base.dev);
    232         if (ret)
    233                 return ret;
    234 
    235         /* If PM is disabled, we need to call panthor_device_resume() manually. */
    236         if (!IS_ENABLED(CONFIG_PM)) {
    237                 ret = panthor_device_resume(ptdev->base.dev);
    238                 if (ret)
    239                         return ret;
    240         }
    241 
    242         ret = panthor_gpu_init(ptdev);
    243         if (ret)
    244                 goto err_rpm_put;
    245 
    246         ret = panthor_gpu_coherency_init(ptdev);
    247         if (ret)
--> 248                 return ret;
                        ^^^^^^^^^^^
Missing cleanup?

    249 
    250         ret = panthor_mmu_init(ptdev);
    251         if (ret)
    252                 goto err_unplug_gpu;
    253 
    254         ret = panthor_fw_init(ptdev);
    255         if (ret)
    256                 goto err_unplug_mmu;
    257 
    258         ret = panthor_sched_init(ptdev);
    259         if (ret)
    260                 goto err_unplug_fw;
    261 
    262         /* ~3 frames */
    263         pm_runtime_set_autosuspend_delay(ptdev->base.dev, 50);
    264         pm_runtime_use_autosuspend(ptdev->base.dev);
    265 
    266         ret = drm_dev_register(&ptdev->base, 0);
    267         if (ret)
    268                 goto err_disable_autosuspend;
    269 
    270         pm_runtime_put_autosuspend(ptdev->base.dev);
    271         return 0;
    272 
    273 err_disable_autosuspend:
    274         pm_runtime_dont_use_autosuspend(ptdev->base.dev);
    275         panthor_sched_unplug(ptdev);
    276 
    277 err_unplug_fw:
    278         panthor_fw_unplug(ptdev);
    279 
    280 err_unplug_mmu:
    281         panthor_mmu_unplug(ptdev);
    282 
    283 err_unplug_gpu:
    284         panthor_gpu_unplug(ptdev);
    285 
    286 err_rpm_put:
    287         pm_runtime_put_sync_suspend(ptdev->base.dev);
    288         return ret;
    289 }

regards,
dan carpenter
