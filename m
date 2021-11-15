Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8D7450264
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 11:24:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3A246E3C4;
	Mon, 15 Nov 2021 10:24:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 244756E8A6
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 10:24:31 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="319626546"
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="319626546"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 02:24:30 -0800
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="505861951"
Received: from csrini4x-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.251.218.37])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 02:24:28 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Claudio Suarez <cssk@net-c.es>, Sam Ravnborg <sam@ravnborg.org>, Daniel
 Vetter <daniel@ffwll.ch>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm: change logs to print connectors in the form
 CONNECTOR:id:name
In-Reply-To: <YZFIvfY1j0f3pVQt@gineta.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <YZARol5A5hS+5a5m@gineta.localdomain>
 <YZAikieq4bwrJ58c@ravnborg.org> <YZFIvfY1j0f3pVQt@gineta.localdomain>
Date: Mon, 15 Nov 2021 12:24:26 +0200
Message-ID: <87fsrx3eed.fsf@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 14 Nov 2021, Claudio Suarez <cssk@net-c.es> wrote:
> On Sat, Nov 13, 2021 at 09:39:46PM +0100, Sam Ravnborg wrote:
>> Hi Claudio,
>>=20
>> On Sat, Nov 13, 2021 at 08:27:30PM +0100, Claudio Suarez wrote:
>> > The prefered way to log connectors is [CONNECTOR:id:name]. Change it in
>> > drm core programs.
>> >=20
>> > Suggested-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> > Signed-off-by: Claudio Suarez <cssk@net-c.es>
>>=20
>> While touching all these logging calls, could you convernt them to the
>> newer drm_dbg_kms variants?
>> DRM_DEBUG_* are all deprecated.
>>=20
>
> Yes, I can, but it is recommended to do it in a different patch:
>
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#se=
parate-your-changes
>
> C&P:
> "Separate your changes
> Separate each logical change into a separate patch.
> For example, if your changes include both bug fixes and performance enhan=
cements..."
>
>
> I will study and send a new separate patch with your suggestion.

I feel these logging changes are the types of changes where I'd err on
the side of fewer patches than strictly following the above guidelines.

BR,
Jani.


>
> Best regards,
> Claudio Suarez
>
>
>

--=20
Jani Nikula, Intel Open Source Graphics Center
