Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E21A1AF849F
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 01:59:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C03B10E91C;
	Thu,  3 Jul 2025 23:59:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MlhR8ljQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0F4810E1E4
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 23:59:21 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-ae360b6249fso68469666b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jul 2025 16:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751587160; x=1752191960; darn=lists.freedesktop.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dbcMoATLah7xWt4jJFpD0PqVaXukcIMzKpD0DdGk9fc=;
 b=MlhR8ljQ7p9besv6zLovQjXxsi2WQZ9+agbJytLez2BnEjxzChNceEIh8kbaPNroWM
 z2J89QFGIOqi0Gtc2iXoBTzoQHRUERMjEGvzqMskMvw9JVpW88XIdZhBSI3Qg53qpJ1Z
 EF5OT2i3f8uDQLi58UbCEfRmv1oRgg0rhhQNZ4zGCa3O5qC5ZIvTNUq59abGyTX05yQ9
 zbE9ceIbOIJl0h28di6UKXfFAMaTBp8RfGktSsIyP7Q4Z0JAUnP/Gdk3c0OCiYg9qSp5
 2ubacKceTg7aeydKKnaKdDbj0YFIsY0oY8NcwAMfiDTJndRPWDtbbJpeqv7HD+e6bTv4
 Hcrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751587160; x=1752191960;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dbcMoATLah7xWt4jJFpD0PqVaXukcIMzKpD0DdGk9fc=;
 b=mLIpEWw8g494L3Yh3dkO2Ql8/5lK/kYgujPSOpzZPzRZlSo6/eSCm5yPbRS0K8sfqa
 KC0LTyZw6IEIVivvlpkgJy4dZyB4XAE9SDSE3thQ6cKuJz2pXpESBFD+vClfuxVwx4MO
 GeHo0E+90z/+AqahMSecsRHSgB9vwxyDPwX3+2+I3JJhTj4UgbSMMUDjgynxgMqMr29m
 SrkghkNARaFSc3NnvixPYrX5HIKOHtpWf6RLUr8dfS/V0VC0ZvJTfqCROYpyeapoeTk8
 l3AbAHiYmRzlNAwLshodRkjBoDsvq7/dQe9+VuraDXD86Y0m6LEL93NTme+Q+nR0lLVP
 8Cqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9kK83Z5T/Nm3yTsxs9GI2kEduV5P4wTpgoM4ul2h+rzHHnMq2LBa8VWOHPNk0UvXIQzE1Z3ySNAM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyuDhyn7cn82f36vmvOzVCT6SOaDc/BCyPT0zNyQzTKw9UMZYR6
 qrHcrYizI+GSFvR9t7LWpDuffybGcxkJSNx+B0grY/7ToqGotIQuZYx7Wyx9/8f131Z4BhAZNAH
 +rrjCpICr5pCjwcwiwRZ1ykZqJkriXz0=
X-Gm-Gg: ASbGncvabQhh0Xg35RyN5D6bPo5MPWGLLcrIwCx+nw1zShrrxOFXIMOx7IuWYgDv0g9
 h8oLzC2bDXT0AXEl5inzbkJdwEGCMy8hmBzOIKya78LaDOfezb4LCwqgkMb2dN+8Kjtwhs9q4Zr
 Zsa1VoGRBcsQ2TDLXeiIwXtYqKGGUnaq1Er5GbMPKDKg==
X-Google-Smtp-Source: AGHT+IGjytOVpP7rVo15QkF6EeB3cO9Nc930BrI7m2AILwxHbQos/NSdiAB9kY1YYmMl1CnD2c1vlPWIuY68wmKWNVg=
X-Received: by 2002:a17:907:da1:b0:ae3:6cc8:e431 with SMTP id
 a640c23a62f3a-ae3fbe2297fmr43905966b.57.1751587160197; Thu, 03 Jul 2025
 16:59:20 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 4 Jul 2025 09:59:08 +1000
X-Gm-Features: Ac12FXwcW3KCTQcHgvP_7iMbELq7vl57lGcAWMXugriwFZC7pglzDjT4afcZ4DQ
Message-ID: <CAPM=9tz0rQP8VZWKWyuF8kUMqRScxqoa6aVdwWw9=5yYxyYQ2Q@mail.gmail.com>
Subject: possible amdgpu_task_info reference leak
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

In this commit :
a72002cb181f350734108228b24c5d10d358f95a
Author: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
Date:   Tue Jun 17 09:49:49 2025 -0300

    drm/amdgpu: Make use of drm_wedge_task_info



@@ -164,13 +165,15 @@ static enum drm_gpu_sched_stat
amdgpu_job_timedout(struct drm_sched_job *s_job)
                        if (amdgpu_ring_sched_ready(ring))
                                drm_sched_start(&ring->sched, 0);
                        dev_err(adev->dev, "Ring %s reset
succeeded\n", ring->sched.name);
-                       drm_dev_wedged_event(adev_to_drm(adev),
DRM_WEDGE_RECOVERY_NONE, NULL);
+                       drm_dev_wedged_event(adev_to_drm(adev),
DRM_WEDGE_RECOVERY_NONE, info);
                        goto exit;
                }
                dev_err(adev->dev, "Ring %s reset failure\n", ring->sched.n=
ame);
        }
        dma_fence_set_error(&s_job->s_fence->finished, -ETIME);

+       amdgpu_vm_put_task_info(ti);
+
        if (amdgpu_device_should_recover_gpu(ring->adev)) {
                struct amdgpu_reset_context reset_context;
                memset(&reset_context, 0, sizeof(reset_context));


Doesn't the goto_exit bypass the amdgpu_vm_put_task_info? and cause a
reference leak at least?

Dave.
