Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 092CF68B03D
	for <lists+dri-devel@lfdr.de>; Sun,  5 Feb 2023 15:17:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE5F10E02D;
	Sun,  5 Feb 2023 14:17:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA9810E02D;
 Sun,  5 Feb 2023 14:17:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A97DF6066C;
 Sun,  5 Feb 2023 14:17:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E78B9C433EF;
 Sun,  5 Feb 2023 14:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675606629;
 bh=M0+y7XWD/m0EVxjYT3JybIANfeo5w8h14kAjh4ctWQ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lPJnp59FgPLTFCfThv4JCMOovnM68JhEEhvzXhtMs9K+pTOfEfCC8AjSzqqNahYvx
 BO9UQHnK27Se6jP8q8wJ+8KfEEslUmzZjQRliaAAx6REP4HtkUUYZF0SWoJZOurKWK
 2eesgp3zRgOwEBIDwYzTCpPp3ahCAWC7IpJpqV4MSULca3RfSDRAw0C9BjL0/OJIQP
 bJe0hm7FP+M84/iKCaiqLiBF4jAKxOfFMLcWJtV2cGzENihBxK+Mk/yVNEJrniaVSt
 kFSE6/9XLx0DgZ9uA1TYJk5VFDgnLAmZEzDLMMd2Y0B75N9tV1f2SKttS8JOUphmgu
 PZYMDsiXSMq+g==
Date: Sun, 5 Feb 2023 09:17:07 -0500
From: Sasha Levin <sashal@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH AUTOSEL 5.15 12/12] amdgpu: fix build on non-DCN platforms.
Message-ID: <Y9+6Y/4SDJ2//I+n@sashalap>
References: <20230131150030.1250104-1-sashal@kernel.org>
 <20230131150030.1250104-12-sashal@kernel.org>
 <CADnq5_M=WvEf6N9my2cjX1=aQdweKfrshyU+Q8Ohuo5=DBtf+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CADnq5_M=WvEf6N9my2cjX1=aQdweKfrshyU+Q8Ohuo5=DBtf+w@mail.gmail.com>
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
Cc: stylon.wang@amd.com, sunpeng.li@amd.com, dri-devel@lists.freedesktop.org,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, roman.li@amd.com, Jerry.Zuo@amd.com,
 aurabindo.pillai@amd.com, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, Dave Airlie <airlied@redhat.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 31, 2023 at 03:29:04PM -0500, Alex Deucher wrote:
>On Tue, Jan 31, 2023 at 10:01 AM Sasha Levin <sashal@kernel.org> wrote:
>>
>> From: Dave Airlie <airlied@redhat.com>
>>
>> [ Upstream commit f439a959dcfb6b39d6fd4b85ca1110a1d1de1587 ]
>>
>> This fixes the build here locally on my 32-bit arm build.
>>
>> Signed-off-by: Dave Airlie <airlied@redhat.com>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>
>This patch is only applicable to kernel 6.1 and newer.

Ack, I'll drop it on older kernels, thanks!

-- 
Thanks,
Sasha
