Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 093EC8FB861
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 18:04:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D0C010E00F;
	Tue,  4 Jun 2024 16:04:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="rmxp2iOL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C997310E00F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 16:04:24 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-1f62a628b4cso37870765ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 09:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717517064; x=1718121864;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=R2gKQIHSX9mPWT/OX1hOPZ0VNPVmzrzMvvwZ15iSblg=;
 b=rmxp2iOLFWRwyZwczNZvYtkoKT1dcKb00BzHVg3tS0VBflGLj+lTbZ+MUcukrugKIG
 wnwji3hPMVtEe5aXNfdV/lRKdIQixyQgZfqyAwrmk92hMEYtfKegl0dWpwKpAjUe8KwR
 FEg3TEySysgU5G+0b3S6QLOkmtGVIWQ1PWAJemBenz2oqgrsUhozRW2wF+bTlmfvOzG0
 xVapea8Zo5R+uEuWwotbteiDvh94quEuY5DTZGZD9Oi+5SZu5S4SCQkqOy7pT/McVzzk
 79cZcz9oXqzgVfiJEgmfD/DWory3ZaEke+NeIabrHGCwE32c06J8zbBvy5l+K67FF3xM
 i3Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717517064; x=1718121864;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R2gKQIHSX9mPWT/OX1hOPZ0VNPVmzrzMvvwZ15iSblg=;
 b=tH/GvH63Xb5tSb9WzjgKXxLp599pocrJfXQNJdFQr0ty6QWWpMWz9ZtIjVpoWISQpg
 mwweL5KAWgtI5dWiYqsqJC2J8GwWFaUouHALqflDSmdl2wVEKwAX24+DI8PAQtUYYl0g
 mRAhrDsubQpZn1P0bGNLpdxxEFanj7/EcPiZZifZ8SAT/iy2TFw97gVZ6Ccu1M5lBAfV
 AyPOI06rciNdXAIxyf/YdUY9zHMlgLhH7fiTVNhTUPH4aup4tcUYMQNOQ0Het4UmSHjY
 HMULIirl7K4Lefe/52Hhk62YO+Yb4jVlwAB5jwuIjhk6963fGSO9O3h3vkBeqEeNurf5
 LnOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRtZJ07+/RVZ+o3hGGBMdsWpVH42Fti/mpph3i7gcnkkronou/dF233huV9jhGDGISdhhY5rRy4W4O9gPlriHQWJS7c/mQS8OR2vCx3W3u
X-Gm-Message-State: AOJu0Yw19SG4Tpajv1RZN334173uW/6cKnIQdR+Nccsw07ciGzm04e4f
 QajzvTys4Ej5+03DGhUeSurWIUdje6oyu97l9NjOb77vVapcUXxDgm2T8vykoAM=
X-Google-Smtp-Source: AGHT+IFk2/CHkCYOgoIKNRsQIUaLysshP8KYOXeegGgQt9s1XMcyvOM8xjJ+kaYxNqLDHalCVqGY9A==
X-Received: by 2002:a17:902:d507:b0:1f4:7713:8f6 with SMTP id
 d9443c01a7336-1f6370a0cd6mr163627915ad.52.1717517063799; 
 Tue, 04 Jun 2024 09:04:23 -0700 (PDT)
Received: from localhost ([50.145.13.30]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f63232dcc5sm85466225ad.26.2024.06.04.09.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 09:04:23 -0700 (PDT)
Date: Tue, 04 Jun 2024 09:04:23 -0700 (PDT)
X-Google-Original-Date: Tue, 04 Jun 2024 09:04:21 PDT (-0700)
Subject: Re: [PATCH] drm/amd/display: Increase frame-larger-than warning limit
In-Reply-To: <20240603222948.GB1802995@thelio-3990X>
CC: alexander.deucher@amd.com, harry.wentland@amd.com, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, 
 daniel@ffwll.ch, Qingqing.Zhuo@amd.com, hamza.mahfooz@amd.com,
 chenhuacai@kernel.org, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: nathan@kernel.org
Message-ID: <mhng-f1fc5ef0-9e72-4b12-9a28-145bbc8938d8@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
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

On Mon, 03 Jun 2024 15:29:48 PDT (-0700), nathan@kernel.org wrote:
> Hi Palmer,
>
> On Thu, May 30, 2024 at 07:57:42AM -0700, Palmer Dabbelt wrote:
>> From: Palmer Dabbelt <palmer@rivosinc.com>
>>
>> I get a handful of build errors along the lines of
>>
>>     linux/drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:58:13: error: stack frame size (2352) exceeds limit (2048) in 'DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation' [-Werror,-Wframe-larger-than]
>>     static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation(
>>                 ^
>>     linux/drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:1724:6: error: stack frame size (2096) exceeds limit (2048) in 'dml32_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
>>     void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
>>          ^
>
> Judging from the message, this is clang/LLVM? What version?

Yes, LLVM.  Looks like I'm on 16.0.6.  Probably time for an update, so 
I'll give it a shot.

> I assume
> this showed up in 6.10-rc1 because of commit 77acc6b55ae4 ("riscv: add
> support for kernel-mode FPU"), which allows this driver to be built for
> RISC-V.

Seems reasonable.  This didn't show up until post-merge, not 100% sure 
why.  I didn't really dig any farther.

> Is this allmodconfig or some other configuration?

IIRC both "allmodconfig" and "allyesconfig" show it, but I don't have a 
build tree sitting around to be 100% sure.

>> as of 6.10-rc1.
>>
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>> ---
>>  drivers/gpu/drm/amd/display/dc/dml/Makefile | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
>> index c4a5efd2dda5..b2bd72e63734 100644
>> --- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
>> +++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
>> @@ -62,9 +62,9 @@ endif
>>
>>  ifneq ($(CONFIG_FRAME_WARN),0)
>>  ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)),y)
>> -frame_warn_flag := -Wframe-larger-than=3072
>> +frame_warn_flag := -Wframe-larger-than=4096
>>  else
>> -frame_warn_flag := -Wframe-larger-than=2048
>> +frame_warn_flag := -Wframe-larger-than=3072
>>  endif
>>  endif
>>
>> --
>> 2.45.1
>>
