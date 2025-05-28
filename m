Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4257AC668F
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 12:01:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB93910E5C3;
	Wed, 28 May 2025 10:01:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kode54.net header.i=@kode54.net header.b="cpdp0sbS";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="AMSY+v7Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 340 seconds by postgrey-1.36 at gabe;
 Wed, 28 May 2025 10:01:11 UTC
Received: from fout-a3-smtp.messagingengine.com
 (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D68A810E5C3;
 Wed, 28 May 2025 10:01:11 +0000 (UTC)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal
 [10.202.2.43])
 by mailfout.phl.internal (Postfix) with ESMTP id C2555138251D;
 Wed, 28 May 2025 05:55:29 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Wed, 28 May 2025 05:55:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kode54.net; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1748426129;
 x=1748512529; bh=mIr8yhVZYdL15whLx7nAJetmRapUCJpeMtsLnS/rGak=; b=
 cpdp0sbSCbZxICJ/uifWQuyYZWw/ypXYHoSuiAZ5R83PdXIfI3vrlSsYPqDG3ypc
 QzqUNS9QOvqM7ueZdiTPppgq406rYkK04HdadYNOS34muwOtlbywITlAZLpCwyN7
 6NvxeAgThgvL4m8R7TCbrvZzWZNppjxWWrrNFCX1jlYcgxMy22R3B+VPQsZOjabN
 MtqRrmOyzOMD9UmGnuFaJfXKee3rrlK7QZ/XzvY+Svv7Ho02oo+tkIexuhSNbji4
 JeJAUZAdOsPpi5aOj+2Hbn+K7WttfAWULNjJA6GYDFmIvAdixDtSJO723Q4+a4nz
 dw7zAG33l8lHZ4p2oSqWkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1748426129; x=
 1748512529; bh=mIr8yhVZYdL15whLx7nAJetmRapUCJpeMtsLnS/rGak=; b=A
 MSY+v7YrFBM3fs5FHQm3SmaQNf7i3C4vr1V1iVGd2guZP7i5z5ggnXixRRiQwA16
 TsBdLz1njDFTlL8Yn+nrh+wLO4L6jcEv4X0Olx5zY5O1cZeGpDzfsDW3gtvl3YsT
 H58D6e2vHv44Ua7uSJdSzyYpBQMPZ4zgm6sdhRBbyThka71kOHjKVSEffPKCTq7k
 DVFj0YjSPiA1tErZ+Wa4in9bSRMTqE7ODdPlz5txJOXihMfDt2xyIFwgnTjKKlPd
 TluZTqYRwbNLqhCth9+3tKenp1Cy0le0VKtgbsCRbJjR3q/iGIcy4Ymy8Er+vHZH
 4JLnttUH2OQc5eAAaRADw==
X-ME-Sender: <xms:kd02aBLbQlD9XZrVpymFhIYaXTD2LJsoJCSgUZk0m7JsLzxRWkM9pg>
 <xme:kd02aNKO1xWATk2FDIvERLDIqxPRHZZu3jcAg3cl3araUiE07DkH2yrYL1sUzSYJe
 GI613_n0ui8Nd7GTUc>
X-ME-Received: <xmr:kd02aJvTELS7bZYEiIffqj6gFB6MF4W7Wj86MrCqtKjSroIuMsk0wBBnW08pZ-97M22UgTeploSz-vUpVbysVwXhu_pPr3988A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvvdelieculddtuddrgeefvddrtd
 dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
 fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
 dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvefu
 hffvofhfjgesthhqredtredtjeenucfhrhhomhepfdevhhhrihhsthhophhhvghrucfunh
 hofihhihhllhdfuceotghhrhhisheskhhouggvheegrdhnvghtqeenucggtffrrghtthgv
 rhhnpeeileetudejffegjeegfffhhffhkeefjefgtddujeehheevleevjeejffekieekve
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegthhhr
 ihhssehkohguvgehgedrnhgvthdpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtph
 houhhtpdhrtghpthhtoheptghhrhhishhtihgrnhdrkhhovghnihhgsegrmhgurdgtohhm
 pdhrtghpthhtohepphhsthgrnhhnvghrsehrvgguhhgrthdrtghomhdprhgtphhtthhope
 hphhhilhhiphhprdhrvghishhnvghrsehlihhnsghithdrtghomhdprhgtphhtthhopegu
 rhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpth
 htoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghp
 thhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegurghkrheskhgvrh
 hnvghlrdhorhhgpdhrtghpthhtohepphhhrghsthgrsehkvghrnhgvlhdrohhrghdprhgt
 phhtthhopegurhhiqdguvghvvghlqdgsohhunhgtvghssehlihhsthhsrdhfrhgvvgguvg
 hskhhtohhprdhorhhg
