Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFFB35F017
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 10:51:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D95596E4C5;
	Wed, 14 Apr 2021 08:51:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A3DF6E486
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 08:51:44 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 o9-20020a1c41090000b029012c8dac9d47so2771470wma.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 01:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SgTS99h3WWD1mgPszmFTe76jbtJ46MHLnHqqyUGMuQ0=;
 b=Fz3NGIt8XnWPoiQNLlgvGgX2zguCjrxyGfrDYuF67IXU+FZYfc/tiRpU77lhKHmR+B
 sbeGhmDqhAZbhQv9kVpJY4uPqOEl4AjbKZFXYm7h41WNRqGQV+WQ97QPuEcPevy0OY0u
 CtyfYljhV2GcKG8co/lTtfA+ozOx0Bxz3O7EGIQs2ok02dhlqZ3DyVlshbwOPt1rSbEf
 t9HTVsNly+wFUgSYAfLL90J0Mz42RoQZTlcLgkfeRX8R0H95Rg41dri5Hq5vwlcP+j0k
 M1P6eHlbm+CQ7e6HqU69sfwL5fnIUx8chtXdLPbE+eOyXd/4PNFUM9sOOJPdqBLNbsfy
 0Ckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SgTS99h3WWD1mgPszmFTe76jbtJ46MHLnHqqyUGMuQ0=;
 b=LvU7HbS3su+Qu7fd0+Om1rLjiAyA9ZPeAkDhNERI1C/wX1zd4Fcj38B/JKfRF89sQy
 mF7QBQuTkERkbEu0dQ1OG+CRSN09EeukoOX+xEEqA1f8+QL3mRueBDRXUEIYF2oC/NLG
 PPvWhRpyPshH0CXi01V4jGbH6Q3peqdaXwGDotOjM1wQJCnjBVh/nkzV9ezHU6LyD8J3
 j1XebGiKi8WJZCJE9oU7so8e3gBDVks5LLd7vh5OJ9K+lDhfN9qJLk6FPSaX8f6L3DUS
 4FFT7jUtTHSpV+aA8Fqw1tZuxBWbYB78I7QCL8pAj1Inhj/lNl+PHvpWI4s+m1OtFHXP
 FYdg==
X-Gm-Message-State: AOAM532jvyIvavfEEYulNRoQTdnxdwgnmyPBq/uoOc5iGhBDMah4EAMx
 pWoMeT1XO/eCJEunCnNKT24=
X-Google-Smtp-Source: ABdhPJzlsoMGmtNqfM+N+3qmXD8myVkzGZ3TeNQOfQEJ9Qx9NmrcG6bRpvhCGDTiQPkNkLctsN4FAQ==
X-Received: by 2002:a05:600c:1548:: with SMTP id
 f8mr1898048wmg.81.1618390302777; 
 Wed, 14 Apr 2021 01:51:42 -0700 (PDT)
Received: from ziggy.stardust ([37.223.140.37])
 by smtp.gmail.com with ESMTPSA id v14sm22498881wrd.48.2021.04.14.01.51.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Apr 2021 01:51:42 -0700 (PDT)
To: Jassi Brar <jassisinghbrar@gmail.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>
References: <1618226325-31927-1-git-send-email-yongqiang.niu@mediatek.com>
 <CABb+yY1b9wD0hoBx=aYzpLcF-=EEG4QTrV68sZj8+rtf5J1aJQ@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2, 0/5] Revert "mailbox: mediatek: remove implementation
 related to atomic_exec"
Message-ID: <1d946d1c-1626-33ed-26ba-f840729d63e7@gmail.com>
Date: Wed, 14 Apr 2021 10:51:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CABb+yY1b9wD0hoBx=aYzpLcF-=EEG4QTrV68sZj8+rtf5J1aJQ@mail.gmail.com>
Content-Language: en-US
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Devicetree List <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/04/2021 17:29, Jassi Brar wrote:
> On Mon, Apr 12, 2021 at 6:18 AM Yongqiang Niu
> <yongqiang.niu@mediatek.com> wrote:
>>
>> This series base linux 5.12-rc2
>> these patches will cause home ui flick when cursor moved,
>> there is no fix solution yet, revert these patches first.
>>
>> change since v1:
>> add mtk-gce.txt and dts modification
>>
>> Yongqiang Niu (5):
>>   Revert "drm/mediatek: Make sure previous message done or be aborted
>>     before send"
>>   Revert "mailbox: mediatek: remove implementation related to
>>     atomic_exec"
>>   Revert "dt-bindings: mailbox: mtk-gce: fix incorrect mbox-cells value"
>>   Revert "arm64: dts: mediatek: mt8183: fix gce incorrect mbox-cells
>>     value"
>>   arm64: dts: mediatek: mt8183: add gce information for mmsys
>>
>>  .../devicetree/bindings/mailbox/mtk-gce.txt        |  2 +-
>>  arch/arm64/boot/dts/mediatek/mt8183.dtsi           |  5 +-
>>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |  1 -
>>  drivers/mailbox/mtk-cmdq-mailbox.c                 | 80 +++++++++++++++++++---
>>  4 files changed, 76 insertions(+), 12 deletions(-)
>>
> Please break the patchsets (this and the other 3) into mailbox only
> and platform specific ones.
> Also, it would help if there are some acked/reviewed by some mtk folks
> especially when reverting patches.
> 

I'd prefer to have DT and mailbox patches together as otherwise the burden on me
to find out which patches in the driver are needed, and to check if these got
accepted, gets higher.

Regards,
Matthias
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
