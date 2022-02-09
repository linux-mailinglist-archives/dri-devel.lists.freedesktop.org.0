Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B48BF4AF44B
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 15:42:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B04C510E4A7;
	Wed,  9 Feb 2022 14:42:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E017010E4A7;
 Wed,  9 Feb 2022 14:42:50 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id ch26so5444171edb.12;
 Wed, 09 Feb 2022 06:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=LQZSYMviOXU46IrK/WW3TYqqEQdPNThwvuJaW7Mm9Nc=;
 b=VSO0NVVWJlw32DWMYNVjoy8yhHXWr2O2kXDw+INIS3xZ6yOUFSQexAXcjb5QY689vl
 QGluNByx9hJEioPOvvovKESE+1sFve9DQ1DrNp4zlq55Uq82+0C90vrFws0clXbe4ft8
 0BfDxrw/nS3YP6fxu94lr9FREDTUsJ5VeKalnC3tyc+MEw0L7v+G5RxZH+CbstCEtR5g
 5qMWWrzsQE4UrLDWnPTz2+dLJVebCEf/3rX8f06MSzP64QmnxY3zFjufttf4owmvQAro
 Rlr/KZcFPb3mlbcyDd9sNo2EsCpSAx1GeEvxVABW5z/SuJUS6loQuT1au5UhehWQ5J1t
 +TCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LQZSYMviOXU46IrK/WW3TYqqEQdPNThwvuJaW7Mm9Nc=;
 b=UuQpyQvxpFW/oF1C3Q89sogrRcjrvDgJPExsAe4htPTkWbDSzIO7u3vE+ewWCwP7J2
 N2zOUfAwBNHVc/zGz29p705T9cBpfFGHySZYZrKD+WFakpARZo2lRiXUa5IG/2pXZ51q
 QLvR6ak0o4wz5mk7ogyuh0FJOmqBdo4kxN/2k+bA7+69l3PFwaoQl2uz2NNUvelsgtH7
 iFpzT8rOnvQx2CwFJXS6k7nccOQCgF8LYnW+YJD0sOt1rbcU3s4soyBpDbRFjSQI74rd
 NAPsTSqwfUa/iq4rUyKtIVG18SjPKj6T09c7/EpFI6ZvVeH4NpcvDQA1vxNNISBWtHd+
 ZteA==
X-Gm-Message-State: AOAM533QiSq4jqHIH1MlsjrDE5MfVe05SrBFfc2kFOe8YjEjaMfljkYJ
 szQxdmQTxKmGznPJ4Ax3XU4=
X-Google-Smtp-Source: ABdhPJyizq11JRyFdw+580WCuNoex9CCHlTUfmQPX0ns6bRJjIP7UVCkVtsFpM6wRyUYfhDQqOneNA==
X-Received: by 2002:a05:6402:60f:: with SMTP id
 n15mr2779654edv.316.1644417769244; 
 Wed, 09 Feb 2022 06:42:49 -0800 (PST)
Received: from ?IPV6:2a02:908:1252:fb60:575:1502:6989:b456?
 ([2a02:908:1252:fb60:575:1502:6989:b456])
 by smtp.gmail.com with ESMTPSA id ee23sm6369953edb.19.2022.02.09.06.42.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 06:42:48 -0800 (PST)
Message-ID: <97918c8e-6b88-ade5-0dd5-6de01f4f41c3@gmail.com>
Date: Wed, 9 Feb 2022 15:42:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/6] dma-buf: Warn about dma_fence_chain container rules v2
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 sumit.semwal@linaro.org, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
References: <20220204100429.2049-1-christian.koenig@amd.com>
 <20220204100429.2049-4-christian.koenig@amd.com>
 <b384ad5f76da0009dd49965769bcddbc0395111a.camel@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <b384ad5f76da0009dd49965769bcddbc0395111a.camel@linux.intel.com>
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

Am 09.02.22 um 15:02 schrieb Thomas Hellström:
> On Fri, 2022-02-04 at 11:04 +0100, Christian König wrote:
>> Chaining of dma_fence_chain objects is only allowed through the prev
>> fence and not through the contained fence.
>>
>> Warn about that when we create a dma_fence_chain.
>>
>> v2: fix comment style
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> It looks like this blows up in generic drm code...
>
> https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_22201/shard-skl10/igt@syncobj_timeline@transfer-timeline-point.html

Thanks for the notice.  Going to take a look.

I'm wondering why the last CI report I've got didn't showed that.

Christian.

>
> /Thomas
>
>

