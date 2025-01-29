Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE446A219E7
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 10:33:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 202C610E2CE;
	Wed, 29 Jan 2025 09:33:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="huxgjh8M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E2EA10E2CE
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 09:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1738143188;
 bh=rF2QEfMpgRURa/Nr9ID5fEOyfE/6x7j6OMBvAS0duAE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=huxgjh8MA2s8jdfqP46FkoeTWT6nNkC3K/UUPZYFld3yHhBrdBtFj99lDEv/xUKUn
 Lq7mAU9zMnCIsvM02zBTExclPzvc7RYKFN2WShLcOFVh1xMC6utFbw5eREhvmZ4Mb7
 9hmFkScaDZbSybDqeNV4W+AIBbQ8LyNoFeen8bbGxvEwdP2dn7aBEcjAe+txsdPvD+
 tQXIxBdBWaoT5KxFCJ9QOkzYgiIJ0INW+8GQRffX0YSR6fFF8bBlonZcr/OqOBsd7m
 Jfwq1ocHDX3bn1NIIdFUEwg0JlooV6KmoxPxKTeL/s/3wyBf7razJQHr3IJJnO7CEI
 YQv6GdN1dOTdQ==
Received: from [192.168.50.250] (unknown [171.76.83.215])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C07B317E00F6;
 Wed, 29 Jan 2025 10:33:00 +0100 (CET)
Message-ID: <446c3583-ba95-4021-83ca-1e112edf5b22@collabora.com>
Date: Wed, 29 Jan 2025 15:02:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] kci-gitlab: Introducing GitLab-CI Pipeline for
 Kernel Testing
To: =?UTF-8?Q?Leonardo_Br=C3=A1s?= <leobras.c@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: kernelci@lists.linux.dev, linuxtv-ci@linuxtv.org,
 dave.pigott@collabora.com, mripard@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org,
 gustavo.padovan@collabora.com, pawiecz@collabora.com, spbnick@gmail.com,
 tales.aparecida@gmail.com, workflows@vger.kernel.org,
 skhan@linuxfoundation.org, kunit-dev@googlegroups.com,
 nfraprado@collabora.com, davidgow@google.com, cocci@inria.fr,
 Julia.Lawall@inria.fr, laura.nao@collabora.com, kernel@collabora.com,
 torvalds@linuxfoundation.org, gregkh@linuxfoundation.org,
 daniels@collabora.com, helen.koike@collabora.com,
 shreeya.patel@collabora.com, denys.f@collabora.com,
 nicolas.dufresne@collabora.com, louis.chauvet@bootlin.com,
 hamohammed.sa@gmail.com, melissa.srw@gmail.com, simona@ffwll.ch,
 airlied@gmail.com, Tim.Bird@sony.com, broonie@kernel.org, groeck@google.com,
 rdunlap@infradead.org, geert@linux-m68k.org, michel.daenzer@mailbox.org,
 sakari.ailus@iki.fi, jarkko@kernel.org
References: <20250123135342.1468787-1-vignesh.raman@collabora.com>
 <f779c9af4133629f724e366241fab7421d13d227.camel@gmail.com>
 <20250124081250.GA24731@pendragon.ideasonboard.com>
 <6ebd1551-017f-4b31-b235-829b2735d78f@collabora.com>
 <a6816a68e5e9aeb1d330b68f6a73decd2233c164.camel@gmail.com>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <a6816a68e5e9aeb1d330b68f6a73decd2233c164.camel@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Leo,

