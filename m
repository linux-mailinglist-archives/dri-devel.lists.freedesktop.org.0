Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 730215B7C34
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 22:28:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8A1E10E064;
	Tue, 13 Sep 2022 20:28:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7384B10E064;
 Tue, 13 Sep 2022 20:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663100915; x=1694636915;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7RkYla0+KYJ53Mn3OmXooudr+AEkExQTHsJlTV1ATl4=;
 b=aQ+Hh+PhdsxAbf5I9ueSyCwsf1C2mzuw4ii5agjO8kfX8KfgBfYTFHlK
 MCBJy+ulSG3zK1HvXnKSNsVYJ6sePvmVgZU4xj5LpSjuHq9R9/eSV3/4S
 Uy91SkYvpuAOiK3sTWJ56ovB6Z3IjXr6BG5dLc25KuKWyixHE7trA8DT3
 bCHBJJjABKhN9TbhkDmProrYpqLtIIliXidkUoOeN1cDIZK7kD4KrtagX
 qxxKGBOOvWruhoD/snWaX1f7eGcT1THewRUdMEAPnLWTI86YXCMaqSsal
 bo1a2JYN8/nGHLv3jeQyswknYaSN9yNvQTUelrBhrxXicY+SobvcVbX5g Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10469"; a="295837027"
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; d="scan'208";a="295837027"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 13:28:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; d="scan'208";a="678729134"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 13 Sep 2022 13:28:33 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 13 Sep 2022 13:28:25 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 13 Sep 2022 13:28:24 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 13 Sep 2022 13:28:24 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 13 Sep 2022 13:28:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BIi0XqYkWi7Ms3k3+cpSqdeTxVFfxFCFgMFk6A+lU2lMVW2Ozu8z/EFPXNGTgI92IWODc1ER+qnXV8NIXOG4zEcAsKIRAnTLTmfCgTs9ch5rxOX4epuU6eWE2U2ys9hL11SeMl+/gShdor346zYlDEge6Vhc3eAgd2yAaX1lIhR6e6k93OnzkTnUN1hdYxpCFQX34iM+mKdHfKsKFk8ncmBKAOM0r3rJZOHaKHNTea320bdTf6Rp35IrivTPKGilyPin48EJMuCa5vayxWTBQJmNYyO9B929i3WymvNuGPGiwdO2nlSHG1RklY+BtCszCCDW8KpbojKAb2eOaNOqHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=61lGL7veh/0bwJTgov3ShVyzyusPk4bFqHl7/+2eyDY=;
 b=TiIWijPLot1KaYjRGeXOsRSwC3wV1JCICSyNRzx5Dqe0r2dAjVuPkA+FM6ScfWRcpeYBx1ik037NHHyxtvR2TkSVMKjx5ldgWse3O00IZr5EA+MTwgdrSVd+YcRkCA6qiO5LeSm4PsTnC3IUViuBtgbDoV3Z1l4EuLRiRJSrmKcI6h+YklrI490JSv2AlOqpyGP/uAaIqCS2tuRuMz8g8UK1l8Tu6uE+OsYKGHmUmr/cTurSDKrRog7MvtEhWfY3pDTEz0ZikPxWJ8hYgag4X1NmTBUxb5jdg7/2rKwamJ7Z7yVYr+0SxmmeZYR/xyoLS/Z5XhtUkuswwXXkH5eIAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Tue, 13 Sep
 2022 20:28:17 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514%12]) with mapi id 15.20.5612.022; Tue, 13 Sep
 2022 20:28:17 +0000
Date: Tue, 13 Sep 2022 13:28:14 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Subject: Re: [PATCH v5 4/5] drm/i915/mtl: Update MBUS_DBOX credits
Message-ID: <YyDn3jDayAu0lp7d@mdroper-desk1.amr.corp.intel.com>
References: <20220913183341.908028-1-radhakrishna.sripada@intel.com>
 <20220913183341.908028-5-radhakrishna.sripada@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220913183341.908028-5-radhakrishna.sripada@intel.com>
