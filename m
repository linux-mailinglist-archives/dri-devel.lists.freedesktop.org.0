Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABAAC8AD02
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 17:06:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49F3D10E088;
	Wed, 26 Nov 2025 16:06:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5C15410E088
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 16:06:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 863A7168F;
 Wed, 26 Nov 2025 08:06:00 -0800 (PST)
Received: from [10.1.30.35] (e122027.cambridge.arm.com [10.1.30.35])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 800063F73B;
 Wed, 26 Nov 2025 08:06:06 -0800 (PST)
Message-ID: <ca768fdf-df13-433a-b841-5152e26c9b92@arm.com>
Date: Wed, 26 Nov 2025 16:06:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] drm/panthor: Misc scheduler fixes
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Florent Tomasin
 <florent.tomasin@arm.com>, Heinrich Fink <hfink@snap.com>,
 kernel@collabora.com
References: <20251112115142.1270931-1-boris.brezillon@collabora.com>
 <20251126131408.68e7d868@fedora>
Content-Language: en-GB
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20251126131408.68e7d868@fedora>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/11/2025 12:14, Boris Brezillon wrote:
> On Wed, 12 Nov 2025 12:51:34 +0100
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
> 
>> Hello,
>>
>> This series is a collection of fixes that seem to address the problem
>> reported here [1]. In order to validate those changes, I added a few
>> IGT tests [2], but I'd like to extend the test coverage before claiming
>> this is working properly. Until I get to it, I thought I'd post what
>> I have for preliminary review/testing.
> 
> I've posted the IGT patches to make sure the bugs fixed here are caught
> if it ever regresses again. If there's no objection, I'd like to merge
> those patches before the end of the week (given we're passed the 6.19
> branching point, this should give us plenty of time to address
> regressions, if any).

I believe you've already got my R-b on all the patches, so from my point
of view: merge away! ;)

Thanks,
Steve

>>
>> No major changes in this version, for more details, check the changelog
>> in each patch.
>>
>> Regards,
>>
>> Boris
>>
>> [1]https://gitlab.freedesktop.org/panfrost/linux/-/issues/48
>> [2]https://gitlab.freedesktop.org/bbrezillon/igt-gpu-tools/-/tree/panthor-sched?ref_type=heads
>>
>> Boris Brezillon (8):
>>   drm/panthor: Simplify group idleness tracking
>>   drm/panthor: Don't try to enable extract events
>>   drm/panthor: Fix the group priority rotation logic
>>   drm/panthor: Fix the full_tick check
>>   drm/panthor: Fix immediate ticking on a disabled tick
>>   drm/panthor: Fix the logic that decides when to stop ticking
>>   drm/panthor: Make sure we resume the tick when new jobs are submitted
>>   drm/panthor: Kill panthor_sched_immediate_tick()
>>
>>  drivers/gpu/drm/panthor/panthor_sched.c | 190 ++++++++++++------------
>>  1 file changed, 98 insertions(+), 92 deletions(-)
>>
> 

