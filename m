Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7A617A20E
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 10:15:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B418E6EBAF;
	Thu,  5 Mar 2020 09:15:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11C716E171;
 Thu,  5 Mar 2020 09:15:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Mar 2020 01:15:02 -0800
X-IronPort-AV: E=Sophos;i="5.70,517,1574150400"; d="scan'208";a="234355748"
Received: from bennur-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.38.13])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Mar 2020 01:14:54 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Rajat Jain <rajatja@google.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Chris
 Wilson
 <chris@chris-wilson.co.uk>, Imre Deak <imre.deak@intel.com>, =?utf-8?Q?Jo?=
 =?utf-8?Q?s=C3=A9?= Roberto
 de Souza <jose.souza@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 gregkh@linuxfoundation.org, mathewk@google.com, Daniel Thompson
 <daniel.thompson@linaro.org>, Jonathan Corbet <corbet@lwn.net>, Pavel
 Machek <pavel@denx.de>, seanpaul@google.com, Duncan Laurie
 <dlaurie@google.com>, jsbarnes@google.com, Thierry Reding
 <thierry.reding@gmail.com>, mpearson@lenovo.com, Nitin Joshi1
 <njoshi1@lenovo.com>, Sugumaran Lacshiminarayanan
 <slacshiminar@lenovo.com>, Tomoki Maruichi <maruichit@lenovo.com>
Subject: Re: [PATCH v6 1/3] intel_acpi: Rename drm_dev local variable to dev
In-Reply-To: <20200305012338.219746-2-rajatja@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200305012338.219746-1-rajatja@google.com>
 <20200305012338.219746-2-rajatja@google.com>
Date: Thu, 05 Mar 2020 11:14:55 +0200
Message-ID: <87r1y7noxc.fsf@intel.com>
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
Cc: Rajat Jain <rajatja@google.com>, rajatxjain@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 04 Mar 2020, Rajat Jain <rajatja@google.com> wrote:
> Change the struct drm_device * local variable from drm_dev to dev
> per the feedback received here:
> https://lkml.org/lkml/2020/1/24/1143
>
> Signed-off-by: Rajat Jain <rajatja@google.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
> v6: Initial patch (v6 to match other patches in the set) 
>
>  drivers/gpu/drm/i915/display/intel_acpi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_acpi.c b/drivers/gpu/drm/i915/display/intel_acpi.c
> index e21fb14d5e07b..3e6831cca4ac1 100644
> --- a/drivers/gpu/drm/i915/display/intel_acpi.c
> +++ b/drivers/gpu/drm/i915/display/intel_acpi.c
> @@ -224,13 +224,13 @@ static u32 acpi_display_type(struct intel_connector *connector)
>  
>  void intel_acpi_device_id_update(struct drm_i915_private *dev_priv)
>  {
> -	struct drm_device *drm_dev = &dev_priv->drm;
> +	struct drm_device *dev = &dev_priv->drm;
>  	struct intel_connector *connector;
>  	struct drm_connector_list_iter conn_iter;
>  	u8 display_index[16] = {};
>  
>  	/* Populate the ACPI IDs for all connectors for a given drm_device */
> -	drm_connector_list_iter_begin(drm_dev, &conn_iter);
> +	drm_connector_list_iter_begin(dev, &conn_iter);
>  	for_each_intel_connector_iter(connector, &conn_iter) {
>  		u32 device_id, type;

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
