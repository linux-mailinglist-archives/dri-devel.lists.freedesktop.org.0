Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B42790F64
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 02:43:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57C1210E261;
	Mon,  4 Sep 2023 00:43:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 439 seconds by postgrey-1.36 at gabe;
 Mon, 04 Sep 2023 00:43:33 UTC
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B2F510E153;
 Mon,  4 Sep 2023 00:43:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4BDF8B8069C;
 Mon,  4 Sep 2023 00:36:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2A3EC433CA;
 Mon,  4 Sep 2023 00:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693787764;
 bh=l/ZbviUAxVSkzWPyEeIQ9Fs+OkgtA7pgZqstVlvtbQQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=evXDeLHRwiT4KgwYnIN2i5lcQIUcFDaUGlfkVPVf+PtZYoGITJ2Volm+tErbbpK10
 WweMowunRx81+JswUwcqQPA2jAYr7jslTPKkKcB2FY2S1LoKBKPXt37SUJlJKqmav7
 Qy+lNtKGClbdkFVJY+9yTY37Tkcuz0OXraOVJPZgPNnve6ho6odmEnZpcwfzC6NTmT
 TG0DJwCDaAxg+wdhgo2Lw16ebN2y8yLvX8LX96X9Tv9efh/aETy2PHWjexn3bxf/qW
 y3Xm82oFazw2fFIyrY50SeGEYi28Z0JvwQHN3n4SMpTDS6fPHZJEmYGtsGmsazWoqN
 6NSxAcr9wl+rg==
Date: Sun, 3 Sep 2023 20:36:02 -0400
From: Sasha Levin <sashal@kernel.org>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: Re: [PATCH AUTOSEL 6.1 08/10] drm/amdkfd: ignore crat by default
Message-ID: <ZPUmcjPuyUj2qqN+@sashalap>
References: <20230822113628.3551393-1-sashal@kernel.org>
 <20230822113628.3551393-8-sashal@kernel.org>
 <BN9PR12MB5146E3C94A2A6CB87138B2BCF71FA@BN9PR12MB5146.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <BN9PR12MB5146E3C94A2A6CB87138B2BCF71FA@BN9PR12MB5146.namprd12.prod.outlook.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 22, 2023 at 03:41:18PM +0000, Deucher, Alexander wrote:
>[Public]
>
>> -----Original Message-----
>> From: Sasha Levin <sashal@kernel.org>
>> Sent: Tuesday, August 22, 2023 7:36 AM
>> To: linux-kernel@vger.kernel.org; stable@vger.kernel.org
>> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Kuehling, Felix
>> <Felix.Kuehling@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>;
>> Mike Lothian <mike@fireburn.co.uk>; Sasha Levin <sashal@kernel.org>; Pan,
>> Xinhui <Xinhui.Pan@amd.com>; airlied@gmail.com; daniel@ffwll.ch; amd-
>> gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>> Subject: [PATCH AUTOSEL 6.1 08/10] drm/amdkfd: ignore crat by default
>>
>> From: Alex Deucher <alexander.deucher@amd.com>
>>
>> [ Upstream commit a6dea2d64ff92851e68cd4e20a35f6534286e016 ]
>>
>> We are dropping the IOMMUv2 path, so no need to enable this.
>> It's often buggy on consumer platforms anyway.
>
>
>This is not needed for stable.

Dropped this and the other ones you've pointed out, thanks!

-- 
Thanks,
Sasha
