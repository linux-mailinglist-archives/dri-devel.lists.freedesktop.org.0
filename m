Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A7347D7A9
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 20:26:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3FD410E218;
	Wed, 22 Dec 2021 19:26:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B933410E218
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 19:26:55 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id m12so5399536ljj.6
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 11:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9zRHeTOWcA9trHzU+jvgMdZdPaWw2qoOoeR+s/L5Wcg=;
 b=MmBq+HUP5r7yy6VX3k/RpT5qR+/YNRGQQPoY6dl24KkziJvH9t9DIpVxhM0YVAlBc2
 yXDEVGxy7T69ePooR/xhfaDdkCz42TTrMYQDEJvuAHmUqK/7VPi/RdygV9Ul1cTZnpbe
 /KS156p1M3a1Qh98ZsABNvhyG2J3u9RoA3zGA3p/tabWkKTFH0F43TO0OljicHg6SC59
 pgP5pjfMY4BKk8W3JLkqDFXUreZdD8IL3fv4UNpYPLNCWjojfXpDa1qeJ66jRP+DtC7o
 LXL3A2wt3lRXiQNRT02R3OSzsT5cJ5dks69zT5DB4mb8Kblg/nBbalGJOPV0RvxRHiFd
 RAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9zRHeTOWcA9trHzU+jvgMdZdPaWw2qoOoeR+s/L5Wcg=;
 b=B2mNWkxIEaVA1lizGdlcdy199Z+/fq8FhBhZfzWYvrS3CAX2R5ixxvmD7Lf4YsGQ0E
 4tPJYfGMJipcNO0YWMtq2MfyLSqRWCMSDPJmFzB8HCqf+0DPxpFOmrK++bm/4w78CsoQ
 l/9PRe99aIiAKePnbxtYrU8CNBt0WsIqeT/Mv85tyvConIKi4U/BqRhXgH6TsicE0rjq
 vll19CIdf8FLuA3VSAcIe9jLxE6eRRSQRC1zv7o24HNKFdBX2ppHYDnta7BpkXmb6Rdg
 NN1WQ+xy+7eUHuPtSCkDkejqssAHucml+P2OBCWCeMIj8OvowqLicMcv3GHDvqLzremF
 k/hA==
X-Gm-Message-State: AOAM530EFZMrG2EZimJMcKS5ikqPko4h0Eo59L0y00YFVrf0axWHHor3
 e+UL7Ur9ofj9nWVb/pxvr9Y=
X-Google-Smtp-Source: ABdhPJycZ3E1gyPWKLTur2QKHrMxuLBYCYPat4xy0K/3XCums67vwKheCm3kKQql02mKWjT0FKI6lA==
X-Received: by 2002:a2e:b0ee:: with SMTP id h14mr2949504ljl.478.1640201214044; 
 Wed, 22 Dec 2021 11:26:54 -0800 (PST)
Received: from [192.168.2.145] (46-138-43-24.dynamic.spd-mgts.ru.
 [46.138.43.24])
 by smtp.googlemail.com with ESMTPSA id l17sm294672lfp.82.2021.12.22.11.26.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Dec 2021 11:26:53 -0800 (PST)
Subject: Re: [PATCH 0/2] drm/tegra: Fix panel support on Venice 2 and Nyan
To: Thierry Reding <thierry.reding@gmail.com>
References: <20211220104855.428290-1-thierry.reding@gmail.com>
 <dd7a2f23-00d6-9160-1e09-1d4ea5b1f5e1@gmail.com> <YcCg/xktJ2uShFRf@orome>
 <e27bd5e0-51d2-875b-aa41-f198230880ac@gmail.com> <YcGzO0A/iWzhFjvE@orome>
 <c2d2e5a1-7f44-a190-2ab1-84125fbe9f65@gmail.com> <YcH+Fw9sCzCIzFIx@orome>
 <1bac3b32-ad9b-4d10-c7fb-6aafd353cdd4@gmail.com> <YcIWlOoER16wUyQ/@orome>
 <f8c50f22-ddeb-1805-bfcd-410aa46f869a@gmail.com> <YcMRuE0oVinpJPMq@orome>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <72465efa-47a9-7f2d-15b4-d71f06cff1ca@gmail.com>
Date: Wed, 22 Dec 2021 22:26:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YcMRuE0oVinpJPMq@orome>
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

