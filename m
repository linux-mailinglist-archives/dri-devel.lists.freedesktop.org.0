Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38ACB47CB76
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 04:02:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4879E10E20B;
	Wed, 22 Dec 2021 03:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E36110E20B
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 03:02:00 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id a37so1386452ljq.13
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 19:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wm8Yrjopy492NzBpwSLQqPTvQKvPN3l++wypA+HZ4RM=;
 b=bHDnYR/sWzK8MlejMHmG8ZP3MQw94YJocF0LJxZDftfxzek6egth5iHoPAfvzP1jn6
 5kFjdSmOp/5zVsngRvIbOsM3wKNVDLZK6vOQ93D0beEwusrIb0uMx8rXfWx/Z9GXpgL6
 Uhfu9nmYOz3GE8+PKrRpLuFhjTy4w3uMbyrA2DILtI1N4G6DP80OFeBQuS7PaoiVVpJ8
 IfyTudE+hinFjZOjTLwV91Y9cm2bw4kl32BJpIzuBoW9llB3S5NOlxFCeaPkRW8NGR3r
 g6vOpgS4Z/Q0CsxW3Lu6ucoa6FM8AtuDa/CS6nN7dCz0qhNV3ZsRNx/IDNjAQMsXpaDF
 Ou6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wm8Yrjopy492NzBpwSLQqPTvQKvPN3l++wypA+HZ4RM=;
 b=0naNrVhB2hRTvlbhfB8drp/OxOnpgbLMia4nYztm8afrbc14Bcd4BLc5y4RKsZmbB+
 QxA0uM+2rYKLtX4EatOZuK/CrSZaLMbYTFvWoG8f45KK9cbrWZpx/x2nmLefZAPMUFdM
 Jb3H9nm6ytPCB6lDKmqYQuKyg4020ETJi54LaXBpWXK0JMDFPRE6SRM9wQ8VtDyWKygm
 kvJlkBFS0M/wV2bTuXUpEO/M44MUuXcrsaQepO1q0qnOFeQ+1wTqmNz/N9WKZBK8r0nI
 uMlkyG+3bRSBw2szVAmd7omsKXLxOxwHgA19lXo0gZ8KydHgR6sI0UVVDLBuAJ9xyNXh
 b2ow==
X-Gm-Message-State: AOAM533c/0jTsOZiN5RB/aRZK+u5YSZL/6KcgGFUjAMYw5Gd9pfh6oYk
 uTWkob9UQW8etTKwzMWWcqw=
X-Google-Smtp-Source: ABdhPJxCT//IyPAiErDmM1GSo+PvEhwRPRkyQCnsGkSIqFHRx2PINwIgMXpkXffBhnscqmnudZfvQw==
X-Received: by 2002:a2e:3304:: with SMTP id d4mr820939ljc.377.1640142118858;
 Tue, 21 Dec 2021 19:01:58 -0800 (PST)
Received: from [192.168.2.145] (46-138-43-24.dynamic.spd-mgts.ru.
 [46.138.43.24])
 by smtp.googlemail.com with ESMTPSA id g22sm71912lfr.237.2021.12.21.19.01.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 19:01:58 -0800 (PST)
Subject: Re: [PATCH 0/2] drm/tegra: Fix panel support on Venice 2 and Nyan
To: Thierry Reding <thierry.reding@gmail.com>
References: <20211220104855.428290-1-thierry.reding@gmail.com>
 <dd7a2f23-00d6-9160-1e09-1d4ea5b1f5e1@gmail.com> <YcCg/xktJ2uShFRf@orome>
 <e27bd5e0-51d2-875b-aa41-f198230880ac@gmail.com> <YcGzO0A/iWzhFjvE@orome>
 <c2d2e5a1-7f44-a190-2ab1-84125fbe9f65@gmail.com> <YcH+Fw9sCzCIzFIx@orome>
 <1bac3b32-ad9b-4d10-c7fb-6aafd353cdd4@gmail.com> <YcIWlOoER16wUyQ/@orome>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f8c50f22-ddeb-1805-bfcd-410aa46f869a@gmail.com>
Date: Wed, 22 Dec 2021 06:01:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YcIWlOoER16wUyQ/@orome>
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
Cc: Thomas Graichen <thomas.graichen@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

21.12.2021 21:01, Thierry Reding пишет:
> On Tue, Dec 21, 2021 at 07:45:31PM +0300, Dmitry Osipenko wrote:
>> 21.12.2021 19:17, Thierry Reding пишет:
>>> On Tue, Dec 21, 2021 at 06:47:31PM +0300, Dmitry Osipenko wrote:
>>>> 21.12.2021 13:58, Thierry Reding пишет:
>>>> ..
>>>>>>>> The panel->ddc isn't used by the new panel-edp driver unless panel is
>>>>>>>> compatible with "edp-panel". Hence the generic_edp_panel_probe() should
>>>>>>>> either fail or crash for a such "edp-panel" since panel->ddc isn't fully
>>>>>>>> instantiated, AFAICS.
>>>>>>>
>>>>>>> I've tested this and it works fine on Venice 2. Since that was the
>>>>>>> reference design for Nyan, I suspect that Nyan's will also work.
>>>>>>>
>>>>>>> It'd be great if Thomas or anyone else with access to a Nyan could
>>>>>>> test this to verify that.
>>>>>>
>>>>>> There is no panel-edp driver in the v5.15. The EOL of v5.15 is Oct,
>>>>>> 2023, hence we need to either use:
>>>>>
>>>>> All the (at least relevant) functionality that is in panel-edp was in
>>>>> panel-simple before it was moved to panel-edp. I've backported this set
>>>>> of patches to v5.15 and it works just fine there.
>>>>
>>>> Will we be able to add patch to bypass the panel's DT ddc-i2c-bus on
>>>> Nyan to keep the older DTBs working?
>>>
>>> I don't see why we would want to do that. It's quite clear that the DTB
>>> is buggy in this case and we have a more accurate way to describe what's
>>> really there in hardware. In addition that more accurate representation
>>> also gets rid of a bug. Obviously because the bug is caused by the
>>> previous representation that was not accurate.
>>>
>>> Given that we can easily replace the DTBs on these devices there's no
>>> reason to make this any more complicated than it has to be.
>>
>> Don't you care about normal people at all? Do you assume that everyone
>> must to be a kernel developer to be able to use Tegra devices? :/
> 
> If you know how to install a custom kernel you also know how to replace
> the DTB on these devices.
> 
> For everyone else, once these patches are merged upstream and
> distributions start shipping the new version, they will get this
> automatically by updating their kernel package since most distributions
> actually ship the DTB files as part of that.
> 
>> It's not a problem for you to figure out why display is broken, for
>> other people it's a problem. Usually nobody will update DTB without a
>> well known reason, instead device will be dusted on a shelf. In the end
>> you won't have any users at all.
> 
> Most "normal" people aren't even going to notice that their DTB is going
> to be updated. They would actually have to do extra work *not* to update
> it.

My past experience tells that your assumption is incorrect. There are
quite a lot of people who will update kernel, but not DTB.

ARM devices have endless variations of bootloaders and individual quirks
required for a successful installation of a kernel. Kernel update by
distro usually isn't a thing on ARM.
