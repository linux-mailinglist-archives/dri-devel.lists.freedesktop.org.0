Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CFB3BE691
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 12:46:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B3D76E0AC;
	Wed,  7 Jul 2021 10:46:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF4D6E08E;
 Wed,  7 Jul 2021 10:46:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8815C61CAA;
 Wed,  7 Jul 2021 10:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625654797;
 bh=x/6yJbDlJx88gXff2NPaDoOf2VTEmW/FiSuagMfWqrE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DeSb7RTenYR1UxkiWCo6aig5ZaRjJCOaklGoahkm78lFkC7RH6QMYEC6DGriMJnFZ
 MjTG84pV43p9AGNw5QcyjNi5ISj4L6msunpox/EgkIsIFrK10P6LQO/zkhAtyvKwsB
 rNdDnEKkMhFito12aHrPihmkN9G4u5/sc1TLRPy6xuiaiFCtakU67dptaeszT//Ope
 Q8x3sbojAks+WaQHC4pSb28iGhVWeISBoa5xXgLZqOmkss+XIW1/I9m6G8STIUpA3R
 /gZUWs9Lqmpxl+JxTf77MmGgyQFuZXRTrSXTz+0RGcslFjui0OEJvBQ/XscTjNaWyR
 yxszLHWpW3qtg==
Date: Wed, 7 Jul 2021 06:46:36 -0400
From: Sasha Levin <sashal@kernel.org>
To: Felix Kuehling <felix.kuehling@amd.com>
Subject: Re: [PATCH AUTOSEL 5.13 113/189] drm/amdgpu/gfx9: fix the doorbell
 missing when in CGPG issue.
Message-ID: <YOWGDHa3fdUPsdRS@sashalap>
References: <20210706111409.2058071-1-sashal@kernel.org>
 <20210706111409.2058071-113-sashal@kernel.org>
 <CADnq5_ObmVRjwUB5Lw0bLZLL-+=CqvGkJZ+2DY5ZDh+uN-oo0g@mail.gmail.com>
 <affee955-54bc-11c3-8ccd-5678f7aee687@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <affee955-54bc-11c3-8ccd-5678f7aee687@amd.com>
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
Cc: Yifan Zhang <yifan1.zhang@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "for 3.8" <stable@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 06, 2021 at 07:09:37PM -0400, Felix Kuehling wrote:
>Am 2021-07-06 um 5:44 p.m. schrieb Alex Deucher:
>> On Tue, Jul 6, 2021 at 7:16 AM Sasha Levin <sashal@kernel.org> wrote:
>>> From: Yifan Zhang <yifan1.zhang@amd.com>
>>>
>>> [ Upstream commit 631003101c516ea29a74aee59666708857b9a805 ]
>>>
>>> If GC has entered CGPG, ringing doorbell > first page doesn't wakeup GC.
>>> Enlarge CP_MEC_DOORBELL_RANGE_UPPER to workaround this issue.
>>>
>>> Signed-off-by: Yifan Zhang <yifan1.zhang@amd.com>
>>> Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
>>> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
>>> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>> This should be dropped.  It was already reverted.
>
>Patch 146 of this series is the corresponding revert.

I'll drop both, thanks!

-- 
Thanks,
Sasha