22.12.2021 14:53, Thierry Reding пишет:
> On Wed, Dec 22, 2021 at 06:01:26AM +0300, Dmitry Osipenko wrote:
>> 21.12.2021 21:01, Thierry Reding пишет:
>>> On Tue, Dec 21, 2021 at 07:45:31PM +0300, Dmitry Osipenko wrote:
>>>> 21.12.2021 19:17, Thierry Reding пишет:
>>>>> On Tue, Dec 21, 2021 at 06:47:31PM +0300, Dmitry Osipenko wrote:
>>>>>> 21.12.2021 13:58, Thierry Reding пишет:
>>>>>> ..
>>>>>>>>>> The panel->ddc isn't used by the new panel-edp driver unless panel is
>>>>>>>>>> compatible with "edp-panel". Hence the generic_edp_panel_probe() should
>>>>>>>>>> either fail or crash for a such "edp-panel" since panel->ddc isn't fully
>>>>>>>>>> instantiated, AFAICS.
>>>>>>>>>
>>>>>>>>> I've tested this and it works fine on Venice 2. Since that was the
>>>>>>>>> reference design for Nyan, I suspect that Nyan's will also work.
>>>>>>>>>
>>>>>>>>> It'd be great if Thomas or anyone else with access to a Nyan could
>>>>>>>>> test this to verify that.
>>>>>>>>
>>>>>>>> There is no panel-edp driver in the v5.15. The EOL of v5.15 is Oct,
>>>>>>>> 2023, hence we need to either use:
>>>>>>>
>>>>>>> All the (at least relevant) functionality that is in panel-edp was in
>>>>>>> panel-simple before it was moved to panel-edp. I've backported this set
>>>>>>> of patches to v5.15 and it works just fine there.
>>>>>>
>>>>>> Will we be able to add patch to bypass the panel's DT ddc-i2c-bus on
>>>>>> Nyan to keep the older DTBs working?
>>>>>
>>>>> I don't see why we would want to do that. It's quite clear that the DTB
>>>>> is buggy in this case and we have a more accurate way to describe what's
>>>>> really there in hardware. In addition that more accurate representation
>>>>> also gets rid of a bug. Obviously because the bug is caused by the
>>>>> previous representation that was not accurate.
>>>>>
>>>>> Given that we can easily replace the DTBs on these devices there's no
>>>>> reason to make this any more complicated than it has to be.
>>>>
>>>> Don't you care about normal people at all? Do you assume that everyone
>>>> must to be a kernel developer to be able to use Tegra devices? :/
>>>
>>> If you know how to install a custom kernel you also know how to replace
>>> the DTB on these devices.
>>>
>>> For everyone else, once these patches are merged upstream and
>>> distributions start shipping the new version, they will get this
>>> automatically by updating their kernel package since most distributions
>>> actually ship the DTB files as part of that.
>>>
>>>> It's not a problem for you to figure out why display is broken, for
>>>> other people it's a problem. Usually nobody will update DTB without a
>>>> well known reason, instead device will be dusted on a shelf. In the end
>>>> you won't have any users at all.
>>>
>>> Most "normal" people aren't even going to notice that their DTB is going
>>> to be updated. They would actually have to do extra work *not* to update
>>> it.
>>
>> My past experience tells that your assumption is incorrect. There are
>> quite a lot of people who will update kernel, but not DTB.
> 
> People that do this will have to do it manually because most
> distributions I know of will actually ship the DTBs. If they know how to
> update the kernel separately, I'm sure they will manage to update the
> DTB as well. It's really not more complicated that updating the kernel
> image.
> 
>> ARM devices have endless variations of bootloaders and individual quirks
>> required for a successful installation of a kernel. Kernel update by
>> distro usually isn't a thing on ARM.
> 
> I'm not sure what distribution you have been using, but the ones that
> I'm familiar with all install the DTBs along with the kernel. Most Tegra
> devices (newer ones at least) do also support booting with U-Boot which
> supports standard ways to boot a system (which were co-developed with
> distributions precisely so that it would become easier for users to keep
> their systems up-to-date), so there's really nothing magical anyone
> should need to do in order to get an updated DTB along with the updated
> kernel.
> 
> It's a simple fact that sometimes a DTB contains a bug and we have to
> fix it.
> 
> In general we try to fix things up in the driver code when reasonable so
> that people don't have to update the DTB. This is for the (mostly hypo-
> thetical) case where updating the DTB is not possible or very
> complicated.
> 
> However, that's not the case on the Venice 2 or Nyan boards. And looking
> at the alternative in this case, I don't think it's reasonable compared
> to just fixing the problem at the root, which is in the DTB.

My understanding that U-Boot isn't the only available bootloader option
for Nyan. I don't feel happy about the ABI breakage, but in the same
time don't feel very strong about the need to care about it in the case
of Nyan since its DT already had a preexisting problem with the wrong
panel model used for the FHD model. The decision will be on your
conscience :)