X-ME-Proxy: <xmx:kd02aCbHDovltV7e8CeWPTDp10c_sUVqTMDo5CZA3wOWBXO2N3CvVw>
 <xmx:kd02aIazgkMI5tbH94SaxYZZCQGrJ12qQMlp5Xhqp5qRKzSSMPwH6A>
 <xmx:kd02aGBwX2BSW9y9_6L7uNlnTqVUiBZNr9lRV43zwXqxfHVMH_nZTw>
 <xmx:kd02aGaqthJvM8zTYC9pDY0YaFFS6JU7MNeT846DHtAEPeUcQbCX2w>
 <xmx:kd02aFpzcSyj383NUf9vY1RmDB9-i6kpYncJnGSRiKAVBv9ZxufzHUAh>
Feedback-ID: i9ec6488d:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 May 2025 05:55:29 -0400 (EDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 May 2025 02:55:27 -0700
Message-Id: <DA7PC2LNU79K.28KBFOL3MGI1S@kode54.net>
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 "Simona Vetter" <simona@ffwll.ch>, "Danilo Krummrich" <dakr@kernel.org>,
 "Philipp Stanner" <phasta@kernel.org>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH] drm/sched: Fix amdgpu crash upon suspend/resume
From: "Christopher Snowhill" <chris@kode54.net>
To: =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Philipp
 Stanner" <pstanner@redhat.com>, "Philipp Reisner"
 <philipp.reisner@linbit.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250107140240.325899-1-philipp.reisner@linbit.com>
 <942c02f2-6496-4406-a73b-941d096aadfb@amd.com>
 <CADGDV=U_7CdkdEiLX9kj9yHsXhwb5zP_eGXpwmrj20cmgzMAtA@mail.gmail.com>
 <eb5f3198-7625-40f4-bc23-cac969664e85@amd.com>
 <582e10673bb749f18ebf8a18f46ca573df396576.camel@redhat.com>
 <b055ff59-4653-44d9-a2e0-bb43eb158315@amd.com>
In-Reply-To: <b055ff59-4653-44d9-a2e0-bb43eb158315@amd.com>
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

On Mon Jan 13, 2025 at 1:55 AM PST, Christian K=C3=B6nig wrote:
> Am 13.01.25 um 09:43 schrieb Philipp Stanner:
>> [SNIP]
>>>> The handling of NULL values is half-baked.
>>>>
>>>> In my opinion, you should define if drm_sched_pick_best() may put a
>>>> NULL into
>>>> rq. If your answer is yes, it might put a NULL there; then, there
>>>> should be a
>>>> BUG_ON(!entity->rq) after the invocation of
>>>> drm_sched_entity_select_rq().
>>>> If your answer is no, the BUG_ON() should be in
>>>> drm_sched_pick_best().
>>> Yeah good point.
>>>
>>> We might not want a BUG_ON(), that is only justified when we prevent
>>> further damage (e.g. random data corruption or similar).
>>>
>>> I suggest using a WARN(!shed, "Submission without activated
>>> sheduler!").
>>> This way the system has at least a chance of survival should the
>>> scheduler become ready later on.
>>>
>>> On the other hand the BUG_ON() or the NULL pointer deref should only
>>> kill the application thread which is submitting something before the
>>> driver is resumed. So that might help to pinpoint where the actually
>>> issue is.
>> As I see it the BUG_ON() would just be a more pretty NULL pointer
>> deref. If we agree that this is effectively a misuse of the scheduler
>> API we probably want to add it to make it more pretty, though?
>
> The only alternative I can see is that the scheduler API gracefully=20
> handles submits to non-ready schedulers. E.g. that=20
> drm_sched_entity_push_job() detects this condition and instead of=20
> pushing the job sets and error code and signals the fences.
>
> But that might not be a good idea.
>
> It just moves the crash from one place to another and in general I fully=
=20
> agree the driver is misusing the scheduler API to do something which=20
> won't work and potentially crash the whole system.
>
>> @Philipp:
>> BTW, I only just discovered this thread by coincidence. Please use
>> get_maintainer. The scheduler currently has 4 maintainers, and none of
>> them is on CC.
>
> Oh good, point I was already wondering why nobody else commented and=20
> didn't realized that nobody was on CC.
>
> Thanks,
> Christian.

I'm only seeing this mail exchange months after the fact because I was
linked to it by someone on IRC, and I am making a wild guess here.

Could this sleep wake issue also be caused by a similar thing to the
panics and SMU hangs I was experiencing with my own issue? It's an issue
known to have the same workaround for both 6000 and 7000 series users. A
specific kernel commit seems to affect it as well.

If you could test whether you can still reproduce the error after
disabling GFXOFF states with the following kernel commandline override:

amdgpu.ppfeaturemask=3D0xfff73fff

And report back. Unless it's already something long solved? Since this
particular thread died back in January, I guess nothing has happened
since?

>
>>
>> Danke,
>> P.
>>
>>> Regards,
>>> Christian.
>>>
>>>> That helps guys with zero domain knowledge, like me, to figure out
>>>> how
>>>> this is all
>>>> supposed to work.
>>>>
>>>> best regards,
>>>>  =C2=A0 Philipp

