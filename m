Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFEB48B151
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 16:51:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AC8A10E9B7;
	Tue, 11 Jan 2022 15:51:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0B5610E9B7;
 Tue, 11 Jan 2022 15:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641916279; x=1673452279;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=JACggQ4Hg/AiVxD9TybYUqpqUd8oz5ODWYs5odzMNxg=;
 b=HFae/O1rLm9AIMDRjAMjqVd6FJeGCNFc/zqM2lFrayQlrf7gn3rdb1FP
 18dhvGkcVTw8TlgHp2QvrgbEVnj/8SfH4FseGSb0kGtVcWszZRJje7g2T
 yq57bCCmAn057M1X7zPK8lsi6ho8MyEbPU/AYRHlPqomSO2dy0qzO92j3
 dWmnjqdoIxl9Jn97gHWBP6q7BDjf++NtnpEMFpK3P3Q9SUfV//mZt9nOx
 27j2ChCFwr+ULBuipkLUJtfY0yy6DOszBEwyqSLjCA809yFLBDIlBIici
 Gp0lWNs7qGRhjpw6FbJolVykolK+4CqhnycYGJ8Z5E8/mZ53ziRzSfcSX Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="243311054"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="243311054"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 07:51:17 -0800
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="528785408"
Received: from sjobrien-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.25.241])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 07:51:16 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/dp: note that DPCD 0x2002-0x2003
 match 0x200-0x201
In-Reply-To: <YdxYRGHhJ8l/5+kx@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220104184857.784563-1-jani.nikula@intel.com>
 <YdxYRGHhJ8l/5+kx@intel.com>
Date: Tue, 11 Jan 2022 17:51:12 +0200
Message-ID: <875yqq8e4v.fsf@intel.com>
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

On Mon, 10 Jan 2022, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Tue, Jan 04, 2022 at 08:48:56PM +0200, Jani Nikula wrote:
>> DP_SINK_COUNT_ESI and DP_DEVICE_SERVICE_IRQ_VECTOR_ESI0 have the same
>> contents as DP_SINK_COUNT and DP_DEVICE_SERVICE_IRQ_VECTOR,
>> respectively.
>
> IIRC there was an oversight in the earlier spec revisions that
> showed bit 7 as reserved for one of the locations. But looks like
> that got fixed.

Yeah. Thanks for the review, pushed both to drm-misc-next.

BR,
Jani.


>
> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
>>=20
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  include/drm/drm_dp_helper.h | 7 ++-----
>>  1 file changed, 2 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
>> index 30359e434c3f..98d020835b49 100644
>> --- a/include/drm/drm_dp_helper.h
>> +++ b/include/drm/drm_dp_helper.h
>> @@ -1038,11 +1038,8 @@ struct drm_panel;
>>  #define DP_SIDEBAND_MSG_UP_REQ_BASE	    0x1600   /* 1.2 MST */
>>=20=20
>>  /* DPRX Event Status Indicator */
>> -#define DP_SINK_COUNT_ESI		    0x2002   /* 1.2 */
>> -/* 0-5 sink count */
>> -# define DP_SINK_COUNT_CP_READY             (1 << 6)
>> -
>> -#define DP_DEVICE_SERVICE_IRQ_VECTOR_ESI0   0x2003   /* 1.2 */
>> +#define DP_SINK_COUNT_ESI                   0x2002   /* same as 0x200 */
>> +#define DP_DEVICE_SERVICE_IRQ_VECTOR_ESI0   0x2003   /* same as 0x201 */
>>=20=20
>>  #define DP_DEVICE_SERVICE_IRQ_VECTOR_ESI1   0x2004   /* 1.2 */
>>  # define DP_RX_GTC_MSTR_REQ_STATUS_CHANGE    (1 << 0)
>> --=20
>> 2.30.2

--=20
Jani Nikula, Intel Open Source Graphics Center
