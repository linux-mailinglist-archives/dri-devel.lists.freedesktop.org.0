Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A40DC48D52D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 10:52:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2923112396;
	Thu, 13 Jan 2022 09:52:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 67B93112396
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 09:52:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1BBB6D;
 Thu, 13 Jan 2022 01:52:49 -0800 (PST)
Received: from [10.57.34.187] (unknown [10.57.34.187])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F5E43F766;
 Thu, 13 Jan 2022 01:52:48 -0800 (PST)
Subject: Re: [PATCH 2/2] drm/panfrost: Merge some feature lists
To: Alyssa Rosenzweig <alyssa@collabora.com>
References: <20220109170920.2921-1-alyssa.rosenzweig@collabora.com>
 <20220109170920.2921-3-alyssa.rosenzweig@collabora.com>
 <c34845c7-481b-91c1-d2ae-e239324f8364@arm.com> <Yd8qFqkTqzdUzOxc@maud>
From: Steven Price <steven.price@arm.com>
Message-ID: <023dbd83-0719-462b-3f41-6527cee45374@arm.com>
Date: Thu, 13 Jan 2022 09:52:47 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <Yd8qFqkTqzdUzOxc@maud>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/01/2022 19:20, Alyssa Rosenzweig wrote:
>>> Now that we only list features of interest to kernel space, lots of GPUs
>>> have the same feature bits. To cut down on the repetition in the file,
>>> merge feature lists that are identical between similar GPUs.
>>>
>>> Note that this leaves some unmerged identical Bifrost feature lists, as
>>> there are more features affecting Bifrost kernel space that we do not
>>> yet hanlde.
>>
>> NIT: s/hanlde/handle/ ;)
>>
>> Do you have any features in mind that we're missing? The list looks very
>> similar to the kbase one. And anyway it is simple enough to split again
>> if we need to.
> 
> Just IDVS group size. For some reason I thought there were more when I
> wrote that commit message. It's split to avoid churn in that patch.
> 
> Logically, this series should contain three patches, with the IDVS group
> size enablement patch at the end. That was the series I wrote and
> committed to disk. For review I split it out, since the feature clean-up
> can land now, while the (RFC) IDVS group size patch needs
> testing/benchmarking.
> 

Ah, of course! That makes perfect sense, but somehow I hadn't managed to
connect the two.

I've fixed the typo and pushed to drm-misc-next. And I'll wait for your
benchmarking on IDVS. Do I get a few minutes break before the Valhall
patches need reviewing? ;)

Thanks,

Steve
