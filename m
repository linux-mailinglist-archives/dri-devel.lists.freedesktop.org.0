Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF67025992F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 18:37:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 843816E895;
	Tue,  1 Sep 2020 16:37:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5062A6E877
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 16:21:21 +0000 (UTC)
Received: from mail-pg1-f197.google.com ([209.85.215.197])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1kD927-0001Em-H0
 for dri-devel@lists.freedesktop.org; Tue, 01 Sep 2020 16:21:19 +0000
Received: by mail-pg1-f197.google.com with SMTP id s4so989812pgk.17
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Sep 2020 09:21:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=M1ucaaXEqLaYyegydhmBtJEMg3J2N7pNOFACBJtyqyE=;
 b=d7Cmtfi7nns0xgu7itQTWWT3xAZIee3NNiSGXQBCzjl4qw+4jrXYYN0rnfjCjzZOMH
 AVwihYuopB8H7ADyLAqpqJSG3/8CaJkBVKdvXRVvSPKpW/2FLWutY10KwvP+Tp5AdFM9
 yKILGy9zVcnJVIdjzhY3YV8gxyGQcot8t4DgiLbbOFsdjZuFsKLXGvJscifoSL3I0FNd
 ZNglG5ha6tq6SjR4qIsR2EihLgRp7Jph27LfP5lIUGlBtGvvrV/etSnlgEUFzP4heyO3
 P6mpwvvZJ7N/HbbAQw1tzCrSbrjFy4xt8XgeLT+lhlut5RwmCyYr3DN4u1GErBYS8VFl
 496w==
X-Gm-Message-State: AOAM533HAjXt0vhyrrbu4GQjdcaJ6BAiOSwO5sSPORna+RCfuy8yWMGi
 qBkwNm4hMYfRpJXQN6+XY6Tzi+UJISGGe/qdw8gVWCs8ZI7qvKmRLJ1I0RZ6a2z22DPdGiZckPg
 mSo1WhME31gmw24EfCpRvd7xgKNdMgduXDoymNqfwm3fLDg==
X-Received: by 2002:a62:1984:: with SMTP id 126mr2627013pfz.17.1598977277995; 
 Tue, 01 Sep 2020 09:21:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxa0+42GmP6pF1wdvHz6yYznqkmm0P7FIb3ONi3y0RdmVspKXbkV75mnmN6c9CKFyINWBSMeA==
X-Received: by 2002:a62:1984:: with SMTP id 126mr2626970pfz.17.1598977277628; 
 Tue, 01 Sep 2020 09:21:17 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net.
 [220.133.187.190])
 by smtp.gmail.com with ESMTPSA id x188sm2433185pfb.37.2020.09.01.09.20.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 01 Sep 2020 09:21:07 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH] drm/radeon: Reset ASIC if suspend is not managed by
 platform firmware
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <CADnq5_MXs-=BpMrYVudhHPjTpgs1XUE=GEujpp5AeYy5vWS=YA@mail.gmail.com>
Date: Wed, 2 Sep 2020 00:20:56 +0800
Message-Id: <3269C99F-2349-4004-8B5F-31A2297A5043@canonical.com>
References: <20200901063227.6057-1-kai.heng.feng@canonical.com>
 <CADnq5_MXs-=BpMrYVudhHPjTpgs1XUE=GEujpp5AeYy5vWS=YA@mail.gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
X-Mailman-Approved-At: Tue, 01 Sep 2020 16:37:23 +0000
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> On Sep 1, 2020, at 22:19, Alex Deucher <alexdeucher@gmail.com> wrote:
> 
> On Tue, Sep 1, 2020 at 3:32 AM Kai-Heng Feng
> <kai.heng.feng@canonical.com> wrote:
>> 
>> Suspend with s2idle or by the following steps cause screen frozen:
>> # echo devices > /sys/power/pm_test
>> # echo freeze > /sys/power/mem
>> 
>> [  289.625461] [drm:uvd_v1_0_ib_test [radeon]] *ERROR* radeon: fence wait timed out.
>> [  289.625494] [drm:radeon_ib_ring_tests [radeon]] *ERROR* radeon: failed testing IB on ring 5 (-110).
>> 
>> The issue doesn't happen on traditional S3, probably because firmware or
>> hardware provides extra power management.
>> 
>> Inspired by Daniel Drake's patch [1] on amdgpu, using a similar approach
>> can fix the issue.
> 
> It doesn't actually fix the issue.  The device is never powered down
> so you are using more power than you would if you did not suspend in
> the first place.  The reset just works around the fact that the device
> is never powered down.

So how do we properly suspend/resume the device without help from platform firmware?

Kai-Heng

> 
> Alex
> 
>> 
>> [1] https://patchwork.freedesktop.org/patch/335839/
>> 
>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>> ---
>> drivers/gpu/drm/radeon/radeon_device.c | 3 +++
>> 1 file changed, 3 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
>> index 266e3cbbd09b..df823b9ad79f 100644
>> --- a/drivers/gpu/drm/radeon/radeon_device.c
>> +++ b/drivers/gpu/drm/radeon/radeon_device.c
>> @@ -33,6 +33,7 @@
>> #include <linux/slab.h>
>> #include <linux/vga_switcheroo.h>
>> #include <linux/vgaarb.h>
>> +#include <linux/suspend.h>
>> 
>> #include <drm/drm_cache.h>
>> #include <drm/drm_crtc_helper.h>
>> @@ -1643,6 +1644,8 @@ int radeon_suspend_kms(struct drm_device *dev, bool suspend,
>>                rdev->asic->asic_reset(rdev, true);
>>                pci_restore_state(dev->pdev);
>>        } else if (suspend) {
>> +               if (pm_suspend_no_platform())
>> +                       rdev->asic->asic_reset(rdev, true);
>>                /* Shut down the device */
>>                pci_disable_device(dev->pdev);
>>                pci_set_power_state(dev->pdev, PCI_D3hot);
>> --
>> 2.17.1
>> 
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
