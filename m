Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C29477567
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 16:09:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE0ED1124FC;
	Thu, 16 Dec 2021 15:09:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2018A1124FD
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 15:09:26 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id m12so38987739ljj.6
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 07:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1qfd395IYWj+B/UdbiFiPVdCXFHwSx1zWwQl0BrdIvo=;
 b=Ztghiy1SxXBJ21k5EHGfOxtkLitrM3pminuWlLG7d35vrjB9Ud0njt3RXd7DzwIITZ
 9R0EkJ7CKk02W2fvI21ouo0VeL6rB583kIEbWMEJRVT8A0/t+WPpMSzI3xaPKP35qMpZ
 JA7LtaXd3Oyb5P3Aemn/pGmzOhomhGHP5nEzGdUjqx1vfeu9WJzgBTXxK8wSx9CgzlkL
 Foj6WyQjz8rD+0rl31WtPDh2E8RXfdQJrk1/o3HRcZ00MmtPLClv2KN61TS7NOqsRuXG
 HCL+NipbTzGoPbcY/ZkN0ILJZx1FSSQeRvrURn3C/Jo2USIuwwi6BZXYvHDckU/wkwlx
 hufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1qfd395IYWj+B/UdbiFiPVdCXFHwSx1zWwQl0BrdIvo=;
 b=QdNz7cgSb055EATVg7hfarMftDvoHld+eMPEeAbFQtVeGsroqr/GLWSZmTQJdAe7Ky
 F+dy4LPtnE8M3Jl6jZebGwTMuzqXITqdMMbiJ98t+coD/G1q/8oc0VVUUg5hKSb/R5cj
 HdIfNDOReweNpBM14T8NtNRyoAEu5apUduslR2IEEEAz5UaIq7za2pvCreVVCCcFdaE4
 +vfJTQwOltqM6h1KU+WBwo22TpQ19L/VnW/1VYWZfUh1yAhRi2Afa6moNAe3sdYxGGlc
 jv/oMlXbvE3FeFKU1vpK+MmM7zZrx1PqZIjpep9NeS6aFaD0rIS3lccUe3THX5U2J3vI
 g/ww==
X-Gm-Message-State: AOAM533bF4Rbo6v8EKKa8Ogpp4ptwYxFGbBsNCjVfnDVvnrrUt/pV7Rj
 njTDvlw2UV0BJMOoB8kjDacn3V+Wk84=
X-Google-Smtp-Source: ABdhPJzSYtr+35JjMyfwDiGDowXvrdjIoh3vwsMwh7YTEgoBMb3070lHBDEXydaKeMXVufN4FZEHmw==
X-Received: by 2002:a05:651c:b11:: with SMTP id
 b17mr15513775ljr.272.1639667364213; 
 Thu, 16 Dec 2021 07:09:24 -0800 (PST)
Received: from [192.168.2.145] (94-29-63-156.dynamic.spd-mgts.ru.
 [94.29.63.156])
 by smtp.googlemail.com with ESMTPSA id s9sm910898lfr.304.2021.12.16.07.09.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 07:09:23 -0800 (PST)
Subject: Re: [PATCH v4 00/22] Support HDMI audio on NVIDIA Tegra20
To: Thierry Reding <thierry.reding@gmail.com>
References: <20211204143725.31646-1-digetx@gmail.com>
 <Ybo6tsnQM6OacoZs@sirena.org.uk>
 <26af30a6-9606-72d0-9258-cf9627ddfe77@gmail.com> <YbtFXcteESF0nLZz@orome>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <03ede0df-e86e-798e-e2c7-c0ed3dc81fca@gmail.com>
Date: Thu, 16 Dec 2021 18:09:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YbtFXcteESF0nLZz@orome>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, Agneli <poczt@protonmail.ch>,
 linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

16.12.2021 16:55, Thierry Reding пишет:
> On Wed, Dec 15, 2021 at 10:19:07PM +0300, Dmitry Osipenko wrote:
>> 15.12.2021 21:57, Mark Brown пишет:
>>> On Sat, Dec 04, 2021 at 05:37:03PM +0300, Dmitry Osipenko wrote:
>>>
>>>> I based S/PDIF patches on Arnd's Bergmann patch from a separate series [1]
>>>> that removes obsolete slave_id. This eases merging of the patches by
>>>> removing the merge conflict. This is a note for Mark Brown.
>>>
>>> That's not in my tree so I'll need either a pull request with the series
>>> or a resend after the merge window.
>>
>> This patch is included as a part of this series, please see the patch #6.
>>
>> I saw that Vinod Koul already merged it into his DMA tree [1] a day ago,
>> but there is no stable branch there.
>>
>> [1]
>> https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git/log/?h=next
>>
>>>  It's also not clear what to do
>>> about the DRM bits, I guess it's probably easiest to just apply them
>>> along with the ASoC patches.
>>
>> I already asked Thierry Reding to take a look at this patchset. He will
>> let to you know how the DRM bits should be handled. Hopefully this
>> should happen tomorrow.
>>
>> We will know how to move forward if Vinod and Thierry will reply ASAP.
>> Otherwise this series will have to wait for the next cycle.
> 
> I've applied the DRM patches to the drm/tegra tree and pulled in the ARM
> device tree changes into the Tegra tree. I think the rest can go through
> ASoC. Well, provided you can sort out the patch 6 issue with Vinod.

Thank you!
