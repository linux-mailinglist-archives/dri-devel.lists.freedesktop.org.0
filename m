Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A2667AD54
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 10:09:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B84F510E75D;
	Wed, 25 Jan 2023 09:08:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74FD610E760
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 09:08:56 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 fl11-20020a05600c0b8b00b003daf72fc844so770797wmb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 01:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=6TtgPkbCdpmWueCCZKRjvZBvWyeUob334SpBx4tImis=;
 b=LIgV6OxS+JhH3RpbniLXzz+m69QrnlgL4BippuNwgV1NqTn9mOhVKU9Tu0EvEE26dk
 l7FyIdKRO08Y3dVyRdfOJgFsrpYFaWzP8ykKRC+Ns0HNnStMTGhdU/Gw3qqp3prMAhkI
 zaKQN8eb+tlGNcy8hQJP9aMekY0joG/PoPitFbJ4I46ZH+hdb31O8KQoTJZv+/DPLHyP
 zMUlbGdWEnI/Bi00SKPvTl994ijhShCF5+W9xj5JJS0VAdD34Y9gaTIh9ho6hoqW8VgG
 K/s6z3rICIRXlywBY9sLEBhN7HyDrE1TGgG5AQRRZBwNX+yuYUI3v+O1Fdii3UrK1fFn
 uMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6TtgPkbCdpmWueCCZKRjvZBvWyeUob334SpBx4tImis=;
 b=zY2OFhfDEMcI0CF9nASjGXvEv47mTqE5EOizYB8t8otT8MnLBOWp+t4jA9uZkfvDcq
 xKOFQYETyh3BWGZBbtOb2fM+t3g+wOsXecIXnjd0hOZJ2AEUbXNWYdFSVBlBemCCLT75
 4lCwFeUpOAVOg1xumvyv8g5BScqKxsk1zWjV0Gj8PA/Tlrim3Z2cKbEG11Luytn6pSS8
 4jCjAtPhlIkx4wyJFiUtWptUH4WThgiVw+r+F5IizA8xfcjfQfuEre5kDtmbE/CedhP9
 3o2mNy2C0f9FWqkMbzvODAi3z/04X7uFavvYqMrbkhmxTJ2TxJp32v28Lj0bKBtzRG0W
 dHsg==
X-Gm-Message-State: AFqh2koqvTfpmvsMTRyGH4ZuX3pUGycZr/sqkZ4PJ1pvPgt8nJvw7hjO
 s6bBgBCq8zG/IIKClt1a7pfY6Q==
X-Google-Smtp-Source: AMrXdXvZrXeQjw594Z0T1+4tC0efU2qVxBH471U4WrdTSn8wXVgL+9WQUpESS0FDQQ9xTJQ9uqfEqw==
X-Received: by 2002:a05:600c:539b:b0:3d9:f836:3728 with SMTP id
 hg27-20020a05600c539b00b003d9f8363728mr31301182wmb.11.1674637734893; 
 Wed, 25 Jan 2023 01:08:54 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:ad2f:6fa7:d25a:7047?
 ([2a01:e0a:982:cbb0:ad2f:6fa7:d25a:7047])
 by smtp.gmail.com with ESMTPSA id
 l21-20020a05600c4f1500b003b47b80cec3sm1272896wmq.42.2023.01.25.01.08.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 01:08:54 -0800 (PST)
Message-ID: <5506bf98-2241-338f-b865-c3227a6f5bb5@linaro.org>
Date: Wed, 25 Jan 2023 10:08:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 12/14] drm/msm/disp/dpu1: revise timing engine
 programming to work for DSC
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
References: <1674498274-6010-1-git-send-email-quic_khsieh@quicinc.com>
 <1674498274-6010-13-git-send-email-quic_khsieh@quicinc.com>
 <8392e1f3-8459-4408-41de-564a41980b4c@linaro.org>
 <3588a5d0-ca28-918f-e072-35f15a5a5132@quicinc.com>
 <20230124233631.rojijcfy6xhntl3p@SoMainline.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230124233631.rojijcfy6xhntl3p@SoMainline.org>
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
Reply-To: neil.armstrong@linaro.org
Cc: vkoul@kernel.org, quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com,
 andersson@kernel.org, dianders@chromium.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, agross@kernel.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/01/2023 00:36, Marijn Suijten wrote:
> On 2023-01-24 09:55:24, Kuogee Hsieh wrote:
> 
> <snip>
> 
>> This timing engine code is derived from our downstream code directly and
>> it has been used at many mobile devices by many vendors for many years
>> already.
>>
>> On the other words, it had been tested very thorough and works on
>> dsi/dp/hdmi/dsc/widebus applications.
> 
> And the code already in mainline has seen 12 rounds of review, with a
> focus on inter-SoC compatibility.  Regardless of that, we have processes
> to make changes on mainline: formatting changes (when actually making an
> improvement) go separate from semantic changes.  Bugfixes are clearly
> described in individual patches with Fixes: tags.  If you really think
> the code has to be as proposed in this patch, follow Dmitry's advice and
> split this accordingly.
> 
>> When i brought dsc v1.2 over, I just merged it over and did not consider
>> too much.
> 
> And that is exactly what is wrong with this *entire* series: copying
> over downstream code without "considering too much", stomping over
> previous review and even reverting bugfixes [1] [2] without giving it
> ANY ATTENTION in your patch description.  That's unacceptable and
> insulting to contributors and reviewers.  Full stop.  Or did you expect
> us to turn a blind eye?  This is mainline, not some techpack playground.
> 
> [1]: https://lore.kernel.org/linux-arm-msm/20230123201133.zzt2zbyaw3pfkzi6@SoMainline.org/
> [2]: https://lore.kernel.org/linux-arm-msm/20221026182824.876933-10-marijn.suijten@somainline.org/
> 
>> Can we adapt this code so that both upstream and down stream shared same
>> timing engine programming so that easier to maintain?
> 
> Easy, I've said this before in IRC and will state it again: stop this
> techpack nonsense and focus on upstream-first.  When something passes
> mainline review (and please don't bother maintainers and reviewers with
> series like this) it is inevitably good enough to be copied to
> techpack... at which point techpack becomes worthless as you can just
> backport a mainline patch or use a recent-enough kernel.
> 
> 
> tl;dr: it seems like you nor anyone involved in pre-reviewing/vetting
> this series is familiar with upstream guidelines.  Follow the global
> advice from Dmitry [3] to reach a more efficient v2, and please don't
> let this run to v10 (or beyond) again.
> 
> One suggestion to improve efficiency: split off the DPU v1.2 hardware
> block addition (and related changes) into a separate series.  A smaller
> series (and properly split patches!) will give everyone less moving
> parts to worry about, and paves the way for DSI support without blocking
> on DP.

Yes to split DSC 1.2 integration and DP+DSC in 2 patchsets, with the various
fixes not necessary to make DP+DSC work in separate patches.

Be aware the rule is to make sure each single change doesn't break boot and builds
without warning, the rule is to make sure each single kernel change can be built
and doesn't break booting. And build the code with "W=1" to the make parameter to
trigger advanced GCC warnings.

This rule exists to permit running a git bisect to determine which commit introduces
a regression.

And the second most important rule is: a single change per patch, and a clear description
of the change in the commit message.
If your message needs a "change this and also change this" then it's wrong and it must be reworked.

Do incremental changes, like introduce a new struct, then use it afterwards.

Neil

> 
> [3]: https://lore.kernel.org/linux-arm-msm/47c83e8c-09f1-d1dd-ca79-574122638256@linaro.org/
> 
> - Marijn

