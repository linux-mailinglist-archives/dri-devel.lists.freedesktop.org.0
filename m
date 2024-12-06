Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DA89E7A3F
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 21:58:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 550BE10E62D;
	Fri,  6 Dec 2024 20:58:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="opdIpAAC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id AC2BD10E62D;
 Fri,  6 Dec 2024 20:58:19 +0000 (UTC)
Received: from [100.65.128.154] (unknown [20.236.11.102])
 by linux.microsoft.com (Postfix) with ESMTPSA id 8B63620ACD7A;
 Fri,  6 Dec 2024 12:58:18 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8B63620ACD7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1733518699;
 bh=M9PuEUd7fHK0twjnpmT4sQ2WiGKSyXN5nPrU+06sRxI=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=opdIpAACnQeStJ33oACe6p52ZM8f0Sws7Fv8oVZEtnJ34oxYkj2Ifncn0UBE7+8VM
 /Rer5IHWNKL+Om4cBhthsawIs+kQdevr3ykVw21CBvfVnNLhAZ1lcWLQbVr0aJDoH2
 0Lv+tHrW7mbf2ysXMzyMfTT7x/zNVB+cEVkkvmJU=
Message-ID: <dab77729-682f-4182-9fb2-cd522ac29b5f@linux.microsoft.com>
Date: Fri, 6 Dec 2024 12:58:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: eahariha@linux.microsoft.com, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, cocci@inria.fr,
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-scsi@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, linux-mm@kvack.org,
 linux-bluetooth@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org,
 live-patching@vger.kernel.org, linux-sound@vger.kernel.org,
 etnaviv@lists.freedesktop.org, oss-drivers@corigine.com,
 linuxppc-dev@lists.ozlabs.org, Anna-Maria Behnsen <anna-maria@linutronix.de>
Subject: Re: [PATCH v2 00/21] Converge on using secs_to_jiffies()
To: Przemek Kitszel <przemyslaw.kitszel@intel.com>
References: <20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com>
 <b9fcb12a-b7a4-4c33-836e-67109ce07deb@intel.com>
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Content-Language: en-US
In-Reply-To: <b9fcb12a-b7a4-4c33-836e-67109ce07deb@intel.com>
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

On 11/29/2024 4:57 AM, Przemek Kitszel wrote:
> 
> [removed most non-list recipients, it's just too much]
> 
> On 11/15/24 10:26 PM, Easwar Hariharan wrote:
<snip>
>>
>> ---
>> Changes in v2:
>> - EDITME: describe what is new in this series revision.
>> - EDITME: use bulletpoints and terse descriptions.
>> - Link to v1: https://lore.kernel.org/r/20241115-converge-secs-to-
>> jiffies-v1-0-19aadc34941b@linux.microsoft.com
> 
> that is not a proper changelog, you were supposed to edit those
> placeholder entries; please look around for examples
> 
> There is also just too much recipients. Please split up your patches
> into smaller pieces. You will also learn the process on a smaller
> sample.
> 
> And definitively please wait for 48h before reposting such big series.

Yes, sorry, I sent out a v2 in a moment of panic on including the
already accepted patch in v1. I failed to edit the changelog in that
same panic. I'll try to not panic and do better in the future.

> 
> Regarding code - you could also convert msecs_to_jiffies(const * HZ),
> there are 10 that are greppable.
> 

Those seem to be mistakes. const*HZ is a seconds-denominated timeout,
being passed to msecs_to_jiffies() which will treat it as a
millisecond-denominated timeout resulting in an excessively long
timeout. I suppose that's better than a too-short timeout, and
apparently it's been working fine all along since hardware responds
before the too-long timeout expires. Half of them are in
drivers/scsi/arcmsr/arcmsr_hba.c and the pattern has apparently been
there since 2010.

Thanks,
Easwar
