Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D36996DF5
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 16:33:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E4EB10E751;
	Wed,  9 Oct 2024 14:32:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e8XbNYL/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A34A10E751;
 Wed,  9 Oct 2024 14:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728484378; x=1760020378;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=WjoGYfRn3WCYLdHeJABBe3RrA6lYd/fEJREjdsp1Hpw=;
 b=e8XbNYL/zymDH2U/+JUJGcWC0KmQoXMW0ZM7QFE6Thj8VOD/m7i79VY1
 zqpcBOFTnAG5yKjx1M0k+nqqwK5b7dOHmnjmMjq8AWBAJQO1n7nTJqBHw
 nAns0oxC8TMDYrejP7zCMsjTuZQNAaX8LpHd526PNCLs2LlFD4MTZYUc2
 8QavXq0zwaGI5/PvxJdwKQAAWqrfWBIoM9fxEVqQNtxGMIBR6Mm8QOOKP
 s4j/NuUFRcNGJHW3HjrvDlx9EdazFGGbHIRZzaNybaVxPC7giRTGjXqEd
 +HrGm0aWIQK8p8aLbmFEHneT9sQs7TEia5TI6h8yxx5bT4oyIeu5BcY+a g==;
X-CSE-ConnectionGUID: E9A78tdVS5Su1XC2H7SMyQ==
X-CSE-MsgGUID: o5FRuY2QRRy1jp4yDl4vkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27919164"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="27919164"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 07:32:58 -0700
X-CSE-ConnectionGUID: rkM33qBSTCiEK7e+QzOTeQ==
X-CSE-MsgGUID: gmIkVAseSU6cRUgpKWCr1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="113743172"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.80])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 07:32:56 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Thomas
 Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 8/8] drm/client: s/unsigned int i/int i/
In-Reply-To: <ZwWED3yDPKfMsNPA@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241003113304.11700-1-ville.syrjala@linux.intel.com>
 <20241003113304.11700-9-ville.syrjala@linux.intel.com>
 <4bb5b981-0703-4853-acf8-f834da76ed05@suse.de>
 <ZwWED3yDPKfMsNPA@intel.com>
Date: Wed, 09 Oct 2024 17:32:52 +0300
Message-ID: <87r08p8hyj.fsf@intel.com>
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

On Tue, 08 Oct 2024, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Mon, Oct 07, 2024 at 09:43:47AM +0200, Thomas Zimmermann wrote:
>> Hi
>>=20
>> Am 03.10.24 um 13:33 schrieb Ville Syrjala:
>> > From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> >
>> > Replace the 'unsigned int i' footguns with plain old signed
>> > int. Avoids accidents if/when someone decides they need
>> > to iterate backwards.
>>=20
>> Why are signed types preferable here?
>
> If you iterate backwards you typically write
>
> for (i =3D max; i >=3D 0; i--) {...}
>
> and i>=3D0 is always true for unsigned types.
>
> Another danger is doing any kind of arithmetic
> with 'i' and expecting a signed result.
>
> Based on my experience in getting burned by C integer
> promotion/converison rules a good rule of thumb is to
> always use just "int" unless there is a very good
> reason for not doing so (eg. if the thing is a bitmask
> or some kind of other thing where negative values
> can never ever come up).

Agreed.

An even worse antipattern is using u8 or u16 just because it's the
smallest type that is enough for the range or whatever. But then it ends
up being signed int arithmetic assigned back to the small unsigned type
anyway.

> Also IIRC there was a Linus rant about "unsigned int i"
> but I can't find it now.

Another summary at [1].


BR,
Jani.


[1] https://hamstergene.github.io/posts/2021-10-30-do-not-use-unsigned-for-=
nonnegativity/



--=20
Jani Nikula, Intel
