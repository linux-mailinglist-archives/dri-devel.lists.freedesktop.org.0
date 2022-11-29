Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BC563C17B
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 14:54:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14B0B10E079;
	Tue, 29 Nov 2022 13:54:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86EF210E3D3;
 Tue, 29 Nov 2022 13:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669730057; x=1701266057;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=c6ovBfL5Y9An6taoGh5gbo5PtGy7u1KksUY6ijqUNYk=;
 b=kv81I0R97/uHnOtxdkRCkZrrUdYsJ7g81uQKug0cnpVF8PYpiFfa4c6N
 cNtRBrsDMSvl6k1jnIt1E+zhqMiMy+r63QuJANcteH4l3ZaR0ZebOkKDt
 1Gq9S+vRFd8Dne1vWcjDTNKtK/2HfM47GTYj4+34nhtjleOQDj18K/hp4
 z0ZAJuNXC8QiORi1tfLPXyCP18Avf4MSw47tPz+c1HY6Kz0t/VWs+Ex77
 /43UnauzIDO+wjbVCDHzA5GQD5oy9sT+zgO8eWJiXFukoN41UoNKqZzES
 zYcR1kqcNKE8eU3CuG3X+z7k7M+Hk5T1TdTLvsLgA6KPHvdAgLfd99PuY Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="312736788"
X-IronPort-AV: E=Sophos;i="5.96,203,1665471600"; d="scan'208";a="312736788"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2022 05:54:17 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="749853249"
X-IronPort-AV: E=Sophos;i="5.96,203,1665471600"; d="scan'208";a="749853249"
Received: from lclaesso-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.53.28])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2022 05:54:15 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/audio: make drm_audio_component.h
 self-contained
In-Reply-To: <Y34nzGO+2EDiTDgg@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221123130932.3863985-1-jani.nikula@intel.com>
 <Y34nzGO+2EDiTDgg@intel.com>
Date: Tue, 29 Nov 2022 15:54:13 +0200
Message-ID: <87v8mx3lyy.fsf@intel.com>
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

On Wed, 23 Nov 2022, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Wed, Nov 23, 2022 at 03:09:32PM +0200, Jani Nikula wrote:
>> The file uses bool and struct completion, include the relevant headers.
>>=20
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Thanks, pushed to drm-misc-next.

BR,
Jani.

>
>> ---
>>  include/drm/drm_audio_component.h | 3 +++
>>  1 file changed, 3 insertions(+)
>>=20
>> diff --git a/include/drm/drm_audio_component.h b/include/drm/drm_audio_c=
omponent.h
>> index 0d36bfd1a4cd..5a4cd1fa8e2a 100644
>> --- a/include/drm/drm_audio_component.h
>> +++ b/include/drm/drm_audio_component.h
>> @@ -4,6 +4,9 @@
>>  #ifndef _DRM_AUDIO_COMPONENT_H_
>>  #define _DRM_AUDIO_COMPONENT_H_
>>=20=20
>> +#include <linux/completion.h>
>> +#include <linux/types.h>
>> +
>>  struct drm_audio_component;
>>  struct device;
>>=20=20
>> --=20
>> 2.34.1

--=20
Jani Nikula, Intel Open Source Graphics Center
