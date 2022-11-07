Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D905B61F7E9
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 16:47:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 668F510E41C;
	Mon,  7 Nov 2022 15:47:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4EDBD10E408
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 15:47:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A00C61FB;
 Mon,  7 Nov 2022 07:47:13 -0800 (PST)
Received: from [10.57.3.218] (unknown [10.57.3.218])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 60F3E3F534;
 Mon,  7 Nov 2022 07:47:06 -0800 (PST)
Message-ID: <f2bbb902-8447-076a-f290-6a257abc48d9@arm.com>
Date: Mon, 7 Nov 2022 15:47:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] drm/panfrost: Remove type name from internal struct again
To: Alyssa Rosenzweig <alyssa@collabora.com>
References: <20221103114036.1581854-1-steven.price@arm.com>
 <Y2kGqIAE7WPYUTKx@maud>
Content-Language: en-GB
From: Steven Price <steven.price@arm.com>
In-Reply-To: <Y2kGqIAE7WPYUTKx@maud>
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
Cc: dri-devel@lists.freedesktop.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/11/2022 13:22, Alyssa Rosenzweig wrote:
> Reviewed-by: Alyssa Rosenzweig <alyssa@collabora.com>

Thanks, pushed to drm-misc-fixes:

c4299907c09a drm/panfrost: Remove type name from internal struct again

Steve

> On Thu, Nov 03, 2022 at 11:40:36AM +0000, Steven Price wrote:
>> Commit 72655fb942c1 ("drm/panfrost: replace endian-specific types with
>> native ones") accidentally reverted part of the parent commit
>> 7228d9d79248 ("drm/panfrost: Remove type name from internal structs")
>> leading to the situation that the Panfrost UAPI header still doesn't
>> compile correctly in C++.
>>
>> Revert the accidental revert and pass me a brown paper bag.
>>
>> Reported-by: Alyssa Rosenzweig <alyssa@collabora.com>
>> Fixes: 72655fb942c1 ("drm/panfrost: replace endian-specific types with native ones")
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>>  include/uapi/drm/panfrost_drm.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
>> index 6f93c915cc88..9f231d40a146 100644
>> --- a/include/uapi/drm/panfrost_drm.h
>> +++ b/include/uapi/drm/panfrost_drm.h
>> @@ -254,7 +254,7 @@ struct panfrost_dump_object_header {
>>  			__u64 nbos;
>>  		} reghdr;
>>  
>> -		struct pan_bomap_hdr {
>> +		struct {
>>  			__u32 valid;
>>  			__u64 iova;
>>  			__u32 data[2];
>> -- 
>> 2.34.1
>>

