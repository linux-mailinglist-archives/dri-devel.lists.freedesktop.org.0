Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1D116671A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 20:27:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71B406E8FE;
	Thu, 20 Feb 2020 19:26:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55CDB6E21D;
 Thu, 20 Feb 2020 19:26:56 +0000 (UTC)
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DA038208C4;
 Thu, 20 Feb 2020 19:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582226816;
 bh=u1DImfIcA/rN3QlVcHUZyq0IO0dkwkKvI3WbXn3NCho=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vJ5dLSdSRVVkJEKYfZsSA0ycfYm0NRmTfjbVU5Sbl7D2xVMhn0rDdHost2I+6TH8U
 EfkeRIg6qtYWL9JH/ChhvqcvZfwZt3ozdTvLtEQda2/Ww48hQdAlB1IlgMDDmvCJJw
 wdZx2ma3SzQA1KOFzj4AizptXhTZYDa32DYaMVu8=
Date: Thu, 20 Feb 2020 14:26:54 -0500
From: Sasha Levin <sashal@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH AUTOSEL 5.5 530/542] drm/amdgpu/smu10: fix
 smu10_get_clock_by_type_with_voltage
Message-ID: <20200220192654.GJ1734@sasha-vm>
References: <20200214154854.6746-1-sashal@kernel.org>
 <20200214154854.6746-530-sashal@kernel.org>
 <CADnq5_Oq-6VYYMWgvSbTcs5S6+DHP1K+ambo3Cd_BBkYFQk8HQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_Oq-6VYYMWgvSbTcs5S6+DHP1K+ambo3Cd_BBkYFQk8HQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, "for 3.8" <stable@vger.kernel.org>,
 Evan Quan <evan.quan@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 14, 2020 at 11:31:31AM -0500, Alex Deucher wrote:
>On Fri, Feb 14, 2020 at 11:00 AM Sasha Levin <sashal@kernel.org> wrote:
>>
>> From: Alex Deucher <alexander.deucher@amd.com>
>>
>> [ Upstream commit 1064ad4aeef94f51ca230ac639a9e996fb7867a0 ]
>>
>> Cull out 0 clocks to avoid a warning in DC.
>>
>> Bug: https://gitlab.freedesktop.org/drm/amd/issues/963
>
>All of the upstream commits that reference this bug need to be applied
>or this patch set will be broken.  Please either apply them all or
>drop them.

Okay, so I have these 3 in 4.19-5.5:

c37243579d6c ("drm/amdgpu/display: handle multiple numbers of fclks in dcn_calcs.c (v2)")
4d0a72b66065 ("drm/amdgpu/smu10: fix smu10_get_clock_by_type_with_latency")
1064ad4aeef9 ("drm/amdgpu/smu10: fix smu10_get_clock_by_type_with_voltage"

-- 
Thanks,
Sasha
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
