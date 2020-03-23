Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E80D18FCE6
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 19:43:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02FC06E3F0;
	Mon, 23 Mar 2020 18:43:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75FD76E3F0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 18:43:23 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id 65so1725906wrl.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 11:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/i+pWufMeUwyq6GwAo/H6HMmQLNl5DHih8a9gqbupHE=;
 b=gmRPb6O649qSYh8fkBt2WbaW3/yQ0cjo7aY7UPapP8CjQVetV/WsU2a7sR/+i5QN5p
 G77HVAZhQ5V2mcm8IWIeJ4JUOx7OexWj0+VzfPuFGvEpiltReVspmEZAK035kLPSr4TY
 kU4YkHKC0LhP2oeIko7/TItZIGvmm59XCFayb1ACnzY//pbFItIaIns41xHfS9DVAqpQ
 zPlynh/Pj5ish+taCGIKVsJ77zgw3nE/JVHu2YBD9xrA5Utwy0DW3hnBuFRS8ea55C5v
 IDF1cEinnAkZcfAMRnjo07wVcfXlhFA26mbvY6+WEYk9iXtO02SgQT1hAWMxXxSlAjRy
 lgWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/i+pWufMeUwyq6GwAo/H6HMmQLNl5DHih8a9gqbupHE=;
 b=kdo0m7WtluaOlt7sK41+IvmIhxIx56ujoe6wRgVyfKfkTuuvAy2Gwlx/7ZspnhMFyA
 4jLfwtYQ6Gskn97B3wB7c61kRydeWynMP2y6GCHW3QUey1YZ4w/vjqeZEAIqzAIaqtet
 AQDh4HVzwHBtlr6jek1/Kln3sLfMCIGcDPYzkJ+dqjuLf0YdePGDP3eVKt0FFMO6DtrG
 Fi8jQiAefjWz+Tlaom6WGLhPYkjArBarSIt43Y5VVYldhSXhZrqCLuR3p2hCQ9HMsmyn
 KT83RQNNdaODYSBhX8Rk5+g5S9OzasUG3Lt2QNJobC/1OjQ9xMqigYKlNoLCBbrCcDuJ
 PECg==
X-Gm-Message-State: ANhLgQ2IQx+pwjiZBeOmLt9PbBLrdk3CICmy+uQJHqllXq0hpaW+wwce
 fNYAZmODLKvlNxNe8fDBCNQ=
X-Google-Smtp-Source: ADFU+vt8kqc0RLmgu7I8YP4obx4Ug+Gwvd3movyqMa4IXW+CJJGDO/QpwkGQJsJxxp8wkcRoCk8JSg==
X-Received: by 2002:adf:80af:: with SMTP id 44mr32133577wrl.241.1584989001986; 
 Mon, 23 Mar 2020 11:43:21 -0700 (PDT)
Received: from [192.168.1.125] (46-126-183-173.dynamic.hispeed.ch.
 [46.126.183.173])
 by smtp.gmail.com with ESMTPSA id f14sm643784wmb.3.2020.03.23.11.43.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Mar 2020 11:43:21 -0700 (PDT)
Subject: Re: [git pull] feature/staging_sm5
To: Dave Airlie <airlied@gmail.com>
References: <20200320225659.8431-1-rscheidegger.oss@gmail.com>
 <CAPM=9tyfeZEy==Aq0U0y8nB=ct2S1JCCriN9CwoKS8gXZ6-e2Q@mail.gmail.com>
From: Roland Scheidegger <rscheidegger.oss@gmail.com>
Message-ID: <59050049-7fb4-b3c1-c9f3-df1bf26d2e4e@gmail.com>
Date: Mon, 23 Mar 2020 19:43:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <CAPM=9tyfeZEy==Aq0U0y8nB=ct2S1JCCriN9CwoKS8gXZ6-e2Q@mail.gmail.com>
Content-Language: de-DE
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
Cc: Dave Airlie <airlied@redhat.com>,
 Linux-graphics-maintainer <linux-graphics-maintainer@vmware.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.03.20 um 01:36 schrieb Dave Airlie:
> On Sat, 21 Mar 2020 at 08:57, Roland Scheidegger (VMware)
> <rscheidegger.oss@gmail.com> wrote:
>>
>> Dave, Daniel,
>>
>> vmwgfx pull for for 5.7. Needed for GL4 functionality.
>> Sync up device headers, add support for new commands, code
>> refactoring around surface definition.
> 
> Two things,
> 
> 1.for some reason patchwork didn't process this, Daniel might be able
> to tell me why I forget who to ask everytime :-)
> 
> 2. Not sure how happy fd.o gitlab is to host kernel trees, might be
> safe to stick to old school anongit until we work it out.
Alright I put it up here now (after fiddling with it for a long time I
figured out how to do it...):
https://cgit.freedesktop.org/~sroland/linux/


> 
> I'm happy to process this but it should be in patchwork so we can make
> sure the process is followed.
Ok I guess I did something wrong but I really need to know what :-).
Sorry I'm new to this workflow.

Roland

> 
> Dave.
>>
>> Preliminary mesa userspace code using these new vmwgfx features
>> can be found at: https://gitlab.freedesktop.org/bhenden/mesa
>>
>> The following changes since commit dad569af718c4e603c35f59ed03bf0555633dd95:
>>
>>   drm/vmwgfx: Refuse DMA operation when SEV encryption is active (2020-01-28 09:27:45 +0100)
>>
>> are available in the Git repository at:
>>
>>   git@gitlab.freedesktop.org:sroland/vmwgfx_drm.git feature/staging_sm5
>>
>> for you to fetch changes up to 4526035058cc6cc09afbca3a5d86862438ae1edf:
>>
>>   drm/vmwgfx: Use vmwgfx version 2.18 to signal SM5 compatibility (2020-03-20 23:35:53 +0100)

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
