Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8450CF58ED
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 21:47:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4860410E079;
	Mon,  5 Jan 2026 20:47:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BMHzx6W0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE4810E079
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 20:47:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 78D5960010;
 Mon,  5 Jan 2026 20:47:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B913DC116D0;
 Mon,  5 Jan 2026 20:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767646030;
 bh=0cXxgiKJYEDsCA8YbH5UmnzTobnhAPOmLswUtmtPxRA=;
 h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
 b=BMHzx6W0wYpa3dgpAYuiWxtwk/g6bicVK04ntKuo+FrzNCEcut784a7NVdkREQZ4Q
 n4b9t2XKZwfbQY6ArCYQZMAmEdWhpQGSVD7qkABSAfRymBfqNTZYJpXZpRI7C7lRRR
 oesQ925GuAJP+kPS+GIt2TaKlrtanK8p9EXO57ajadGtvsbqVeMrKEVFhcwYQdIYa7
 VkFFAlpclS3v14r8gKi2wB1f3DcqJU46CQEAqo980IZaN8BYe9OfQtj3CP1niifHIy
 FlIgh+mkVBtY0Cf10+z+7TjcjSnOIynxH6CzYDfTlgR9raoYjiNClOWiXo9nZjKbUj
 kczLXVhiwMwjg==
Message-ID: <54fe30d3-856e-45d4-ba30-b9e770d9afc6@kernel.org>
Date: Mon, 5 Jan 2026 21:47:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] kbuild: remove gcc's -Wtype-limits
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
References: <20260101-remove_wtype-limits-v4-0-225b75c29086@kernel.org>
 <aVutfSk4PWbGac_Q@levanger>
From: Vincent Mailhol <mailhol@kernel.org>
Content-Language: en-US
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kbuild@vger.kernel.org, linux-sparse@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-btrfs@vger.kernel.org,
 linux-hardening@vger.kernel.org, Daniel Plakosh <dplakosh@sei.cmu.edu>
Autocrypt: addr=mailhol@kernel.org; keydata=
 xjMEZluomRYJKwYBBAHaRw8BAQdAf+/PnQvy9LCWNSJLbhc+AOUsR2cNVonvxhDk/KcW7FvN
 JFZpbmNlbnQgTWFpbGhvbCA8bWFpbGhvbEBrZXJuZWwub3JnPsKZBBMWCgBBFiEE7Y9wBXTm
 fyDldOjiq1/riG27mcIFAmdfB/kCGwMFCQp/CJcFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcC
 F4AACgkQq1/riG27mcKBHgEAygbvORJOfMHGlq5lQhZkDnaUXbpZhxirxkAHwTypHr4A/joI
 2wLjgTCm5I2Z3zB8hqJu+OeFPXZFWGTuk0e2wT4JzjgEZx4y8xIKKwYBBAGXVQEFAQEHQJrb
 YZzu0JG5w8gxE6EtQe6LmxKMqP6EyR33sA+BR9pLAwEIB8J+BBgWCgAmFiEE7Y9wBXTmfyDl
 dOjiq1/riG27mcIFAmceMvMCGwwFCQPCZwAACgkQq1/riG27mcJU7QEA+LmpFhfQ1aij/L8V
 zsZwr/S44HCzcz5+jkxnVVQ5LZ4BANOCpYEY+CYrld5XZvM8h2EntNnzxHHuhjfDOQ3MAkEK
In-Reply-To: <aVutfSk4PWbGac_Q@levanger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 05/01/2026 at 13:24, Nicolas Schier wrote:
> On Thu, Jan 01, 2026 at 04:21:38PM +0100, Vincent Mailhol wrote:
>> I often read on the mailing list people saying "who cares about W=2
>> builds anyway?". At least I do. Not that I want to fix all of them,
>> but on some occasions, such as new driver submissions, I have often
>> found a couple valid diagnostics in the W=2 output.
>>
>> That said, the annoying thing is that W=2 is heavily polluted by one
>> warning: -Wtype-limits. Try a gcc W=2 build on any file and see the
>> results for yourself. I suspect this to be the reason why so few
>> people are using W=2.
>>
>> This series removes gcc's -Wtype-limits in an attempt to make W=2 more
>> useful. Those who do not use W=2 can continue to not use it if they
>> want. Those who, like me, use it for time to time will get an improved
>> experience from the reduced spam.
>>
>> Patch #1 deactivates -Wtype-limits. Extra details on statistics, past
>> attempts and alternatives are given in the description.
>>
>> Patch #2 clean-ups the local Kbuild -Wno-type-limits exceptions.
>>
>> Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
>> ---
>> Changes in v4:
>>
>>   - Remove patch #3.
>>   - Aside from minor changes in the patch descriptions, this is
>>     basially a revert to v1.
>>
>> Link to v3: https://lore.kernel.org/r/20251220-remove_wtype-limits-v3-0-24b170af700e@kernel.org
> 
> just to prevent confusions:  As Dan silenced the Smatch warning caused
> by patch #3 [1] (thanks!), the additional comment patch [2] is obsolete
> and v3 of the series is a more complete version than v4.

Exactly!

Thanks to Daniel's effort we finally have a complete fix.

Let me know if you need any actions from my side. Otherwise, I will
assume that my part of the work is done here and will just wait for the
v3 to be picked.

(I am so happy to start 2026 by getting rid of this annoying
-Wtype-limits spam :D)


Yours sincerely,
Vincent Mailhol

