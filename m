Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B986419388
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 13:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 657A589EBD;
	Mon, 27 Sep 2021 11:45:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F69489EB4;
 Mon, 27 Sep 2021 11:45:08 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10119"; a="224516307"
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="224516307"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 04:45:07 -0700
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="553159862"
Received: from susuale1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.36.178])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 04:45:02 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc: joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Ville =?utf-8?B?U3ly?=
 =?utf-8?B?asOkbMOk?= <ville.syrjala@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Imre Deak <imre.deak@intel.com>, Uma Shankar
 <uma.shankar@intel.com>, Matt Roper <matthew.d.roper@intel.com>, Kai
 Vehmanen <kai.vehmanen@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915/audio: Use BIOS provided value for RKL HDA link
In-Reply-To: <alpine.DEB.2.22.394.2109061031450.3554566@eliteleevi.tm.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210906041300.508458-1-kai.heng.feng@canonical.com>
 <alpine.DEB.2.22.394.2109061031450.3554566@eliteleevi.tm.intel.com>
Date: Mon, 27 Sep 2021 14:44:59 +0300
Message-ID: <875yums0n8.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 06 Sep 2021, Kai Vehmanen <kai.vehmanen@linux.intel.com> wrote:
> Hi,
>
> On Mon, 6 Sep 2021, Kai-Heng Feng wrote:
>
>> Commit 989634fb49ad ("drm/i915/audio: set HDA link parameters in
>> driver") makes HDMI audio on Lenovo P350 disappear.
>> 
>> So in addition to TGL, extend the logic to RKL to use BIOS provided
>> value to fix the regression.
>
> thanks Kai-Heng! We were not aware of commercial RKL systems following the
> old BIOS guidance, but given you just hit one, then this definitely is
> needed:
>
> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>          

This had fallen between the cracks, pushed now. Thanks for the patch and
review.

BR,
Jani.

>
> Br, Kai

-- 
Jani Nikula, Intel Open Source Graphics Center
