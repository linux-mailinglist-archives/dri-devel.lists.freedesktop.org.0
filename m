Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B4B7D6C43
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 14:47:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A1C10E654;
	Wed, 25 Oct 2023 12:47:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 604D210E654
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 12:47:16 +0000 (UTC)
Received: from [192.168.0.206] (unknown [179.221.49.105])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id ED820660731F;
 Wed, 25 Oct 2023 13:47:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698238034;
 bh=QJNkUvB7CqNZNeeufEP+ZmfwQm1elvokECloaq0LosQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Xs8mMarBDechqTCJQS/jcVDpT0UCDGDDVHqLdl8uaa3gD670OlMWGy/G9rUcdNEcC
 bP1KYxA8ctb/QGqvmZlNeccl3oH5Gae6vivZYWrsFIClQoFIcWtAu14zZWsT707HCG
 txpn7ikjB0I+eII8osWNPJ4QrFjQ1BtzFlnV0SisFgyU5AAsIFoYL73+NFjV/6Kh/p
 jeUnh/0Il8/+uyng8GYjAAG5D9NlrdQ/T0ZqLe3MDIWeJIHicubvgDPitxb3x7Alv9
 rH4Pf3F5baNPqQG5+wHr0jsv7kexYRUtAIb/sH++tPhpqPRXd5ULULD8gOqaaGW9V5
 Qn3hFTL5IedmA==
Message-ID: <4d2362d8-d88b-4878-8d1a-f54458ebfc9b@collabora.com>
Date: Wed, 25 Oct 2023 09:47:07 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/doc: ci: Require more context for flaky tests
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>
References: <20231019094609.251787-1-mripard@kernel.org>
 <ba2cd566-328d-4a47-9ab8-05817c14f0bd@collabora.com>
 <b8b5def4-a178-4bfc-a7e8-1a2ebc80d7aa@collabora.com>
 <w723qfygjvfhyu2udaquqad6haea3m5adoclzxz47b2xzbuiir@mxel33ctr3bs>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <w723qfygjvfhyu2udaquqad6haea3m5adoclzxz47b2xzbuiir@mxel33ctr3bs>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Vignesh Raman <vignesh.raman@collabora.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 23/10/2023 12:09, Maxime Ripard wrote:
> On Fri, Oct 20, 2023 at 01:33:59AM -0300, Helen Koike wrote:
>> On 19/10/2023 13:51, Helen Koike wrote:
>>> On 19/10/2023 06:46, Maxime Ripard wrote:
>>>> Flaky tests can be very difficult to reproduce after the facts, which
>>>> will make it even harder to ever fix.
>>>>
>>>> Let's document the metadata we agreed on to provide more context to
>>>> anyone trying to address these fixes.
>>>>
>>>> Link: https://lore.kernel.org/dri-devel/CAPj87rPbJ1V1-R7WMTHkDat2A4nwSd61Df9mdGH2PR=ZzxaU=Q@mail.gmail.com/
>>>> Signed-off-by: Maxime Ripard <mripard@kernel.org>
>>>> ---
>>>>    Documentation/gpu/automated_testing.rst | 13 +++++++++++++
>>>>    1 file changed, 13 insertions(+)
>>>>
>>>> diff --git a/Documentation/gpu/automated_testing.rst
>>>> b/Documentation/gpu/automated_testing.rst
>>>> index 469b6fb65c30..2dd0e221c2c3 100644
>>>> --- a/Documentation/gpu/automated_testing.rst
>>>> +++ b/Documentation/gpu/automated_testing.rst
>>>> @@ -67,6 +67,19 @@ Lists the tests that for a given driver on a
>>>> specific hardware revision are
>>>>    known to behave unreliably. These tests won't cause a job to fail
>>>> regardless of
>>>>    the result. They will still be run.
>>>> +Each new flake entry must be associated with a link to a bug report to
>>>
>>> What do you mean by but report? Just a link to an email to the mailing
>>> list is enough?
>>>
>>> Also, I had made a mistake to the first flakes lists, which I corrected
>>> with https://www.spinics.net/lists/kernel/msg4959629.html (there was a
>>> bug in my script which ended up erroneous adding a bunch of tests in the
>>> flake list, so I cleaned them up), I would like to kind request to let
>>> me add those documentation in a future patch to not block that patch
>>> series.
>>>
>>> Thanks
>>> Helen
>>>
>>>
>>>> +the author of the affected driver, the board name or Device Tree name of
>>>> +the board, the first kernel version affected, and an approximation of
>>>> +the failure rate.
>>>> +
>>>> +They should be provided under the following format::
>>>> +
>>>> +  # Bug Report: $LORE_OR_PATCHWORK_URL
>>
>> I wonder if the commit adding the test into the flakes.txt file with and
>> Acked-by from the device maintainer shouldn't be already considered the Bug
>> Report.
> 
> I guess it could, yes. I think I'd still prefer the link since it would
> allow to also evaluate if the issue is fixed or not now.
> 
>>>> +  # Board Name: broken-board.dtb
>>
>> Maybe Board Name isn't required, since it is already in the name of the
>> file.
> 
> I have no idea how the i915 naming works, but on ARM at least the name
> of the file contains the name of the SoC, not the board where it was
> observed.

right, yeah we could use the dtb to be more clear/precise, no problem.

> 
>>>> +  # Version: 6.6-rc1
>>>> +  # Failure Rate: 100
>>
>> Maybe also:
>>
>>    # Pipeline url:
>> https://gitlab.freedesktop.org/helen.fornazier/linux/-/pipelines/1014435
> 
> Sounds like a good idea yeah :) Are those artifacts archived/deleted at
> some point or do they stick around forever?

Good point, I asked the admins, they stick for 4 weeks (could be more, 
but it is not forever) :(

> 
>> All this info will complicated a bit the update-xfails.py script, but well,
>> we can handle...
>> (see https://patchwork.kernel.org/project/dri-devel/patch/20231020034124.136295-4-helen.koike@collabora.com/
>> )
>> We need to update that script to make life easier.
> 
> I guess we could just add a template for now? It would keep the script
> easy and yet still hint its user that we want more data

ack

Thanks
Helen

> 
>> Vignesh sent a patch adding at least the pipeline url to the file
>> https://patchwork.kernel.org/project/linux-arm-msm/patch/20231019070650.61159-9-vignesh.raman@collabora.com/
>> but to meet this doc that needs to be updated too.
> 
> Sure, I'll update it
> 
> Maxime
