Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 938C71A1E32
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 11:46:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6687B6E9FE;
	Wed,  8 Apr 2020 09:46:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D61F6E9FE;
 Wed,  8 Apr 2020 09:46:37 +0000 (UTC)
IronPort-SDR: pEL0szdkR53EDiULBPnwDe42WX+0dvhIqhFVdmmkvfVZnCCMkK+gW1LaOGwfO6sxKeO1UrQR60
 EFYcmpCTXEwA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2020 02:46:36 -0700
IronPort-SDR: XdNx99FG+N2SvwchpC71a/iJRjHJFHemBiys+nddzuOXTl9M8XIfO0MdqDzP3Xi09oOV0TxcbA
 v3ZM3GV6mGaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,357,1580803200"; d="scan'208";a="297193138"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Apr 2020 02:46:36 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 8 Apr 2020 02:46:36 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 8 Apr 2020 02:46:35 -0700
Received: from bgsmsx106.gar.corp.intel.com (10.223.43.196) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 8 Apr 2020 02:46:35 -0700
Received: from BGSMSX108.gar.corp.intel.com ([169.254.8.65]) by
 BGSMSX106.gar.corp.intel.com ([169.254.1.82]) with mapi id 14.03.0439.000;
 Wed, 8 Apr 2020 15:16:32 +0530
From: "Kulkarni, Vandita" <vandita.kulkarni@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH RESEND 1/7] drm/dsc: use rc_model_size from DSC config
 for PPS
Thread-Topic: [PATCH RESEND 1/7] drm/dsc: use rc_model_size from DSC config
 for PPS
Thread-Index: AQHWBDU0SmW9BE1VVUahVNAS4weonqhvAxKQ
Date: Wed, 8 Apr 2020 09:46:31 +0000
Message-ID: <57510F3E2013164E925CD03ED7512A3B80A883C7@BGSMSX108.gar.corp.intel.com>
References: <20200327124229.26461-1-jani.nikula@intel.com>
In-Reply-To: <20200327124229.26461-1-jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.223.10.10]
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>, "Navare, Manasi
 D" <manasi.d.navare@intel.com>, Harry Wentland <hwentlan@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: Jani Nikula <jani.nikula@intel.com>
> Sent: Friday, March 27, 2020 6:12 PM
> To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: Nikula, Jani <jani.nikula@intel.com>; Alex Deucher
> <alexdeucher@gmail.com>; Harry Wentland <hwentlan@amd.com>; Navare,
> Manasi D <manasi.d.navare@intel.com>; Kulkarni, Vandita
> <vandita.kulkarni@intel.com>
> Subject: [PATCH RESEND 1/7] drm/dsc: use rc_model_size from DSC config for
> PPS
> 
> The PPS is supposed to reflect the DSC config instead of hard coding the
> rc_model_size. Make it so.
> 
> Currently all users of drm_dsc_pps_payload_pack() hard code the size to
> 8192 also in the DSC config, so this change should have no impact, other than
> allowing the drivers to use other sizes as needed.
> 
> Cc: Alex Deucher <alexdeucher@gmail.com>
> Cc: Harry Wentland <hwentlan@amd.com>
> Cc: Manasi Navare <manasi.d.navare@intel.com>
> Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Looks good to me.
Reviewed-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
> ---
>  drivers/gpu/drm/drm_dsc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_dsc.c b/drivers/gpu/drm/drm_dsc.c index
> 4a475d9696ff..09afbc01ea94 100644
> --- a/drivers/gpu/drm/drm_dsc.c
> +++ b/drivers/gpu/drm/drm_dsc.c
> @@ -186,8 +186,7 @@ void drm_dsc_pps_payload_pack(struct
> drm_dsc_picture_parameter_set *pps_payload,
>  	pps_payload->flatness_max_qp = dsc_cfg->flatness_max_qp;
> 
>  	/* PPS 38, 39 */
> -	pps_payload->rc_model_size =
> -		cpu_to_be16(DSC_RC_MODEL_SIZE_CONST);
> +	pps_payload->rc_model_size = cpu_to_be16(dsc_cfg->rc_model_size);
> 
>  	/* PPS 40 */
>  	pps_payload->rc_edge_factor = DSC_RC_EDGE_FACTOR_CONST;
> --
> 2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
