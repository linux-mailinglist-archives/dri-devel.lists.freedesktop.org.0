Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7041727C7
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 19:39:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 997F86EBEC;
	Thu, 27 Feb 2020 18:39:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 806AC6EBEC;
 Thu, 27 Feb 2020 18:39:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RxaLZAsdRw8u3TpEAdhNrRgDFyfTVW+cu1nuo/IQew7t9rRAGqFngKKlkBwTiGaDS95IGbOcD4969/+lKbfUJ+pJ8AL2HxQrL9/JWmeQz7G1PsgbSFgVGdAdoLlpWF2wWk3IodYFQBEnal6q/4EGcQX+ROn9gaRd78jZiwDjt1STHNL+nspQSlprQvtPxgKUF2a29O/nxlc8Bgko7rDrdhp7xB79wp6gNdY7ZsmOmTksPnjJJDbE62lKEWOw6qFnCdGTaFVqPTdSKcPCi6m6hKqh0lRT7vaJaFgtZpk3FxFBm8c4OLerTCZY7xC443Twvbfo6GxJHkaLzr/VLgvZTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yWY4Qn/AncWMBA5E6UFXYOALsk9E+ny1HtSj0yxsxYo=;
 b=CObGpb4FfMct0lWrY8sDe7fv9PAit1ecqvUPQHrTZUQmqdBrCuB+m0ONurat/4HqUhSQeNH/CnAgvYUWyuqcRl//f2DJWAvgTEeGvCyO61rZoBIhzBQJBogUfjUBLU0zFcO/MsofvE0zH8499ylRv/BnwUICvTjO4DTmfxhwvAbytay24eDytViCUZpMDIuxVMn426NuTlCHVvkn7GeSbK6cimZ/U4uj84w5SVHBHsL+VgkcKly6MNVJpuYlhuroQ9V1u9XTRquMTGXqZk4HXCV1FYPYOSP9X0TrE29CshA12H90FxJfvc/MlYDL5aUqavRy/Qbd42HoWKFp+LVQTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yWY4Qn/AncWMBA5E6UFXYOALsk9E+ny1HtSj0yxsxYo=;
 b=vuPuo/ffMmpyTF6P470o3Rz+yR9lfnDDkL9Xi1Qz6DGad+qKAMHl8JIQ72w6asRLXwLJoiLnCr/pRYKRWmEByShyhUEmUs10i0s2p659np1kgLCK+cfYiqYahRXqHLnSZXBIle04ir+qrja6PWg//MPK0dWynTevCI83u+V9I4E=
