Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D35BCB02C81
	for <lists+dri-devel@lfdr.de>; Sat, 12 Jul 2025 21:02:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCFAB10E06B;
	Sat, 12 Jul 2025 19:02:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HWjizx5l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2573D10E06B;
 Sat, 12 Jul 2025 19:02:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6998AA53424;
 Sat, 12 Jul 2025 19:02:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 045A7C4CEEF;
 Sat, 12 Jul 2025 19:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752346960;
 bh=LhsEIKj1SLsQCAk5TPT4MTfImsiSbwHmFcHOMwWmXc8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HWjizx5l0FEQT25bpugRRwK1iwSRYSUMnnEfumnnbKkrN1YDIHJFkE8VgedfrpLRH
 dogoPSSvR5+vV2TXvrLEB3e+GRLCNQ5J+JnwTSnwYJBqhbSEYRUyhsWp25MUqYlCbp
 QhS8oFlveZ5w9be6sF23N78x/sru3d5CnLo+5eZ3UF3HV6Eoy55hqAJ6v3lM9Qm1fs
 ZULGTqqGmC3OckTk9IhfXYJ1NS25fOe0nTLMoH6ae2dEwnnL7Hx2m6cHXw9hryCOCa
 r3C/mHyyAsrsfVhfUEaiXn/KIkEm3dVV0XDmhEo1XjZmYqCcRqVFr5uAQzdE1yshMW
 H8COPV+f4FwFg==
Message-ID: <35f0dd7e-f4c1-4042-bc85-19d277f4b1f9@kernel.org>
Date: Sat, 12 Jul 2025 14:02:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Jul 11 [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Mario Limonciello <mario.limonciello@amd.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Samuel Zhang <guoqing.zhang@amd.com>, amd-gfx@lists.freedesktop.org
References: <20250711191014.12a64210@canb.auug.org.au>
 <49080a96-2c7a-4eea-a64c-deac0b7a665b@infradead.org>
 <CAJZ5v0h1CX+aTu7dFy6vB-9LM6t5J4rt7Su3qVnq1xx-BFAm=Q@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <CAJZ5v0h1CX+aTu7dFy6vB-9LM6t5J4rt7Su3qVnq1xx-BFAm=Q@mail.gmail.com>
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



On 7/12/25 3:11 AM, Rafael J. Wysocki wrote:
> On Fri, Jul 11, 2025 at 11:25 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>>
>>
>> On 7/11/25 2:10 AM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20250710:
>>>
>>
>> on x86_64, when
>> # CONFIG_SUSPEND is not set
>> # CONFIG_HIBERNATION is not set
>> # CONFIG_PM is not set
>>
>> ERROR: modpost: "pm_hibernate_is_recovering" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
>>
>> caused by commit
>> 530694f54dd5e ("drm/amdgpu: do not resume device in thaw for normal hibernation")
>>
>> Rafael, is a stub appropriate for this case?
> 
> pm_hibernate_is_recovering() is not supposed to be called by code that
> does not depend on CONFIG_HIBERNATE_CALLBACKS, but a stub returning
> false would work for this.

Thanks, I just sent out a fix for this.

> 
> Mario, it would be good to fix this up in your tree.  Also, it would
> be good to expose stuff to 0-day build testing before letting it go
> into linux-next.  I use the bleeding-edge branch for this purpose.
> 
Honestly; I'm surprised that 0-day didn't raise this on either dri-devel 
or amd-gfx.  I had expected at least one of those lists to raise this 
over the last week of patches.

Anyone know the history why neither has 0-day?

