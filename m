Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C9ECEF0EE
	for <lists+dri-devel@lfdr.de>; Fri, 02 Jan 2026 18:25:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B8410E0F3;
	Fri,  2 Jan 2026 17:25:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GDxUeQQP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A273610E0F3
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jan 2026 17:25:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D4D2860017;
 Fri,  2 Jan 2026 17:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD9C3C19421;
 Fri,  2 Jan 2026 17:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767374725;
 bh=kvvC6Qfv6P9WmeJ9eiyxpvWUaffcud2t3Ti1L74sy7E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GDxUeQQPPTy8OXTI4yr/g+F2Iy+RpCmOn2j2WHPOkeu5+ZBJ8ZB+JNBfN+AU9u/WY
 ENmSusyy7LlsNG6RsviOfy2yT4Ma/cPPqmrF5CgtB+JeMwpqBykRtPhyxhwqAuO5lw
 /aSWN6SKJFcLePujiZ8nNoKGIIX3GEeKBaxe6cEXMHr77doc4CHTWwOjmglQEjbJ1W
 vE4CeKN5j5BBtGcxL78lzMr6X4OgbZPINIJZHFOV+Q51HPgynaHDNGeEUm594JgVBW
 JBWHOda9tUOz8R7htU0U8th3B6twL5mbQsqK/Bcih+sHplV1K7Mhe1nubY3KUgY87a
 wHj6nZ/hpfQDA==
Message-ID: <d20c6baa-bd1f-4de7-afa7-0abb99e3bcb5@kernel.org>
Date: Fri, 2 Jan 2026 18:25:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] video/logo: remove orphan .pgm Makefile rule
To: David Heidelberg <david@ixit.cz>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-sh@vger.kernel.org,
 Helge Deller <deller@gmx.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <20251230-custom-logo-v1-0-4736374569ee@kernel.org>
 <20251230-custom-logo-v1-1-4736374569ee@kernel.org>
 <e04c9862-761f-4f36-b978-b760d2a0a928@ixit.cz>
 <d1c1d037-7be8-49a3-81d7-59d33efba81b@kernel.org>
 <ec760546-b320-4b14-a792-916ec552a3ea@ixit.cz>
From: Vincent Mailhol <mailhol@kernel.org>
Content-Language: en-US
Autocrypt: addr=mailhol@kernel.org; keydata=
 xjMEZluomRYJKwYBBAHaRw8BAQdAf+/PnQvy9LCWNSJLbhc+AOUsR2cNVonvxhDk/KcW7FvN
 JFZpbmNlbnQgTWFpbGhvbCA8bWFpbGhvbEBrZXJuZWwub3JnPsKZBBMWCgBBFiEE7Y9wBXTm
 fyDldOjiq1/riG27mcIFAmdfB/kCGwMFCQp/CJcFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcC
 F4AACgkQq1/riG27mcKBHgEAygbvORJOfMHGlq5lQhZkDnaUXbpZhxirxkAHwTypHr4A/joI
 2wLjgTCm5I2Z3zB8hqJu+OeFPXZFWGTuk0e2wT4JzjgEZx4y8xIKKwYBBAGXVQEFAQEHQJrb
 YZzu0JG5w8gxE6EtQe6LmxKMqP6EyR33sA+BR9pLAwEIB8J+BBgWCgAmFiEE7Y9wBXTmfyDl
 dOjiq1/riG27mcIFAmceMvMCGwwFCQPCZwAACgkQq1/riG27mcJU7QEA+LmpFhfQ1aij/L8V
 zsZwr/S44HCzcz5+jkxnVVQ5LZ4BANOCpYEY+CYrld5XZvM8h2EntNnzxHHuhjfDOQ3MAkEK
In-Reply-To: <ec760546-b320-4b14-a792-916ec552a3ea@ixit.cz>
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

On 02/01/2026 at 18:18, David Heidelberg wrote:
> On 02/01/2026 18:13, Vincent Mailhol wrote:
>> On 02/01/2026 at 17:34, David Heidelberg wrote:
>>> On 30/12/2025 23:20, Vincent Mailhol wrote:
>>>> The kernel has no actual grey-scale logos. And looking at the git
>>>> history, it seems that there never was one (or maybe there was in the
>>>> pre-git history? I did not check that far…)
>>>>
>>>> Remove the Makefile rule for the .pgm grey scale images.
>>>
>>> Great to see this series.
>>
>> Thanks!
>>
>>> I think the Fixes: tag should still go here, even if it is not very
>>> specific.
>>
>> But then, what do I put in the fixes tag? This:
>>
>>    Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
>>
>> ?
> 
> Yes
> 
>>
>> I am not sure it is worth bothering the stable team for something that
>> isn't causing any real harm.
> 
> That was my original thinking as well, but the Fixes tag is not only
> about stable backports. It is also used for tracking, tooling, and
> documentation, so stable picking up such patches is just one of its
> purposes.

OK. Then why not. I added the tag in my local tree, but I will wait a
couple days for the other review comments before sending. I will not
spam everyone with a v3 just for that.


Yours sincerely,
Vincent Mailhol