X-ClientProxiedBy: SJ0PR03CA0350.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::25) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|DS0PR11MB7264:EE_
X-MS-Office365-Filtering-Correlation-Id: 50ce3b63-caf8-4312-f08a-08da95c67dc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h0p4bFeAXlw+UTV+Dn2GPErXDoTeoket8Kw4La0J5JrD/V6RDy183Nkdfp36BC/98Ejg6rHZjGvkb4wTj0L26ZGn8eR3GPeQjsXzXnvnTgjI6tT6eZmHjWV8fQ8w7LJXpjplJQGG47aLOJ16vxJtGgawO3pPpWWXW4OwewncAGB9n3oFJuQ+B6p8kW0L9ugx66Z2f94wZ0nDbd2csdcQu7RD63p3luEiP0jdgtydpmo+oejudAs3Z939t/tZCf5HhW7tQpGEMmBuSBAI1OzbFFU+e4N34zTZdWPu3pVz/hM+t+zHj/3oZddTskWS9yvBv7ompImbRL1GkCrvSvbF8TV+ULcdOoZwt/cyHKPu9ua9k+UIlXLMxUfCSfAmjFmahsb6WDu9nZ5EYktbplf0k3muJBXOdVrL96ExqWrqaNjlk9NZT+Cu5pLjkdVc6tUgu8IX8a2v1rb93XBShPuV/A7IaPiGStYleMl1yIX6tA5/ERaNgf4HQqvdcI5dTyO5zVAfH7c2///UnSGjeRqOXKlg5Ys2nFciFxvy0ED8DHzFR76EHt3sdc8r6zV8Hbr6Nmw+oJLIElhN11R0OMw7gwW4dMElShKtK53evgpaRb3fXDk1a/ZW4MCPro6nhsf2b7qDLWjoNxrPzGIiIlJFXez4laXk12411LZ+b2Ea8/u8ZpJbX/t2DCX4i5g+8o0qyucrNv8PNlEW7e/4aB+ZXQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(39860400002)(346002)(136003)(376002)(366004)(451199015)(6862004)(316002)(66556008)(2906002)(4326008)(66476007)(66946007)(26005)(8676002)(15650500001)(6486002)(186003)(6506007)(82960400001)(6512007)(6636002)(450100002)(6666004)(41300700001)(83380400001)(86362001)(8936002)(38100700002)(478600001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?7JmyX/OhWRzc2gvCOc+VlZ1jpHAcFLUup4H3FM00p7JBJb4GHVi1SxqdBx?=
 =?iso-8859-1?Q?U8BBOKwFPR2k2dDcI19XNup0f/ylzoUwFSHpsRX4U8yDx8H951OF6BJDIq?=
 =?iso-8859-1?Q?2HJ91nrxx7RHKB3BXXe8UE6SuUah2sqmBO+m8/9GeXy3kmkREAgl45Wbhw?=
 =?iso-8859-1?Q?X0aNMrzZ1cdYnW/lPTSIszHEQX6oOQ8+A5xZ3YsTveEs8xzW3Zudtvjwc/?=
 =?iso-8859-1?Q?NnjVkMiM0xsKM6jp1CrNr6rcNzETTbH8sTGMv+Icfu5IatgbGRzot7TPta?=
 =?iso-8859-1?Q?eaqqme9orXHEQ6J2KiNr0w4+g3EZ/bNpUTQBQIB8iciQ+b1MBRZx0tqShC?=
 =?iso-8859-1?Q?HvaD3pclDygd4zB9ZufzQpXTdNxDWqTIRwSgguXxUyeNZfKRG0ZIQB6DUi?=
 =?iso-8859-1?Q?AEBRtqqqRbJ6RKz0C3Gmtk25yTDat9j4aJWOzZHlU5P75U8jRZw0+/xgK4?=
 =?iso-8859-1?Q?cznyJSISvgnMfkANXBGTHX8t0oPRkfZbtCnKJ7oapwxpqKrQMDavX5GVze?=
 =?iso-8859-1?Q?TOdyS8LQUEZ4e1ATbz3NLRipNOSM3OBl3rvvZYHPGS+ThCelBBBeoUCNUW?=
 =?iso-8859-1?Q?JDnUn5BmCWy/8Wlw1Q3ngqfDthxBlTeI9qUlHdjPxxfaqGufhU+5Eiv531?=
 =?iso-8859-1?Q?7ncENxLYm9qk67GCqIUjnVNhXxJDw5MrxVFFcHmh/g3gt2cJ8Rs0QYY4et?=
 =?iso-8859-1?Q?U0xZCwkzOh72dqwFOjwK8v+s57R4DQwEivVORmjDSBmIplyETZ7/5epOu5?=
 =?iso-8859-1?Q?w30fG0JO/FQCn9oFKlOejrw1qnQNfChhjFpK8/9X9YY7N6UXH22wGEcQ1P?=
 =?iso-8859-1?Q?+MsOS/Qqzx9QB2jtDKkzBrm1Uum3wYFy3J1gxiyTNBocPpwq4dENhq2nop?=
 =?iso-8859-1?Q?eUJFrzJfY8HhoOD7g8C5tDj3iNSdNO3Aj8dxAYbvnKfjNdU+kYSB6rcIbY?=
 =?iso-8859-1?Q?MbMYnPmxEyFqyoHfyVAHmInGaXJf0ohRbQqphOs1DYmaltkYltguyZGdEQ?=
 =?iso-8859-1?Q?rI4B6REE2UVqZJzC6GX3pXpVMDrrcaV8PJxI7KGZ1JlmuxX4yeNdaoze12?=
 =?iso-8859-1?Q?+/AgGY3s7wy3BNJaV/Bj8LAn1sfOWPZGTI6za4ZGXx1hmUavakX62+q+JP?=
 =?iso-8859-1?Q?GViFDFKSEc/KthrbodA177hlxutti2tujzVWVyrXRfdpfj5bAhMaeA34jF?=
 =?iso-8859-1?Q?h2ymKBtqE92/ttFDSrA9YOY87uKt/M781ujX/+hviPTePrE964ZA87uDrs?=
 =?iso-8859-1?Q?LAoSk4fAwscuYiY71kuSrcpZtYdkxdq4sN1Rmt5n0sK7G3f2OKnm6hVm38?=
 =?iso-8859-1?Q?90VRPJFrrOfwRR/F+Mwt4vWyKzvYy6+3cc0jGt+1/0PV42iWjLIsgeCnUj?=
 =?iso-8859-1?Q?F/BMW+2Sfc9gVTN1Q3q7Y38crQjDGb67spVTPMf6fm87r0PYJV8yTy/fqy?=
 =?iso-8859-1?Q?RDD18m213iBZiZYAFYTX8ipLzqLyuY8a56ZddHThfSjVCkwKlR1WXzwqPn?=
 =?iso-8859-1?Q?FCB89AxYO5/Fzm5RNjmnvQDpxvmZDVlYGKpPtj0Nez9/ouDAZWH12tuD1x?=
 =?iso-8859-1?Q?U1i+2VGhqDrbPvOrSQoQsRC2qQl9ngbd959FeXQOJIDQrdpy956HnvfQg/?=
 =?iso-8859-1?Q?rUOjeDUSjHJAw/BEGJYHgeiR99xGN4ufOer8Uro96QJ8+iNMK8Xf/EQA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50ce3b63-caf8-4312-f08a-08da95c67dc4
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 20:28:17.4186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wIydVY1tKZgZ2IMb7jL3joh/5FZIseX2bcb1t+oFLaj4i7Al+Zxt4nto5Z/asl6XiP2qpNSeerMpyki3UQztx0Fd7j5B2uPlBvrQkk+XE1Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7264
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 13, 2022 at 11:33:40AM -0700, Radhakrishna Sripada wrote:
> Display version 14 platforms have different credits values
> compared to ADL-P. Update the credits based on pipe usage.
> 
> v2: Simplify DBOX BW Credit definition(MattR)
> v3:
>  - Simplify only pipe per dbuf bank check(MattR)
>  - Skip modeset check to ahndle the case when a new pipe within

