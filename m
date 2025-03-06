Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0A6A54D1B
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 15:12:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4AE110E92F;
	Thu,  6 Mar 2025 14:12:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VqEG6RiQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CED210E92F
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 14:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741270335; x=1772806335;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=uvthA8XmJqP8gVQqug7//D0qhv7CI6kWw6mhcSfz7dw=;
 b=VqEG6RiQMwy19HEZsg9L84mnsBle/M2S/l8a0kPLHgJV0NCQr583w3wz
 dvYfGHNZHeGiwAXMvhzIgTu8FRDX8TbBADYKIxyEhIXtS40HpJ9GPZRXs
 ammoEkpRlEJkukVRU6FZ7XLtuScICN+GfE19rY2/nOtqrvVGtdaF6YD86
 C+QB0v4XENTf5V3rN2DG9M7l+vIogcexqS9lUo1++TYDxg5hKevotRwhj
 RyVL55vwyi+eYnbcs4wPrOCaepiksaQn8cZrulMKZ3XBYuagwgPXIOpxd
 +k2yh3P0ivYzDjhxV0ZMsyoiTbU/LFHBNeIM0ZxMewHLSTnZt0G8CwRdw w==;
X-CSE-ConnectionGUID: dQgW1YpOSEOr0KkukVtAKg==
X-CSE-MsgGUID: OlXEKkJ/QASo2gtOfM7c3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="59688351"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="59688351"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 06:12:14 -0800
X-CSE-ConnectionGUID: 66snu02YQ1C8Wh5LATTmWg==
X-CSE-MsgGUID: 8+HhNCdgRpqmGG7XsbJYXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="118763809"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 06:12:11 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Avizrat, Yaron" <yaron.avizrat@intel.com>, Ofir Bitton
 <obitton@habana.ai>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "sfr@canb.auug.org.au"
 <sfr@canb.auug.org.au>
Cc: "jgg@nvidia.com" <jgg@nvidia.com>, koby.elbaz@intel.com,
 konstantin.sinyuk@intel.com
Subject: Re: [PATCH 1/1] MAINTAINERS: Change habanalabs maintainer
In-Reply-To: <f543ec81-1092-4700-b695-c4126f122444@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240729121718.540489-1-obitton@habana.ai>
 <20240729121718.540489-2-obitton@habana.ai>
 <dc139f06-3f5a-4216-93c2-1e8b3b9c27ba@intel.com>
 <87cyevy9k0.fsf@intel.com>
 <f543ec81-1092-4700-b695-c4126f122444@intel.com>
Date: Thu, 06 Mar 2025 16:12:08 +0200
Message-ID: <874j06w8nb.fsf@intel.com>
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

On Thu, 06 Mar 2025, "Avizrat, Yaron" <yaron.avizrat@intel.com> wrote:
> On 05/03/2025 13:57, Jani Nikula wrote:
>> On Wed, 05 Mar 2025, "Avizrat, Yaron" <yaron.avizrat@intel.com> wrote:
>>> On 29/07/2024 15:17, Ofir Bitton wrote:
>>>> I will be leaving Intel soon, Yaron Avizrat will take the role
>>>> of habanalabs driver maintainer.
>>>>
>>>> Signed-off-by: Ofir Bitton <obitton@habana.ai>
>>>> ---
>>>>  MAINTAINERS | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index ed2d2dbcec81..a4b36590061e 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -9599,7 +9599,7 @@ S:	Maintained
>>>>  F:	block/partitions/efi.*
>>>>=20=20
>>>>  HABANALABS PCI DRIVER
>>>> -M:	Ofir Bitton <obitton@habana.ai>
>>>> +M:	Yaron Avizrat <yaron.avizrat@intel.com>
>>>>  L:	dri-devel@lists.freedesktop.org
>>>>  S:	Supported
>>>>  C:	irc://irc.oftc.net/dri-devel
>>> Acked-by: Yaron Avizrat <yaron.avizrat@intel.com>
>>>
>>> Apologies for the long silence =E2=80=94 it=E2=80=99s been a challengin=
g period with
>>> the Habanalabs-Intel merger, but we're back and ready to continue
>>> contributing.
>>>
>>> We'll be moving forward with our roadmap =E2=80=94 upstreaming the late=
st
>>> HabanaLabs driver, including recent changes and full support for the
>>> entire GaudiX series.
>>>
>>> To support this effort, Koby Elbaz and Konstantin Sinyuk will join me
>>> as co-maintainers on a regular basis.
>> Should they be added as maintainers in the MAINTAINERS entry too?
>>
>> Are you going to pick this up and apply to the Habanalabs repo, and send
>> a pull request with it? Or how do you propose to proceed?
>>
>>
>> BR,
>> Jani.
>>
>
> Yes, in a later patch, they would be added as maintainers in the MAINTAIN=
ERS entry too.
> Regarding your second question, we should start with merging Ofir's initi=
al patch.
> Any additional/upcoming changes will be initially merged into the officia=
l HabanaLabs repo as you mentioned above.

Acked-by: Jani Nikula <jani.nikula@intel.com>


--=20
Jani Nikula, Intel
