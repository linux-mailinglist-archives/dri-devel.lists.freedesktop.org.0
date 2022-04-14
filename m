Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B18DB50194E
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 18:57:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB46A10E01F;
	Thu, 14 Apr 2022 16:57:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F1EB10E0A6
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 16:57:27 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:1:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4KfQcN2btFz9sTs;
 Thu, 14 Apr 2022 18:57:24 +0200 (CEST)
Message-ID: <8beac4f5-f7e8-31ab-bbf3-36a917979bfc@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1649955442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eG4fr6KaK9wJjPn6IgnoPpbLB0fNk3TGRun99bZICFc=;
 b=Hwt9vgEZt55t2XFeqBxImuEt9n1U79cHMORvnvODTbMD/sdVxEhFJi6xgZgJA/QdDGQzZN
 sYkV+EMmGVnIGzG2rfj1QcdXfvd1QiA3N4F+lKhyFjlkJDFAnwlUKIG+yHk8Jyp4Rs9es6
 kr/eSS/ZgtfhwIeSw3Q0PJY64GvQn2b55wFe7VEvZVn0Uw/JGjOE464P4nH+WTFbKCdyx5
 XNnHs4g+MNQkAmgpSeFvVwNXbGM5C87RpTGq9MPCSa+mfRdKTKGc7I24ytoco6YDQ4iZaX
 k74eug7yZlPZefWYX78rc596yGyOLU7Rope49XoB+qIxmlcEMA4QL8y8WBcv0g==
Date: Thu, 14 Apr 2022 18:57:18 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] drm/radeon: Add build directory to include path
Content-Language: en-CA
To: Masahiro Yamada <masahiroy@kernel.org>
References: <20220413161450.1854370-1-michel@daenzer.net>
 <f425b789-5081-fa70-555f-7553d7cc5bd5@gmail.com>
 <ca5ca8ab-9c48-8d81-2dd6-fbdfface6519@mailbox.org>
 <abd87438-3ff4-6b62-81b4-6162d167348a@gmail.com>
 <CADnq5_Npy02mWVMOs-TMQ9t6OLV8XFaSQFZ5iB=Y2q3OQgiQvw@mail.gmail.com>
 <fe499d20-2667-5953-831a-d7668c5a3d18@mailbox.org>
 <CAK7LNATdTaY6+FD4TuFgmb00=Qbx=7mmCi9onHv0zi=pdZysBQ@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <CAK7LNATdTaY6+FD4TuFgmb00=Qbx=7mmCi9onHv0zi=pdZysBQ@mail.gmail.com>
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-04-14 17:04, Masahiro Yamada wrote:
> On Thu, Apr 14, 2022 at 10:50 PM Michel Dänzer
> <michel.daenzer@mailbox.org> wrote:
>> On 2022-04-14 15:34, Alex Deucher wrote:
>>> On Thu, Apr 14, 2022 at 4:44 AM Christian König
>>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>>> Am 14.04.22 um 09:37 schrieb Michel Dänzer:
>>>>> On 2022-04-14 08:24, Christian König wrote:
>>>>>> Am 13.04.22 um 18:14 schrieb Michel Dänzer:
>>>>>>> From: Michel Dänzer <mdaenzer@redhat.com>
>>>>>>>
>>>>>>> Fixes compile errors with out-of-tree builds, e.g.
>>>>>>>
>>>>>>> ../drivers/gpu/drm/radeon/r420.c:38:10: fatal error: r420_reg_safe.h: No such file or directory
>>>>>>>      38 | #include "r420_reg_safe.h"
>>>>>>>         |          ^~~~~~~~~~~~~~~~~
>>>>>>
>>>>>> Well stuff like that usually points to a broken build environment.
>>>>> Just a separate build directory. Specifically, I'm hitting the errors with
>>>>>
>>>>>   make -C build-amd64 M=drivers/gpu/drm
> 
> 
> Maybe
> 
>         make  O=build-arm64   drivers/gpu/drm/
> 
> is the way you were searching for.
> 
> It builds only drivers/gpu/drm/
> in the separate directory.

Indeed, that works.


>>>>> Generated headers such as r420_reg_safe.h reside in the build directory, so source files in the source directory can't find them without an explicit search path.
>>>>
>>>> I'm trying to swap back into my brain how all of this used to work, but
>>>> that's a really long time ago that I tried this as well.
>>>>
>>>>> Are you saying that should get added automagically somehow?
> 
> 
> For the kernel tree, yes, it is done automatically.
> 
> See the code in scripts/Makefile.lib:
> 
> # $(srctree)/$(src) for including checkin headers from generated source files
> # $(objtree)/$(obj) for including generated headers from checkin source files
> ifeq ($(KBUILD_EXTMOD),)
> ifdef building_out_of_srctree
> _c_flags   += -I $(srctree)/$(src) -I $(objtree)/$(obj)
> _a_flags   += -I $(srctree)/$(src) -I $(objtree)/$(obj)
> _cpp_flags += -I $(srctree)/$(src) -I $(objtree)/$(obj)
> endif
> endif
> 
> 
> 
> 
> But, you used M=drivers/gpu/drm.
> So, it did not work.
> 
> 
> 
> M= is intended for building external modules.
> 
> I do not recommend it for in-tree drivers.

So I've been doing it wrong for all these years... Happened to always work for in-tree builds.

Thank you so much for your help, Yamada-san!

I am retracting this patch.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer
