Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0ABE9EDEB3
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 06:10:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D2A010E270;
	Thu, 12 Dec 2024 05:10:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="B6rdBSCP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D876010E270;
 Thu, 12 Dec 2024 05:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1733980224;
 bh=hI0EGDPmpP7XnD6A+7EcRF/bfUEgIBo0whGbTy18VlA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=B6rdBSCP9h676c8clZYZaXnW6OJAvCH9vRGJFhKXO/Pfac5/85AD5LzEd/+VtM2Hl
 VOKnKCwkyqxc2+mv9wejP1ZEJTBQ3mjtNEcpqCSr18v4xzbxhrMU7ylAwjJYcp8BUf
 IIQ/CoqUKzl/R4qvazwtrygEkb9X/xry3zXqJJ5HDFHhy4RZaSkJDPaR0QZwenlFi7
 X24ZVRiaPAWSswhD6GDwMnY9xIkVfRFeGsgoO1AFMbjEGn1cJJ4TcXrQVgYpo+gFjO
 e0K3dpOYe3Ero5WIvC7P2S8yV8n2D0L+UoxpoDmv6xch5D1HR0LfnQZ5BVc1wKLbXc
 quwAsMIgDbIbg==
Received: from [192.168.50.250] (unknown [171.76.86.135])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id BBA7917E1067;
 Thu, 12 Dec 2024 06:10:19 +0100 (CET)
Message-ID: <ed90ca8c-ed81-419f-a5db-a4e8bcd35835@collabora.com>
Date: Thu, 12 Dec 2024 10:40:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ci: add kms_cursor_legacy@torture-bo to apq8016 flakes
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Helen Mae Koike Fornazier <helen.koike@collabora.com>
Cc: Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>
References: <20241204-cursor_tor_skip-v1-1-f5f0bba5df7b@quicinc.com>
 <193931869a5.f923adf2270026.8321075661083367617@collabora.com>
 <20a3955e-3d10-47c5-8e68-d70342805010@quicinc.com>
 <19393604e18.f9b6fe7d298023.1937039548910081216@collabora.com>
 <a03ae7e8-391e-4303-91fc-15a59979fd2a@quicinc.com>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <a03ae7e8-391e-4303-91fc-15a59979fd2a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Abhinav / Helen,

On 12/12/24 01:48, Abhinav Kumar wrote:
> Hi Helen / Vignesh
> 
> On 12/4/2024 12:33 PM, Helen Mae Koike Fornazier wrote:
>>
>>
>>
>>
>> ---- On Wed, 04 Dec 2024 16:21:26 -0300 Abhinav Kumar  wrote ---
>>
>>   > Hi Helen
>>   >
>>   > On 12/4/2024 11:14 AM, Helen Mae Koike Fornazier wrote:
>>   > > Hi Abhinav,
>>   > >
>>   > > Thanks for your patch.
>>   > >
>>   > >
>>   > >
>>   > > ---- On Wed, 04 Dec 2024 15:55:17 -0300 Abhinav Kumar  wrote ---
>>   > >
>>   > >   > From the jobs [1] and [2] of pipeline [3], its clear that
>>   > >   > kms_cursor_legacy@torture-bo is most certainly a flake and
>>   > >   > not a fail for apq8016. Mark the test accordingly to match 
>> the results.
>>   > >   >
>>   > >   > [1] : https://gitlab.freedesktop.org/drm/msm/-/jobs/67676481

The test passes - kms_cursor_legacy@torture-bo,UnexpectedImprovement(Pass)

>>   > >   > [2] : https://gitlab.freedesktop.org/drm/msm/-/jobs/67677430

There are no test failures

>>   > >   > [3]: https://gitlab.freedesktop.org/drm/msm/-/pipelines/1322770

The job is same as 2

In this case, the test passes and deqp-runner does not report it as 
flake. So we only need to remove it from fails file.


>>   > >   >
>>   > >   > Signed-off-by: Abhinav Kumar quic_abhinavk@quicinc.com>
>>   > >   > ---
>>   > >   >  drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt | 5 +++++
>>   > >   >  1 file changed, 5 insertions(+)
>>   > >   >
>>   > >   > diff --git 
>> a/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt 
>> b/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
>>   > >   > new file mode 100644
>>   > >   > index 000000000000..18639853f18f
>>   > >   > --- /dev/null
>>   > >   > +++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
>>   > >   > @@ -0,0 +1,5 @@
>>   > >   > +# Board Name: msm-apq8016-db410c
>>   > >   > +# Failure Rate: 100
>>   > >
>>   > > Is failure rate is 100%, isn't it a fail than?
>>   > > (I know we have other cases with Failure Rate: 100, maybe we 
>> should fix them as well)
>>   > >
>>   >
>>   > Maybe I misunderstood the meaning of "Failure rate" for a flake.
>>   >
>>   > I interpreted this as this test being flaky 100% of the time :)
>>
>> Ah right, I see, inside deqp-runner (that auto-retries).
>>
>> I'd like to hear Vignesh's opinion on this.
>>
>> (In any case, we probably should document this better)

deqp-runner reports new (not present in flakes file) or known (present 
in flakes file) flakes

2024-12-11 07:25:44.709666: Some new flakes found:
2024-12-11 07:25:44.709676:   kms_lease@page-flip-implicit-plane

2024-12-11 13:15:16.482890: Some known flakes found:
2024-12-11 13:15:16.482898: 
kms_async_flips@async-flip-with-page-flip-events-atomic

we add it to flakes file if deqp runner reports new flakes. Another case 
where we update flake tests is when a test passes in one run but fails 
in another, but deqp-runner does not report it as flake.

Regards,
Vignesh

>>
>> Regards,
>> Helen
>>
> 
> Can you let me know which way we need to go?
> 
> Just in case I did post a v2 fixing this, 
> https://patchwork.freedesktop.org/patch/627276/
> 
> If thats the way to go, can you pls take a look?
> 
> Thanks
> 
> Abhinav
>>   >
>>   > Out of the 3 runs of the test, it passed 2/3 times and failed 1/3.
>>   >
>>   > So its fail % actually is 33.33% in that case.
>>   >
>>   > I think I saw a Failure rate of 100% on msm-sm8350-hdk-flakes.txt and
>>   > mistook that as the rate at which flakes are seen.
>>   >
>>   > Let me fix this up as 33%
>>   >
>>   > > Regards,
>>   > > Helen
>>   > >
>>   > >   > +# IGT Version: 1.28-ga73311079
>>   > >   > +# Linux Version: 6.12.0-rc2
>>   > >   > +kms_cursor_legacy@torture-bo
>>   > >   >
>>   > >   > ---
>>   > >   > base-commit: 798bb342e0416d846cf67f4725a3428f39bfb96b
>>   > >   > change-id: 20241204-cursor_tor_skip-9d128dd62c4f
>>   > >   >
>>   > >   > Best regards,
>>   > >   > --
>>   > >   > Abhinav Kumar quic_abhinavk@quicinc.com>
>>   > >   >
>>   > >   >
>>   > >
>>   >
>>
