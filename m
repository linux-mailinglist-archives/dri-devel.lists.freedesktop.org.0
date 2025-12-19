Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93045CD213B
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 23:06:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9372B10F0E7;
	Fri, 19 Dec 2025 22:06:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JtoU2D4g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CAFC10F0E0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 22:06:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E5ED743DD2;
 Fri, 19 Dec 2025 22:06:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DC61C4CEF1;
 Fri, 19 Dec 2025 22:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766181972;
 bh=BfYzM2JynWv2bbyWkcttr2tIQERUv3zybRmV4VkrM2c=;
 h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
 b=JtoU2D4gRoV6n6Fh3aCObG1kFuEuVqvxYWS/tN4GUY3aETqv2xDpytaCrciBdKNf6
 v+DpLpdtZoiBhvufNBvNjPUjFET+1HdhCNt7s7pmxqt6pmhzIIKFKOVOdWKgeMqQEw
 zQSInC+jOddp1AvqzAgXgrsy0q4xM7nDbtPLx6x063J81K51hXUlKwUEJOJXtAKK6d
 RSLjM9wiOlEGBLWeDYX1JUriTuTJKs5wtBLd3m+wlMioHyRs6wwyS3bBx3d1ia3LnE
 grZY0N2Bqjch5ycS16pLRBUejHrulMCQWH/U/UtnAhd2ruw5V2nItWFUyFS3MpnfNY
 625DGhDY6maoA==
Message-ID: <8c9f2a57-9541-427e-b5ac-aade03f85f65@kernel.org>
Date: Fri, 19 Dec 2025 23:06:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] kbuild: remove gcc's -Wtype-limits
To: Nathan Chancellor <nathan@kernel.org>
References: <20251218-remove_wtype-limits-v1-0-735417536787@kernel.org>
 <aUT_yWin_xslnOFh@derry.ads.avm.de>
Content-Language: en-US
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kbuild@vger.kernel.org, linux-sparse@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-btrfs@vger.kernel.org
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
In-Reply-To: <aUT_yWin_xslnOFh@derry.ads.avm.de>
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

On 19/12/2025 at 08:33, Nicolas Schier wrote:
> On Thu, Dec 18, 2025 at 07:50:00PM +0100, Vincent Mailhol wrote:

(...)

> Thanks for the effort!  (This allows to revert commit dc7fe518b049
> ("overflow: Fix -Wtype-limits compilation warnings").)

Ack. I will send a v2 with more patches to cleanup some -Wtype-limits workarounds.

> Reviewed-by: Nicolas Schier <nsc@kernel.org>

Thanks!

Yours sincerely,
Vincent Mailhol

