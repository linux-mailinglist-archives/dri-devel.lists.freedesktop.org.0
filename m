Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79241591023
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 13:34:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF3D90CFE;
	Fri, 12 Aug 2022 11:34:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6439B8E930;
 Fri, 12 Aug 2022 11:34:07 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id w19so1542929ejc.7;
 Fri, 12 Aug 2022 04:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=2maBmCwKBmigg6muaEXXhf/Ng5GHmKY483ELQvBK7bw=;
 b=WzmVA6wJmViKgJcjJ28fwTes4+4nkLVN3Mx6n7aAByQjaF1kqlO8c/DkZzzNbQ5PMJ
 Q6QRifhtEywKPW0BRycraqPgJbNNV4Fkr0BDi9NwSjofj+/eExHcmIHXfmWBqj8nEM+V
 SJ6yUML0yO8yFd9lLsoNczBtQtybcTMT4WUr1ptuUKBS3/Rda9YC3hjAtXIBeNWzrfQv
 8awekeP8HdFvSg9RwEt6hfJjxWj4IHX4MucvbIt4QDscDPd/6Xe/c8eYLuCx5yo9ewIX
 pCKNLJxEdZn4+tUGCfNxm+c1cgbj7a+b8mhWZ+qT9Wu2+c+9oyIWqC1lkYhae0HgqZSg
 TC0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=2maBmCwKBmigg6muaEXXhf/Ng5GHmKY483ELQvBK7bw=;
 b=A7jY1idAC9750ssqeo5YGLPUPliyyYsxUykEwxWLUbo/yM5idnWAdlQKI6F8/UB9OX
 yYJzaOqA6P4Wvq2p91JTHmqKW46zB/BFnrY4ZYHdws229czIA7+17yKlHGA3LRtk67Zv
 eBL1CR8Sp9Nu3OLYBi0IfwW7vyQXpyWzONFIj5D+Z2pZz5aX5Wau2PuOOLdmHa9qfcfH
 0wTchpegQ2MsFmDlKjxIDUWBUD7dg6Zd6S2y+7wI0y3zLmUrhJdcJICmGz64CoS+blAQ
 ltMQHTicMn/GYM/KhFl/rNyzl/dad/D9UH5F5hnSrmAUnFOn13RaSm9LBKa7V7os0tAD
 /tJQ==
X-Gm-Message-State: ACgBeo32I73lBrsanLs6dWfKYaNrYnXD77/TNhY/plcN5jVnbEkWvIsR
 xTyv59uOSY2eknBm1KUOeQ0=
X-Google-Smtp-Source: AA6agR7yLrz2JyTe8JHAoaW31lDloNP6q9ah/gkL0Xj0JLrU44S+nATJXnQ7Xvnv8KPuB3tTB73pJw==
X-Received: by 2002:a17:906:eeca:b0:730:6880:c397 with SMTP id
 wu10-20020a170906eeca00b007306880c397mr2352637ejb.593.1660304045907; 
 Fri, 12 Aug 2022 04:34:05 -0700 (PDT)
Received: from [192.168.178.21] (p57b0bd9f.dip0.t-ipconnect.de.
 [87.176.189.159]) by smtp.gmail.com with ESMTPSA id
 jj23-20020a170907985700b0073151ce7726sm696022ejc.100.2022.08.12.04.34.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Aug 2022 04:34:05 -0700 (PDT)
Message-ID: <93484389-1f79-b364-700f-60769fc5f8a5@gmail.com>
Date: Fri, 12 Aug 2022 13:34:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [Linaro-mm-sig] [PATCH v2 3/5] dma-buf: Move all dma-bufs to
 dynamic locking specification
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20220725151839.31622-1-dmitry.osipenko@collabora.com>
 <20220725151839.31622-4-dmitry.osipenko@collabora.com>
 <6c8bded9-1809-608f-749a-5ee28b852d32@gmail.com>
 <562fbacf-3673-ff3c-23a1-124284b4456c@collabora.com>
 <87724722-b9f3-a016-c25c-4b0415f2c37f@amd.com>
 <0863cafa-c252-e194-3d23-ef640941e36e@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <0863cafa-c252-e194-3d23-ef640941e36e@collabora.com>
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
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Thierry Reding <thierry.reding@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-rdma@vger.kernel.org,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas_os@shipmail.org>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 spice-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, David Airlie <airlied@linux.ie>,
 amd-gfx@lists.freedesktop.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 10.08.22 um 20:53 schrieb Dmitry Osipenko:
> On 8/10/22 21:25, Christian König wrote:
>> Am 10.08.22 um 19:49 schrieb Dmitry Osipenko:
>>> On 8/10/22 14:30, Christian König wrote:
>>>> Am 25.07.22 um 17:18 schrieb Dmitry Osipenko:
>>>>> This patch moves the non-dynamic dma-buf users over to the dynamic
>>>>> locking specification. The strict locking convention prevents deadlock
>>>>> situation for dma-buf importers and exporters.
>>>>>
>>>>> Previously the "unlocked" versions of the dma-buf API functions weren't
>>>>> taking the reservation lock and this patch makes them to take the lock.
>>>>>
>>>>> Intel and AMD GPU drivers already were mapping imported dma-bufs under
>>>>> the held lock, hence the "locked" variant of the functions are added
>>>>> for them and the drivers are updated to use the "locked" versions.
>>>> In general "Yes, please", but that won't be that easy.
>>>>
>>>> You not only need to change amdgpu and i915, but all drivers
>>>> implementing the map_dma_buf(), unmap_dma_buf() callbacks.
>>>>
>>>> Auditing all that code is a huge bunch of work.
>>> Hm, neither of drivers take the resv lock in map_dma_buf/unmap_dma_buf.
>>> It's easy to audit them all and I did it. So either I'm missing
>>> something or it doesn't take much time to check them all. Am I really
>>> missing something?
>> Ok, so this is only changing map/unmap now?
> It also vmap/vunmap and attach/detach: In the previous patch I added the
> _unlocked postfix to the func names and in this patch I made them all to
> actually take the lock.


Take your patch "[PATCH v2 2/5] drm/gem: Take reservation lock for 
vmap/vunmap operations" as a blueprint on how to approach it.

E.g. one callback at a time and then document the result in the end.

Regards,
Christian.

>
>> In this case please separate this from the documentation change.
> I'll factor out the doc in the v3.
>
>> I would also drop the _locked postfix from the function name, just
>> having _unlocked on all functions which are supposed to be called with
>> the lock held should be sufficient.
> Noted for the v3.
>
>> Thanks for looking into this,
>> Christian.
> Thank you for the review.
>

