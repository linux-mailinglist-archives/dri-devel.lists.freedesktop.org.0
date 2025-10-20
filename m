Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B1DBEEEE4
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 02:38:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3593110E045;
	Mon, 20 Oct 2025 00:38:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="chbihm9i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D7A810E045;
 Mon, 20 Oct 2025 00:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=GpAV/VMY9yx3kzxtCkfBCxjEDydMOc4ro6VHFxkqJFE=; b=chbihm9iGw7tLsnTA4HX8e1Lk4
 4mXInwKV99SnKp3PMSubLDTcEAbar5itv3gbc1ZDqoq5Nkhy8ts9vr/flEh16X9i+UWVLfvUDFTrC
 /q0PUnRDDN99lCZ6nyT3US6UTRIez8QIMg1uPLnx+kY/fFk6bh8X3oI2kvMwUeYm9ovcKgPy9rgVF
 HEfx8qFPTzMLlGoGlG//XHmB5TA1RdilHajP92tzjC91yDu4vq4wFh7TIjUdgdjZOAPc0Sf7dCF5j
 qpg2IAL9NEzwyvQzZnZKKyc0dixIMQdiuuiss+wDzRC0Bz2uCmo8UQZGHtC6jp8vtCM9Vgxmv70pp
 IY0SC0Lg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vAdua-0000000BZ1w-1mIz; Mon, 20 Oct 2025 00:38:08 +0000
Message-ID: <f6e3c761-a676-4351-902c-5fbff9f8db6f@infradead.org>
Date: Sun, 19 Oct 2025 17:38:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mei: intel_lb_mei_interface.h: mark struct member with
 kernel-doc
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: Petr Vorel <pvorel@suse.cz>, "Gote, Nitin R" <nitin.r.gote@intel.com>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20251016190941.1306157-1-rdunlap@infradead.org>
 <CY5PR11MB6366AC1589B2FE4E054ED6CCEDF4A@CY5PR11MB6366.namprd11.prod.outlook.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CY5PR11MB6366AC1589B2FE4E054ED6CCEDF4A@CY5PR11MB6366.namprd11.prod.outlook.com>
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



On 10/19/25 12:30 AM, Usyskin, Alexander wrote:
>> Subject: [PATCH v2] mei: intel_lb_mei_interface.h: mark struct member with
>> kernel-doc
>>
>> Use correct kernel-doc notation to prevent 3 kernel-doc warnings.
>> @push_payload is a struct member here, not a function, so use '@'
>> and ':' in its description.
>>
>> Warning: intel_lb_mei_interface.h:55 Incorrect use of kernel-doc format:
>>  * push_payload - Sends a payload to the authentication firmware
>> Warning: intel_lb_mei_interface.h:67 Invalid param:
>>  * @dev: Device struct corresponding to the mei device
>>  * @type: Payload type (see &enum intel_lb_type)
>>  * @flags: Payload flags bitmap (e.g. %INTEL_LB_FLAGS_IS_PERSISTENT)
>>  * @payload: Pointer to payload buffer
>>  * @payload_size: Payload buffer size in bytes
>>  * * Return: 0 success, negative errno value on transport failure,
>>  *         positive status returned by firmware */
>>  int (*push_payload)(struct device *dev, u32 type, u32 flags, const void
>>  *payload, size_t payload_size)
>> Warning: intel_lb_mei_interface.h:67 struct member '* @dev: Device struct
>>  corresponding to the mei device * @type: Payload type (see &enum
>>  intel_lb_type' not described in 'intel_lb_component_ops'
>>
> 
> Not sure about the right format here but this patch makes things better.

Yeah, we don't have a way to document callbacks in kernel-doc.

@push_payload is just a struct member here, not a function.
And the callback parameters aren't struct members. I just
didn't remove them since it's nice to have them documented
and this is the most logical/central place to do that
(most of this IMO).


> Acked-by: Alexander Usyskin <alexander.usyskin@intel.com>
> 
>> Fixes: 741eeabb7c78 ("mei: late_bind: add late binding component driver")
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Reviewed-by: Petr Vorel <pvorel@suse.cz>
>> Reviewed-by: Nitin Gote <nitin.r.gote@intel.com>
>> ---
>> v2: reformat long kernel-doc warning lines to <= 75 chars. (Nitin)
>>
>> Cc: Alexander Usyskin <alexander.usyskin@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
>> Cc: intel-gfx@lists.freedesktop.org
>> Cc: intel-xe@lists.freedesktop.org
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Simona Vetter <simona@ffwll.ch>
>> Cc: dri-devel@lists.freedesktop.org
>> ---
>>  include/drm/intel/intel_lb_mei_interface.h |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> --- linux-next-20251013.orig/include/drm/intel/intel_lb_mei_interface.h
>> +++ linux-next-20251013/include/drm/intel/intel_lb_mei_interface.h
>> @@ -53,7 +53,7 @@ enum intel_lb_status {
>>   */
>>  struct intel_lb_component_ops {
>>  	/**
>> -	 * push_payload - Sends a payload to the authentication firmware
>> +	 * @push_payload: Sends a payload to the authentication firmware
>>  	 * @dev: Device struct corresponding to the mei device
>>  	 * @type: Payload type (see &enum intel_lb_type)
>>  	 * @flags: Payload flags bitmap (e.g.
>> %INTEL_LB_FLAGS_IS_PERSISTENT)

-- 
~Randy

