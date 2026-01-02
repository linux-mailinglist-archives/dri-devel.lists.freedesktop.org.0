Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BD4CEF090
	for <lists+dri-devel@lfdr.de>; Fri, 02 Jan 2026 18:13:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B0110E063;
	Fri,  2 Jan 2026 17:13:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bRLf71QK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E280310E063
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jan 2026 17:13:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 379164099C;
 Fri,  2 Jan 2026 17:13:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70786C116B1;
 Fri,  2 Jan 2026 17:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767373999;
 bh=NfJPhuqPuS6xiK+MiJre5/jxmg4ZzJ128g0wHIkreKs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bRLf71QKJavHgRQSI6GKKEta82LjNu27s8HxLj6EmX0EpdlqUCCD4joidThPJOuu7
 b2EM9jJYOw25ZJ11mYCq7AizSlX3GixW7UP5Zx9f6qWZu2OW3UZqiXs9y0biOp6bTZ
 CwNYXQrH+obdcE12SyrFi3w9EV8rDLW37rSVZqzByMY1o+8pZ0mooV5pgER9+1aOk5
 LTcgmOL3kZUijwhMCkN06lPpbKfJiXZA8/UI5dhJcXqZ2XygJ3imRl6CD6W/sc2wpO
 cWMlLuf3kXu9lZuk61sPtdF+3h5rJ6/pvA0DFlgvauoaNKcaZBbLjHCvrmoud/MNv8
 u1y07Z3vuZcmw==
Message-ID: <d1c1d037-7be8-49a3-81d7-59d33efba81b@kernel.org>
Date: Fri, 2 Jan 2026 18:13:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] video/logo: remove orphan .pgm Makefile rule
To: David Heidelberg <david@ixit.cz>, Helge Deller <deller@gmx.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-sh@vger.kernel.org
References: <20251230-custom-logo-v1-0-4736374569ee@kernel.org>
 <20251230-custom-logo-v1-1-4736374569ee@kernel.org>
 <e04c9862-761f-4f36-b978-b760d2a0a928@ixit.cz>
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
In-Reply-To: <e04c9862-761f-4f36-b978-b760d2a0a928@ixit.cz>
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

On 02/01/2026 at 17:34, David Heidelberg wrote:
> On 30/12/2025 23:20, Vincent Mailhol wrote:
>> The kernel has no actual grey-scale logos. And looking at the git
>> history, it seems that there never was one (or maybe there was in the
>> pre-git history? I did not check that far…)
>>
>> Remove the Makefile rule for the .pgm grey scale images.
> 
> Great to see this series.

Thanks!

> I think the Fixes: tag should still go here, even if it is not very
> specific.

But then, what do I put in the fixes tag? This:

  Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")

?

I am not sure it is worth bothering the stable team for something that
isn't causing any real harm.


Yours sincerely,
Vincent Mailhol

