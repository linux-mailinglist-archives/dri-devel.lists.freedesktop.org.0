Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EF6811864
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 16:53:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3CB510E7D7;
	Wed, 13 Dec 2023 15:53:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 424 seconds by postgrey-1.36 at gabe;
 Wed, 13 Dec 2023 15:53:40 UTC
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org
 [IPv6:2001:67c:2050:0:465::102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63A5A10E7D7
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 15:53:40 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4Sr0G01yDgz9t44;
 Wed, 13 Dec 2023 16:46:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1702482392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kpqoi2tKOq03232WE5nbvDcqGwPxuRQB0e2P/aergys=;
 b=fYeCD+FXO2nMRGmsDoNHGB0Xhmd+Aow4GQu7g6QsDfB+gYn14iT9bdhQvWRJW/Q1cyDZTe
 2eim+xqldq+TyxyUKdSv4i8OoRVJDwTi/CsWDmNN5Q4ho+qResMDiiQSQLaV68WXrAAzdr
 mQJLK+ZeIXw0izWuWGUKlnzeClYZICIVN+JaG2GwRECKKGWJTtg9XjB6mcAwm2VuZxLKqb
 xVjzoI7mdBWfuPsMZR9ycSlNppqbUc0hIwouOTYa29vklvVRUesa9YJ5fZorH+Y4nGjx48
 ixMPsU+xN8VHw8+lB1MOZbQfK5G4NlstsuaGrdRpe1H0HC7DCT97h+DeBHMRzQ==
Message-ID: <1aeaa28b-1929-4c35-9225-fade0a25987f@mailbox.org>
Date: Wed, 13 Dec 2023 16:46:25 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] drm/amdgpu: Enable clear page functionality
Content-Language: de-CH-frami, en-CA
To: Felix Kuehling <felix.kuehling@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Alex Deucher <alexdeucher@gmail.com>
References: <20231207151142.929349-1-Arunpravin.PaneerSelvam@amd.com>
 <20231207151142.929349-2-Arunpravin.PaneerSelvam@amd.com>
 <d30b7992-5c39-49f5-889c-c31d4994a5c3@amd.com>
 <CADnq5_PdWUDVK0mvMgyTyogMnT-DD2nhXHarO+BLg9BjtGPRGA@mail.gmail.com>
 <473652dd-8ca1-436b-aa52-eb85eb0e98df@gmail.com>
 <381345a6-64bc-4cda-b787-fc431827b289@amd.com>
 <86b95faa-fda4-4354-97bd-a1c15fed0771@amd.com>
 <8316182c-1b28-49cf-97ef-23c683c1140b@amd.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <8316182c-1b28-49cf-97ef-23c683c1140b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: gbx1w316uoiubu4isn4nzuse4a7jg4a3
X-MBO-RS-ID: 91eba4293c3e2a01ceb
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
Cc: alexander.deucher@amd.com, dri-devel@lists.freedesktop.org,
 matthew.auld@intel.com, amd-gfx@lists.freedesktop.org,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-12-13 16:39, Felix Kuehling wrote:
> On 2023-12-13 9:20, Christian König wrote:
>> Am 12.12.23 um 00:32 schrieb Felix Kuehling:
>>> On 2023-12-11 04:50, Christian König wrote:
>>>> Am 08.12.23 um 20:53 schrieb Alex Deucher:
>>>>> [SNIP]
>>>>>> You also need a functionality which resets all cleared blocks to
>>>>>> uncleared after suspend/resume.
>>>>>>
>>>>>> No idea how to do this, maybe Alex knows of hand.
>>>>> Since the buffers are cleared on creation, is there actually anything to do?
>>>>
>>>> Well exactly that's the problem, the buffers are no longer always cleared on creation with this patch.
>>>>
>>>> Instead we clear on free, track which areas are cleared and clear only the ones which aren't cleared yet on creation.
>>>
>>> The code I added for clearing-on-free a long time ago, does not clear to 0, but to a non-0 poison value. That was meant to make it easier to catch applications incorrectly relying on 0-initialized memory. Is that being changed? I didn't see it in this patch series.
>>
>> Yeah, Arun stumbled over that as well. Any objections that we fill with zeros instead or is that poison value something necessary for debugging?
> 
> I don't think it's strictly necessary. But it may encourage sloppy user mode programming to rely on 0-initialized memory that ends up breaking in corner cases or on older kernels.

From a security PoV, the kernel should never return uncleared memory to (at least unprivileged) user space. This series seems like a big step in that direction.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

