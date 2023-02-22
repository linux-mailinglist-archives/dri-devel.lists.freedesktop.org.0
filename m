Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9008969FCDE
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 21:13:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA6A10E22A;
	Wed, 22 Feb 2023 20:13:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A61F10E21D;
 Wed, 22 Feb 2023 20:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677096817; x=1708632817;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+mQuEzIwOH6syZI866sXbqnLLdQDokrmjbDbLMwiZrw=;
 b=SDGCLMeDeJNB3t+MFt5iDboYFxFbrb/iRGXUDRCdKDAcvazxMQ8qnPyA
 ovgyIpogm91RXRQqf3i6+3Gt9hAaKGjOrEBXsDUv3XL3e3B5TMMEze6o/
 sarYljV9Ujcir2/f8XsaCf+E/xN6udEjUzq4hzPKIAFwLrduMSJHdIVfe
 petue1ZuF4bqWsozSvDoqJMhS1P4k1T8/1YQVgcBld2cPsBsC2K4HsQD9
 2DxF2sZTJ4Io2TF8YfUEETMsyNOq1LPCIC6Vg8UNzWNs6N9mzFmhBkwLL
 6Wslk21vwqqwAnECzhG9MqNkSAOAofmNKF+vbH+UrvS6J1tPQG0yNFoWR Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="321174426"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; d="scan'208";a="321174426"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2023 12:13:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="649686927"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; d="scan'208";a="649686927"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 22 Feb 2023 12:13:35 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 22 Feb 2023 12:13:33 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 22 Feb 2023 12:13:33 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 22 Feb 2023 12:13:33 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 22 Feb 2023 12:13:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IzCzMwAuIwnsFL4dqxhLdk9e59AuM5Z7clYLcsSpJvP71IRPcjS9WqhL7D9A3UgRRV1vyk2/FGNNZR4AF9ISnr4pI5TvL+v0eL8nMpRy4CvEUxnhonKEIjwoC49214GXNPXVowcg2vjK2ghgjw+zmJfezmB7O0YhJOndhS1vIYbxkkMcncFMm0nkM01NOPA2EivbOhz694bneB3EuihBjUalYyxLgcmZ15gtUONeUiVGocrbjJG623IqWRcBopNjSPfhfx11BG7Rab5dWPw303enndjtu/frqWu5sz2XuBZas5mblSrIhN1ulr2tWNzfrwNDMD4P/arhKMuqdATazQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KsNN53pfPKfpugilCejF7HZYktP/+FMP4LNO7zoJjBw=;
 b=XTEngew9M1/oV7zr0FRn+3lNi8Yp/hQfDKBosbylQL9oYLmoVSt6zv2UGc2RdvUfk0QRxhK4wA9cYTIWybPSzjKILXMCUZ9I2kGHqUmzsRT+JeYjZTBD1YE65WtowInlLEjiP3M2r0Jv9S89k84RKYRqHM2m7EUNwZ+ZACKF4fDyPPfSxxcZyY5QAXypOeYTFOlETWgEVR0yLO4LIda573U/9D2BN8Tlu368JhLs1QaBj4QOP7PMc63ygi/U2LSHoCGFBFH42ub+UxDrHUFK6krCOAlCy/Sfn0sEbv/Jm6deOLrCDMyOCP4FSnf8PGpb6tjdmYzwNjRe7nQsymPg1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB5123.namprd11.prod.outlook.com (2603:10b6:303:94::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Wed, 22 Feb
 2023 20:13:30 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6111.020; Wed, 22 Feb 2023
 20:13:30 +0000
Date: Wed, 22 Feb 2023 15:13:24 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: [Intel-gfx] [PATCH 2/2] Apply quirk to disable PSR 2 on Tongfang
 PHxTxX1 and PHxTQx1
Message-ID: <Y/Z3ZJjYQIKb2LQ0@intel.com>
References: <20230222141755.1060162-1-wse@tuxedocomputers.com>
 <20230222141755.1060162-3-wse@tuxedocomputers.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230222141755.1060162-3-wse@tuxedocomputers.com>
X-ClientProxiedBy: SJ0PR13CA0119.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::34) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB5123:EE_
X-MS-Office365-Filtering-Correlation-Id: cd95df63-3d6b-4678-e4b5-08db15114401
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lTef+FFgxdWUUqU6Vr4Y0jSvjDhFZxNlYqsUkp62Hg3m3HlVP7KkyDO/Qm+GdVbqOUIxBNR/ZUE5iHocauTKAZqJJT+IEGvdcII2+IEK0o/4vPFUIxV+FQq0o3pED5bNSstMCggoEMSdHUlIojwNzlgl2b9hOpvwJg3sv4GwlutBpfWgQht8VYkOqItvPmxCz/Oryh4SiHAa2dAYLLc7H4SoTIHpWKUmUaq0hr56aPzbbQ15hTVEFbPxd7NG5neB89+b7y3IzVGprh89Nrafzibjn8gINRkUuXy727OXGRecAJDDOCUwN0nOCK6XxWCOxM16vllMX6T+VOMdGxpOpN82oiJWRj4NUGfq57agUg85EzA6Zr2S3NWsoZvehr3rQGU0SJSJgAMdls6eCzWvWKVAQK830s56JBkbGEdfBLVzwb/4LY41zk3NSlZqodxMPrERh0W7EU0ACKyl2XkrIuaswhabznEENWpwjGNJrdvijWnS6FhrjHGzT1K4ObgnOlCXDTIZu3OqQJ+W0LMVfEynreCgHHJ2Bm/v2peRRzlpcOhJ9NIUqYebzx2IymzTpg8ACQYj/oH53EwVX4QXiREAvcaMIT6+MwRzoJiRoaUekEj3q3re5IZvy/DR8aLZfO4jH45jZ25Vow6ffkqYHQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(6029001)(366004)(346002)(396003)(376002)(39860400002)(136003)(451199018)(36756003)(83380400001)(2616005)(316002)(6666004)(6486002)(478600001)(6512007)(26005)(7416002)(186003)(41300700001)(6506007)(44832011)(2906002)(86362001)(8936002)(5660300002)(38100700002)(8676002)(66946007)(66556008)(4326008)(82960400001)(66476007)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7eS7+D+lIZwJezEx1LGpJFJco5oMEnic4rvGkN3RyKMGrajlWUjBEGMteQkr?=
 =?us-ascii?Q?JueVlTSg0PPtRVe1fzXDp2H/dxkVP75v1Xdlh/IFT9hlMX9D8+lJngdZ7RG/?=
 =?us-ascii?Q?lAsnmrHplwp95LsAdc42t7QUVhASOHmCMen3cJGzili2f6Hp7bYkliZaaZeU?=
 =?us-ascii?Q?TrIsLv2A3FkzSfXuIhnNDB/QKijl2QOGLti+3xyThkxVE5VDZkqv1D44oDDZ?=
 =?us-ascii?Q?KSE/bYoK4nkkrWh2V6pMhO1bTomIxYpEuinPDONwtHm0PAgdIr2/9RQtR5Mb?=
 =?us-ascii?Q?wHZG8/JEBYflo/uzABYAYFC0oCK2DerSlU+oQN7DlcZY+qZ/4jMnXWII/80Y?=
 =?us-ascii?Q?fCRQMGJYSp55XDjYT09T5R01Zh2ldtzUwPoQgOPkSKRYdb6MQdV17zFuysi5?=
 =?us-ascii?Q?JdWAIS2ZoY3NoE7m9KL9IqXRAowHeLdNeEWIyzZ9hLopObCA+sYmV64HHen4?=
 =?us-ascii?Q?kyiHg0BZ4q8vdF+GNDRVvh9RTqKqlrPP9lt7/ENjDp9xOTCY1vMut4k/nu1y?=
 =?us-ascii?Q?nuv8ZMZL51nWhuJsluDQsZHzh95wdNExZHOlVOapi7yaoTHGAW4l8WZsY6Lh?=
 =?us-ascii?Q?C374UhiTZ43dLWY6Ddy2WzRutkkK/7X9TtnejfW5TRviBLbDM1pFTSqXaW/F?=
 =?us-ascii?Q?ykoVWDTLkepEoe4t3bL4iOybSMH3s3xHsUxUgIfxuEsUwyRMj8Amh725SbcL?=
 =?us-ascii?Q?6xhQtCLkizO4tVIn1yQD3gHsRGbWhiaROLbJrPohpOfV/Yb2qaBdgu5TEkEs?=
 =?us-ascii?Q?/55Sdvu9LR3xm1hKSQjdnAGgGZNGSRxBfWY+2K82fnMSjGYJNTTHm/Rq1rjD?=
 =?us-ascii?Q?WVL7wQIbwNBW8eQurp6v8KBp3qe+Rx25LCuStQmpcgKbVy9F3BQ/7/n52xEl?=
 =?us-ascii?Q?EAuCTJK+n0AHz37IZVN9fjnl+gjJ81Clg1b/2xNxYeCz+9Hpsvqep8GcuIl7?=
 =?us-ascii?Q?O7JFi/idL14ZKRCy40SZS4wfAwBytY4xudVNp91l9u2WIh95CZoZzksw985Y?=
 =?us-ascii?Q?vVinIwCrGaPB1Yf8YpA0bQ2YZcx9oHdYXQeh4i+QpkUriuUsmWu1qmhtFzd8?=
 =?us-ascii?Q?AjlGYHSoQpJ8DiMNiDIefeGnpEkXs4VM6i4eTkx3QZwM8ULiN3lRq4AjPA0+?=
 =?us-ascii?Q?gh+XkdLEb6XMwuSlXz/r7I+eaCw4O9qoKa8RxfUVoiTNj7EQJGgCqbgSRsgA?=
 =?us-ascii?Q?LNpZMUTYjPL0Ho2pzFh6/atuwEbzNtTaMZhgbx5l7EbBVck7R8Hj21Vbm1tB?=
 =?us-ascii?Q?sT83QUw8jbtWuwu/yA2SIXGcl9YHlwRzO+Hq5giXNILFRjSYn+f4OhS7smS4?=
 =?us-ascii?Q?QqnPso0Ar5clmOAC64aQpT4PmAbv2fNdgGsNUweZM1SK9dpEB/4Fl8XWZqrQ?=
 =?us-ascii?Q?4qrQZRRVgeq47djPQnOqTYfb3vHvNRTCn+T8AvhzB5fdoNwvNlqOsAbX/0+1?=
 =?us-ascii?Q?CTxJANyS+MXF90B3xuWrB+iMt1+dyUBygdvqAwcmuyKrDWxhjBvnTPzhjd4/?=
 =?us-ascii?Q?DaIV7ol9wQTxip3nW4oyDvyQ05tKdEgOiQuw/rzMW3HBlwIuUjPZrQqmoVUP?=
 =?us-ascii?Q?rEeRghHb3Jlqg5p9/+K3ObEPKl/dfJemzV/Xt4EFQ+6GvuYhqZzTvv+mEqrS?=
 =?us-ascii?Q?qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd95df63-3d6b-4678-e4b5-08db15114401
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 20:13:30.6422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I8C9OZ4lHNghSWcNIk/j5cxhBYO9BVHyZ4mozdZt6OJn12lDf3lqGqm6rJxBF6nTILz8JMwlBM+AltttwmjlgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5123
X-OriginatorOrg: intel.com
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
Cc: dri-devel@lists.freedesktop.org, tvrtko.ursulin@linux.intel.com,
 mika.kahola@intel.com, intel-gfx@lists.freedesktop.org,
 lucas.demarchi@intel.com, linux-kernel@vger.kernel.org, jose.souza@intel.com,
 Diego.SantaCruz@spinetix.com, jouni.hogander@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 22, 2023 at 03:17:55PM +0100, Werner Sembach wrote:
