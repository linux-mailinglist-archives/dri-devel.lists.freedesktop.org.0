Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 023FB500FC4
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 15:50:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07E8010FD4F;
	Thu, 14 Apr 2022 13:50:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 773D710FD68;
 Thu, 14 Apr 2022 13:50:05 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4KfLSC3JlRz9sW3;
 Thu, 14 Apr 2022 15:50:03 +0200 (CEST)
Message-ID: <fe499d20-2667-5953-831a-d7668c5a3d18@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1649944201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pMIClLVsgOaeWBRpm5tykfobZ2NGSxMdByRNbv1SXJY=;
 b=kKgQV9sM69qcRMgVBPnQd6nY8IoWKHRIUHqsuQkaceO/c1+ebp7pVGWa0baZJO5gM9thik
 zn4S2Gf51OSlYfFC/xuuVTzKw9otH7Ee1CUpv9Dpmrn1E4pbR2xGaY7r67SUhAclz6j4Ms
 GynbOj0pJiYpDi4ju2ZW9c2kvDXRxat9dO0JlDiXO4Tj1SpaUKO3N0m59N9H1gb7Xuy2Eu
 YfYsNEC4lIJWUIc3UKysW28EVlz+OjvRML8gjZj89bbx26mJD5rG/SGx6ZO8q0Jw+VtK59
 X6qY4N8rsdXPoFyAFcB9oOiAU/gD1kI9GjgPPpYnlkGLy5H9I3dGesVeQJ0eng==
Date: Thu, 14 Apr 2022 15:49:57 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] drm/radeon: Add build directory to include path
Content-Language: en-CA
To: Alex Deucher <alexdeucher@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>
References: <20220413161450.1854370-1-michel@daenzer.net>
 <f425b789-5081-fa70-555f-7553d7cc5bd5@gmail.com>
 <ca5ca8ab-9c48-8d81-2dd6-fbdfface6519@mailbox.org>
 <abd87438-3ff4-6b62-81b4-6162d167348a@gmail.com>
 <CADnq5_Npy02mWVMOs-TMQ9t6OLV8XFaSQFZ5iB=Y2q3OQgiQvw@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <CADnq5_Npy02mWVMOs-TMQ9t6OLV8XFaSQFZ5iB=Y2q3OQgiQvw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-04-14 15:34, Alex Deucher wrote:
> On Thu, Apr 14, 2022 at 4:44 AM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Am 14.04.22 um 09:37 schrieb Michel Dänzer:
>>> On 2022-04-14 08:24, Christian König wrote:
>>>> Am 13.04.22 um 18:14 schrieb Michel Dänzer:
>>>>> From: Michel Dänzer <mdaenzer@redhat.com>
>>>>>
>>>>> Fixes compile errors with out-of-tree builds, e.g.
>>>>>
>>>>> ../drivers/gpu/drm/radeon/r420.c:38:10: fatal error: r420_reg_safe.h: No such file or directory
>>>>>      38 | #include "r420_reg_safe.h"
>>>>>         |          ^~~~~~~~~~~~~~~~~
>>>>
>>>> Well stuff like that usually points to a broken build environment.
>>> Just a separate build directory. Specifically, I'm hitting the errors with
>>>
>>>   make -C build-amd64 M=drivers/gpu/drm
>>>
>>> Generated headers such as r420_reg_safe.h reside in the build directory, so source files in the source directory can't find them without an explicit search path.
>>
>> I'm trying to swap back into my brain how all of this used to work, but
>> that's a really long time ago that I tried this as well.
>>
>>> Are you saying that should get added automagically somehow?
>>
>> Yes, exactly that. I'm like 95% sure that used to work, but I don't know
>> why exactly either.
>>
>>> FWIW, this is pretty common in the kernel according to git grep.
>>
>> Maybe Alex or somebody else with some more background in the kernel
>> Makefiles could jump in and help here.
> 
> I don't remember either.  I vaguely recall the build support for the
> mkregtable stuff being reworked a while ago.  A quick zip through the
> git logs shows a series from Masahiro Yamada from 2020.

Yamada-san, can you help us? :)

See https://patchwork.freedesktop.org/patch/482011/ for my patch.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer
