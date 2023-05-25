Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D2F7106B0
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 09:49:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A27810E832;
	Thu, 25 May 2023 07:49:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40DAB10E82A;
 Thu, 25 May 2023 07:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685000945; x=1716536945;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=6G8Gb9zH+qb300fPynJh7/Zt/u1U7ytUL6LE4sF3tPo=;
 b=HXGV1WnD5/qRUqb9FJdCdk4VpwrLOX26ChrZl763D9S4OUIkJvi2DkOL
 dQJA3jkScYTPiLhEYOxNfDZMUlS1Uf7ohu9xuWlsHh4dbJugcj+hjN6DL
 WzPJntnwySeenO6Y0keeQqhk7d/Q/SMOlTACsAKHHgQ42P4RsxiQSCdCb
 6wUqG42U40kmV2vCNrwOkaEPdHgt0RN5usnIhOilPFGhw1bB79oyzGHCm
 6v5sl9j3SZMaBOW5UjHhfKeWuFlVHfK+mqnLfjyKfnusdEUkTglzg2bqY
 Nj+kgcqhfN9yBq7uHzYljQeT2eioPccRr2198ROInvUb3U0b2zpNiPyMV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="353841977"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="353841977"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 00:49:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="707902556"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="707902556"
Received: from emontau-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.42.201])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 00:48:58 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, Alex Deucher
 <alexdeucher@gmail.com>, Felix Kuehling <felix.kuehling@amd.com>
Subject: Re: [PATCH v2] drm/amd/display: enable more strict compile checks
In-Reply-To: <e26351ed-ba64-b7e1-5165-de40622e0d30@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230524191955.252212-1-hamza.mahfooz@amd.com>
 <CADnq5_Mz6aPFYGnr8J8C8UeTpbo7JDg+uvjqAxo7o4vmTGej2A@mail.gmail.com>
 <DM6PR12MB3996C4248CBC968A7B08341583419@DM6PR12MB3996.namprd12.prod.outlook.com>
 <BL1PR12MB589849F37FBE98A3A06A316185419@BL1PR12MB5898.namprd12.prod.outlook.com>
 <3fefc712-913a-a391-bc7b-c0c75eff1c3d@amd.com>
 <CADnq5_OdWbg6zKjPrRwd2QSDnHgFuThF+OQHM=tVWj-2ySCu_A@mail.gmail.com>
 <e26351ed-ba64-b7e1-5165-de40622e0d30@amd.com>
Date: Thu, 25 May 2023 10:48:56 +0300
Message-ID: <87fs7kkg0n.fsf@intel.com>
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
Cc: Kees Cook <keescook@chromium.org>, "Li,
 Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Ho, Kenny" <Kenny.Ho@amd.com>,
 Masahiro Yamada <masahiroy@kernel.org>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Russell, Kent" <Kent.Russell@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 24 May 2023, Hamza Mahfooz <hamza.mahfooz@amd.com> wrote:
> + Kees
>
> On 5/24/23 15:50, Alex Deucher wrote:
>> On Wed, May 24, 2023 at 3:46=E2=80=AFPM Felix Kuehling <felix.kuehling@a=
md.com> wrote:
>>>
>>> Sure, I think we tried enabling warnings as errors before and had to
>>> revert it because of weird compiler quirks or the variety of compiler
>>> versions that need to be supported.
>>>
>>> Alex, are you planning to upstream this, or is this only to enforce more
>>> internal discipline about not ignoring warnings?
>>=20
>> I'd like to upstream it.  Upstream already has CONFIG_WERROR as a
>> config option, but it's been problematic to enable in CI because of
>> various breakages outside of the driver and in different compilers.
>> That said, I don't know how much trouble enabling it will cause with
>> various compilers in the wild.

FWIW, I think it's a bit scary to enable -Werror unconditionally. You'll
then need to take into account *all* compilers the kernel build
supports. I'd hate to fail the build for someone trying out a new
compiler that has some new warnings.

In i915, we've added our own kconfig for this that we tell our
developers to use and have enabled in our CI. It also depends on
!COMPILE_TEST to not get enabled by allmodconfig/allyesconfig configs.
The Makefile then has:

subdir-ccflags-$(CONFIG_DRM_I915_WERROR) +=3D -Werror

On a somewhat related side note, it would be great to be able to enable
the equivalent of W=3D1 on a subdir level. Now we need to add basically
the same stuff one by one. Cc: Masahiro.

BR,
Jani.


