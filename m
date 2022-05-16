Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DA7527FD8
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 10:39:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B165110EEE7;
	Mon, 16 May 2022 08:39:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E5910EEE7;
 Mon, 16 May 2022 08:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652690384; x=1684226384;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=5CTdwfcLiJMPMwuDed5a3j7rUbf91iVNCdTl8e6u4sU=;
 b=nMNVFrvviprGNwph/MooV7XEOPblJgmIa847cGDzu+NVfjsYyX4xZYLJ
 MZEECbZFcZ3rvHWbbC8EVZAOjFaLwc2R9Z/iXaj4stcQ5p/YY3jz+ljT+
 4hSRnUo6Mt+WDnaNd/A0DTERI1dV+VhwLVwrUr0yKsz8yASSqoKUL4xEv
 ZzGpJR3DRD6NEBOs9F7MI46HbLV6JOvh9rLdXlFS9tsl0Z/T39GqRTO7l
 yp55O8l2fJ+3G9fQV7wBKODGwQaYH3HE0rE+95oaUvjb9gqSRK2/ertf3
 a4bY+DtS2xA0u5Dcs9hdun2zXu9Fzc+KRfjCQZP4q2zoDRZ5ZYoizRwTQ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="269594801"
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="269594801"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 01:39:43 -0700
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="568223809"
Received: from jrozansk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.130.253])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 01:39:40 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>, "Modem, Bhanuprakash"
 <bhanuprakash.modem@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [Intel-gfx] [V2 2/3] drm/i915/display/debug: Expose crtc
 current bpc via debugfs
In-Reply-To: <DM6PR11MB31779A2700030C710CDAC877BAED9@DM6PR11MB3177.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220411095129.1652096-1-bhanuprakash.modem@intel.com>
 <20220411095129.1652096-3-bhanuprakash.modem@intel.com>
 <DM6PR11MB31779A2700030C710CDAC877BAED9@DM6PR11MB3177.namprd11.prod.outlook.com>
Date: Mon, 16 May 2022 11:39:37 +0300
Message-ID: <87lev1hnw6.fsf@intel.com>
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

On Tue, 12 Apr 2022, "Murthy, Arun R" <arun.r.murthy@intel.com> wrote:
>> -----Original Message-----
>> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of
>> Bhanuprakash Modem
>> Sent: Monday, April 11, 2022 3:21 PM
>> To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; am=
d-
>> gfx@lists.freedesktop.org; jani.nikula@linux.intel.com;
>> ville.syrjala@linux.intel.com; harry.wentland@amd.com; Sharma, Swati2
>> <swati2.sharma@intel.com>
>> Subject: [Intel-gfx] [V2 2/3] drm/i915/display/debug: Expose crtc curren=
t bpc
>> via debugfs
>>=20
>> This new debugfs will expose the currently using bpc by crtc.
>> It is very useful for verifying whether we enter the correct output colo=
r depth
>> from IGT.
>>=20
>> This patch will also add the connector's max supported bpc to
>> "i915_display_info" debugfs.
>>=20
>> Example:
>> cat /sys/kernel/debug/dri/0/crtc-0/i915_current_bpc
>> Current: 8
>>=20
>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> Cc: Uma Shankar <uma.shankar@intel.com>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>
> Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>

Acked-by: Jani Nikula <jani.nikula@intel.com>

for merging this via drm-misc-next.



--=20
Jani Nikula, Intel Open Source Graphics Center
