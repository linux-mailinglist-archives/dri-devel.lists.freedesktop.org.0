Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E010CEF618
	for <lists+dri-devel@lfdr.de>; Fri, 02 Jan 2026 22:54:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 451CC10E107;
	Fri,  2 Jan 2026 21:54:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aBxSst9t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A269510E107
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jan 2026 21:54:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1D79843EE0;
 Fri,  2 Jan 2026 21:54:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AADADC116B1;
 Fri,  2 Jan 2026 21:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767390881;
 bh=fZhjcNdpKA/3s74Xfhpo6iC9TGgzcsA+YHpOK1tEpFs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=aBxSst9tfD8ocKpLfHUjxhNAK030wia66yBOCwtBfItdOm3hajc+xpK9nlaMTswr0
 oCU5vg/NbpMBuvhHEczmHLQDewsH71MFcq1LvZfxvASRtX/+ah2TV1kFiYf2HHMiDY
 9oMbZO40PGNvjR2nzFyiPm7MBYEz4Pb7eJQwMHhS40hz5CmUmekYP6zZv/RrfpicPx
 nGBj3xwGl7iGbkIU5mvnSVh6ccD/RQk2Q6/XaTv1qPyBNEM/Q85LOQuEmjj+RPSUGF
 vWekUK+/Qt8Lf96ChZcagUnGMiruJ/ndUH+Bc1PKN4BdevaEjFnVRuojrD+dLbF+//
 CfgDuIGH/JsfQ==
Message-ID: <cd012433-4285-425a-84a7-f52897057d41@kernel.org>
Date: Fri, 2 Jan 2026 22:54:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] newport_con: depend on LOGO_LINUX_CLUT224 instead of
 LOGO_SGI_CLUT224
To: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-sh@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <20251230-custom-logo-v1-0-4736374569ee@kernel.org>
 <20251230-custom-logo-v1-4-4736374569ee@kernel.org>
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
In-Reply-To: <20251230-custom-logo-v1-4-4736374569ee@kernel.org>
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

On 30/12/2025 at 23:20, Vincent Mailhol wrote:
> newport_show_logo() is only activated if CONFIG_LOGO_LINUX_CLUT224 is
                                           ^^^^^^^^^^^^^^^^^^^^^^^^^
This should have been CONFIG_LOGO_SGI_CLUT224. But that's only a typo in
the patch description.

@Helger, do you want me to send a v3 or can you directly apply the typo
fix in your linux-fbdev/for-next branch?

> set (otherwise it is a NOP). This configuration value will be removed
> in an upcoming change so instead, make it depend on LOGO_LINUX_CLUT224.
> 
> Signed-off-by: Vincent Mailhol <mailhol@kernel.org>


Yours sincerely,
Vincent Mailhol

