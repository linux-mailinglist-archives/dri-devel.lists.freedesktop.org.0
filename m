Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DF448E241
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 02:46:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C60310EB49;
	Fri, 14 Jan 2022 01:46:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 626A410EB44
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 01:46:39 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id c3so12008214pls.5
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 17:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=bkqHKFcqNq4gb3jt/dwVidqQ5ehBpW6sVTKKduTND5U=;
 b=bw/xTIGkLnDSX9jnLJvwk5GLgnDjyrWwq8Y3tVvHRP6pWVepDvUpb24R90CZqhCC9L
 aPDuN+fjx5ZNM0lh6Ev1Rdp4FW9LQb33SYHXU/i36i7j63RSdUSEMkqSEA++xM1uPNqV
 StKVAv05ywvQcPh5touaCbEXJCmFgXsvK6N0KqdBzM1f06SgAVOAiKA6wnUrjGh+1pkZ
 II8T7YG2HfpxuY7x8xiehN6DY67dV2M4AyZiCLEvFd+uVW/sDwMW8qmu4OQr/Bm715bX
 85ItrhYElmFILfdvKOBwMu6otmSLygtM3c7AqcLmHK/BN7pWlStOp7FR0HmGMDn/1OFP
 2dJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bkqHKFcqNq4gb3jt/dwVidqQ5ehBpW6sVTKKduTND5U=;
 b=mnpTR4GF6H8vEhe146oe2l6W5gJxXT6FX/Yak8P4+8t3GP8tGKhdDkA1UHNx3pspq5
 5Gqd5x3BoVIWYqZf7N4W1T5RUX3S6JMxdGr/+0Y4FBYv2yDuvyMt6UTYCIjiAqcm2kiO
 gbXfQB+5g0Up+LUb27gSP8SNqpXrn1X73eKYStxlq0vJS+3qWx4V03rE6sJbdIIBe/4K
 n9g24UdD0r0o+sWJjYJuRrGhhkW4cE9E8AXQaceB/0SbA9gi0OSMOq+2Kn0Smus0kjhz
 fEsaAXjYoFhWTlweKNfsHkJWHI091tKaeWghm4AwtCBdDcpJctzRJa5u0uPvplPN0pks
 +Mrg==
X-Gm-Message-State: AOAM530uwyCdReUwBTxmdBdXZHUACWyg7jznIL6zTDbl023vCRTdsUyC
 lqvsVEjBkSO54qAimZOyUox0eQ==
X-Google-Smtp-Source: ABdhPJx1n2buo+IEu0BN44/SXSTvAhCpZgcA1x+30GjD3bQ1/gPeJucU2x/Go977cYZdYlI7KOzxEg==
X-Received: by 2002:a17:90b:3a87:: with SMTP id
 om7mr16573934pjb.16.1642124798972; 
 Thu, 13 Jan 2022 17:46:38 -0800 (PST)
Received: from [10.16.129.73] (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id a9sm3713554pfo.169.2022.01.13.17.46.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 17:46:38 -0800 (PST)
Message-ID: <4d77b583-ce3f-89e5-75e1-ccfd661c5198@igel.co.jp>
Date: Fri, 14 Jan 2022 10:46:31 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [RFC PATCH v2 0/3] Add support modifiers for drivers whose planes
 only support linear layout
Content-Language: en-US
To: Daniel Stone <daniel@fooishbar.org>
References: <20220113094419.12433-1-etom@igel.co.jp>
 <CAPj87rPk3_8LdnwWJ3BhtJnRuR+_WHg2hfdgK2R4SMacPGCrUQ@mail.gmail.com>
From: Esaki Tomohito <etom@igel.co.jp>
In-Reply-To: <CAPj87rPk3_8LdnwWJ3BhtJnRuR+_WHg2hfdgK2R4SMacPGCrUQ@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <mdaenzer@redhat.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee.jones@linaro.org>, Rob Clark <robdclark@chromium.org>,
 Evan Quan <evan.quan@amd.com>, amd-gfx@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Petr Mladek <pmladek@suse.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Takanari Hayama <taki@igel.co.jp>, Sean Paul <seanpaul@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Yacoub <markyacoub@chromium.org>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel-san,

Thank you for your comments.

On 2022/01/13 22:44, Daniel Stone wrote:
> Hi Esaki-san,
> 
> On Thu, 13 Jan 2022 at 09:44, Tomohito Esaki <etom@igel.co.jp> wrote:
>> Some drivers whose planes only support linear layout fb do not support format
>> modifiers.
>> These drivers should support modifiers, however the DRM core should handle this
>> rather than open-coding in every driver.
>>
>> In this patch series, these drivers expose format modifiers based on the
>> following suggestion[1].
> 
> Thanks for the series, it looks like the right thing to do.
> 
> Can you please change the patch ordering though? At the moment there
> will be a bisection break at patch #1, because the legacy drivers will
> suddenly start gaining modifier support, before it is removed in patch
> #2.
> 
> I think a better order would be:
>    1: add fb_modifiers_not_supported flag to core and drivers
>    2: add default modifiers (and set allow_fb_modifiers) if
> fb_modifiers_not_supported flag is not set
>    3: remove allow_fb_modifiers flag
> 
I agree to your proposal.
I will fix these patches.

-- 
--------------------------
株式会社イーゲル
江崎　朋人
etom@igel.co.jp
