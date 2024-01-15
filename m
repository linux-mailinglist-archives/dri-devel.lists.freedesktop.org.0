Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 169F982D72D
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 11:22:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C1F810E245;
	Mon, 15 Jan 2024 10:22:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D998E10E242;
 Mon, 15 Jan 2024 10:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1705314173;
 bh=q6YNjqm/jNB7AnV/Pw+pwivqZBrmxLJ6FITWDnGrWzc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=k++8wXbzLPfGzTc/Tw4srUseqbUmZrRtnhua2S4A0egF+IT/+mbCRggMm841lklWP
 WbAfKF5tS5RozX/VMbQuQ6+dnuSJP8rp/rp0/JA3ddLv8REXpHe/qtztxl0Bnc3QLo
 KhjCt9djXgs1bXsOTjIb7npYyAzNLpKIwkpZu9BwofzP7BqKks0zVJtle5w68TklNV
 X4YxtMXNa4foba9gR+ghOL6K6skrneGb5erIa8jGR1i/QJW4c8fZpF6i5W0fNJRfWC
 JVS10Tu9zZZSfiAWFylutW3v13xUZzam9GdooXAl9wzxgXGN6tDHrJm8n1xy00GWPS
 vglzF9+dqHagA==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1A8083782052;
 Mon, 15 Jan 2024 10:22:48 +0000 (UTC)
Message-ID: <33024b12-2530-3a2e-5bcf-f5a466d9a767@collabora.com>
Date: Mon, 15 Jan 2024 15:52:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/ci: Add msm tests
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20240108195016.156583-1-robdclark@gmail.com>
 <27e64458-7cb1-99a4-f67e-60d911f28f44@collabora.com>
 <CAF6AEGvBFdXe9rHjbwWv9eLUMv2YEP7cfMoXcWgZ30Wn4LzOjw@mail.gmail.com>
 <CAF6AEGuXi1wTbE0j6FmSnqw_EVUYSdnk5WeFL6abD=zeNutPpg@mail.gmail.com>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <CAF6AEGuXi1wTbE0j6FmSnqw_EVUYSdnk5WeFL6abD=zeNutPpg@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Helen Koike <helen.koike@collabora.com>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

