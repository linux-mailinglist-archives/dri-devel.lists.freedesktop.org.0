Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A406E74B8
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 10:12:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEEF010E04F;
	Wed, 19 Apr 2023 08:12:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB4F710E02E;
 Wed, 19 Apr 2023 08:12:28 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id xi5so79421818ejb.13;
 Wed, 19 Apr 2023 01:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681891947; x=1684483947;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yY9AEq3y7VvGgcqqO6MfF2ipqBzjrCfnXO8ukTbyFU8=;
 b=f5AQEK1F0tgB6Hh9ohTjCPoYx2vPeVD4+CsmcdGhKgDOPwJPlBc36U4Y9Q0yfduvxB
 8QaLv4NL34J5WDx/Jr1OVlMDeqxHNQEWQeqruBDrmeQVWEm2u4lyz5xjL8NI1m84fzGx
 x0NhoHMR2Qt4iQcagf+3V3vJpI4K4PcMMi35GCABM1ZiQ2GnmehovzVwgJSV07QibpRr
 lTJA1zg1idGgVbjvi6SBJER0tO2XTXCMj6rhe5oDpc0oogAsGa10uDZE0nh8FeeMztP6
 kqgNTdkTQ+WNAcXTpKXaHoitW3Y/r1WRIXqloRr8vUztAJ1pPpn20jWIOb/o4QgDYBiE
 pxeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681891947; x=1684483947;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yY9AEq3y7VvGgcqqO6MfF2ipqBzjrCfnXO8ukTbyFU8=;
 b=aLPYpJcjJPulrlH4w4HavNIH0cjLGXJP8KtIEEynDcqm/Yz5ibFJ0OQVvTAvJVbJAM
 sDdx0m8iVguydtmsrnFRDyg5HZpdrASSgVjVbBk9AUdMIErB1MVTxyYR2RPdIUgFH0Xc
 nq7BG/IxWIufhWkQ5qL0HPQogvy1Y721pIMx8nsXh0TRRqaurqBTtTgIig/B7HZtL9RE
 P/JmaF7/NKJ5HTszosAuJ7R7H9EO1UQ58lHCkKRUp++0JERPyfkMrwXHuL1heOROBbNf
 T0w3bJMHOtybj+d7X3V+sT6Yo2NYwK8Mwrliu/PVrQdDDxJ+bhAtnER+5qovdjnPjMqp
 ji7g==
X-Gm-Message-State: AAQBX9cEBhbaiT52bYkROCzSkAvafN/nz80H0OJEerdtslTpPQcZmLWk
 HCsbh3aZuup5YWdFQqNBS5U=
X-Google-Smtp-Source: AKy350a3xCiCD8XH+oQU7JVcXkAeSQBISUQ06u8DEGRTi26Qx7Zordbx89+/c+VNIwZB6UE8En7pSQ==
X-Received: by 2002:a17:906:ce2e:b0:94b:869b:267 with SMTP id
 sd14-20020a170906ce2e00b0094b869b0267mr14222855ejb.28.1681891946935; 
 Wed, 19 Apr 2023 01:12:26 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:6273:6c76:9697:9b4c?
 ([2a02:908:1256:79a0:6273:6c76:9697:9b4c])
 by smtp.gmail.com with ESMTPSA id
 b16-20020a1709063f9000b0094a962da55dsm9017790ejj.195.2023.04.19.01.12.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 01:12:26 -0700 (PDT)
Message-ID: <10b2570f-a297-d236-fa7b-2e001a4dff12@gmail.com>
Date: Wed, 19 Apr 2023 10:12:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: BUG: KASAN: null-ptr-deref in drm_sched_job_cleanup+0x96/0x290
 [gpu_sched]
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <Christian.Koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <CABXGCsPZxgpFzAVN=eFXu0WV+Jk0vB4rv4p+Jt31C841LcqV=A@mail.gmail.com>
 <CABXGCsO0sST8+MvQs=T1JP49ogRsaHPT9gMQZGJ3dY7v3m0H8g@mail.gmail.com>
 <CABXGCsOTEpJG_0NWdGXRvcXQ4iTav6AUJm-U4SQb-vVzjoL6rA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CABXGCsOTEpJG_0NWdGXRvcXQ4iTav6AUJm-U4SQb-vVzjoL6rA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Am 19.04.23 um 09:00 schrieb Mikhail Gavrilov:
> Christian?

I'm already looking into this, but can't figure out why we run into 
problems here.

What happens is that a CS is aborted without sending the job to the 
scheduler and in this case the cleanup function doesn't seem to work.

Christian.

