Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD15D64E9EA
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 12:02:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7114A10E5C2;
	Fri, 16 Dec 2022 11:02:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC2910E105;
 Fri, 16 Dec 2022 11:02:33 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4NYR4l3l5Hz9slD;
 Fri, 16 Dec 2022 12:01:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1671188519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cLKLVnU8lWyYUBUKHXHb82A0UDytP7Ny5dkjlNktQ4c=;
 b=Ym5ClZ4SFebx0ak6Brk+p6dh6I5YYTfR0SV+EfhRUI6IWywykEI4tBbhGxcnABshGCStRe
 t6a8SYg814kBCVccbzRiO6jNlAfc3fSAXFZjYDi2nCvvMiTVNrCPhuEaGUJvWT99yD2QS2
 eI7bStQ+oSzm2IGyqfHJ6i1hUiG8SPWcRRcpTtC4coGz4cfLkmbniNqLtid7tUskvspzfp
 4JBkF8Ljx+wWIOdj5Eq2/0Cc6/Fi8aFktZhLchxJSUu3xMCu6C6AvZyERlqmWR7T5+8j4o
 BUHAOgPCE9ZpGSrFoJuOVLjs2iQVIMLwrTwQOcP5LVml00KIlqoLl9ChlIJDKg==
Message-ID: <e4417835-13d4-e7b0-b400-b0e488e3b3f9@mailbox.org>
Date: Fri, 16 Dec 2022 12:01:57 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 16/16] drm/amd/display: Don't restrict bpc to 8 bpc
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
To: Alex Deucher <alexdeucher@gmail.com>, Pekka Paalanen <ppaalanen@gmail.com>
References: <20221212182137.374625-1-harry.wentland@amd.com>
 <20221212182137.374625-17-harry.wentland@amd.com>
 <114c2e02-41c8-8576-f88d-1c50f41deb9e@mailbox.org>
 <20221214110128.1cd58dea@eldfell>
 <CADnq5_M8Z2QRze60AFtmF6jTw8zpTpM-MPPmgejoUCb7Rv1ZrA@mail.gmail.com>
 <57d2c440-a622-bcff-c3b5-e22404ef7eb6@mailbox.org>
Content-Language: en-CA
In-Reply-To: <57d2c440-a622-bcff-c3b5-e22404ef7eb6@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: qmgrcj7q1uadkjsizjb81m1nw7s347um
X-MBO-RS-ID: e15b9ddb666f255e4b1
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

On 12/15/22 10:07, Michel Dänzer wrote:
> On 12/14/22 16:46, Alex Deucher wrote:
>> On Wed, Dec 14, 2022 at 4:01 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>>> On Tue, 13 Dec 2022 18:20:59 +0100
>>> Michel Dänzer <michel.daenzer@mailbox.org> wrote:
>>>> On 12/12/22 19:21, Harry Wentland wrote:
>>>>> This will let us pass kms_hdr.bpc_switch.
>>>>>
>>>>> I don't see any good reasons why we still need to
>>>>> limit bpc to 8 bpc and doing so is problematic when
>>>>> we enable HDR.
>>>>>
>>>>> If I remember correctly there might have been some
>>>>> displays out there where the advertised link bandwidth
>>>>> was not large enough to drive the default timing at
>>>>> max bpc. This would leave to an atomic commit/check
>>>>> failure which should really be handled in compositors
>>>>> with some sort of fallback mechanism.
>>>>>
>>>>> If this somehow turns out to still be an issue I
>>>>> suggest we add a module parameter to allow users to
>>>>> limit the max_bpc to a desired value.
>>>>
>>>> While leaving the fallback for user space to handle makes some sense
>>>> in theory, in practice most KMS display servers likely won't handle
>>>> it.
>>>>
>>>> Another issue is that if mode validation is based on the maximum bpc
>>>> value, it may reject modes which would work with lower bpc.
>>>>
>>>>
>>>> What Ville (CC'd) suggested before instead (and what i915 seems to be
>>>> doing already) is that the driver should do mode validation based on
>>>> the *minimum* bpc, and automatically make the effective bpc lower
>>>> than the maximum as needed to make the rest of the atomic state work.
>>>
>>> A driver is always allowed to choose a bpc lower than max_bpc, so it
>>> very well should do so when necessary due to *known* hardware etc.
>>> limitations.
>>>
>>
>> In the amdgpu case, it's more of a preference thing.  The driver would
>> enable higher bpcs at the expense of refresh rate and it seemed most
>> users want higher refresh rates than higher bpc. 
> 
> I wrote the above because I thought that this patch might result in some modes getting pruned because they can't work with the max bpc. However, I see now that cbd14ae7ea93 ("drm/amd/display: Fix incorrectly pruned modes with deep color") should prevent that AFAICT.
> 
> The question then is: What happens if user space tries to use a mode which doesn't work with the max bpc? Does the driver automatically lower the effective bpc as needed, or does the atomic commit (check) fail? The latter would seem bad.

Per my previous post in the other sub-thread, cbd14ae7ea93 ("drm/amd/display: Fix incorrectly pruned modes with deep color") seems to do the former. The commit log of this patch should probably be changed to reflect that.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