>>=20
>> Alex
>>=20
>>>
>>> Regards,
>>>     Felix
>>>
>>>
>>> On 2023-05-24 15:41, Russell, Kent wrote:
>>>>
>>>> [AMD Official Use Only - General]
>>>>
>>>>
>>>> (Adding Felix in CC)
>>>>
>>>> I=E2=80=99m a fan of adding it to KFD as well. Felix, can you foresee =
any
>>>> issues here?
>>>>
>>>> Kent
>>>>
>>>> *From:* amd-gfx <amd-gfx-bounces@lists.freedesktop.org> *On Behalf Of
>>>> *Ho, Kenny
>>>> *Sent:* Wednesday, May 24, 2023 3:23 PM
>>>> *To:* Alex Deucher <alexdeucher@gmail.com>; Mahfooz, Hamza
>>>> <Hamza.Mahfooz@amd.com>
>>>> *Cc:* Li, Sun peng (Leo) <Sunpeng.Li@amd.com>; Wentland, Harry
>>>> <Harry.Wentland@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; Siqueira,
>>>> Rodrigo <Rodrigo.Siqueira@amd.com>; linux-kernel@vger.kernel.org;
>>>> dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; Daniel
>>>> Vetter <daniel@ffwll.ch>; Deucher, Alexander
>>>> <Alexander.Deucher@amd.com>; David Airlie <airlied@gmail.com>; Koenig,
>>>> Christian <Christian.Koenig@amd.com>
>>>> *Subject:* Re: [PATCH v2] drm/amd/display: enable more strict compile
>>>> checks
>>>>
>>>> [AMD Official Use Only - General]
>>>>
>>>> [AMD Official Use Only - General]
>>>>
>>>> (+ Felix)
>>>>
>>>> Should we do the same for other modules under amd (amdkfd)?  I was
>>>> going to enable full kernel werror in the kconfig used by my CI but
>>>> this is probably better.
>>>>
>>>> Kenny
>>>>
>>>> ----------------------------------------------------------------------=
--
>>>>
>>>> *From:*Alex Deucher <alexdeucher@gmail.com>
>>>> *Sent:* Wednesday, May 24, 2023 3:22 PM
>>>> *To:* Mahfooz, Hamza <Hamza.Mahfooz@amd.com>
>>>> *Cc:* amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>;
>>>> Li, Sun peng (Leo) <Sunpeng.Li@amd.com>; Ho, Kenny <Kenny.Ho@amd.com>;
>>>> Pan, Xinhui <Xinhui.Pan@amd.com>; Siqueira, Rodrigo
>>>> <Rodrigo.Siqueira@amd.com>; linux-kernel@vger.kernel.org
>>>> <linux-kernel@vger.kernel.org>; dri-devel@lists.freedesktop.org
>>>> <dri-devel@lists.freedesktop.org>; Daniel Vetter <daniel@ffwll.ch>;
>>>> Deucher, Alexander <Alexander.Deucher@amd.com>; David Airlie
>>>> <airlied@gmail.com>; Wentland, Harry <Harry.Wentland@amd.com>; Koenig,
>>>> Christian <Christian.Koenig@amd.com>
>>>> *Subject:* Re: [PATCH v2] drm/amd/display: enable more strict compile
>>>> checks
>>>>
>>>> On Wed, May 24, 2023 at 3:20=E2=80=AFPM Hamza Mahfooz <hamza.mahfooz@a=
md.com>
>>>> wrote:
>>>>>
>>>>> Currently, there are quite a number of issues that are quite easy for
>>>>> the CI to catch, that slip through the cracks. Among them, there are
>>>>> unused variable and indentation issues. Also, we should consider all
>>>>> warnings to be compile errors, since the community will eventually end
>>>>> up complaining about them. So, enable -Werror, -Wunused and
>>>>> -Wmisleading-indentation for all kernel builds.
>>>>>
>>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>>> Cc: Harry Wentland <harry.wentland@amd.com>
>>>>> Cc: Kenny Ho <kenny.ho@amd.com>
>>>>> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>>>>> ---
>>>>> v2: fix grammatical error
>>>>> ---
>>>>>   drivers/gpu/drm/amd/display/Makefile | 2 ++
>>>>>   1 file changed, 2 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/display/Makefile
>>>> b/drivers/gpu/drm/amd/display/Makefile
>>>>> index 0d610cb376bb..3c44162ebe21 100644
>>>>> --- a/drivers/gpu/drm/amd/display/Makefile
>>>>> +++ b/drivers/gpu/drm/amd/display/Makefile
>>>>> @@ -26,6 +26,8 @@
>>>>>
>>>>>   AMDDALPATH =3D $(RELATIVE_AMD_DISPLAY_PATH)
>>>>>
>>>>> +subdir-ccflags-y +=3D -Werror -Wunused -Wmisleading-indentation
>>>>> +
>>>>
>>>> Care to enable this for the rest of amdgpu as well?  Or send out an
>>>> additional patch to do that?  Either way:
>>>> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
>>>>
>>>> Alex
>>>>
>>>>>   subdir-ccflags-y +=3D -I$(FULL_AMD_DISPLAY_PATH)/dc/inc/
>>>>>   subdir-ccflags-y +=3D -I$(FULL_AMD_DISPLAY_PATH)/dc/inc/hw
>>>>>   subdir-ccflags-y +=3D -I$(FULL_AMD_DISPLAY_PATH)/dc/clk_mgr
>>>>> --
>>>>> 2.40.1
>>>>>
>>>>

--=20
Jani Nikula, Intel Open Source Graphics Center
