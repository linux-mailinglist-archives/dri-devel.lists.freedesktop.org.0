Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB81CD2D7E
	for <lists+dri-devel@lfdr.de>; Sat, 20 Dec 2025 11:53:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59EDE10E1DE;
	Sat, 20 Dec 2025 10:53:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sUQqJ2DM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC16210E1DE
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 10:53:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CA8A460008;
 Sat, 20 Dec 2025 10:53:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E6F1C4CEF5;
 Sat, 20 Dec 2025 10:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766228017;
 bh=Ss+5mPbbvjNJrIiYt7RXl5Z1m8teePuyHXVfel8E4lg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=sUQqJ2DMXCQGvBYpTFsCz+lVwp89q5mD+kr5YtSb1BDT1mRNpq4yBLKP1kzXksGzE
 y16Zw9x+sijodaJ85I+BU9EoTi/nklmVGfzgKq1to9vEAoHiyC+uE1ZP2wflv1E1vl
 fut49dnupEBu4g+yYMDspGkjtzNcN0W0TYPNHN2e9sc4n90gqcG3asqLn33dHKmvYU
 QMVQohYcWE6+iRMvIZn1XUdHXSJBUOjVlKneP94iAesOJ3rHdQcch/uc0zaRfSOue2
 KxfvWdaaFbSvBDXALXq43h6Iw7UCE5dVEhzTq94zGCe5Q2wcBl7/6whFX2WyuPSWzy
 rrMr5eYSmOyrA==
Message-ID: <664613c5-eee7-4130-8b21-0e47e7024636@kernel.org>
Date: Sat, 20 Dec 2025 11:53:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] minmax: remove useless cast in __is_nonneg()
To: David Laight <david.laight.linux@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
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
 linux-hardening@vger.kernel.org
References: <20251219-remove_wtype-limits-v2-0-2e92b3f566c5@kernel.org>
 <20251219-remove_wtype-limits-v2-4-2e92b3f566c5@kernel.org>
 <20251220100201.26d9b0db@pumpkin>
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
In-Reply-To: <20251220100201.26d9b0db@pumpkin>
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

On 20/12/2025 at 11:02, David Laight wrote:
> On Fri, 19 Dec 2025 23:39:48 +0100
> Vincent Mailhol <mailhol@kernel.org> wrote:
> 
>> The function like macro __is_nonneg() casts its argument to (long long)
>> in an attempt to silence -Wtype-limits warnings on unsigned values.
> 
> nak.
> 
> The cast is needed for pointer types, not for -Wtype-limits.
> which is why the '#if __SIZEOF_POINTER__ == __SIZEOF_LONG_LONG__'
> test is there.

OK. I will remove that fourth patch in v3.


Yours sincerely,
Vincent Mailhol

