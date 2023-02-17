Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2FB69AAD4
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 12:54:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2145010EF89;
	Fri, 17 Feb 2023 11:54:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D40810EF87
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 11:54:08 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 4-20020a05600c22c400b003dc4fd6e61dso743962wmg.5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 03:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hyHGLwgjiPcQsz+R6PGy/frRkpnYnsZrsrwq1cb/FEY=;
 b=QU33wgRaOiNLmnzwdpdaXxget2IihDGMO2mzCig7tKz24V/b+qIigJgBAagb0adaAS
 VgOybn0Dx01t/HAM4TO6p2p1x8qqvEBwvfLGCVAxrz443f1ORjelMiGK0WxFU4CHkiXT
 TI+FVby7hDx5Hwvqayb6ENPA/BEJbSBZzriVkFsiW6n7pEcQv7ncKTjmu+RYo5xKRCDi
 RpAb2yRLOHtilZX2/fUWb+99RHPo6Yvb/ukfRBlh91q30Ix426+dwmXk7c5qMgLBZA/f
 hgVZuJVQMvPB8r898uXwoD6qEqiQ4zSYaCAtmjaSoMRKbS96blzt+MKrJfMA4c9XQQoN
 sy5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hyHGLwgjiPcQsz+R6PGy/frRkpnYnsZrsrwq1cb/FEY=;
 b=vMp+b6nS/Fp+Ek5WcjrDTIYNs4KPlJG57QoIRcTeZHm00gHiILpFL2T5biurR7QWh6
 d5qBNceFW0ONCmIn/Cnre29HOqRdaQeqb450w5Nesug+ZtAfBys/eAarwHo7VfVHjMgB
 nbcGl1KsuOGvPFTTuQv00n7aS0xGSL+0tpTPaK33w+rwweHBxUtcFOzu0FRykylVVvjA
 Ta4lxNyDkBbHVwdF77Fr9QvHCHbKbKix/iAni9hE8DrcfgPrmzmpY4x+kHrJoyO7ugeJ
 +ebE32U4yOGwEN2Nba3LnVwcc20pYy/SD9dIsSSl7YpBo/HZLRe9g97oDpV2G9jgqKKx
 LL9Q==
X-Gm-Message-State: AO0yUKVcJLkBogdHqW1zERs7s44QljJKguW5/QQq4mVfPX5Rd+h3hPRV
 93kI81TRQ9wtzQ5wNu0ZxLCdVPPsbI8GCQ==
X-Google-Smtp-Source: AK7set87s7khekoNrY0HL1Cik55bH5XGJpfL8tS1Y2FZUQjctgVkAnyfC2Yuo+7wnvJX8fca0sZKzg==
X-Received: by 2002:a05:600c:3b88:b0:3df:de27:4191 with SMTP id
 n8-20020a05600c3b8800b003dfde274191mr309693wms.16.1676634846408; 
 Fri, 17 Feb 2023 03:54:06 -0800 (PST)
Received: from ?IPV6:2a02:908:1256:79a0:18f0:5eac:9f10:52b1?
 ([2a02:908:1256:79a0:18f0:5eac:9f10:52b1])
 by smtp.gmail.com with ESMTPSA id
 m26-20020a05600c3b1a00b003e21a8d30c9sm3865044wms.37.2023.02.17.03.54.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 03:54:05 -0800 (PST)
Message-ID: <5c6fe661-9e96-d122-1a7a-110ecbd8a6c6@gmail.com>
Date: Fri, 17 Feb 2023 12:54:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/3] drm/debugfs: remove dev->debugfs_list and
 debugfs_mutex
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
References: <20230209081838.45273-1-christian.koenig@amd.com>
 <20230209081838.45273-4-christian.koenig@amd.com>
 <Y+4UdBzk6RkQzcsI@phenom.ffwll.local>
 <20230216163757.GK2849548@linux.intel.com> <87lekxzgih.fsf@intel.com>
 <20230217103501.GC2862577@linux.intel.com> <871qmozhve.fsf@intel.com>
 <20230217113621.GD2862577@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20230217113621.GD2862577@linux.intel.com>
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
Cc: daniel.vetter@ffwll.ch, mcanal@igalia.com, dri-devel@lists.freedesktop.org,
 mwen@igalia.com, mairacanal@riseup.net, maxime@cerno.tech,
 wambui.karugax@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.02.23 um 12:36 schrieb Stanislaw Gruszka:
> On Fri, Feb 17, 2023 at 12:49:41PM +0200, Jani Nikula wrote:
>> On Fri, 17 Feb 2023, Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com> wrote:
>>> On Thu, Feb 16, 2023 at 07:06:46PM +0200, Jani Nikula wrote:
>>>>> But should not this the driver responsibility, call drm_debugfs_add_file()
>>>>> whenever you are ready to handle operations on added file ?
>>>> In theory, yes, but in practice it's pretty hard for a non-trivial
>>>> driver to maintain that all the conditions are met.
>>> Hmmm...
>>>
>>>> In i915 we call debugfs register all over the place only after we've
>>>> called drm_dev_register(), because it's the only sane way. But it means
>>>> we need the init and register separated everywhere, instead of init
>>>> adding files to a list to be registered later.
>>> Isn't this done this way in i915 only because it was not possible
>>> (and still isn't) to call drm_debugfs_create_file() before registration ?
>>>
>>> I think it's should be ok by i915 subsystem to create it's debugfs
>>> files and allow to access to them just after that subsystem init.
>>>
>>> Or there are some complex dependencies between i915 subsystems,
>>> that reading registers from one subsystem will corrupt some
>>> other subsystem that did non finish initialization yet?
>> That's the point. It's really hard to figure it all out. Why bother?
> I see.
>
> Just hope we could get something simpler to limit debugfs access
> before registration: unix hidden file, permissions or other way.
> Because current drm_debufs_add_file() implementation looks
> really over convoluted to me.

Completely agree.

We have intentionally removed exactly that approach from radeon because 
it just lead to and over all bad driver design and more problems than it 
solved.

If i915 have such structural problems then I strongly suggest to solve 
them inside i915 and not make common code out of that. This just 
encourages others to follow that lead.

Regards,
Christian.

>
> Regards
> Stanislaw
>