> On these Barebones PSR 2 is recognized as supported but is very buggy:
> - Upper third of screen does sometimes not updated, resulting in
> disappearing cursors or ghosts of already closed Windows saying behind.
> - Approximately 40 px from the bottom edge a 3 pixel wide strip of randomly
> colored pixels is flickering.
> 
> PSR 1 is working fine however.

I wonder if this is really about the panel's PSR2 or about the userspace
there not marking the dirtyfb? I know I know... it is not userspace fault...

But I wonder if the case you got here highlights the fact that we have
a substantial bug in the i915 itself in regards to PSR2 API.

Jose, Jouni, ideas on how to check what could be happening here?

oh, btw, Werner, do we have an  open gilab issue for this?

Thanks,
Rodrigo.

> 
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Cc: <stable@vger.kernel.org>
> ---
>  drivers/gpu/drm/i915/display/intel_quirks.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c b/drivers/gpu/drm/i915/display/intel_quirks.c
> index ce6d0fe6448f5..eeb32d3189f5c 100644
> --- a/drivers/gpu/drm/i915/display/intel_quirks.c
> +++ b/drivers/gpu/drm/i915/display/intel_quirks.c
> @@ -65,6 +65,10 @@ static void quirk_no_pps_backlight_power_hook(struct drm_i915_private *i915)
>  	drm_info(&i915->drm, "Applying no pps backlight power quirk\n");
>  }
>  
> +/*
> + * Tongfang PHxTxX1 and PHxTQx1 devices have support for PSR 2 but it is broken
> + * on Linux. PSR 1 however works just fine.
> + */
>  static void quirk_no_psr2(struct drm_i915_private *i915)
>  {
>  	intel_set_quirk(i915, QUIRK_NO_PSR2);
> @@ -205,6 +209,10 @@ static struct intel_quirk intel_quirks[] = {
>  	/* ECS Liva Q2 */
>  	{ 0x3185, 0x1019, 0xa94d, quirk_increase_ddi_disabled_time },
>  	{ 0x3184, 0x1019, 0xa94d, quirk_increase_ddi_disabled_time },
> +
> +	/* Tongfang PHxTxX1 and PHxTQx1/TUXEDO InfinityBook 14 Gen6 */
> +	{ 0x9a49, 0x1d05, 0x1105, quirk_no_psr2 },
> +	{ 0x9a49, 0x1d05, 0x114c, quirk_no_psr2 },
>  };
>  
>  void intel_init_quirks(struct drm_i915_private *i915)
> -- 
> 2.34.1
> 
