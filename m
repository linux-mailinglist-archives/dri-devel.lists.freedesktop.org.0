Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 316C5500867
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 10:31:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C59CD10F22C;
	Thu, 14 Apr 2022 08:31:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57EAA10F22C;
 Thu, 14 Apr 2022 08:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649925099; x=1681461099;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=JuC6/H6wYY0xfsuqbeG2GcM324ZFmWIZku5BVG+l8BY=;
 b=Z3UtBTesoCt4a6DDV7a7IQdzCfmsuZ/di6e0OlOHnMu5emOzfvEZSTr6
 PngztuTySKfQt0Om+giS5JJ8PIYw3SkghSBvHGiIE4zBrTY59wy5gsDPY
 tbxE4hqhasWL6vb3DE4O1hnvx2S8vc6NvQFEiuSRFRmXZXpyKoe3QTTex
 30QtLfXGCBIYZ2MJ0Ts7QsbcNk6Tvv6N8HB8n9psqFn3hAgVfyb2D8e/5
 udxwmuTgiGbYUbMQEgYrPlWgvTFvVyJmVSFi+4sEZXsMmQ5QNgwq6pb7/
 xMfEW+lT257R5Ee23x3oDfioazgAZy6sm9F+LpDABcQ1BgTA6URhmtK2D g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="250173987"
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="250173987"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 01:31:38 -0700
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="725277009"
Received: from nplaweck-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.149.236])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 01:31:36 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: =?utf-8?Q?Fran=C3=A7ois?= Valenduc <francoisvalenduc@gmail.com>,
 "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
Subject: Re: commit 15512021eb3975a8c2366e3883337e252bb0eee5 causes white
 spots in console screens
In-Reply-To: <1bcb195c-8c84-3641-7784-e7b7578bb40f@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <0da21aec-d299-1834-99f3-9a598e4649f7@gmail.com>
 <87v8vcgb63.fsf@intel.com> <20220414063139.GA31013@intel.com>
 <9d497fb9-4504-9e64-1d7f-9353cf96624c@gmail.com>
 <20220414080312.GA31389@intel.com>
 <1bcb195c-8c84-3641-7784-e7b7578bb40f@gmail.com>
Date: Thu, 14 Apr 2022 11:31:36 +0300
Message-ID: <87h76wf4lz.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 14 Apr 2022, Fran=C3=A7ois Valenduc <francoisvalenduc@gmail.com> wr=
ote:
> Le 14/04/22 =C3=A0 10:03, Lisovskiy, Stanislav a =C3=A9crit=C2=A0:
>> On Thu, Apr 14, 2022 at 08:33:35AM +0200, Fran=C3=A7ois Valenduc wrote:
>>> Le 14/04/22 =C3=A0 08:31, Lisovskiy, Stanislav a =C3=A9crit=C2=A0:
>>>> On Wed, Apr 13, 2022 at 08:12:20PM +0300, Jani Nikula wrote:
>>>>> On Wed, 13 Apr 2022, Fran=C3=A7ois Valenduc <francoisvalenduc@gmail.c=
om> wrote:
>>>>>> Commit 15512021eb3975a8c2366e3883337e252bb0eee5
>>>>>> (15512021eb3975a8c2366e3883337e252bb0eee5) causes a lof of white spo=
ts
>>>>>> to appears on the right upper corner of all console screens (see
>>>>>> https://drive.google.com/file/d/13GabEvOIKSAj5yox6ybAZEDu3Ixncw5Q/vi=
ew).
>>>>>> git-bisect shows that this is the offending commit and if I revert i=
t,
>>>>>> the problem goes away. The problem still occurs with kernel 5.18-rc2=
 and
>>>>>> to all stable trees where it was applied.
>>>>>> Can somebody explains what happens ?
>>>>>>
>>>>>> The video card is the following: VGA compatible controller: Intel
>>>>>> Corporation WhiskeyLake-U GT2 [UHD Graphics 620] (rev 02) (prog-if 00
>>>>>> [VGA controller])
>>>>>>
>>>>>> Please tell me if you need more info.
>>>>> That's commit 15512021eb39 ("drm/i915: Workaround broken BIOS DBUF
>>>>> configuration on TGL/RKL"), adding Cc's.
>>>>>
>>>>> Please file a report at fdo gitlab [1] and attach dmesg etc. there.
>>>> That commit looks like it is just disabling all the planes, if wrong
>>>> dbuf/wm configuration is detected.
>>>> However it should do that only once during boot as I understand.
>>>>
>>>> Are you sure that is exactly this commit which is causing this?
>>>> Does the issue appear always?
>>>>
>>>> Ville Syrj=C3=A4l=C3=A4, thoughts?
>>>>
>>>> Stan
>>>>
>>>>> Thanks,
>>>>> Jani.
>>>>>
>>>>>
>>>>> [1] https://gitlab.freedesktop.org/drm/intel/wikis/How-to-file-i915-b=
ugs
>>>>>
>>>>>
>>>>> --=20
>>>>> Jani Nikula, Intel Open Source Graphics Center
>>> As I said, git-bisect shows it's the offending commit and if I revert i=
t,
>>> the problem doesn't happens. Otherwise, it always occurs.
>>>
>>> Fran=C3=A7ois
>>>
>> Does it just happen all the time or some steps/certain circumstances nee=
ded
>> for it to happen?
>>
>> Only suspicion after looking briefly is that once suspend/resume is done
>> it might be messing something up. Just a quick guess..
>>
>> Stan
>
> It occurs permantently as soon as I boot my computer.

I'd appreciate that bug being filed, and the discussion moved there, so
all the details and history are in one place.

Thanks,
Jani.


--=20
Jani Nikula, Intel Open Source Graphics Center
