Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C26032F5D50
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 10:28:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 591A06E104;
	Thu, 14 Jan 2021 09:28:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7AF676EAE3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 15:46:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 260351FB;
 Wed, 13 Jan 2021 07:46:40 -0800 (PST)
Received: from [10.57.10.37] (unknown [10.57.10.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5FB0B3F66E;
 Wed, 13 Jan 2021 07:46:38 -0800 (PST)
Subject: Re: [PATCH] drm/panfrost: Use delayed timer as default in devfreq
 profile
To: Steven Price <steven.price@arm.com>
References: <20210105164111.30122-1-lukasz.luba@arm.com>
 <5a52797c-eb03-3dcc-932f-14a08828799e@arm.com>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <66a4f0ca-81d4-7d1c-6415-ce366faea070@arm.com>
Date: Wed, 13 Jan 2021 15:46:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5a52797c-eb03-3dcc-932f-14a08828799e@arm.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 14 Jan 2021 09:28:32 +0000
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
Cc: tomeu.vizoso@collabora.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, alyssa.rosenzweig@collabora.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/13/21 3:35 PM, Steven Price wrote:
> On 05/01/2021 16:41, Lukasz Luba wrote:
>> Devfreq framework supports 2 modes for monitoring devices.
>> Use delayed timer as default instead of deferrable timer
>> in order to monitor the GPU status regardless of CPU idle.
>>
>> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
> 
> Looks reasonable to me.
> 
> Reviewed-by: Steven Price <steven.price@arm.com>
> 
> I'll apply to drm-misc-next.

Thank you Steven!

Regards,
Lukasz
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
