Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04918AC0889
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 11:22:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4303310E866;
	Thu, 22 May 2025 09:22:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GdtmkOia";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9914E10E866
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 09:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747905767; x=1779441767;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=a80hXcGHLnEXqoaB3/i3Ak7XE5EBq2FHTMb5YZ4WKkU=;
 b=GdtmkOiayKoe+ana5X7NIiJxgoA0U2aYQwC6CCahaWeQHgtoddMgMxGe
 PARWlZCaN1ot+PQdUQgERP2JX0MNdYNZP3oyacpCladM9FaqJNbA//nwZ
 nvYB7HJuI9Ej3b/gBiaRrSlW+AnQKinzuWVhZ2zx1U2qfnDh6DNkS7Zn9
 /6ZPmPWEpsZoUnYs7G+f7cJbn9jiPXXjXxL7PSJrfSC1ILwKMBJEcUEUh
 C3/inV/tXy5e8zBxcBVr+hIFBkqtdw4qn9IFYOpg1xHxs7McOPutjcN/c
 90k04OyV0h7rBsORLaRkFUA9glXqbG6OsGyn7Qk1OMEBKHtwlIMgoeX19 g==;
X-CSE-ConnectionGUID: qDRNSBZRSIKCoWhFRR8j3A==
X-CSE-MsgGUID: JRrQZszyTQSwi3nMMv13fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="72445578"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="72445578"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 02:22:39 -0700
X-CSE-ConnectionGUID: ZF/aOTzKS164tKbdKmjWZQ==
X-CSE-MsgGUID: udRzaoqjTj25RI1WnsRiSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="145661444"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.112])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 02:22:33 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, "Hajda, Andrzej"
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej
 Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona
 Vetter <simona@ffwll.ch>, Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drm/bridge: fix build with CONFIG_OF=n
In-Reply-To: <SJ1PR11MB6129DAE64D41911F049AF98EB999A@SJ1PR11MB6129.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250522-devm_drm_put_bridge-fix-non-of-build-v1-1-a05234dea046@bootlin.com>
 <SJ1PR11MB6129DAE64D41911F049AF98EB999A@SJ1PR11MB6129.namprd11.prod.outlook.com>
Date: Thu, 22 May 2025 12:22:30 +0300
Message-ID: <87zff5rodl.fsf@intel.com>
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

On Thu, 22 May 2025, "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.=
com> wrote:
>> -----Original Message-----
>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of L=
uca
>> Ceresoli
>> Sent: Thursday, May 22, 2025 12:43 PM
>> To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>; Maxime Ripard
>> <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>;
>> Hajda, Andrzej <andrzej.hajda@intel.com>; Neil Armstrong
>> <neil.armstrong@linaro.org>; Robert Foss <rfoss@kernel.org>; Laurent
>> Pinchart <Laurent.pinchart@ideasonboard.com>; Jonas Karlman
>> <jonas@kwiboo.se>; Jernej Skrabec <jernej.skrabec@gmail.com>; David
>> Airlie <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; Ville Syrja=
la
>> <ville.syrjala@linux.intel.com>
>> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>; dri-
>> devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; Luca Ceresoli
>> <luca.ceresoli@bootlin.com>
>> Subject: [PATCH] drm/bridge: fix build with CONFIG_OF=3Dn
>>=20
>> Commit 5164553d739e ("drm/bridge: add devm_drm_put_bridge()") adds
>> two declarations for devm_drm_put_bridge():
>>=20
>>  1) an inline declaration in the #else branch of
>>     '#if defined(CONFIG_OF)...'
>>  2) one outside of the same #if
>>=20
>> This results in a build failure with CONFIG_OF=3Dn:
>>=20
>>   ../drivers/gpu/drm/drm_bridge.c:1406:6: error: redefinition of
>> =E2=80=98devm_drm_put_bridge=E2=80=99
>>=20
>> The function has nothing to do with OF, thus fix by removing declaration=
 1.
>
> LGTM. Fixes the build error.
>
> Tested-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

Ditto. Please merge.

BR,
Jani.

>
>
>>=20
>> Fixes: 5164553d739e ("drm/bridge: add devm_drm_put_bridge()")
>> Reported-by: Ville Syrjala <ville.syrjala@linux.intel.com>
>> Closes: https://oftc.catirclogs.org/dri-devel/2025-05-21#34288266;
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> ---
>>  include/drm/drm_bridge.h | 2 --
>>  1 file changed, 2 deletions(-)
>>=20
>> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h index
>> 464da28f9134f0fcece5c72a8c5fe7f3e42c7e3d..0af5db244db8580ea0c9af1d9a
>> 373b7bf62ee699 100644
>> --- a/include/drm/drm_bridge.h
>> +++ b/include/drm/drm_bridge.h
>> @@ -1311,8 +1311,6 @@ static inline struct drm_bridge
>> *devm_drm_of_get_bridge(struct device *dev,
>>  	return ERR_PTR(-ENODEV);
>>  }
>>=20
>> -static inline void devm_drm_put_bridge(struct device *dev, struct
>> drm_bridge *bridge) {}
>> -
>>  static inline struct drm_bridge *drmm_of_get_bridge(struct drm_device
>> *drm,
>>  						     struct device_node *node,
>>  						     u32 port,
>>=20
>> ---
>> base-commit: a3436f63aa4f93b043a970cc72a196a501191ecc
>> change-id: 20250522-devm_drm_put_bridge-fix-non-of-build-fbb67d28494c
>>=20
>> Best regards,
>> --
>> Luca Ceresoli <luca.ceresoli@bootlin.com>
>

--=20
Jani Nikula, Intel
