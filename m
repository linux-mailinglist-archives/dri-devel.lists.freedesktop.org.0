Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F22CEF4C9
	for <lists+dri-devel@lfdr.de>; Fri, 02 Jan 2026 21:20:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D40D010E176;
	Fri,  2 Jan 2026 20:20:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="S0fo4may";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62B8010E176
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jan 2026 20:20:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 27F7F40A60;
 Fri,  2 Jan 2026 20:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 996FFC116B1;
 Fri,  2 Jan 2026 20:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767385227;
 bh=MUL09cOxSVl/qeUP0zj37m0BM8JbMPNNCbWrLotbv+U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=S0fo4may37J1JZvm+79HvV/EtR6SHs5ioQkF6QKESttFlFEQbWOCk2yfGyV/0kr82
 SInZTXgvaIj8iK3lwevnqLeDMJSBPkjeY0bF+8czPsy2uhpCEz9y4LLyLNUBmQhwYP
 sPywcwEph08pa3TJ2nckbZjE/SKG2FCRcXnuVOPGsAbyy8AvfnxZ5ArwsEk7CZDUGX
 yV3/ITYG/nqnJMGKkuJks1L8guXdCxA9kcc89BVVK++J5kmJMxCF74DEdoq3OqK6Sk
 26+uMraByIY18dnd2SYtMtEV/SbdejqY8e0TD+sdnPfzSsHQs8B+lXM1/FYTFlzfJ8
 m5ueNpbodrgMw==
Message-ID: <be0b5b6f-1a45-436f-a24d-5f661113d9c8@kernel.org>
Date: Fri, 2 Jan 2026 21:20:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] video/logo: remove orphan .pgm Makefile rule
To: Helge Deller <deller@gmx.de>, David Heidelberg <david@ixit.cz>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-sh@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <20251230-custom-logo-v1-0-4736374569ee@kernel.org>
 <20251230-custom-logo-v1-1-4736374569ee@kernel.org>
 <e04c9862-761f-4f36-b978-b760d2a0a928@ixit.cz>
 <d1c1d037-7be8-49a3-81d7-59d33efba81b@kernel.org>
 <ec760546-b320-4b14-a792-916ec552a3ea@ixit.cz>
 <d20c6baa-bd1f-4de7-afa7-0abb99e3bcb5@kernel.org>
 <90526885-9597-40eb-903b-7f741f87a7fc@gmx.de>
Content-Language: en-US
From: Vincent Mailhol <mailhol@kernel.org>
Autocrypt: addr=mailhol@kernel.org; keydata=
 xjMEZluomRYJKwYBBAHaRw8BAQdAf+/PnQvy9LCWNSJLbhc+AOUsR2cNVonvxhDk/KcW7FvN
 JFZpbmNlbnQgTWFpbGhvbCA8bWFpbGhvbEBrZXJuZWwub3JnPsKZBBMWCgBBFiEE7Y9wBXTm
 fyDldOjiq1/riG27mcIFAmdfB/kCGwMFCQp/CJcFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcC
 F4AACgkQq1/riG27mcKBHgEAygbvORJOfMHGlq5lQhZkDnaUXbpZhxirxkAHwTypHr4A/joI
 2wLjgTCm5I2Z3zB8hqJu+OeFPXZFWGTuk0e2wT4JzjgEZx4y8xIKKwYBBAGXVQEFAQEHQJrb
 YZzu0JG5w8gxE6EtQe6LmxKMqP6EyR33sA+BR9pLAwEIB8J+BBgWCgAmFiEE7Y9wBXTmfyDl
 dOjiq1/riG27mcIFAmceMvMCGwwFCQPCZwAACgkQq1/riG27mcJU7QEA+LmpFhfQ1aij/L8V
 zsZwr/S44HCzcz5+jkxnVVQ5LZ4BANOCpYEY+CYrld5XZvM8h2EntNnzxHHuhjfDOQ3MAkEK
In-Reply-To: <90526885-9597-40eb-903b-7f741f87a7fc@gmx.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/01/2026 at 20:59, Helge Deller wrote:
> On 1/2/26 18:25, Vincent Mailhol wrote:
>> On 02/01/2026 at 18:18, David Heidelberg wrote:
>>> On 02/01/2026 18:13, Vincent Mailhol wrote:
>>>> On 02/01/2026 at 17:34, David Heidelberg wrote:
>>>>> On 30/12/2025 23:20, Vincent Mailhol wrote:
>>>>>> The kernel has no actual grey-scale logos. And looking at the git
>>>>>> history, it seems that there never was one (or maybe there was in the
>>>>>> pre-git history? I did not check that far…)
>>>>>>
>>>>>> Remove the Makefile rule for the .pgm grey scale images.
>>>>>
>>>>> Great to see this series.
>>>>
>>>> Thanks!
>>>>
>>>>> I think the Fixes: tag should still go here, even if it is not very
>>>>> specific.
>>>>
>>>> But then, what do I put in the fixes tag? This:
>>>>
>>>>     Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
>>>>
>>>> ?
>>>
>>> Yes
>>>
>>>>
>>>> I am not sure it is worth bothering the stable team for something that
>>>> isn't causing any real harm.
>>>
>>> That was my original thinking as well, but the Fixes tag is not only
>>> about stable backports. It is also used for tracking, tooling, and
>>> documentation, so stable picking up such patches is just one of its
>>> purposes.
>>
>> OK. Then why not. I added the tag in my local tree, but I will wait a
>> couple days for the other review comments before sending. I will not
>> spam everyone with a v3 just for that.
> 
> I like your patch!
> So, I've added the v2 series to the fbdev git tree.

Thanks!

> I don't think a "Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")" tag is
> appropriate, since it doesn't fixes anything.

Ack.

> Let's see if issues arise due to the wider testing...

Yes. It is always hard for this kind of changes to take care of all the
intricacies (like the one for the Playstation 3 extra logo…)

Well, I spend a fair amount of effort, grepping the different logos
throughout the source code and didn't find any other corner cases.

Fingers crossed!


Yours sincerely,
Vincent Mailhol

