Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F6E62C269
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 16:24:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1215C10E1A3;
	Wed, 16 Nov 2022 15:24:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE79410E1A3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 15:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668612238; x=1700148238;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=+izVJFEtstLEKAeJc/eZaesc5tWF6qBZ3EjMC/f5lS8=;
 b=aUvY1PuvMVpknX2JkSvBpl+Ztan9RjuY2ipLcc4331SNopNAqY6ojRq8
 dMPqJc+smm7LDo0GQ3DQW+JVSgxpQVJks/jw2gczwSOSjeFU/kDFBea1M
 3aFBVlbbD7YxQOS2gUGk9yNaobx3fYMuHBnS0Iamn/PGROTVgCqcuLznR
 ivtfYkV/xS4p2fPW1XrFs2k+nTcH5J/wc1wrbS4F6Ci3naN9roPRTU+5E
 gwydncv8sb1E3PN/QcW6b0FAhG5ofvqF56FK3nZhCtbA/s0nUldfLDT71
 SndaRFyiYP7seKFcwcjir7ySuuyVNLBTPWySMhSsWvQoWAyI8LFwhqYTl w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="314385273"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; d="scan'208";a="314385273"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2022 07:23:57 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="633661234"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; d="scan'208";a="633661234"
Received: from dariofax-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.59.5])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2022 07:23:54 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 2/3] drm/tests: helpers: Add module infos
In-Reply-To: <20221116151214.pnwszhhbassplbr3@houat>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221116091712.1309651-1-maxime@cerno.tech>
 <20221116091712.1309651-2-maxime@cerno.tech>
 <6dba9207-5ba2-5c73-e575-a7a86a2b9520@riseup.net>
 <874juz2kyk.fsf@intel.com> <20221116151214.pnwszhhbassplbr3@houat>
Date: Wed, 16 Nov 2022 17:23:51 +0200
Message-ID: <87tu2y2a9k.fsf@intel.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Florian Fainelli <f.fainelli@gmail.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 =?utf-8?Q?Ma=C3=ADra?= Canal <mairacanal@riseup.net>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 16 Nov 2022, Maxime Ripard <maxime@cerno.tech> wrote:
> On Wed, Nov 16, 2022 at 01:32:51PM +0200, Jani Nikula wrote:
>> On Wed, 16 Nov 2022, Ma=C3=ADra Canal <mairacanal@riseup.net> wrote:
>> > Hi Maxime,
>> >
>> > On 11/16/22 06:17, Maxime Ripard wrote:
>> >> The MODULE_LICENSE macro is missing from the kunit helpers file, thus
>> >> leading to a build error.
>> >>=20
>> >> Let's introduce it along with MODULE_AUTHOR.
>> >>=20
>> >> Fixes: 44a3928324e9 ("drm/tests: Add Kunit Helpers")
>> >> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> >> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>> >
>> > It would be nice to add the SPDX-License-Identifier tag in the source
>> > file as well. Besides that,
>>=20
>> It's not just nice, it's basically mandatory to add license boilerplate.
>>=20
>> Checkpatch would've warned about this. And actually about a lot of stuff
>> in the series.
>
> Right, sorry about that. I'll send additional patches to address the
> issues already in.
>
>> (And our CI checkpatch did too, although we don't send the replies to
>> the world, just intel-gfx [1].)
>
> I'm not sure how helpful it is though if the author is not a recipient
> of the report

It actually should be, but I have absolutely no idea why in this case it
decided to do

	To: "Mateusz Kwiatkowski" <kfyatek@gmail.com>

instead of you. Baffled.

BR,
Jani.


--=20
Jani Nikula, Intel Open Source Graphics Center
