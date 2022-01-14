Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B2D48E947
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 12:35:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DFC310E1B0;
	Fri, 14 Jan 2022 11:35:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA0EB10E1B0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 11:35:17 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id b14so10847713lff.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 03:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=M+VBIwYRH7lkP4vx+jUC18op58Ydo4ny7N/YYs9+5uw=;
 b=BVQ2oc5T37F7uodj0Et8f2w04ctg6Nv4GojRWvMIgXyc0x2d+FbjJbPYZVMO2Rzdt0
 sIB/Oh+jpveZIWGbvqUlW9il3f6MrafUxs0b1mAJbhuIl4dl/UxwWo+TXAVlzSAMI5ii
 8Bg00U9m/oJiLNymXoSbfhRz2eAWMUnI8lLNvl4YkqIywXpF8k0/TpzaZ0Z8SyXiYm5J
 PqdOM/Nty/FUwRhJUL7UCkZBBbvwDjOBK3siZwbJpYjJGgjKcbm/tn+S1CtVmfF1STgC
 dcfC3mN7LxJUCaTeDZjerUMm8q1edqNjNk1LsLKK8b+DfkOSn6J0NiSKmS0komb7Tzer
 VysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=M+VBIwYRH7lkP4vx+jUC18op58Ydo4ny7N/YYs9+5uw=;
 b=3aaZDkg4h/uStaKm4BhErnLBY18jswUX3FgRdOOaX7kV/GmiJ1BeSfpahKiaRepHVe
 xsjq6Em0x4xjWi5yAaMA0qDBmvypt68pQtN8NLxZfELFgnBnrnq86IO60a6wpSNP6lDp
 u1knNTH9sBWzi8xALBf1KsLfuQfXzw4FpxNPu1sKzVW/oBihgp94tkHooxBBWqMvbOGI
 jEtl5GCnQHSCGHRSqbwl8n22kCD9Snf+7VmguzbiYk8Ghsg/cA6zxGiBZKjevn9W90+N
 SjtiW9LkfG5crm1FmAZ0injDkk01uXY3SVXr3m5LUr2IBXkSEhb58XmTTTtXBAwT9x0y
 urSQ==
X-Gm-Message-State: AOAM531KWVmIFkM0vVGaEKh4EpzwuUKPbOeJ9+95//koORfs9sKpQRaN
 JlxgMsnxbq7rfZkdZgrsn7I=
X-Google-Smtp-Source: ABdhPJxjlsj9rRW7k3H63N28S1ebd0U0m1VYuPo71Yc9zWgss73Nmc4JCwd4YePsysrZ7jAi/oqooA==
X-Received: by 2002:a05:651c:113:: with SMTP id
 a19mr6055490ljb.505.1642160115961; 
 Fri, 14 Jan 2022 03:35:15 -0800 (PST)
Received: from [192.168.2.172] (46-138-227-157.dynamic.spd-mgts.ru.
 [46.138.227.157])
 by smtp.googlemail.com with ESMTPSA id q10sm557951lfm.282.2022.01.14.03.35.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 03:35:15 -0800 (PST)
Subject: Re: [PATCH 0/2] drm/tegra: Fix panel support on Venice 2 and Nyan
To: Doug Anderson <dianders@chromium.org>
References: <20211220104855.428290-1-thierry.reding@gmail.com>
 <dd7a2f23-00d6-9160-1e09-1d4ea5b1f5e1@gmail.com> <YcCg/xktJ2uShFRf@orome>
 <e27bd5e0-51d2-875b-aa41-f198230880ac@gmail.com> <YcGzO0A/iWzhFjvE@orome>
 <c2d2e5a1-7f44-a190-2ab1-84125fbe9f65@gmail.com> <YcH+Fw9sCzCIzFIx@orome>
 <1bac3b32-ad9b-4d10-c7fb-6aafd353cdd4@gmail.com> <YcIWlOoER16wUyQ/@orome>
 <f8c50f22-ddeb-1805-bfcd-410aa46f869a@gmail.com> <YcMRuE0oVinpJPMq@orome>
 <72465efa-47a9-7f2d-15b4-d71f06cff1ca@gmail.com>
 <CAD=FV=XGMBw5NEDAY7BZ7+LqOjYPxjB_hLHYzT7mN6q4PbF56Q@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <19082304-f785-3978-72f8-44eb13b1dc95@gmail.com>
Date: Fri, 14 Jan 2022 14:35:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=XGMBw5NEDAY7BZ7+LqOjYPxjB_hLHYzT7mN6q4PbF56Q@mail.gmail.com>
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
 dri-devel <dri-devel@lists.freedesktop.org>, Jon Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

