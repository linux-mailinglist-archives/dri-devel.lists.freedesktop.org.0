Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D00AB9EB0B9
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 13:25:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CBCF10E38E;
	Tue, 10 Dec 2024 12:25:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jhx7NFto";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6281C10E38E;
 Tue, 10 Dec 2024 12:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733833506; x=1765369506;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=PtpvYsMJyPeHOPuFEZLTbXjEUkdt+zwt+rEBAt8uJ3Y=;
 b=Jhx7NFtoD8oOjenpzGkRGx0lrQh2+11AMRf7Rz9LgfrQ08N3r6cOF+mt
 ZUbxd9jbcP4n9t+Z76nwMlK+ZyYajDbcE195wAgQKYXxuurmp+sBoQsVF
 h4icikCfzd+MUDFYozL4I14lNRC6Hug0LgAADvm4bhwCH8pXF8YVgWdCJ
 Gesh7Oa5nC+tfzn4JJ39BkHB8rs3xce1/3wx52VjQszN3b9l1WPJcimR2
 r0V8BEFjwlaOQSDVyfnKdWGkGvYY2IS65hyyqW/b88c8dLSna/GTk3AJ0
 /+bDRQEF1CgAm6q/FAwkKPb+rOjKygTbaxk6KNZi8ibFcUybw/YXBxZCT Q==;
X-CSE-ConnectionGUID: HKfhRgB3T8KfiVq5yz8F9w==
X-CSE-MsgGUID: 7jW+1YqLTB+O7zSddLTI9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="44642682"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="44642682"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 04:25:05 -0800
X-CSE-ConnectionGUID: kWML3+0tSpilYVrYcaMz1A==
X-CSE-MsgGUID: 8MwiVfTRSpmx3tv+RKDm8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="126296168"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.242])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 04:24:59 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Genes Lists <lists@sapience.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
 torvalds@linux-foundation.org, stable@vger.kernel.org,
 linux-media@vger.kernel.org, bingbu.cao@intel.com, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: Linux 6.12.4 - crash dma_alloc_attrs+0x12b via ipu6
In-Reply-To: <c1805642a6c5da6fef3927c70358c8cb851d2784.camel@sapience.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <2024120917-vision-outcast-85f2@gregkh>
 <c0e94be466b367f1a3cfdc3cb7b1a4f47e5953ae.camel@sapience.com>
 <Z1fqitbWlmELb5pj@kekkonen.localdomain> <87seqvzzg6.fsf@intel.com>
 <c1805642a6c5da6fef3927c70358c8cb851d2784.camel@sapience.com>
Date: Tue, 10 Dec 2024 14:24:56 +0200
Message-ID: <87bjxjzpwn.fsf@intel.com>
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

On Tue, 10 Dec 2024, Genes Lists <lists@sapience.com> wrote:
> On Tue, 2024-12-10 at 10:58 +0200, Jani Nikula wrote:
>> On Tue, 10 Dec 2024, Sakari Ailus <sakari.ailus@linux.intel.com>
>> wrote:
>> > Hi,
>> >=20
>> > > ...
>> > > FYI 6.12.4 got a crash shortly after booting in dma_alloc_attrs -
>> > > maybe
>> > > triggered in ipu6_probe. Crash only happened on laptop with ipu6.
>> > > All
>> > > other machines are running fine.
>> >=20
>> > Have you read the dmesg further than the IPU6 related warning? The
>> > IPU6
>> > driver won't work (maybe not even probe?) but if the system
>> > crashes, it
>> > appears unlikely the IPU6 drivers would have something to do with
>> > that.
>> > Look for warnings on linked list corruption later, they seem to be
>> > coming
>> > from the i915 driver.
>>=20
>> And the list corruption is actually happening in
>> cpu_latency_qos_update_request(). I don't see any i915 changes in
>> 6.12.4
>> that could cause it.
>>=20
>> I guess the question is, when did it work? Did 6.12.3 work?
>>=20
>>=20
>> BR,
>> Jani.
>
>
>  - 6.12.1 worked
>
>  - mainline - works (but only with i915 patch set [1] otherwise there
> are no graphics at all)
>
>     [1] https://patchwork.freedesktop.org/series/141911/
>
> - 6.12.3 - crashed (i see i915 not ipu6) and again it has      =C2=A0
>     cpu_latency_qos_update_request+0x61/0xc0

Thanks for testing.

There are no changes to either i915 or kernel/power between 6.12.1 and
6.12.4.

There are some changes to drm core, but none that could explain this.

Maybe try the same kernels a few more times to see if it's really
deterministic? Not that I have obvious ideas where to go from there, but
it's a clue nonetheless.

BR,
Jani.


--=20
Jani Nikula, Intel
