Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 549B79DC07C
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 09:26:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 234CF10E175;
	Fri, 29 Nov 2024 08:26:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E2E10E175
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 08:26:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 685F8A43DB0;
 Fri, 29 Nov 2024 08:24:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C7F2C4CECF;
 Fri, 29 Nov 2024 08:26:33 +0000 (UTC)
Message-ID: <7d7355f4-ee73-41a6-9d62-f15cb5135e41@xs4all.nl>
Date: Fri, 29 Nov 2024 09:26:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: cec: include linux/debugfs.h and linux/seq_file.h
 where needed
To: Jani Nikula <jani.nikula@intel.com>, linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
References: <20241127095308.3149411-1-jani.nikula@intel.com>
 <87plme78hm.fsf@intel.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <87plme78hm.fsf@intel.com>
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

On 29/11/2024 09:24, Jani Nikula wrote:
> On Wed, 27 Nov 2024, Jani Nikula <jani.nikula@intel.com> wrote:
>> Having cec.h include linux/debugfs.h leads to all users of all cec
>> headers include and depend on debugfs.h and its dependencies for no
>> reason. Drop the include from cec.h, and include debugfs.h and
>> seq_file.h where needed.
>>
>> Sort all the modified include lists while at it.
>>
>> Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>

That email no longer exists. Just use hverkuil@xs4all.nl or
hansverk@cisco.com, either works, but I prefer my private email.

Regards,

	Hans

>> Cc: linux-media@vger.kernel.org
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>
>> ---
>>
>> Depends on commit ae19ba915eb7 ("drm/i915/display: include
>> media/cec-notifier.h and linux/debugfs.h where needed")
> 
> I'll resend after -rc1 and some backmerges.
> 
> BR,
> Jani.
> 

