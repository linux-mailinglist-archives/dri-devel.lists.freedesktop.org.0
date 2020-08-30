Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F672570E3
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 00:41:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0972589D77;
	Sun, 30 Aug 2020 22:41:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E26E189CF6;
 Sun, 30 Aug 2020 22:41:30 +0000 (UTC)
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2703B2083E;
 Sun, 30 Aug 2020 22:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598827290;
 bh=dozG/V0QLz75yvvhtnhJiCnR4Wh8JH9/N5EL/DF+S5c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Da2nllEbuK8U4cXg/3Q6NyVmTP24ILAO+nfw/FEUrgG8DsXugKB149e0jsnsyyR5u
 huYR1Rrh4mVmv8ppJyCX12gjIQeTO2dDag+QAZ+JElKmEchDjym1MmggeNBsyekVyq
 ALl+urnJi2NQ3OywAp0Jv+S4cZ7e1yPgcD7i2ips=
Date: Sun, 30 Aug 2020 18:41:29 -0400
From: Sasha Levin <sashal@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH AUTOSEL 5.8 52/63] drm/amdgpu: disable gfxoff for
 navy_flounder
Message-ID: <20200830224129.GA8670@sasha-vm>
References: <20200824163504.605538-1-sashal@kernel.org>
 <20200824163504.605538-52-sashal@kernel.org>
 <CADnq5_Osp+ePNgm1c5VxRzuymZzkTCF1Zps+Y0JjO8AJ66r+TQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_Osp+ePNgm1c5VxRzuymZzkTCF1Zps+Y0JjO8AJ66r+TQ@mail.gmail.com>
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
Cc: Tao Zhou <tao.zhou1@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Jiansong Chen <Jiansong.Chen@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, "for 3.8" <stable@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 24, 2020 at 02:23:42PM -0400, Alex Deucher wrote:
>On Mon, Aug 24, 2020 at 12:36 PM Sasha Levin <sashal@kernel.org> wrote:
>>
>> From: Jiansong Chen <Jiansong.Chen@amd.com>
>>
>> [ Upstream commit 9c9b17a7d19a8e21db2e378784fff1128b46c9d3 ]
>>
>> gfxoff is temporarily disabled for navy_flounder,
>> since at present the feature has broken some basic
>> amdgpu test.
>>
>> Signed-off-by: Jiansong Chen <Jiansong.Chen@amd.com>
>> Reviewed-by: Tao Zhou <tao.zhou1@amd.com>
>> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>
>Support for this chip does not exist in 5.8 or any other older trees.
>Please drop this.

I've dropped both of the commits you'ce pointed out from all branches.

-- 
Thanks,
Sasha
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
