Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E32EA3B9D5D
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 10:13:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A69AC89FF6;
	Fri,  2 Jul 2021 08:13:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DAC089FF6;
 Fri,  2 Jul 2021 08:13:17 +0000 (UTC)
Received: from [192.168.1.71] (unknown [91.155.165.229])
 (Authenticated sender: martin.peres@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id B12265FFA7;
 Fri,  2 Jul 2021 10:13:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1625213596;
 bh=ethHNm97OSRR8anecku175JdY+9LNg54J6mz15NN3sU=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=mxm0ntPed4QA89A4WOa1JlMSlxU/qsWc5yL3qMUhYrMpOkjVC8pvqb1iI35rPcNdA
 e8gQFbA0KemNWA/7ut/04Lajy17BcMlS70UdqJtsiUKcV62J4xqb4qOqGJTqjrjayR
 l7d79UgU7P5nH6InxDiJzcer+50RBXW0qBTNxSsAUYXB2MNT4SzaYvPxvu6lCZCjoB
 ionWOwswyJRdZcAO4TAKh0r4NaPGEyqXugGbt9tmmoFmhyUzjzzznF8nTuGnOvnjn+
 fggiD1JF+bkn5dTH/9L9FuviuyyC05sMLsxZhffchdibvXxwgXynh7rSyMzDuBN7PG
 3VqBZhLKW1Tsw==
Subject: Re: [PATCH 47/47] drm/i915/guc: Unblock GuC submission on Gen11+
From: Martin Peres <martin.peres@free.fr>
To: Matthew Brost <matthew.brost@intel.com>
References: <20210624070516.21893-1-matthew.brost@intel.com>
 <20210624070516.21893-48-matthew.brost@intel.com>
 <88cbe963-7188-f4ae-5acf-01a80bd2fe25@free.fr>
 <20210630180052.GA8283@sdutt-i7>
 <7c3e1d46-74eb-6f2d-53ca-d73ce9e61c03@free.fr>
Message-ID: <d9e31651-dd97-fb39-0045-7cd62650bd03@free.fr>
Date: Fri, 2 Jul 2021 11:13:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <7c3e1d46-74eb-6f2d-53ca-d73ce9e61c03@free.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: intel-gfx@lists.freedesktop.org, daniele.ceraolospurio@intel.com,
 dri-devel@lists.freedesktop.org, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/07/2021 21:24, Martin Peres wrote:
[...]
>>
>>>
>>>> +        i915->params.enable_guc = ENABLE_GUC_LOAD_HUC;
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    /* Default: enable HuC authentication and GuC submission */
>>>> +    i915->params.enable_guc = ENABLE_GUC_LOAD_HUC | 
>>>> ENABLE_GUC_SUBMISSION;
>>>
>>> This seems to be in contradiction with the GuC submission plan which 
>>> states:
>>>
>>> "Not enabled by default on any current platforms but can be enabled via
>>> modparam enable_guc".
>>>
>>
>> I don't believe any current platform gets this point where GuC
>> submission would be enabled by default. The first would be ADL-P which
>> isn't out yet.
> 
> Isn't that exactly what the line above does?

In case you missed this crucial part of the review. Please answer the 
above question.

Cheers,
Martin
