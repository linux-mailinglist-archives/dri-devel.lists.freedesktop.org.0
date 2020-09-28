Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D52D27B2D6
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 19:13:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F8689F5F;
	Mon, 28 Sep 2020 17:13:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C01389F5F;
 Mon, 28 Sep 2020 17:13:52 +0000 (UTC)
IronPort-SDR: glOIpl98U9pSJTeW8wYkzErGq+gZDXyjHSRkdKslRcunV+im4NKibY/4nvKp5VHiMZZPwkSuIU
 HUH5DGZZ2xhA==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="226178615"
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; d="scan'208";a="226178615"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2020 10:13:50 -0700
IronPort-SDR: RgT6PVG/mrKNG0UWJKclspgMmLQsBCPYUaHQW0Zl431vLcx2fkuRZxvDWsp+OSloIZ97vSklIN
 LlZrZzkwaxZA==
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; d="scan'208";a="456914961"
Received: from lizwalsh-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.251.86.12])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2020 10:13:45 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Surendrakumar Upadhyay\,
 TejaskumarX" <tejaskumarx.surendrakumar.upadhyay@intel.com>, "Vivi\,
 Rodrigo" <rodrigo.vivi@intel.com>, "airlied\@linux.ie" <airlied@linux.ie>,
 "daniel\@ffwll.ch" <daniel@ffwll.ch>,
 "intel-gfx\@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel\@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel\@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Ausmus\,
 James" <james.ausmus@intel.com>, "Roper\,
 Matthew D" <matthew.d.roper@intel.com>, "Souza\, Jose" <jose.souza@intel.com>,
 "ville.syrjala\@linux.intel.com" <ville.syrjala@linux.intel.com>, "De Marchi\,
 Lucas" <lucas.demarchi@intel.com>, "Pandey\, Hariom" <hariom.pandey@intel.com>
Subject: Re: [PATCH 1/2] drm/i915/jsl: Split EHL/JSL platform info and PCI ids
In-Reply-To: <SN6PR11MB3421571FA9A490C67E0E9D82DF350@SN6PR11MB3421.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200928080931.246347-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <20200928080931.246347-2-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <87d026owdq.fsf@intel.com>
 <SN6PR11MB3421571FA9A490C67E0E9D82DF350@SN6PR11MB3421.namprd11.prod.outlook.com>
Date: Mon, 28 Sep 2020 20:14:02 +0300
Message-ID: <874knhq0x1.fsf@intel.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 28 Sep 2020, "Surendrakumar Upadhyay, TejaskumarX" <tejaskumarx.surendrakumar.upadhyay@intel.com> wrote:
> ________________________________
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: Monday, September 28, 2020 7:07 PM
> To: Surendrakumar Upadhyay, TejaskumarX <tejaskumarx.surendrakumar.upadhyay@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; airlied@linux.ie <airlied@linux.ie>; daniel@ffwll.ch <daniel@ffwll.ch>; intel-gfx@lists.freedesktop.org <intel-gfx@lists.freedesktop.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; Ausmus, James <james.ausmus@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>; Souza, Jose <jose.souza@intel.com>; ville.syrjala@linux.intel.com <ville.syrjala@linux.intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>; Pandey, Hariom <hariom.pandey@intel.com>
> Subject: Re: [PATCH 1/2] drm/i915/jsl: Split EHL/JSL platform info and PCI ids

Please fix your email quoting when interacting on the public lists.

>
> On Mon, 28 Sep 2020, Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com> wrote:
>> Split the basic platform definition, macros, and PCI IDs to
>> differentiate between EHL and JSL platforms.
>>
>> Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
>> ---
>>  drivers/gpu/drm/i915/i915_drv.h          | 4 +++-
>>  drivers/gpu/drm/i915/i915_pci.c          | 9 +++++++++
>>  drivers/gpu/drm/i915/intel_device_info.c | 1 +
>>  drivers/gpu/drm/i915/intel_device_info.h | 1 +
>>  include/drm/i915_pciids.h                | 9 ++++++---
>>  5 files changed, 20 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
>> index 72a9449b674e..4f20acebb038 100644
>> --- a/drivers/gpu/drm/i915/i915_drv.h
>> +++ b/drivers/gpu/drm/i915/i915_drv.h
>> @@ -1417,7 +1417,9 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>>  #define IS_COMETLAKE(dev_priv)       IS_PLATFORM(dev_priv, INTEL_COMETLAKE)
>>  #define IS_CANNONLAKE(dev_priv)      IS_PLATFORM(dev_priv, INTEL_CANNONLAKE)
>>  #define IS_ICELAKE(dev_priv) IS_PLATFORM(dev_priv, INTEL_ICELAKE)
>> -#define IS_ELKHARTLAKE(dev_priv)     IS_PLATFORM(dev_priv, INTEL_ELKHARTLAKE)
>> +#define IS_ELKHARTLAKE(dev_priv) (IS_PLATFORM(dev_priv, INTEL_ELKHARTLAKE) || \
>> +                             IS_PLATFORM(dev_priv, INTEL_JASPERLAKE))
>> +#define IS_JASPERLAKE(dev_priv)      IS_PLATFORM(dev_priv, INTEL_JASPERLAKE)
>
> I think we've learned from history that we want the platform checks to
> be independent. I.e. if you need to split ELK and JSP, you need to make
> IS_ELKHARTLAKE() match *only* ELK, and you need to replace every current
> IS_ELKHARTLAKE() check with IS_ELKHARTLAKE() || IS_JASPERLAKE().
>
> We've been here before, and we've thought before that we can get by with
> the minimal change. It's just postponing the inevitable and generates
> confusion.
>
> BR,
> Jani.
>
> Tejas : Replacing IS_ELKHARTLAKE() || IS_JASPERLAKE() everywhere will
> make lot of changes at each place. To avoid huge change and to
> differentiate between platforms we have taken this way. Do you think
> we still change it everywhere? Do you have example where it can harm
> this change?

