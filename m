Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D71427D84A6
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 16:27:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 580FB10E147;
	Thu, 26 Oct 2023 14:27:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63C3110E147
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 14:27:27 +0000 (UTC)
Received: from [192.168.68.129] (unknown [177.98.22.188])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E5FD36607359;
 Thu, 26 Oct 2023 15:27:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698330446;
 bh=CahQxm3jQ+ALExG3x3nD4ID/MaB8ffIszfYAaKPWyS0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nC5Li7rAqOwYc7y4xKR2F89BbzYKFlOqCdoe8pR7uC5ZZ1d6DQDiKXDniqDXvtCu5
 7yepe1leTTIq89dWUYA0CfWRgPCLjUA6AjOPqXGB/bU1IAnLF5u0bZBAqwhKofEx/w
 6lA2qnRw0IHxI3fz3w1zxPFCnD0ACZkTlZSq+hEHUPHQH8ufERCg0jMBLJHWgxDnKx
 u/HpC8wZGC3VZRAMbuML6Ak43gNLt8KoC8a5UndjwotnV665CslsrcGLI3rM4mzCas
 1CFzj8KZeqClQenIiegKv+EcDnFy2yCndwsWWNy00fEqmFMuSfXiIOCIMvFkTTJO63
 LT30r0wzTMLCg==
Message-ID: <d7ad25bb-3391-4a2d-96df-f579bc38e183@collabora.com>
Date: Thu, 26 Oct 2023 11:27:18 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v2] drm/doc: ci: Require more context for flaky
 tests
To: Maxime Ripard <mripard@kernel.org>
References: <20231025142441.745947-1-mripard@kernel.org>
 <169831793153.896759.13985615649031607361.b4-ty@kernel.org>
 <62542ca6-d2c2-4330-8423-3edbdc3b4bd8@collabora.com>
 <22723536-dc2e-4973-984b-1504367d84a0@collabora.com>
 <jufk7lzskhsz4dc4iiqsuuspno2772yowokw6e75dmrh5jvdt2@g6it5xcsd45k>
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <jufk7lzskhsz4dc4iiqsuuspno2772yowokw6e75dmrh5jvdt2@g6it5xcsd45k>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Vignesh Raman <vignesh.raman@collabora.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 26/10/2023 10:27, Maxime Ripard wrote:
> On Thu, Oct 26, 2023 at 09:08:03AM -0300, Helen Koike wrote:
>>
>>
>> On 26/10/2023 09:01, Helen Koike wrote:
>>>
>>>
>>> On 26/10/2023 07:58, Maxime Ripard wrote:
>>>> On Wed, 25 Oct 2023 16:24:41 +0200, Maxime Ripard wrote:
>>>>> Flaky tests can be very difficult to reproduce after the facts, which
>>>>> will make it even harder to ever fix.
>>>>>
>>>>> Let's document the metadata we agreed on to provide more context to
>>>>> anyone trying to address these fixes.
>>>>>
>>>>>
>>>>> [...]
>>>>
>>>> Applied to drm/drm-misc (drm-misc-next).
>>>
>>> Thanks!
>>>
>>> Could you also apply https://patchwork.kernel.org/project/dri-devel/cover/20231024004525.169002-1-helen.koike@collabora.com/
>>> (and the dependencies listed on it).
>>
>> For some reason, commit message 7/10 (drm/ci: increase i915 job timeout to
>> 1h30m) looks incomplete in patchwork, but it looks fine in my branch:
>>
>> https://gitlab.freedesktop.org/helen.fornazier/linux/-/commits/for-drm-misc-wip/
>>
>> Let me know if you prefer that I send it again or if you could pull from the
>> branch.
> 
> It was fine on lore.kernel.org and that's where I'm pulling from, so it all worked out :)
> 
> Everything you asked for should be applied now
> 
> Maxime

Awesome, thank you!

Sorry, just another request, could you please pull this other one 
updating MAINTAINERS?

https://patchwork.kernel.org/project/linux-arm-msm/patch/20230919182249.153499-1-helen.koike@collabora.com/

So get_maintainers.pl returns the right people and we don't forget to 
notify maintainers when flakes/fails/skips are updated.

Thank again.
Helen
