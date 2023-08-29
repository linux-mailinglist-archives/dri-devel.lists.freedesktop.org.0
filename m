Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 379C978CB9B
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 20:00:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C910210E430;
	Tue, 29 Aug 2023 18:00:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C38D10E430
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 18:00:40 +0000 (UTC)
Received: from [IPV6:2804:431:a881:db00:51cf:cbff:7cc4:3f6d] (unknown
 [IPv6:2804:431:a881:db00:51cf:cbff:7cc4:3f6d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D0D1D66071FD;
 Tue, 29 Aug 2023 19:00:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693332039;
 bh=i73/jHaGWMu/rHjW04TeYQepCq+QBhdF1yKqAZFgAcU=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=VZZ/fE0uEra22irHH9fjGW7ATFx9yijAUBJo7Sngt8KbcC4OL/M0Xh1YwwgXZvnSM
 ivABQuerNkyG3mnOyroepgYzmDDQaluEZ4eMWYpkX6GUgnPkrGAxsHDPcdwTW5u3jY
 fva1DczVm+HUv0Et/9vMYdqbwhV0VC3nQ1vp/7SZ54X7qHx3vbj/Mj0P8uebn6L6lq
 fd5tO+rG4EEaKMzekqXWgadmfG4Z79dS5cmKmYv8QWe7mbYAswVgTr1GqpMHD5o8f4
 1vMGdN9wE6KewgDEaFhlx03moJHf5MInojeiZE5pIWdyP5CX65x1HM+q0svdRDtuoQ
 x4HZo7SZmYNgA==
Message-ID: <04d7610f-5057-3faa-1a11-716c29400e7e@collabora.com>
Date: Tue, 29 Aug 2023 15:00:32 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] drm: ci: docs: fix build warning - add missing escape
Content-Language: en-US
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org, airlied@gmail.com
References: <20230824164230.48470-1-helen.koike@collabora.com>
 <ZO4xj/sHodsc8+X3@phenom.ffwll.local>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <ZO4xj/sHodsc8+X3@phenom.ffwll.local>
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



On 29/08/2023 14:57, Daniel Vetter wrote:
> On Thu, Aug 24, 2023 at 01:42:30PM -0300, Helen Koike wrote:
>> Fix the following warning:
>>
>> Documentation/gpu/automated_testing.rst:55: WARNING: Inline emphasis start-string without end-string.
>>
>> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> 
> Applied this, sorry for the delay. I also rebased the tree onto latest
> drm-next, in case there's any fixes for the current set of ci support that
> need applying.

np, thanks for picking it up.

> 
> The other series I've seen looks like it's adding more support, I guess
> that can be skipped for the initial stuff?

Yes, it enables more tests (which is good for getting more feedback from 
people) but yeah, I guess it can be skipped for the initial thing.

Regards,
Helen

> -Sima
> 
>>
>> ---
>>
>> Patch for topic/drm-ci
>>
>> V2:
>> - Fix typo s/scape/escape
>>
>> ---
>>   Documentation/gpu/automated_testing.rst | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/gpu/automated_testing.rst b/Documentation/gpu/automated_testing.rst
>> index 1b87b802ac7f..469b6fb65c30 100644
>> --- a/Documentation/gpu/automated_testing.rst
>> +++ b/Documentation/gpu/automated_testing.rst
>> @@ -52,7 +52,7 @@ IGT_VERSION
>>   drivers/gpu/drm/ci/testlist.txt
>>   -------------------------------
>>   
>> -IGT tests to be run on all drivers (unless mentioned in a driver's *-skips.txt
>> +IGT tests to be run on all drivers (unless mentioned in a driver's \*-skips.txt
>>   file, see below).
>>   
>>   drivers/gpu/drm/ci/${DRIVER_NAME}-${HW_REVISION}-fails.txt
>> -- 
>> 2.34.1
>>
> 
