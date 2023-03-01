Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC446A68E9
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 09:28:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 187C910E209;
	Wed,  1 Mar 2023 08:28:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8596A10E099;
 Wed,  1 Mar 2023 08:28:11 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id a9so3070249plh.11;
 Wed, 01 Mar 2023 00:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677659291;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7sZ5QMejw6iYZe3voviTFum1T1dofKPjV1mBViIgC/U=;
 b=E/+sjHiN+X5ygvglxuZ8/nnSHxEAHz/HVcpSuWxVf17Q/8mk5CioW0pyKTi1qxGpvn
 r9lXC2Czoa8DLgEY5iI8+wnnKTHdNCUsO4ezS1ygiTn6tWtksLUQ9Nz3a2sWX5dQj8c0
 XVLSeAkYBRgla4jvIbrFS6xneXuGoN5ox7wNeVDKVNPeMEDBQf+bfIzLuuiFZhQ+7i3I
 4+KNf1BXoPA5R4BBkIRWe8nv6Nqai4z1kSJolcVNMnoOCnZKbkcdRTx9Eimx0L/o+MLL
 xH+YZALu0z79b645yC/PMHm2aoUN0M8emzviiVAPIBLU3N4gtsPRaS1HFddEpCphSP55
 ATLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677659291;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7sZ5QMejw6iYZe3voviTFum1T1dofKPjV1mBViIgC/U=;
 b=XFWCTS6KDZiUKZwi/onNR60D+xyZD120UIJxxixWS5/cfw1eRO7v010PFFa9oogezM
 A9gVSFH806jgM1pEQMXrKbl4U3z8/bOD4dzjyYOqhzF4R2Lt77GSM3Y65HXLQVgP6MAN
 nZKBIezL9VkN+FKMhWvPDPHS1O7jXGYdbk5H85cpfbD22X88vok6mwVf3mYZ0TSdk8H/
 OmF8WPwE09fzJMy/0XbWA42Tsss1Mhah20XmCugFo47ES1hcTC3t5WFF/bEmjIkGOY11
 phOBp4ikrriTVzrPqjzVLN4XS7Vzr1aN/gSRlhPI3HLZfnm/aiEl30WilcuACrdzOMBe
 CcHQ==
X-Gm-Message-State: AO0yUKXGfXMBseZjHue2BjNgLdnRXWN5arUou8oTMwJssf23MFTXW29L
 DNQMzZBRnPWLQd4jIaONTnA=
X-Google-Smtp-Source: AK7set+f85af+gXx0M8VaSMb/VOvinKTLPhYimAmMWJMRIThpaCS0eXbsQbHbmRqFMbxDMhAgNHb7A==
X-Received: by 2002:a05:6a21:6d8a:b0:cc:c69b:f7f1 with SMTP id
 wl10-20020a056a216d8a00b000ccc69bf7f1mr7161371pzb.15.1677659291078; 
 Wed, 01 Mar 2023 00:28:11 -0800 (PST)
Received: from [192.168.43.80] (subs03-180-214-233-68.three.co.id.
 [180.214.233.68]) by smtp.gmail.com with ESMTPSA id
 b15-20020aa7810f000000b005b6f63c6cf4sm7321262pfi.30.2023.03.01.00.28.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Mar 2023 00:28:10 -0800 (PST)
Message-ID: <635a2923-b69a-4ce9-f37d-6fe50b6dd164@gmail.com>
Date: Wed, 1 Mar 2023 15:28:02 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v8 01/16] dma-buf/dma-fence: Add deadline awareness
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230228225833.2920879-1-robdclark@gmail.com>
 <20230228225833.2920879-2-robdclark@gmail.com>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20230228225833.2920879-2-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Rob Clark <robdclark@chromium.org>, Gustavo Padovan <gustavo@padovan.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Jonathan Corbet <corbet@lwn.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/1/23 05:58, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Add a way to hint to the fence signaler of an upcoming deadline, such as
> vblank, which the fence waiter would prefer not to miss.  This is to aid
> the fence signaler in making power management decisions, like boosting
> frequency as the deadline approaches and awareness of missing deadlines
> so that can be factored in to the frequency scaling.
> 
> v2: Drop dma_fence::deadline and related logic to filter duplicate
>     deadlines, to avoid increasing dma_fence size.  The fence-context
>     implementation will need similar logic to track deadlines of all
>     the fences on the same timeline.  [ckoenig]
> v3: Clarify locking wrt. set_deadline callback
> v4: Clarify in docs comment that this is a hint
> v5: Drop DMA_FENCE_FLAG_HAS_DEADLINE_BIT.
> v6: More docs
> v7: Fix typo, clarify past deadlines
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Reviewed-by: Christian König <christian.koenig@amd.com>
> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>

I have given my Reviewed-by from v7 [1], but it didn't get picked up,
thus giving it again:

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

Thanks.

[1]: https://lore.kernel.org/linux-doc/Y%2F7LfLxhIjDpD4D3@debian.me/

-- 
An old man doll... just what I always wanted! - Clara

