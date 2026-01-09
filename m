Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8616BD08AF7
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 11:48:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF24B10E893;
	Fri,  9 Jan 2026 10:48:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rG/X5ZaL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E0110E893
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 10:48:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B293260163;
 Fri,  9 Jan 2026 10:48:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEACBC4CEF1;
 Fri,  9 Jan 2026 10:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767955698;
 bh=YB3o5N8mPoZSSfPmLEqojcnRW6t5sb6MxRhJUaoMUZ8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=rG/X5ZaLcv68vUMiNgwlCbyFYgR82uSSQKsQm5lv6tZCS3Yk/YudHGkco9OgmzCSf
 7mr7Urz/PNnPgz2V8sphagerys9gMcGOAggQLiDDAPqhSQC57iwQWFwb9BY2g4ZU0f
 JLbl85eRjVVWevS1saQGvCwItKfauWYzIR1UEn9GISjuRbtJTgxuYl3sMqrgkuL/KX
 dp8BeOC6ff5Z8BtovLRhZWnF1iuSvF4iNRoWSoe3+Bp8aaIM2kb1tDqImuZnwaMJxN
 6RTrCpItdGAKBNF6Y6jSE+/8Q/r04bLD1NbJjlEojiQgfT2h1ZTdVhoJtSmkB9rAlr
 4uSvZktNL2bwg==
Message-ID: <4e75acf9-2e04-4ad4-9241-d8fd36462404@kernel.org>
Date: Fri, 9 Jan 2026 11:48:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] video/logo: remove orphan .pgm Makefile rule
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Helge Deller <deller@gmx.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org
References: <20260108-custom-logo-v3-0-5a7aada7a6d4@kernel.org>
 <20260108-custom-logo-v3-1-5a7aada7a6d4@kernel.org>
 <CAMuHMdX04g+BfEuBt_0iCvmZiyCLp58d0QwnFtu3bM1Cv59TzQ@mail.gmail.com>
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
In-Reply-To: <CAMuHMdX04g+BfEuBt_0iCvmZiyCLp58d0QwnFtu3bM1Cv59TzQ@mail.gmail.com>
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

On 09/01/2026 à 09:40, Geert Uytterhoeven wrote:
> Hi Vincent,
> 
> On Thu, 8 Jan 2026 at 20:06, Vincent Mailhol <mailhol@kernel.org> wrote:
>> The kernel has no actual grey-scale logos. And looking at the git
>> history, it seems that there never was one (or maybe there was in the
>> pre-git history? I did not check that far…)
>>
>> Remove the Makefile rule for the .pgm grey scale images.
>>
>> Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
> 
> Thanks for your patch!
> 
> There newer were grey-scale logos. Linux also never supported
> drawing them.
> 
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Thanks. Just to clarify, is your Reviewed-by tag only for this patch or
for the full series?

Yours sincerely,
Vincent Mailhol

