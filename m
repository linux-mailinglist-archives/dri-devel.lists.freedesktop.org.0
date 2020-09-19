Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D54270FF6
	for <lists+dri-devel@lfdr.de>; Sat, 19 Sep 2020 20:15:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA646E48C;
	Sat, 19 Sep 2020 18:15:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB8116E48C
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Sep 2020 18:15:07 +0000 (UTC)
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 69B5520874;
 Sat, 19 Sep 2020 18:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600539307;
 bh=lX7GI5brCz30In12/d5BUcDlFZD5OibdWaeounv1xGU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PF9LLKXJR/bx9fYTIqJbrS/+tcTK2TQreRXMuM0JXIrHsnt/A4rSexKjc9Qk9BOUo
 eK8XWIQtoW1qUqIDEsQnq97ctzWzsqKJwp8zLmTUEJToHgIozzxPO4qT9hyfJ/0I+A
 b7hUU4f6aJvgJuJ7c7bUSkBRhV0UHioF8AY5Vao4=
Date: Sat, 19 Sep 2020 14:15:06 -0400
From: Sasha Levin <sashal@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH AUTOSEL 5.4 265/330] drm/amd/powerplay: try to do a
 graceful shutdown on SW CTF
Message-ID: <20200919181506.GJ2431@sasha-vm>
References: <20200918020110.2063155-1-sashal@kernel.org>
 <20200918020110.2063155-265-sashal@kernel.org>
 <DM6PR12MB26190E9DD4C2DF9CEEFAD8EFE43F0@DM6PR12MB2619.namprd12.prod.outlook.com>
 <CADnq5_NhURUSqBJvoYRdUEm+QukfD1bxwFihoSzc5uV4D9ijVw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_NhURUSqBJvoYRdUEm+QukfD1bxwFihoSzc5uV4D9ijVw@mail.gmail.com>
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Quan,
 Evan" <Evan.Quan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 18, 2020 at 09:57:37AM -0400, Alex Deucher wrote:
>On Fri, Sep 18, 2020 at 3:17 AM Quan, Evan <Evan.Quan@amd.com> wrote:
>>
>> [AMD Official Use Only - Internal Distribution Only]
>>
>> Hi @Sasha Levin @Deucher, Alexander,
>>
>> The following changes need to be applied also.
>> Otherwise, you may see unexpected shutdown on stress gpu loading on Vega10.
>>
>> drm/amd/pm: avoid false alarm due to confusing softwareshutdowntemp setting
>> drm/amd/pm: correct the thermal alert temperature limit settings
>> drm/amd/pm: correct Vega20 swctf limit setting
>> drm/amd/pm: correct Vega12 swctf limit setting
>> drm/amd/pm: correct Vega10 swctf limit setting
>
>I would suggest we just drop this patch for kernels prior to 5.8
>(where it was introduced).

Will do, thanks.

-- 
Thanks,
Sasha
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
