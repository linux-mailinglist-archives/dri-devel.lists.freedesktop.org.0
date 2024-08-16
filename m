Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0B095409C
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 06:26:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9865710E579;
	Fri, 16 Aug 2024 04:26:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NCFN3JJB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDADD10E577;
 Fri, 16 Aug 2024 04:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723782388; x=1755318388;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=n8cbPJoBdBNFqhb62r2jiIfm4wnPB5D7EhBdIzjdkuA=;
 b=NCFN3JJBPNFpATs2RCNDk18voT1xzANsN5X+cHFzNfq07qe0WoCXZbYT
 LJVNk78sszjfUKi+/eni6x0/F39pplDRK0T0+wNAkrpLkRzpGo7j+G+md
 NBVPfmOYLmlyJm3hmZWH23DhTT9YP/Ry26IqdRnof79omSQoatdHKmPMC
 GQ/B9ekdcbxPBhWpsuoPhqQASb6wBWSISie+s8zMHVjsQCUAkf7mk4aVJ
 lIUXoeaS0f+LAeGSJQLp1s/Q++SLWV9v7UJBp30iD+qg58s9qqKa95fAb
 GOoCiTZBF1YQjWbIbvUTIWOh9FkcjH6Td7kjLysVfhprPB/AjiegakbOG w==;
X-CSE-ConnectionGUID: Rr5avq2pSgymZGoA2RdPbg==
X-CSE-MsgGUID: KFnWnd1lQsipQEqJmgPE2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="22038089"
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="22038089"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 21:26:27 -0700
X-CSE-ConnectionGUID: gjzaZ1awTQmTALbhmteGJg==
X-CSE-MsgGUID: kZBm9vxbQQ6knyqQdDuTZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="97073321"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 21:26:23 -0700
Message-ID: <bc514b83-69b4-43ea-bda6-2e498ae1e2ee@linux.intel.com>
Date: Fri, 16 Aug 2024 09:59:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/uapi: Bring back reset uevent
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Raag Jadav <raag.jadav@intel.com>, 
 thomas.hellstrom@linux.intel.com, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, anshuman.gupta@intel.com
References: <20240812074812.1457164-1-raag.jadav@intel.com>
 <801bf720-6131-489c-8440-34d2267fe73b@linux.intel.com>
 <ZrtfgGY1YFr22Pg9@black.fi.intel.com> <ZruPtcniJzXOlumA@intel.com>
 <deb48edf-0a35-49bf-a4b3-b7d60f127b44@linux.intel.com>
 <xcfgszlk4fqraxpzpxhqsaz6zyyi27eojapl6wx4qtbgj2hk4m@6jppy3zg5ea3>
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <xcfgszlk4fqraxpzpxhqsaz6zyyi27eojapl6wx4qtbgj2hk4m@6jppy3zg5ea3>
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


On 14/08/24 19:54, Lucas De Marchi wrote:
> On Wed, Aug 14, 2024 at 12:16:41PM GMT, Aravind Iddamsetty wrote:
>>>>> i see that this is even called from xe_guc_exec_queue_lr_cleanup which is for long running queue
>>>>> from various call paths need to check in what scenarios those happen.
>>>> Should we add a reason for long running queue?
>>> Both of your questions would probably be answered if this was getting developed
>>> at the same time of the user space usage of these uevents.
>>
>> Can't we consider the generic Linux user as a consumer, via udevadm.
>
> No, udevadm just confirms that there is an event being sent. Main thing
> to understand here is "what is this event useful for? what can be done
> as outcome of receiving this event?". From your other reply it seems
> this is about "device is wedged/toast, and driver can't recover without
> userspace intervention since userspace may have different policies"
>
> What would be some examples of actions for userspace to take?
>
>     - Unbind driver, kill clients, rebind?
>     - FLR?
>     - Something else?

The expectation from userspace on receiving this event is to do a reset
most probably SBR(unbind->sbr->rebind).

The other requirement of this event is for L0 Sysman

https://spec.oneapi.io/level-zero/latest/sysman/api.html#_CPPv4N21zes_event_type_flag_t41ZES_EVENT_TYPE_FLAG_DEVICE_RESET_REQUIREDE

https://spec.oneapi.io/level-zero/latest/sysman/api.html#_CPPv4N18zes_device_state_t5resetE

So we expect the admin do the above actions

>
> Is this currently implemented somewhere?
Do you mean by some other driver or subsystem?
>
> Also, is it possible to make is a generic drm event handling so distros
> don't have to setup udev rules for each vendor?

I think doing via drm event mandates the observability applications(L0)
to have open connection to the device to process these which is not desired.

Thanks,
Aravind.
>
>
>
> Lucas De Marchi
>
>>
>> Thanks,
>> Aravind.
>>>
>>>> Raag