On 12/01/24 22:44, Rob Clark wrote:
> On Fri, Jan 12, 2024 at 7:57 AM Rob Clark <robdclark@gmail.com> wrote:
>>
>> On Fri, Jan 12, 2024 at 3:42 AM Vignesh Raman
>> <vignesh.raman@collabora.com> wrote:
>>>
>>> Hi Rob,
>>>
>>>
>>> On 09/01/24 01:20, Rob Clark wrote:
>>>> From: Rob Clark <robdclark@chromium.org>
>>>>
>>>> The msm tests should skip on non-msm hw, so I think it should be safe to
>>>> enable everywhere.
>>>>
>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>>> ---
>>>>    drivers/gpu/drm/ci/testlist.txt | 49 +++++++++++++++++++++++++++++++++
>>>>    1 file changed, 49 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/ci/testlist.txt b/drivers/gpu/drm/ci/testlist.txt
>>>> index f82cd90372f4..eaeb751bb0ad 100644
>>>> --- a/drivers/gpu/drm/ci/testlist.txt
>>>> +++ b/drivers/gpu/drm/ci/testlist.txt
>>>> @@ -2910,3 +2910,52 @@ kms_writeback@writeback-invalid-parameters
>>>>    kms_writeback@writeback-fb-id
>>>>    kms_writeback@writeback-check-output
>>>>    prime_mmap_kms@buffer-sharing
>>>> +msm_shrink@copy-gpu-sanitycheck-8
>>>> +msm_shrink@copy-gpu-sanitycheck-32
>>>> +msm_shrink@copy-gpu-8
>>>> +msm_shrink@copy-gpu-32
>>>> +msm_shrink@copy-gpu-madvise-8
>>>> +msm_shrink@copy-gpu-madvise-32
>>>> +msm_shrink@copy-gpu-oom-8
>>>> +msm_shrink@copy-gpu-oom-32
>>>> +msm_shrink@copy-mmap-sanitycheck-8
>>>> +msm_shrink@copy-mmap-sanitycheck-32
>>>> +msm_shrink@copy-mmap-8
>>>> +msm_shrink@copy-mmap-32
>>>> +msm_shrink@copy-mmap-madvise-8
>>>> +msm_shrink@copy-mmap-madvise-32
>>>> +msm_shrink@copy-mmap-oom-8
>>>> +msm_shrink@copy-mmap-oom-32
>>>> +msm_shrink@copy-mmap-dmabuf-sanitycheck-8
>>>> +msm_shrink@copy-mmap-dmabuf-sanitycheck-32
>>>> +msm_shrink@copy-mmap-dmabuf-8
>>>> +msm_shrink@copy-mmap-dmabuf-32
>>>> +msm_shrink@copy-mmap-dmabuf-madvise-8
>>>> +msm_shrink@copy-mmap-dmabuf-madvise-32
>>>> +msm_shrink@copy-mmap-dmabuf-oom-8
>>>> +msm_shrink@copy-mmap-dmabuf-oom-32
>>>> +msm_mapping@ring
>>>> +msm_mapping@sqefw
>>>> +msm_mapping@shadow
>>>> +msm_submitoverhead@submitbench-10-bos
>>>> +msm_submitoverhead@submitbench-10-bos-no-implicit-sync
>>>> +msm_submitoverhead@submitbench-100-bos
>>>> +msm_submitoverhead@submitbench-100-bos-no-implicit-sync
>>>> +msm_submitoverhead@submitbench-250-bos
>>>> +msm_submitoverhead@submitbench-250-bos-no-implicit-sync
>>>> +msm_submitoverhead@submitbench-500-bos
>>>> +msm_submitoverhead@submitbench-500-bos-no-implicit-sync
>>>> +msm_submitoverhead@submitbench-1000-bos
>>>> +msm_submitoverhead@submitbench-1000-bos-no-implicit-sync
>>>> +msm_recovery@hangcheck
>>>> +msm_recovery@gpu-fault
>>>> +msm_recovery@gpu-fault-parallel
>>>> +msm_recovery@iova-fault
>>>> +msm_submit@empty-submit
>>>> +msm_submit@invalid-queue-submit
>>>> +msm_submit@invalid-flags-submit
>>>> +msm_submit@invalid-in-fence-submit
>>>> +msm_submit@invalid-duplicate-bo-submit
>>>> +msm_submit@invalid-cmd-idx-submit
>>>> +msm_submit@invalid-cmd-type-submit
>>>> +msm_submit@valid-submit
>>>
>>> I tested this patch with latest drm-misc/drm-misc-next and there was
>>> some failures seen for the newly added msm tests. I have updated the
>>> xfails with below commit,
>>>
>>> https://gitlab.freedesktop.org/vigneshraman/linux/-/commit/d012893597a661d6ebbb755bf2607dfb055524a1
>>>
>>> I will notify the maintainers about the flaky tests, update the url in
>>> the flakes.txt, and submit a separate patch for this change.
> 
> Oh, you should probably move msm_mapping@* to skips on sdm845.  I had
> a closer look at those, and they are failing due to a bootloader/fw
> issue.  We work around this in mesa CI with these two patches:
> 
> https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/4b49f902ec6f2bb382cbbf489870573f4b43371e
> https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/38cdf4c5559771e2474ae0fecef8469f65147bc1
> 
> But given that sdm845 is similar to sc7180 as far as kernel gpu
> driver, it is probably just better to skip these on sdm845 (with a
> comment referring to the hack patches we use in mesa CI)

I have sent a patch with these changes,

https://lore.kernel.org/dri-devel/20240115101750.27077-1-vignesh.raman@collabora.com/T/#u

Thanks.

Regards,
Vignesh

