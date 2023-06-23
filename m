Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3933073C8DA
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jun 2023 10:16:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D065D10E0E5;
	Sat, 24 Jun 2023 08:15:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F9C10E639
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 13:12:52 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-5539ada6075so102246a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 06:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1687525972; x=1690117972;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ztC9JD/gutKJP42tTw7xRzDnyP1Mlz22AqRtCxWHul4=;
 b=iReOyCzgXqjGHDqep4+7Y02y+2KsxvqbysTBx4QdxMakwFT9O9Z6y8UTRhYCpdiwGk
 ivfBmaLpXRLdsg2xXtWNoGf0LJW9OuaoWVHjbG5+PmrhjKOTehTkz5xr7u03dJPl3Vvf
 epR4VYk9iCpPZkMT+p54jmiUndhguXzeWsKZiPn3OwVHy+V1VU+7xSZ1lgncoZQcneJS
 pVLxKUfpwqKrHzPfUfH95joX35kksCvYI/qVSfPkEqAU61Mo8RwQARiYkcVaAbzt+5qk
 cYcyAi42FXf01kq9CxVaIQAWB9c34fULDSPKve/N0V/DkCTafLxv3dWbsj8Ke3WxSlSL
 ozRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687525972; x=1690117972;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ztC9JD/gutKJP42tTw7xRzDnyP1Mlz22AqRtCxWHul4=;
 b=dy6NQ7ekRakNOA8ERVmYbxRBgwEriMBPrrF1PIjG/FM/5xV3M3633maVNGbkAf/tE2
 lHtn1cINIBYcZEvFptFqJd1ekocblCQ4LbexMtOr31FTf4o9hdD99m3nDsaJeuF5ZTwC
 Q36q9Vqwi07BC0cQTqUPufdg+mIk7zQfoX/Qa52aN3p6gxB175ys60jExN0skbD4mr0t
 QlLbI0JBL0x7LK8w6sCMf5AKNrR0Yc3Bp60IxmkwSz2ReL6El/BM/pE1bSNnAXQXYgmi
 nnKKx5D4KW9Ol1m7xG/thB0G/1MqRyuar46/V7DxaCe4FXpj8nAKZxNVM7CR1dXik/yF
 /kZQ==
X-Gm-Message-State: AC+VfDx4gjFx2zn4X+GKEvffuUfwJFHbCyHc3XDhojqAONyaMogIApI5
 OItTTUknNFZUF8Eumq5O9B2yNQ==
X-Google-Smtp-Source: ACHHUZ78dOQlFEQQrAnXInKb8JKnRB3NkeUnqCzTvDvkAqdG76W+IPYWNvfD8Ue2cdvcaNnPedDi+w==
X-Received: by 2002:a17:902:dac6:b0:1ac:656f:a68d with SMTP id
 q6-20020a170902dac600b001ac656fa68dmr25602985plx.4.1687525971804; 
 Fri, 23 Jun 2023 06:12:51 -0700 (PDT)
Received: from [10.4.168.167] ([139.177.225.254])
 by smtp.gmail.com with ESMTPSA id
 c15-20020a170903234f00b001b694130c05sm5473889plh.1.2023.06.23.06.12.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jun 2023 06:12:51 -0700 (PDT)
Message-ID: <792beadd-7597-ec8c-e3b1-d8274d68d8c1@bytedance.com>
Date: Fri, 23 Jun 2023 21:12:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 29/29] mm: shrinker: move shrinker-related code into a
 separate file
Content-Language: en-US
To: Vlastimil Babka <vbabka@suse.cz>, akpm@linux-foundation.org,
 david@fromorbit.com, tkhai@ya.ru, roman.gushchin@linux.dev,
 djwong@kernel.org, brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu
References: <20230622085335.77010-1-zhengqi.arch@bytedance.com>
 <20230622085335.77010-30-zhengqi.arch@bytedance.com>
 <f90772f6-11fe-0d8a-7b1c-d630b884d775@suse.cz>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <f90772f6-11fe-0d8a-7b1c-d630b884d775@suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 24 Jun 2023 08:15:48 +0000
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
Cc: linux-bcache@vger.kernel.org, linux-xfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-raid@vger.kernel.org, linux-mm@kvack.org, dm-devel@redhat.com,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vlastimil,

On 2023/6/22 22:53, Vlastimil Babka wrote:
> On 6/22/23 10:53, Qi Zheng wrote:
>> The mm/vmscan.c file is too large, so separate the shrinker-related
>> code from it into a separate file. No functional changes.
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> 
> Maybe do this move as patch 01 so the further changes are done in the new
> file already?

Sure, I will do it in the v2.

Thanks,
Qi

> 
