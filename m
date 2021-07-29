Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D96033DA0EA
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 12:14:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BEFD6E0AF;
	Thu, 29 Jul 2021 10:14:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 423686E0AF
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 10:14:22 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id n21so3348001wmq.5
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 03:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=CbFHCpPlzhscajakLbbh3EIk/BRFf4SX49QUa0d5Qg8=;
 b=iiRfREWMNqV+qofxci/nzSz0YAr9K6MCEnf8mrHjk5y30QSLdkiVVWBq2cSSMhixN3
 ry579tv1iYeCv29lJtfmG5FwAtxbT5yYu5lAVL8ZpVNvJ53JkuPkc7CG6zDCoWMOyRFX
 GADeLhCmxvmdJVr1mDhX6/g8ZgA2/q4W9C+er3WP4hMov+Tsm9dSAt+WgDJ4hr1RX+rn
 E/qLsNO2AIRIJIm5SV1Y30DYw9Cw08mbLnPBLmj4yUu3UDnnqb6cip/FaecTccXJG/e3
 l5ydK+ERFnB7VVy/Ts8KO7uAifGrAIXPr/o+CFsOc3K3/kwQNLOzOSOnJJR7wDL0EEe/
 Nt+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=CbFHCpPlzhscajakLbbh3EIk/BRFf4SX49QUa0d5Qg8=;
 b=iuGxFfuhhNfl5zjCmQJ+QwhiDQqXwy4DHOF/EYFqHdE2NWBjxLvFgXsN0YF4AIg0iN
 LHdx1VkFzTFnkns2AVRo0s/9ySVP5udNCLLj57CV/MuxVvE1by1bB8e9TLwYS20FukiB
 5sHrxKTADi8NfF895HvlCq39GS59iSSm9uMJi+2vepl2AvmYy6914o/nyLzdtuHJd7l9
 ZLNXK+Ve0HbmovDVKe8ZTrRewgdmklp7pb9bhNNhnrePk+qHiBK2w664cZKdC1JugfTM
 TAMG9gxPzNAZwmhekiVt76M6+akKB2Ww2ijS2/h9KOszG1p+lRPpdlpY7Vxr2Gd4rfcD
 E7sA==
X-Gm-Message-State: AOAM532Y4gOiwAqwCR6tE+MBeztA9QR7JsO+c7MdyOr39oMbHOLBPqKJ
 sp4NvkYGxO1CUfi8koTYxQk=
X-Google-Smtp-Source: ABdhPJz5727odHJWfYQdPwGMdYsRDkR36uAkRZDsHt9CJwGj6udF1FY1AywRQgAgB56AGxuvCy2G9A==
X-Received: by 2002:a1c:a7d2:: with SMTP id q201mr13967106wme.61.1627553660808; 
 Thu, 29 Jul 2021 03:14:20 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:4b10:6e80:f619:9837?
 ([2a02:908:1252:fb60:4b10:6e80:f619:9837])
 by smtp.gmail.com with ESMTPSA id d14sm2751552wrs.49.2021.07.29.03.14.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 03:14:20 -0700 (PDT)
Subject: Re: [RFC 0/4] dma-fence: Deadline awareness
To: Pekka Paalanen <ppaalanen@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20210726233854.2453899-1-robdclark@gmail.com>
 <28ca4167-4a65-0ccc-36be-5fb017f6f49d@daenzer.net>
 <CAF6AEGuhQ2=DSDaGGVwBz5O+FoZEjpgoVJOcFecpd--a9yDY1w@mail.gmail.com>
 <99984703-c3ca-6aae-5888-5997d7046112@daenzer.net>
 <CAJs_Fx4O4w5djx3-q5zja51-ko_nQ0X2nEk3qoZB_axpBVSrKA@mail.gmail.com>
 <f6d73ec5-85f9-1b18-f2d2-a5f3b7333efa@gmail.com>
 <c9ee242e-542e-e189-a1ec-c1be34d66c93@daenzer.net>
 <04d44873-d8e6-6ae7-f0f9-17bcb484d697@amd.com>
 <9d5f4415-d470-3bc1-7d52-61ba739706ae@daenzer.net>
 <eedfdc75-72f8-9150-584b-c5e9d16db180@amd.com>
 <20210728165700.38c39cf8@eldfell>
 <74e310fa-e544-889f-2389-5abe06f80eb8@amd.com>
 <20210729112358.237651ff@eldfell>
 <3675d530-c9fc-7ec9-e157-b6abeeec7c2a@amd.com>
 <20210729121542.27d9b1cc@eldfell>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <15cf73a8-eda4-3559-561a-a05a14f445d0@gmail.com>
Date: Thu, 29 Jul 2021 12:14:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729121542.27d9b1cc@eldfell>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Rob Clark <robdclark@chromium.org>, Matthew Brost <matthew.brost@intel.com>,
 Jack Zhang <Jack.Zhang1@amd.com>, Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Roy Sun <Roy.Sun@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 Lee Jones <lee.jones@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 29.07.21 um 11:15 schrieb Pekka Paalanen:
> [SNIP]
>> But how does it then help to wait on the CPU instead?
> A compositor does not "wait" literally. It would only check which state
> set is ready to be used, and uses the most recent set that is ready. Any
> state sets that are not ready are ignored and reconsidered the next
> time the compositor updates the screen.

Mhm, then I'm not understanding what Michel's changes are actually doing.

> Depending on which state sets are selected for a screen update, the
> global window manager state may be updated accordingly, before the
> drawing commands for the composition can be created.
>
>> See what I'm proposing is to either render the next state of the window
>> or compose from the old state (including all atomic properties).
> Yes, that's exactly how it would work. It's just that state for a
> window is not an independent thing, it can affect how unrelated windows
> are managed.
>
> A simplified example would be two windows side by side where the
> resizing of one causes the other to move. You can't resize the window
> or move the other until the buffer with the new size is ready. Until
> then the compositor uses the old state.
>
>> E.g. what do you do if you timeout and can't have the new window content
>> on time? What's the fallback here?
> As there is no wait, there is no timeout either.
>
> If the app happens to be frozen (e.g. some weird bug in fence handling
> to make it never ready, or maybe it's just bugged itself and never
> drawing again), then the app is frozen, and all the rest of the desktop
> continues running normally without a glitch.

But that is in contradict to what you told me before.

See when the window should move but fails to draw it's new content what 
happens?

Are the other windows which would be affected by the move not drawn as well?

Regards,
Christian.

>
>
> Thanks,
> pq

