Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2848D314A13
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 09:16:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 747096EB3B;
	Tue,  9 Feb 2021 07:56:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07FE66EA1F
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 23:23:51 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id h6so17526609oie.5
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Feb 2021 15:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=02Fg2L/cP5O7yEA4aDL/0wbnSxjB/HCeUwPhCj0v2gs=;
 b=fsN5YCV/mulJoJ47yEU+cNQ+BMgru+mQR+5hsX98yZsDYTQ2eoyPicl2LApff+GBWH
 Oill4Ay5CEe0yvmu+p55TC0osIvP+XveznYfzjSff6j7ZmulDiZP70DRfkibSFb44ihB
 /vScocqKsR96xgZKUDi93txyQXg+NpyOn9aVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=02Fg2L/cP5O7yEA4aDL/0wbnSxjB/HCeUwPhCj0v2gs=;
 b=uec5DWWVM/2wLKNr0yrG/Fir2RiUe1PfzrnE1kTWOQLdfBsuliQc0d3JG8EvRsSKWO
 0eHdeMXLtNqj9cbpV4GlB2/V0SD5Mh+m6mNkZLrEjPLEuBOLfPd5Eb95G9hq1mhIWd6j
 XXZug2DXZAnOwyRqpV3iRaVVhYd5vl0V3J+Ntd3OSMxHYumPjpCjtQpLBeHoKwAqbtBX
 qXFG2/q9k+vIXViMeNmoZi5135nVdorbHEECXV6lbLgfvf3oDXD02m4DTNHMt1/pIRAX
 ma3CyUG9aI9BMzcMTxmQ35ewu+jGJFSLZ/QVzRybkCVc6zrZY/wXGtUxq0NVisWLw8vB
 EPgw==
X-Gm-Message-State: AOAM530pkxnKFfNKTnJx2sS0rw6f/UwotimugBp5W1gtW6PvP3LNsAfG
 IkjW5nrXln6x7NjX5qfXaInP5Q==
X-Google-Smtp-Source: ABdhPJzW4ZKjg72PScgkzDJMPPF7mK3cqkqqKQiSQt7DyqfZNSsHm7bj68ptwMEMriHGlA4GxXV62Q==
X-Received: by 2002:aca:4508:: with SMTP id s8mr758346oia.118.1612826631286;
 Mon, 08 Feb 2021 15:23:51 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id x13sm400036otg.79.2021.02.08.15.23.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 15:23:50 -0800 (PST)
Subject: Re: [PATCH 1/5] kselftests: dmabuf-heaps: Fix Makefile's inclusion of
 the kernel's usr/include dir
To: John Stultz <john.stultz@linaro.org>, lkml <linux-kernel@vger.kernel.org>
References: <20210129030514.1231773-1-john.stultz@linaro.org>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <27bd6340-617a-37a2-d17f-8e50b5d5362f@linuxfoundation.org>
Date: Mon, 8 Feb 2021 16:23:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210129030514.1231773-1-john.stultz@linaro.org>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 09 Feb 2021 07:56:28 +0000
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
Cc: Sandeep Patil <sspatil@google.com>, Shuah Khan <shuah@kernel.org>,
 dri-devel@lists.freedesktop.org, Laura Abbott <labbott@kernel.org>,
 linux-kselftest@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
 Hridya Valsaraju <hridya@google.com>, linux-media@vger.kernel.org,
 Suren Baghdasaryan <surenb@google.com>, Daniel Mentz <danielmentz@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/28/21 8:05 PM, John Stultz wrote:
> Copied in from somewhere else, the makefile was including
> the kerne's usr/include dir, which caused the asm/ioctl.h file
> to be used.
> 
> Unfortunately, that file has different values for _IOC_SIZEBITS
> and _IOC_WRITE than include/uapi/asm-generic/ioctl.h which then
> causes the _IOCW macros to give the wrong ioctl numbers,
> specifically for DMA_BUF_IOCTL_SYNC.
> 
> This patch simply removes the extra include from the Makefile
> 
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: Brian Starkey <brian.starkey@arm.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Laura Abbott <labbott@kernel.org>
> Cc: Hridya Valsaraju <hridya@google.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Sandeep Patil <sspatil@google.com>
> Cc: Daniel Mentz <danielmentz@google.com>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kselftest@vger.kernel.org
> Fixes: a8779927fd86c ("kselftests: Add dma-heap test")
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
>   tools/testing/selftests/dmabuf-heaps/Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/dmabuf-heaps/Makefile b/tools/testing/selftests/dmabuf-heaps/Makefile
> index 607c2acd2082..604b43ece15f 100644
> --- a/tools/testing/selftests/dmabuf-heaps/Makefile
> +++ b/tools/testing/selftests/dmabuf-heaps/Makefile
> @@ -1,5 +1,5 @@
>   # SPDX-License-Identifier: GPL-2.0
> -CFLAGS += -static -O3 -Wl,-no-as-needed -Wall -I../../../../usr/include
> +CFLAGS += -static -O3 -Wl,-no-as-needed -Wall
>   
>   TEST_GEN_PROGS = dmabuf-heap
>   
> 

Thanks John for all these 5 fix and cleanup patches.

Applied to linux-kselftest next for 5.12-rc1

thanks,
-- Shuah
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
