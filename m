Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E51E8BE52AA
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 21:03:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 410A210EA6B;
	Thu, 16 Oct 2025 19:03:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="Ulx6s2QW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2264E10E33E;
 Thu, 16 Oct 2025 19:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=9TVQSnu3Egn0t9BpMy9FqQd8zgavzk0Dgwf9JL3wdvQ=; b=Ulx6s2QWBfXNlD1aMRyz5hdLSR
 Q/bvr34SOukyO8meFXIMwPdmfv6OKe56iQWRTYZe3TvmoUrh8Gx8XClS5yoj0VRCAhG8SkXoaQRHv
 9Yw9SKokz66ujz7QnY11DZjl667avOJluBui5K2mtXt6PO8G9VAJs6tPSVAw4FhVlT7JMr6KmTYLX
 gzU6xlru0C0BTCCmZaCOO1GaZ3y4raN94gbCktMrZTLROR+VZNYQ3EhCiaRQsL6X20VrKHLVku078
 tokVt+j2nGff998ZumyYZtgx/qHUGWJnyN1waftJtQoaSgKOQNSsURTKyYDDab5fTjKexziKxw1YT
 o2jAVPOQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1v9TGC-00000005lce-2ZNm; Thu, 16 Oct 2025 19:03:36 +0000
Message-ID: <1b4daf74-4242-4f12-8ae5-84eedb95086d@infradead.org>
Date: Thu, 16 Oct 2025 12:03:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mei: intel_lb_mei_interface.h: mark struct member with
 kernel-doc
To: "Gote, Nitin R" <nitin.r.gote@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "Usyskin, Alexander" <alexander.usyskin@intel.com>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20251016035942.1148176-1-rdunlap@infradead.org>
 <IA3PR11MB898737E5BCC26C83D5470439D0E9A@IA3PR11MB8987.namprd11.prod.outlook.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <IA3PR11MB898737E5BCC26C83D5470439D0E9A@IA3PR11MB8987.namprd11.prod.outlook.com>
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



On 10/16/25 3:08 AM, Gote, Nitin R wrote:
> 
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Randy
>> Dunlap
>> Sent: Thursday, October 16, 2025 9:30 AM
>> To: dri-devel@lists.freedesktop.org
>> Cc: Randy Dunlap <rdunlap@infradead.org>; Usyskin, Alexander
>> <alexander.usyskin@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>;
>> Jani Nikula <jani.nikula@linux.intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
>> Thomas Hellström <thomas.hellstrom@linux.intel.com>; Joonas Lahtinen
>> <joonas.lahtinen@linux.intel.com>; Tvrtko Ursulin <tursulin@ursulin.net>; intel-
>> gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org; David Airlie
>> <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>
>> Subject: [PATCH] mei: intel_lb_mei_interface.h: mark struct member with kernel-
>> doc
>>
>> Use correct kernel-doc notation to prevent 3 kernel-doc warnings.
>> @push_payload is a struct member here, not a function, so use '@'
>> and ':' in its description.
>>
>> Warning: intel_lb_mei_interface.h:55 Incorrect use of kernel-doc format:          *
>> push_payload - Sends a payload to the authentication firmware
>> Warning: intel_lb_mei_interface.h:67 Invalid param: * @dev: Device struct
>> corresponding to the mei device * @type: Payload type (see &enum
>> intel_lb_type) * @flags: Payload flags bitmap (e.g.
>> %INTEL_LB_FLAGS_IS_PERSISTENT) * @payload: Pointer to payload buffer *
>> @payload_size: Payload buffer size in bytes * * Return: 0 success, negative errno
>> value on transport failure, *         positive status returned by firmware */ int
>> (*push_payload)(struct device *dev, u32 type, u32 flags, const void *payload,
>> size_t payload_size)
>> Warning: intel_lb_mei_interface.h:67 struct member '* @dev: Device struct
>> corresponding to the mei device * @type: Payload type (see &enum
>> intel_lb_type' not described in 'intel_lb_component_ops'
>>
> 
> A small checkpatch warning needs to be fixed here.
> Otherwise, patch LGTM.

I suppose that you are referring to the line length warning?
OK, I'll send a v2 with the warning lines reformatted.

Thanks.

> Reviewed-by: Nitin Gote <nitin.r.gote@intel.com>
> 
>> Fixes: 741eeabb7c78 ("mei: late_bind: add late binding component driver")
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> ---
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
>>  	 * @flags: Payload flags bitmap (e.g. %INTEL_LB_FLAGS_IS_PERSISTENT)

-- 
~Randy

