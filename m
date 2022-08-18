Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 394535986F6
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 17:11:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9747BAB97;
	Thu, 18 Aug 2022 15:11:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B4399AB15;
 Thu, 18 Aug 2022 15:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=CbGJK9ZiR1VZ+b3H1/bjKz89ere1vSVIkGBu0M3WHFo=; b=wruw1N6NJkF3bB+T5MEPjct/rN
 m8LDaRWUWlwkM53A1OvK5nWg9gFfb3DnhRPMtMUkQeZu4el5tythqKYR6GzskMPvuDZqvDJEsZWiH
 Dg9isqS9vy3J0/zntHKPv4Pv8+NGQurImbZOD9N1ThuywPoBSHsuBZKiBW7vyx3wWiuUVSvBIXRhl
 ppLNVpDtmqx0WYUBG0rIATrkI5B8fJHBctF1lupg2qjmg5TFCNJaVotsHua5Rd2nRqzK3NBi/MVGl
 4L5RY3AIJBPeNJClwUKEJcKuGmwteVjjvy/qduSB02gKeTnfSup2cA9XmplXdi8DRbz3l5kiREQaa
 b9sMIdRA==;
Received: from [2601:1c0:6280:3f0::a6b3]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1oOhAU-006SuS-M7; Thu, 18 Aug 2022 15:10:46 +0000
Message-ID: <c1869a4b-ead1-2ae5-c9ec-61834b578216@infradead.org>
Date: Thu, 18 Aug 2022 08:10:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: build failure of next-20220817 for amdgpu
Content-Language: en-US
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
References: <Yv1lepjhg/6QKyQl@debian>
 <CADnq5_Od9W1iuzYpsmODOB=Xem97ogeH_t0JrjWC-S8h0XM9fA@mail.gmail.com>
 <5638aaf1-b808-bdc6-d84a-820f24facea6@infradead.org>
 <CADVatmNA6-qCJEHNn-gRO6Nx88SsTrPsJn_F5J0NiFhyvijNxA@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CADVatmNA6-qCJEHNn-gRO6Nx88SsTrPsJn_F5J0NiFhyvijNxA@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 linux-next <linux-next@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/18/22 03:43, Sudip Mukherjee wrote:
> On Thu, Aug 18, 2022 at 3:09 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>>
>>
>> On 8/17/22 19:01, Alex Deucher wrote:
>>> On Wed, Aug 17, 2022 at 6:03 PM Sudip Mukherjee (Codethink)
>>> <sudipm.mukherjee@gmail.com> wrote:
>>>>
>>>> Hi All,
>>>>
>>>> Not sure if it has been reported, build of next-20220817 fails with the
>>>> error:
>>>>
>>>> ERROR: modpost: "cpu_smallcore_map" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
>>>>
>>>> Trying to do a git bisect to find out the offending commit.
>>>>
>>>
>>> Thanks.  I don't see that symbol in the driver at all.  Not sure where
>>> it is coming from.
>>>
>>
>> It's powerpc only.
>>
>> Sudip, is it non-CONFIG_SMP by any chance?
> 
> Ohhh.. really sorry for the incomplete report. I should not try to
> mail while travelling.
> 
> The error is seen with powerpc allmodconfig and it has CONFIG_SMP=y.

OK, I see that also, but it doesn't make any sense (to me).

I did 'objdump' on the code file (amdgpu.o) and it's listed as
undefined but there are no code references to it.

-- 
~Randy