If you need to differentiate between the two platforms, IS_ELKHARTLAKE()
must mean only ELK and IS_JASPERLAKE() must mean only JSP.

It's non-negotiable. We've made the mistake before, we're not doing it
again.

There are 32 references to IS_ELKHARTLAKE(). It's slightly painful, but
the alternative is worse.


BR,
Jani.


>
>>  #define IS_TIGERLAKE(dev_priv)       IS_PLATFORM(dev_priv, INTEL_TIGERLAKE)
>>  #define IS_ROCKETLAKE(dev_priv)      IS_PLATFORM(dev_priv, INTEL_ROCKETLAKE)
>>  #define IS_DG1(dev_priv)        IS_PLATFORM(dev_priv, INTEL_DG1)
>> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
>> index 366ddfc8df6b..8690b69fcf33 100644
>> --- a/drivers/gpu/drm/i915/i915_pci.c
>> +++ b/drivers/gpu/drm/i915/i915_pci.c
>> @@ -846,6 +846,14 @@ static const struct intel_device_info ehl_info = {
>>        .ppgtt_size = 36,
>>  };
>>
>> +static const struct intel_device_info jsl_info = {
>> +     GEN11_FEATURES,
>> +     PLATFORM(INTEL_JASPERLAKE),
>> +     .require_force_probe = 1,
>> +     .platform_engine_mask = BIT(RCS0) | BIT(BCS0) | BIT(VCS0) | BIT(VECS0),
>> +     .ppgtt_size = 36,
>> +};
>> +
>>  #define GEN12_FEATURES \
>>        GEN11_FEATURES, \
>>        GEN(12), \
>> @@ -985,6 +993,7 @@ static const struct pci_device_id pciidlist[] = {
>>        INTEL_CNL_IDS(&cnl_info),
>>        INTEL_ICL_11_IDS(&icl_info),
>>        INTEL_EHL_IDS(&ehl_info),
>> +     INTEL_JSL_IDS(&jsl_info),
>>        INTEL_TGL_12_IDS(&tgl_info),
>>        INTEL_RKL_IDS(&rkl_info),
>>        {0, 0, 0}
>> diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
>> index adc836f15fde..e67cec8fa2aa 100644
>> --- a/drivers/gpu/drm/i915/intel_device_info.c
>> +++ b/drivers/gpu/drm/i915/intel_device_info.c
>> @@ -62,6 +62,7 @@ static const char * const platform_names[] = {
>>        PLATFORM_NAME(CANNONLAKE),
>>        PLATFORM_NAME(ICELAKE),
>>        PLATFORM_NAME(ELKHARTLAKE),
>> +     PLATFORM_NAME(JASPERLAKE),
>>        PLATFORM_NAME(TIGERLAKE),
>>        PLATFORM_NAME(ROCKETLAKE),
>>        PLATFORM_NAME(DG1),
>> diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
>> index 6a3d607218aa..d92fa041c700 100644
>> --- a/drivers/gpu/drm/i915/intel_device_info.h
>> +++ b/drivers/gpu/drm/i915/intel_device_info.h
>> @@ -79,6 +79,7 @@ enum intel_platform {
>>        /* gen11 */
>>        INTEL_ICELAKE,
>>        INTEL_ELKHARTLAKE,
>> +     INTEL_JASPERLAKE,
>>        /* gen12 */
>>        INTEL_TIGERLAKE,
>>        INTEL_ROCKETLAKE,
>> diff --git a/include/drm/i915_pciids.h b/include/drm/i915_pciids.h
>> index 7eeecb07c9a1..1b5e09cfa11e 100644
>> --- a/include/drm/i915_pciids.h
>> +++ b/include/drm/i915_pciids.h
>> @@ -579,15 +579,18 @@
>>        INTEL_VGA_DEVICE(0x8A51, info), \
>>        INTEL_VGA_DEVICE(0x8A5D, info)
>>
>> -/* EHL/JSL */
>> +/* EHL */
>>  #define INTEL_EHL_IDS(info) \
>>        INTEL_VGA_DEVICE(0x4500, info), \
>>        INTEL_VGA_DEVICE(0x4571, info), \
>>        INTEL_VGA_DEVICE(0x4551, info), \
>>        INTEL_VGA_DEVICE(0x4541, info), \
>> -     INTEL_VGA_DEVICE(0x4E71, info), \
>>        INTEL_VGA_DEVICE(0x4557, info), \
>> -     INTEL_VGA_DEVICE(0x4555, info), \
>> +     INTEL_VGA_DEVICE(0x4555, info)
>> +
>> +/* JSL */
>> +#define INTEL_JSL_IDS(info) \
>> +     INTEL_VGA_DEVICE(0x4E71, info), \
>>        INTEL_VGA_DEVICE(0x4E61, info), \
>>        INTEL_VGA_DEVICE(0x4E57, info), \
>>        INTEL_VGA_DEVICE(0x4E55, info), \
>
> --
> Jani Nikula, Intel Open Source Graphics Center

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
