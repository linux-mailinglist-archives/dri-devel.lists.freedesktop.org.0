Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4289558BC37
	for <lists+dri-devel@lfdr.de>; Sun,  7 Aug 2022 20:05:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B87F10F2F3;
	Sun,  7 Aug 2022 18:05:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 290F610F2F3;
 Sun,  7 Aug 2022 18:05:19 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id qn6so1036147ejc.11;
 Sun, 07 Aug 2022 11:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=rJlTAP175XGMtC5oPLKPFRjtzv9qHN9ccgYjtPQsP4A=;
 b=E6N94+8OzRBNvy8eq20JABN+2GNie2mCHWxVQ50cga31PsUjAXbL++4gqbWnZS008o
 ZGUXjtW02ZqUVSj8oAHHrcX1WBuiu+NIoy6prlMJFWOc9+Di6FQhSA2FQNuoiJ+dgssb
 mRrkmiOmO9pzXr5iFxHltjWOi4vD4BhlUrxsLxuOg5iEFl2r8nkvOHpMyOSsUG4JI1iB
 f6zjrsRwD+HSmtnrOTrw/5K31r6nVrSRfy4PJeZB6kLjY+kJlUMICDM05hjccr0hFkkE
 x8FBu4esmgCgsvSa1MfHMKhxGaGlB486g3jVejPHWhDKxCIOJqd5MUjQdTzaX9ydTgVw
 4mXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=rJlTAP175XGMtC5oPLKPFRjtzv9qHN9ccgYjtPQsP4A=;
 b=BQ7m2SDwhkcziLX1eAtI/5ri0cbXpPpjwVP+5s3Smh4rAwIS7Y+/fHE0MpsZK0f03I
 nSvCaWtTUhH5ezxrZX3hQzlTLZ4i+OlJwGO2QhX9IC0v2gbqObuudDvrv3WVHXm8S6aA
 YDReadreMRjBfzJut1N4C9XI9dhR1Fbu8ZfEDyxfxZXSmpS8TFLTRsHf++GVC5IAwjMa
 C5Z1BrRCG092xv7tD9FBJFwslcrF+FMdf9/nso/r9sORoyY9EhoEyLNP12tXRuhqgj0a
 d8jhefx40vvhZEMhvDr2Se2I6z8pYlYV4LKkH4EgeIkEnLyDGmsdiJ+N4feOZ/+Q7F5o
 V8oA==
X-Gm-Message-State: ACgBeo1pFU+R1TdRN4079OsAj32YzQiKrQ/CvWPVy99ZoDnlwa500wqo
 xYg6smk3Eqt2SClz7+dA+ao=
X-Google-Smtp-Source: AA6agR5O/T3LDq69E1iimyzb1QsQDMW15ghtqaKeXLaYNdLHq9XyC/fhmjiAkZTyvpYAzxf6sdHmVA==
X-Received: by 2002:a17:907:75d5:b0:730:b051:d93f with SMTP id
 jl21-20020a17090775d500b00730b051d93fmr11156869ejc.568.1659895517545; 
 Sun, 07 Aug 2022 11:05:17 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:f019:ef7b:173c:a9d2?
 ([2a02:908:1256:79a0:f019:ef7b:173c:a9d2])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170906200200b0073100dfa7b0sm3032911ejo.8.2022.08.07.11.05.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Aug 2022 11:05:17 -0700 (PDT)
Message-ID: <e2423bd7-ef73-8d43-c661-a19c80ad1a26@gmail.com>
Date: Sun, 7 Aug 2022 20:05:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [Linaro-mm-sig] [PATCH 1/3] dma-buf: Add ioctl to query mmap info
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20220729170744.1301044-1-robdclark@gmail.com>
 <20220729170744.1301044-2-robdclark@gmail.com>
 <3d2083aa-fc6c-6875-3daf-e5abe45fb762@gmail.com>
 <CAF6AEGvKdM3vyCvBZK=ZcdGmak7tsrP1b8ANyyaMjVfNDViqyw@mail.gmail.com>
 <973de2f8-75e4-d4c7-a13a-c541a6cf7c77@amd.com>
 <CAF6AEGuhQT6A_jh8kLWh5xMoUGc1osdewyBk-8NoprtWOHseaQ@mail.gmail.com>
 <2fc74efe-220f-b57a-e804-7d2b3880d14f@gmail.com>
 <CAF6AEGv9H+fSFKPNqwPxYUjkgj05AimpXbp-p_JL8nKLnzON=w@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CAF6AEGv9H+fSFKPNqwPxYUjkgj05AimpXbp-p_JL8nKLnzON=w@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.08.22 um 19:56 schrieb Rob Clark:
> On Sun, Aug 7, 2022 at 10:38 AM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> [SNIP]
>> And exactly that was declared completely illegal the last time it came
>> up on the mailing list.
>>
>> Daniel implemented a whole bunch of patches into the DMA-buf layer to
>> make it impossible for KVM to do this.
> This issue isn't really with KVM, it is not making any CPU mappings
> itself.  KVM is just making the pages available to the guest.

Well I can only repeat myself: This is strictly illegal.

Please try this approach with CONFIG_DMABUF_DEBUG set. I'm pretty sure 
you will immediately run into a crash.

See this here as well 
https://elixir.bootlin.com/linux/v5.19/source/drivers/dma-buf/dma-buf.c#L653

Daniel intentionally added code to mangle the page pointers to make it 
impossible for KVM to do this.

If the virtio/virtgpu UAPI was build around the idea that this is 
possible then it is most likely fundamental broken.

Regards,
Christian.
