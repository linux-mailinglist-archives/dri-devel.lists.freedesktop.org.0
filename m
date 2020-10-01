Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 244A627FF97
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 14:57:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA3816E219;
	Thu,  1 Oct 2020 12:56:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 407E56E219
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Oct 2020 12:56:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0CF3730E;
 Thu,  1 Oct 2020 05:56:56 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 009C13F6CF;
 Thu,  1 Oct 2020 05:56:54 -0700 (PDT)
Subject: Re: [PATCH -next] drm/panfrost: simplify the return expression of
 panfrost_devfreq_target()
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200921131021.91604-1-miaoqinglang@huawei.com>
 <8ae8a758-23ee-a413-5b25-b7beb8f4e254@arm.com>
 <CAKMK7uHQe3PBnNinaGn37s+Cgko1taKcCT3=Yy1uw63pRurOhw@mail.gmail.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <8a73b5f0-a41e-d788-d422-45e360325d95@arm.com>
Date: Thu, 1 Oct 2020 13:56:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHQe3PBnNinaGn37s+Cgko1taKcCT3=Yy1uw63pRurOhw@mail.gmail.com>
Content-Language: en-GB
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Qinglang Miao <miaoqinglang@huawei.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/10/2020 12:25, Daniel Vetter wrote:
> On Thu, Oct 1, 2020 at 12:58 PM Steven Price <steven.price@arm.com> wrote:
>>
>> On 21/09/2020 14:10, Qinglang Miao wrote:
>>> Simplify the return expression.
>>>
>>> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
>>
>> Reviewed-by: Steven Price <steven.price@arm.com>
> 
> As committer/maintainer for this please indicate whether you'll merge
> this or not, with just an r-b patches are in an awkward limbo state.
> Since Qinglang isn't committer you probably want to merge their
> patches, for otherwise they get lost.
> -Daniel

Sorry, I should have said - I'll push this (and the other similar patch 
[1]) to drm-misc-next.

Steve

[1] 
https://lore.kernel.org/r/20200921131019.91558-1-miaoqinglang@huawei.com/
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
