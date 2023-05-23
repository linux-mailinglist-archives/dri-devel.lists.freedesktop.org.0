Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A65D70F04B
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 10:10:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78AC210E5A4;
	Wed, 24 May 2023 08:10:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7685B10E554
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 23:34:10 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-53f04fdd77dso131038a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 16:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684884850; x=1687476850; 
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=MNA57LFsEAjv0YnO7XAE11SZw6Ds4IrSm19nvlVJk98=;
 b=wF+aug1ydohk/cr8Rfez98IIlwqb13f0RxZ6y479XbKidTrvL03zg77sxMin+zGFGx
 l5eXByrl4nPZWQWmqQncYvX9EBJ2jhKSQOmxQvgaHwbuXn34nx47cTnpfrrrJzj+8zQw
 4pNfP+xtaTEDb3tmNzMbZ9lq1FvB1h3Y/9o0b9L7TTlVcKFXDAGLKRDd9xXEgp7O259E
 JEOObHH4XNk6aUQOdhlo/FfoEEjn3MqFmkmu5jjMJ2GV+T7Gsu/kuTOHMZ3neHBb56qU
 VtYRMrOu288bwsGXUhDF1P0SpaYg4k2ai2BHS88fM94NGHU7+411tXSKeuvtY4mY+E9V
 VdhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684884850; x=1687476850;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MNA57LFsEAjv0YnO7XAE11SZw6Ds4IrSm19nvlVJk98=;
 b=lrkWOn7/SAxlsRC9Y0ZJYbeFBvMaUVRZZbjj59W9PMu4Y3y8fx8376qAu9nANbccye
 86n3ljb3LdMvvZ0f9YUbnB6lDbzYw5MI56OH7Ej7Q/XAQyUTW0ymTyJJktsUVtWHua0h
 Po4kfE84HifBJ716WKM3KJyXd6zVI/0iQ3W0AY6cSN02iVDlmmBw6/I0M56XYQ5sJtdg
 8S/e7YuKWH6j9A3jjmEdiGNriC/Qb+ZQYD3vqypCoUA6NibsvK9xOYtJXMcgLgOIUvNW
 4ebgLKqvoHwUwgxJPohKy7D7wKZRsbpbRYM7x+gJcMd9RlmbiwNtgwnEC77W9pb9+mUz
 /HPg==
X-Gm-Message-State: AC+VfDzA2dOpaNzJrMnCd6B85I6x78MKeNR5HlesCiGdh7WRtU6ft+Sl
 qy4m6we7OEzTmqyKteJXVdJpSUcLMpA+ThJP93V/DA==
X-Google-Smtp-Source: ACHHUZ4/S/KRgTtfzWmFTkvHxw3NShbPiyY6ElSBnhSbSlY2KYV0gjG/Ka+9HzWGVYgXMdo2hQhd0g==
X-Received: by 2002:a17:90b:a45:b0:253:947f:af51 with SMTP id
 gw5-20020a17090b0a4500b00253947faf51mr13745197pjb.5.1684884849781; 
 Tue, 23 May 2023 16:34:09 -0700 (PDT)
Received: from localhost ([75.172.135.98]) by smtp.gmail.com with ESMTPSA id
 gl21-20020a17090b121500b00253305f36c4sm100944pjb.18.2023.05.23.16.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 16:34:09 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, Alexandre Bailon
 <abailon@baylibre.com>, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Subject: Re: [PATCH 0/7] Add a DRM driver to support AI Processing Unit (APU)
In-Reply-To: <d0807fe4-dba2-8244-f655-d04e80973572@quicinc.com>
References: <20230517145237.295461-1-abailon@baylibre.com>
 <d0807fe4-dba2-8244-f655-d04e80973572@quicinc.com>
Date: Tue, 23 May 2023 16:34:08 -0700
Message-ID: <7ha5xud3m7.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Wed, 24 May 2023 08:10:24 +0000
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, bero@baylibre.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, linaro-mm-sig@lists.linaro.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, sumit.semwal@linaro.org,
 jstephan@baylibre.com, nbelin@baylibre.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jeffrey Hugo <quic_jhugo@quicinc.com> writes:

> On 5/17/2023 8:52 AM, Alexandre Bailon wrote:
>> This adds a DRM driver that implements communication between the CPU and an
>> APU. The driver target embedded device that usually run inference using some
>> prebuilt models. The goal is to provide common infrastructure that could be
>> re-used to support many accelerators. Both kernel, userspace and firmware tries
>> to use standard and existing to leverage the development and maintenance effort.
>> The series implements two platform drivers, one for simulation and another one for
>> the mt8183 (compatible with mt8365).
>
> This looks like the 3 existing Accel drivers.  Why is this in DRM?

Yes, this belongs in accel.  I think Alex had some issues around the
infra in accel with device nodes not appearing/opening properly, but
I'll let him comment there.  But either way, the right approach should
be to fix any issues in accel and move it there.

[...]

>>   .../devicetree/bindings/gpu/mtk,apu-drm.yaml  |  38 ++
>>   drivers/gpu/drm/Kconfig                       |   2 +
>>   drivers/gpu/drm/Makefile                      |   1 +
>>   drivers/gpu/drm/apu/Kconfig                   |  22 +
>>   drivers/gpu/drm/apu/Makefile                  |  10 +
>>   drivers/gpu/drm/apu/apu_drv.c                 | 282 +++++++++
>>   drivers/gpu/drm/apu/apu_gem.c                 | 230 +++++++
>>   drivers/gpu/drm/apu/apu_internal.h            | 205 ++++++
>>   drivers/gpu/drm/apu/apu_sched.c               | 592 ++++++++++++++++++
>>   drivers/gpu/drm/apu/simu_apu.c                | 313 +++++++++
>>   include/uapi/drm/apu_drm.h                    |  81 +++
>
> "apu" seems too generic.  We already have 3 "AI processing units" over 
> in drivers/accel already...

Indeed, it is generic, but that's kind of the point for this driver
since it's targetted at generalizing the interface with "AI processing
units" on a growing number of embedded SoCs (ARM, RISC-V, etc.)  In
addition, the generic naming is intentional because the goal is bigger
than the kernel and is working towards a generic, shared "libAPU"
userspace[1], but also common firmware for DSP-style inference engines
(e.g. analgous Sound Open Firmware for audio DSPs.)

As usual, the various SoC vendors use different names (APU, NPU, NN
unit, etc.)  but we'd like a generic name for the class of devices
targetted by this driver.  And unfortunately, it looks like the equally
generic "Versatile processing unit" is already taken Intel's
drivers/accel/ivpu. :)

Maybe since this is more about generalizing the interface between the
CPU running linux and the APU, what about the name apu_if?  But I guess
that applies to the other 3 drivers in drivers/accell also.  Hmmm...

Naming things is hard[2], so we're definitly open to other ideas.  Any
suggestions?

Kevin

[1] https://gitlab.baylibre.com/baylibre/libapu/libapu

[2]
"There are 2 hard problems in computer science: cache invalidation,
 naming things and off-by-1 errors."
 -- https://twitter.com/secretGeek/status/7269997868