06.01.2022 04:11, Doug Anderson пишет:
> Hi,
> 
> On Wed, Dec 22, 2021 at 11:26 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> 22.12.2021 14:53, Thierry Reding пишет:
>>> On Wed, Dec 22, 2021 at 06:01:26AM +0300, Dmitry Osipenko wrote:
>>>> 21.12.2021 21:01, Thierry Reding пишет:
>>>>> On Tue, Dec 21, 2021 at 07:45:31PM +0300, Dmitry Osipenko wrote:
>>>>>> 21.12.2021 19:17, Thierry Reding пишет:
>>>>>>> On Tue, Dec 21, 2021 at 06:47:31PM +0300, Dmitry Osipenko wrote:
>>>>>>>> 21.12.2021 13:58, Thierry Reding пишет:
>>>>>>>> ..
>>>>>>>>>>>> The panel->ddc isn't used by the new panel-edp driver unless panel is
>>>>>>>>>>>> compatible with "edp-panel". Hence the generic_edp_panel_probe() should
>>>>>>>>>>>> either fail or crash for a such "edp-panel" since panel->ddc isn't fully
>>>>>>>>>>>> instantiated, AFAICS.
>>>>>>>>>>>
>>>>>>>>>>> I've tested this and it works fine on Venice 2. Since that was the
>>>>>>>>>>> reference design for Nyan, I suspect that Nyan's will also work.
>>>>>>>>>>>
>>>>>>>>>>> It'd be great if Thomas or anyone else with access to a Nyan could
>>>>>>>>>>> test this to verify that.
>>>>>>>>>>
>>>>>>>>>> There is no panel-edp driver in the v5.15. The EOL of v5.15 is Oct,
>>>>>>>>>> 2023, hence we need to either use:
>>>>>>>>>
>>>>>>>>> All the (at least relevant) functionality that is in panel-edp was in
>>>>>>>>> panel-simple before it was moved to panel-edp. I've backported this set
>>>>>>>>> of patches to v5.15 and it works just fine there.
>>>>>>>>
>>>>>>>> Will we be able to add patch to bypass the panel's DT ddc-i2c-bus on
>>>>>>>> Nyan to keep the older DTBs working?
>>>>>>>
>>>>>>> I don't see why we would want to do that. It's quite clear that the DTB
>>>>>>> is buggy in this case and we have a more accurate way to describe what's
>>>>>>> really there in hardware. In addition that more accurate representation
>>>>>>> also gets rid of a bug. Obviously because the bug is caused by the
>>>>>>> previous representation that was not accurate.
>>>>>>>
>>>>>>> Given that we can easily replace the DTBs on these devices there's no
>>>>>>> reason to make this any more complicated than it has to be.
>>>>>>
>>>>>> Don't you care about normal people at all? Do you assume that everyone
>>>>>> must to be a kernel developer to be able to use Tegra devices? :/
>>>>>
>>>>> If you know how to install a custom kernel you also know how to replace
>>>>> the DTB on these devices.
>>>>>
>>>>> For everyone else, once these patches are merged upstream and
>>>>> distributions start shipping the new version, they will get this
>>>>> automatically by updating their kernel package since most distributions
>>>>> actually ship the DTB files as part of that.
>>>>>
>>>>>> It's not a problem for you to figure out why display is broken, for
>>>>>> other people it's a problem. Usually nobody will update DTB without a
>>>>>> well known reason, instead device will be dusted on a shelf. In the end
>>>>>> you won't have any users at all.
>>>>>
>>>>> Most "normal" people aren't even going to notice that their DTB is going
>>>>> to be updated. They would actually have to do extra work *not* to update
>>>>> it.
>>>>
>>>> My past experience tells that your assumption is incorrect. There are
>>>> quite a lot of people who will update kernel, but not DTB.
>>>
>>> People that do this will have to do it manually because most
>>> distributions I know of will actually ship the DTBs. If they know how to
>>> update the kernel separately, I'm sure they will manage to update the
>>> DTB as well. It's really not more complicated that updating the kernel
>>> image.
>>>
>>>> ARM devices have endless variations of bootloaders and individual quirks
>>>> required for a successful installation of a kernel. Kernel update by
>>>> distro usually isn't a thing on ARM.
>>>
>>> I'm not sure what distribution you have been using, but the ones that
>>> I'm familiar with all install the DTBs along with the kernel. Most Tegra
>>> devices (newer ones at least) do also support booting with U-Boot which
>>> supports standard ways to boot a system (which were co-developed with
>>> distributions precisely so that it would become easier for users to keep
>>> their systems up-to-date), so there's really nothing magical anyone
>>> should need to do in order to get an updated DTB along with the updated
>>> kernel.
>>>
>>> It's a simple fact that sometimes a DTB contains a bug and we have to
>>> fix it.
>>>
>>> In general we try to fix things up in the driver code when reasonable so
>>> that people don't have to update the DTB. This is for the (mostly hypo-
>>> thetical) case where updating the DTB is not possible or very
>>> complicated.
>>>
>>> However, that's not the case on the Venice 2 or Nyan boards. And looking
>>> at the alternative in this case, I don't think it's reasonable compared
>>> to just fixing the problem at the root, which is in the DTB.
>>
>> My understanding that U-Boot isn't the only available bootloader option
>> for Nyan. I don't feel happy about the ABI breakage, but in the same
>> time don't feel very strong about the need to care about it in the case
>> of Nyan since its DT already had a preexisting problem with the wrong
>> panel model used for the FHD model. The decision will be on your
>> conscience :)
> 
> Maybe I should stand back to avoid getting hit by tomatoes, but IMO
> it's a terrible idea to try to update devices trees separately from
> kernels for any sufficiently complicated device. I won't stop you from
> shooting yourself in the foot, but I also certainly wouldn't encourage
> it. I've always said that I'll accept that this is something to really
> worry about when we land chunk of "device tree fixup" code that runs
> in early boot to fix all the broken device trees out there. All ARM
> Chrome OS devices that have ever shipped all bundle device trees
> together with the kernel (they bundle a whole pile of them and the
> bootloader picks the right one based on model). Sure, someone could
> decide to bake one into their bootloader but, even aside from this
> case, there are sometimes bugs in device trees and they need to get
> fixed. Updating your kernel without your device tree is just bad juju
> IMO.
> 
> I'll let you and Thierry figure out what you want to do for 5.15. In
> the Chrome OS 5.15 kernel tree we simply backported all the edp-panel
> stuff, which was fairly clean. I even backported all that stuff to
> 5.4, but it was decidedly more complex...

Chrome OS is a commercial product, while here we are talking about
normal (non-kernel/developer) people. It's incorrect to compare home
hackers with professional developers/products, IMO.

If we could keep older DTBs working without much effort, then will be
great. If not, maybe not a big deal.

I suggested variants of preserving the older DTBs and leaving it up to
Thierry to decide what to do.
