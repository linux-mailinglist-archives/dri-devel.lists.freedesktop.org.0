Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D2F8A1A46
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 18:45:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BC9710F218;
	Thu, 11 Apr 2024 16:45:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2AD7E10F217;
 Thu, 11 Apr 2024 16:45:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C52C113E;
 Thu, 11 Apr 2024 09:45:50 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 21A953F6C4;
 Thu, 11 Apr 2024 09:45:17 -0700 (PDT)
Message-ID: <f2d1bb68-7ab7-4bbf-a1b1-88334ba52bab@arm.com>
Date: Thu, 11 Apr 2024 17:45:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] treewide: Fix common grammar mistake "the the"
To: Thorsten Blum <thorsten.blum@toblux.com>, kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-s390@vger.kernel.org, speakup@linux-speakup.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-wireless@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-afs@lists.infradead.org,
 ecryptfs@vger.kernel.org, netfs@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-unionfs@vger.kernel.org,
 linux-arch@vger.kernel.org, io-uring@vger.kernel.org, cocci@inria.fr,
 linux-perf-users@vger.kernel.org
References: <20240411150437.496153-4-thorsten.blum@toblux.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20240411150437.496153-4-thorsten.blum@toblux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 11/04/2024 4:04 pm, Thorsten Blum wrote:
> Use `find . -type f -exec sed -i 's/\<the the\>/the/g' {} +` to find all
> occurrences of "the the" and replace them with a single "the".
> 
[...]
> diff --git a/arch/arm/include/asm/unwind.h b/arch/arm/include/asm/unwind.h
> index d60b09a5acfc..a75da9a01f91 100644
> --- a/arch/arm/include/asm/unwind.h
> +++ b/arch/arm/include/asm/unwind.h
> @@ -10,7 +10,7 @@
>   
>   #ifndef __ASSEMBLY__
>   
> -/* Unwind reason code according the the ARM EABI documents */
> +/* Unwind reason code according the ARM EABI documents */

Well, that's clearly still not right... repeated words aren't *always* 
redundant, sometimes they're meant to be other words ;)

Thanks,
Robin.
