Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDCA851D67
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 19:56:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C23410E3BC;
	Mon, 12 Feb 2024 18:56:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="KhAJpP54";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7722B10E3BC
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 18:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=m1baTKysIwyuQiFpS2joxHLjhtugrGXccjQD8FWaWpM=; b=KhAJpP54KtaON/ePLNbrIZ796l
 oRDSVhHpT0MVSmrExhD+m9suBWnsIAo+aJtfBVjHJPfau9OcjKIN0zNWW9VRryFtcH1ey3isGwqb4
 WIT8o183YuI/QD0oZNlilpYRFGo4hzVAZyhieJ+K03q2/G7TEYVxwJRXaekWMbPkn8mwHhXzIpU73
 ZeiQcfA40Tt7KOas6rApISSP/Oce8pXuQf/SU+Vbw7KBzKUkm4g9dpK6AfgmKVmEH7y7r8ycxHszm
 qfq5QPVkcsyPAQD+JQAYNPsrbTbYxeSIZSJ63ydW1zQmPaYK5Lv782PF92VK+kmgjIgdTh7b1qjxb
 W7qvWR9w==;
Received: from [50.53.50.0] (helo=[192.168.254.15])
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rZbTt-00000006hRv-1BZe; Mon, 12 Feb 2024 18:56:41 +0000
Message-ID: <4f3fa9e4-3000-4a96-a7f6-e32e69b57a84@infradead.org>
Date: Mon, 12 Feb 2024 10:56:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] iosys-map: fix typos
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
References: <20240212042837.21071-1-rdunlap@infradead.org>
 <bf0d02d4-2c90-40a4-8018-bd96a01f2751@suse.de>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <bf0d02d4-2c90-40a4-8018-bd96a01f2751@suse.de>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/11/24 23:13, Thomas Zimmermann wrote:
> Hi
> 
> Am 12.02.24 um 05:28 schrieb Randy Dunlap:
>> Correct spellos/typos in comments.
>>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: dri-devel@lists.freedesktop.org
>> ---
>>   include/linux/iosys-map.h |    4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff -- a/include/linux/iosys-map.h b/include/linux/iosys-map.h
>> --- a/include/linux/iosys-map.h
>> +++ b/include/linux/iosys-map.h
>> @@ -34,7 +34,7 @@
>>    * the same driver for allocation, read and write operations.
>>    *
>>    * Open-coding access to :c:type:`struct iosys_map <iosys_map>` is considered
>> - * bad style. Rather then accessing its fields directly, use one of the provided
>> + * bad style. Rather than accessing its fields directly, use one of the provided
> Ok.
>>    * helper functions, or implement your own. For example, instances of
>>    * :c:type:`struct iosys_map <iosys_map>` can be initialized statically with
>>    * IOSYS_MAP_INIT_VADDR(), or at runtime with iosys_map_set_vaddr(). These
>> @@ -85,7 +85,7 @@
>>    *    if (iosys_map_is_equal(&sys_map, &io_map))
>>    *        // always false
>>    *
>> - * A set up instance of struct iosys_map can be used to access or manipulate the
>> + * A setup instance of struct iosys_map can be used to access or manipulate the
> That's not a typo. This refers to "an instance that has been set up".
> 

Thanks. I'll drop that part and resend the other.

> 
>>    * buffer memory. Depending on the location of the memory, the provided helpers
>>    * will pick the correct operations. Data can be copied into the memory with
>>    * iosys_map_memcpy_to(). The address can be manipulated with iosys_map_incr().
> 

-- 
#Randy
