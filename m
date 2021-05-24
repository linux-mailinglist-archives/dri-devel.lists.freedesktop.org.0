Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 440CD38E62E
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 14:05:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F12936E2DF;
	Mon, 24 May 2021 12:05:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9208F6E2DF;
 Mon, 24 May 2021 12:05:29 +0000 (UTC)
IronPort-SDR: TbGK4Qe8d2EhPh67Sx8KSYvGd2OILttg52gyr0XjKpF92seJGBwHYJjt5eg9do22G3qlnOD/Nj
 w8ScGESRTURg==
X-IronPort-AV: E=McAfee;i="6200,9189,9993"; a="263127461"
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="263127461"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 05:05:28 -0700
IronPort-SDR: FTJcyCi62rSOS6abyxdMyktqHhLKitQag9FxkpNOKFdiLOWAACHUwrr8L+57pPY/k4V6W7pQCH
 15/2Jntr6tUA==
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="475840387"
Received: from jaherrex-mobl2.amr.corp.intel.com (HELO localhost)
 ([10.252.50.169])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 05:05:25 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Deucher\, Alexander" <Alexander.Deucher@amd.com>,
 "dim-tools\@lists.freedesktop.org" <dim-tools@lists.freedesktop.org>
Subject: RE: [drm-rerere PATCH] nightly.conf: drop amd branches from drm-tip
In-Reply-To: <87h7iscpet.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210519084932.8666-1-jani.nikula@intel.com>
 <MN2PR12MB44884924C665EE6EDF3E17A2F72B9@MN2PR12MB4488.namprd12.prod.outlook.com>
 <87h7iscpet.fsf@intel.com>
Date: Mon, 24 May 2021 15:05:22 +0300
Message-ID: <87eedwcp6l.fsf@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "Koenig, 
 Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 24 May 2021, Jani Nikula <jani.nikula@intel.com> wrote:
> On Wed, 19 May 2021, "Deucher, Alexander" <Alexander.Deucher@amd.com> wro=
te:
>> [AMD Public Use]
>>
>>> -----Original Message-----
>>> From: Jani Nikula <jani.nikula@intel.com>
>>> Sent: Wednesday, May 19, 2021 4:50 AM
>>> To: dim-tools@lists.freedesktop.org
>>> Cc: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org;
>>> jani.nikula@intel.com; Deucher, Alexander
>>> <Alexander.Deucher@amd.com>; Koenig, Christian
>>> <Christian.Koenig@amd.com>; Pan; Pan, Xinhui <Xinhui.Pan@amd.com>;
>>> Daniel Vetter <daniel.vetter@ffwll.ch>
>>> Subject: [drm-rerere PATCH] nightly.conf: drop amd branches from drm-tip
>>>=20
>>> We've had a stale repo for amd in drm-tip since around v4.15 i.e. for m=
ore
>>> than three years. Nobody seems to notice or care. Drop the amd branches
>>> from drm-tip.
>>>=20
>>> Having the current amd branches in drm-tip would be nice to have, if on=
ly to
>>> have a common drm integration tree. However, maintaining that has a cost
>>> due to the inevitable conflicts. We can add the branches back if and wh=
en
>>> there's interest in sharing the burden.
>>>=20
>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
>>> Cc: Pan, Xinhui <Xinhui.Pan@amd.com>
>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>
>> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
>
> Thanks, pushed out and rebuilt drm-tip.

Note that drm-tip is unchanged after this, apart from the
integration-manifest.


BR,
Jani.

--=20
Jani Nikula, Intel Open Source Graphics Center
