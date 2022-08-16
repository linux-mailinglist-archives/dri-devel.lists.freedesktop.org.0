Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE71595B31
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 14:04:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C582411AACD;
	Tue, 16 Aug 2022 12:04:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C303F10FAC2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 12:03:53 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id w19so18478511ejc.7
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 05:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=qXuUFA6dzcSFji6bQgTrBDhPKkRTpOenjFFFaEBg5kI=;
 b=UHJLCRj6aZC7JExmGfMqmbjBJMSLQus4l90cEIpD6oiFn5t7AIznfp4vmnoBDBuC89
 Co8rtShOazIQ1/pDTdlKWtiDgaw+N7eefL9j3Hq2vAfUThLRyO9Rb7B5ngUEUCtueeNx
 6zSUM4gJc5mS4F3GNo20/DWYfPsbSyNlWwtfn3dACfywQVqDk01eJeq7pEy3b4eVmyg+
 /xLDWvCsTCVL3VwOqW9vNz1sctfDZfporzdWriNN6X7XNFHs3beFmG8e+snUYDmbD7Xt
 ORToYO/CXU5ilyofZPtHvw1MVcO6aMT9wteaJfa84CKp6U5/G52ooNG3LZs/OF+1Fzi1
 DFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=qXuUFA6dzcSFji6bQgTrBDhPKkRTpOenjFFFaEBg5kI=;
 b=JzIoWItokMXoxnvGCj8QGGym8nw6wV0T567rAXAlAw5XVCRU/DpUE3G2fZGJ4u69wG
 iobFROmWZ9fxdqEnbVBUaWMLiHApT3UWMobvWwJL9UNs4zrOn/FsQJdB+oO8BuAIzEbV
 f4f8i01UNtmDnv69QfPLuafyw2xnLFJuOZXKOexglsLlOVSDnCTTrnBn5/kcrS1+ZlmG
 C2grzilMv4CFCSI5t2P3c5I7TJU33dlCIe/f/fob/bmxDZfgL1FPt7CJXp5FvpXqoClW
 rWXxFcDs7F1um8b0dfRNAW+iAKFNAcBH4CR1NjZ92qz6+n6nG83aOZ7iNGSG5vOJsy5A
 cDGQ==
X-Gm-Message-State: ACgBeo13GtfnBb9wXaQO6hyBOZST3sYiT7hvps90ihKENGc9ml9qSJ2h
 OKlyWKJmxWBb+PLZbJSDToo=
X-Google-Smtp-Source: AA6agR5153oYV8kafc+i58iRbni/4o0+HJFRM9ywzhXxF6J2iekcXpA4igafMBRomyjZJGm0DD3PGA==
X-Received: by 2002:a17:906:9752:b0:738:364a:4ac with SMTP id
 o18-20020a170906975200b00738364a04acmr8730502ejy.759.1660651432330; 
 Tue, 16 Aug 2022 05:03:52 -0700 (PDT)
Received: from [192.168.178.21] (p57b0bd9f.dip0.t-ipconnect.de.
 [87.176.189.159]) by smtp.gmail.com with ESMTPSA id
 op9-20020a170906bce900b0072b810897desm5209994ejb.105.2022.08.16.05.03.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Aug 2022 05:03:51 -0700 (PDT)
Message-ID: <2ce5ff0a-9ab2-d146-04db-487a64714fce@gmail.com>
Date: Tue, 16 Aug 2022 14:03:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v8 2/2] drm/gem: Don't map imported GEMs
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Rob Clark <robdclark@gmail.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>
References: <20220701090240.1896131-1-dmitry.osipenko@collabora.com>
 <20220701090240.1896131-3-dmitry.osipenko@collabora.com>
 <2bb95e80-b60a-36c0-76c8-a06833032c77@amd.com>
 <CAF6AEGtqPeF1DjmBKgzWK39Yi81YiNjTjDNn85TKx7uwicFTSA@mail.gmail.com>
 <2a646ce4-c2ec-3b11-77a0-cc720afd6fe1@collabora.com>
 <YvOav/vF2awVWIu0@phenom.ffwll.local>
 <CAF6AEGvfAJgwBe4+sK0gAkZ++MwH9x4=698C8XSnmfYNMFZqfA@mail.gmail.com>
 <9674d00e-c0d6-ceba-feab-5dc475bda694@collabora.com>
 <CAF6AEGv1cVC9ZNMwpwFOki5CrwD3kSAHM9EUFZGWY-y5zcQsCg@mail.gmail.com>
 <fc019528-7ec7-9e5b-1b6d-c44da14346cf@collabora.com>
 <CAF6AEGv8zSd0fEYB9hd2QOyTt53gFSQoL8JdZtCvtCdYfMfB2Q@mail.gmail.com>
 <73b51dde-689f-64ce-a1c8-0d7c84a2ed66@collabora.com>
 <CAF6AEGuR1cRQYaQBYGnMBzy=XJUcN2o2gzabZaGO2Dj62Uq1DA@mail.gmail.com>
 <CAF6AEGvvR1NUd_GKP=Bxp3VTDMBYT+OwTkkgOWxgYFijZaVVEQ@mail.gmail.com>
 <5f118e10-db7a-a128-1e87-c9dddb65b2ac@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <5f118e10-db7a-a128-1e87-c9dddb65b2ac@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: kernel@collabora.com, dri-devel <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas_os@shipmail.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.08.22 um 13:44 schrieb Dmitry Osipenko:
> [SNIP]
>> The other complication I noticed is that we don't seem to keep around
>> the fd after importing to a GEM handle.  And I could imagine that
>> doing so could cause issues with too many fd's.  So I guess the best
>> thing is to keep the status quo and let drivers that cannot mmap
>> imported buffers just fail mmap?
> That actually should be all the drivers excluding those that use
> DRM-SHMEM because only DRM-SHMEM uses dma_buf_mmap(), that's why it
> works for Panfrost. I'm pretty sure mmaping of imported GEMs doesn't
> work for the MSM driver, isn't it?
>
> Intel and AMD drivers don't allow to map the imported dma-bufs. Both
> refuse to do the mapping.
>
> Although, AMDGPU "succeeds" to do the mapping using
> AMDGPU_GEM_DOMAIN_GTT, but then touching the mapping causes bus fault,
> hence mapping actually fails. I think it might be the AMDGPU
> driver/libdrm bug, haven't checked yet.

That's then certainly broken somehow. Amdgpu should nerve ever have 
allowed to mmap() imported DMA-bufs and the last time I check it didn't.

Regards,
Christian.

>
> So we're back to the point that neither of DRM drivers need to map
> imported dma-bufs and this was never tested. In this case this patch is
> valid, IMO.
>

