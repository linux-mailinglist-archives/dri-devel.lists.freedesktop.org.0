Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA0D78EE95
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 15:26:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12D8A10E676;
	Thu, 31 Aug 2023 13:26:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8292310E674;
 Thu, 31 Aug 2023 13:26:53 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-31ae6bf91a9so639813f8f.2; 
 Thu, 31 Aug 2023 06:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693488412; x=1694093212; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=izN8y1TLkmCn8It+Lcd7BlxbIdHxMn/IMnM8Q8VhJ14=;
 b=KWEoHK+Ov9lIFJ8ePyP97EM6Bh/3xJsL2Irg7hQ4oYOQiWt6qFVOzKOTvW5pxiHoqZ
 /3A6QO2jNZZIBS7e5NbWNH3BBjscaU2K2lfJ83rKqwP+bHYi2XaaIMeT+hCkp4XhndQP
 77Y7aNJ+C5lntXGnOLnG8bPdBGcS0vVexuGwBjaVM2VT+YCr4LZ5Yu2kE29uK+LzGEIM
 l2b8sbPCHfFWC/atVpJCCoBjteylB/Ws/qQjbjORNjAFtTNZ0t08fuYfrbBg8sT4bn6E
 y8Rx/u7O1jgmzOFgBBZRJQSYOkmOrGgQhZJO4H/rzzrSgGKV68NLZTG8QFUmX/jqoVAZ
 E/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693488412; x=1694093212;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=izN8y1TLkmCn8It+Lcd7BlxbIdHxMn/IMnM8Q8VhJ14=;
 b=XYuJ7i3prO84Ykp3/9VND5IrImiMT0xrZQFxuahYSchwjfafm8pM2pac1CxUpXbI1b
 cRZW6E4Fl29uN6bQvqwULzgxsx6BEUYqPn7EOU4enCJzL37vvxuEZuXB256qnif83uDN
 6uIQAeT8tu8Q7pocQkDtIMdMugLXz8ZKRGV6aJjwumQTohB4ODub43njd/vACeh6ZBIs
 J8H3jqWmSLNA940edTuk+Iu8YurOZ6RiqgbrJ1Z2Mm9qVk7u6KdkXvCVmssxj0FNrfSS
 XzICg1d7kzzvZbnGwe9VMmt5pw6NJU33jNlA6N48oEl/GGIv8tx+vJ+o9DbDW0iuoTOl
 0Y7A==
X-Gm-Message-State: AOJu0YwqqIhvzHxevMwioO8+mwBr2ycEfAKOKxJoXoUn5nO56F/mcAC/
 wgA59eMlHyycF5RqV50AtX8=
X-Google-Smtp-Source: AGHT+IHnagwLLeLlCCtU5v5GLAHjoVb8snl71EU2/1lG7lELEL/vPVePoL2VczUDyMaDlI1V9GLwXg==
X-Received: by 2002:a5d:49c7:0:b0:317:70da:abdd with SMTP id
 t7-20020a5d49c7000000b0031770daabddmr4047998wrs.59.1693488411526; 
 Thu, 31 Aug 2023 06:26:51 -0700 (PDT)
Received: from [10.254.108.106] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a5d5389000000b0031753073abcsm2240940wrv.36.2023.08.31.06.26.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Aug 2023 06:26:50 -0700 (PDT)
Message-ID: <c657653e-24d8-5790-a91c-4c13bb9eaeb0@gmail.com>
Date: Thu, 31 Aug 2023 15:26:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH AUTOSEL 5.10 13/22] drm/amdgpu: install stub fence into
 potential unused fence pointers
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
References: <20230724012419.2317649-1-sashal@kernel.org>
 <20230724012419.2317649-13-sashal@kernel.org>
 <CAPaKu7RTgAMBLHbwtp4zgiBSDrTFtAj07k5qMzkuLQy2Zr+sZA@mail.gmail.com>
 <55fc4a28-1e17-44df-2069-a688828080e6@gmail.com>
 <2023083145-scoured-celery-2511@gregkh>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <2023083145-scoured-celery-2511@gregkh>
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
Cc: Sasha Levin <sashal@kernel.org>, airlied@linux.ie,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 stable@vger.kernel.org, Lang Yu <Lang.Yu@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 31.08.23 um 12:56 schrieb Greg KH:
> On Thu, Aug 31, 2023 at 12:27:27PM +0200, Christian König wrote:
>> Am 30.08.23 um 20:53 schrieb Chia-I Wu:
>>> On Sun, Jul 23, 2023 at 6:24 PM Sasha Levin <sashal@kernel.org> wrote:
>>>> From: Lang Yu <Lang.Yu@amd.com>
>>>>
>>>> [ Upstream commit 187916e6ed9d0c3b3abc27429f7a5f8c936bd1f0 ]
>>>>
>>>> When using cpu to update page tables, vm update fences are unused.
>>>> Install stub fence into these fence pointers instead of NULL
>>>> to avoid NULL dereference when calling dma_fence_wait() on them.
>>>>
>>>> Suggested-by: Christian König <christian.koenig@amd.com>
>>>> Signed-off-by: Lang Yu <Lang.Yu@amd.com>
>>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>>> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>>>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>>>> ---
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 6 ++++--
>>>>    1 file changed, 4 insertions(+), 2 deletions(-)
>>> We start getting this warning spew on chromeos
>> Yeah because the older kernels still kept track of the last VM fence in the
>> syncobj.
>>
>> This patch here should probably not have been back ported.
>>
>> Why was that done anyway? The upstream commit doesn't have a CC stable and
>> this is only a bug fix for a new feature not present on older kernels.
> It is part of the AUTOSEL process.

Could we prevent patches from being backported by adding a Fixes: tag?

Thanks,
Christian.
