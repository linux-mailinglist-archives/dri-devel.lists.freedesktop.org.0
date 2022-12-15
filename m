Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD2964DFEE
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 18:47:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C14A10E100;
	Thu, 15 Dec 2022 17:46:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF3A10E100;
 Thu, 15 Dec 2022 17:46:54 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4NY05k6tHhz9sbh;
 Thu, 15 Dec 2022 18:46:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1671126378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XisuEVwsJ6BWvLYgllWTOkqqqsKjKhpDdjsbMFp4vsM=;
 b=Yhjz1hcWlVSPNdLuFnsSPFa0uDYzEdJNqIutbYOIVXRjfu4xEaIK6ZeZquBeQUnEMQ+Gja
 HHuKtYNP3UBehXHXt9IfdMrHyff/lvHXnxTW61QA0nOCl1N2ODB5rja9YoDUQZsuB9bdL+
 CsgItexZajWN6OUroTlDUbxiJDsvmj/WqQ47xitU5QR47LL/+yL7D0eS5CEAWeCrt6LswD
 Re1X3A5BIxXL7zwZ5yNTUm9Yj7GZzlgAu4d87Vcr1Znrue80ZdAy9pRwSv7JEVKAbAK6QI
 TerOutKzHR28sgozcfdxdF63DIaxNCr/Tb2YuKerTVEJbeiFbhVp172sGKhZRw==
Message-ID: <bc614c57-3b58-db46-81a6-a0b1850f846e@mailbox.org>
Date: Thu, 15 Dec 2022 18:46:13 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 16/16] drm/amd/display: Don't restrict bpc to 8 bpc
Content-Language: en-CA
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
To: Alex Deucher <alexdeucher@gmail.com>, Pekka Paalanen <ppaalanen@gmail.com>
References: <20221212182137.374625-1-harry.wentland@amd.com>
 <20221212182137.374625-17-harry.wentland@amd.com>
 <114c2e02-41c8-8576-f88d-1c50f41deb9e@mailbox.org>
 <20221214110128.1cd58dea@eldfell>
 <CADnq5_M8Z2QRze60AFtmF6jTw8zpTpM-MPPmgejoUCb7Rv1ZrA@mail.gmail.com>
 <20221215111729.50ee7808@eldfell>
 <CADnq5_N+7PuWNVLaY4DLx0A3R_qSLEfJnmSFm9NbXjndKtK-ZA@mail.gmail.com>
 <66d4febb-9152-7273-8d77-155115541de8@mailbox.org>
In-Reply-To: <66d4febb-9152-7273-8d77-155115541de8@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 377f5ed2931c4f353e1
X-MBO-RS-META: ty6aha64bpm443m4b8gy7zy58b84x3dk
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, amd-gfx@lists.freedesktop.org,
 Uma Shankar <uma.shankar@intel.com>, dri-devel@lists.freedesktop.org,
 Joshua Ashton <joshua@froggi.es>, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/15/22 18:42, Michel Dänzer wrote:
> On 12/15/22 18:33, Alex Deucher wrote:
>> On Thu, Dec 15, 2022 at 4:17 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>>>
>>> On Wed, 14 Dec 2022 10:46:55 -0500
>>> Alex Deucher <alexdeucher@gmail.com> wrote:
>>>
>>>> On Wed, Dec 14, 2022 at 4:01 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>>>>>
>>>>> On Tue, 13 Dec 2022 18:20:59 +0100
>>>>> Michel Dänzer <michel.daenzer@mailbox.org> wrote:
>>>>>
>>>>>> On 12/12/22 19:21, Harry Wentland wrote:
>>>>>>> This will let us pass kms_hdr.bpc_switch.
>>>>>>>
>>>>>>> I don't see any good reasons why we still need to
>>>>>>> limit bpc to 8 bpc and doing so is problematic when
>>>>>>> we enable HDR.
>>>>>>>
>>>>>>> If I remember correctly there might have been some
>>>>>>> displays out there where the advertised link bandwidth
>>>>>>> was not large enough to drive the default timing at
>>>>>>> max bpc. This would leave to an atomic commit/check
>>>>>>> failure which should really be handled in compositors
>>>>>>> with some sort of fallback mechanism.
>>>>>>>
>>>>>>> If this somehow turns out to still be an issue I
>>>>>>> suggest we add a module parameter to allow users to
>>>>>>> limit the max_bpc to a desired value.
>>>>>>
>>>>>> While leaving the fallback for user space to handle makes some sense
>>>>>> in theory, in practice most KMS display servers likely won't handle
>>>>>> it.
>>>>>>
>>>>>> Another issue is that if mode validation is based on the maximum bpc
>>>>>> value, it may reject modes which would work with lower bpc.
>>>>>>
>>>>>>
>>>>>> What Ville (CC'd) suggested before instead (and what i915 seems to be
>>>>>> doing already) is that the driver should do mode validation based on
>>>>>> the *minimum* bpc, and automatically make the effective bpc lower
>>>>>> than the maximum as needed to make the rest of the atomic state work.
>>>>>
>>>>> A driver is always allowed to choose a bpc lower than max_bpc, so it
>>>>> very well should do so when necessary due to *known* hardware etc.
>>>>> limitations.
>>>>>
>>>>
>>>> In the amdgpu case, it's more of a preference thing.  The driver would
>>>> enable higher bpcs at the expense of refresh rate and it seemed most
>>>> users want higher refresh rates than higher bpc.
>>>
>>> Hi Alex,
>>>
>>> we already have userspace in explicit control of the refresh rate.
>>> Userspace picks the refresh rate first, then the driver silently checks
>>> what bpc is possible. Userspace preference wins, so bpc is chosen to
>>> produce the desired refresh rate.
>>>
>>> In what cases does the driver really pick a refresh rate on its own?
>>
>> It didn't, but IIRC, at the time the driver filtered out modes that it
>> could not support with the max bpc.  It looks like that has been fixed
>> now, so maybe this whole discussion is moot.
> 
> That depends on the answer to the follow-up question in my previous post.

Never mind, looks like cbd14ae7ea93 ("drm/amd/display: Fix incorrectly pruned modes with deep color") does lower bpc as needed both for mode validation and atomic commit (check).


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

