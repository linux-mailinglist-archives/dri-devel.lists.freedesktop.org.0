Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D483D1F5C6D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 22:06:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A35A66E857;
	Wed, 10 Jun 2020 20:06:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB5696E857
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jun 2020 20:06:28 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id a127so1570342pfa.12
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jun 2020 13:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=M0nS0hVmjoOe8HNSSELnVNDBD2t7CGyEv8tn8aZEMuA=;
 b=p22GdhYOV0R2H8UhlY8sBgF84+2WiKlmN0w7r21WtJPRm1JNH15eMxvtgvwu7XDlcz
 1edo6vY1ojAC3kXdQkOWpTsi1YCyRHYnoHDmFLplGV+qzUMhotyaHSrK/xWuM1kSp7l1
 77O0+GeqjcI6q/6yY/tMsNIviuyvVLk1OoX4AwIUex1xvs42DRKOL5bFJKl/nH2r6JcI
 Gd/r45GAkRuylDajTFbEoehyoQAhE7VxsQIXKuUAvzzw83FJXqulV0+KcRj90px/bUtk
 ekHeImreIn27gRctNZXeLG8PxWjQ+lQ8mB/a4/TmLDAzY4OxtMXXvfSB/nlQHjuwVuSV
 3kog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=M0nS0hVmjoOe8HNSSELnVNDBD2t7CGyEv8tn8aZEMuA=;
 b=F5kXlb8hh3+KqTpb1r5BmcS6/6jutNcO7LQUjVVxFO6kNeM7+6jJIFo4uGPF5HLITt
 SFdbAqzvlTRLj8mpGytga9LRzlLJq2ubTobz/vq8SjBWFyqAQjmUd0Iok1+cDqEhjLNK
 z6eq9b8HKMbf+73etbyN6mD1RKG/ZjMkQkFW9r6jdQDJTbmbogPQu9XkXWcWuX+Rewdo
 AzdYRbgpEEtoqXIK1qi142tgzmTsMp4MHb1PBENqjaNn7zyTtlIxbSjX+VV/xeAH0JXZ
 Fmg5vfGQRwdkDXdfOYho0668qhL5/82pyAFJwVkROXGvW3Ox/O1jmQDgv2qYMWqrfgNF
 EHtA==
X-Gm-Message-State: AOAM531Wp4sI+g9YD/IYh2lMU2bslXmq8E11AcpUZY/zTpTbpZ2rJkQC
 cMU7GypagaNrETj2LY7+rcOIXg8rKqE=
X-Google-Smtp-Source: ABdhPJxsw2qDFjJIeN41Y67GXwEncRU3ZzB+x26bdkCkMhmvrTocuiA2WUraQVPS/nYX4za9LNmsdA==
X-Received: by 2002:a63:9d0a:: with SMTP id i10mr3921278pgd.209.1591819587832; 
 Wed, 10 Jun 2020 13:06:27 -0700 (PDT)
Received: from [192.168.86.30] ([49.207.129.64])
 by smtp.gmail.com with ESMTPSA id x25sm614213pge.23.2020.06.10.13.06.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jun 2020 13:06:27 -0700 (PDT)
To: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
From: Sandeep Raghuraman <sandy.8925@gmail.com>
Subject: [PATCH 1/1] AMDGPU: Replace invalid device ID with a valid device ID
Message-ID: <3811376f-08d5-3b2f-5f1c-10919a90f418@gmail.com>
Date: Thu, 11 Jun 2020 01:36:26 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Language: en-US
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Initializes Powertune data for a specific Hawaii card by fixing what looks like a typo in the code. The device ID 66B1 is not a supported device ID for this driver, and is not mentioned elsewhere. 67B1 is a valid device ID, and is a Hawaii Pro GPU.

I have tested on my R9 390 which has device ID 67B1, and it works fine without problems.

Signed-off-by: Sandeep Raghuraman <sandy.8925@gmail.com>

---
 drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c b/drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c
index 85e5b1ed22c29..56923a96b4502 100644
--- a/drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c
+++ b/drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c
@@ -239,7 +239,7 @@ static void ci_initialize_power_tune_defaults(struct pp_hwmgr *hwmgr)
 
        switch (dev_id) {
        case 0x67BA:
-       case 0x66B1:
+       case 0x67B1:
                smu_data->power_tune_defaults = &defaults_hawaii_pro;
                break;
        case 0x67B8:
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
