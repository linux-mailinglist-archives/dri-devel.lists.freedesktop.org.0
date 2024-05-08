Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 704388BFC21
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 13:34:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA15010F225;
	Wed,  8 May 2024 11:34:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BmBJYyDB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4963B10FADC;
 Wed,  8 May 2024 11:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715168053; x=1746704053;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Ngtt6qxyBZKCQLxH7yAYeYhGIsHrAn5VzCtRAIry/6c=;
 b=BmBJYyDBE9H2dmZMsLHl3u/7/y3ledmEXxvYEHOaFgeQw8KKEFbeId0q
 IRbskgSqPLRctlsxzyHedv+Hmz6qzj3m9bigPw1/B4+/hPKKK85uQVoLI
 uqIcrewAoxX69HTATWJjjUmTD6i7QXfcn1o9kogScw8nYiZMGVJMYctuL
 0Go75f8LQhk46aNxqvfcN7M1nU9HlZhblaeUoBrFALpyK1Mn+G1+vUeSN
 XAY+RNERw8QPpIZT4qh8zfxxTPkfTEIibGZj38BU63RiWi/NTjxGY7vg3
 9kcAJC1dOspVx4+WOxlCREU1vZ70J5yG53nnE+25Zb3HT0SvStyWsmxC2 g==;
X-CSE-ConnectionGUID: tlomQ90+TqigzUQry0P0nA==
X-CSE-MsgGUID: ZPnD0GrQTlmP1RZwtxHC4A==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="11183124"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="11183124"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 04:34:13 -0700
X-CSE-ConnectionGUID: aJA7K4oUTk6CCop1BVS35g==
X-CSE-MsgGUID: Qs9sG8wHQgOGIFeA0Xb42g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="33329442"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 04:34:11 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Farah Kassabri <fkassabri@habana.ai>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, Ohad
 Sharabi <osharabi@habana.ai>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm: print top commit sha after loading the driver
In-Reply-To: <6a605dbe-53c9-416b-9bdc-728c3e155256@habana.ai>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240424100706.269523-1-fkassabri@habana.ai>
 <87bk5s4ekb.fsf@intel.com>
 <45wxpwjv6fqzbnsivojrr2dbspnftinois7um3rrtku5j47le4@lobf5qyr2f2n>
 <6a605dbe-53c9-416b-9bdc-728c3e155256@habana.ai>
Date: Wed, 08 May 2024 14:34:08 +0300
Message-ID: <87seysk05r.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 08 May 2024, Farah Kassabri <fkassabri@habana.ai> wrote:
> On 4/29/2024 18:32, Lucas De Marchi wrote:
>> On Mon, Apr 29, 2024 at 02:02:28PM GMT, Jani Nikula wrote:
>>> On Wed, 24 Apr 2024, Farah Kassabri <fkassabri@habana.ai> wrote:
>>>> Add the last driver sha to the existing log message
>>>> which prints the drm device info.
>>>
>>> The commit message fails to answer the most important question: why?
>>>
>>> Especially, what makes drm devices such special snowflakes that they'd
>>> need to be the only ones in the kernel to print git commit sha1's?
>>=20
>>=20
>> the closest to what was added here would be srcversion:
>>=20
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $ modinfo build64/drivers/gp=
u/drm/xe/xe.ko=C2=A0 | grep srcversion
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 srcversion:=C2=A0=C2=A0=C2=
=A0=C2=A0 0EA08A43AC399A0D942740
>>=20
>> which makes more sense and doesn't depend on the git tree checkout and
>> other possible problems with dirty checkouts.=C2=A0 If you want to print=
 it
>> on module load to be able to tell from a log, you could probably just
>> access mod->srcversion.
>>=20
>> but I'm not sure what we are trying to accomplish here and the commit
>> message certainly missed that. Please Cc dri-devel on changes outside xe
>> and provide the motivation in the commit message.
>
> The main reason why we need this sha, is because our driver will run in=20
> multiple environments and setups (whether it's for clients, our labs or=20
> data center), each setup could work with different driver build and it's=
=20
> very convenient to see what is the last sha in the running driver
> in order to see if some fix is inside or not for example.

While I sympathize with this view, it's not really an upstream problem,
is it? When you're running upstream kernels, you don't mix and match,
you run a known kernel version and the drivers that come with it.

And again, why should xe be a special snowflake in this respect? If it
were fine for xe to add this, why wouldn't it be fine for absolutely all
drivers?

> The srcversion is not good enough as it's doesn't server the purpose and=
=20
> it's not incrementing at the same rate as the commits sha.
> Note that this apply not to all drm devices only xe, and it's optional=20
> for other devices to set it or not, and in case it's not set this patch=20
> will not affect the existing drm log.
> you can see we're already doing that for habanalabs driver.

Where?

Not that it justifies adding more, but I can't find it.


BR,
Jani.


> I'll update the commit message, and the dri-level alreay in CC in case=20
> they see any issue with this change.
>
> BR,
> Farah
>
>>=20
>> thanks
>> Lucas De Marchi
>>=20
>>=20
>>>
>>> BR,
>>> Jani.
>>>
>>>>
>>>> Signed-off-by: Farah Kassabri <fkassabri@habana.ai>
>>>> ---
>>>> =C2=A0drivers/gpu/drm/drm_drv.c | 6 +++---
>>>> =C2=A0include/drm/drm_drv.h=C2=A0=C2=A0=C2=A0=C2=A0 | 2 ++
>>>> =C2=A02 files changed, 5 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>>>> index 535b624d4c9d..e0f7af1b6ec3 100644
>>>> --- a/drivers/gpu/drm/drm_drv.c
>>>> +++ b/drivers/gpu/drm/drm_drv.c
>>>> @@ -947,10 +947,10 @@ int drm_dev_register(struct drm_device *dev,=20
>>>> unsigned long flags)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 drm_panic_register(dev);
>>>>
>>>> -=C2=A0=C2=A0=C2=A0 DRM_INFO("Initialized %s %d.%d.%d %s for %s on min=
or %d\n",
>>>> +=C2=A0=C2=A0=C2=A0 DRM_INFO("Initialized %s %d.%d.%d%s %s for %s on m=
inor %d\n",
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 driver->name, d=
river->major, driver->minor,
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 driver->patchlevel, =
driver->date,
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev->dev ? dev_name(=
dev->dev) : "virtual device",
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 driver->patchlevel, =
driver->git_sha ? driver->git_sha : "",
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 driver->date, dev->d=
ev ? dev_name(dev->dev) : "virtual=20
>>>> device",
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev->primary ? =
dev->primary->index : dev->accel->index);
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 goto out_unlock;
>>>> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>>>> index 8878260d7529..7578a1f4ce74 100644
>>>> --- a/include/drm/drm_drv.h
>>>> +++ b/include/drm/drm_drv.h
>>>> @@ -407,6 +407,8 @@ struct drm_driver {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 int minor;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 /** @patchlevel: driver patch level */
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 int patchlevel;
>>>> +=C2=A0=C2=A0=C2=A0 /** @git_sha: driver last commit sha */
>>>> +=C2=A0=C2=A0=C2=A0 char *git_sha;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 /** @name: driver name */
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 char *name;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 /** @desc: driver description */
>>>
>>> --=20
>>> Jani Nikula, Intel
>

--=20
Jani Nikula, Intel
