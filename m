Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A759458B1E
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 10:09:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 302FA89E52;
	Mon, 22 Nov 2021 09:09:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5113F89E33;
 Mon, 22 Nov 2021 09:09:30 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10175"; a="221633682"
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; d="scan'208";a="221633682"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 01:09:29 -0800
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; d="scan'208";a="456569866"
Received: from rmcdonax-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.19.217])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 01:09:24 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, cgel.zte@gmail.com
Subject: Re: [PATCH linux-next] drm/i915/request: Remove unused variables
In-Reply-To: <80173779-5c91-a56e-6bac-ad4ff7c435f7@wanadoo.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211121101309.23577-1-yong.yiran@zte.com.cn>
 <80173779-5c91-a56e-6bac-ad4ff7c435f7@wanadoo.fr>
Date: Mon, 22 Nov 2021 11:09:21 +0200
Message-ID: <87o86co8u6.fsf@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, airlied@linux.ie,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, yong yiran <yong.yiran@zte.com.cn>,
 rodrigo.vivi@intel.com, Zeal Robot <zealci@zte.com.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 21 Nov 2021, Christophe JAILLET <christophe.jaillet@wanadoo.fr> wro=
te:
> Le 21/11/2021 =C3=A0 11:13, cgel.zte@gmail.com a =C3=A9crit=C2=A0:
>> From: yong yiran <yong.yiran@zte.com.cn>
>>=20
>> The clang_analyzer complains as follows:
>> drivers/gpu/drm/i915/i915_request.c:2119:2 warning:
>> Value stored to 'x' is never read
>>=20
>> Reported-by: Zeal Robot <zealci@zte.com.cn>
>> Signed-off-by: yong yiran <yong.yiran@zte.com.cn>

The sender's Signed-off-by is missing.

>> ---
>>   drivers/gpu/drm/i915/i915_request.c | 3 ---
>>   1 file changed, 3 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/=
i915_request.c
>> index 820a1f38b271..5e4420f461e9 100644
>> --- a/drivers/gpu/drm/i915/i915_request.c
>> +++ b/drivers/gpu/drm/i915/i915_request.c
>> @@ -2047,7 +2047,6 @@ void i915_request_show(struct drm_printer *m,
>>   {
>>   	const char *name =3D rq->fence.ops->get_timeline_name((struct dma_fen=
ce *)&rq->fence);
>>   	char buf[80] =3D "";
>> -	int x =3D 0;
>>=20=20=20
>>   	/*
>>   	 * The prefix is used to show the queue status, for which we use
>> @@ -2079,8 +2078,6 @@ void i915_request_show(struct drm_printer *m,
>>   	 *      from the lists
>>   	 */
>>=20=20=20
>> -	x =3D print_sched_attr(&rq->sched.attr, buf, x, sizeof(buf));
>> -
>
> Seriously?

Basically I've started considering all of these patches as static
analyzer reports *only*. The "fixes" have often been completely wrong or
have missed the real issue and merely silenced the warning.

I really couldn't say anything about the "Zeal Robot" itself, but the
patches are giving it a bad reputation.


BR,
Jani.




>
> CJ
>
>
>>   	drm_printf(m, "%s%.*s%c %llx:%lld%s%s %s @ %dms: %s\n",
>>   		   prefix, indent, "                ",
>>   		   queue_status(rq),
>>=20
>

--=20
Jani Nikula, Intel Open Source Graphics Center
