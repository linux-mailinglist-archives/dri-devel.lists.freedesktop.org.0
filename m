Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 762014774A6
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 15:29:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E71A21122F3;
	Thu, 16 Dec 2021 14:29:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B09B71122F3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 14:29:28 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id z8so38772491ljz.9
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 06:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jmTSSpcNWtwfnBOzQ4SXDAvbSBKcOFTBcwOus93VJW4=;
 b=PG2xS2vLUFH54ArG56D+Q342pRiH3jdFwS4K/6S4B/nw7Y2ox89atjJk4nUylobM1w
 NrHXA+Tp2PDubHrme4IATwGXahvbiRKJuyOVxiVfbp5OAZ1zmFUCcW6ZTHCAOPDO5KlI
 DxcIaap5F+3oy943AsuTQKyhGmbBEC2vAL9N9Jd51tukt9puT+E1/DGPgWx+TlMEKCDN
 5YgH36A3+Qtej4UaSRMEuzvcu3V528Qz5qi2f7ql7nGF8SNkDPSArnuPKmx4B69FToTJ
 sRGISFsX6sRbqbBLyA6brQjtFl6WHtcyGZxxs/CGupN+c+fr/VXwcQJizLEipEpvTTOx
 GTHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jmTSSpcNWtwfnBOzQ4SXDAvbSBKcOFTBcwOus93VJW4=;
 b=JkjXDEfFhvpbrJzz8I3x8wI4j1/P0seArS2W41bkMdo6yGrVb7wi/y8Xa3aGNa/DSI
 sJZfgBu+X8PoIlW/LSPbUkNiodJngVsfEZGSw57Df5nfqMZkCat/JmCprVnIcCmrfN7S
 Tr/KyFOpjUxmzVgInzsWODliuvAFNHhhowEmQX0ORX4LnMnt2/MPXYRhH7qy/ehIDzfI
 Yt4AAwLhuSec3QvFWgy0HHdJuYuQqZAJV0Uc+HxezdsOobn9fiqCGretQOCFPopDWJ0h
 D0hmIpFDTqFytE9Set1zgIhUOgyF4xzVc1uSR0Wb4lZpTOUWhZIMWbvd4ZLU+u6xFLbM
 Bh2Q==
X-Gm-Message-State: AOAM532jdw4yzWO/HYZ1KSbGEIgkjvQqv2IhTdjFm8QhCl1U2JnF3kkC
 Bz+12QaQW9dAkhwvQG2Am6I0TrhikAA=
X-Google-Smtp-Source: ABdhPJwHopng7TTn6djyhWoM581vIPB/7Ea84WYzSp8kNNJXVSzEf+3IcwroTLJc3Wygi8UzwwagkQ==
X-Received: by 2002:a2e:8e88:: with SMTP id z8mr15090638ljk.197.1639664966914; 
 Thu, 16 Dec 2021 06:29:26 -0800 (PST)
Received: from [192.168.2.145] (94-29-63-156.dynamic.spd-mgts.ru.
 [94.29.63.156])
 by smtp.googlemail.com with ESMTPSA id d10sm898153lfv.114.2021.12.16.06.29.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 06:29:26 -0800 (PST)
Subject: Re: [PATCH v4 00/22] Support HDMI audio on NVIDIA Tegra20
From: Dmitry Osipenko <digetx@gmail.com>
To: Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
References: <20211204143725.31646-1-digetx@gmail.com>
 <Ybo6tsnQM6OacoZs@sirena.org.uk>
 <26af30a6-9606-72d0-9258-cf9627ddfe77@gmail.com>
Message-ID: <7179a409-d838-0e9e-4600-785e69c3e3a6@gmail.com>
Date: Thu, 16 Dec 2021 17:29:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <26af30a6-9606-72d0-9258-cf9627ddfe77@gmail.com>
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
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Rob Herring <robh+dt@kernel.org>, Agneli <poczt@protonmail.ch>,
 linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

15.12.2021 22:19, Dmitry Osipenko пишет:
> 15.12.2021 21:57, Mark Brown пишет:
>> On Sat, Dec 04, 2021 at 05:37:03PM +0300, Dmitry Osipenko wrote:
>>
>>> I based S/PDIF patches on Arnd's Bergmann patch from a separate series [1]
>>> that removes obsolete slave_id. This eases merging of the patches by
>>> removing the merge conflict. This is a note for Mark Brown.
>> That's not in my tree so I'll need either a pull request with the series
>> or a resend after the merge window.
> This patch is included as a part of this series, please see the patch #6.
> 
> I saw that Vinod Koul already merged it into his DMA tree [1] a day ago,
> but there is no stable branch there.
> 
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git/log/?h=next
> 

Vinod, will you be a able to create immutable branch for us with the
"dmaengine: kill off dma_slave_config->slave_id" patches [1]?

[1] https://lore.kernel.org/all/20211122222203.4103644-1-arnd@kernel.org/
