Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D024EDF71
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 19:15:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C33BF10F43C;
	Thu, 31 Mar 2022 17:15:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D1610F43A
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 17:15:27 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id j18so713281wrd.6
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 10:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=X2OXV90aO+ODMFfuSOMa4DDXkG0Jjwo9L8KTnXeA4Kk=;
 b=PqBZtpUPmhfAj1raRjgQALlfKWfXQPEXvq3x7gojRbU6+/VShr/zvJvItrBKZpXbLd
 dBpxrF/b4HTeg8y9AT6zJ81ItjH5NSGldowXm//os/Db0ZpIaTwQ74Q6I8WLdltnV3Vd
 M6e+NQhaVjl6rquODd2VNjTIdnwzz/2hTY46ZISGHX3BL+LoPs1/kZS8XtxFG82kjTg7
 zhs7dTMqfI8vDYTIMPL3q03M+OGdh8HoJYU1LpwHfanHUCYq0PVpurqAMHeq99QiFUoe
 4BgeSdT9ZoIaU9nevG92ViaO6GU1mTxXBzxr+MIZWmf93EfSEbb/NhA5I1Kg+djEa82k
 rgCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=X2OXV90aO+ODMFfuSOMa4DDXkG0Jjwo9L8KTnXeA4Kk=;
 b=r60t1zkVgsT3P/36m9aDS7CjJNHtX4GN18IBq0lGqV0ILTfAet+LvH0Awkgj8wsNad
 4wwKFwyrcodBVGKDJFfRVLXu2o+GyDB5TDPtCAYdtmbCGHXX8Y/6ygSGeNZ/gzVQKgVk
 2ZESEN5UUvqE5yO65Ohe5oP9ZFtuOQV6lJLv5udd/8yuSW1ZLoz40orTQQ+GZUcWpLcK
 tDUvMVssZWD1SHWWVm+hHQo48m44uzUEDqzbUF3EzKx8o4fG0M8BtkzkMNG2yZiPwyeU
 CVV8P3jlY4YBv8pvYmTUW0YxTpfpIzYgQKcfBCsuSP4i+tGSPM3KB1T77rZ8qPyNvAzn
 9TNw==
X-Gm-Message-State: AOAM533HXbZ8Dju4dMJWoVeFCbd7zKdWpfnWu7QB5w6ZGEsXzSDZevj6
 JK6HDLPpMt1ULWiIvzP9Mr4DFw==
X-Google-Smtp-Source: ABdhPJz2ULczMysarpVs35MfQnPspUQoA02V0ccHg5zENWursAdxOTaN4Q79HUBEnAhpNjkSCP3GpQ==
X-Received: by 2002:a05:6000:1545:b0:205:a82d:8007 with SMTP id
 5-20020a056000154500b00205a82d8007mr4987338wry.88.1648746926278; 
 Thu, 31 Mar 2022 10:15:26 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
 [86.27.177.88]) by smtp.gmail.com with ESMTPSA id
 n15-20020a05600c500f00b0038cfb1a43d6sm7968863wmr.24.2022.03.31.10.15.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 10:15:25 -0700 (PDT)
Date: Thu, 31 Mar 2022 18:15:23 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Felix Kuehling <felix.kuehling@amd.com>
Subject: Re: [PATCH v2 1/1] drm/amdkfd: Create file descriptor after client
 is added to smi_clients list
Message-ID: <YkXhq/APK44/hpvX@google.com>
References: <20220331122117.1538913-1-lee.jones@linaro.org>
 <f38e4782-1959-d1f3-e8d7-f60e199514e3@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f38e4782-1959-d1f3-e8d7-f60e199514e3@amd.com>
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 31 Mar 2022, Felix Kuehling wrote:

> 
> Am 2022-03-31 um 08:21 schrieb Lee Jones:
> > This ensures userspace cannot prematurely clean-up the client before
> > it is fully initialised which has been proven to cause issues in the
> > past.
> > 
> > Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: "Christian König" <christian.koenig@amd.com>
> > Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: amd-gfx@lists.freedesktop.org
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> 
> Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
> 
> I will apply to patch to amd-staging-drm-next.
> 
> > ---
> > 
> > CAVEAT: This patch is completely untested
> >          I can't seem to find a configuration strategy to compile test this
> >          allyesconfig and allmodconfig do not appear sufficient
> 
> That's very strange. It should get compiled if CONFIG_HSA_AMD is
> enabled.

Okay, I figured it out.

Apparently you can't give 'drivers/gpu/drm/amd' as a build param.

'drivers/gpu/drm' works as I expect however.

> I will at least compile-test it before I submit.

Great, thank you.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
