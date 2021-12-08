Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 103F946D05B
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 10:52:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C09886EC4B;
	Wed,  8 Dec 2021 09:52:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B3EC6EB3D;
 Wed,  8 Dec 2021 09:52:05 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="236537656"
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="236537656"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 01:52:05 -0800
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="515695592"
Received: from amgotede-mobl1.ger.corp.intel.com (HELO [10.213.194.97])
 ([10.213.194.97])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 01:52:02 -0800
Message-ID: <d9f20850-0ba3-9d45-ea6c-0525e20e2442@linux.intel.com>
Date: Wed, 8 Dec 2021 09:52:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [v3 0/3] Introduce Raptor Lake S
Content-Language: en-US
To: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20211203063545.2254380-1-anusha.srivatsa@intel.com>
 <7576de4a-fbd9-ea5c-2d3d-1c5ada9f30e1@linux.intel.com>
 <72998a361a854e59acdbe1ec2c75a0a2@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <72998a361a854e59acdbe1ec2c75a0a2@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>, "Nikula,
 Jani" <jani.nikula@intel.com>, "x86@kernel.org" <x86@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 06/12/2021 04:29, Srivatsa, Anusha wrote:
>> -----Original Message-----
>> From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Sent: Friday, December 3, 2021 2:57 PM
>> To: Srivatsa, Anusha <anusha.srivatsa@intel.com>; intel-
>> gfx@lists.freedesktop.org
>> Cc: x86@kernel.org; dri-devel@lists.freedesktop.org; Ingo Molnar
>> <mingo@redhat.com>; Borislav Petkov <bp@alien8.de>; Dave Hansen
>> <dave.hansen@linux.intel.com>; Joonas Lahtinen
>> <joonas.lahtinen@linux.intel.com>; Nikula, Jani <jani.nikula@intel.com>
>> Subject: Re: [v3 0/3] Introduce Raptor Lake S
>>
>>
>> On 03/12/2021 06:35, Anusha Srivatsa wrote:
>>> Raptor Lake S(RPL-S) is a version 12
>>> Display, Media and Render. For all i915 purposes it is the same as
>>> Alder Lake S (ADL-S).
>>>
>>> The series introduces it as a subplatform of ADL-S. The one difference
>>> is the GuC submission which is default on RPL-S but was not the case
>>> with ADL-S.
>>
>> As a side note, not a blocker of any kind, I am slightly disheartened but the
>> confusion of ADL_P and ADL_S being separate platforms, but then RPL_S is
>> subplatform of ADL_S. Maybe it is just me not being able to keep track of
>> things.
>>
>>> All patches are reviewed. Jani has acked the series.
>>> Looking for other acks in order to merge these to respective branches.
>>
>> Which branches would that be for this series? First two to drm-intel-next and
>> last one to drm-intel-gt-next? Is that complication needed and/or worth the
>> effort?
> 
> Tvrtko,
>   All three have to land to drm-intel-next. The last one has dependency on the first patch and is a trivial change.

One more ack for a good measure:

Acked-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