Received: from DM5PR1201MB2554.namprd12.prod.outlook.com (2603:10b6:3:ec::14)
 by DM5PR1201MB0090.namprd12.prod.outlook.com (2603:10b6:4:53::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21; Thu, 27 Feb
 2020 18:39:52 +0000
Received: from DM5PR1201MB2554.namprd12.prod.outlook.com
 ([fe80::c4c:bafd:5833:2b51]) by DM5PR1201MB2554.namprd12.prod.outlook.com
 ([fe80::c4c:bafd:5833:2b51%5]) with mapi id 15.20.2750.024; Thu, 27 Feb 2020
 18:39:52 +0000
From: "Liu, Zhan" <Zhan.Liu@amd.com>
To: Melissa Wen <melissa.srw@gmail.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rodrigo
 Siqueira <rodrigosiqueiramelo@gmail.com>
Subject: RE: [PATCH 2/2] drm/amd/display: dc_link: code clean up on detect_dp
 function
Thread-Topic: [PATCH 2/2] drm/amd/display: dc_link: code clean up on detect_dp
 function
Thread-Index: AQHV7PFJrzsxO38xA0qqdJAhaAZqgqgvYCNQ
Date: Thu, 27 Feb 2020 18:39:51 +0000
Message-ID: <DM5PR1201MB25540271F42D8034FB2611829EEB0@DM5PR1201MB2554.namprd12.prod.outlook.com>
References: <cover.1582752490.git.melissa.srw@gmail.com>
 <9961afca2cf831ac688025a63b7cd35dd0908fac.1582752490.git.melissa.srw@gmail.com>
In-Reply-To: <9961afca2cf831ac688025a63b7cd35dd0908fac.1582752490.git.melissa.srw@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Zhan.Liu@amd.com; 
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1bb0ce8f-e298-4c0f-1df5-08d7bbb46e9f
x-ms-traffictypediagnostic: DM5PR1201MB0090:|DM5PR1201MB0090:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR1201MB0090B1A254FCE59E377D1B2B9EEB0@DM5PR1201MB0090.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 03264AEA72
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(396003)(39860400002)(376002)(136003)(189003)(199004)(33656002)(8676002)(7696005)(6506007)(53546011)(8936002)(26005)(71200400001)(186003)(81166006)(81156014)(86362001)(5660300002)(66476007)(66946007)(64756008)(478600001)(55016002)(54906003)(66446008)(9686003)(2906002)(76116006)(52536014)(316002)(4326008)(66556008)(110136005)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0090;
 H:DM5PR1201MB2554.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KueMbd/X8Fe42GD1GbuaHc2roumK0mGhXeroDmhabiA8Yf3frUn36qHCxUtW8BAFfnBm8LU834JFYlf+SQ60p/r2xvu/1C3adNc9m8BV/mmvkHvo+rRJQuCppBP29RnWkZyDRT/8m9v59OqPeCh5SLl678NN+UwTkfPrxEHn3bDLipxfERVu0xLSrPrHar0wEi6wzr2PenmOem/dAYAxjhtE4AvuYPtPHiFdLd0knLdf7J5J3dgi5HfCzGI6XzSUfwWkZMSVOmIHS5PK4G6XrAhgxeP6r8ZeTus4o+ZWJJ3WrzEWWoyMx+5YNZUdjCBdLAJVz7K/0OBrNUNjCIjD9fn2XfxqBKTecdGAInh8pR5tYR2YocQ8eQGS/ptUB0qKhHa4UaMfhFcnUIh9qKWiAzH8yoZ0Agp8KJJXfgg3WeluDuj36y8NuGgCNYzHNY21n9LOD6zqu+BkZc6QhKcv40oC/GcAxiGRztotcV/VjzF/SKpxV0dsgR4yquRw92qC
x-ms-exchange-antispam-messagedata: t0KnXG6PtfvPkTJrAaBEd82HRqI5qUoIOqXRSpYy7T1sGH7+KFNnJGtOWefipgpswaeLm8mdWd3q16koBsVxffgtnTt03uHkx6WzTfI75I4HVxX5YrQE2yW35Nt1Jha4tg7nAzRXKt1QvXU2DpWjbg==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bb0ce8f-e298-4c0f-1df5-08d7bbb46e9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2020 18:39:51.8954 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vbvX29cIn9n3J+/a/Xx2pFFtw1vzd/D2U/sBx7dThZ6YaiuE+ZyN4UKrFBCqiu+h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0090
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> -----Original Message-----
> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of
> Melissa Wen
> Sent: 2020/February/26, Wednesday 5:08 PM
> To: Wentland, Harry <Harry.Wentland@amd.com>; Li, Sun peng (Leo)
> <Sunpeng.Li@amd.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Zhou, David(ChunMing)
> <David1.Zhou@amd.com>; David Airlie <airlied@linux.ie>; Daniel Vetter
> <daniel@ffwll.ch>; Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; linux-
> kernel@vger.kernel.org
> Subject: [PATCH 2/2] drm/amd/display: dc_link: code clean up on detect_dp
> function
> 
> Removes codestyle issues on detect_dp function as suggested by
> checkpatch.pl.
> 
> CHECK: Lines should not end with a '('
> WARNING: Missing a blank line after declarations
> WARNING: line over 80 characters
> CHECK: Alignment should match open parenthesis
> 
> Signed-off-by: Melissa Wen <melissa.srw@gmail.com>

Thank you Melissa for your contribution! Will apply it.

This patch is:
Reviewed-by: Zhan Liu <zhan.liu@amd.com>

> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_link.c | 35 +++++++++----------
>  1 file changed, 16 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> index 0f28b5694144..adb717f02c9c 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> @@ -585,14 +585,14 @@ static void
> read_current_link_settings_on_detect(struct dc_link *link)
>  		LINK_SPREAD_05_DOWNSPREAD_30KHZ :
> LINK_SPREAD_DISABLED;  }
> 
> -static bool detect_dp(
> -	struct dc_link *link,
> -	struct display_sink_capability *sink_caps,
> -	bool *converter_disable_audio,
> -	struct audio_support *audio_support,
> -	enum dc_detect_reason reason)
> +static bool detect_dp(struct dc_link *link,
> +		      struct display_sink_capability *sink_caps,
> +		      bool *converter_disable_audio,
> +		      struct audio_support *audio_support,
> +		      enum dc_detect_reason reason)
>  {
>  	bool boot = false;
> +
>  	sink_caps->signal = link_detect_sink(link, reason);
>  	sink_caps->transaction_type =
>  		get_ddc_transaction_type(sink_caps->signal);
> @@ -606,9 +606,8 @@ static bool detect_dp(
>  			sink_caps->signal =
> SIGNAL_TYPE_DISPLAY_PORT_MST;
>  			link->type = dc_connection_mst_branch;
> 
> -			dal_ddc_service_set_transaction_type(
> -							link->ddc,
> -							sink_caps-
> >transaction_type);
> +			dal_ddc_service_set_transaction_type(link->ddc,
> +							     sink_caps-
> >transaction_type);
> 
>  			/*
>  			 * This call will initiate MST topology discovery.
> Which @@ -637,13 +636,10 @@ static bool detect_dp(
>  			if (reason == DETECT_REASON_BOOT)
>  				boot = true;
> 
> -			dm_helpers_dp_update_branch_info(
> -				link->ctx,
> -				link);
> +			dm_helpers_dp_update_branch_info(link->ctx, link);
> 
> -			if (!dm_helpers_dp_mst_start_top_mgr(
> -				link->ctx,
> -				link, boot)) {
> +			if (!dm_helpers_dp_mst_start_top_mgr(link->ctx,
> +							     link, boot)) {
>  				/* MST not supported */
>  				link->type = dc_connection_single;
>  				sink_caps->signal =
> SIGNAL_TYPE_DISPLAY_PORT; @@ -651,7 +647,7 @@ static bool detect_dp(
>  		}
> 
>  		if (link->type != dc_connection_mst_branch &&
> -			is_dp_active_dongle(link)) {
> +		    is_dp_active_dongle(link)) {
>  			/* DP active dongles */
>  			link->type = dc_connection_active_dongle;
>  			if (!link->dpcd_caps.sink_count.bits.SINK_COUNT)
> { @@ -662,14 +658,15 @@ static bool detect_dp(
>  				return true;
>  			}
> 
> -			if (link->dpcd_caps.dongle_type !=
> DISPLAY_DONGLE_DP_HDMI_CONVERTER)
> +			if (link->dpcd_caps.dongle_type !=
> +			    DISPLAY_DONGLE_DP_HDMI_CONVERTER)
>  				*converter_disable_audio = true;
>  		}
>  	} else {
>  		/* DP passive dongles */
>  		sink_caps->signal = dp_passive_dongle_detection(link->ddc,
> -				sink_caps,
> -				audio_support);
> +								sink_caps,
> +
> 	audio_support);
>  	}
> 
>  	return true;
> --
> 2.25.0
> 
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