>
> ❯ /usr/src/kernels/6.3.0-0.rc7.56.fc39.x86_64/scripts/faddr2line
> /lib/debug/lib/modules/6.3.0-0.rc7.56.fc39.x86_64/kernel/drivers/gpu/drm/scheduler/gpu-sched.ko.debug
> drm_sched_job_cleanup+0x9a
> drm_sched_job_cleanup+0x9a/0x130:
> drm_sched_job_cleanup at
> /usr/src/debug/kernel-6.3-rc7/linux-6.3.0-0.rc7.56.fc39.x86_64/drivers/gpu/drm/scheduler/sched_main.c:808
> (discriminator 3)
>
> ❯ cat -s -n /usr/src/debug/kernel-6.3-rc7/linux-6.3.0-0.rc7.56.fc39.x86_64/drivers/gpu/drm/scheduler/sched_main.c
> | head -818 | tail -20
>     799 /* drm_sched_job_arm() has been called */
>     800 dma_fence_put(&job->s_fence->finished);
>     801 } else {
>     802 /* aborted job before committing to run it */
>     803 drm_sched_fence_free(job->s_fence);
>     804 }
>     805
>     806 job->s_fence = NULL;
>     807
>     808 xa_for_each(&job->dependencies, index, fence) {
>     809 dma_fence_put(fence);
>     810 }
>     811 xa_destroy(&job->dependencies);
>     812
>     813 }
>     814 EXPORT_SYMBOL(drm_sched_job_cleanup);
>     815
>     816 /**
>     817 * drm_sched_ready - is the scheduler ready
>     818 *
>
>> git blame drivers/gpu/drm/scheduler/sched_main.c -L 800,819
> dbe48d030b285 drivers/gpu/drm/scheduler/sched_main.c        (Daniel
> Vetter   2021-08-17 10:49:16 +0200 800)
> dma_fence_put(&job->s_fence->finished);
> dbe48d030b285 drivers/gpu/drm/scheduler/sched_main.c        (Daniel
> Vetter   2021-08-17 10:49:16 +0200 801)     } else {
> dbe48d030b285 drivers/gpu/drm/scheduler/sched_main.c        (Daniel
> Vetter   2021-08-17 10:49:16 +0200 802)             /* aborted job
> before committing to run it */
> d4c16733e7960 drivers/gpu/drm/scheduler/sched_main.c        (Boris
> Brezillon 2021-09-03 14:05:54 +0200 803)
> drm_sched_fence_free(job->s_fence);
> dbe48d030b285 drivers/gpu/drm/scheduler/sched_main.c        (Daniel
> Vetter   2021-08-17 10:49:16 +0200 804)     }
> dbe48d030b285 drivers/gpu/drm/scheduler/sched_main.c        (Daniel
> Vetter   2021-08-17 10:49:16 +0200 805)
> 26efecf955889 drivers/gpu/drm/scheduler/sched_main.c        (Sharat
> Masetty  2018-10-29 15:02:28 +0530 806)     job->s_fence = NULL;
> ebd5f74255b9f drivers/gpu/drm/scheduler/sched_main.c        (Daniel
> Vetter   2021-08-05 12:46:49 +0200 807)
> ebd5f74255b9f drivers/gpu/drm/scheduler/sched_main.c        (Daniel
> Vetter   2021-08-05 12:46:49 +0200 808)
> xa_for_each(&job->dependencies, index, fence) {
> ebd5f74255b9f drivers/gpu/drm/scheduler/sched_main.c        (Daniel
> Vetter   2021-08-05 12:46:49 +0200 809)
> dma_fence_put(fence);
> ebd5f74255b9f drivers/gpu/drm/scheduler/sched_main.c        (Daniel
> Vetter   2021-08-05 12:46:49 +0200 810)     }
> ebd5f74255b9f drivers/gpu/drm/scheduler/sched_main.c        (Daniel
> Vetter   2021-08-05 12:46:49 +0200 811)
> xa_destroy(&job->dependencies);
> ebd5f74255b9f drivers/gpu/drm/scheduler/sched_main.c        (Daniel
> Vetter   2021-08-05 12:46:49 +0200 812)
> 26efecf955889 drivers/gpu/drm/scheduler/sched_main.c        (Sharat
> Masetty  2018-10-29 15:02:28 +0530 813) }
> 26efecf955889 drivers/gpu/drm/scheduler/sched_main.c        (Sharat
> Masetty  2018-10-29 15:02:28 +0530 814)
> EXPORT_SYMBOL(drm_sched_job_cleanup);
> 26efecf955889 drivers/gpu/drm/scheduler/sched_main.c        (Sharat
> Masetty  2018-10-29 15:02:28 +0530 815)
> e688b728228b9 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c (Christian
> König 2015-08-20 17:01:01 +0200 816) /**
> 2d33948e4e00b drivers/gpu/drm/scheduler/gpu_scheduler.c     (Nayan
> Deshmukh  2018-05-29 11:23:07 +0530 817)  * drm_sched_ready - is the
> scheduler ready
> 2d33948e4e00b drivers/gpu/drm/scheduler/gpu_scheduler.c     (Nayan
> Deshmukh  2018-05-29 11:23:07 +0530 818)  *
> 2d33948e4e00b drivers/gpu/drm/scheduler/gpu_scheduler.c     (Nayan
> Deshmukh  2018-05-29 11:23:07 +0530 819)  * @sched: scheduler instance
>
> Daniel, because Christian, looks a little busy. Can you help? The git
> blame says that you are the author of code which KASAN mentions in its
> report.
> The issue is reproducible on all available AMD hardware: 6800M, 6900XT, 7900XTX.
>

