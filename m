Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E30AE508EA7
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 19:40:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F2EE10E20C;
	Wed, 20 Apr 2022 17:40:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D75710E20B;
 Wed, 20 Apr 2022 17:40:24 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id g20so3263633edw.6;
 Wed, 20 Apr 2022 10:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=UGqF/VNrOQXVy0XVsg7vlIex9Byf7MQ1HLHnkGVT8jI=;
 b=jEJ8ogj8lc9owjZce7IJB4It8T4hbhUnmPeuGb9BcLfMhltaGMKp4GqC8/3NkFbH7h
 ymNvxWDpt/iCgckENBA7mGuXa2Vgzj+XsdFqwroEgf+BNnzssz3JnND7K3x0opOK4SlL
 4kxC5HmhON6Epj8hkoIgY14/PklMvafmxMBy2EjsORqnUGj+mBqKW+QEpoSBXKjbHI4f
 NYzqjFZWDn6usSAYL2EdbnNQVn1MF86oDYi0qsGN66jLhxxqOiVCI0cNXox0EN2YjJ2d
 QGuH2UdIfE80ppvFsk/bXC29kpp53y0/+rN6ZzcuzSsEjgLh+K160NXtR+g97QC3BiWX
 K8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UGqF/VNrOQXVy0XVsg7vlIex9Byf7MQ1HLHnkGVT8jI=;
 b=1q6kCHfU+8QSFxr3/qSqzjGwb8xne/nM2PX20Y2HARYefq71mTDDd8cslNEJTfqQr8
 T0jOZX9aggv68r1Zz06TGYKV3z7K5Pp6A5f10PHjgoTLurp7SGJpKncLIkdSf/TDv3d4
 bfJ+2OrG8pX/Zw0+kUkLHxIWPgC7zU7eBqukfSAowCf7JVvwHHbOwsTSPDyUD6xx7G66
 bxqA1nvpFzBCDvmrSHGknAL0/W7rTzKEWfoGcqJRY3YawmWlaUiIy8qcjHZXVvKSFCon
 TwlrM0YCfjGKokHxSH5PWCMfE14SIeErkgZYDueN0ZMbWeJI/SwnKh6Vsh5gVTce1ImN
 XfYA==
X-Gm-Message-State: AOAM533o/aKzViWENasdfrsLAh66F9UKq/omDMH2AxsfcwRCcsrW1N0B
 yfGA3+9CC2EeVab0j+NPx/paw7bRJ2o=
X-Google-Smtp-Source: ABdhPJzl4hP6+bYyCHH6YeLv3zGSn/Zl1qGJV0gcCoYdO4ALyzAM4zbXzED5a3WR79SdNoCSmCxO/w==
X-Received: by 2002:a50:fd81:0:b0:41d:7582:75df with SMTP id
 o1-20020a50fd81000000b0041d758275dfmr24584159edt.208.1650476422538; 
 Wed, 20 Apr 2022 10:40:22 -0700 (PDT)
Received: from ?IPV6:2a02:908:1252:fb60:425d:2971:45fa:ac5d?
 ([2a02:908:1252:fb60:425d:2971:45fa:ac5d])
 by smtp.gmail.com with ESMTPSA id
 g15-20020a170906520f00b006cd07ba40absm6918464ejm.160.2022.04.20.10.40.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 10:40:21 -0700 (PDT)
Message-ID: <54d00af9-9384-5794-490c-7d4cafe086b6@gmail.com>
Date: Wed, 20 Apr 2022 19:40:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 03/15] dma-buf & drm/amdgpu: remove dma_resv workaround
Content-Language: en-US
To: Zack Rusin <zackr@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20220407085946.744568-1-christian.koenig@amd.com>
 <20220407085946.744568-4-christian.koenig@amd.com>
 <60ab53ce1ce1333f5e6a15fc83c3c05cd9bd1084.camel@vmware.com>
 <4c2e9414-3926-c9d7-8482-0d6d9191c2ac@amd.com>
 <fe8916b53b0f0101e6616d23eb6896399b092d58.camel@vmware.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <fe8916b53b0f0101e6616d23eb6896399b092d58.camel@vmware.com>
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 20.04.22 um 19:38 schrieb Zack Rusin:
> On Wed, 2022-04-20 at 09:37 +0200, Christian König wrote:
>> ⚠ External Email
>>
>> Hi Zack,
>>
>> Am 20.04.22 um 05:56 schrieb Zack Rusin:
>>> On Thu, 2022-04-07 at 10:59 +0200, Christian König wrote:
>>>> Rework the internals of the dma_resv object to allow adding more
>>>> than
>>>> one
>>>> write fence and remember for each fence what purpose it had.
>>>>
>>>> This allows removing the workaround from amdgpu which used a
>>>> container
>>>> for
>>>> this instead.
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>> Cc: amd-gfx@lists.freedesktop.org
>>> afaict this change broke vmwgfx which now kernel oops right after
>>> boot.
>>> I haven't had the time to look into it yet, so I'm not sure what's
>>> the
>>> problem. I'll look at this tomorrow, but just in case you have some
>>> clues, the backtrace follows:
>> that's a known issue and should already be fixed with:
>>
>> commit d72dcbe9fce505228dae43bef9da8f2b707d1b3d
>> Author: Christian König <christian.koenig@amd.com>
>> Date:   Mon Apr 11 15:21:59 2022 +0200
> Unfortunately that doesn't seem to be it. The backtrace is from the
> current (as of the time of sending of this email) drm-misc-next, which
> has this change, so it's something else.

Ok, that's strange. In this case I need to investigate further.

Maybe VMWGFX is adding more than one fence and we actually need to 
reserve multiple slots.

Regards,
Christian.

>
> z

