Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D059547A561
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 08:25:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27A5010ECA0;
	Mon, 20 Dec 2021 07:25:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 072DA10ECA3;
 Mon, 20 Dec 2021 07:25:09 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id v11so18076890wrw.10;
 Sun, 19 Dec 2021 23:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=chODkm3h2IdhMAWPnhSCneoHfHhO6pkigq1COIINqYc=;
 b=nTiNwQWvb/Xrp9QEEgDULnEpCUt0RaW0Aq7ipnZEd006E9s3m+Z7qS90IvE7O/0w5D
 6ydAXp1VrmCNVSXlVhsvy41CMAJ4N+LEiFT/wS2rnxrIPk3+TTotqkMIjqJjVg7WbYCr
 dpa2yk3IA0LJXk2MRutcs3D5hn8zfCkQqNK7suT/e8Mz7ePWPmAA3PXhzJzNHXtfRuOa
 NuRyYdJStkLwILCIHP1ECzi97NI/JZ3lsTjOdYZKCeX1WCyYM9k0jTh1bvDJtiAtvZzQ
 S8Ie2/JuUHtSqnzvA7TF6TZcB4aWeX3fA2WzzY5/RQd0tKU8KUYgPeV1v2oXkawl9YdM
 th+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=chODkm3h2IdhMAWPnhSCneoHfHhO6pkigq1COIINqYc=;
 b=daqHXc+5hm3YwtNLp9teuNRz9/k1aCAnf92Tsv5hZX6qY6dDAwGagZdlCL1BF11QhI
 rB8F55T9Wmdib27g8rerC3JoH+8sFWN26agpuURJFryV5O8pax9G5NfeQtjlz/JJLFE+
 7gtktZoeTo/wa/zKJYbeZpP5txjuK9+WLL8yZBp5J2yaJr45NlaznzaBKSHzLmK1kour
 8CjETZiXG78wEHzKaCduU3OQP7u3RX2Il/95phdiMBzsy26AM8YZBf7Ukl/YbDN9Acyj
 VnRRN7k9mksbXIG95d8xQCwitojE/6439oX46Z/oO1xD1XAntR/J4h92Ar4GYdChJ8nn
 +uYg==
X-Gm-Message-State: AOAM532xblGp30AVt/rX5a+NAY/HSnutpbj8xWEo5IPxkjDe3oqWvjkR
 D3O1K4pS8eJgsq5LBCM4gg/meyXm7xg=
X-Google-Smtp-Source: ABdhPJxKs1CA08naLlKGDksGkqnKF3woOuEm7coQh6Q5S4pwmvvurbrtk4jAJDbbRWY5Pwz4yr0wQw==
X-Received: by 2002:adf:e286:: with SMTP id v6mr12150568wri.565.1639985107135; 
 Sun, 19 Dec 2021 23:25:07 -0800 (PST)
Received: from [192.168.178.21] (p57b0bff8.dip0.t-ipconnect.de.
 [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id 88sm11798651wrc.53.2021.12.19.23.25.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Dec 2021 23:25:06 -0800 (PST)
Subject: Re: [RFC 0/6] Define and use reset domain for GPU recovery in amdgpu
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20211217222745.881637-1-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <0a30778e-28b8-7d02-01e9-9db690227222@gmail.com>
Date: Mon, 20 Dec 2021 08:25:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211217222745.881637-1-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: horace.chen@amd.com, christian.koenig@amd.com, Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.12.21 um 23:27 schrieb Andrey Grodzovsky:
> This patchset is based on earlier work by Boris[1] that allowed to have an
> ordered workqueue at the driver level that will be used by the different
> schedulers to queue their timeout work. On top of that I also serialized
> any GPU reset we trigger from within amdgpu code to also go through the same
> ordered wq and in this way simplify somewhat our GPU reset code so we don't need
> to protect from concurrency by multiple GPU reset triggeres such as TDR on one
> hand and sysfs trigger or RAS trigger on the other hand.
>
> As advised by Christian and Daniel I defined a reset_domain struct such that
> all the entities that go through reset together will be serialized one against
> another.
>
> TDR triggered by multiple entities within the same domain due to the same reason will not
> be triggered as the first such reset will cancel all the pending resets. This is
> relevant only to TDR timers and not to triggered resets coming from RAS or SYSFS,
> those will still happen after the in flight resets finishes.
>
> [1] https://patchwork.kernel.org/project/dri-devel/patch/20210629073510.2764391-3-boris.brezillon@collabora.com/
>
> P.S Going through drm-misc-next and not amd-staging-drm-next as Boris work hasn't landed yet there.

Patches #1 and #5, #6 are Reviewed-by: Christian König 
<christian.koenig@amd.com>

Some minor comments on the rest, but in general absolutely looks like 
the way we want to go.

Regards,
Christian.

>
> Andrey Grodzovsky (6):
>    drm/amdgpu: Init GPU reset single threaded wq
>    drm/amdgpu: Move scheduler init to after XGMI is ready
>    drm/amdgpu: Fix crash on modprobe
>    drm/amdgpu: Serialize non TDR gpu recovery with TDRs
>    drm/amdgpu: Drop hive->in_reset
>    drm/amdgpu: Drop concurrent GPU reset protection for device
>
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |   9 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 206 +++++++++++----------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  |  36 +---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |   2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |   2 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c   |  10 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h   |   3 +-
>   7 files changed, 132 insertions(+), 136 deletions(-)
>