On 28/01/25 00:35, Leonardo Brás wrote:
> On Mon, 2025-01-27 at 13:02 +0530, Vignesh Raman wrote:
>> Hi Leo,
>>
>> On 24/01/25 13:42, Laurent Pinchart wrote:
>>> On Fri, Jan 24, 2025 at 02:11:26AM -0300, Leonardo Brás wrote:
>>>> On Thu, 2025-01-23 at 19:23 +0530, Vignesh Raman wrote:
>>>>> This patch series introduces "kci-gitlab," a GitLab CI pipeline
>>>>> specifically designed for kernel testing. It provides kernel
>>>>> developers with an integrated, efficient, and flexible testing
>>>>> framework using GitLab's CI/CD capabilities. This patch includes
>>>>> a .gitlab-ci file in the tools/ci/gitlab-ci/ folder, along with
>>>>> additional YAML and script files, to define a basic test pipeline
>>>>> triggered by code pushes to a GitLab-CI instance.
>>>>> The initial version implements:
>>>>>       
>>>>> - Static checks: Includes checkpatch and smatch for code validation.
>>>>> - Build tests: Covers various architectures and configurations.
>>>>> - Boot tests: Utilizes virtme for basic boot testing.
>>>>>
>>>>> Additionally, it introduces a flexible "scenarios" mechanism to
>>>>> support subsystem-specific extensions.
>>>>>
>>>>> This series also introduces a drm scenario that adds a job to run IGT
>>>>> tests for vkms. This scenario includes helper scripts to build deqp-runner
>>>>> and IGT, leveraging approaches from the drm-ci/mesa-ci project.
>>>>>
>>>>> We are working towards creating a generic, upstream GitLab-CI pipeline
>>>>> (kci-gitlab) that will replace DRM-CI [1]. The proposed GitLab-CI pipeline
>>>>> is designed with a distributed infrastructure model, making it possible
>>>>> to run on any gitLab instance. We plan to leverage KernelCI [2] as the
>>>>> backend, utilizing its hardware, rootfs, test plans, and KCIDB [3]
>>>>> integration.
>>>>>
>>>>> For an example of a fully executed pipeline with drm scenario set,
>>>>> including documentation generation,
>>>>> see: https://gitlab.freedesktop.org/vigneshraman/kernel/-/pipelines/1350262
>>>>>
>>>>> Please refer to the documentation included in the patch, or check the
>>>>> rendered version, here:
>>>>> https://vigneshraman.pages.freedesktop.org/-/kernel/-/jobs/69787927/artifacts/artifacts/Documentation-output/ci/gitlab-ci/gitlab-ci.html
>>>>>
>>>>> Differences from v1 to v2:
>>>>> - moved to tools/ci as suggested by Linus on the previous version
>>>>> - add arm64 containers for native compilation
>>>>> - added boot tests using virtme: this is the base structure for boot tests,
>>>>>     next steps would be adding other tests such as kselftests/kunit tests
>>>>> - added DRM scenario testing on vkms: this should replace current vkms test
>>>>>     in drm-ci. This work shows how a test scenario can be used by different
>>>>>     subsystems to add their tests.
>>>>> - update documentation
>>>>>
>>>>> For more details on the motivation behind this work, please refer to the
>>>>> cover letter of v1: https://patchwork.kernel.org/project/linux-kselftest/cover/20240228225527.1052240-1-helen.koike@collabora.com/
>>>>>
>>>>> [1] https://www.collabora.com/news-and-blog/blog/2024/02/08/drm-ci-a-gitlab-ci-pipeline-for-linux-kernel-testing/
>>>>> [2] https://kernelci.org/
>>>>> [3] https://docs.kernelci.org/kcidb/
>>>>>
>>>>> Helen Koike (3):
>>>>>     kci-gitlab: Introducing GitLab-CI Pipeline for Kernel Testing
>>>>>     kci-gitlab: Add documentation
>>>>>     kci-gitlab: docs: Add images
>>>>>
>>>>> Vignesh Raman (2):
>>>>>     MAINTAINERS: Add an entry for ci automated testing
>>>>>     kci-gitlab: Add drm scenario
>>>>
>>>> Hi Vignesh Raman,
>>>> I am very happy to see this project going forward :)
>>>>
>>>> It's been a few years since I first thought on finding a good way of helping
>>>> kernel developers testing their patches, while making use of the free runner
>>>> minutes Gitlab offers. It can greatly simplify the testing for people who are
>>>> new to kernel development, or students trying to understand it better.
>>>>
>>>> And this patchset allows that to happen :)
>>
>> Thanks for testing the patch and providing feedback.
> 
> :)
> 
>>
>>>>
>>>> Actually, I spoke to Helen last year, and to enable it to run on the free
>>>> Gitlab-CI runners, there is a small extra patch which is needed:
>>>>
>>>> https://lore.kernel.org/all/20240327013055.139494-2-leobras@redhat.com/
>>
>> Thanks for the patch.
> 
> Thank you for most of the work, it sure will be useful :)
> 
>>
>> We can keep the variable name as KCI_CI_TAGS (like other variables) and
>> add it in variables with default empty string.
> 
> Just tested, if it's an empty string, it will just be ignored, as it won't match
> anything (that is not an empty string)

Ack. Adding it to variables will allow us pass KCI_CI_TAGS when manually 
creating a pipeline without changing the CI/CD settings, but we can 
ignore this for now.

> 

>>
>>>
>>> Gitlab as an open-source software project (the community edition) is one
>>> thing, but can we please avoid advertising specific proprietary services
>>> in the kernel documentation ?
>>
>> Agree. We could remove the lines which mentions gitlab.com SaaS in
>> commit message and documentation.
> 
> Done :)
> Added a generic reason for needing better instance
> 
>>
>>>
>>>> Could you please apply it on top of your tree?
>>>> Some stuff changed places, but I can send a v2 with that fix if you want.
>>
>> I will test your patch and we can add this for v3.
> 
> Thanks!
> That's the v2 with the required changes:
> 
> https://lore.kernel.org/all/20250127185849.34131-1-leobras@redhat.com/T/#u
> 
> Please let me know if any further change is needed.


Thanks for the patch. We will pick this for v3.

Regards,
Vignesh

> 
> Thanks!
> Leo
> 
>>
>> Regards,
>> Vignesh
>>
>>>>
>>>>
>>>> While I have yet to review this v2 patchset, I applied it on my repo for
>>>> testing, and cherry-picked the patch on above link, triggering a Pipeline:
>>>>
>>>> https://gitlab.com/linux-kernel/linux/-/pipelines/1638955600
>>>>
>>>> It seems to be working fine, please check it, as you may be more used to the
>>>> results.
>>>>
>>>> Thanks!
>>>> Leo
>>>
> 
