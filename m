Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48300138668
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2020 13:37:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD226E53C;
	Sun, 12 Jan 2020 12:36:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87DF96EA73;
 Fri, 10 Jan 2020 17:44:59 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id q10so2604559wrm.11;
 Fri, 10 Jan 2020 09:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=5hI1Z6zc0isNIwOCpgK9mbSp+WfDRjfAoj1TrQlEpEk=;
 b=ocd2XjHL/6q7Bv/03GFAnmNwBPQIoL9bJ5BkRsKBNXMqvd8Uvwjxfo9N0CltqGK4D9
 m6WC8vwBiEcX3wu3eGMFNb9s9JE5ssWh1ubdTMtX2neDKxdmN8y0MdX9llmGxdVV5lGs
 3gIhVrGO3MV5UOrO6jzR3kPtPxQfHl1qEdTRSp91kXAxaWWTp9RD7jhUvsAOoiEsU9ct
 nJNZ0yLcdvlOBT37oT5m7bgVdT0RWO7rA1ntLhmdpnghc3srvwMQ/4BZ5HMOOwSyd7yV
 USMWVFuK6BQn4GknPaflrM+p4Dcpadd6N1Hxtm07GZt4017QGXtJasMEiwZ16KRqxOsH
 7Evw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=5hI1Z6zc0isNIwOCpgK9mbSp+WfDRjfAoj1TrQlEpEk=;
 b=MEgeswDSZfnjts2fdcws5VDJB4GBB7tfyRO53HTNvcwLS3JwYbqay7+HxdnXvhcSLU
 VksG/BVcvgr+ZSomxoPab9GtP2JZ02WRzArTNZYNz/+JJeKJKkyEbMn+NHvywmnW2GJp
 /Tv6I/P81EPv8go2col0Jw8JULUGKxjctY5YWa+vRW31KeF5TP5DJDRGEpuxumJf3f5e
 W0eTgSJtJs1MjQUy3R1rDUfavDVdoPCo1qDdA+OCDHfBQZijr9/RhwIy+URcKjGzMBLB
 bo+uAQnJWXThcHxHe0kZEwFohFWsaAH/MbWdOz08xWmtxVhIVsERi+8T35EW3wiBSVZi
 XjjQ==
X-Gm-Message-State: APjAAAX1MOwxauP43VKXFja5/3d+5olQrZaBYYJXz1KbU8nc5R/jb9Gn
 180nogz2MNx/ng1k3ZC7CBY=
X-Google-Smtp-Source: APXvYqzt7Qr8UDP3Dv38WgfWk/xkS6KCAOtCWgJWi+dWf98rcqNzc/uJiB+XqpYBSc+PgqaRuSXu8w==
X-Received: by 2002:adf:d846:: with SMTP id k6mr4500598wrl.337.1578678298144; 
 Fri, 10 Jan 2020 09:44:58 -0800 (PST)
Received: from wambui.local ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id i8sm3140572wro.47.2020.01.10.09.44.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2020 09:44:57 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
X-Google-Original-From: Wambui Karuga <wambui@wambui>
Date: Fri, 10 Jan 2020 20:44:48 +0300 (EAT)
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 0/5] drm/i915: conversion to new drm logging macros.
In-Reply-To: <8736cno0ow.fsf@intel.com>
Message-ID: <alpine.LNX.2.21.99999.375.2001102044220.23860@wambui>
References: <cover.1578409433.git.wambui.karugax@gmail.com>
 <8736cno0ow.fsf@intel.com>
User-Agent: Alpine 2.21.99999 (LNX 375 2019-10-29)
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 12 Jan 2020 12:36:09 +0000
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
Cc: airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, rodrigo.vivi@intel.com,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On Fri, 10 Jan 2020, Jani Nikula wrote:

> On Tue, 07 Jan 2020, Wambui Karuga <wambui.karugax@gmail.com> wrote:
>> This series begins the conversion to using the new struct drm_device
>> based logging macros in drm/i915.
>>
>> Wambui Karuga (5):
>>   drm/i915: convert to using the drm_dbg_kms() macro.
>>   drm/i915: use new struct drm_device logging macros.
>>   drm/i915: use new struct drm_device based logging macros.
>>   drm/i915: convert to using new struct drm_device logging macros
>>   drm/i915: use new struct drm_device based macros.
>
> Thanks for the patches, pushed to drm-intel-next-queued.
>
> As it's impossible to distinguish the commits from each other by the
> subject line alone, I've amended the prefix while pushing as follows:
>
> drm/i915/pch: convert to using the drm_dbg_kms() macro.
> drm/i915/pm: use new struct drm_device logging macros.
> drm/i915/lmem: use new struct drm_device based logging macros.
> drm/i915/sideband: convert to using new struct drm_device logging macros
> drm/i915/uncore: use new struct drm_device based macros.
>
> Please pay attention to this in future work. It's not always obvious
> what the prefix should be, but 'git log -- path/to/file.c' will go a
> long way.
>
Sure, I'll do that from now on.
Thanks.
> BR,
> Jani.
>
>
>>
>>  drivers/gpu/drm/i915/intel_pch.c         |  46 +--
>>  drivers/gpu/drm/i915/intel_pm.c          | 351 +++++++++++++----------
>>  drivers/gpu/drm/i915/intel_region_lmem.c |  10 +-
>>  drivers/gpu/drm/i915/intel_sideband.c    |  29 +-
>>  drivers/gpu/drm/i915/intel_uncore.c      |  25 +-
>>  5 files changed, 254 insertions(+), 207 deletions(-)
>
> -- 
> Jani Nikula, Intel Open Source Graphics Center
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