s/ahndle/handle/

Otherwise,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

>    dbuf bank gets added/removed.(MattR)
> 
> Bspec: 49213
> 
> Cc: Jose Roberto de Souza <jose.souza@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Original Author: Caz Yokoyama
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> ---
>  drivers/gpu/drm/i915/display/skl_watermark.c | 48 +++++++++++++++++---
>  drivers/gpu/drm/i915/i915_reg.h              |  4 ++
>  2 files changed, 46 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/drm/i915/display/skl_watermark.c
> index 617a1f2d01ea..01b0932757ed 100644
> --- a/drivers/gpu/drm/i915/display/skl_watermark.c
> +++ b/drivers/gpu/drm/i915/display/skl_watermark.c
> @@ -3412,6 +3412,25 @@ void intel_dbuf_post_plane_update(struct intel_atomic_state *state)
>  				new_dbuf_state->enabled_slices);
>  }
>  
> +static bool xelpdp_is_only_pipe_per_dbuf_bank(enum pipe pipe, u8 active_pipes)
> +{
> +	switch (pipe) {
> +	case PIPE_A:
> +		return !(active_pipes & BIT(PIPE_D));
> +	case PIPE_D:
> +		return !(active_pipes & BIT(PIPE_A));
> +	case PIPE_B:
> +		return !(active_pipes & BIT(PIPE_C));
> +	case PIPE_C:
> +		return !(active_pipes & BIT(PIPE_B));
> +	default: /* to suppress compiler warning */
> +		MISSING_CASE(pipe);
> +		break;
> +	}
> +
> +	return false;
> +}
> +
>  void intel_mbus_dbox_update(struct intel_atomic_state *state)
>  {
>  	struct drm_i915_private *i915 = to_i915(state->base.dev);
> @@ -3431,20 +3450,28 @@ void intel_mbus_dbox_update(struct intel_atomic_state *state)
>  	     new_dbuf_state->active_pipes == old_dbuf_state->active_pipes))
>  		return;
>  
> +	if (DISPLAY_VER(i915) >= 14)
> +		val |= MBUS_DBOX_I_CREDIT(2);
> +
>  	if (DISPLAY_VER(i915) >= 12) {
>  		val |= MBUS_DBOX_B2B_TRANSACTIONS_MAX(16);
>  		val |= MBUS_DBOX_B2B_TRANSACTIONS_DELAY(1);
>  		val |= MBUS_DBOX_REGULATE_B2B_TRANSACTIONS_EN;
>  	}
>  
> -	/* Wa_22010947358:adl-p */
> -	if (IS_ALDERLAKE_P(i915))
> +	if (DISPLAY_VER(i915) >= 14)
> +		val |= new_dbuf_state->joined_mbus ? MBUS_DBOX_A_CREDIT(12) :
> +						     MBUS_DBOX_A_CREDIT(8);
> +	else if (IS_ALDERLAKE_P(i915))
> +		/* Wa_22010947358:adl-p */
>  		val |= new_dbuf_state->joined_mbus ? MBUS_DBOX_A_CREDIT(6) :
>  						     MBUS_DBOX_A_CREDIT(4);
>  	else
>  		val |= MBUS_DBOX_A_CREDIT(2);
>  
> -	if (IS_ALDERLAKE_P(i915)) {
> +	if (DISPLAY_VER(i915) >= 14) {
> +		val |= MBUS_DBOX_B_CREDIT(0xA);
> +	} else if (IS_ALDERLAKE_P(i915)) {
>  		val |= MBUS_DBOX_BW_CREDIT(2);
>  		val |= MBUS_DBOX_B_CREDIT(8);
>  	} else if (DISPLAY_VER(i915) >= 12) {
> @@ -3456,11 +3483,20 @@ void intel_mbus_dbox_update(struct intel_atomic_state *state)
>  	}
>  
>  	for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i) {
> -		if (!new_crtc_state->hw.active ||
> -		    !intel_crtc_needs_modeset(new_crtc_state))
> +		u32 pipe_val = val;
> +
> +		if (!new_crtc_state->hw.active)
>  			continue;
>  
> -		intel_de_write(i915, PIPE_MBUS_DBOX_CTL(crtc->pipe), val);
> +		if (DISPLAY_VER(i915) >= 14) {
> +			if (xelpdp_is_only_pipe_per_dbuf_bank(crtc->pipe,
> +							      new_dbuf_state->active_pipes))
> +				pipe_val |= MBUS_DBOX_BW_8CREDITS_MTL;
> +			else
> +				pipe_val |= MBUS_DBOX_BW_4CREDITS_MTL;
> +		}
> +
> +		intel_de_write(i915, PIPE_MBUS_DBOX_CTL(crtc->pipe), pipe_val);
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 0ab5fe70b482..fc57f304c16e 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -1125,8 +1125,12 @@
>  #define MBUS_DBOX_REGULATE_B2B_TRANSACTIONS_EN	REG_BIT(16) /* tgl+ */
>  #define MBUS_DBOX_BW_CREDIT_MASK		REG_GENMASK(15, 14)
>  #define MBUS_DBOX_BW_CREDIT(x)			REG_FIELD_PREP(MBUS_DBOX_BW_CREDIT_MASK, x)
> +#define MBUS_DBOX_BW_4CREDITS_MTL		REG_FIELD_PREP(MBUS_DBOX_BW_CREDIT_MASK, 0x2)
> +#define MBUS_DBOX_BW_8CREDITS_MTL		REG_FIELD_PREP(MBUS_DBOX_BW_CREDIT_MASK, 0x3)
>  #define MBUS_DBOX_B_CREDIT_MASK			REG_GENMASK(12, 8)
>  #define MBUS_DBOX_B_CREDIT(x)			REG_FIELD_PREP(MBUS_DBOX_B_CREDIT_MASK, x)
> +#define MBUS_DBOX_I_CREDIT_MASK			REG_GENMASK(7, 5)
> +#define MBUS_DBOX_I_CREDIT(x)			REG_FIELD_PREP(MBUS_DBOX_I_CREDIT_MASK, x)
>  #define MBUS_DBOX_A_CREDIT_MASK			REG_GENMASK(3, 0)
>  #define MBUS_DBOX_A_CREDIT(x)			REG_FIELD_PREP(MBUS_DBOX_A_CREDIT_MASK, x)
>  
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
