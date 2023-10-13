Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 657377C7ABE
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 02:11:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFA4610E187;
	Fri, 13 Oct 2023 00:11:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD06F10E187;
 Fri, 13 Oct 2023 00:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697155869; x=1728691869;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kmRtHITaPG9gvM/Wb1dOWdcoJb1WqSC9Pyt+0BuekV0=;
 b=V3oURwR8U43c1V0NeruFerWQEu4yBrFdtm6s50BQ/T2ss7rZBV6bFHW6
 xYaNcOuUngFUe7VzXs1Vs2HkRPJhvYK9v/fvp3YS90be0t36bIcejx9D+
 nmL+OLe5vs1QoLyg9S4yZZ1xxQB3HCwXUdBGSLGW/xZeLMZ6laaZXkknI
 fTMbksQjTxHgQ7E9QV9j14hQVt0jzsbt+hJ/AuOsahYUx1qhtCKHfESjb
 72dpnw753PfOgaXGL7EpJlW2L5OCcJBtvNWEG/V5HEjKdps7JmWdgFw00
 mV1d3CvjPBg4t/Bgl5hRmIfjJ/tzUGme8SlA/30hSqCWzOKjdMaFYopla g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="364434635"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="364434635"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 17:11:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="898338080"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="898338080"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Oct 2023 17:09:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 17:11:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 12 Oct 2023 17:11:08 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 12 Oct 2023 17:11:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KnXhtK6oe4sH71oM8bK2zovKC6FeD9lAsBYNlbOD565PqQP5+KiF8L9j48RgVyGjZguUJS4nHs1SGvcTNKELBxQfi4+ZqQcHeDaIOTxAVcIFYwCK+CNGZ1BHfrGIaCvEjWy6RVr/OYIwur8zz8B6cgHpj68DM5F5a8fZg4NphFgyZs+JtTsffo/D/GofrF+tx49kaBMxAa+s0Vj66HKZQAVMEQbIt/EAl6QFpfvpeEwUxfnHMlRGo1et8LIMBMObquukh4Vl4PD5IY7VO1f64Z2jf5IljBU+BfrhIU0dOBnhByRW80kNo0EF0Lz8LKE1I7eGnxJ/ZF3dvOIwl9nWVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dL28JDF1ZG22uYLEMze3LHrIxoubMDB8moJZOCqIPuE=;
 b=IUDf/T+dRE0RdWAUaoqCUSP9Ua3Vcpjf5fUpi3Xdw5OWHL5D3C6n+IpLbWEkoWABvZgVsevjMKxe6F1U1NG1nGHoyfhmoCoIZDu63tg+g651dVYApclA5vSoo4BGdR3uwH5tLfsFZnZwMxUxWq+g3cy0vk+BHAsXSuh5bWIdiMqDytqUBB7ZFiDU1IKm9mxhkLXMg9u1J0LekJvCvqELdMb9/SOx+8iR4J7H8UjkH1YEIYvZK9Vx0EoDlqHgoErvz/m5ljw06CZaJKY7pXd3SwMtaPiS0JcvaSNy57VZKpUyOh0kyLFDrmqcQWsoERxozAzvTxwO8PnSyE7dBVY1pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB3406.namprd11.prod.outlook.com (2603:10b6:805:bb::33)
 by DS0PR11MB7623.namprd11.prod.outlook.com (2603:10b6:8:142::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.44; Fri, 13 Oct
 2023 00:11:04 +0000
Received: from SN6PR11MB3406.namprd11.prod.outlook.com
 ([fe80::556:5d79:5416:c0d0]) by SN6PR11MB3406.namprd11.prod.outlook.com
 ([fe80::556:5d79:5416:c0d0%4]) with mapi id 15.20.6863.043; Fri, 13 Oct 2023
 00:11:04 +0000
Message-ID: <a52c075c-8d97-f826-2a76-852a594ecd6c@intel.com>
Date: Thu, 12 Oct 2023 17:11:01 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4] drm/i915/pxp: Add drm_dbgs for critical PXP events.
Content-Language: en-US
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230919180425.1517853-1-alan.previn.teres.alexis@intel.com>
From: "Balasubrawmanian, Vivaik" <vivaik.balasubrawmanian@intel.com>
In-Reply-To: <20230919180425.1517853-1-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::19) To SN6PR11MB3406.namprd11.prod.outlook.com
 (2603:10b6:805:bb::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB3406:EE_|DS0PR11MB7623:EE_
X-MS-Office365-Filtering-Correlation-Id: b8b8a293-c322-40d2-85f5-08dbcb80e361
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3wU0+4gDtnzOnK02/bWLiYLVBM73BKZT71hHUxWLwTT+m1uCb/n66oX7uF4A0MxDM06XbPyfBnJSoxzmmgvEatK4DlHl+l9Eto+/naQOZHuYmE96fmchzNsCfAtsRsG4bPCKZhHBQYAvHKiZfAEKz3tNgM1AKaZXpIMphux0Hto62MNit8XG1cuN2AgLw6UHliPLayfq4s60TXENtaxuVPb3sctAr9lRStVaSFlk/tA+6zZKtTv811qifQ5FdOpXg9GyVmiz2tR38UX+61FcFC33d1q88WS+xn/l+PsjdPz9t05Vj4+N3NhHVe8qb5br2oo8UCVAH3VYs0Hb4ZC44Napv7dFogo69JpjPiz1v2k+3iMR8zmbKWLtYmv4zp1cDM3YjQGoxyaWakAOLpuAwh7OMkROftQ+/X7HHEdzjXj2W9HG4UIfW4Ul1QH+XMGEaRSnzdKsDOZtVgfOrpCibq0cFprdBQQaz1XyviAdK4OLWTjDuDBCULJXQ88q7CAFwXcUH1DXHUBbOTHYnAaHZ/Mw4A8zshqtEbCH0Wwetg/6CzmMuDcMkFX820QK6fL5pThAfSKlNdzf8v4uf2CR+rKrwtAFXF2hmDvqwCvd2byuQ9g21W8MfnILbSBtf+JMIQoq+ztSHBnAkWhoK8QUsw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3406.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(346002)(376002)(396003)(366004)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(26005)(66946007)(6486002)(478600001)(53546011)(36756003)(6666004)(86362001)(31696002)(6506007)(6512007)(38100700002)(41300700001)(54906003)(316002)(66476007)(8936002)(2616005)(5660300002)(8676002)(2906002)(4326008)(66556008)(82960400001)(83380400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Um9YZzJSOWsxV2hWSDNNdnBvOTN2c2xCTzhwakVUdXN5VTJjdEM4MXRNUkda?=
 =?utf-8?B?TzJIbmxreEJrbHgveCs0U1RBcVcxZXFqNkNkaTJZM0tSR0pRRzUvRkVVNzNI?=
 =?utf-8?B?WlRUa3ZPbkorZXJuZW9sazBzeUlNd1FwT0orQWJtU1NydHo3VTZwL1ZJcG45?=
 =?utf-8?B?UkY0cVROTHJvazY1VVJUVUF0NlEyNzJSL2tlVmJuM2oyd084TmZTUkJFdHQ4?=
 =?utf-8?B?TFVCd2VGN3lkTEcyK0dZM1U1dm11T1duTHVBZnU2R3pYQjkzd0ZwZllscE84?=
 =?utf-8?B?cXlXelpUb1ptY1hBbWlDdnlENG1RSzRPa0h1MVVmRkRNNi82bDBmSkdLYXph?=
 =?utf-8?B?NGZBbktnREFKbEN6RE4rMG5MOHBhdHMySHg5czhvV3llMWU0YzhIVWVud1BM?=
 =?utf-8?B?UERmcFFEb0ltYkJlNjRKNWdpSmpmdEtOWnpvUU01SWFzMUVFYnl1ekdWNFU5?=
 =?utf-8?B?N1JDUG5MM3VZaFF1R1YzS2tCNXF5TTNseTY5N3l1QkZHT2kyeTN5aDJmTzE0?=
 =?utf-8?B?MytVM01uNGx5N3ZFSkcyb0xMN1pOd0VDN2tLTWdEUzZoaUF3QVE3czhmWHVT?=
 =?utf-8?B?T3EzZmdRK2VqSlAvNmNvQTI0SXl1RU9RUlEzeUxzMTN2ODN1VFVDNzZPeWdY?=
 =?utf-8?B?NHhmNlI3ODVtV3NPMVVsVTRIYkg4eDdmOEUvU3QzNjVNbFNTMkQ2OEpvNFI1?=
 =?utf-8?B?ZzZ2SEpOSUdnNUtSSExQWStTdThodVFxUTNnTUN1NkExOUFSVTVHVEJpVDVT?=
 =?utf-8?B?UmRsQnA4c1AwQUxNMU9TMVVoNW1KMGlvYTU3dXlHeEFZeHVDSEJsekFqM1Mx?=
 =?utf-8?B?WEE2STZoTzB0blVhYi8rVFJrRUc3N090eUhRSzI4TlVibzJtRVNST25JNlZX?=
 =?utf-8?B?UnRjaUtJV2o4ZTJuQURvRTd5VktUNCtwU01nMngzRDhKQlpsazhCc21qQlds?=
 =?utf-8?B?c3o3SUhMYm5IRmlGU2VYVnc0Z3p3RGhxQjVtRXFWbVhDeWZuakpUNGhNYWo4?=
 =?utf-8?B?NHhwbjFwSEJDUUVwUmVxcWxTNmR1TmtJSVZwNm5nUkg5SHdjanFyd25NYjYr?=
 =?utf-8?B?TTdVNUJka3YyNnBJcmNiTllPeFAwT1BZdUpmYUV3SysyT1lWWDc0SGUzZHUx?=
 =?utf-8?B?VXJTb0tkR0VnYWIzTzZXbmVYMi91S2ZXVTZsL04wcE1uMVQwNXNuU0RWWkxZ?=
 =?utf-8?B?L0ZDb2crb3pYY2MyRFk2ZWF3YUJFSnZNYjh5czdVc3NOZFFHWVJZSTJ3Mzhi?=
 =?utf-8?B?SGNsZEdGZ21KZDFUQUtCUnZ1OVhraEhGWjIxazBvRWFLbHhFQ0Z5YzRhNkVO?=
 =?utf-8?B?VXM5MXU5ckNrc2JRT0NwcXl5SVpCSUdyUUNDWjkzSmp2V2NoT3lGUzlpN3JZ?=
 =?utf-8?B?aHFubWdacXVaOE1YdytpVnQ4L2lBMUdpUWZnT3FkRm5CTFRaaHRKWUlsL2dW?=
 =?utf-8?B?VVllYmN2WjlFSWU3S0FyRk9HMHZoWGhLbndNZ0IycHZDTEZ5d0JuUldHVmRO?=
 =?utf-8?B?UWZSZ2QxNHZ4Um9JWmNwUE41UGw3R3ZIS3VoS1BzTk1MTkMwMTlVdFBBRm8y?=
 =?utf-8?B?Vmw2T0tMaUNtSVViT0F4dGNtZWhCSjR1WXNielpkZ3QrYXpOblhxK3ppazR1?=
 =?utf-8?B?U0FPb1dkbnY0Sk9weDVBUWZEd21FSnA4S3JXcnFpL1o0SnoyR3JoLzFTV0tl?=
 =?utf-8?B?QlU2WDVmc2xyd2ZGVlZ3UlFiUzFFOXYwVGZvbjNsSWZuaEZvajlud3lqRUNp?=
 =?utf-8?B?TDNIcWpxNlBUMGl1TzQ3a1Fld0tjNWZ3UmVnSHg3L3BYbXpqOHNCZDZFcW4v?=
 =?utf-8?B?cEQ1azlYa3Z2NGp0alpBR0toenZuNXA2UjhOaVgySHphbWVSTSsrQWRMQWE4?=
 =?utf-8?B?R1ZoTGFVS2N0d0NKOXBSZjdRTDgvUW5IcEtnZGYxSldhVlN5N3hBNk1Dc3dk?=
 =?utf-8?B?Vk80dklybDV1dWFzeWd1WnpkMi9tdFhEZDhPTWhuMFROVU5ySzUrUkFUK0xx?=
 =?utf-8?B?ZTZ4ZSs5RXRFMmQ2SFIyVHZmZjl6aEZlZys3bEtaWklnb0RZd2diWnphQ0Fw?=
 =?utf-8?B?ZXJxeVBHZEZZNGRWengrUVVWUXVzNGYrNGRoaE52TXZIazFCdHh2emhMajhs?=
 =?utf-8?B?YytDZVdhei8vZjRieUtBV0JFZkY2MDlVVWlxd0kwbTUyL2lNcEFJVWg1WWFY?=
 =?utf-8?Q?kTFZsoxDwhNXC/IFW3lIriA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b8b8a293-c322-40d2-85f5-08dbcb80e361
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3406.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 00:11:04.1901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q4/mBKWzESxgc3uCtkJQ5M/AKp0BWFnS6PaWiOCmAQqAUAZVxefc+6esumFzypswHKq3iXGIo4JVMMoAHy+BR6Hnb9tMOM15DVWE/t0m8CQxf1SjKMLV5dHhUIc+f5la
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7623
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
Cc: John Harrison <john.c.harrison@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/19/2023 11:04 AM, Alan Previn wrote:
> Debugging PXP issues can't even begin without understanding precedding
> sequence of important events. Add drm_dbg into the most important PXP
> events.
>
>   v3 : - move gt_dbg to after mutex block in function
>          i915_gsc_proxy_component_bind. (Vivaik)
>   v2 : - remove __func__ since drm_dbg covers that (Jani).
>        - add timeout dbg of the restart from front-end (Alan).
>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> Reviewed-by: Vivaik Balasubrawmanian <vivaik.balasubrawmanian@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c |  2 ++
>   drivers/gpu/drm/i915/pxp/intel_pxp.c         | 15 ++++++++++++---
>   drivers/gpu/drm/i915/pxp/intel_pxp_irq.c     |  5 +++--
>   drivers/gpu/drm/i915/pxp/intel_pxp_session.c |  6 +++++-
>   drivers/gpu/drm/i915/pxp/intel_pxp_types.h   |  1 +
>   5 files changed, 23 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c
> index 5f138de3c14f..40817ebcca71 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c
> @@ -322,6 +322,7 @@ static int i915_gsc_proxy_component_bind(struct device *i915_kdev,
>   	gsc->proxy.component = data;
>   	gsc->proxy.component->mei_dev = mei_kdev;
>   	mutex_unlock(&gsc->proxy.mutex);
> +	gt_dbg(gt, "GSC proxy mei component bound\n");
>   
>   	return 0;
>   }
> @@ -342,6 +343,7 @@ static void i915_gsc_proxy_component_unbind(struct device *i915_kdev,
>   	with_intel_runtime_pm(&i915->runtime_pm, wakeref)
>   		intel_uncore_rmw(gt->uncore, HECI_H_CSR(MTL_GSC_HECI2_BASE),
>   				 HECI_H_CSR_IE | HECI_H_CSR_RST, 0);
> +	gt_dbg(gt, "GSC proxy mei component unbound\n");
>   }
>   
>   static const struct component_ops i915_gsc_proxy_component_ops = {
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> index dc327cf40b5a..e11f562b1876 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> @@ -303,6 +303,8 @@ static int __pxp_global_teardown_final(struct intel_pxp *pxp)
>   
>   	if (!pxp->arb_is_valid)
>   		return 0;
> +
> +	drm_dbg(&pxp->ctrl_gt->i915->drm, "PXP: teardown for suspend/fini");
>   	/*
>   	 * To ensure synchronous and coherent session teardown completion
>   	 * in response to suspend or shutdown triggers, don't use a worker.
> @@ -324,6 +326,8 @@ static int __pxp_global_teardown_restart(struct intel_pxp *pxp)
>   
>   	if (pxp->arb_is_valid)
>   		return 0;
> +
> +	drm_dbg(&pxp->ctrl_gt->i915->drm, "PXP: teardown for restart");
>   	/*
>   	 * The arb-session is currently inactive and we are doing a reset and restart
>   	 * due to a runtime event. Use the worker that was designed for this.
> @@ -332,8 +336,11 @@ static int __pxp_global_teardown_restart(struct intel_pxp *pxp)
>   
>   	timeout = intel_pxp_get_backend_timeout_ms(pxp);
>   
> -	if (!wait_for_completion_timeout(&pxp->termination, msecs_to_jiffies(timeout)))
> +	if (!wait_for_completion_timeout(&pxp->termination, msecs_to_jiffies(timeout))) {
> +		drm_dbg(&pxp->ctrl_gt->i915->drm, "PXP: restart backend timed out (%d ms)",
> +			timeout);
>   		return -ETIMEDOUT;
> +	}
>   
>   	return 0;
>   }
> @@ -414,10 +421,12 @@ int intel_pxp_start(struct intel_pxp *pxp)
>   	int ret = 0;
>   
>   	ret = intel_pxp_get_readiness_status(pxp, PXP_READINESS_TIMEOUT);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		drm_dbg(&pxp->ctrl_gt->i915->drm, "PXP: tried but not-avail (%d)", ret);
>   		return ret;
> -	else if (ret > 1)
> +	} else if (ret > 1) {
>   		return -EIO; /* per UAPI spec, user may retry later */
> +	}
>   
>   	mutex_lock(&pxp->arb_mutex);
>   
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
> index 91e9622c07d0..d81750b9bdda 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
> @@ -40,11 +40,12 @@ void intel_pxp_irq_handler(struct intel_pxp *pxp, u16 iir)
>   		   GEN12_DISPLAY_APP_TERMINATED_PER_FW_REQ_INTERRUPT)) {
>   		/* immediately mark PXP as inactive on termination */
>   		intel_pxp_mark_termination_in_progress(pxp);
> -		pxp->session_events |= PXP_TERMINATION_REQUEST | PXP_INVAL_REQUIRED;
> +		pxp->session_events |= PXP_TERMINATION_REQUEST | PXP_INVAL_REQUIRED |
> +				       PXP_EVENT_TYPE_IRQ;
>   	}
>   
>   	if (iir & GEN12_DISPLAY_STATE_RESET_COMPLETE_INTERRUPT)
> -		pxp->session_events |= PXP_TERMINATION_COMPLETE;
> +		pxp->session_events |= PXP_TERMINATION_COMPLETE | PXP_EVENT_TYPE_IRQ;
>   
>   	if (pxp->session_events)
>   		queue_work(system_unbound_wq, &pxp->session_work);
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> index 0a3e66b0265e..091c86e03d1a 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> @@ -137,8 +137,10 @@ void intel_pxp_terminate(struct intel_pxp *pxp, bool post_invalidation_needs_res
>   static void pxp_terminate_complete(struct intel_pxp *pxp)
>   {
>   	/* Re-create the arb session after teardown handle complete */
> -	if (fetch_and_zero(&pxp->hw_state_invalidated))
> +	if (fetch_and_zero(&pxp->hw_state_invalidated)) {
> +		drm_dbg(&pxp->ctrl_gt->i915->drm, "PXP: creating arb_session after invalidation");
>   		pxp_create_arb_session(pxp);
> +	}
>   
>   	complete_all(&pxp->termination);
>   }
> @@ -157,6 +159,8 @@ static void pxp_session_work(struct work_struct *work)
>   	if (!events)
>   		return;
>   
> +	drm_dbg(&gt->i915->drm, "PXP: processing event-flags 0x%08x", events);
> +
>   	if (events & PXP_INVAL_REQUIRED)
>   		intel_pxp_invalidate(pxp);
>   
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> index 7e11fa8034b2..07864b584cf4 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> @@ -124,6 +124,7 @@ struct intel_pxp {
>   #define PXP_TERMINATION_REQUEST  BIT(0)
>   #define PXP_TERMINATION_COMPLETE BIT(1)
>   #define PXP_INVAL_REQUIRED       BIT(2)
> +#define PXP_EVENT_TYPE_IRQ       BIT(3)
>   };
>   
>   #endif /* __INTEL_PXP_TYPES_H__ */
>
> base-commit: 61b71c3f061a44a6ab1dcf756918886aa03a5480

sending RB again in a separate line:

Reviewed-by: Vivaik Balasubrawmanian<vivaik.balasubrawmanian@intel.com>

